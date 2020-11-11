Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCE2AE7A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 05:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgKKEu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 23:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKKEu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 23:50:57 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B760C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:50:57 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id d9so803153oib.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
        b=VYELtnjAV5Ls0k8ZJfZ7zELRqNDR4/IyfkC7nMGABdnGpdE/Zb9PwJSfoGKyU92gq4
         7UiACwrRNIlrGnDXh7NNg/dHqywhUpUiTH97Emo5n0MQ/QsUQfNb1lkeRe/4BZeWAKW9
         5HbP/pl2a7ByW7MhaXMYXIgqX4pKvlIufMf9WOq182jsV7cCbhTBC0ukB46Zc191LFey
         BX8SF6f4cJdzGZ39ZM61Q2WktAgjlYYaJspMZjosGtj/3qA9+WDGkAj4MoH3qi7ysQ6J
         9/krSDyGAmatCg5vZTv3xqVOKoGRIUTREQBkirg6ltpjdDKe8J5DE9uUYjU+SB1XyAX1
         vh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
        b=tR0oRssXf/7M0UdfrjWPk4newIoL2mhTJInCerDQV1kda5HsJ2Eo3oDo82M08+EBQZ
         xkolZvqcaj6UVHISqoeMj2K/1dRwsQAwQd9LJJWtmgPTLU7x5V8G9WfUPB2FypLhh7iv
         UvG0v+2yJg9R78UkHCr19TR0YOz84G1W2UIaL+Y3smJXGH+DmMDqTGUSydk1ifOJt6Tt
         rXF7IxXuz0TpZkESxa5xwHT/dPhNNICMmyKUBDFPI4r4nNtzx3WhxCnCUWExj2eAOIvR
         vUSF/fmqJ9jA4PzaJaLxi75/snKNID7RbBLti0tfuxlM4VU2TTH9FdvSdtR3BUTJCvLj
         PlzA==
X-Gm-Message-State: AOAM531sb97XPbrP+lHt62F4a4dkhkFDucTdzfTQsHYdScgziOh+mz68
        26bhQ3FjR2D4pNgkVfD3DctMHQ==
X-Google-Smtp-Source: ABdhPJwzPtqe2oFKM2VjVJi3f9w9NPihcWFT8lNK7ABdSE3qphYjo0s4kjlFgvKpRXgW+uj2DIxPeQ==
X-Received: by 2002:aca:afd3:: with SMTP id y202mr968450oie.135.1605070256818;
        Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l19sm277147otp.65.2020.11.10.20.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:50:54 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
        dianders@chromium.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7180: Add gpu cooling support
Message-ID: <20201111045054.GE173948@builder.lan>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 30 Oct 05:47 CDT 2020, Akhil P Oommen wrote:

> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..8e2000c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.

I took the liberty of spelling out 2020 here, as I applied this patch.

Regards,
Bjorn

>   */
>  
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1886,6 +1886,8 @@
>  			operating-points-v2 = <&gpu_opp_table>;
>  			qcom,gmu = <&gmu>;
>  
> +			#cooling-cells = <2>;
> +
>  			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>  			interconnect-names = "gfx-mem";
>  
> @@ -3825,16 +3827,16 @@
>  		};
>  
>  		gpuss0-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 13>;
>  
>  			trips {
>  				gpuss0_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss0_crit: gpuss0_crit {
> @@ -3843,19 +3845,26 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss0_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		gpuss1-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 14>;
>  
>  			trips {
>  				gpuss1_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss1_crit: gpuss1_crit {
> @@ -3864,6 +3873,13 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss1_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		aoss1-thermal {
> -- 
> 2.7.4
> 
