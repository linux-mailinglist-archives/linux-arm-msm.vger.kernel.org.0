Return-Path: <linux-arm-msm+bounces-46792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E33A25E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 16:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 943047A13BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40423208995;
	Mon,  3 Feb 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRu0qJIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC020013E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596061; cv=none; b=uwq1HqIvfmb7z+oxsmotk18BropqaNC7mJAB8scV4kmvdOS48wxCNotkn9mGVa32vceUnTn8e4lAbWSg9kztD7SS6jc60tfDE7J0g+3cIDbLfqwHKtOV2mGXUFgkSR28iy4jsd8GobnhRhLX6Mo7hRaFNScUbk47cEVVBxLbd8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596061; c=relaxed/simple;
	bh=1pk/fGGnQgOxwIyL078JGo17yd4G/o1v6YPLxHS7VdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvoXCbskeYDXhnmSzD5D3fftydF4LV8o/3BAzg1SDz6/enBfSBaiRRg5/7pd2Umbfd0VUul8r+CFtt/4hK9W4d3GPXilBaKVElY9WNseVQXyOyuKRMn4MNBZRcB0S61nvpqfavOSlLXzmBw78uEftJ9eYEL0OaMKFB515gP/hQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRu0qJIn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216426b0865so77445965ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 07:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738596058; x=1739200858; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QBWhANjAr1OtmbGA6f8TwWPn8UUhnW9g2jYfFPH9TA=;
        b=qRu0qJInPUmAHKzq3a5kBOKBjuVaPMA58FwgGmx30Jcu3Xn7043NpDz1x+Y2aHVIgR
         LxenLOKt6YAHkkyJWmsdS0hRHlUJESCLgN0k4muZfsB3ZEaLmE2+jbGsg8xJwHn3mJTX
         TloHMjaUwuwvxpRqyJlv3MVqHf2zgvbWfGej4KAUciwZnJhCh3fhs+0Y6fkiSFGpuMbj
         9NI3T7oy99sXsZ3AFKRJ5lknnV6UXXHRRKKqEgo++oQsvmoEOcSKRTPQzXNk2DXduIH9
         fioz7lJgubcNAnYF79eEZwZcLoEn8T9oihPUh8ce7kGjtGLsIJWe/FZG1VOjvaCO6DFG
         u1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596058; x=1739200858;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QBWhANjAr1OtmbGA6f8TwWPn8UUhnW9g2jYfFPH9TA=;
        b=r3Ts5FMgj2iPJNGxJKpMFZowmxgtTKDWsyCSWRc2qL9dk94ecR+ny7nxncVvvWI3JS
         nSYg7NYo2+6gIXg02vpomv1BCvrDnVOYt7he3KuSm6qb4/r7J/CLbwtMeTl+F46wEef9
         Q9wO0Xu+1bTmS6TQELTetf13fEiUN4TQKjgYI2ajgSR6+LmkahQ12Vc+lQZuNpitbf5x
         WBVKHwrd8jiJLOP90CUlTLdgoSSzHlEf0LBxSFbXZ4UujlaMBER1nfS2grxYMyUmKrD+
         Tp7SiZkI8wWVOwa0xXc1C5e4Tky5evJUfZIoVGd+2sisBdB51bDyexF9L87ablVsoBXj
         Ln/A==
X-Forwarded-Encrypted: i=1; AJvYcCUp4g0OTHi15Et11YQkxHCZuxcuSeAwr8BvT4lSpQItNM7GqQcTU5s+THCY6XNUnNUOuP1Vfb92glX/9a9a@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYN70RMk1G+SuA/eZdFsBdRJe1/PvCdhyPt9mWymG52EAjz5f
	qQRQzG2N0WkrfXJtOvTovygOnveWud2YTyJ7jyfvn1ZxCqd9HaieZkLRBe4+AA==
X-Gm-Gg: ASbGnctT1x7CkvOi5iqOIDwUSusgPnyKaw+ho2UVyQOGkSSV1nZiwzuuLeTqglNF5j8
	atYgLYNWJIyh3c74G0Eymcx14q0SjOh4JtL6CWJ6KTGj0s4HVRlzo0DFhb/Yz/XbiUCTDMtAYWq
	af0NaPDyunRNh5fz+OafDd23RmjdjsK0JwHQzIQIt7SM+5D6Re4ZLAgEMUoQckI7OLg9fjCfXTA
	/AGzyZ4gh/6CGkrFSqSp5YmETqJAO0T68Kl3KgaRkHuv3YyHmts/wUOOVAxiQReXMFDiuqTFhBl
	BMt1NkycOoxxjmSzAxp8Aio3GQ==
X-Google-Smtp-Source: AGHT+IGSJSMOvMrFBAciSyZK7WnnknN8UNArG9prlqW7rQYL/0HyxOSeul8ibO5cwBLiZ/VXl0y4dw==
X-Received: by 2002:a17:903:23c5:b0:216:30f9:93d4 with SMTP id d9443c01a7336-21dd7c55e5cmr196882845ad.8.1738596058155;
        Mon, 03 Feb 2025 07:20:58 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3306012sm77356935ad.179.2025.02.03.07.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:20:57 -0800 (PST)
Date: Mon, 3 Feb 2025 20:50:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
	quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 3/4] PCI: dwc: Improve handling of PCIe lane
 configuration
Message-ID: <20250203152052.kwbmt6bhjzv55ddk@thinkpad>
References: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
 <20250124-preset_v2-v4-3-0b512cad08e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-preset_v2-v4-3-0b512cad08e1@oss.qualcomm.com>

On Fri, Jan 24, 2025 at 04:52:49PM +0530, Krishna Chaitanya Chundru wrote:
> Currently even if the number of lanes hardware supports is equal to
> the number lanes provided in the devicetree, the driver is trying to
> configure again the maximum number of lanes which is not needed.
> 
> Update number of lanes only when it is not equal to hardware capability.
> 
> And also if the num-lanes property is not present in the devicetree
> update the num_lanes with the maximum hardware supports.
> 
> Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
> width the hardware supports.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
>  drivers/pci/controller/dwc/pcie-designware.c      | 14 +++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 3e41865c7290..2cd0acbf9e18 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -504,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	dw_pcie_iatu_detect(pci);
>  
> +	if (pci->num_lanes < 1)
> +		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
> +
>  	/*
>  	 * Allocate the resource for MSG TLP before programming the iATU
>  	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 6d6cbc8b5b2c..acb2a963ae1a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -736,6 +736,16 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
>  
>  }
>  
> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
> +{
> +	u32 lnkcap;
> +	u8 cap;
> +
> +	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
> +	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
> +}
> +
>  static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
>  {
>  	u32 lnkcap, lwsc, plc;
> @@ -1069,6 +1079,7 @@ void dw_pcie_edma_remove(struct dw_pcie *pci)
>  
>  void dw_pcie_setup(struct dw_pcie *pci)
>  {
> +	int num_lanes = dw_pcie_link_get_max_link_width(pci);
>  	u32 val;
>  
>  	dw_pcie_link_set_max_speed(pci);
> @@ -1102,5 +1113,6 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  	val |= PORT_LINK_DLL_LINK_EN;
>  	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
>  
> -	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
> +	if (num_lanes != pci->num_lanes)

Move this check inside dw_pcie_link_set_max_link_width() where we are already
checking for !num_lanes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

