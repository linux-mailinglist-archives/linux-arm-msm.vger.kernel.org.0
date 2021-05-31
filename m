Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD478396558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 18:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbhEaQcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 12:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbhEaQaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 12:30:01 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C24FC050252
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 07:58:11 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id x15so12518080oic.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
        b=A5WFHkEP14fFB5I+cbnJMBAg50o9+oCkyD7OC+ezgsSlYqN113tjqNbWlEbw9hjYaR
         IwaMuPuoCMvGi/FdtO8CvqpMJ+yzNXY6iTXAli3unRd9J2KKsH2VWmh1qUOjez326WJg
         tmD5/GEcNvGA/PXgpUIrUaRlgz29mHXjZxbI4AYk8ZlzS2NAcqUosIhAkgptMwK8kING
         Zx4QzVllmm2lATyhR9jsBXgypP9b8pm+GKwYZs10pbzXFVAMElQuMTWHojpqpBu4VIlO
         EkXSw6+MiAiMdyATJ6FSYZAyMu15x6EFb7kL6C9nkn8dOje84NVTHeKWWOa4+/QalmGh
         tgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
        b=Qt1n0FKmP8iCgJ8cJTOy9Xg96nrsbSbK3FiOfQ6wEToRru1jXOUgZE8ggcXkERFJ8u
         8y5NcDCdyqUNfFJAZ8jFG5Nd3s/ifCY9VBU+WVuy20v5/JDaLQa13U/qVy3IFs4ZPmZF
         KuImTJ3MVjICuAm3FrI85x4AU8QvM99nW1ZTZlGiCADFExHlQcoIxL1qiFF5gTSF1MJA
         P91QqISmPZxQqdJrnqtyDp9ASvWEkZyxzfQRHnLdkWUiK3D9+RiT13HeVpYGzf0xtU7y
         kSKB3wgmiSHjT4j36mO3EO+h419dCIeRJwn4lDYNyJcLBPTkJ6zhxJ0fLVwNI0l6KBfH
         pf4w==
X-Gm-Message-State: AOAM531uJonHwnSdFQNZ57lwkTZFN1eLJISUYLS5p6Wsx+vaV5dzLfua
        4UlOx9RirKJQlLq1JJg/Or0+Rg==
X-Google-Smtp-Source: ABdhPJwHZUdNkJg14uls6i/Ap6IYxZyXJWwt7uA1mAadjaCVt0HA9y67LACxjJDBXdg11yuPqdXXZg==
X-Received: by 2002:aca:6501:: with SMTP id m1mr17843119oim.0.1622473090719;
        Mon, 31 May 2021 07:58:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g26sm1488378ooe.15.2021.05.31.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:58:10 -0700 (PDT)
Date:   Mon, 31 May 2021 09:58:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: sm8250: move bus clock to mdp node
 for sm8250 target
Message-ID: <YLT5gGKP3lUkpmG8@builder.lan>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Apr 10:01 CDT 2021, Dmitry Baryshkov wrote:

> Move the bus clock to mdp device node,in order to facilitate bus band
> width scaling on sm8250 target.
> 
> The parent device MDSS will not vote for bus bw, instead the vote will
> be triggered by mdp device node. Since a minimum vote is required to
> turn on bus clock, move the clock node to mdp device from where the
> votes are requested.
> 

This commit message makes sense for the other commit, where you move the
"bus" into the mdp. Do you mind me changing this to:

The bus clock is voted by the DPU, so remove it from the MDSS node.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 394973e778f7..60fe2eaf06c5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&gcc GCC_DISP_SF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "nrt_bus", "core";
> +			clock-names = "iface", "nrt_bus", "core";
>  
>  			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			assigned-clock-rates = <460000000>;
> -- 
> 2.30.2
> 
