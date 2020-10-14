Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA17A28E8AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 00:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgJNWKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 18:10:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbgJNWKx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 18:10:53 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 961CA221FF;
        Wed, 14 Oct 2020 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602713452;
        bh=vhqWjk6Ksj0VbJaHGxn+mUKAXNBtcqsuikukYdj1OAo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m9uRw8CZs+OTYGzz9dm8qy8rrTaH2iQYUR1p/R/u9C3hpomrDKqfxR2dhlgHX+81/
         9QPxOmP+Lk/wRZE7/yXZOGez0tvwM2rrXqKu+jG1T9wYop+ufUQTe5nPRnb6gGHbSr
         IHsJtPuCWdDX8VYp+4BUG9pI4dLbmZvuu5NNC+RI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 15:10:51 -0700
Message-ID: <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-10-14 14:05:22)
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpa=
sscorecc-sc7180.c
> index abcf36006926..48d370e2108e 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7=
180_desc =3D {
>         .num_gdscs =3D ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>  };
> =20
> +static void lpass_pm_runtime_disable(void *data)
> +{
> +       pm_runtime_disable(data);
> +}
> +
> +static void lapss_pm_clk_destroy(void *data)
> +{
> +       pm_clk_destroy(data);
> +}

Why are these helpers added again? And do we even need them? Can't we
just pass pm_runtime_disable or pm_clk_destroy to the
devm_add_action_or_reset() second parameter?
