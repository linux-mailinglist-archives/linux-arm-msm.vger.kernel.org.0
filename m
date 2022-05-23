Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E30530B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 11:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbiEWI57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 04:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbiEWI56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 04:57:58 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA6137BCB
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 01:57:57 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ds11so13455077pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pYAgnzo2YXXPjeEjGklM5QuN3QjhD47g11mzbPUw+A=;
        b=fBjrkdIIUOKdjuwYiKpU+vPbSSc1KwCxIphHwgr5tSN18GxeGK/B1O1sm4jRrjgqGb
         zUc9eJdRGVuFKDZSDNc9ggsKVO0EGEeQp6RumTd0IG+bs50/zR4FNpFOOz41CYqHW45k
         Vs7dBXerXzyeiAXBAYuPdTrwz8TGfFgc/Gf1aGCNSkSngrC9hoqdMEa4i8mlewPJpD23
         JQ1AOgwkGlGVzhVH4UeY/dGInHnHUu14JSR3lO65argT+uvy8kSwwhA7fpZeM/TaOQPt
         gNoA1Q+LjgCi8fcGPaPLEwHSPP52s4BKsns+sftSRGowefHmaNUiAJo3F1jMuI2Xrhkp
         mMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pYAgnzo2YXXPjeEjGklM5QuN3QjhD47g11mzbPUw+A=;
        b=L0iTK2tzMbrvI9hhmaHqpYHwPv4gtv2slWxUJEBJfIE0vGqU4LRYAbnmbaZFfII2sJ
         4bGiRSSAv3rparSb/sv2ugntgdDeESZrMTBtistfVzvD7ZBC2TK3+h2wlTt9rWrqbk69
         YpREmLYz/VBFeZCSXrTLmQ/1WAnyK2tm5L0HouoN7RJyRhZnXNB0ssPj1SPNBVW4nOaH
         QLq0sh0MXmI00w2pC+1XT9GnFeh/+i1tZZB0aetPxhYJ7VhGjCf5VkMwQowcPG4/bE0I
         fJA287y9BmSXq6bn/loInAUKTeonmEjaToD1pRYR+ssfDzk3INQ33Us63PBVh1OyUSEj
         oiBw==
X-Gm-Message-State: AOAM533a3j0SybmvLCwP225qfmrWpACefEnVma9BXiKjq0xRQFH6FzQg
        Em/8r1ZIYZ2XXm+B8Mv953FtvanNvZ6KRW7XFzuCYg==
X-Google-Smtp-Source: ABdhPJzQjUmsY1uzuoBK7JFpJwVjDmowYMXcr16Irn5o1uHnxf27mIUaEFlfATsfhvAcR0kfZWhM2uZMHTBsUCII8CI=
X-Received: by 2002:a17:903:1c6:b0:161:9fbc:5a6 with SMTP id
 e6-20020a17090301c600b001619fbc05a6mr21913131plh.65.1653296276851; Mon, 23
 May 2022 01:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org> <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 23 May 2022 10:57:45 +0200
Message-ID: <CAG3jFys-BEb6AeYYef_Wqa-LvnkJjsBOT0QeGg=0ytikf_dEog@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm8250: Fix topology around
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
> On SM8250 two found VFE GDSC power domains shall not be operated, if
> titan top is turned off, thus the former power domains will be set as
> subdomains by a GDSC registration routine.
>
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8250.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..d68376077d51 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2205,6 +2205,8 @@ static struct clk_branch cam_cc_sleep_clk = {
>         },
>  };
>
> +static struct gdsc titan_top_gdsc;
> +
>  static struct gdsc bps_gdsc = {
>         .gdscr = 0x7004,
>         .pd = {
> @@ -2238,6 +2240,7 @@ static struct gdsc ife_0_gdsc = {
>                 .name = "ife_0_gdsc",
>         },
>         .flags = POLL_CFG_GDSCR,
> +       .parent = &titan_top_gdsc.pd,
>         .pwrsts = PWRSTS_OFF_ON,
>  };
>
> @@ -2247,6 +2250,7 @@ static struct gdsc ife_1_gdsc = {
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
