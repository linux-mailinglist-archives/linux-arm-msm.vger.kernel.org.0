Return-Path: <linux-arm-msm+bounces-39201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440699D97B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 13:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03F09285F1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76801D4340;
	Tue, 26 Nov 2024 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivDdYRNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034671D362B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732625736; cv=none; b=bWc/6ZlUzFHa8hBTvf096IsO7eJSu9zf50BpwTBsEWbMHoabdivcZ6Es/OsbxrJxdWDIFg4umldCcQVmDLrkd1dyaWDjBUVbYi3EB9fM+yMlr4JOBTw0YM1savE6rST5i9tSZzpMA7BwCNgHkgx05fsdXJm+3wVFa+IItLr4Zes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732625736; c=relaxed/simple;
	bh=9KXr7AbiVY0zvbMwZlgTleik7dr4fS49x2BJO7VxRJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLf4qrSsiNqLDPRRLz3NCYgG0XASeWPdqs2OZWC2R3YQpTi2euU6m8JvWE+ge+uXJs3PIwtdMpR5LR+zj6EM25m11D/bQDmqf67EOCbabDIn0w07s2Nui7Z2RvIlNL4pm4YMqzuMVaZ7FdiyhEii+hSGBnhjnX61H7JBIP5CcDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivDdYRNH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21285c1b196so52180285ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 04:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732625734; x=1733230534; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUr5lyVbb5gQlX0mhUZzgRyRJmfBfmNBILv3yhiuJ5M=;
        b=ivDdYRNHgSBzT82Erqcq0OFVUAHuD9/audsaPluiolPGNxOeIyKnGUi2w24ZBsHyIr
         03DEM773SL1uNX4RC+zcPGjho2PqsvJnzgGnGMaG1YmApIhXFDNrOLgqfSjxp4b5D4i3
         55VhwplytKz5B+6Irl5azFKCGZJqvXESBtR/F0juh7RbwcYlyp8O8p2y4Pb7qrcQOVBq
         ntdrPDgm+eOGSIATfB/lRzFC8eAyFMQqMrNGpny7IChmEpT8Bdj2LslXmYRw5JH+qsja
         Z0OiExIi47jq7+ZBv+B9ChlZpkqvOz0Vhx2wpXM/9dX/7atjFGccNF83gzuD8CMYbPVo
         P+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732625734; x=1733230534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUr5lyVbb5gQlX0mhUZzgRyRJmfBfmNBILv3yhiuJ5M=;
        b=ODDxCklR2tFvuqJQhyiS2M3bHKh7u3Xl7p85dju+OYvFV+bKc2gpyb9EM+xX30Qxzo
         XUsK8IvW0v5fkH46WJ+uLZnLCGE9HHIWLpHmSFqYKPKMTDnBNDoGd/SyY5JmPcZc93BU
         lz5h69RPz0GIwON+P3nc3MO8b9lB/46BgaSOznguXZbo7A+aRsRpMqwZvHgaGtLrGLcf
         tXjORB0kNoUJgXkI/Y4ztpuVRRGmjsRaRxS+czIHVVPSt7EzHcEDNbp580VoTuPBVyZ6
         v97H9XMRSUYCZezbSbNiPFmo7CbnF8H3usxT5yL9hBhG8d/I0jMN4ih0aegQfypyfhVp
         bf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNO/Ue2z6gHaCXotTwk/c3GwIzPysfM/aaOjRGEFOlA4mofaPMhOiBY+uJ6xhkAICE/x5C2nyfbeLejCRQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wFQxMT9516KSn6/7lcjn1NaZIHEfR/FyDc/ntiDdZDCpsQaq
	mdVjQg0eeILTQh0lDKAh66H+N91lTvbrTTT2I5UAyhw06CNUxZDir3eFI78DmQ==
X-Gm-Gg: ASbGncv9GyqtXr/QMYJhGr2GX0xy+X/o0+ahKcYgUDWV1+i3N8tW7rsr5WpTHOlU3+U
	X/ePumVEPU8Px0mM/g+I1zPYO4nTzfrtQsPTia8F/NtCQXHoU6nQg23/Af2PWiCkr+ehMuctSUG
	71fXyS54abW9MRp62vT7YpEPPMc2QPSm/UuJyzb6SNcHL3L0p+d0Ekvm2H22ldsWTllEgQQ/4dd
	Aq4VIbZlwseyiq4apBlMiYrXgyuAPgMgNMjF8UExopLRderitf8vZHYApvD
X-Google-Smtp-Source: AGHT+IHrCgm0ZINmmLGWB4ath221SzU4W16KTASI5fzqtXqRE4ZMdLLEhiFsxCwjSxGKVNfUeMvFDQ==
X-Received: by 2002:a17:903:41cb:b0:212:3bf9:951 with SMTP id d9443c01a7336-2129f65c825mr197704755ad.6.1732625732916;
        Tue, 26 Nov 2024 04:55:32 -0800 (PST)
Received: from thinkpad ([120.60.136.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbf97a8sm83693185ad.152.2024.11.26.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:55:32 -0800 (PST)
Date: Tue, 26 Nov 2024 18:25:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: PCI: qcom,pcie-sm8550: document
 'global' interrupt
Message-ID: <20241126125524.cnlvop5gf2zyreu5@thinkpad>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
 <20241126-topic-sm8x50-pcie-global-irq-v1-1-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-1-4049cfccd073@linaro.org>

On Tue, Nov 26, 2024 at 11:22:49AM +0100, Neil Armstrong wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPU. This interrupt can be used by the device driver to handle
> PCIe link specific events such as Link up and Link down, which give the
> driver a chance to start bus enumeration on its own when link is up and
> initiate link training if link goes to a bad state. The PCIe driver can
> still work without this interrupt but it will provide a nice user
> experience when device gets plugged and removed.
> 
> Document the interrupt as optional for SM8550 and SM8650 platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> index 24cb38673581d7391f877d3af5fadd6096c8d5be..19a614c74fa2aae94556ae3dfc24dcfcd520af11 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> @@ -55,9 +55,10 @@ properties:
>  
>    interrupts:
>      minItems: 8
> -    maxItems: 8
> +    maxItems: 9
>  
>    interrupt-names:
> +    minItems: 8
>      items:
>        - const: msi0
>        - const: msi1
> @@ -67,6 +68,7 @@ properties:
>        - const: msi5
>        - const: msi6
>        - const: msi7
> +      - const: global
>  
>    resets:
>      minItems: 1
> @@ -137,9 +139,10 @@ examples:
>                           <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>                           <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>                           <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>              interrupt-names = "msi0", "msi1", "msi2", "msi3",
> -                              "msi4", "msi5", "msi6", "msi7";
> +                              "msi4", "msi5", "msi6", "msi7", "global";
>              #interrupt-cells = <1>;
>              interrupt-map-mask = <0 0 0 0x7>;
>              interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

