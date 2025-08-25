Return-Path: <linux-arm-msm+bounces-70546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2442B33506
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 06:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED5F189ACE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 04:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1D0E571;
	Mon, 25 Aug 2025 04:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W34SVOQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1623AB9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756096012; cv=none; b=cyScFbphokq7F3itvkDGdNguoBWoI2Hc/vB42DucOeL/ivt94UmreftQOo/F1j9T4AqB+m835GkwKjwQpgBG5WMZ9tXofMBPooVoRQBHH/9ak5SgNFHxIiTZYHO+XHijlb66Kjx+SqhIfQZnBJxsObyIiiesG1bBaaLhFK9HbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756096012; c=relaxed/simple;
	bh=a9n17Pp87nFPpPJ8hCwWLrrAUSmfPsMPJ5jQsLaAx2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B31Rk7odqXY3UM+4kG1AtcKo459z/UdTyEIoxSBd+zVS8roHSR72Za7avrTXM4WJ0oxAZuI9HZG94jP8RLNq8NpSAnKE6nVmsUkDISktwQFERmSCQ1w61XcPoY/hSKVON8dxMRWRTYRoyYZtYpBeV/MnfraVLwuhYufxr6hPCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W34SVOQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONGDhs018085
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlAwHntaMSF8ydAogxPU5Y3pfmmg9g4CHbeq5yhKSxE=; b=W34SVOQyeU6gWdO0
	zEyPXL3Wwmqhctsg5GjaWEuObLdC7WCfo6InEaRrjFs/1MS/NNMJhic0/9XJC8vb
	gSRa/YBTmUB4irDUIt2nxbCuEAn0jgQaE8h+bvOYCHjVAouwDJOLMI0HGlJF5jf5
	2QTM6CI5gtXWW8R5/ytKbGtGr+8pkce/VovYictTx/SA6h6nJ1igK73GMM7m0ykY
	v0h1vzl9a1+3WEYPODyFo/zKwefTLmiEX6741wYRNdXghaE/WHQiV6Cs15KZAYzx
	Dmjy9oQtMznH96Dbi+UX0L5UhEuKuLWQY+SpsYFBY3zpKvrCPdHb138Ggez7F/0X
	8krrZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unkm3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:26:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2463648439eso39917405ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 21:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756096007; x=1756700807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlAwHntaMSF8ydAogxPU5Y3pfmmg9g4CHbeq5yhKSxE=;
        b=SM3r1I8Ll0gSpys1mwtKGcFVmCKe54FO8Y+K+gXaD2/jhYRyIKr3m9KbudVwUlSezt
         8iTP0jY+EOLqp/aQAHuoOue3RH7lvMx7MIPmV4tZLFkE4+785J60eX/zkWXblc6kKV/p
         2+/Rgh7GsKubysRL0b2uRBOTI3OHqz/oABn9q8LsW78YPYhnGb6epmV79V/Qo3EsqKoR
         dXSXc61EZurkIbQ4SPwIlJdmeugF9zugSPiZPABFbPXTJvZjQkW3iP1dcNVffx6JVdvO
         rHYBRTYDWp4nJZgODqNb4fjprHIU8JoMLH/lJLjd/+f0eVaz9sGMqR6g/DNHM89n7peq
         BHPw==
X-Gm-Message-State: AOJu0YwrixbHTcaxijJilj8nEnNa1+ltlNpWhOsU034zZ43Dkfcthwee
	zU8mvnsE0dTr27Err3YX+5qKk/OAMg50Ph/Bq1bWWXCAsWGiLtftsXPf/896tKvXjB5T3g5GNkf
	0RTeNmuKogI6qxqZ10bWX6yMPUv44pORht0LHlsID8FR55Te4s7UFjjColIVd8MmiGVSp
X-Gm-Gg: ASbGncvRrcv97ez0eNMEUUk4V3zFxpCfcrEXZaj3oWUiXYiWSMQclJd8ZTLCrlYXpTA
	LiGBOSRO0s0s37gV407cYRCDtEP4PcmkUM8RWUjUnoO50Bx7jtUBPV9ixrhFZTazHcI9e0tCJnp
	gWTXFiExAD7JvChKX8EMtyDRTycpBsjRlivteFj/wvFCWhCusBJq4mumolc79s6bvJpDb5B1qsL
	QDnL0TlFJEs/ZO9e42fFYqddi80MoAbNQwpX22y52t42+/owp31CiS1bqDtBl7iqF1XsU9GP+KS
	4B8OmAGmJDXGpozx3x8q4JhIgo6UQc06+H2hv1v5dWNbGBrs4BzDDcFlbwvbGvGtMGjwbdWt5w=
	=
X-Received: by 2002:a17:903:3805:b0:23f:e869:9a25 with SMTP id d9443c01a7336-2462ef6a8aemr135591445ad.44.1756096007448;
        Sun, 24 Aug 2025 21:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHixQBbnc0DdWGq6Af/ITt7Ss76QxVat1WmepXEy8SewWASn4eLQ0Rvbb4Y5+B07Zee/JGJZQ==
X-Received: by 2002:a17:903:3805:b0:23f:e869:9a25 with SMTP id d9443c01a7336-2462ef6a8aemr135591185ad.44.1756096006976;
        Sun, 24 Aug 2025 21:26:46 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668880368sm54939105ad.109.2025.08.24.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 21:26:46 -0700 (PDT)
Message-ID: <7deae6e0-44ad-4b2c-9657-e83ffc77b4f7@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 09:56:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: qcom: Use pci_host_set_default_pcie_link_state()
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
References: <20250823-qcom_aspm_fix-v2-1-7cef4066663c@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250823-qcom_aspm_fix-v2-1-7cef4066663c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7c7ITqep4FtRubUDDsfXxhExzhVD5nfk
X-Proofpoint-ORIG-GUID: 7c7ITqep4FtRubUDDsfXxhExzhVD5nfk
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68abe608 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=dzoEsyrRel7NccpsXiUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX3wTN5e5znOVO
 qfYxC2w2aHz6o/epjoysGgMhTNjJz++2fD3lYnsLFAY+NEwmYQ5mg/tIQTHuXaGDCWICj9EnBst
 yWOrC8+9kDdxG2jTVWef6Hn/IpLDYUAHMyr+6JvajJpsOrEpQg8e0zYX6Sc5jhL79KNHdxmwAjT
 Q/GujdJFL9lGe2CLQBBrPVZ1Clg4Qk41dyHUnRvg2TWu7/phhceJwimtN4CXRy1LrB5+hSzVoMV
 PzKPahxAerERcwS7t8Jui+ViHz2yIphStkFOP1ITrUPdYamzv2jdC5v1aueNQ9i7ZYUz0wf9VRp
 BarOupiFNkJnu5aDrSCxqTwhG15LhHA0tpCrgwIFe373Vhmssx+jtEpG6CO33tr/6GODrqgMc2p
 sBFuzbt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031



On 8/23/2025 11:14 PM, Manivannan Sadhasivam via B4 Relay wrote:
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
> ---
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
> index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..71f14bc3a06ade1da1374e88b0ebef8c4e266064 100644
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
> @@ -1358,19 +1338,9 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
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
> @@ -1432,7 +1402,6 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>   	.get_resources = qcom_pcie_get_resources_2_7_0,
>   	.init = qcom_pcie_init_2_7_0,
>   	.post_init = qcom_pcie_post_init_2_7_0,
> -	.host_post_init = qcom_pcie_host_post_init_2_7_0,
>   	.deinit = qcom_pcie_deinit_2_7_0,
>   	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>   	.config_sid = qcom_pcie_config_sid_1_9_0,
> @@ -1443,7 +1412,6 @@ static const struct qcom_pcie_ops ops_1_21_0 = {
>   	.get_resources = qcom_pcie_get_resources_2_7_0,
>   	.init = qcom_pcie_init_2_7_0,
>   	.post_init = qcom_pcie_post_init_2_7_0,
> -	.host_post_init = qcom_pcie_host_post_init_2_7_0,
>   	.deinit = qcom_pcie_deinit_2_7_0,
>   	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>   };
> @@ -1979,6 +1947,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>   	if (pcie->mhi)
>   		qcom_pcie_init_debugfs(pcie);
>   
> +	pci_host_set_default_pcie_link_state(pp->bridge, PCIE_LINK_STATE_ALL);
> +
It is better to call this before starting link training, if the endpoint
is already powered on by the time execution comes here link enumeration
and ASPM init might be already done. This might not have any impact.

- Krishna Chaitanya.
>   	return 0;
>   
>   err_host_deinit:
> 
> ---
> base-commit: 681accdad91923ef4938b96ff3eea62e29af74c3
> change-id: 20250823-qcom_aspm_fix-3264926b5b14
> 
> Best regards,

