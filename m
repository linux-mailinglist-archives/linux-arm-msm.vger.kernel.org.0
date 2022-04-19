Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B13507659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 19:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244740AbiDSRT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 13:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243200AbiDSRTZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 13:19:25 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5541A35DEC
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 10:16:42 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e5ca5c580fso7885831fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hh2D5T9O1nXJSpyowbHfBZ/qDBEIO6Yb28qotohzW6M=;
        b=PF5p5rMhgy6pOrHUjITOkzIIX/nu4CrsUEAI+OBpKM/fAcN184LtuvQhGc7XWvwWFE
         QDev0y1bfAYpdtra2JSbiWBHdcQ1/jItqtGzgN38KQ1T+WkpasC22m3z/6Dvs4eVnwot
         dxdm7PwEXo96wJMV2xgHNXY/xiYgN78E8Ks1BJ8l6AN5KHRlVxY/dNgK5LLtZqqEobg3
         tD422XHJlvCy9K5VxFCKDdjs29GEwsnG/pqC73i/Ph5gebgUYf59ePs1UPWF6bj8LNjH
         uBkNJCZJrNuQNYRBK98Y5sVJj+nKUFOsE6CX6BocknUrg9+PozAJ37nuZXJLWu2Kretm
         +M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hh2D5T9O1nXJSpyowbHfBZ/qDBEIO6Yb28qotohzW6M=;
        b=rPA2bJ6tc5a4DZ8opzK22M+svaqy9tNbsmpap37w716MePwtVxvosS8Q5Y/EWo0TOh
         0MNW2fEFWjPx7gLA2a6FuSCsb9Mm2rrA04Nubmb0HUKURLA71MjawfdSbNkSjtBRSW47
         mmz6olB+YrFWbKw+QooffPTn95vShcVQ445rshrOoLaHJKvAMq4MPI8zQooOFJErl7+E
         1IzSEP3zqSY0Qf3a+9bUaTxJb8iye3OU6dkwaTZigtIIL48pDLC1xEitK9fORZ8QBBGo
         drqnO//yhx33rAincSVmTL9jo5OrlNjcRw8ATGKbOUTIXA8V043K43aWS3tQzFowOqdA
         xGRg==
X-Gm-Message-State: AOAM533B8B0cKzpFaB/HWEK4gVriEJolNHiyv0muUT/PW7C3zXXCWCv1
        b/TWndzvRAVBTo/Q63FK+F6u6w==
X-Google-Smtp-Source: ABdhPJwIEiPzWUmSnN/IgWCCz0AcpbNlwnqSyMLhTp4TCVTK0JlV1SdRxsJYUGOJKt5i6RKDh4hTxw==
X-Received: by 2002:a05:6870:d68e:b0:e2:861:8b15 with SMTP id z14-20020a056870d68e00b000e208618b15mr8941436oap.156.1650388601641;
        Tue, 19 Apr 2022 10:16:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j72-20020a9d17ce000000b005e6b89f9f54sm5589996otj.32.2022.04.19.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 10:16:40 -0700 (PDT)
Date:   Tue, 19 Apr 2022 12:16:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8450: add cooling-maps to CPU
 trip points
Message-ID: <Yl7udxBtyL0OeJUu@builder.lan>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
 <20220410234458.1739279-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410234458.1739279-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 10 Apr 18:44 CDT 2022, Dmitry Baryshkov wrote:

> Follow the lead of other Qualcomm platforms and add cooling maps for CPU
> trip points. Handle three clusters separately, cooling cores 0-3 for
> cpu0-3 trip points, cores 4-6 for cpu4-6 trip points and only cpu7 for
> cpu7 trip points.
> 

In line with 52e3b2ca6f9d ("arm64: dts: qcom: sdm845: Remove cpufreq
cooling devices for CPU thermal zones") I don't think we should have
cooling-maps for platforms where LMh is already thermal throttling the
CPU clusters.

Picking the other two patches.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 191 +++++++++++++++++++++++++++
>  1 file changed, 191 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 4f3c7e7d2855..dd8ef4438fd0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1651,6 +1651,21 @@ cpu4_top_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu4_top_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu4_top_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu4-bottom-thermal {
> @@ -1677,6 +1692,21 @@ cpu4_bottom_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu4_bottom_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu4_bottom_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu5-top-thermal {
> @@ -1703,6 +1733,21 @@ cpu5_top_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu5_top_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu5_top_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu5-bottom-thermal {
> @@ -1729,6 +1774,21 @@ cpu5_bottom_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu5_bottom_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu5_bottom_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu6-top-thermal {
> @@ -1755,6 +1815,21 @@ cpu6_top_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu6_top_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu6_top_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu6-bottom-thermal {
> @@ -1781,6 +1856,21 @@ cpu6_bottom_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu6_bottom_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu6_bottom_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu7-top-thermal {
> @@ -1807,6 +1897,17 @@ cpu7_top_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu7_top_alert0>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu7_top_alert1>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu7-middle-thermal {
> @@ -1833,6 +1934,17 @@ cpu7_middle_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu7_middle_alert0>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu7_middle_alert1>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu7-bottom-thermal {
> @@ -1859,6 +1971,17 @@ cpu7_bottom_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu7_bottom_alert0>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu7_bottom_alert1>;
> +					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		gpu-top-thermal {
> @@ -1969,6 +2092,23 @@ cpu0_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
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
>  		};
>  
>  		cpu1-thermal {
> @@ -1995,6 +2135,23 @@ cpu1_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu1_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu1_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu2-thermal {
> @@ -2021,6 +2178,23 @@ cpu2_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu2_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu2_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu3-thermal {
> @@ -2047,6 +2221,23 @@ cpu3_crit: cpu_crit {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu3_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu3_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cdsp0-thermal {
> -- 
> 2.35.1
> 
