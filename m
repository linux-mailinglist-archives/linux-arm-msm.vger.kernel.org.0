Return-Path: <linux-arm-msm+bounces-52998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F076A78958
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 09:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283CE188A626
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 07:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B69233707;
	Wed,  2 Apr 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3j0bVQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B6233D86
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580780; cv=none; b=qiGIh7vRPuF3WaKLb1VXgfDHti5mEzxnM1uXfhx9/hqR49444MDH3xiVk2mJ7SixjSZLw0OA4R2zYRgSLs1NsTu4ddKsd221+tRbNREcx3oYA/x43v5S4nNStqti8eh3NocaEkpGSBwBHjNLX4vLn/yPkwuNL9ABElHtxE9au8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580780; c=relaxed/simple;
	bh=EeAEFKVFkeTVTY4MKWIbOh97BEkD1xjvPChnfwRJj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCz/Hs5tzMFpuz5OgLtp0/7V3tmXmzBfXUNkKS1jN+vcmtmDflkMRO8+k3/73OeQfU9fXss56TBVub4ggDEH4hNdrsnnpTvJ5PzZTf0sFWzv7cRZTWvvZNBhuUs5DysejZXqSLuYCVaNf3EW7i+2Ub6PRHk6q0yKekzXBqhMeTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3j0bVQs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22622ddcc35so54645475ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580778; x=1744185578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNQJSqgVcQ2iPgaLBe7WIY8ZsQ9nSS3RuMEpdf6p8IE=;
        b=w3j0bVQsYy9sP1A2LphVvUn2DgSUdu9jKVsnm3wWqzIKK5ME1itWQiJD5Ek2lfUmms
         d/NoujgDcwQfy8fmG/45ToR3BEc8KUUZDl9M/m7MJqkgzK2NDflgCXCx9NWwzD3BYLA3
         vqfFgka6mxB2PIFPEGeF0WSnSVnvcnNaILx0lAKUCYwv+z2e58pSbkjJi71ir7IsJoM3
         Jbtzquh7POdTaHvF6PxjGULwLr8PzmlpIvdgr1f5AYQc/dkSbY0qcmjuY5G/+shtcRhU
         86ek7Scl8T3fm5nnJYdoFG0PJdh9P/HNFHAI5TnwexL1shougnC3t8zM2BPE4tZ28ZOF
         WVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580778; x=1744185578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNQJSqgVcQ2iPgaLBe7WIY8ZsQ9nSS3RuMEpdf6p8IE=;
        b=QM9zKLDcIqW2EYNTWB/d28r+yw86S6d98batebuWrnONhDj7kNz9eb5Q5hlCN9eSq9
         LGcik3/BsV4FBZo83bCgJ3RzBmG2SvAFKuZno5b3MGZGcNFxqYulB9PqyF0pVKjP4VhK
         A1nFg5igk3+6I9OO+fczG0jFRw9aBaXeC0+IpgyPfmOhAVKDHrWWORWDTl4gEy/+ewEM
         sdmjWtmzmTraWMdweU647g+sw70jyfYDLPb5W1uNZ2Ii+7I4pJcB8PjUnEm01V2td/Mq
         ahUEsDbg9VWomTpCPGa8VKtwuW50zMxWOdrr6cpuOL/monx5rIp8umFuelJdia/v7mKm
         Ho9g==
X-Forwarded-Encrypted: i=1; AJvYcCWAkmFnwTioFvkS4An4S95k2+ymGd+eGGaQF19UauPSURDOpyMIDuZnfu+Ewuwk9ikf3era/vgUSc2n4pYC@vger.kernel.org
X-Gm-Message-State: AOJu0YyHx/Dy15eUsm/1AwyAHEr48qu9uVQhSw8hLjxo9foW12FnHIxu
	ti6r0wv6fos+QnJEWSH0gUWkM1TCSnD31NYpsReyGFZnTIG2jmanoR30VZPnng==
X-Gm-Gg: ASbGnctXqm0VMkL9FCT9GE1/3/KKVYJQtv49BSCzMrOlZXHP8CQAFlVtgx3PlbVu9Cr
	/GdvebqBu30GPtwN7mc7NHr8I0qMrRV045Td0SnF2TS2MXe4B4gOUffv0Tv5pEsRRpz1Utvc73+
	ny8NDeH5t8IcvIAbbVGfvjtjmb4CIx5VF4UTtgLFeJlHq6pg1yaDWE9myC+V0gV2X/5SBLzj84U
	PJKylF5zCTSnX9iDJpcsshXK1cwbbj6RF4oYFo4Z3HEh5kdNq9Z73oIhogAycfLuE+9FQjwxpJ4
	sowqnQRLzso2gSN/OX4l7houhDLDH8wIa8z3PlS9GXEn3tYEZ62VU5lL
X-Google-Smtp-Source: AGHT+IHHtIKZamquGvlYQKBeDMhKCjad+kAxu1cMMSeS4Ryti5qYcRLU0/Yjc8yzunZ5hH6601Gojw==
X-Received: by 2002:a17:903:94e:b0:223:6455:8752 with SMTP id d9443c01a7336-2296c8785acmr22734265ad.43.1743580777749;
        Wed, 02 Apr 2025 00:59:37 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedb5sm102207125ad.176.2025.04.02.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:59:37 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:29:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v9 5/5] PCI: dwc: Add support for configuring lane
 equalization presets
Message-ID: <sj2tjrj2lqeuoaqtbsjgdryiclcykexxuorxfuaxpdhqy42hmb@aajog6mmkayh>
References: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
 <20250328-preset_v6-v9-5-22cfa0490518@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-preset_v6-v9-5-22cfa0490518@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 03:58:33PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
> 
> Based upon the number of lanes and the data rate supported, write
> the preset data read from the device tree in to the lane equalization
> control registers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 76 +++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  3 +
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index dd56cc02f4ef..153f9ce93ccd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -507,6 +507,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (pci->num_lanes < 1)
>  		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
>  
> +	ret = of_pci_get_equalization_presets(dev, &pp->presets, pci->num_lanes);
> +	if (ret)
> +		goto err_free_msi;
> +
>  	/*
>  	 * Allocate the resource for MSG TLP before programming the iATU
>  	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
> @@ -808,6 +812,77 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u8 lane_eq_offset, lane_reg_size, cap_id;
> +	u8 *presets;
> +	u32 cap;
> +	int i;
> +
> +	if (speed == PCIE_SPEED_8_0GT) {
> +		presets = (u8 *)pp->presets.eq_presets_8gts;
> +		lane_eq_offset =  PCI_SECPCI_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_SECPCI;
> +		/* For data rate of 8 GT/S each lane equalization control is 16bits wide*/
> +		lane_reg_size = 0x2;
> +	} else if (speed == PCIE_SPEED_16_0GT) {
> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS - 1];
> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> +		lane_reg_size = 0x1;
> +	} else if (speed == PCIE_SPEED_32_0GT) {
> +		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_32GTS - 1];
> +		lane_eq_offset = PCI_PL_32GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_32GT;
> +		lane_reg_size = 0x1;
> +	} else if (speed == PCIE_SPEED_64_0GT) {
> +		presets =  pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_64GTS - 1];
> +		lane_eq_offset = PCI_PL_64GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_64GT;
> +		lane_reg_size = 0x1;
> +	} else {
> +		return;
> +	}
> +
> +	if (presets[0] == PCI_EQ_RESV)
> +		return;
> +
> +	cap = dw_pcie_find_ext_capability(pci, cap_id);
> +	if (!cap)
> +		return;
> +
> +	/*
> +	 * Write preset values to the registers byte-by-byte for the given
> +	 * number of lanes and register size.
> +	 */
> +	for (i = 0; i < pci->num_lanes * lane_reg_size; i++)
> +		dw_pcie_writeb_dbi(pci, cap + lane_eq_offset + i, presets[i]);
> +}
> +
> +static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
> +
> +	/*
> +	 * Lane equalization needs to be perfomed for all data rates
> +	 * the controller supports and for all supported lanes.
> +	 */
> +
> +	if (speed >= PCIE_SPEED_8_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_8_0GT);
> +
> +	if (speed >= PCIE_SPEED_16_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_16_0GT);
> +
> +	if (speed >= PCIE_SPEED_32_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_32_0GT);
> +
> +	if (speed >= PCIE_SPEED_64_0GT)
> +		dw_pcie_program_presets(pp, PCIE_SPEED_64_0GT);
> +}
> +
>  int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -861,6 +936,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>  
> +	dw_pcie_config_presets(pp);
>  	/*
>  	 * If the platform provides its own child bus config accesses, it means
>  	 * the platform uses its own address translation component rather than
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 61d1fb6b437b..30ae8d3f4282 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -25,6 +25,8 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +#include "../../pci.h"
> +
>  /* DWC PCIe IP-core versions (native support since v4.70a) */
>  #define DW_PCIE_VER_365A		0x3336352a
>  #define DW_PCIE_VER_460A		0x3436302a
> @@ -381,6 +383,7 @@ struct dw_pcie_rp {
>  	int			msg_atu_index;
>  	struct resource		*msg_res;
>  	bool			use_linkup_irq;
> +	struct pci_eq_presets	presets;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

