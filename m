Return-Path: <linux-arm-msm+bounces-13468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E07873523
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 11:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518C01F25E16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 10:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8D74BF9;
	Wed,  6 Mar 2024 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouDETjdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3174E3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722636; cv=none; b=b/9oeaU4CSLmedypqMj1TMD9hZUG9Nn/v/PJne1mBhmyrD5ikBA0a0p0+slfooDhjz6BLu/fmszxStJTX4CtCr4h1yBLEVIhE4KqW8PCAl4F18Ftbllq3oACiNhUe734QjgAdnEwIdWZxrxVfKNbuzM/ZJMR0fpkLuPfZm6tJb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722636; c=relaxed/simple;
	bh=PxQkKrOPnjUbGpSomDRnlUhmSSi0mYecg9zRaMFuJAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gagmhO6OHxmO7gcIekCW8VRy0iG7Yj/Z0UXdsYYi0d/bDG+XqLhkIiVtKeCWziF7y1D2vDC8iY9ptZfVBrRdEoe8IcTFOrxofuVIGomptgOkio9ptNR8IggelfIzBkBzbbbb9kX2HZkrzwxaeUC5gPK3r83dY09OYsDV6r5m9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouDETjdH; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d334c4b163so1466567e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 02:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709722633; x=1710327433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxUxwGg2SWOaJy7LQ4z09jEYeKP2bAj05h4IqVt59sk=;
        b=ouDETjdHBqtnsTJCqtwv8E6vrh8r6IeTDMEduzVTtzH+dZplGsXQZuNGPXrMRkagwW
         66dqY4Z2D8GDGpoYPeYL985Ingvk2Olp8K1+J46kRc0f3iTe5RV45WtgUI8YuwvFh487
         FSWP1PLwaOkHb4pIb5O3irJDeKVBNJcH8wuV6umyNOFBnhTdme6JnK8N/mNOOD3siiUq
         OEd2nsT4cwGyeZ01Fg15n+wCW1hXxVCOLP5/QXDnrL/ochDBnVqA+6kNBk7Ig+mfGmUu
         +jZZuXxv91bNC7/wYCM6mS7QH88BTV+ydtpMdOE/WYQAfyA/Pikd/YCVJ4Zg+50s2N6Z
         NWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709722633; x=1710327433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxUxwGg2SWOaJy7LQ4z09jEYeKP2bAj05h4IqVt59sk=;
        b=hLuj9W3I3kx5MWnma+smVd4+ZulyN3tNDoM7MewtR0zp1bXD8vVkz0n+CGb3vC9906
         q6NOoCIraAStgMZKMJcoy1P+t9J6Hi5rn6CIBLpqyMyFSdQzQedC8ufdsA4n+n7/9CK2
         vuNOt/MUarBs0Y64XkSpsEgeiYSqoKDs/NNYevBPutl/Wwy5zqY4KZyctydBCkGOoA5W
         UFKhJwobCnIWfRu42S2mUBcrNosjLrHhlIDf2GsNASfuvcb5qR4ahvFlcajvEnvzWSaZ
         OyQyu6RNHAzOjP16U1mvx6No7Lohr5q5Y7PVPgX5Gr4mA9jWQ38wJXlHLGIXaYze34IZ
         uVyw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbrLAqPSEJJvkjsUb6R+jLdVZ7406bMJaBhWhtpI0M5kj1nLVE/Jl/97njC/lByZuR8f1rQ+lnJoryixeNdd70BCe9xmm55/5hJq/IQ==
X-Gm-Message-State: AOJu0YzLxA8WLpmdM0Xid9eCNA428Oeg7FmW5pybOW+Oh/KdC1skAkjk
	J5pFcKKSQf6L95LyZvYBO8yJvEn2dIZ1nawwota8uBpAaS2ZJCca9wwW/M1J6w92Yqv3IKdbPhE
	=
X-Google-Smtp-Source: AGHT+IFG00jwW6iyWhCp8D8dFbgwPMCEu6TNuD/BYBbQrLh5jn3bbhGke775gAlxZI9UdiYP+c0xnw==
X-Received: by 2002:a05:6122:d90:b0:4d3:34b1:7211 with SMTP id bc16-20020a0561220d9000b004d334b17211mr4780807vkb.3.1709722632787;
        Wed, 06 Mar 2024 02:57:12 -0800 (PST)
Received: from thinkpad ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id l4-20020ac84a84000000b0042ee49dd434sm3619050qtq.29.2024.03.06.02.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:57:12 -0800 (PST)
Date: Wed, 6 Mar 2024 16:27:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/5] PCI: qcom: Disable ASPM L0s for sc8280xp, sa8540p
 and sa8295p
Message-ID: <20240306105704.GE4129@thinkpad>
References: <20240306095651.4551-1-johan+linaro@kernel.org>
 <20240306095651.4551-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306095651.4551-4-johan+linaro@kernel.org>

On Wed, Mar 06, 2024 at 10:56:49AM +0100, Johan Hovold wrote:
> Commit 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting
> 1.9.0 ops") started enabling ASPM unconditionally when the hardware
> claims to support it. This triggers Correctable Errors for some PCIe
> devices on machines like the Lenovo ThinkPad X13s when L0s is enabled,
> which could indicate an incomplete driver ASPM implementation or that
> the hardware does in fact not support L0s.
> 
> This has now been confirmed by Qualcomm to be the case for sc8280xp and
> its derivate platforms (e.g. sa8540p and sa8295p). Specifically, the PHY
> configuration used on these platforms is not correctly tuned for L0s and
> there is currently no updated configuration available.
> 
> Add a new flag to the driver configuration data and use it to disable
> ASPM L0s on sc8280xp, sa8540p and sa8295p for now.
> 
> Note that only the 1.9.0 ops enable ASPM currently.
> 
> Fixes: 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting 1.9.0 ops")
> Cc: stable@vger.kernel.org      # 6.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 31 ++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 2ce2a3bd932b..9f83a1611a20 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -229,6 +229,7 @@ struct qcom_pcie_ops {
>  
>  struct qcom_pcie_cfg {
>  	const struct qcom_pcie_ops *ops;
> +	bool no_l0s;
>  };
>  
>  struct qcom_pcie {
> @@ -272,6 +273,26 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
>  	return 0;
>  }
>  
> +static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
> +{
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u16 offset;
> +	u32 val;
> +
> +	if (!pcie->cfg->no_l0s)
> +		return;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
> +	val &= ~PCI_EXP_LNKCAP_ASPM_L0S;
> +	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>  {
>  	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> @@ -961,6 +982,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
> +	qcom_pcie_clear_aspm_l0s(pcie->pci);
>  	qcom_pcie_clear_hpc(pcie->pci);
>  
>  	return 0;
> @@ -1358,6 +1380,11 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
>  	.ops = &ops_2_9_0,
>  };
>  
> +static const struct qcom_pcie_cfg cfg_sc8280xp = {
> +	.ops = &ops_1_9_0,
> +	.no_l0s = true,
> +};
> +
>  static const struct dw_pcie_ops dw_pcie_ops = {
>  	.link_up = qcom_pcie_link_up,
>  	.start_link = qcom_pcie_start_link,
> @@ -1629,11 +1656,11 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>  	{ .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
> -	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
>  	{ .compatible = "qcom,pcie-sa8775p", .data = &cfg_1_9_0},
>  	{ .compatible = "qcom,pcie-sc7280", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sc8180x", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-sc8280xp", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-sc8280xp", .data = &cfg_sc8280xp },
>  	{ .compatible = "qcom,pcie-sdm845", .data = &cfg_2_7_0 },
>  	{ .compatible = "qcom,pcie-sdx55", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8150", .data = &cfg_1_9_0 },
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

