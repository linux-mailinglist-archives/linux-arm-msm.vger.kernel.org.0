Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3D2394523
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 17:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbhE1Pf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 11:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbhE1Pf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 11:35:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E82C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 08:33:50 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i9so5852252lfe.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WQAIy/cqL6HY4QoJk9rlb0qr88kUAFg5eiEbdRAxrlQ=;
        b=QkHKGPK2Ney5fZb76pO4em6bYAF5+riaGgUaRkUFbq5A/iWgYV6W/HDuMeKQAo23hc
         qPUCuwiaKnIbdN12ctahycJ7hOEpySONkQYuDhetagXKj87WOnX4BKQuOGE749xD6Ds3
         tyvsnrmq1Ki7YyxzVPY1rsFu3YVSEGD069xcHdG58e7/o1aMLexDeHddfunA+akSgodT
         o3KJdKIOvtU0WofEi0wF+0N55Sk+gruQ7zCuj8CkuHWx2ZVtiMn7mQBZ3bPvDtfCHKpd
         tcfT6zsM3D7Nv5tPodqbsn3IV2l7v0SeZ/4ZsK+Jo0iQqjouqrv35EDSgjtmhKp9rH1h
         /OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQAIy/cqL6HY4QoJk9rlb0qr88kUAFg5eiEbdRAxrlQ=;
        b=IwvWxkpwppixldNz+ZzfECQgEPzCMLdlPNDgwRtym8qE1YqlfQVvIiEs/RJ61LVhpx
         /11uaF7+aNXgZQNHHZTmiwaPL4986MVj/aXDNNxmTqHuXohfJdZIWjz2n8mjHdHk7lop
         +i4xxnVqzBR9B5LsC9bUSg4VnFgxMKp2Do0pABbDzB9p67CTrRfvZqcIOQZpczEtVs5e
         kmeONxg79jYqT72lVbjpEuWhuIKhgqGx3XFuXo8RpPiOyAVs3Exqn/DSdFYWMhdgqnsA
         t1CgrQUoepkuoSyriUn0SbWcPRve6D2SdUTh8rdFTbhektW9/UoDDF66al0gSJDuDElE
         Doqw==
X-Gm-Message-State: AOAM531uKkyFw0FSasxYkZn7/byxg3wwTMYLr6W5nO2HIcNA6l3pcOGn
        Cas8xmUu5Cc5xlwUj8C7nc8IZA==
X-Google-Smtp-Source: ABdhPJz7FYPsBx3F49MboSKfy0LCjkLr9TrmGCWDRjOYeVHrq4QgzrKnxy+VEzPDs0Oj5pw0ALKxsw==
X-Received: by 2002:a05:6512:49d:: with SMTP id v29mr6291509lfq.185.1622216029314;
        Fri, 28 May 2021 08:33:49 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.229.79])
        by smtp.gmail.com with ESMTPSA id o2sm562620ljp.60.2021.05.28.08.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 08:33:48 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] arm64: dts: sdm845: move bus clock to mdp node for
 sdm845 target
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
Message-ID: <2dc79aad-33cd-7b17-368f-d52d60d46811@linaro.org>
Date:   Fri, 28 May 2021 18:33:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2021 18:01, Dmitry Baryshkov wrote:
> Move the bus clock to mdp device node,in order to facilitate bus band
> width scaling on sdm845 target.
> 
> The parent device MDSS will not vote for bus bw, instead the vote will
> be triggered by mdp device node. Since a minimum vote is required to
> turn on bus clock, move the clock node to mdp device from where the
> votes are requested.

drm/msm patches were merged through the msm tree (targeting 5.13). 
Shouldn't we also merge these two patches (targeting 5.13 as fixes or 5.14)?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 7395ef20b90e..55704804c2ca 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4136,9 +4136,8 @@ mdss: mdss@ae00000 {
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
>   			clocks = <&gcc GCC_DISP_AHB_CLK>,
> -				 <&gcc GCC_DISP_AXI_CLK>,
>   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "core";
> +			clock-names = "iface", "core";
>   
>   			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>   			assigned-clock-rates = <300000000>;
> @@ -4166,11 +4165,12 @@ mdss_mdp: mdp@ae01000 {
>   				      <0 0x0aeb0000 0 0x2008>;
>   				reg-names = "mdp", "vbif";
>   
> -				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				clocks = <&gcc GCC_DISP_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>   					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
>   					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>   					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -				clock-names = "iface", "bus", "core", "vsync";
> +				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
>   
>   				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>   						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> 


-- 
With best wishes
Dmitry
