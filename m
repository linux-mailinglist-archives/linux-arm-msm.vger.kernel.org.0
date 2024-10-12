Return-Path: <linux-arm-msm+bounces-34182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCA99B114
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 07:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F261C209BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 05:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C3684DF5;
	Sat, 12 Oct 2024 05:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fe9T5oMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5E946C
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 05:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728711408; cv=none; b=cnanZdaBdLd15Q4lPcDlUsg6E0iik2Ksk9mPTmZiAfUYHjRDcozFeCxzLtVCnEgLJ60zg/MefUa7EfxdXuuyFkNxcIHhfZpdZNfIzgnxPgIgLkeLJ3R6O9aC2yZ5YisFd/do1VXt+068du47l9AcCY3kfHtlDf17GBKYUlpEP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728711408; c=relaxed/simple;
	bh=id6bl7x2+/RADHJgpgSgWPIftbgTDqmwOH9HR9CntpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDR4JVbh9MtJ3fNkojAkj5yqEhUzsEErbEORcflMrxGT1IOmt1tKZBERuXUM5a+tHvn2lXDXH1hhV6xnr2SX5SQXWawbdJHtyHDAJcH/VKFSWO2H/QTPuILGkDDV1JIFBUDvmNYf33gMP7jmhYK94KQW7zI2Zmg/PNEcpGZp3TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fe9T5oMg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c71603217so25596325ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728711406; x=1729316206; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjQuIV6kj3VfwRWddXnrTlmwecAWDBUJYA1PrNxHudo=;
        b=Fe9T5oMg4fjcyqgrGozD/NgYo8G4IIuNAJnZeWpGTeWI5nCPy0IDjuNomWDTPC/ynt
         3/E9WmqGi8I40NyC0C0znvyW+F3betQRryykUfvz36TiW5ou9zP9RdaUhPyoQ6PkvAeG
         cC1MguNIwZv375x6cShNNep2nHrMZlJmspz1NPTRJDJHXDNLaRYggmG+O/60z0u0xeTP
         msPU8UMwb19VrEkfLY7zT0KlIuLC1/g1PEsH26w72+Cn4sOFeFPd1kdoZ2xs1R5LwK0Z
         xZwxLhjNz8xMFMlpVFFUFcYJuPKNpXkshh74rF8mLs35ANGAEZvnIv2x+Qql4+4vIovr
         jfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728711406; x=1729316206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjQuIV6kj3VfwRWddXnrTlmwecAWDBUJYA1PrNxHudo=;
        b=B+VZPitpzGGSyCQHucStauhertv3y+2u5bTSBnlBU0e4ILaFEgsxPmN9NLZDmUAqby
         7Udo5e1aQW7+IJreQ9j+NLOL/5EQOYLvlC3lGv5+3gJDw+l0jBX+YI27O2mNJqpaZ2Qc
         OMOteGm0BUrJ7aZmEY3Somkl7IRfd6UG2Df0GcjcPMKcb2CJvOOqDZCIeUxGyHl/l9bM
         bnE1zAJKN8RWF5ugi1xF6ULLKPQgqnI1tmyLODJJoC/yh+swnRlOO0g9bJz6AY/QDW84
         FHzHENLDIalZ8kRJZ1LLgj+sKIddDnlK/eC/jLQK4tykZT7VOdeaAg3i+ZKq1VBhwtD6
         x6QA==
X-Forwarded-Encrypted: i=1; AJvYcCU+qKqii7VLA+tsXjQfCKvvXc+NTXefPCCn9d+J70yyD7aLohJ2Nsix7GH4C7xJ3uWUitaWgMm16nkruK12@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+KzJggtmcCodkyycX5jA+FujWWqMldtWMRFf8vMtcOcnE/A7Q
	heBMXvkkLWigfwtf0BngScCcQ9Ob9i8uNF2UZrqyctaSEGhnB24lcNF6YKPHLg==
X-Google-Smtp-Source: AGHT+IHqiyyz1xhjY6vqhIqY84FxPaW6G2o/VAwjL/1LFjW/xaek+9WCg+PZY5ymNnouaWkyvQGCag==
X-Received: by 2002:a17:90b:893:b0:2e0:a47a:5eb0 with SMTP id 98e67ed59e1d1-2e2f0da8051mr5652417a91.38.1728711406131;
        Fri, 11 Oct 2024 22:36:46 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a36417afsm6683894a91.0.2024.10.11.22.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 22:36:45 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:06:37 +0530
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
Subject: Re: [PATCH v6 7/8] PCI: qcom: Fix the cfg for X1E80100 SoC
Message-ID: <20241012053637.cu2eyle6d7gbqsth@thinkpad>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-8-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011104142.1181773-8-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:41AM -0700, Qiang Yu wrote:
> Currently, the cfg_1_9_0 which is being used for X1E80100 has config_sid
> callback in its ops and doesn't disable ASPM L0s. However, as same as
> SC8280X, PCIe controllers on X1E80100 are connected to SMMUv3 and it is

"...connected to SMMUv3, hence doesn't need config_sid() callback"

> recommended to disable ASPM L0s. Hence reuse cfg_sc8280xp for X1E80100.

"...and hardware team has recommended to disable L0s as it is broken in the
controller."

> 
> Fixes: 6d0c39324c5f ("PCI: qcom: Add X1E80100 PCIe support")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

We need to backport this patch to stable to fix the L0s handling. But we don't
need the previous patch as even without that cfg_sc8280xp disables L0s.

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 468bd4242e61..c533e6024ba2 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1847,7 +1847,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

