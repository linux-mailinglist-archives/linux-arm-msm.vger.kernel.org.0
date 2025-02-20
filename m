Return-Path: <linux-arm-msm+bounces-48604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 192A2A3D206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173B93A5C96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0B31E379B;
	Thu, 20 Feb 2025 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNLZAx69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749B1E5721
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035992; cv=none; b=EZIxf91hDecJv1ymEIOBbPvGqXIl4zgqM05ma4pAq30CBEkKdJ3WeR7e0wKMPZgFcqlSq0LFzAyEeUVYS8wHcJ4b8Zlx9gNJwnXZuPwz+ffRRR4fpMu+u+7vq/kAFv8N793PQ8qw96+/FeajRhc+q+PMAlYrjlqp7FPXJyAaz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035992; c=relaxed/simple;
	bh=dSKE5I1F5l6I4pWkjzFMa6oZu20U6ZVKkb/GOJ9jS3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqML6BUf1YV7D2Wb6Y4vrPwIgrnaQ2bzmnpCNwKAr4jw96hsrE9pEIW1lS9r/Swqb/8xaXlF3kUC+gkHUUKtSacJhjhNDNfIOWuBHpUjy4ktNA/IeJvnG2xPsQfC+NPdGqsS36vyePdQ6HlGH6TdzvfeOsKqSrK+Fut6xdFbDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNLZAx69; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f2339dcfdso10735535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 23:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740035990; x=1740640790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Ur9dFsKFbvJEs8mC6dKdEyGV45W+SbQs+6opIdZpbs=;
        b=VNLZAx69oomZ2UsY/9Cxo311gLJEFuu4zoHEWnn1HdOYJ9H10PWen//VB7OkXM8aji
         indTno01AIY1BtmqmZYus2N/06rkmcBhlI30jb5ajRX/zpxpUB6+mNx7tNSNqIVgRJVf
         vNZ30uYjL2fChu7wE58nPLJ3nBi7J7uOnv75wFOStLEwCDpAui1WcThIDnvjarRAJYQu
         /uvJzscP7FiTToS7UrurzWbRm3lRQpnROxA6I23IzQUHXaJMXHg50pnfbP2KSNNB7W96
         byLYJ26/72OF5AUZ85DUTrdOqZOtqL5mZ2euyH3V0FMx2hx+s1YW+gm5glkFveDzBGSw
         0d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740035990; x=1740640790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ur9dFsKFbvJEs8mC6dKdEyGV45W+SbQs+6opIdZpbs=;
        b=PceAzUVjfo5hz90G4JQ9PEq0qAahWyq/oRThCUiYzRAJpizi2g2rBF7IJcID5MLbBc
         Wk3hS7qveOyQAtfO6olQ+iM78jjXCeXaa5sbxR8XC1nC02ajCxAGqJeKR93joQPqqexl
         UYs5fpOHV5Plar2UtvOSWlNGZod31x7KzzHBc89pTNhf+JIcM+2yGqPmB+mnDi3s5C+d
         9jqkJB6n11JlWkuhnZxPC0mS3i3wP5Z6+plZjQiu25UdvAea0s7LPyjdwotqZ7FsGMsU
         bVldDKGLGn0E4TmRtHyK5QKb6nTFlVZHvw5cOSRw2cAcj9mP0u8leSgXAsObhG+lNuWR
         5Tcg==
X-Forwarded-Encrypted: i=1; AJvYcCWKKhdr930vXMeI/Lu1etlq4b95IxZqFTCgiN7Xp/Iis0q0DNfPgSwN82VVOgQ+9or8HyLlVu/ViEJHGEpR@vger.kernel.org
X-Gm-Message-State: AOJu0YygFFUbJVBnSSVzx2rHIZksgDHGIfV9pQzeUoRlBFxBfzYbkedC
	yo+88Z8E0yCmtCNq+WTAgMiIvq1ldWlwYT7YqiDsS8CKWkl/f6zvrRKEnssk8Q==
X-Gm-Gg: ASbGncugGHmIo8xVALbFoFWrniO+D1XrC1UaVMUEaVUhnOnirZk3v9xq+YCvjfa4oXC
	12f1zGBAl5Z1RuIgTpNtxNIjnyTsNRWbKEPJu77kc/fMGuLEQsRlmcOkmZaHm32xyF3MOEsPktV
	VvNGOyHSrWo3gaQHTr58JTT+wjL9oGSXyrxf0sfX03pjvdCC0rS34w9knfuQTUHxvyuSHgtZisx
	UKMdDQ3sASE3cy2+pHwJjNJZu2V3lvScngRMdNHJwh+F7Mi0PR3s0LSzaFO5/G+l5QhNk/p0ftV
	24PXjz0W/dhgy913PUMRqrn+hw==
X-Google-Smtp-Source: AGHT+IF3yihejjwT/v8s1qaCn8nd+GpEMzld00Wlnl4a36L6UHNc/5ltRo3ZjwkDna6NDtWQ/sG8kQ==
X-Received: by 2002:a17:902:f54d:b0:216:271d:e06c with SMTP id d9443c01a7336-2218c3db4d8mr38128005ad.4.1740035990566;
        Wed, 19 Feb 2025 23:19:50 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d537bd1asm115277265ad.102.2025.02.19.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:19:50 -0800 (PST)
Date: Thu, 20 Feb 2025 12:49:43 +0530
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
Subject: Re: [PATCH 1/6] dt-bindings: PCI: qcom-ep: describe optional IOMMU
Message-ID: <20250220071943.edn6q65ijmeldnag@thinkpad>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-1-94b20ec70a14@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-sar2130p-pci-v1-1-94b20ec70a14@linaro.org>

On Mon, Feb 17, 2025 at 08:56:13PM +0200, Dmitry Baryshkov wrote:
> Platforms which use eDMA for PCIe EP transfers (like SA8775P) also use
> IOMMU in order to setup transfer windows.

eDMA has nothing to do with IOMMU. In fact, it is not clear on what IOMMU does
on the endpoint side since we do not assign SID based on the RID from RC.

But the binding should describe it anyway since IOMMU does sit between DDR and
PCIe IP.

- Mani

> Fix the schema in order to
> allow specifying the IOMMU.
> 
> Fixes: 9d3d5e75f31c ("dt-bindings: PCI: qcom-ep: Add support for SA8775P SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index 1226ee5d08d1ae909b07b0d78014618c4c74e9a8..800accdf5947e7178ad80f0759cf53111be1a814 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -75,6 +75,9 @@ properties:
>        - const: doorbell
>        - const: dma
>  
> +  iommus:
> +    maxItems: 1
> +
>    reset-gpios:
>      description: GPIO used as PERST# input signal
>      maxItems: 1
> @@ -233,6 +236,20 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sdx55-pcie-ep
> +    then:
> +      properties:
> +        iommus:
> +          false
> +
> +    else:
> +      required:
> +        - iommus
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

