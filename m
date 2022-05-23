Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02220530B99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 11:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiEWI50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 04:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiEWI50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 04:57:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B03D245BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 01:57:24 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id z11so3598023pjc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOx1s6Tw/iS+Wvo8t1vMDD8/GqxZ+W9fZqDgLDMO/pA=;
        b=RqlCnDSVXzGe29JHDxG94EFM8qFJ8yvsmRCQp+h4gyk4LdAEqEzPzW1aqrzYxGe7wP
         4ZhYM5+WczBNfM2Enph4GKcZPZSajrZSG0i+A3Qk4HDa6I80Gz3UfLHKA7LiVo2loQfU
         ByUKFDdM7i4r8m5qFJpk34Cm5P6V1wQE+l5rNjSwjOf9JI3VWtBtu5XpP9m9NcPbWBmh
         gZPtdj3uorlA6DcCZ/TnpKBV4WoWVt+6dXD5VS9r0zZ+ai+bRuc/UtUw983rsTR7pS+M
         0l1uvhJ3TNdvJi3Z951qRQA+M2kBmNf6DEC1dtLQXEDfodBeDy2p+NubPqUTRzXVdmRs
         JAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOx1s6Tw/iS+Wvo8t1vMDD8/GqxZ+W9fZqDgLDMO/pA=;
        b=3gM/Akn6alecHer5nb++FGg//aSx+YhcleaZ06fA6kZ+k5wBA85kU8Mk+Px7DLYiWA
         CaLkdGQg4JkTioY2eXeEIna4ATd9c9KyKtHZWne4DD8q4vylkVVRQwtsjY/nny1hwICh
         pD/XT4b+UW6FLutKMIkpoDuLFRoxp8ZZYcHuYYeLypfAbGQfy51vHk56hio+vghlonlR
         b6KHJwfBW/78mDXONiESzqmd5sBSDLN2H+R+PxuM3iM0JD9QkmOFs1XCRkaOr3nPvRo3
         SgbPrqjn/WdZAMCrVmES3SQZMFYAyHiunZMzJntEZnTwvuZ1/Zxcx2lhRv6Go7n5PJ9e
         ASMw==
X-Gm-Message-State: AOAM533MwqBpw84B0ihVZttFMJ+0RPhaL2s1rRraXZpwslD+DPIfoZJ3
        zNg48yG2UJej0W6xF14I2KAV57tztPQM2k2q14tuaVZMmKE=
X-Google-Smtp-Source: ABdhPJxul913NDEk2gZnonaTmqlOr5PJYQZQznP3Z3l6sOv6aEZsiDj9Gr9ndFPfe6iyYrCKLT0Eh+WitnIg325zGh8=
X-Received: by 2002:a17:902:8f81:b0:161:f4a7:f2fc with SMTP id
 z1-20020a1709028f8100b00161f4a7f2fcmr15025358plo.117.1653296243910; Mon, 23
 May 2022 01:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org> <20220519214133.1728979-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220519214133.1728979-2-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 23 May 2022 10:57:13 +0200
Message-ID: <CAG3jFyt1cmi1AqOEbFPi95RNGyitA8EQZJ7YFXfXs6=-orZkKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sdm845: Fix topology around
 titan_top power domain
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 May 2022 at 23:41, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On SDM845 two found VFE GDSC power domains shall not be operated, if
> titan top is turned off, thus the former power domains will be set as
> subdomains by a GDSC registration routine.
>
> Fixes: 78412c262004 ("clk: qcom: Add camera clock controller driver for SDM845")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sdm845.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index be3f95326965..27d44188a7ab 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -1534,6 +1534,8 @@ static struct clk_branch cam_cc_sys_tmr_clk = {
>         },
>  };
>
> +static struct gdsc titan_top_gdsc;
> +
>  static struct gdsc bps_gdsc = {
>         .gdscr = 0x6004,
>         .pd = {
> @@ -1567,6 +1569,7 @@ static struct gdsc ife_0_gdsc = {
>                 .name = "ife_0_gdsc",
>         },
>         .flags = POLL_CFG_GDSCR,
> +       .parent = &titan_top_gdsc.pd,
>         .pwrsts = PWRSTS_OFF_ON,
>  };
>
> @@ -1576,6 +1579,7 @@ static struct gdsc ife_1_gdsc = {
>                 .name = "ife_1_gdsc",
>         },
>         .flags = POLL_CFG_GDSCR,
> +       .parent = &titan_top_gdsc.pd,
>         .pwrsts = PWRSTS_OFF_ON,
>  };
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
