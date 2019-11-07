Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F370F3ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfKGVuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:50:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:60008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKGVuR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:50:17 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6CAD2084C;
        Thu,  7 Nov 2019 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163416;
        bh=dQBsw2ArHeU9P5i+qeiGoYYR+Emw9AMMubPkQDQF/9M=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=rlcb/o2bGAyTstqOc1tYklXzadJiwjesyc7BQpbPEFlIvWsFd/hyNcBoAaq+gcTbd
         vzCkdGVt8kOvP3wx6WyAsZD/jKEwlhlyxHfMa757m8mhFDGuRlu57H1sa19kY5kwlA
         rjf0BBR1+r5zcNIObkMsm/FyNzrghQsL5IPWnsW4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1569959828-8357-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org> <1569959828-8357-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v6 3/6] clk: qcom: smd: Add XO clock for MSM8998
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:50:15 -0800
Message-Id: <20191107215016.A6CAD2084C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-01 12:57:08)
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm899=
8.c
> index 091acd59c1d6..1651a2f47ab8 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2971,14 +2957,23 @@ static const struct qcom_cc_desc gcc_msm8998_desc=
 =3D {
>         .num_resets =3D ARRAY_SIZE(gcc_msm8998_resets),
>         .gdscs =3D gcc_msm8998_gdscs,
>         .num_gdscs =3D ARRAY_SIZE(gcc_msm8998_gdscs),
> -       .clk_hws =3D gcc_msm8998_hws,
> -       .num_clk_hws =3D ARRAY_SIZE(gcc_msm8998_hws),
>  };
> =20
>  static int gcc_msm8998_probe(struct platform_device *pdev)
>  {
>         struct regmap *regmap;
>         int ret;
> +       struct clk *xo;
> +
> +       /*
> +        * We must have a valid XO to continue, otherwise having a missing
> +        * parent on a system critical clock like the uart core clock can
> +        * result in strange bugs.  We know XO will be provided by rpmcc,
> +        * but it might not be specified in DT like it should.
> +        */
> +       xo =3D __clk_lookup("xo");

I very much dislike __clk_lookup(). I think we can not have this patch?

> +       if (!xo)
> +               return -EPROBE_DEFER;
> =20
