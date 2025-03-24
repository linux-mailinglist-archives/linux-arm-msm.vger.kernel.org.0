Return-Path: <linux-arm-msm+bounces-52282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA508A6D57A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845CD188CEFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E65F25A2BC;
	Mon, 24 Mar 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjgUCvOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2711F4CBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802787; cv=none; b=pmnGkT7fOQpNq+J5Bt3wl9FaPbCsWV8JxCpgijMXAUYrjdR+rvOyCAyljlbsW6PixE0XVATEgnVd+XDYZTHA7H3zDPE/Mw7cEc10LFMQh9mK3ed9091hLi1NI0DlHNtPpJ4vVxJhRrCWt9BTSqaDMO7P+dMBax5i7XBxjMgxLlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802787; c=relaxed/simple;
	bh=4Ea+mxTlq3Ce/OhMKbQU/KOrj+GAvnVEVIu2gZtDLPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux3Daxi8ynuFz2GMEVqhJ/GA+LjQ3j0aHA/Lwjvd3x2sMLoFGSBDNaDk6HRX/03BtG3iEcPQmohEjQMfJOg+ak8z6tarXats6Jw/YC6poL9EfWZO8pTPHfnLNnBKr1x9CthWI8U5JcNkCZFLIoq5ii4jv3H7AhNZzy8VbckxDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjgUCvOc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225477548e1so70444315ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802785; x=1743407585; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pb0coG8ELzx5NL39dsEd5n2HDvAmuNrsLf2r8J2plFk=;
        b=bjgUCvOcCu9+XvK1UCrl6iAAW30Sc1tTagzyq5T821wVV7cyk+nuLE3I9OsjGFmUFh
         yq3XzMtfElpkb0s7R2RgxF/hh9SAr8k+1ysC39RsmkA1Hnm91C3K+Bq7agkKuMWhU6Xs
         9nlsBMhG8zXP0SyONL8WYglj7AFdw2Ax3m0Q628BSSAH3qNjIcz17SH1+XyiOXOxd55m
         qiNkQFY22ETtyqwdf521GWaHJtaXmzRU3tCP3kaUYUk5JbF8fd/5i4Vp/jGrqefMxTOq
         Ds7VYeyg/x+l139LkWljqfakkMoVkUqJSu5qFDKHZV0idoRWfOU3rGNM4aEFm26J9/Ml
         xmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802785; x=1743407585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pb0coG8ELzx5NL39dsEd5n2HDvAmuNrsLf2r8J2plFk=;
        b=UBehHKEsOKGc0VkNlon3XYAZrNeT1EiWQSbtPmw0SnwgWfNizyzJaaGi6n5vWSvRO+
         rT6MXX172kk3vzE79/BVYx33qULmbadloJnTRPKnFIScpJeHN585HIHE8QA0C8e/swHk
         mxXmS0KrT9dS/uQS0XZ+2MG6ZVXFVG0tqJod9IqCN4kkXeSbDuhnGOfsZvMK729jE8xP
         eVq9luUrnJ4WKY1udD/hy8gJXOwnGv27IlHapz0vfP8uEvpIoVRZxeNeZTI3aAFW+bIl
         wNHSLv6gEfzAu8lcM+0TQIJQz1lMWRG/JG+BIKF7CwXtiTXIWmLlipFDQVw0NsTTVex6
         Osfw==
X-Forwarded-Encrypted: i=1; AJvYcCWZZEmrcyitf9ktOi/domkBgUrWOeXJVBZylLM6WcDUtpNAs7HN6FIOuyP34kUSjnkELyQW+QulmyksoWUo@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsjD972pV1CTFxPg0C+LaBQ4rVx673vraGb5UveRvww1RSFSt
	mhRQ/paDdOUHqYKbtDZ7GGeBlPGTXIhss1s2sS+/PPps3TNYrcYbbPCJldU0yA==
X-Gm-Gg: ASbGnctV/dFZ8P+nmbfZJ2Eufe+TugEGXGf1Xqx/YshOqmmtfm1alBbjfsv16tFW7m0
	9RotXOT9ZjDygLHXOLAgHsaKKBUgsT2CD1EHMGWmtWR3pmn9cD43K2ZvWGUyZlek+RjQPjS+ZMp
	mVfJSfd/l9Q7sRVykK6RRp1nibI0rLeHFg+6ObgIopT38mJwk4xPnRAU+89BVF6iTh6UHrc1iiT
	At/D2omQbhJh/X2fxYItwLOlr72lY/HahusHrzKuF6dxU8ykpwGFkTUGb+2bGJvROw9hxwU7qBb
	iuKgnbYiiI/Uhw1cOruqmHDRddo8Wb76EusXCVvvcJt2HD/9MuZtUwJF
X-Google-Smtp-Source: AGHT+IFuvV2cV8WX5aMgqIPZN8PMDNislgN7gD7Fd0kyz13UcCKy/E1fYKahvWMm/QdrilzlKJE56w==
X-Received: by 2002:a17:902:ebc6:b0:223:39ae:a98 with SMTP id d9443c01a7336-22780d825c4mr224115485ad.22.1742802784591;
        Mon, 24 Mar 2025 00:53:04 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f9a68sm64496325ad.241.2025.03.24.00.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:53:03 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:22:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	20250317100029.881286-2-quic_varada@quicinc.com, Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
Message-ID: <uenisk2rrlx5sh6xagd7texx3dpxyav6yxpqxmk3fcdq44vb75@tk3pimdajilb>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-3-b7d659a76205@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-ipq5018-pcie-v6-3-b7d659a76205@outlook.com>

On Fri, Mar 21, 2025 at 04:14:41PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add support for the PCIe controller on the Qualcomm
> IPQ5108 SoC to the bindings.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml         | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 469b99fa0f0e..668ff03f2561 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -21,6 +21,7 @@ properties:
>            - qcom,pcie-apq8064
>            - qcom,pcie-apq8084
>            - qcom,pcie-ipq4019
> +          - qcom,pcie-ipq5018
>            - qcom,pcie-ipq6018
>            - qcom,pcie-ipq8064
>            - qcom,pcie-ipq8064-v2
> @@ -168,6 +169,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,pcie-ipq5018
>                - qcom,pcie-ipq6018
>                - qcom,pcie-ipq8074-gen3
>                - qcom,pcie-ipq9574
> @@ -324,6 +326,53 @@ allOf:
>              - const: ahb # AHB reset
>              - const: phy_ahb # PHY AHB reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-ipq5018
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: iface # PCIe to SysNOC BIU clock
> +            - const: axi_m # AXI Master clock
> +            - const: axi_s # AXI Slave clock
> +            - const: ahb # AHB clock
> +            - const: aux # Auxiliary clock
> +            - const: axi_bridge # AXI bridge clock
> +        resets:
> +          minItems: 8
> +          maxItems: 8
> +        reset-names:
> +          items:
> +            - const: pipe # PIPE reset
> +            - const: sleep # Sleep reset
> +            - const: sticky # Core sticky reset
> +            - const: axi_m # AXI master reset
> +            - const: axi_s # AXI slave reset
> +            - const: ahb # AHB reset
> +            - const: axi_m_sticky # AXI master sticky reset
> +            - const: axi_s_sticky # AXI slave sticky reset
> +        interrupts:
> +          minItems: 9
> +          maxItems: 9
> +        interrupt-names:
> +          items:
> +            - const: msi0
> +            - const: msi1
> +            - const: msi2
> +            - const: msi3
> +            - const: msi4
> +            - const: msi5
> +            - const: msi6
> +            - const: msi7
> +            - const: global
> +
>    - if:
>        properties:
>          compatible:
> @@ -564,6 +613,7 @@ allOf:
>                enum:
>                  - qcom,pcie-apq8064
>                  - qcom,pcie-ipq4019
> +                - qcom,pcie-ipq5018
>                  - qcom,pcie-ipq8064
>                  - qcom,pcie-ipq8064v2
>                  - qcom,pcie-ipq8074
> 
> -- 
> 2.48.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

