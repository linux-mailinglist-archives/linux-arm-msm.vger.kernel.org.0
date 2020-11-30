Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A61E2C82D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387492AbgK3LDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgK3LDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:03:13 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8C3C0613D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:27 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 64so15559184wra.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GVA/a06QRaXa5UUbFhiaFdgC4CC6v0BqUoUGNrRgXR0=;
        b=gf1sV6Jdnp0Ez0iXo7JOX6AmaLUkjXUth37Aatk0rPwIpGbjGhb+gdzyAmT1/O/o0b
         zBdyHSV8RmldNeao1x9pwHOvB++AzS/36BtDFchPtEClUHn8M/rbAyUGOP+oPAWlygju
         hYK0HA7eH3VZZ02OXGyXdfLc/KKSdGavKVtWIloNPP7f7LMq0p0zMf81Rt1lEYmJ9EgU
         xKox6cIwIz1J0T39Q9eSJrEsZTJc2dby/2cnnAwtKER8ArLLQOnNQu96zDtQLHnT6g6y
         /MIiWTxTu56ylJE2LblOlk84zKjWwbgIL45Hf9Csk599Mk9hP72Xj18aLK2eevWpDxtg
         102A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVA/a06QRaXa5UUbFhiaFdgC4CC6v0BqUoUGNrRgXR0=;
        b=C0TNMJ5EXgDpJEI1c6G1NW0ku4Q6c9QHhwyWOqrGpvlKCRXqhWFxiJGK0P/tuf82yc
         AJ8uCXFwC5Z4PzYmF4OKHpZcnyyReEjK7YDxf5WArw/zHiF2LGpEmRTCmPWE2Un8tzPC
         8iDfAPeZtzyRhv244TvSIjD6SvnysK4fojExSslI8EO18G1ZbJUVDXVy328+W0CGTc6p
         V55Drm5dpTz8hstZPIjGerR7MWN4Rw/UfrJ40Ulg1yoJInjvRzY/EeRAx1mWbAIqXc3t
         iWvYnJ7KIyFL2aengR/o4wrHdEJYRIhYDNCMcGM8HIqclfvnDtFdE23p4vCY+njnAdkm
         3OsQ==
X-Gm-Message-State: AOAM5300Svrq5Ix+j1jEpkmKL6yAKMAZnpqf81nQNhi9uVcsrNP9t5So
        02446yAGqW3+/7R/1VnQzFliSQ==
X-Google-Smtp-Source: ABdhPJyOQndQGBHb3QQLR2sTHvtw5ItpuGumvBpM8L9ehU/q/yOgm2ar7QCzRgGCtmpw6POBrZEwyQ==
X-Received: by 2002:adf:f888:: with SMTP id u8mr27083831wrp.381.1606734145961;
        Mon, 30 Nov 2020 03:02:25 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id f16sm23036731wmh.7.2020.11.30.03.02.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 03:02:25 -0800 (PST)
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S
 driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600450426-14063-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ad3221fb-4148-6457-05dd-3fece2677b13@linaro.org>
Date:   Mon, 30 Nov 2020 11:02:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1600450426-14063-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/09/2020 18:33, Srinivasa Rao Mandadapu wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add the I2S controller node to sc7180 dtsi.
> Add pinmux for primary and secondary I2S.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> Changes since v3:
>     -- The typo error fix
> Changes since v2:
>     -- The plement of lpass_cpu node is changed
> Changes since v1:
>     -- Updated I2S pin control nodes  with grouping common pin controls
>     -- Updated lpass_cpu node with proper control names
> 
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6678f1e..427a4bf 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1742,6 +1742,45 @@
>   				};
>   			};
>   
> +			sec_mi2s_active: sec-mi2s-active {
> +				pinmux {
> +					pins = "gpio49", "gpio50", "gpio51";
> +					function = "mi2s_1";
> +				};
> +
> +				pinconf {
> +					pins = "gpio49", "gpio50", "gpio51";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			pri_mi2s_active: pri-mi2s-active {
> +				pinmux {
> +					pins = "gpio53", "gpio54", "gpio55", "gpio56";
> +					function = "mi2s_0";
> +				};
> +
> +				pinconf {
> +					pins = "gpio53", "gpio54", "gpio55", "gpio56";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			pri_mi2s_mclk_active: pri-mi2s-mclk-active {
> +				pinmux {
> +					pins = "gpio57";
> +					function = "lpass_ext";
> +				};
> +
> +				pinconf {
> +					pins = "gpio57";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
> +
>   			sdc1_on: sdc1-on {
>   				pinconf-clk {
>   					pins = "sdc1_clk";
> @@ -3389,6 +3428,36 @@
>   			#power-domain-cells = <1>;
>   		};
>   
> +		lpass_cpu: lpass@62f00000 {
> +			compatible = "qcom,sc7180-lpass-cpu";
> +
> +			reg = <0 0x62f00000 0 0x29000>;
> +			reg-names = "lpass-lpaif";
> +
> +			iommus = <&apps_smmu 0x1020 0>;
> +
> +			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +
> +			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> +				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> +
> +			clock-names = "pcnoc-sway-clk", "audio-core",
> +					"mclk0", "pcnoc-mport-clk",
> +					"mi2s-bit-clk0", "mi2s-bit-clk1";
> +
> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpass-irq-lpaif";
> +		};
> +
>   		lpass_hm: clock-controller@63000000 {
>   			compatible = "qcom,sc7180-lpasshm";
>   			reg = <0 0x63000000 0 0x28>;
> 
