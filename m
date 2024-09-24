Return-Path: <linux-arm-msm+bounces-32299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E698474F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67161B21630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757981A7AE3;
	Tue, 24 Sep 2024 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/TCBL0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A941A76A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186913; cv=none; b=RbIgYvaRrBsMd4wJOphKn+Hh/4a79W27/I+YE824QLXc7KZRf8K3i+FkYOHmWMH2VhilGNYt7F63GTBJQSwtYIdpr+QeLSf/S9G+YPLP2BxzakhNOEoX0BrmJQov5bhTHPB7RerkJBgt10hubaSUc5AlKPv0HbQh5r4npU6rD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186913; c=relaxed/simple;
	bh=/fZq1LO55PhzPQor2iRagt/VVrgJjkHC0YieILTN/OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRcL4BK9Rfx+hG373h+hyZQ/o++XE9a+2xch34LDEo8vD0pni+N+Xm0uXEg6Z8vjVZcCWhdNafFKqHJQMLbd844a9nD1sIEjzN7TG6Yu8I5oHhUEdEfZmb46wFHLxhq2Mcs5jubu1B1crHODx6zS2eCWwTXolCEGPMxwPcGtpO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/TCBL0g; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37747c1d928so2962993f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727186910; x=1727791710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=40piiJGTfM7ZQA0UedJryDRvdqrWepuUZqLPtNOH3VQ=;
        b=y/TCBL0gSQnqiTj1DOKSUfYmt2fXay7UAAnAaCQkf1+hFHWmYEAOL/Uf8UhA2STMMA
         IxAfFP/e9cC6sWdFyWahli28tqwx1YR/Sg2d2cUsQnrnLt0xBGTAdveBOaELx9faKyn+
         M8u/9y/5LsrPy4yzy0zuoc5WRvh8L/cVgt/vsnf+gFZLRBld+j2DxevmM5STLYLrDMxk
         wqpoTeDMGCVqDsbEzlh709NyVWP9y697xrdH1JAmYMusOsJYerS/fFUArgPDBU+HWRii
         wQiRcpG2DQZH6zat6v+xGh5qcUO0cLfqAv6ASdhs3Ta48u52vyp4XM8hy9pfg9ULUpj1
         kFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186910; x=1727791710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40piiJGTfM7ZQA0UedJryDRvdqrWepuUZqLPtNOH3VQ=;
        b=XKukTbs2R5KhKip+j57B2AevSvBZd34MvgAhhkcYyahiiLFlgYTEFmET9ZFR8GG16y
         Hb3gfksCoXqXH7Lc0nE1RxV3Fdi8YBAWmC6Z8j5oT76EJzikoUTfYomT9/ls6kyHK2jj
         EsJfEw8MBo+G+nlDalUy67tJaT59gPY66JAa7lkOPM9vPp+P7mQo3LenIEk1Kn6Jo7VB
         B5nt4XE6lNQFfYri5LxvrjVCxwiQ2pC2IeBPMTXKOP7ldl1RmJI2ohIFWmcbQFF2bpa8
         uDw6WQgIrQ7w1qGI18NgDL78YWVln1n3EnsAQzJpDc4g/Solj4aWIuS1CDVwv1CqXNTp
         m/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXna0u2hJWbS//05W5m8VKXCUCzEL2OkOZzFIpokTJJYjJJmLnIVJ0ZWlHwNfNTcMCwJcVOBly8+ZfErxAq@vger.kernel.org
X-Gm-Message-State: AOJu0YymV9ahdSKokqvcOTjkdcK+Cvz+9LUDWCnpvyN6ZppPg2+tpLbn
	alXJGcp+BdtIDHDA8qK4QcYAfnbeY6tzi+0e7zTBI247QQ/hESlbcNV0BwfJDw==
X-Google-Smtp-Source: AGHT+IH4WW0ZIOSHklIzJiL/X3r6M9oWzL4NBPDdU5VWxfP/mCN0bTHEJd5jEIb+qLxFYKJld/AuBQ==
X-Received: by 2002:a5d:6189:0:b0:371:c518:6f54 with SMTP id ffacd0b85a97d-37a422c02acmr8022006f8f.29.1727186910055;
        Tue, 24 Sep 2024 07:08:30 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc3187e6sm1684265f8f.92.2024.09.24.07.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:08:29 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:08:28 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: PCI: qcom: Move OPP table to
 qcom,pcie-common.yaml
Message-ID: <20240924140828.mz5vjcicygsj4eb4@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-3-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924101444.3933828-3-quic_qianyu@quicinc.com>

On Tue, Sep 24, 2024 at 03:14:40AM -0700, Qiang Yu wrote:

> OPP table is a generic property that is also required by other qcom
> platforms. Hence move this property to qcom,pcie-common.yaml so that PCIe
> on other qcom platforms is able to adjust power domain performance state
> and ICC peak bw according to PCIe gen speed and link width.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml | 4 ++++
>  Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> index 704c0f58eea5..3c6430fe9331 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> @@ -78,6 +78,10 @@ properties:
>      description: GPIO controlled connection to WAKE# signal
>      maxItems: 1
>  
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
>  required:
>    - reg
>    - reg-names
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
> index 46bd59eefadb..6e0a6d8f0ed0 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml
> @@ -70,10 +70,6 @@ properties:
>        - const: msi7
>        - const: global
>  
> -  operating-points-v2: true
> -  opp-table:
> -    type: object
> -
>    resets:
>      maxItems: 1
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

