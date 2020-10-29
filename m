Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEEF29DD89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388786AbgJ2Aji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388784AbgJ2Aje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 20:39:34 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F440C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:39:34 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so899224pfd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZedC2vigvm5YIn/fNFp5FXPUqakrWVfWwG+npbhFrco=;
        b=a0s8idfnoRHJpK/+DESXypox99Vruk0+O4DxZW30HW8gOKipZ0aPYM4b6SdecDlU5u
         FVXRZje7gGtILOMRJEDC4r/0++H2soJ7X2pBGgjQBi/Lt/Qx6BoCqLgHwO8ITqSrDgl4
         YQ5cRpMxtT/xxtSGhwB7gw9nr+A2yLv1+jVLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZedC2vigvm5YIn/fNFp5FXPUqakrWVfWwG+npbhFrco=;
        b=lAQy3u7JpIGDXGc0jyEnKNgw6HwaPoaTwl46DQlvcPU0zRz40PpMOVjOS5IKdAP7cq
         lhTg6dHx/AvDm5xuh3ftN5WDmN72E1nnmFwx7RFLS789LJXQf7xNXV/hKZpi6LTCq/zX
         ekgHmyJXwtRQHtfSKRWBgf8bZOb2rvTHhO/AC3NH8Jm9mn0CYcUyVLgOXFZ7SU7bdGJS
         i1AKdnL+F6O7nIbXyxk4+ZRahZjR6zRW+qbbqdQ4xu2DweIeodTHiiioulDG4oZ3+jr4
         WvLFiSEklpEE3PbA8m6cqe9VvnupHEeXWhCg6HL9rQVA060CvYd/jGT9R5UyRmLDP7+O
         zxdA==
X-Gm-Message-State: AOAM531zELCllRTRTR9bUlE1hutW2kayla2KOw/b3P8b+EV0PuENpaE1
        XakqLAWZBCumWpDyONGa+CshXA==
X-Google-Smtp-Source: ABdhPJzqiMaBmN3vNxFrIabWhxn0PccdODJ8yXJGQuNfW1GBQC4WTzmNeQ9Ufdfb1aV1Bu+P38TCDw==
X-Received: by 2002:a17:90b:230d:: with SMTP id mt13mr1445385pjb.177.1603931973929;
        Wed, 28 Oct 2020 17:39:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id n64sm754497pfn.134.2020.10.28.17.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 17:39:33 -0700 (PDT)
Date:   Wed, 28 Oct 2020 17:39:31 -0700
From:   mka@chromium.org
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, dri-devel@freedesktop.org
Subject: Re: [v3,2/3] arm64: dts: qcom: sc7180: Add gpu cooling support
Message-ID: <20201029003931.GA1855806@google.com>
References: <1603892395-3570-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603892395-3570-2-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akhil,

On Wed, Oct 28, 2020 at 07:09:53PM +0530, Akhil P Oommen wrote:
> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..a7ea029 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
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
> +					trip = <&gpuss0_alert0>;

Copy & paste error, this should be 'gpuss1_alert0'.

> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		aoss1-thermal {


Other than the C&P error:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
