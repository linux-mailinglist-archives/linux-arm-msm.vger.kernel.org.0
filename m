Return-Path: <linux-arm-msm+bounces-50438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70AA54181
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 05:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAACA3AB6A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE1119922F;
	Thu,  6 Mar 2025 04:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUcvTTC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401A8460
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 04:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741233761; cv=none; b=ScYBRiAiBadOnkvNNamdWjTcmd0dXVYs1cATcRB3EDxGzOsHLfbuQgwbcfipRgrEaUyXKO8i6GJl8KD50lfTW43m+B+OaQlEj8UQtfr4FRLWhwZmUWZfjHav5Eq/WTsVqBqsw5vLFGzIRhu904ldAjraFeG2QG5ICa+dNVlF1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741233761; c=relaxed/simple;
	bh=Yz1TyZtoyOO+yp3SF0XFsZRQSomWzxQO3JYSPKoWncU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBtwI2qNvb28ftngWEHegjICUvPmHGb/3m3D0Jq9kyagHBxS1a0/+pi2fjEaBP7Kt55AOlFS7X5NNI9Oar2bZe30wlGspwwvN+b9A77sETGAjDUadW21R+le6C0aBOtAx6aku//YXmW6HNkoHDl7C5VOuUTbaTcWZmA+BgxPSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUcvTTC+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241053582dso2810325ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 20:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741233759; x=1741838559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lw/Ilrya6j097GwWNVWOLhnadgHKgXHG+cTCcShhr4s=;
        b=qUcvTTC+5YNsFtGf1k9h8cwW12WCs0x3yzyND01DT0FxDJo5s/HDmKocPs594cPJWb
         rqDudAFee7DXcpWYmJB419kjL7NchSJGG4zNNp71eug/pTcAwnG1X7W6xT911teSCrg7
         Tr4dkqJ+Znq2AQNZio2ObuUkXc8F6nUK8nIp9kUh7c277RmLYRqrqhoaheKKWJPzGRzs
         clRFccfCBwmsm/PEwSEnLOsLyZetSHQfwWlnlbK8J2fX6c7r2JKmAeYGRpZa9ecrm6tl
         Z2PiybWDU7Ud5pVCSwBpNlzG5s8RrwUZvodGNL0gGBtrF4i74Sx2xGsKRt8I14pEbzBM
         9RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741233759; x=1741838559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lw/Ilrya6j097GwWNVWOLhnadgHKgXHG+cTCcShhr4s=;
        b=c8EJCdRvZIZcZUC0BmO534uODx8wpOkVQcclzHrtVBSgHwY/7XYk55fhnxAhigNCmb
         +Ut8GZuwryWhWw3vQ8plUEqR7s/cCUp6WKx1zSnKoclXIjozlJ2rIGElQME8vpIVIWCS
         gvSlDvw91rcu0eU/K9CeSfcLIb01vXH3wEfe/2GkH0O8ID8tUXCoolt5ouwAVImugqi/
         GdQHt0CCnxbvxv5resZywa85+z5H1U2g20e5ywenit0uCGJsz0AX2k0vSpH71cUv7N8T
         6YN25viOUAmFo/hZVjnDyE7/Vt2r5MQysZqW3r0QjM69WBTF47cUu/wdpPKeOS+LtTvG
         kItw==
X-Forwarded-Encrypted: i=1; AJvYcCUjpfzZvhyDnc3Nqvp42Kfb3gixcy6ldWk2cykMoJk+jYFGkgPx4p3AFTKgGCngnMjdG2e28qEYlWpgwL+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+49knmXiLM/s3U7lE/scfiA9wTH/0PpLGco06pdFMSzXbRr0
	IfumJ3yRIZQrdCz+3Lbb1piReOVk8JpOjwYtG7IJEzzz4mUGgKflTplpiqdRWg==
X-Gm-Gg: ASbGncs6zpmdCGlh2RBVZ0Nb2sVt3ybGb6OsXWcqEKi8PFnxUH/vy1GUxxZgKSaya40
	rLSeugAiQAEXWFqFfDH7PFR/xakn47iasdcbM6pIMsUFBMPjicHWcnPHFhR6nWkjolhsKkX1m1T
	LsNlZgMMmBAZOiSz+WSlJvsJE7pTPqNUdGFuh25VbwaPSeqFdh+xQjcwy3t5LRWWhp+nxUnojUN
	lbnaryOQN3HtVyAHGJ0yYVBK1W/DNoq7oDw5swwb6EkgYoNWd3KI4c2rJ1K6H3HUDyjqYswL0vg
	GWdd0rIEz/NrQsc2Fu32rcNg3t3IJajiDO+GnfD0Ro8N9LqD6QtjZQI=
X-Google-Smtp-Source: AGHT+IG58paYn+J+qgT5QJO3fC3chvu880+fbbmJM8uArZCejhZm8gCUKnLMrFc6lv742T5le2yV+w==
X-Received: by 2002:a05:6a00:c8f:b0:736:6b94:146d with SMTP id d2e1a72fcca58-73682d101e2mr9298228b3a.20.1741233758652;
        Wed, 05 Mar 2025 20:02:38 -0800 (PST)
Received: from thinkpad ([120.56.193.59])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm252836a12.30.2025.03.05.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 20:02:38 -0800 (PST)
Date: Thu, 6 Mar 2025 09:32:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v7 4/4] PCI: dwc: Add support for configuring lane
 equalization presets
Message-ID: <20250306040232.rkvxirmeropy44mu@thinkpad>
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
 <20250225-preset_v6-v7-4-a593f3ef3951@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225-preset_v6-v7-4-a593f3ef3951@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 05:15:07PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
> 
> Based upon the number of lanes and the data rate supported, write
> the preset data read from the device tree in to the lane equalization
> control registers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 66 +++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
>  include/uapi/linux/pci_regs.h                     |  3 ++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index dd56cc02f4ef..ea596119de92 100644
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
> @@ -808,6 +812,67 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
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
> +		presets = pp->presets.eq_presets_Ngts[EQ_PRESET_TYPE_16GTS];
> +		lane_eq_offset = PCI_PL_16GT_LE_CTRL;
> +		cap_id = PCI_EXT_CAP_ID_PL_16GT;
> +		lane_reg_size = 0x1;
> +	} else {
> +		dev_WARN_ONCE(pci->dev, 1, "Not supported data rate %s\n",
> +			      pci_speed_string(speed));

No, this is not what I asked for. You should warn only when there is atleast one
of the preset properties are specified in DT. But I think that would complicate
the code. So let's just trust DT here and add the warning later if needed.

> +		return;
> +	}
> +
> +	if (presets[0] == PCI_EQ_RESV) {
> +		dev_WARN_ONCE(pci->dev, 1,
> +			      "Lane equalization preset properties are missing for %s\n",
> +			      pci_speed_string(speed));

Same here. This is going to trigger warning on all DWC platforms. Please remove
it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

