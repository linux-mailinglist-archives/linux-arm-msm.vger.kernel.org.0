Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213303994C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 22:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhFBUpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 16:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhFBUpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 16:45:13 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE75C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 13:43:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h24so5851170ejy.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m11y4i1SvujGuRzAdjBSm08F3vbFRf7B2NZgAGBozGg=;
        b=RX5rlD+C4/B8bJewy4253z4LESQmaLz1GAHGt55FYSpDA/jDWJciy4Yd62p+3UiDpe
         QA4WhZbDPolAp/wjlJvVy18gZ8IW0FpjsEwEj/IpPOjcRaj8hi0xz22+i+xWLifDUXvn
         LZAsc5BxufYNKSnLa0v+w4y2Z87pCrnYK0dLh4SDFruhk5ginR4Sk7btgTNbQ5c+gPfN
         ukoC0PnhDBl23h+LMZitJJN2q56IoPLCCDmxWZeO6+Ns4teAAPvYW1tgG+ro7INrZF9H
         EZd5aS+pjSqcaFXbtmNWD8Qrjjxk390HSsYVhMqjWUiWfzOzPT3eDQo+kFienlpMQNNZ
         9+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m11y4i1SvujGuRzAdjBSm08F3vbFRf7B2NZgAGBozGg=;
        b=pTyowYSPtaG7hfYEVQZyyuVe3cO/MBaTLIrHZs8DMM2pnae7e7i+GlJnEqwNz1jkuK
         HH2R2yPcWjGIR3SK90ApCmPEjjNJb/rvotEf69OpQoKm20tqOOFATyNSpu1gKiollrwd
         CHSGezjRl/r4P1UD7v+Hxkm/RhoDOGPucoSk242BSEsamKjbFvrw6h/yYX/L2/xhqJDK
         wRMXVyjcIPGkeC+nr7O7ttMQUYjHwdL0EUptz/AZAvkW3N2IJg1JqJNbKyA1PWSgifFC
         W2misRxEcsNOPpJWBjVTkWUJ3i+c0rHYwc8Is04LsID6MngTKmEaJDrnoFtIDTOZdzrY
         Pkzg==
X-Gm-Message-State: AOAM532Z4BVkNh11CY0+8ogyOqYsMhPLtI6AhzDfXxdMXVMtgV1c+Ioz
        XD8FFofylfNH8UAICoojcSgx4Q==
X-Google-Smtp-Source: ABdhPJyZX7/9wQ9yx28ATg5R+fCoxCBPvTMELfrFneki7veMc5yQlCqhc7STaVWvl3GJcUIfVSYIDg==
X-Received: by 2002:a17:906:b4b:: with SMTP id v11mr13129300ejg.359.1622666592047;
        Wed, 02 Jun 2021 13:43:12 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-39.medicom.bg. [84.238.221.39])
        by smtp.googlemail.com with ESMTPSA id y1sm510485ejl.7.2021.06.02.13.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 13:43:11 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add venus DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>, andy.gross@linaro.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1622647200-1487-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <134691c7-e939-879f-c897-befc4b71268b@linaro.org>
Date:   Wed, 2 Jun 2021 23:43:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622647200-1487-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/2/21 6:20 PM, Dikshita Agarwal wrote:
> Add DT entries for the sc7280 venus encoder/decoder.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> change since v1:
>  - added rpmh power domain and opp table.
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 4c44a52..4982f96 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -60,6 +60,11 @@
>  			no-map;
>  			reg = <0x0 0x80b00000 0x0 0x100000>;
>  		};
> +
> +		video_mem: memory@8b200000 {
> +			reg = <0x0 0x8b200000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -850,6 +855,76 @@
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		venus: video-codec@0aa00000 {
> +			compatible = "qcom,sc7280-venus";
> +			reg = <0 0x0aa00000 0 0xd0600>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +			clock-names = "core", "bus", "iface",
> +				      "vcodec_core", "vcodec_bus";
> +
> +			power-domains = <&videocc MVSC_GDSC>,
> +					<&videocc MVS0_GDSC>;
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "venus", "vcodec0", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
> +					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			iommus = <&apps_smmu 0x2180 0x20>,
> +				 <&apps_smmu 0x2184 0x20>;
> +			memory-region = <&video_mem>;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +				iommus = <&apps_smmu 0x21a2 0x0>;
> +			};

The assumption for all Qualcomm SoCs was that the firmware will be
loaded by TZ, i.e. the platform has TZ firmware. I'd like to continue on
that assumption, and propose to move video-firmware subnode into
appropriate board dts file, in this case sc7280-idp.dts.

-- 
regards,
Stan
