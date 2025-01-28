Return-Path: <linux-arm-msm+bounces-46371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF3A20984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C1E1884E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B8E19F438;
	Tue, 28 Jan 2025 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzg+grQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8619F111
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063250; cv=none; b=CixTeq/vGJCahNH24OI/rnng8YrznYn9OunQsAXdMq6m+IM2L2UWEcNhPsAa1qazY19y8fRjAEQey7eBLMpEe+iR6dDxc3Vd4oFs1VCu0YlBhSFbr6R0hIIinnXFDTJ6eNQFcy4TwBdHqR7UZ2j/PhQaICYvNdQDyDcrcweyqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063250; c=relaxed/simple;
	bh=95gVht3YcwBeEiCZoSuMk42iTg0vIPG1PLzrGSh/O00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZKXYODQFRabWEmkI9qothPTeGslxHitCHd22A8MKgLk5ThrJpYXszAuumbZRGmf1mkoV2M6uxiTTwv/+Y6GEBngL7ZSUS3CxTyOmMurQPc+NCev1RsihMj1dsO92iYqoo8r/KKWUACfuSMJAV7EUBPxd1PIKBfhYf6xUM1tgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzg+grQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SATEBo000981
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzxWEASsohjyGgnEjzaEveR9Bm8gU2lb4xDgftVE5Lk=; b=Yzg+grQUGXNbhvA2
	iSwm+wOfyl3Nf/Ucf8lM+kHPKoaGnepyYQzwuez7h0ehbC1K7ezZMvL4BytcyGOj
	5RY1pvwGnWSxnVtGZ75yUVejfcHOZeIda8aLvq4gDmzBr+ynZAAb2rNAxsvuD6zG
	ZbFLXsb7hq49BdTVIklf0hmehLOKgpPegyxLgA1pWQSAk8RpMvMXxR+WS0jckj+J
	mlYFu9UzOgUXWC6aGoFOeX+G/7oDoeLizeojTGJ0ZXNvfPoejNJtlqAeX04PQr6q
	0kqwdE7JnHh1rR15JhOXf99CwGUNCvSRzOrqnikKAHMgVkH5aFrPskrKXpm1+Gbs
	x5i+5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ewh483yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:20:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6f7207cbso146943885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063247; x=1738668047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzxWEASsohjyGgnEjzaEveR9Bm8gU2lb4xDgftVE5Lk=;
        b=WqWhXmi//nbWLxMTixmfRAi8FdvBqe1evzeSpTkiioVj4IR5rRgNX+Z/Zn18m/Kl+h
         dMj75cp618pnnxXBDVhUYEath2MfUX+ZV5zr2FcQ2ptMCwerEEZt0LNF25CQIkmsUnFG
         7W+U3gwtmCtPfrQrPiCPxg8JLUlmS7jmVNa9BnAD2Ifn1w3bK9EqWnkAiZpYX2jXzets
         BpWYd0Bf/qkNONTgi8R7wttxjnGgatXCsbWfmo6LB5yG3qc9OQiS2Qfy0M1IrwF4ERXT
         TpYFKzm0Ytp4zFu/A1APftURWrCCzfgeOQQ/sg0zcnqAnZ71bI8fUnfjqNexzZxn+AFL
         fGEg==
X-Gm-Message-State: AOJu0YzCCw5m8PMHhfFOsJXeKOIr82UCQJRDMIr73WStsw8MCMY+W1rd
	n1Jy1l5Ujm/9r+GFZbjm9OhzAC5TULdjlATW3tOE7g16FKSr6FG8Onb7snfoKrw40ofjxLoqI0m
	PcH/96gNTxbWbc2/SpEX3UZqdCjJIRzr+gS0wELlI+hiMrldFqT+5GJyiUIIkuIBH
X-Gm-Gg: ASbGncsmDNfd9SBWdKcY4O56nU+oP1C2GTjIZDI27r+bEY0b1LB4yIYD0FQBjfVvAs0
	FaozQopIaLTwg2Pi8XmFDFBJ6e2PHeWaooLNC47goGPl/cPF5DFX8QSWifRG6kJMYBzz5l5xtEY
	MuJivfLPPUqtHJCujXs+ui+sh5bpFKN9dWg8DJEDYzpxiJHtKYSIQO4fAbCUOkPo0XdggIN1llO
	pAezfX1iT/41OfegAP6Pz9V7+OYWkYxpjbRBC4o+SpfHt+vwIog74mz8hom1LJRpwZgHXbg4PxC
	mYTbK4NdaHR+T9rWOdndJULfFS9NvdcM0VgEIs1PEzmtT4txHRx06kVYDGE=
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1325204585a.12.1738063246693;
        Tue, 28 Jan 2025 03:20:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp1tQ13yvWpG2tcE0J9Lh5q25rkwAgRhvpJ/SB+42eYIpwp4WMy9BDSSi0nCPeUQyGPLEA0w==
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1325202185a.12.1738063246256;
        Tue, 28 Jan 2025 03:20:46 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbbbasm765535266b.146.2025.01.28.03.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:20:45 -0800 (PST)
Message-ID: <3cb2c5d6-3ee2-4a48-96c2-40f464c22f52@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:20:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] PCI: dwc: Add support for configuring lane
 equalization presets
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com>
 <20250128-preset_v2-v5-4-4d230d956f8c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250128-preset_v2-v5-4-4d230d956f8c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: luTzS0vzggD51jYn9v3Fmz9oMQ4R-l8d
X-Proofpoint-ORIG-GUID: luTzS0vzggD51jYn9v3Fmz9oMQ4R-l8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280087

On 28.01.2025 10:37 AM, Krishna Chaitanya Chundru wrote:
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
>  drivers/pci/controller/dwc/pcie-designware-host.c | 41 +++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  3 ++
>  include/uapi/linux/pci_regs.h                     |  3 ++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 2cd0acbf9e18..f458b4c70053 100644
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
> @@ -802,6 +806,42 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void dw_pcie_program_presets(struct dw_pcie *pci, u8 cap_id, u8 lane_eq_offset,
> +				    u8 lane_reg_size, u8 *presets, u8 num_lanes)
> +{
> +	u32 cap;
> +	int i;
> +
> +	cap = dw_pcie_find_ext_capability(pci, cap_id);
> +	if (!cap)
> +		return;
> +
> +	/*
> +	 * Write preset values to the registers byte-by-byte for the given
> +	 * number of lanes and register size.
> +	 */
> +	for (i = 0; i < num_lanes * lane_reg_size; i++)
> +		dw_pcie_writeb_dbi(pci, cap + lane_eq_offset + i, presets[i]);
> +}
> +
> +static void dw_pcie_config_presets(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	enum pci_bus_speed speed = pcie_link_speed[pci->max_link_speed];
> +
> +	/* For data rate of 8 GT/S each lane equalization control is 16bits wide */
> +	if (speed >= PCIE_SPEED_8_0GT && pp->presets.eq_presets_8gts[0] != PCI_EQ_RESV)
> +		dw_pcie_program_presets(pci, PCI_EXT_CAP_ID_SECPCI, PCI_SECPCI_LE_CTRL,
> +					0x2, (u8 *)pp->presets.eq_presets_8gts, pci->num_lanes);

If you move the != RESERVED into dw_pcie_program_presets, this becomes more readable

otherwise, this looks good

Konrad

