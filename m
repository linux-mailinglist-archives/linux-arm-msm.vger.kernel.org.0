Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA33558C3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 02:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiFXA1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 20:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiFXA1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 20:27:21 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB3352E5A
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 17:27:20 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-101e1a33fe3so1626503fac.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vLPxQpPVe53r4Mmfefvo8bhM2y//XoAwBTSHLhdIZPQ=;
        b=MyDz/Sjcr8o+Jg+xDYH48Fl5WxupXhtIMJBqfOTWYuOy+VhCnX/qkbZOVPjkAlNxAM
         X3Fv8LuoMcN5F6GXeFtsBxzWDMzq7ky0tYus1++h0irkP4A9d03Ft6UxH6hNzlnnR9OG
         S/L6duzsWf6bP0o731XIjZNA5h2d6TULlXpro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vLPxQpPVe53r4Mmfefvo8bhM2y//XoAwBTSHLhdIZPQ=;
        b=mubHKZFYKmxHS82oBwSA1akpsttuLZmDb6EMc1dH1tyj0mI3dgZ/578XcQe9JJur5Y
         9TvPPaUBkUJwiasG4My/KBaHTSK/+9NvzjXg/vR/PX1DZ2Us4wZ0blv5TtKz3kW3CMrj
         dNeuynq5Zpogv27yIgBmwy0+l6d1NZPtHftb/wsEJGZ8mCHo8ZwrSsTHFI+bCnEoHaKl
         Bh1RbKWtov3XdRu0a+Go03yyP4axMMqNiK+yPBza/mKFS/I0Zb/zw9gTYaNuBeNFLZ0F
         l+Ez0MQLbZSPzxf+dY61pDQN3u+OHab7YnAd3c6t9prLiMlum1X6MwLnz/jdvapuFFt/
         rEmQ==
X-Gm-Message-State: AJIora+bORFaucukY3sZPpC7luSTvEO84qVKWAHu6cz0EH1ZnPLWJLW+
        qId/8yaxlIEeJZ7XwTJ5/WTb31cw/G+8AuOpbgYwBA==
X-Google-Smtp-Source: AGRyM1uB/dutJHNaka6kNs4qoT8rU8wUqlI3HgOkLTqitXnSC3bXULQe/NMJ3pyp4NsEokhzwdvdz6WoxIpBtRaxW1Y=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr413726oap.63.1656030439375; Thu, 23 Jun
 2022 17:27:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 17:27:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 23 Jun 2022 17:27:18 -0700
Message-ID: <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> Use parent_data for the last remaining entry (pll4). This clock is
> provided by the lcc device.
>
> Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> Cc: Ansuel Smith <ansuelsmth@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> index 718de17a1e60..6447f3e81b55 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
>         .enable_mask = BIT(4),
>         .hw.init = &(struct clk_init_data){
>                 .name = "pll4_vote",
> -               .parent_names = (const char *[]){ "pll4" },
> +               .parent_data = &(const struct clk_parent_data){
> +                       .fw_name = "pll4", .name = "pll4",

Is there a DT binding update?
