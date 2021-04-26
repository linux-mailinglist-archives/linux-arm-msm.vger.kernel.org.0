Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A870436BB5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhDZVym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhDZVyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:54:41 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4C9C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:53:59 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso6095617pjs.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bJ+bkQkkFIHNQ8ewII3gykBkkUI5D3+ukJbqU/0p8Is=;
        b=nrQsUTJ/ZIwSnTKw5vzlpiPB1FuRZNR/6BfB4JI2TH/XsUDo7qhzwq8U5I7HsAk8Us
         dEEb/bQHV9Xrz4LkZOzMTI/dladeZY9E9MfPoJHHCLyhy3gRx5Z1S/Mcz/5UQ3Y4ar1B
         1HU33d4wn7T0Uku5lw19chE15nzEg5l6hT77w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bJ+bkQkkFIHNQ8ewII3gykBkkUI5D3+ukJbqU/0p8Is=;
        b=EWBh+m3/rEd2b44XpiSN8BPEqXfOg+5N4i011s+lEb5BNUSZX1ZexUIf7iMUXhJpvS
         6CAP2/N6ze1RN17fXv0QYzdhztcZ14knAciLgNhChXVkfKX5GytmBYiC4WhLgFEyr8/p
         OH+C5t7PrNSLcDnEZgmwPrhxfCyvSJ+nCthyroWMZ+SogvZ181EFhGyc8mNXypbLQBt/
         U9YM8uJiBP6ffGYIV/dXje9q6yPk1pWMHCE2+GSz2Dmjw1QKU/UNKr2U4oZd3hThpuhi
         MMCnDrJ2VekerE9vmpXzO49Db2XGNrs7EG7bM0wQRaGdQdwfFSTj/bkHQIP+s25aSdfY
         89Zg==
X-Gm-Message-State: AOAM530WYScYY5kOm6IsIZJbzKaMhyInzVkV8C5gYtSI0Md4gAGQMO4F
        EI43h2UkCI2UU483U1Ct7BRufg==
X-Google-Smtp-Source: ABdhPJy36UqSsa6HM/KqdjU5Cqyj9rxIawAzV2euNJOgEHBD9xeCO147Kqq4VR8VmXAi1DCplRWUTA==
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id r11-20020a1709028bcbb02900eca19221cfmr21027809plo.71.1619474038714;
        Mon, 26 Apr 2021 14:53:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3a16:de17:8721:d706])
        by smtp.gmail.com with UTF8SMTPSA id 31sm11793802pgw.3.2021.04.26.14.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 14:53:58 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:53:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
Subject: Re: [PATCH V2 3/3] ARM: dts: qcom: Add Thermal zone support in
 SC7280.
Message-ID: <YIc2dJlhXtb7NWU2@google.com>
References: <1619202177-13485-1-git-send-email-rkambl@codeaurora.org>
 <1619202177-13485-4-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619202177-13485-4-git-send-email-rkambl@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 11:52:57PM +0530, Rajeshwari wrote:

> Subject: ARM: dts: qcom: Add Thermal zone support in SC7280

s/ARM/arm64/

same for patch [2/2]

nit: s/Thermal/thermal/

>
> Added Thermal zone support, cooling maps and added hysteresis as zero as
> it is not needed as system is supposed to shut down when critical trip point
> is reached.

nit: s/Thermal/thermal/

I don't think it's necessary to explain the hysteresis values unless
they are really uncommon.

> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 844 +++++++++++++++++++++++++++++++++++
>  1 file changed, 844 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 275113c..80f4ecb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -1140,6 +1141,849 @@
>  		};
>  	};
>  
> +	thermal_zones: thermal-zones {
> +		cpu0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				cpu0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				cpu0_alert1: trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				cpu0_crit: cpu_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};

In the review of v1 (https://patchwork.kernel.org/project/linux-arm-msm/patch/1619005442-16485-2-git-send-email-rkambl@codeaurora.org/)
I suggested that a hysteresis isn't needed for the critical trip
points, but this patch also also gets rid of the hysteresis values
for the passive and hot trip points, which isn't correct.

> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu0_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
>
> ...
>
> +		aoss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				aoss0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				aoss0_crit: aoss0_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		aoss1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 0>;
> +
> +			trips {
> +				aoss1_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				aoss1_crit: aoss1_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 5>;
> +
> +			trips {
> +				cpuss0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +				cpuss0_crit: cluster0_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 6>;
> +
> +			trips {
> +				cpuss1_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +				cpuss1_crit: cluster0_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpuss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 1>;
> +
> +			trips {
> +				gpuss0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				gpuss0_crit: gpuss0_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpuss1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 2>;
> +
> +			trips {
> +				gpuss1_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				gpuss1_crit: gpuss1_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		nspss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 3>;
> +
> +			trips {
> +				nspss0_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				nspss0_crit: nspss0_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		nspss1-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 4>;
> +
> +			trips {
> +				nspss1_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				nspss1_crit: nspss1_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		video-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens1 5>;
> +
> +			trips {
> +				video_alert0: trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				video_crit: video_crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		ddr-thermal {

uber-nit: I still think an alphabetical order would be preferable, it
makes it easy to locate the zones, whereas the indices of the TSENS
sensor are mostly irrelevant for the order. Anyway, AFAIK there are
no clear rules or conventions regarding this, so it's ok if yo
prefer to leave it as is.
