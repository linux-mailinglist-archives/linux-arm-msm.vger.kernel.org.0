Return-Path: <linux-arm-msm+bounces-26959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10A93B1FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 15:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5E6E1F23CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 13:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB0A158D89;
	Wed, 24 Jul 2024 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XxzOCPBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FA71581F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829192; cv=none; b=tpIzKRZ5+QMy5RXvw+P451HUoCF3ZeajeuCqMMHFwMEKW4zxjW+fdG1TihdUFxfBetrp+0X7dTSsdkVgu6tWOBcdwHr0eQH3974n9gArrOpALVjj+zniYf/IUl7Uru+zWHa+OgH2zRZEyxHsq07Or0iuFvpBeqMOjmF+Ynz6T4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829192; c=relaxed/simple;
	bh=K1Gm5FrXTgsaeMhym9PMm5RXH1m2mr4z+ndq5toTgcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9aRArpfw2J3pdqj0LpF/jg+HPFZJV1jDqRClYAIMZzcWRK6I8fAU8/qXAeP1bHWSa0/+VAIHTqi1e/AlM3J/DrwnpC1EZ2OAOsQEUxCJ0NM3LUHuwELFUttkhnFOgbbHsgmLK+2yg/POX5P2acvR2cDV32Bf7EkRrAN79TuHSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XxzOCPBp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc56fd4de1so6664665ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721829190; x=1722433990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoDYcqz8sG/AIs+jpcWHgqP0knrGMe57oRo4EDfUESM=;
        b=XxzOCPBpG8Wgq/2R5cpX4MUYvnbw881wHIeGDt9rbt+HTNxOhp5qlMdOUS8iT7DTXK
         htPo//OnC6tfGQfTc5uxm/VBnKjPuqYMautfqI6WrlIURY2YCtfnCpju96wuP7+coqjj
         Z9nyWpL2qGeuBzYjGcbX42dMu68oiJQsraCpI2LmjPf+/3KrxOLak67HQs8jrEdwd63J
         uZ3eJuVkM3enOLKBwAwkz+QY9qDLrTIeuUYqzaVgrJvUL324vyxs4ckUCH0KvnfHXT9l
         fAxugJC3mPrdQ4yiCjV6KZ81cnITJ8gJ9rO9nmXrJLppw4H9/Og+5LwwsDNLvRoL+WPD
         2haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721829190; x=1722433990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoDYcqz8sG/AIs+jpcWHgqP0knrGMe57oRo4EDfUESM=;
        b=w76CNPKaX0DBDawaeEkN5Dc8lMAUHcnkAx9NHA/tqZFEwZ8+XP/gWCEuRPZJHOiEQG
         wP2gEfrfcqJFOqbJmljVSfo74jYiuoU+pzECaSzycdE9TtV8FB74wNLiiXu8j3TQ0dIk
         IIPzRacRLJKrK6kC/uJvfqwUhHiyvp8BCSZ6/vsK6+vHWVxHD5KH5Ci+gjRhE64twqEv
         dwLCIU03K9/HMQPw7xP8Z2NH75hTun96VWrXFV/cL2T9BVrUizgSnzPxp8eHO8GMy06w
         5opzF+66L9kJ4fNNkvpZoXIf8TYxrkh7K8bfYp0zlJ4p0tBVROtgc5a8Qb6pFh+6ON2E
         n6mw==
X-Forwarded-Encrypted: i=1; AJvYcCXPziMFSP686aDeuYFIjRUwBkybEiaYKrpztTqVeBGPd/qM2MdXbtQjcULrYxPCY0bzKD93GeDgXhUGP24dGV8dkofTFpLKRc7cyqwJGg==
X-Gm-Message-State: AOJu0YxuCCNDC4zkffjkLebsKCXGU4PMBxlPrVdpRFK+Q8pXnN+QH0GN
	u6XXuvYXQKCAd+7n42ZSIm7pm3i0nyFsqXTnIQbxCaRpTCPwUQgTMmQtj+GWug==
X-Google-Smtp-Source: AGHT+IEmx7G7fByPz1gtOcoNPb6KHFdsEYyRBjys2M9fZj/hXEBf+Bn4FE+Hw7+Xaaw5KQegbGX9Vg==
X-Received: by 2002:a17:903:230b:b0:1fb:9b91:d7d9 with SMTP id d9443c01a7336-1fdd6e80b55mr35063315ad.26.1721829190540;
        Wed, 24 Jul 2024 06:53:10 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f290eedsm94532535ad.93.2024.07.24.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 06:53:10 -0700 (PDT)
Date: Wed, 24 Jul 2024 19:23:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Cc: jingoohan1@gmail.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_mrana@quicinc.com
Subject: Re: [PATCH v3 1/2] PCI: dwc: Add dbi_phys_addr and atu_phys_addr to
 struct dw_pcie
Message-ID: <20240724135305.GE3349@thinkpad>
References: <20240724022719.2868490-1-quic_pyarlaga@quicinc.com>
 <20240724022719.2868490-2-quic_pyarlaga@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240724022719.2868490-2-quic_pyarlaga@quicinc.com>

On Tue, Jul 23, 2024 at 07:27:18PM -0700, Prudhvi Yarlagadda wrote:

Subject could be modified as below:

PCI: dwc: Cache DBI and iATU physical addresses in 'struct dw_pcie_ops'

> Both DBI and ATU physical base addresses are needed by pcie_qcom.c
> driver to program the location of DBI and ATU blocks in Qualcomm
> PCIe Controller specific PARF hardware block.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 2 ++
>  drivers/pci/controller/dwc/pcie-designware.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 1b5aba1f0c92..bc3a5d6b0177 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -112,6 +112,7 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>  		pci->dbi_base = devm_pci_remap_cfg_resource(pci->dev, res);
>  		if (IS_ERR(pci->dbi_base))
>  			return PTR_ERR(pci->dbi_base);
> +		pci->dbi_phys_addr = res->start;
>  	}
>  
>  	/* DBI2 is mainly useful for the endpoint controller */
> @@ -134,6 +135,7 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>  			pci->atu_base = devm_ioremap_resource(pci->dev, res);
>  			if (IS_ERR(pci->atu_base))
>  				return PTR_ERR(pci->atu_base);
> +			pci->atu_phys_addr = res->start;
>  		} else {
>  			pci->atu_base = pci->dbi_base + DEFAULT_DBI_ATU_OFFSET;
>  		}
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 53c4c8f399c8..efc72989330c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -407,8 +407,10 @@ struct dw_pcie_ops {
>  struct dw_pcie {
>  	struct device		*dev;
>  	void __iomem		*dbi_base;
> +	phys_addr_t		dbi_phys_addr;
>  	void __iomem		*dbi_base2;
>  	void __iomem		*atu_base;
> +	phys_addr_t		atu_phys_addr;
>  	size_t			atu_size;
>  	u32			num_ib_windows;
>  	u32			num_ob_windows;
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

