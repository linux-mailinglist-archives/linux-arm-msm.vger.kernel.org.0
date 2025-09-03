Return-Path: <linux-arm-msm+bounces-71710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CEB4138B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E1E1B20ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 04:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813E92D3750;
	Wed,  3 Sep 2025 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dBqIbFBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1C1A9F99
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756873707; cv=none; b=MtzVtR4Ih2GZ/RmmhEsvCjiraGfFBolilSOXWrrwCfsxN6FJmro7cwJ16KKRDl17kgwUSXdtI+e5jKCzP22lUSCVS5pc+5M+IfbrbZNnMrc0wRdJdTsZCWNTeI5JvNc8C6pl5IAyfJSwPJefTiEBU2kOXCAyuKuNJhNjb4MFPXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756873707; c=relaxed/simple;
	bh=rzQOIiOOgo8Bl7ImQyPmenuJvoK1gvj5EgcM1s5npLY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=AxwwNGrhcmjVxo+wY3FjJHMGB7Kh4J50+sK1W7FDIFwnbYvarnYUNeBObyi71Snl1Ux+cN/VivRc9B0nH/1RjBdIPEvqW/OThqPKhU0muKBEePIY7MQQju6rJ41G5LA6MGpElYXf40ud/z3N+ZQoMIF6N0mLoTFjJPxHdKaEf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dBqIbFBp; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250903042823epoutp033067b9ef06784555a9c8350c78003609~hq1MX-Pf_1320113201epoutp03k
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:28:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250903042823epoutp033067b9ef06784555a9c8350c78003609~hq1MX-Pf_1320113201epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756873703;
	bh=4z/3Wi1eUiYqGMgmAAnBBhtwdX8IJWlmAPv7y2AI0zY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dBqIbFBpomLu+s0zM90unBBR3MaFPNORAEP361BccKz6lrWpPzv7Xwe7sDlkyFNha
	 xRW8G/YWYdspAeAyz0hNRRxD6CV0DohNstOPCrb/5ElseQcNmi84ZLDI85oNJv9nQ5
	 ps+uPRf/e1wyPqbqS/GbruHjJFXlwwkb11foZfSU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250903042822epcas5p41e705b5815d3ca3fc53e39b4eb58a097~hq1MJKBRg0277702777epcas5p4E;
	Wed,  3 Sep 2025 04:28:22 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGqNj2Ss4z3hhT4; Wed,  3 Sep
	2025 04:28:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250903042820epcas5p2811be3432a678c59f99a118e28a9f820~hq1Jmde3W0253402534epcas5p2J;
	Wed,  3 Sep 2025 04:28:20 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903042818epsmtip1fdc1da40fbc789005c33ac7a6322b930~hq1H2bREI0216802168epsmtip1O;
	Wed,  3 Sep 2025 04:28:18 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ram Kumar Dwivedi'" <quic_rdwivedi@quicinc.com>,
	<avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
Cc: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "'Nitin
 Rawat'" <quic_nitirawa@quicinc.com>
In-Reply-To: <20250902164900.21685-4-quic_rdwivedi@quicinc.com>
Subject: RE: [PATCH V5 3/4] ufs: pltfrm: Allow limiting HS gear and rate via
 DT
Date: Wed, 3 Sep 2025 09:58:16 +0530
Message-ID: <3a9001dc1c8b$2d303c40$8790b4c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDbtq+ZX022GZqTIcIYj1g81c9NHgJq+hI3AQZfT0q2ZhhPUA==
Content-Language: en-us
X-CMS-MailID: 20250903042820epcas5p2811be3432a678c59f99a118e28a9f820
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250902164940epcas5p47c93faf63a98377e97f3f6d06fe23f96
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
	<CGME20250902164940epcas5p47c93faf63a98377e97f3f6d06fe23f96@epcas5p4.samsung.com>
	<20250902164900.21685-4-quic_rdwivedi@quicinc.com>



> -----Original Message-----
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Sent: Tuesday, September 2, 2025 10:19 PM
> To: alim.akhtar@samsung.com; avri.altman@wdc.com;
> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mani@kernel.org;
> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Nitin Rawat
> <quic_nitirawa@quicinc.com>
> Subject: [PATCH V5 3/4] ufs: pltfrm: Allow limiting HS gear and rate via
DT
> 
> Add support for parsing 'limit-hs-gear' and 'limit-rate' device tree
properties
> to restrict high-speed gear and rate during initialization.
> 
> This is useful in cases where the customer board may have signal
integrity,
> clock configuration or layout issues that prevent reliable operation at
higher
> gears. Such limitations are especially critical in those platforms, where
> stability is prioritized over peak performance.
> 
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  drivers/ufs/host/ufshcd-pltfrm.c | 36
> ++++++++++++++++++++++++++++++++  drivers/ufs/host/ufshcd-pltfrm.h
> |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-
> pltfrm.c
> index ffe5d1d2b215..4df6885f0dc0 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -430,6 +430,42 @@ int ufshcd_negotiate_pwr_params(const struct
> ufs_host_params *host_params,  }
> EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
> 
> +/**
> + * ufshcd_parse_limits - Parse DT-based gear and rate limits for UFS
> + * @hba: Pointer to UFS host bus adapter instance
> + * @host_params: Pointer to UFS host parameters structure to be updated
> + *
> + * This function reads optional device tree properties to apply
> + * platform-specific constraints.
> + *
> + * "limit-hs-gear": Specifies the max HS gear.
> + * "limit-rate": Specifies the max High-Speed rate.
> + */
> +void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params

May be s/ufshcd_parse_limits/ ufshcd_parse_gear_limits()

"Limits" is very generic and also not aligning with the property names.
Also suggest to change limit-rate to limit-gear-rate.

> +*host_params) {
> +	struct device_node *np = hba->dev->of_node;
> +	u32 hs_gear;
> +	const char *hs_rate;
> +
> +	if (!np)
> +		return;
Probably a overkill here, please check if this will ever hit? 

> +
> +	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
> +		host_params->hs_tx_gear = hs_gear;
> +		host_params->hs_rx_gear = hs_gear;
> +	}
> +
> +	if (!of_property_read_string(np, "limit-rate", &hs_rate)) {
> +		if (!strcmp(hs_rate, "rate-a"))
> +			host_params->hs_rate = PA_HS_MODE_A;
> +		else if (!strcmp(hs_rate, "rate-b"))
> +			host_params->hs_rate = PA_HS_MODE_B;
> +		else
> +			dev_warn(hba->dev, "Invalid limit-rate: %s\n",
> hs_rate);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_parse_limits);
> +
>  void ufshcd_init_host_params(struct ufs_host_params *host_params)  {
>  	*host_params = (struct ufs_host_params){ diff --git
> a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
> index 3017f8e8f93c..1617f2541273 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.h
> +++ b/drivers/ufs/host/ufshcd-pltfrm.h
> @@ -29,6 +29,7 @@ int ufshcd_negotiate_pwr_params(const struct
> ufs_host_params *host_params,
>  				const struct ufs_pa_layer_attr *dev_max,
>  				struct ufs_pa_layer_attr *agreed_pwr);  void
> ufshcd_init_host_params(struct ufs_host_params *host_params);
> +void ufshcd_parse_limits(struct ufs_hba *hba, struct ufs_host_params
> +*host_params);
>  int ufshcd_pltfrm_init(struct platform_device *pdev,
>  		       const struct ufs_hba_variant_ops *vops);  void
> ufshcd_pltfrm_remove(struct platform_device *pdev);
> --
> 2.50.1



