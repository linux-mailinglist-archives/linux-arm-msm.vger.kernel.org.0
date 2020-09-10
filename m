Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218E42654B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 00:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgIJWAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 18:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgIJWAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 18:00:41 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7DDC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 15:00:40 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g3so6150009qtq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PT5fNi7xEflk8GkI4Xi2kkoOSPhyGZTLMGtsTW99lM8=;
        b=UFahawZL4avRAiB31WSjU4euU3yRJTvrwhgJJi+Qn9x5fE7mBIWZH9kFeYWriHmGo0
         8DHjQ50B0xl5dOak65fkLcV7yN5nOj1VsXQgQL4pnpjyXKeRmShEKNeJfTtR0mesghnq
         1CvMe0xbWvYL/GH0IlhuCHB3VedkLXkWosVaUZVL1AbvGCkv73Vg4ZUIg+1YfY2orVY4
         ibgOpRDf2ulUeLZOiriIIhngYnlgiH1Ul0bXET7r0sUeUwXoYVnH3b1erPyJJ+CTh/gW
         7BPZdJCEA0WMx6E0iFl0XvHMlzIpVULhWwJ3piwrrgfe0RTT3ZLO3kQzq2D2JvEyh2f7
         1g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PT5fNi7xEflk8GkI4Xi2kkoOSPhyGZTLMGtsTW99lM8=;
        b=Q6AnPn9M1yuFOIi8n/AeQ3K+LLbkL6kL8okU+f+SfCFd7dFc33SGfsM9tDAJ9APY+u
         C5MDqYySHsGUoCIZ9a3TPyetTgZSmKJ4uEJJYWitIaat22UzWHIHXHhGjNJInnspS16V
         k+H9716vjLvT3NGQGBkq9Cro7eMb8g9YaJokqcX3qXRjJFmV+wS/HWr+yBk6w8F8n0Q+
         72IAa6M/uJCGOrY6p0AHjC0RlrIZGpHSV7x4s4vZnW4YrVoU+ge3o6g1RuHfLrG6bBeW
         +POX1QGwJTSdqxbxi40famBUTiVHjtxgN0geXPbIr66bbhEdB1v50VmsLr9JrHWi06fF
         Ssxw==
X-Gm-Message-State: AOAM530AdJGkg2josX9WY7sy3h29miR7rDr5FRbLS7qAsFobfhZqRJjc
        +t2lRgRGPPccN+oFjomiJhOiuA==
X-Google-Smtp-Source: ABdhPJzkV98KqvV9kj+Vq3Fl6B3U5epSGI8O2umuU/HuE10PsA2MfBhWuzMuy+vaiCys73JsOVxnXA==
X-Received: by 2002:ac8:376d:: with SMTP id p42mr10057359qtb.288.1599775239625;
        Thu, 10 Sep 2020 15:00:39 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id u66sm406702qka.136.2020.09.10.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 15:00:39 -0700 (PDT)
Date:   Thu, 10 Sep 2020 22:00:37 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, jsanka@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
Message-ID: <20200910220037.GA472@uller>
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jul 11:35 UTC 2020, Kalyan Thota wrote:

> From: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Move the bus clock to mdp device node,in order
> to facilitate bus band width scaling on sc7180
> target.
> 
> The parent device MDSS will not vote for bus bw,
> instead the vote will be triggered by mdp device
> node. Since a minimum vote is required to turn
> on bus clock, move the clock node to mdp device
> from where the votes are requested.
> 
> This patch has dependency on the below series
> https://patchwork.kernel.org/patch/11468783/
> 

Isn't this dependency on an old revision of patch 3/3 in this series?

Regardless, I don't see either the linked patch or patch 3 merged in
linux-next, so I presume I should not merge this?

Regards,
Bjorn

> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 4f2c0d1..31fed6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1510,10 +1510,9 @@
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
>  			clocks = <&gcc GCC_DISP_AHB_CLK>,
> -				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "ahb", "core";
> +			clock-names = "iface", "ahb", "core";
>  
>  			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			assigned-clock-rates = <300000000>;
> @@ -1539,12 +1538,13 @@
>  				      <0 0x0aeb0000 0 0x2008>;
>  				reg-names = "mdp", "vbif";
>  
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>  					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
>  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -				clock-names = "iface", "rot", "lut", "core",
> +				clock-names = "bus", "iface", "rot", "lut", "core",
>  					      "vsync";
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -- 
> 1.9.1
> 
