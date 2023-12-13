Return-Path: <linux-arm-msm+bounces-4503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2C810B4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 08:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5441F21135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 07:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F1AC14F;
	Wed, 13 Dec 2023 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdKf1x8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9D1D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 23:17:04 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1f8f470903so440557266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 23:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702451823; x=1703056623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbI29hN0MRs/ULrtjzAshzwAyu7DKD+fBjVTXyykoSY=;
        b=xdKf1x8Vu5bIDsF6blsS8bwyt6NQlxCTlWKnFssiletcOTD6W78Wo7W0L5sJcKHJog
         Api4xlwSyzo9ThMxJNobYQJV5+r2DlLkAA8QRwHPhIKc7b3hAl49AkS/Dhs+sKLyISX/
         4Rj5t92+QUt+OJip8VsSjmESdCm6b93zM/KQk/ZgZT0+zkcCS4YL0GPm1KFAKrMWXJpG
         23ZrvTnIHkFMEED4JAbuEcgc03tmUmwhdIib6PQ8wgGPxf583OdM2yCrpCydbagBSkl6
         aKcWZUDuoJFaSig4cfGKrfQHvmXa+JfL/3eMhL7Zg0jMJKPw8K4eZPbntulIvqC4qr5Q
         U2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451823; x=1703056623;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbI29hN0MRs/ULrtjzAshzwAyu7DKD+fBjVTXyykoSY=;
        b=aKuvvoDQE1d1QEwXbfkttoRrsx+CUciRpjAMAK3/61pwyOJwFBZBLZtazf/+wHxFBq
         mhrWn1Jl4Kq9izj0gaVKFoc+ZUKnw2hMexcy5U5l3zCa3teZuaZRNPZeZfZKuoalpxhO
         U3nZ/xSxa1GRRSSGZBchxPIFUObiTkuRJmKfPhNMPOEycSrFCPITJx6MCRgwDIbTvYtM
         bTKiD8NZHNM3d6Y6I5j3QBbzxZYnRRTfPo7qukr+/3FIHnb78xHe3DkYAIUjLWA84GFn
         Yq6D2JBCXluugbkFRBi9JZyMnZhWl8rWv6WrdFqa9A2IJ4AhzPHpyAgYX96tHc5A8D3y
         iBpw==
X-Gm-Message-State: AOJu0Yw8yvN6Q6dR/tbUVTJuan66TREe3aUroB5v08Qac/1A5CrYS1r6
	YbFTEdotAO7+LcyAjz69H46gJQ==
X-Google-Smtp-Source: AGHT+IFslMYuBdeMTycTM4nxfMbVWt5MWAvRc8eJnO6gBhXVkQAszfSN7QMQO82ijfr/dbv3yCX3KA==
X-Received: by 2002:a17:906:c30a:b0:a1e:26ae:3ac5 with SMTP id s10-20020a170906c30a00b00a1e26ae3ac5mr4427537ejz.39.1702451823049;
        Tue, 12 Dec 2023 23:17:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id hu19-20020a170907a09300b00a0ad580e1b6sm7196336ejc.48.2023.12.12.23.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 23:17:02 -0800 (PST)
Message-ID: <af3d9ed7-1807-48e6-b8cc-c9d3f6d59136@linaro.org>
Date: Wed, 13 Dec 2023 08:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20231211121611.6765-1-quic_kriskura@quicinc.com>
 <20231211121611.6765-2-quic_kriskura@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231211121611.6765-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2023 13:16, Krishna Kurapati wrote:
> On several QUSB2 Targets, the hs_phy_irq mentioned is actually
> qusb2_phy interrupt specific to QUSB2 PHY's. Rename hs_phy_irq
> to qusb2_phy for such targets.
> 
> In actuality, the hs_phy_irq is also present in these targets, but
> kept in for debug purposes in hw test environments. This is not
> triggered by default and its functionality is mutually exclusive
> to that of qusb2_phy interrupt.
> 

...

>  
> +			interrupts-extended = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +					      <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +					      <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "qusb2_phy",
> +					  "ss_phy_irq";
> +
>  			power-domains = <&gcc USB1_GDSC>;
>  
>  			resets = <&gcc GCC_USB1_BCR>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index e7de7632669a..29a6f9ad3df3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1118,9 +1118,12 @@ usb3: usb@70f8800 {
>  			#size-cells = <1>;
>  			ranges;
>  
> -			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq", "ss_phy_irq";
> +			interrupt-names = "pwr_event",

Please do not take this patchset till we resolve discussion in the
bindings (shortly: "I don't understand why pwr_even has to be put at
first position, causing re-ordering of all interrupts").



Best regards,
Krzysztof


