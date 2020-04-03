Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4DC919CE2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 03:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390280AbgDCBe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 21:34:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:57026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390223AbgDCBe2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 21:34:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 535B1206A3;
        Fri,  3 Apr 2020 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585877668;
        bh=7b3Ysa1BLGv5if39DtngdrAT55GjsM/BtI03DHDpmQc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BzJgVKHHx6uUXr9l6xQGm5A8oJuQelPcnLUdfdHp+0Yh/+8Yhp6F/TS/8EolPRx11
         1pEPmSDHQ07+CocsG9XLo2FztBK8wXruCK3ANoHjUNZI8CWBlI+GGjqonAlpruJzIF
         tchnmiRZ5guOzb0AcRCF1h+0CDJZdMbRXP80mIYY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200330205647.24806-1-ansuelsmth@gmail.com>
References: <20200330205647.24806-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Mathieu Olivari <mathieu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Date:   Thu, 02 Apr 2020 18:34:27 -0700
Message-ID: <158587766752.125146.7582840761926137726@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-30 13:56:46)
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806=
x.c
> index b0eee0903807..f7d7a2bc84c1 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk =3D {
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "gsbi4_h_clk",
>                         .ops =3D &clk_branch_ops,
> +                       .flags =3D CLK_IGNORE_UNUSED,

Is this necessary? Shouldn't we skip clks that are protected during the
unused phase?

>                 },
>         },
>  };
> --=20
> 2.25.1
>
