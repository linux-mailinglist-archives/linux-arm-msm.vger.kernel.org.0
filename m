Return-Path: <linux-arm-msm+bounces-70591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92EB3397E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4AFE4845F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 08:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9AF2C0F96;
	Mon, 25 Aug 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBLsDGoq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516232C0F97
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756110879; cv=none; b=IdLxSqCOcdpPmvt3Fem2QtTI2nH+B3YEOdDaCx1EqE2NZqdzS2yPB2USTq6sQGTOjSqdiuUZ8dNjkR3cjBLLENShZ0SkkqT/mN87w253N/TQie2pgruO4a/wGS3vbYCYDs82s+Jf+7MpvBaVyQG2UGJi8K9hWmJnsLqyLxi8F60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756110879; c=relaxed/simple;
	bh=gEsEg64VijZ/pTtad733OV7S7W1NORMwb8cQ0DXAEp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=got0zu9svB3zCCcDicqYv3S0bA2exje9TFVfcgcvmW71vFyY2V9Zb/7EHrfK1JvNPL8YZ0I6wPPM6GfkuDDwLZ73K5ah/pDDCqZ+uGOJImDhAMmAxWGU5Rtd+R8eUcVr0r2GbHqJKnRRtFIRRGVTOlnZ++Sl0OYz6/ZEsLxW8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBLsDGoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8VPYQ009151
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 08:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WdVS1PidWtUzr3BYuRhDZBH122A8Dffpl49SOKSaHo=; b=gBLsDGoqZqt7zEcQ
	p+ZsLj3dGgw/sR1k8ZNtGC6+CMfdRAdA7+jN9qOZEEu0Cr9mSBOfFZ1ijkXAspaM
	+7/Upe1qOnzbdKmtvZXBpqixPSnfoSuQ17PAgsTw2rLq4xwaQzRkMwad5Ug/YkD/
	dEdi7Xh5RLdpE6B/TTSIDHbNCI/+A50if8SILz+wekvLH0Chf5Yzjs2kB/0Xvjqm
	Knnmtbuhl8OGz0xbT8HVEVYot6m8eg+XZvCpLVVp5/njjQf49znqsv4GNfaziTW6
	d67oisB4PtMrTUj0aUSkM6t0RrEsRHDjWgWVM2Jg0ezZsL0/+G9G96m8lSzxgyDU
	3mknPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfcea5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 08:34:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2460e91cf43so30681165ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 01:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756110875; x=1756715675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WdVS1PidWtUzr3BYuRhDZBH122A8Dffpl49SOKSaHo=;
        b=cCm8/35gVKBLQSjGAqLYf/JJMJPAq3rS5NdcPCv2/fuk/4DNwe7ULnTlqmXPUyHo18
         CXIRVVUJ2wI1Kg8YL6a15eCzmtGaOPHK6Nyx+kLpyMir3UBP4oXjfouIDGH/MKwP0/mP
         ar50pyrxkngVu3JXR/647MkCuF1XkFM+yGXZ3hxyO03rBlW0Rywplg8ZMZakqJXZXJ0t
         ia7P4FAqhvWweN38DXK5OC7xoodzf6jOeoeGhNO1jxvOcKNd18gwT5RzkDjn44n3ycjc
         +drkQgcobErSRXcRJDhDkRDWLIfDa6fB+g7TnbMSOyW7QBIpqMWXzpAMOp/BDXbYuSmX
         CSJA==
X-Gm-Message-State: AOJu0YwYlY4YywmUmZyz0tW36CXfWoyDMeXNMZtgvwRbNKba14JRzfO5
	/hr62MFlrm8+39byVvTmFCXcQGMyJXyEuiriYcAMpXOVT09f3H//ISrtXipxacc4cGI/5x5uooN
	GEYi3PQxVsGMjzsCR9jhRZaqPqUl0kuCP/kBrJYWz2kFXRji1sex/YZdVVi8qQ3Ad8N4B
X-Gm-Gg: ASbGnctlb4EudHdeVhuBCLHc0wuh9aBlSZBdHl1IlQsrgiFlcvtZqiN8owo0Xec7bYW
	fB951/qytB2QfBrTEPCYDiOc6HLVxfnTNhZRc1L1/u7wb9Yha2cBtY2y/RN3mns8CtYeFmKBych
	+ce5r4Rtvvan4H58nPSTxsKk++fHPLReezddL+sv2Wn4myPb6dLOITSHZ2zTIsC5spVUh/BApA9
	SdZTgT6sYRug9F5drnDiuD1I6B6ohxgP8ZQNtGrwqKF6qEEL29uueGyaaqs8eMQM7ttWoeTOf/E
	Mr0as3ucFSSDsKaWkBi9z8Z2vV18Fwdu5eDXs8OfEMKLdrA7rcpHgp+xenRYlpNsHxHKc882
X-Received: by 2002:a17:902:f64f:b0:246:9673:70a with SMTP id d9443c01a7336-24696730b7bmr60715525ad.13.1756110874737;
        Mon, 25 Aug 2025 01:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsaJeEk4MkiKQ0XmlLCSFVZmi71JUVovkgjbQWRrwLYYGlkOS8fK+M7e3A/GaOsmbYQmBsmA==
X-Received: by 2002:a17:902:f64f:b0:246:9673:70a with SMTP id d9443c01a7336-24696730b7bmr60715255ad.13.1756110874227;
        Mon, 25 Aug 2025 01:34:34 -0700 (PDT)
Received: from [10.92.199.10] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324fb2fee00sm4973089a91.9.2025.08.25.01.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 01:34:33 -0700 (PDT)
Message-ID: <c68046c7-24fc-4877-9493-3a40c952e2d0@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 14:04:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: qcom: Use pci_host_set_default_pcie_link_state()
 API to enable ASPM for all platforms
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "David E. Box" <david.e.box@linux.intel.com>,
        Johan Hovold <johan@kernel.org>, stable+noautosel@kernel.org
References: <20250825-qcom_aspm_fix-v3-1-02c8d414eefb@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250825-qcom_aspm_fix-v3-1-02c8d414eefb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX7wVp/1lyN8o6
 C6YkcLqlX+XHEtsv35BhwzWYzcy4afrmtPxtNX3b0+J87bb0gqO6cdRWoevHDflQg6h0AOPHetV
 cxnXPoHHBv2hookKJePtd6QE0t90V8vqIDxP4Npa5T2NCxjcTtyvA1BjwYczmpIRlz9YcdP6FyY
 lDg0vkY8aq7BP7Uehd0qZvWN9GI6rwPEvhfM45A82N67sq35gNqpQXKRHlcfWBbSj00Q1M5cp9J
 i6RxBXrP8N4J26PqBzBWOUxk6hxHEK/7Ido5HFs02G1L7JOH3YdFtQWaRbi1ns7pld/NM/sbn6p
 tOpRTPpaA/Pk0exH3qp03b9h+8E1GPu/iyb7p5rdhOjPC0JbCJbpux1nxVzLODl7cSFTzdWWLZD
 Y83CIoUV
X-Proofpoint-GUID: xoZEF0Nv94j0nhX7Wb-Xj2qTR11kk94W
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac201c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=-SNkuYFjfyYS1ayC9ZUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xoZEF0Nv94j0nhX7Wb-Xj2qTR11kk94W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/25/2025 1:52 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Commit 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting 1.9.0
> ops") allowed the Qcom controller driver to enable ASPM for all PCI devices
> enumerated at the time of the controller driver probe. It proved to be
> useful for devices already powered on by the bootloader, as it allowed
> devices to enter ASPM without user intervention.
> 
> However, it could not enable ASPM for the hotplug capable devices i.e.,
> devices enumerated *after* the controller driver probe. This limitation
> mostly went unnoticed as the Qcom PCI controllers are not hotplug capable
> and also the bootloader has been enabling the PCI devices before Linux
> Kernel boots (mostly on the Qcom compute platforms which users use on a
> daily basis).
> 
> But with the advent of the commit b458ff7e8176 ("PCI/pwrctl: Ensure that
> pwrctl drivers are probed before PCI client drivers"), the pwrctrl driver
> started to block the PCI device enumeration until it had been probed.
> Though, the intention of the commit was to avoid race between the pwrctrl
> driver and PCI client driver, it also meant that the pwrctrl controlled PCI
> devices may get probed after the controller driver and will no longer have
> ASPM enabled. So users started noticing high runtime power consumption with
> WLAN chipsets on Qcom compute platforms like Thinkpad X13s, and Thinkpad
> T14s, etc...
> 
> Obviously, it is the pwrctrl change that caused regression, but it
> ultimately uncovered a flaw in the ASPM enablement logic of the controller
> driver. So to address the actual issue, use the newly introduced
> pci_host_set_default_pcie_link_state() API, which allows the controller
> drivers to set the default ASPM state for *all* devices. This default state
> will be honored by the ASPM driver while enabling ASPM for all the devices.
> 
> So with this change, we can get rid of the controller driver specific
> 'qcom_pcie_ops::host_post_init' callback.
> 
> Also with this change, ASPM is now enabled by default on all Qcom
> platforms as I haven't heard of any reported issues (apart from the
> unsupported L0s on some platorms, which is still handled separately).
> 
> Cc: stable+noautosel@kernel.org # API dependency
> Fixes: 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting 1.9.0 ops")
> Reported-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
> Changes in v3:
> 
> - Moved the ASPM change to qcom_pcie_host_init()
> - Link to v2: https://lore.kernel.org/r/20250823-qcom_aspm_fix-v2-1-7cef4066663c@oss.qualcomm.com
> 
> Changes in v2:
> 
> * Used the new API introduced in this patch instead of bus notifier:
> https://lore.kernel.org/linux-pci/20250822031159.4005529-1-david.e.box@linux.intel.com/
> 
> * Enabled ASPM on all platforms as there is no specific reason to limit it to a
> few.
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 34 ++--------------------------------
>   1 file changed, 2 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..0c6741b9a9585bd5566b23ba68ef12f1febab56b 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -247,7 +247,6 @@ struct qcom_pcie_ops {
>   	int (*get_resources)(struct qcom_pcie *pcie);
>   	int (*init)(struct qcom_pcie *pcie);
>   	int (*post_init)(struct qcom_pcie *pcie);
> -	void (*host_post_init)(struct qcom_pcie *pcie);
>   	void (*deinit)(struct qcom_pcie *pcie);
>   	void (*ltssm_enable)(struct qcom_pcie *pcie);
>   	int (*config_sid)(struct qcom_pcie *pcie);
> @@ -1040,25 +1039,6 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>   	return 0;
>   }
>   
> -static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
> -{
> -	/*
> -	 * Downstream devices need to be in D0 state before enabling PCI PM
> -	 * substates.
> -	 */
> -	pci_set_power_state_locked(pdev, PCI_D0);
> -	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
> -
> -	return 0;
> -}
> -
> -static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
> -{
> -	struct dw_pcie_rp *pp = &pcie->pci->pp;
> -
> -	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_aspm, NULL);
> -}
> -
>   static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>   {
>   	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> @@ -1336,6 +1316,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>   			goto err_assert_reset;
>   	}
>   
> +	pci_host_set_default_pcie_link_state(pp->bridge, PCIE_LINK_STATE_ALL);
> +
>   	return 0;
>   
>   err_assert_reset:
> @@ -1358,19 +1340,9 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
>   	pcie->cfg->ops->deinit(pcie);
>   }
>   
> -static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> -	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> -
> -	if (pcie->cfg->ops->host_post_init)
> -		pcie->cfg->ops->host_post_init(pcie);
> -}
> -
>   static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
>   	.init		= qcom_pcie_host_init,
>   	.deinit		= qcom_pcie_host_deinit,
> -	.post_init	= qcom_pcie_host_post_init,
>   };
>   
>   /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
> @@ -1432,7 +1404,6 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>   	.get_resources = qcom_pcie_get_resources_2_7_0,
>   	.init = qcom_pcie_init_2_7_0,
>   	.post_init = qcom_pcie_post_init_2_7_0,
> -	.host_post_init = qcom_pcie_host_post_init_2_7_0,
>   	.deinit = qcom_pcie_deinit_2_7_0,
>   	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>   	.config_sid = qcom_pcie_config_sid_1_9_0,
> @@ -1443,7 +1414,6 @@ static const struct qcom_pcie_ops ops_1_21_0 = {
>   	.get_resources = qcom_pcie_get_resources_2_7_0,
>   	.init = qcom_pcie_init_2_7_0,
>   	.post_init = qcom_pcie_post_init_2_7_0,
> -	.host_post_init = qcom_pcie_host_post_init_2_7_0,
>   	.deinit = qcom_pcie_deinit_2_7_0,
>   	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>   };
> 
> ---
> base-commit: 681accdad91923ef4938b96ff3eea62e29af74c3
> change-id: 20250823-qcom_aspm_fix-3264926b5b14
> 
> Best regards,

