Return-Path: <linux-arm-msm+bounces-52710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A038A74306
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 05:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170F91893380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 04:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBED9E573;
	Fri, 28 Mar 2025 04:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpDijQ49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DA14F11E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 04:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743136838; cv=none; b=lbidZciXBHypgW/BBpMwobLwUg+TOUGm8Q2hwFHzqIcWVkwLRWbk3jlIaJGSOKtSt7qElak4f54B468KnngRa+HEt1Dh8x6nBGycjbkK1YfErkkiMLdgF+WlmAXKUej25dbGttHuLVvvwGsi8SSJdBC6Da5nRL27ATEHEshLym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743136838; c=relaxed/simple;
	bh=p5fy0e8UnKj/6EOZNFdLxiQh/zOADi2Pftr3/8rO8do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u55i6mwWj4BqfiTWGMFgXHbtck3fX/jSwXwEEcmWKpVbQtIn3MJJcB9WNhkgbwKKh+rXhe5IG055hADfQb60fv4A7/XZZFyMC9I1Ll1O9Rxq2Iumk34W9u1HekSneH0divY1hlodANMhMp7rxiBiYtMdc2LRw+uWgPnnshd2ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpDijQ49; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3015001f862so2100012a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 21:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743136836; x=1743741636; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BwyCKs3ffYhEw8XJUYb5si/FG4nJvu4s2NWwvaiC0iI=;
        b=xpDijQ49eIsd6ToQG3nn6SLh3lVrPhCdroAqm8nyp81x99oK79KCJhj49rAcb1khaF
         45OYAGTAXQnJ31FDJIIhqSfkDDSt3Peyf1AVVfP59pNNZxAS7HyelOzWZZoYDWltryYl
         EoWqk7DpRr2vrIuvE5m/nla2KQ4EmPwANGo4Fdmjta0p9Y4Tjid2Gdl0cpgE3wjS5bo7
         tvAi3GhsR2YYfu2eisB7pP7KWgHQy/uM2dy1g9DUEMRSK5xJbZeN5QjVhvO2TvUqlXqw
         cq5kzoPTxnqT7nUN2iWzhJlT+hrOsC3f5K+iWWpUmDZsU39+60rcIAMIjapx/Ai8Z9Nt
         2Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136836; x=1743741636;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwyCKs3ffYhEw8XJUYb5si/FG4nJvu4s2NWwvaiC0iI=;
        b=fYwwVf9eqy+XkDPsm7UpSdDgBa/cFG0iPUFVqeS2ZiC6ygPNXnN8LCWmeHW+n8GiBg
         sHFlDn+9O/WlrVlNfDNLOp50wJbO63Rr4GtY2CBKe3AOi3lJoCXtyM9e+btUT+XOB94s
         cjEJu1io5HaFGe/RqfaEnB1XyHmbPxGhC3GMP2Qft9HEweeNmicHimNDs9Fkav46dxgw
         H50ppwVWd4EeS0Z25BP2YG6T2GnfdXMOWD4D60eh//y9uzIYo7Qf0bsJxj3PFWJizu5G
         gB2EZ+ptyuofE45oK+MfmCfD6ekpHm4kFHoa0YR0XB6lnr52k7ieXEunJGksG8adMfd3
         dRBw==
X-Forwarded-Encrypted: i=1; AJvYcCWvCAVrQJd2bUl/E1itPPd+srb7SttewsAZJQMZmh+h7DooKm4epgfuhHFFPOpey6O2qGAE+QELuJ13hb7C@vger.kernel.org
X-Gm-Message-State: AOJu0YzFu9ppq7eqb7Br+IVbxChLH1kPqiUl4N8zI3z3AszZN5LDy8dj
	wMLfLg0CO+ouKsG1bGmVca5dxNCwYxLt37apXTElKVuvGNFLkOze9iwQiiIzFQ==
X-Gm-Gg: ASbGncv0/w7KfcaG4frA4GvkO6xXTnc6h/zQqUN5bkQLTwia30Lzv/U4oIWCSP54onQ
	RWutcYb2BIdNnx3A4R24+/Sakgx7eIs2h0une1GruRoO9xrG46Tv91gK8xpgwbtuLutbBYwTp4H
	uewGSP8QjdXOyuguOSCNHJhZp1hLmHhFqgB3pOru860beEWZ91GNfeboDOyALEpGstmFITr3Kb+
	LJ0KKUdzqHzPDJbfOyaYivTcdfLxfK7FbzvZKYrZf+wOKtPbOAF4CrhoOvb2o1+5EwXmW/Vti8e
	qyGg6f4ig4wXFW06il/OTtGq3lTnyPhKIAcA6tR1W1tfuTDjX1rU2x0=
X-Google-Smtp-Source: AGHT+IHLrH4hU9KBbLe34G/CtIab3OeOyeA8IEERFB9C2/MoUYF2i6YlkrlpKLD9/6Z8JDvvgK8ZSA==
X-Received: by 2002:a05:6a21:158f:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-1fea300d25bmr10714712637.42.1743136836491;
        Thu, 27 Mar 2025 21:40:36 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69b127sm736704a12.17.2025.03.27.21.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 21:40:36 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:10:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v8 3/4] PCI: dwc: Update pci->num_lanes to maximum
 supported link width
Message-ID: <meczqjvdwfietottcw756lhk2cg4f6szqppknnkbdtqd3hmafp@7cgg7kjnnw76>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
 <20250316-preset_v6-v8-3-0703a78cb355@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316-preset_v6-v8-3-0703a78cb355@oss.qualcomm.com>

On Sun, Mar 16, 2025 at 09:39:03AM +0530, Krishna Chaitanya Chundru wrote:
> If the num-lanes property is not present in the devicetree update the
> pci->num_lanes with the hardware supported maximum link width using
> the newly introduced dw_pcie_link_get_max_link_width() API.
> 
> Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
> width the hardware supports.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
>  drivers/pci/controller/dwc/pcie-designware.c      | 8 ++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7..dd56cc02f4ef 100644
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
> index 145e7f579072..f39e6f5732a9 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -737,6 +737,14 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
>  
>  }
>  
> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
> +{
> +	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
> +
> +	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
> +}
> +
>  static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
>  {
>  	u32 lnkcap, lwsc, plc;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 501d9ddfea16..61d1fb6b437b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -488,6 +488,7 @@ void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
>  int dw_pcie_link_up(struct dw_pcie *pci);
>  void dw_pcie_upconfig_setup(struct dw_pcie *pci);
>  int dw_pcie_wait_for_link(struct dw_pcie *pci);
> +int dw_pcie_link_get_max_link_width(struct dw_pcie *pci);
>  int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
>  			      const struct dw_pcie_ob_atu_cfg *atu);
>  int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

