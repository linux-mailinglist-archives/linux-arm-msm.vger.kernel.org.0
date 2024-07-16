Return-Path: <linux-arm-msm+bounces-26328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D850493261D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E27281C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A24719A294;
	Tue, 16 Jul 2024 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umfoXaB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FFC1990DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131410; cv=none; b=dGjWUJI4qFtuTNAtkHne6+hDBoHBo4bZxAvZ0SdV1bdIPaqE0DPE5YRAcCrF/CU2IQJGkuLl1bbFaPD9s9u05q5gDAX+puOcBKharvN1BTFhp4lM7NrJvgNDclQAElrah5mTVDqmHJLUqAkJ+6qc3cueu5dXfb+bQOEsYmKd8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131410; c=relaxed/simple;
	bh=mxky7Z35mYu8dOsmCPjLx3OpqGDfDGLLRBHm5XgFQxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geuhyroL7Gmk1uJ1m77xPrD/19oUXAR9clbIiektFS9jadwhvjpcD/HXtbwfeZF2jBg6P68iaBKtVbvJf3iAU6NMFg3cw97kVsRPMP3VJSC0XQMjVaUYx9+I6tE6+yp1csxpqN+Ivo5n9eCJ+AzNzfiZ79zykujevkbE4oq4wFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umfoXaB2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e98087e32so6481181e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721131405; x=1721736205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2b7CP/wU73MNXl1V9QJJzs2YC0XsPlI+HUf1xHPYiO8=;
        b=umfoXaB2yFa8LYHCw1l+miYESIIdoY308TivqoljPmCQxnj/f0yNV8obvkcxoJa0dd
         /H7S8vmoF7AMJ8ndJYInVxe9JRdAOEXupfrboH0FrZBlK6J4/tsC4qmCIsvZ1fxRrlnA
         NgESRP4+Cz9sC3kSmIK//tf3BAWf4g3i2Sg1lUVvg2p1vhLH06gnTorQrGzcF1JTdZ6d
         xTDS18EJPaMtHL+l+oTmwiqFjzdX6db2tGDzYOo/onwqiaHnqBQC/iWBRauf/pdU8iDL
         dExWuZBAZyeDXjYXBdhOq7G82RiWXzLVY2ngjLKlwR070MD6FX9v6sIaub71Tlogyjvl
         mUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131405; x=1721736205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b7CP/wU73MNXl1V9QJJzs2YC0XsPlI+HUf1xHPYiO8=;
        b=I3axcx9Za85ZmsrIRIfdYoJ7r+qr7gNHZ4RhueFubo9QoLWqZ63tJ1d9D8RQLiNj0h
         6w1BqQDqFDJgf8DMbbTHacLDDSO/O40ba9T279v9INQsEEYh13f4SMpHXDiZfGR2XP2I
         RMBuGBepNEucNREtulS18naxTtA5ln1UtK5KOBYlmG0sRD2vJiRbQvskJ/b8SQ2/HXsV
         AcjmZFsPmMJZX4tFHmgUk78z5oNj05bGXm6HtP+/00mfM0y35UIWugXcMDlzWNcuNhPl
         HZnAKmFI8Ym1narEaCYflnZhZbRHpl+80bFsP9FLdnyqV8uw1C+hlASESYMgHFTa0Ww5
         2Y2g==
X-Forwarded-Encrypted: i=1; AJvYcCVK6odcjwImfJUkoiLjs/0o5P70nGb3jJWG/Oie+YoKwDUBwob2u4xTY4v2oyueF64hEjHDrIETwp/+udv3Z2CfVxLE+c6Vyn3EoIghVw==
X-Gm-Message-State: AOJu0Yxt+Vu5ovYeTKkLK5WSOa3aUCIa/0nRY47xooYWERLWqUmgtoUo
	fxTQlvvs+ophzdoWM9fOkQY+TAOGzK3eCO8XBGs/ugx6HQmSSEuHwYwim2oWVKw=
X-Google-Smtp-Source: AGHT+IGYGqTgU5GXDT/ErWkLc2RaCe6gXE0v8od/sgqoKr/yVEl/EPpqQ3deVnUeRcsbcJkt+1QFFw==
X-Received: by 2002:a05:6512:3196:b0:52c:9e51:c3f with SMTP id 2adb3069b0e04-52edf02aa16mr1372224e87.42.1721131404853;
        Tue, 16 Jul 2024 05:03:24 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff6fbsm306042166b.167.2024.07.16.05.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:03:24 -0700 (PDT)
Message-ID: <dbd172e0-d7c6-4ecc-b8cd-1329a4b03374@linaro.org>
Date: Tue, 16 Jul 2024 14:03:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 2/4] arm64: dts: qcom: ipq9574: Add PCIe PHYs and
 controller nodes
To: Sricharan R <quic_srichara@quicinc.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devi priya <quic_devipriy@quicinc.com>
References: <20240716092347.2177153-1-quic_srichara@quicinc.com>
 <20240716092347.2177153-3-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240716092347.2177153-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 11:23 AM, Sricharan R wrote:
> From: devi priya <quic_devipriy@quicinc.com>
> 
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ9574 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +
> +			ranges = <0x01000000 0x0 0x00000000 0x10200000 0x0 0x100000>,  /* I/O */
> +				 <0x02000000 0x0 0x10300000 0x10300000 0x0 0x7d00000>; /* MEM */

Drop these comments, please

> +
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +

Inconsistent newline

> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>; /* int_d */

Drop these comments, please

(all these comments apply to all the similar nodes)

[...]

> +
> +		pcie3: pcie@18000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg =  <0x18000000 0xf1d>,
> +			       <0x18000f20 0xa8>,
> +			       <0x18001000 0x1000>,
> +			       <0x000f0000 0x4000>,
> +			       <0x18100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +			device_type = "pci";
> +			linux,pci-domain = <4>;

Any reason the PCI domain for PCIeN is N+1? You can start at 0

Konrad

