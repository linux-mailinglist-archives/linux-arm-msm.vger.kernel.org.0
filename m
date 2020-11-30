Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866D42C82D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgK3LDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgK3LDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:03:54 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C79DC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:44 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id t4so15529027wrr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8uQwF7bNbUvnTUbpsi6bUmw7b/9C+d+knKBrFDwWR54=;
        b=aNsH/ks54Sn1PO+IHFwM8TTkfbEo8PnmZ+cqRSPByDtawAkF8K/9L/61+5z8MdZDCO
         S2xTZXPOoyMZGeeuHQPcHCCyedoh5/FiiXsTQAw+FS/ZopYE6XYwfsRv4KlE8/Nxwumx
         HZeB7HzOMNHtp+np0frgU40UGa1MsA6X4dbNCMn0sJxrZUpA5eepv4u0/1toeMl615nA
         tkRcP0ic+4/Zi5v01bxzTePF/Wy28bJjUOFiY4hWahaEVyGZ59bxi86Zi488f7K8CKZr
         eh3oc/L0wa95Gc4ZbBsayIV6AKs8Oa0hHTcnM0jwc5NuUKDVz/iPEouAGRxnAmREbhJQ
         QLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8uQwF7bNbUvnTUbpsi6bUmw7b/9C+d+knKBrFDwWR54=;
        b=DUJbvUXaCR3L+UrtvYSsERlyFflob9sGnxDUMen6D1GMdXZVLxk6+RFxafDdTsitq0
         YeLnpmVsxiuGrqXOmwkyQv3ps6vzRlClQsUNPXRhlsw6RJQCGcQ5w9DndfUqKz9VEqrU
         KJMiC+68ufdPz8urglKgx0WD2JhxA37DiVwsX5v5H/NZjeB5BFdy7MCuMwmzyAiWI2Ip
         bo1Z/1gGaDBaqrz3Lcd6AWOrF9k1ul89TeMXP+bv9OKHb/73fg05JdKO+XEWklplHCjz
         GLeK2PZpDemk0p09GSfV8s//yPGUuw9yhBLzGxrhn9I8hJpFJH9ddbfs1P85VRgehyne
         Mdmw==
X-Gm-Message-State: AOAM531xxKzgZWAUz/wtyj+Qeuf6JaVIPoIlcokXb0WYdKNPRi7rLTkg
        IcQsBFTWdi1iVsIy9y+3JnTHkw==
X-Google-Smtp-Source: ABdhPJxDwE0sPTaQTg1EIUlldlISZip+Srnq2ICjF3uN6UgGz2N24+63xoZEKNrPafL2Qq44CJkfIg==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr27827306wrp.201.1606734163034;
        Mon, 30 Nov 2020 03:02:43 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id b73sm41400042wmb.0.2020.11.30.03.02.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 03:02:42 -0800 (PST)
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Update lpass cpu node
 for audio over dp
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
 <1601448168-18396-2-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <019306c9-8fcf-77c4-5f61-56c92bb8e973@linaro.org>
Date:   Mon, 30 Nov 2020 11:02:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601448168-18396-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30/09/2020 07:42, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Updaate lpass dts node with HDMI reg, interrupt and iommu
> for supporting audio over dp.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 427a4bf..802ea0a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -21,6 +21,7 @@
>   #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>   #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/sound/sc7180-lpass.h>
>   
>   / {
>   	interrupt-parent = <&intc>;
> @@ -3428,16 +3429,18 @@
>   			#power-domain-cells = <1>;
>   		};
>   
> -		lpass_cpu: lpass@62f00000 {
> +		lpass_cpu: lpass@62d87000 {
>   			compatible = "qcom,sc7180-lpass-cpu";
>   
> -			reg = <0 0x62f00000 0 0x29000>;
> -			reg-names = "lpass-lpaif";
> +			reg = <0 0x62d87000 0 0x68000>, <0 0x62f00000 0 0x29000>;
> +			reg-names =  "lpass-hdmiif", "lpass-lpaif";
>   
> -			iommus = <&apps_smmu 0x1020 0>;
> +			iommus = <&apps_smmu 0x1020 0>, <&apps_smmu 0x1032 0>;
>   
>   			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>   
> +			status = "disabled";
> +
>   			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
>   				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
>   				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> @@ -3449,13 +3452,13 @@
>   					"mclk0", "pcnoc-mport-clk",
>   					"mi2s-bit-clk0", "mi2s-bit-clk1";
>   
> -
>   			#sound-dai-cells = <1>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   
> -			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "lpass-irq-lpaif";
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "lpass-irq-lpaif", "lpass-irq-hdmi";
>   		};
>   
>   		lpass_hm: clock-controller@63000000 {
> 
