Return-Path: <linux-arm-msm+bounces-49032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D8A40A3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 17:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C78420DD8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 16:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9341531C8;
	Sat, 22 Feb 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kfUqTW/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E412D758
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242728; cv=none; b=ZT2JboJSQzNdIeT0afv7hO6YBFKxfWnw+WW3H7cSmo+wXLqAKx8JDhdZeNhivHbP2IfUMliU9Dl65nSmOvUyUBefHU4txIoSNUbrgObZKm55P4aL7mzdzU5AZIpr9uEVcb73OJDoVqKIX/Ib4N2GkwS03q+Ueh9rkMvamIoqJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242728; c=relaxed/simple;
	bh=JXFsezySFMvH6dWTeipk0QmL7JcopcvOM6ol/N+7mjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK/Lc6YIZOlEAxoGhmHo/YErS6D8jCxeFA8ZAAN9da5OHqvD2yfuTnbRQT1Up6t933q2uIWvKOZm5wVVH9eoOzLBjVx+j4TBgJBDI41C/7UOaAK6UxsKNRbkvo3Lq93VyPWFwzVzc7y5CbPRUJFNJsP/CcL8DbhDyv/yHEl50Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kfUqTW/H; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so6299661a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 08:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740242726; x=1740847526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZEW2F8jhxjQK9Q9oSPPUZJG+m/4ROcwe0KKWOIKsKM=;
        b=kfUqTW/H8msq+2eH3LjTGu2tcmY+s3vp0m3rAX/IBWSsrPTVCaPf+6aOJ8UhY6nnvH
         +K5zfLAZoIRl8uyIfjNMoTTU7AZJJ0PmUjvAoysdSheT3GDZmnPLZtuI31iwxp/XFEp2
         P0/VMRdyeElF+n414RIOnM7Gh7S9r1xcNqKbNj+HjULJ6z0ScibGXTo/yzeS791PiRqS
         k3qyfUNsPbd3em7xvPFpT36NzvPf9wFWc3NdGdkAusSvHCQHsdm8ms5OLz6QS0GB5iSx
         UZ7JBqA1mllcNJY1++hdlibqCPtGCjlozIu10YTGXKG4lMyZ0Lr7oXFRBNXbgRE9XbrT
         yXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740242726; x=1740847526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZEW2F8jhxjQK9Q9oSPPUZJG+m/4ROcwe0KKWOIKsKM=;
        b=YEgg419DE2py1vCDSGmQcXvxLIhyMq5rxT5x7TidPnbPanDTwXSLnEXf23/uOQVo3k
         DVbm1yMxt86lw951GMvHXBrYDEzjeAGDzMcR2iJuVyR+XvdmLqf4U3tZuXjsU/GAIbPq
         el+rj5Y19u5SFEkR2lb3l0lutyTGr9lfiVPVGOxDrK5XcG31TqSjAAVY0Ajy0kJmP9H+
         7trMIo3L5fTx4vgW82SZIIiVoPytd37VNGxUQ7RgGLVU+Zaw97fKZIKHbMRpAWTCkpPP
         5UHIsqeLH6IAKtW9tO4UOwMtd5xwAPTCxGaFGn4LYflf74TtW2bPjHvLhAVOwugsHduj
         WdaA==
X-Forwarded-Encrypted: i=1; AJvYcCUi5P0as6vCDbftol/JV5NUNBWmu7ZLuHSXsYdMh3/Ltv3ZyQfFQf8zKPNY9jO7j7Pxfb61I7Miv0Kdkp/S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vEwCqRi9UUmfwdvYEQXQPLtK3VgoHGVfK62yQw3/os+bulfK
	0n8zDZilhTq44NLLUjD3vTXOa7WQmQXoolpb9pS6+CAbgv8OSb7DaaSLzFCkTQ==
X-Gm-Gg: ASbGncsq2ulhJdVG2VfRwMwsPDeK3dvW0XAN1kbANn2kami7PiqDOO3ou8K9jh8pFPJ
	YRLkENSHwfQRfUoyNAsSdCgp/EK8o9WHzu1pUHi6pQI6bHsNXMXVvm6yJQGO+ZbHDGUj5VL4GRk
	82GrwaNNSmYbAZgpFlfDKVozsEi945RNTnfWr3oXf7iyrVL4V3O+utU59IzMMVsfzRzQAsx3lr1
	x3mRIgcf5qoN6Z84/Ob/OtmvP+NSNeuSlvlljMApG6NgrXH8JuKrdlMH0hXfAToB/GiSAF+vDFT
	MU0skVHaDMrZlaXVJovnrSssyoodBn0NlViu2w==
X-Google-Smtp-Source: AGHT+IFefW7NdAtgrUtX0UD5D5oBiGvpdHU/yEEJULTisRJfCVMuYZyWxzWgJKzrin6iK0N9uqtPOg==
X-Received: by 2002:a05:6a21:394c:b0:1ee:c8e7:2032 with SMTP id adf61e73a8af0-1eef52f8796mr10968813637.19.1740242726067;
        Sat, 22 Feb 2025 08:45:26 -0800 (PST)
Received: from thinkpad ([120.60.135.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73440ea9381sm1325845b3a.157.2025.02.22.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 08:45:25 -0800 (PST)
Date: Sat, 22 Feb 2025 22:15:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: PCI: qcom-ep: describe optional
 dma-coherent property
Message-ID: <20250222164517.2qkzdwofgjdb4yk5@thinkpad>
References: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
 <20250221-sar2130p-pci-v3-1-61a0fdfb75b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221-sar2130p-pci-v3-1-61a0fdfb75b4@linaro.org>

On Fri, Feb 21, 2025 at 05:51:59PM +0200, Dmitry Baryshkov wrote:
> Qualcomm SA8775P supports cache coherency on the PCIe EP controller.
> Allow 'dma-coherent' property to be used for this device. This fixes
> a part of the following error (the second part is fixed in the next
> commit):
> 
> pcie-ep@1c10000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
> 
> Fixes: 4b220c6fa9f3 ("arm64: dts: qcom: sa8775p: Mark PCIe EP controller as cache coherent")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index 1226ee5d08d1ae909b07b0d78014618c4c74e9a8..0c2ca4cfa3b190b3fb204f0d7142370734fb3534 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -91,6 +91,8 @@ properties:
>        - const: pcie-mem
>        - const: cpu-pcie
>  
> +  dma-coherent: true
> +
>    resets:
>      maxItems: 1
>  
> 
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

