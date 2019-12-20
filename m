Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BC8127846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 10:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfLTJen (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 04:34:43 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41655 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfLTJen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 04:34:43 -0500
Received: by mail-ed1-f66.google.com with SMTP id c26so7605240eds.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2019 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NTB7wX7Yv4jCUuAve4vjjE5dVjsx/SPNfAjKddDNjGA=;
        b=TWfDrkroJVL91zz3SzoGgEFWBV+3o/1TdQOazPMUiXOyF7Eg2eG4497kjHIBTG1wG1
         Vtg9OucWHFlGksGjOf2Gt5/8N8d2H8mnaueXjfY4BwJ8gS9SywFmxOYLL9X7R8MOCXg7
         EUQcKbGqPWiu4iWnvubdiHlsj+dKARxxammH8DECs4J2kuaU8ljFoXdWPuY2iSLayoZ/
         jDf4IhT9dftLRZg0RrEKlzvh4KyVQoneyT5aQ0BIq3jUKdwXhK5l6Hn/rw8+czugI/EN
         lmuAL9WNlTiIujJApVDuXzwdgFVQY9qrWcmVz7hinUyhZMPT3nUzecYMczWBaW1kL9UW
         krJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NTB7wX7Yv4jCUuAve4vjjE5dVjsx/SPNfAjKddDNjGA=;
        b=aQbUTP4QDShs44fBv9fDunUHP3s/GCiHhsa0y/d7IVI/5oZmiwhW6DJBPrcRkF7def
         Mc39GwTDWBKlC7r1iFd4JFaK0QfuB3lMdv7+XOBXkN+LZc0K/r/e3TbC/G5H5C0iD0U6
         th81+Jl6WERArtk5B1lMHlgO+9t+9kqmap9Ih/5AS8yUtFtt+hP4XPW5Zm3mhdAyBHGP
         DfJmgadDuswPmz+MVZZgLkZFChrrJhaqi/1fPDz9/k2tiYlFngVsfK+PxU0+Sr2HHCms
         IMAzBbBdWVV1rOMRgfzk6p5PsIGotS1GlHwtJ8n7XwSvSsENZeQeGGX6B9Z6+Ql/B17E
         yHnw==
X-Gm-Message-State: APjAAAXR3Kh9YJI5ckfg22X1PY4FvTyAqGqyiGdIh1BFTLzIerjczLUt
        K+Iiw3TQ5QzzJo9hd3RoPLpOjg==
X-Google-Smtp-Source: APXvYqwtedAE80TQ1voCP5xx8obcg7Jzf+08DPEo4f2WFFFbsiXKKauQR9XC8bMXaXk+7XM4CFAmiA==
X-Received: by 2002:a05:6402:229a:: with SMTP id cw26mr7564061edb.69.1576834481632;
        Fri, 20 Dec 2019 01:34:41 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id c20sm867853edt.67.2019.12.20.01.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 01:34:40 -0800 (PST)
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
Date:   Fri, 20 Dec 2019 11:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dikshita,

Thanks for the patch.

On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
> This adds Venus video codec DT node for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6876aae2..42c70f5 100644
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
> +		venus_mem: memory@8F600000 {
> +			reg = <0 0x8F600000 0 0x500000>;

Please use lower-case for hex numbers.

> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1042,6 +1048,36 @@
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
> +				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;

could you align those entries to the first one (you can use tabs and
after that spaces to align)

> +			clock-names = "core", "iface", "bus",
> +					"vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0C00 0x60>;

lower-case please

> +			memory-region = <&venus_mem>;
> +
> +			video-core0 {
> +					compatible = "venus-decoder";

something is wrong with the indentation?

Please run checkpatch with --strict

> +			};
> +
> +			video-core1 {
> +					compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +					iommus = <&apps_smmu 0x0C42 0x0>;

lower-case

> +			};

This subnode should be in sc7180-idp.dts, because we assume that by
default the qcom platforms have TZ.

> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> 

-- 
regards,
Stan
