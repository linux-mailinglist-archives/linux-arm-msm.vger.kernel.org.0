Return-Path: <linux-arm-msm+bounces-1655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4127F5A82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 09:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67771C20340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAF51C291;
	Thu, 23 Nov 2023 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQ4CqHoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AF2F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 00:51:35 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso9515085e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 00:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700729494; x=1701334294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKrtQ46uvlnW7h0P5ani0UtGyomwcVmv5l1dbE1uIOY=;
        b=fQ4CqHoM3gc+qbVIktzg73/EzIsFqfUm1F6G4wWOG1qbSFTfKojIAt4T6dQw00BlVm
         07irPOMRUs/musifEQ1yrtD8q2U6JgYI6pS8aX6OO2cABOyyrhNNDazCdL825V9fe2/E
         gMXUdxrKDUpEyFNPNV+fTpVbaEQpKH0Na93f93X9CiYpLIx/4eXsu2iGrze4r+qyBEXt
         LcDFMjXkjwslw26m1QawkNi5YFyylXyVrcckEReHdC75tEBlkk/S3PxCsKdXU9XvCHra
         acZVBxLi73rVojYNaBEI5IrwpOxtAXNGwwyJ23wPdb/I+n2XmE78EAzE+oqwruzoO4oi
         XXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700729494; x=1701334294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKrtQ46uvlnW7h0P5ani0UtGyomwcVmv5l1dbE1uIOY=;
        b=rNwtiQgx4vvHlvRPBQTFTee5uRYeVD9yC3Ttuj0139PFLGbVfjehumRs/nsSBiQ0gz
         mdDsO9gxpImUkcBm9GjOlnx8S/iXTDlYAu4ADaFcdapWPOxoX3gT5WJPkLotTSjQgqIU
         LJbrXXppxZCil9sEqpLKP9JCiEQYMh5Z5wEdJdOlvVlAX4ap9WMyJnegvsNV3OJyM/Jx
         3u0nDKaqHt8k6yQ4MlMpe/DBPpIHzI7w/C3Rm+RFsIJobXqaKdtZkYGAwAAgd1FBhwus
         4eHyANshrcvUnVNQJFMX4+NlcSKS66r8pzMImETPoDa5n9BknZ6Fyn6t9AI6w7B3H0dt
         HC8A==
X-Gm-Message-State: AOJu0YxnPIL4mOJd8JxMAsMdqeO+xCLgRZ7cMHSsCXPBnQk9zNm0s3Tj
	NZJfmvfw9It3lSD8sXTcAeACBg==
X-Google-Smtp-Source: AGHT+IGKMG5ZPQH9o0fjf0YQKPxm9BMhc59Vi3H2A59VKUHWPCjYAXsm8/rND5ySqMBK0Hupa3pYxA==
X-Received: by 2002:a05:600c:1c9f:b0:40b:2a08:c45e with SMTP id k31-20020a05600c1c9f00b0040b2a08c45emr1599098wms.3.1700729494087;
        Thu, 23 Nov 2023 00:51:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b0040b34720206sm1236285wmq.12.2023.11.23.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 00:51:33 -0800 (PST)
Message-ID: <640523aa-6b14-417c-8a62-e02d17a26ce7@linaro.org>
Date: Thu, 23 Nov 2023 09:51:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: Fix hs_phy_irq for
 SDM670/SDM845/SM6350
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
 quic_jackp@quicinc.com, quic_wcheng@quicinc.com
References: <20231122191452.3183-1-quic_kriskura@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231122191452.3183-1-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2023 20:14, Krishna Kurapati wrote:
> For sm6350/sdm670/sdm845, although they are qusb2 phy targets, dp/dm
> interrupts are used for wakeup instead of qusb2_phy irq. These targets
> were part of a generation that were the last ones to implement QUSB2 PHY
> and the design incorporated dedicated DP/DM interrupts which eventually
> carried forward to the newer femto based targets.
> 
> Add the missing pwr_event irq for these targets.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi |  5 ++++-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++--
>  arch/arm64/boot/dts/qcom/sm6350.dtsi |  7 +++++--
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 6d9843d05cb3..b8888f71b1d6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1296,10 +1296,13 @@ usb_1: usb@a6f8800 {
>  			assigned-clock-rates = <19200000>, <150000000>;
>  
>  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +			interrupt-names = "hs_phy_irq",
> +					  "pwr_event",
> +					  "ss_phy_irq",
>  					  "dm_hs_phy_irq", "dp_hs_phy_irq";

New entries should be added usually to the end of the list. Commit msg
does not explain this to me why new entry is in the middle of the list.

Best regards,
Krzysztof


