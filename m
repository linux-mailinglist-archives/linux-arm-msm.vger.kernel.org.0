Return-Path: <linux-arm-msm+bounces-45512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD7A161A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 13:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F7E1885AD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4711D2F53;
	Sun, 19 Jan 2025 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAM9M0Ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256D157A5C
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737289912; cv=none; b=Ii4dRcNftp9WE7/v5SUd8T87EiZI6LkuX6gyxQEx2WDUTLUvUWBDxiicxswgTdnx09anlzUEQlFFs82EArapXNNr7kBSLsZ4S3hIh3N1sDua/wob0vdnfVpeEa5ggIEVwZrH5+TgimhhGBDvprhF6ctY85xSiJ5YGwShf9czG9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737289912; c=relaxed/simple;
	bh=b8I3+yxb+holxrODNel2OCMwStoOQEV9Nsh5TTlNYJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jzh0b8yOjP5AGZolH33Fwp9sBofN5sN1hb5MdHLq6QiXsX4G9IsTWycv4/JN+PNDdgqSaqnCmmkN2+GVuHvqawlrffD1vumj4udT/VGrnU3FP8NgnVCQApOYqAK44Suusav3SPXjDnQ2sT3wxH1VGDTcgx7OVb6FxDrvvy1OXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAM9M0Ad; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21654fdd5daso61039765ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 04:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737289910; x=1737894710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXDDGdiqxvAdCVCeKQbgEvCD/6x4huy3wzcrmw4YbuM=;
        b=FAM9M0AdVovvHoWh7qe5bghrtqOM9E7EGLMhddrF/HtKyUnb0MBtXu4Dmq2i2fm04q
         Ta2PB3mr/SAlTR0kZDYHS+JEC6MlOr/uQlg4mo713E9c9lvw+lX2A/cCalQt/DJ9smBD
         yvTNMYxZxN5e/GfC7URUxjJ3c8Ujy3s2H2siKSyt9+/go48CQz7a4IkRaTUFoF6TFHy0
         a5QFTU64wtZALtgBdviwjpRYb2vCNMgrjT0hT+hgqEHxyCN4KX09ck4SBAFCPQdXL3bg
         zAiha1bpKd+PjKU+7+ECqBXEKv295JKNAPvC9Z0vfbU9vj1yslgfWY8jDr2YmeGtSOcH
         dPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737289910; x=1737894710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXDDGdiqxvAdCVCeKQbgEvCD/6x4huy3wzcrmw4YbuM=;
        b=NBM4sf05F26lMIYYtbsNQk/zNCrWqPzlTaa9L9UbwgUDxE4SZUQcbsFipU+2M6zALE
         g4WQMDWs0piYY5qQd+MxNOiFh4EeL92vdtNoH/4hCkNguF/BaN5Lul6zfvS0mEMh5KVX
         Nik9Hwik7ZxCpmt46SMsbycycX1gtThQ+MD3crPMzKJ9NALpQsqs1tK5swAadfNlF+xB
         O2o7mEGu5QnljSvW144fSD+z1ABHodyFGKTUdCluA6FumfBhO2osqVoTHyfCZNheG8QD
         KZXiaV8HKzyFnP4lxqoAg4zbl/hBiwSj21eZ8Lf5aPyXzv+sAWgnTfVDflJElCNqsVek
         V0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXr322sIdnQW8MrOnY3ZVJMbPds92MbMPerkH2FXm9jP/YQbS1mEycGlxKPBd/fOvEOK6bHKNzUALKAoGdx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36husxN39JlWSz2AnjQISl/v9xA6ZnNK/0FyFNcOQnUJUAh4L
	8dKRso69lmZp9pM11v1yIx0ffiDFD3RIk4AK58Yp3FkLsPfkxoDJTAeF1rasA2c/qpIZV/5N3nY
	=
X-Gm-Gg: ASbGnctCP31NDiATOoyKuy+kthK8rEL6cVLJM2sxC5MvMf832TTiQZEZIBJqMiT5js1
	VSl7SthAqoHcAkHB7l1FHJ9L2bMRMPwfZvC/IyCu6ptA8zYNFILbteiy84hC4GMe70LV8ksd/9z
	CGsAhxXgplooz72AV9NvgruVPidsMWQvjfGESKhxlSODGYTSzUmV9ceH4BVsKhuB9MHI7IHJDPR
	OKBZrwIIK4qqfw0ajRKE6OCb11CCJDiiOu7QN2+m/LhOHjevsh2Jzr11pkMZ4qBVZo7tXP0iODJ
	PQyUNQ==
X-Google-Smtp-Source: AGHT+IESj9hipVsk75yPanv+gXMBaSyDflVAD0+JtKGBpZQwquLiubg2YgW1L86GqvarrBofrNmP9A==
X-Received: by 2002:a17:902:e952:b0:216:760c:3879 with SMTP id d9443c01a7336-21c355f03cfmr136590925ad.46.1737289910652;
        Sun, 19 Jan 2025 04:31:50 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9d97sm43621115ad.95.2025.01.19.04.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 04:31:50 -0800 (PST)
Date: Sun, 19 Jan 2025 18:01:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: qcom: Document the IPQ5424 PCIe
 controller
Message-ID: <20250119123145.qzpv65gifayyve66@thinkpad>
References: <20250115064747.3302912-1-quic_mmanikan@quicinc.com>
 <20250115064747.3302912-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115064747.3302912-2-quic_mmanikan@quicinc.com>

On Wed, Jan 15, 2025 at 12:17:45PM +0530, Manikanta Mylavarapu wrote:
> Document the PCIe controller on the IPQ5424 platform using the
> IPQ9574 bindings as a fallback, since the PCIe on the IPQ5424
> is similar to IPQ9574.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in V2:
> 	- Pick up R-b tag 
> 
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index bd87f6b49d68..7235d6554cfb 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -31,6 +31,10 @@ properties:
>            - qcom,pcie-qcs404
>            - qcom,pcie-sdm845
>            - qcom,pcie-sdx55
> +      - items:
> +          - enum:
> +              - qcom,pcie-ipq5424
> +          - const: qcom,pcie-ipq9574
>        - items:
>            - const: qcom,pcie-msm8998
>            - const: qcom,pcie-msm8996
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

