Return-Path: <linux-arm-msm+bounces-8954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E545B841C2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7930A286033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7986B3F9EF;
	Tue, 30 Jan 2024 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+UghyA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987B3F9FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597589; cv=none; b=BVfhGxQz4dban4QZT9ATugCt8VKOnNon11eAoS6aAEQefz03ucVUm1Gr0QkTSPdnvGvf1hTEVkaflYR8ojQr7SlbApz2KaUN8xnuMeY3I3v5C/ij/QRk3WAjFgjM4pnpvrJ1+OOQ4HTmwAjjg2M8Gj1IJXGE7ue/xrDl6GBL9tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597589; c=relaxed/simple;
	bh=Uua8AEJpGWmpkqTiwzFsY8wXVc9KJY6aZ72D91JKadI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdZI/8ekQfD3eShr/ADWMc5G1jTJJuQ7afM/Er3MwlcYCwosfqTU9lHQ0yqQkJd5bEpxJpjiIRDBBj9asy7eN1un0qS9xq+B6XSuS7wNhS6gUcTVvfgE84D7M1wpyrGo9xGHjQPCDqTC+5G2GGVnDI3AFk5fadZhEeLKBoDIMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+UghyA0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2906773c7e9so1801444a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597586; x=1707202386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HBYeRPxem/erlBXPgzZrx2qdN8I83pDKmoAAgmzuOtU=;
        b=e+UghyA0c46HGxDNp5VB2PnBJRcPC2YBoPjYeJMz0+QTFSGcfuL58BJIW84euopFze
         JnPrb5YPgw1Bn9buSgANK7Lw+I6a+I3Va+KWjIzYumbTyOD9KSfMEh2cP5UGeIjd2soM
         m/NC/lTrUQCf2k6uLVGiS0fbCMMqpRlJluSYnL3Xe+PnCX4yyk7IyfIRlI7Dd7fgnY1g
         VQj38CaH2l1AJScWR7y+O51K2VmXj0nf+/gDpxTFYi6zWfJRdQMBvNhZBWFVAuzpZZr9
         7GEsehmuOc7eEz8qh2FymwWuTD+bSLDhNMQVk9rU2MZ/GljhdQxmleLAxYlWe1LqjO0D
         Nmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597586; x=1707202386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBYeRPxem/erlBXPgzZrx2qdN8I83pDKmoAAgmzuOtU=;
        b=pZVtkFLTyjtA1yYyVDzMO8cmxJ6IMtLot64IWNBMHseaEjue4k6x6fmDRskSHmfCzu
         /HWWuXl7rovtBUCUA+1uwVhnLGPUFveY0MQ9KjIYrIwgF5KiPIw8aBrSUd5ftRKNBB4N
         XeYZQZ9VYSIW3IAGa2r/n96qlUch+NMMr2ytjIra1Pc+LbtW1UtlxqQucJJzcYb54Ghy
         dHGRFbOapC2acd1QT8AdYbymk+Q6hLlvu5+AMK9yJMxyY3mko5PIDvvGYQeMNh4nlmLJ
         EfgKZqfq4znnb2Jz/0aaWy43/nZYTeD4o6zQZVRYQ+ag2Zgw4sbK4gDCsRX9UzTCWrRO
         6h4g==
X-Gm-Message-State: AOJu0Yz8Exi40d4jwte4S6CY/82BbOzG3QN1tRgk7sZbkQJOsFV6ke1F
	h4X069bsqPZ7B10TcD+YMoiqrfRiwJunC63PiRj+6bsCutdxKgS5Ii4sadP1nA==
X-Google-Smtp-Source: AGHT+IEGPtPBk1jGlW6ugBIW9qVPUdO2XKCvAewXwuo17gBW50pqPF4/Q5IXrkOCWtFprXXV4sCDcQ==
X-Received: by 2002:a17:90b:1947:b0:290:1cd6:6acf with SMTP id nk7-20020a17090b194700b002901cd66acfmr3581438pjb.37.1706597586547;
        Mon, 29 Jan 2024 22:53:06 -0800 (PST)
Received: from thinkpad ([117.202.188.6])
        by smtp.gmail.com with ESMTPSA id h21-20020a17090a9c1500b0028e87ce1de0sm9391496pjp.51.2024.01.29.22.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:53:06 -0800 (PST)
Date: Tue, 30 Jan 2024 12:22:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: PCI: qcom: Document the
 X1E80100 PCIe Controller
Message-ID: <20240130065259.GD32821@thinkpad>
References: <20240129-x1e80100-pci-v2-0-5751ab805483@linaro.org>
 <20240129-x1e80100-pci-v2-1-5751ab805483@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129-x1e80100-pci-v2-1-5751ab805483@linaro.org>

On Mon, Jan 29, 2024 at 04:41:19PM +0200, Abel Vesa wrote:
> Document the PCIe Controllers on the X1E80100 platform. They are similar
> to the ones found on SM8550, but they don't have SF QTB clock.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index a93ab3b54066..7381e38b7398 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -41,6 +41,7 @@ properties:
>            - qcom,pcie-sm8450-pcie0
>            - qcom,pcie-sm8450-pcie1
>            - qcom,pcie-sm8550
> +          - qcom,pcie-x1e80100
>        - items:
>            - enum:
>                - qcom,pcie-sm8650
> @@ -227,6 +228,7 @@ allOf:
>                - qcom,pcie-sm8450-pcie0
>                - qcom,pcie-sm8450-pcie1
>                - qcom,pcie-sm8550
> +              - qcom,pcie-x1e80100
>      then:
>        properties:
>          reg:
> @@ -826,6 +828,32 @@ allOf:
>            items:
>              - const: pci # PCIe core reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-x1e80100
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: aux # Auxiliary clock
> +            - const: cfg # Configuration clock
> +            - const: bus_master # Master AXI clock
> +            - const: bus_slave # Slave AXI clock
> +            - const: slave_q2a # Slave Q2A clock
> +            - const: noc_aggr # Aggre NoC PCIe AXI clock
> +            - const: cnoc_sf_axi # Config NoC PCIe1 AXI clock
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: pci # PCIe core reset
> +            - const: link_down # PCIe link down reset
> +
>    - if:
>        properties:
>          compatible:
> @@ -884,6 +912,7 @@ allOf:
>                - qcom,pcie-sm8450-pcie0
>                - qcom,pcie-sm8450-pcie1
>                - qcom,pcie-sm8550
> +              - qcom,pcie-x1e80100
>      then:
>        oneOf:
>          - properties:
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

