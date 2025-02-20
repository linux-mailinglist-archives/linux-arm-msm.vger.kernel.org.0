Return-Path: <linux-arm-msm+bounces-48606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E2A3D20E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6CA3AA481
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C961E3793;
	Thu, 20 Feb 2025 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6v6HZ44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F415A85E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740036073; cv=none; b=mlRfp2bA4Ew9b8zOIvevU1id+2oABOzs1Of3hRDxy75k1xoijysj9ya8zMQ6fE0AI7zINBoxVtIR6ktsn8gTZaQgdEHZ6bq/uUkxaTV/GTKSK363RD458qvrDuNXJvor85aRi4Gk5dYfEzT9ahQEIAMDFVi+bCFAQt407LLWoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740036073; c=relaxed/simple;
	bh=Bym1Bs55CLhC7Xty+/5TA4tLN9q86olDovzUIpCQInI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRKO78jJh2Y5rYCoRPOJJ7Ww4A2XVf9BqYGRIFJNv5FiTfDx6VM+J8qTWTZnqc4mFissf0kf3nnDqBBB+2bzFrWaxWZv5Z5x1ES6FHqJE/c+hoDcyd1QObFAit16ygdeXBDP9+71mMd84Yq8deEm7q9m1N7ktYOvaQhtrCRbC7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6v6HZ44; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fbfc9ff0b9so955285a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 23:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740036071; x=1740640871; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UBsm/I+a54tra3a5iBMTEq5y0nF/ygepot86NvUBme4=;
        b=i6v6HZ44J1CR8OJKLqaxN5nbWdOhodI0td5GtYNjKoUKjEFwLSHM6BRoZpQHekJ6t6
         jlRR5OiHNivcgCqWMxfwTADp/9HQW63QCb3oa1+2I++yUeBkw/WbZZRMOtixxnV/bBo0
         cafewmhZ0O6JD1MvfFF9r5fiVJw3OkyYAq4y6JNP4JmWxHb/zkb/RKvNjGocccNVO5Pw
         OEUajOt7fJWZkte7rNj5q6bmOcX9jriMs/3betSEESgmZE15qWcFw+DiFEShmzoD5P8T
         5wuOVEc9oG0Uq73X6QwYA1AZomT7pK8+3LFZr6KWSoP3vTNkxnNQnA9Tp3fv6+pyQuG3
         Vlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036071; x=1740640871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBsm/I+a54tra3a5iBMTEq5y0nF/ygepot86NvUBme4=;
        b=aZnogUfYko3yQ6J9vbyu6uZQA2r4YcP2btu5w7htz26YpRXrtSvKnxln2GfqwHnL95
         Col8lVW8GyCkoDSCPHM9+/+uiNWyijuqvf9zbbpfjE6WFzMdYod1HUAI7bCVq/qkbdff
         JHq2seasJqEwGrybvup6dqLnykJziKj9/WtyN/yIQFgj2KXquRBB3loJ18wAQTt+Z9x7
         X6VmvtQZPbw8gE/OHz3YTZjtM7D+Y+RfLYMe8I8UoT/8gkrQkuZF43seHQUQ9P3CMEwE
         9n8FTK60P7VHFjlXyVo6t6KY1voNUqI/VbCOy6jBg0ChVzxkJMaTp6InpIMPB0IsVAxb
         dNew==
X-Forwarded-Encrypted: i=1; AJvYcCVHH9NPxKiKCbeIWH4U9pA8nlaRt0nB0WHtthDdwdGAtTAeCXN14KqmydOzE2fzPvehpH72UtewMqeXvJhT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ByY6OtzkVR5CiPGOrA8GCy+oax1j4g2dNJJ/hY/wdHFSh7QK
	VbG0kFXyq+xHKXz5dB1AO1rRuOQ712i2+PMn24L/TzgJOBPEkyqkyTnO/G5hdw==
X-Gm-Gg: ASbGncuM8lB6Vo0NlixmcbbOpL2/ZDeW0OBx5l2n7qhKy/36dlRKN1rsgxEyq5azI52
	DzduLx/jJHTzufaIBUuDRli4Im6gKXnfuqvhr2APtLX4YegR8IlIhwhLEIBs444bjqZq11kDeY7
	TgIE5d5Wx2ElHU8aeDqUw8IBQaTtnam0LFruSd9DanAc099tcxIdp+VGqpJ3auidMxI8PfRH53z
	aRIxcjOmfoUJhS6dgDE2QWhWKlhvmV95weXEnevPLZphDgfRPCmWXeLH/aGmN9A8dummCqSDSxF
	wwUs3gxSxLmMx/DeYIh9/d3FwQ==
X-Google-Smtp-Source: AGHT+IGo13eihemjNhRVbN/TgufcZyz4jkdCJauWtThpeVP7VjKn/5bfJrC9AbtM3vE+LR7Mk6+u1A==
X-Received: by 2002:a17:90b:3e8a:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2fc41045178mr34700119a91.24.1740036071344;
        Wed, 19 Feb 2025 23:21:11 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc0ca14c04sm13594456a91.33.2025.02.19.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:21:11 -0800 (PST)
Date: Thu, 20 Feb 2025 12:51:05 +0530
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
Subject: Re: [PATCH 3/6] dt-bindings: PCI: qcom-ep: add SAR2130P compatible
Message-ID: <20250220072105.b3cd4w44pox7ko57@thinkpad>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-3-94b20ec70a14@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-sar2130p-pci-v1-3-94b20ec70a14@linaro.org>

On Mon, Feb 17, 2025 at 08:56:15PM +0200, Dmitry Baryshkov wrote:
> Add support for using the PCI controller in the endpoint mode on the
> SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 44 +++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index 460191fc4ff1b64206bce89e15ce38e59c112ba6..6e516589f0edb4dfec78f9ff5493c06ee25418f0 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sa8775p-pcie-ep
> +          - qcom,sar2130p-pcie-ep
>            - qcom,sdx55-pcie-ep
>            - qcom,sm8450-pcie-ep
>        - items:
> @@ -44,11 +45,11 @@ properties:
>  
>    clocks:
>      minItems: 5
> -    maxItems: 8
> +    maxItems: 9
>  
>    clock-names:
>      minItems: 5
> -    maxItems: 8
> +    maxItems: 9
>  
>    qcom,perst-regs:
>      description: Reference to a syscon representing TCSR followed by the two
> @@ -129,6 +130,45 @@ required:
>  
>  allOf:
>    - $ref: pci-ep.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sar2130p-pcie-ep
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 7
> +        reg-names:
> +          maxItems: 7
> +        clocks:
> +          items:
> +            - description: PCIe Auxiliary clock
> +            - description: PCIe CFG AHB clock
> +            - description: PCIe Master AXI clock
> +            - description: PCIe Slave AXI clock
> +            - description: PCIe Slave Q2A AXI clock
> +            - description: PCIe DDRSS SF TBU clock
> +            - description: PCIe AGGRE NOC AXI clock
> +            - description: PCIe CFG NOC AXI clock
> +            - description: PCIe QMIP AHB clock
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: cfg
> +            - const: bus_master
> +            - const: bus_slave
> +            - const: slave_q2a
> +            - const: ddrss_sf_tbu
> +            - const: aggre_noc_axi
> +            - const: cnoc_sf_axi
> +            - const: qmip_pcie_ahb
> +        interrupts:
> +          maxItems: 3
> +        interrupt-names:
> +          maxItems: 3
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

