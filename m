Return-Path: <linux-arm-msm+bounces-26329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9C932620
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72CA1F22C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69919A283;
	Tue, 16 Jul 2024 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vV+ARGmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC31991C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131438; cv=none; b=ZHckBSdEdJw1l1WRUkWKljqWp7Tra1UWkxcL9sIT1oskDXRukIwcX8QeHIUUvDONsHuCxch3zEZDHfANiYPYrxqSF0v7ldxOUda0v6u8SrCyIiuGCPvsbXl4nwTPnC5rD+OvRH0csB3UM3WesjEgzKdNG851SH73jyF/CEOrh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131438; c=relaxed/simple;
	bh=FiAWa9ysA8IHGBkZ/sVM5i6Z5YPVY1wPig5xQ/vaf8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHSwz3WrQDbqabVMsphG0vCZM3aXZkPH1MAwr5SQrqxuGzdSBglbYaizAnSyJa81+RavHH4xrYETFLcWTnqgg3BKU2jQSqHWPYNWtiKGRJ6+BC/2J5gDhR+bgBz4CfA/0uJgJoDU3ojArQNtj718jDFj6jYPxacMsjGLWp83DyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vV+ARGmW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77c0b42a8fso977719266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721131435; x=1721736235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nkIN+7ZWUbUHdQAJ/I/yly85sJjw4bIh4ZdfyWabNqQ=;
        b=vV+ARGmW7CBcHZArTqrszXBrGYldPMnNUvv+fRbXXn4WwOD3bJFHCWUH6rtfxEW+30
         cIJttq/CZqaspP5InBssKCCrOJECL729idg2eyKYUOsaMLCGSQS9zjj6Uf71MSwPJFxx
         FmejdtP7L0vxPZlvmuW5MHcfl9TuYeNlcibvsoWAH6YSeyKJ8uvfoP2DG/X/OV9bq8ql
         jN6qsy/omHvBn7QdhCfbiNvE/L3mPm1iU7PuicBaPpFTExeL1/E1kr5/zg5aOQhkIoll
         XscKFhWLoyAQoFgTkakrfokW502SbNz481g9wMRXcxfx9SfyjS/jfkrmZ1xQPdsizQtI
         +0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131435; x=1721736235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkIN+7ZWUbUHdQAJ/I/yly85sJjw4bIh4ZdfyWabNqQ=;
        b=NaD/TlpArHxFn01h7wmujDMtnSsKlycAy6tyA1HmoIbCzWzrv86+9Tzyb8h1AkY9m3
         37gPOZWH9Eu7tfn4szA5iD+z45tn4ntHfXtV1M2mG91Q0Yz1HXRuE0OLqwBuJ+bK0OmY
         qsNry/SmMvUzjmRAOCrqJa7KGfqTo585eOuWl82+FaLFCFbDF43pUAe2jh7VSX6lxPBE
         L8Ew6jx3WYhf0G8B2D821XsvhSHfNSYd0xVTGZFfu8ewTvFHTtvZdw1PhXRnlVBhcAV5
         Cgle5/9lsrnMYh13h0s5VixThA5nZmmzu+v+eYfcC/YTLJoSTB0x0Q+hfrYxrZlswfCf
         X9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7dY7htFvDwsneOrqQQCTVo+vCEsGEePZgVv/cgnYkiD96x2x4oEaSwYsqJ4o7CqULPXPt5bp3xLjYMdL51CXlccy6zevJo7N1dR7nJg==
X-Gm-Message-State: AOJu0Yyp9fKgStM3SAqYsUNmPvuWcD1TjizGhQ+Vo8yqDmO5UEuB36FA
	7eyqWMEjsGkp5hjVlg9GGFDXViPdbwdbHiYuQ6/gVogKXh4G5XOiYDMgTRApq1g=
X-Google-Smtp-Source: AGHT+IGOe1moPDB3urAhFSVPD48dZrMgrXPMDfnOvokDzYCTYKpWB90h4pfYNZcfXiavJQM6MKFGvA==
X-Received: by 2002:a17:906:11c5:b0:a77:ba4d:a4ea with SMTP id a640c23a62f3a-a79edc10ff9mr151713266b.23.1721131434453;
        Tue, 16 Jul 2024 05:03:54 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a344fsm311225066b.14.2024.07.16.05.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:03:54 -0700 (PDT)
Message-ID: <14f9f29c-2762-462f-b733-cde6a103b509@linaro.org>
Date: Tue, 16 Jul 2024 14:03:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/4] arm64: dts: qcom: ipq9574: Enable PCIe PHYs and
 controllers
To: Sricharan R <quic_srichara@quicinc.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devi priya <quic_devipriy@quicinc.com>
References: <20240716092347.2177153-1-quic_srichara@quicinc.com>
 <20240716092347.2177153-4-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240716092347.2177153-4-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 11:23 AM, Sricharan R wrote:
> From: devi priya <quic_devipriy@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes corresponding to RDP 433.
> 
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [V6] No change.
> 
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 113 ++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 1bb8d96c9a82..f4b6d540612c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "ipq9574-rdp-common.dtsi"
>  
>  / {
> @@ -15,6 +16,45 @@ / {
>  	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
>  };
>  
> +&pcie1_phy {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_default>;

property-n
property-names

please

Konrad

