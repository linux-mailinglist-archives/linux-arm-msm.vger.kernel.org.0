Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4338F143CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 13:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgAUMa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 07:30:57 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33264 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgAUMa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 07:30:57 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so2828374edq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 04:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jNbiAMxqqOj55GSDQKDWmBh++d71tG7ldeLAk9zmd6A=;
        b=UoarV1BVm2Btqxccp5b5Ri5nQVCi4Ed1USfuvenRzygLxhAnESncPto4TO3kZatVli
         QJA3MCg+PyaCkzLmTwafsRywirHdNWFoQxU1wuHF34s95eo+ODIJNmBeU67HHB9UdH4b
         1WJNGQAtjgmvSTg/+Y26fXK2c56Szm+bAp2UvGxtHky9FxucphpRDNM1F4BnTP7mRhbP
         sbsi+STGoHLSUFCC6Z9bfVTtE/tMwSEzGW9UFnrs1V07S6DwMcBEOOS590K0Jaqg6Kwy
         CfeyldwuK79EoSWeqzGv1fQ1qSlfbLqN3ALcxWqca3eywyApnMS82jIPkP0Dl2X9pGwJ
         RhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jNbiAMxqqOj55GSDQKDWmBh++d71tG7ldeLAk9zmd6A=;
        b=Lks+9JqssHETfl+3i9q9rDjMdQ47d+906hEaDtr226K9F9btVpC4yqm9ViKqBk1Uvy
         Kmm3yjdt+h+AskdByd9T8KzD1azt5oMcT83yivk89qNZ4+UarfRE3bYQL4zdJxjqN30Y
         1UpgW060hx5ZN+XghujfzyDV+kRrHU6g3Xp4K6WXYqDWOs+r1y9+13l/OSgeq+Q0yroq
         y7de/iW8RTv3BXoUoLflYFTV4y4n8KPaj65y16ck2IanhszJKRRrxtdYccswsfKDAfC8
         pl3Qb7cVb7fP/VLHU3Tlbub7KQzo8FPL8RQk0S/pjUtuXnzER47d0900ANBoEItfrqEl
         v0sg==
X-Gm-Message-State: APjAAAU9kD+rIaMYqaSZCkpbeXeRTx07/pMd1FYw5TxoILkGtWEBqfQv
        qWnhUZGBi5tPp3Y4b9mgD6Danw==
X-Google-Smtp-Source: APXvYqxOZnZWPEscqDETn75LsvLIexfMmx0NUCw7dFoO8A8E4cUz1jWb7ytPgjienQN4l3NNB7qxjw==
X-Received: by 2002:aa7:da13:: with SMTP id r19mr3580963eds.188.1579609855545;
        Tue, 21 Jan 2020 04:30:55 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id t1sm1277494ejg.32.2020.01.21.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 04:30:54 -0800 (PST)
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7180: Add Venus video codec DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <1579006416-11599-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <fff8744d-05cf-f7a3-6d1f-78111fd85deb@linaro.org>
Date:   Tue, 21 Jan 2020 14:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579006416-11599-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 1/14/20 2:53 PM, Dikshita Agarwal wrote:
> This adds Venus video codec DT node for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..6ecacca 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -66,6 +67,11 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		venus_mem: memory@8f600000 {
> +			reg = <0 0x8f600000 0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1043,6 +1049,36 @@
>  			};
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +				      "vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +
> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> 

-- 
regards,
Stan
