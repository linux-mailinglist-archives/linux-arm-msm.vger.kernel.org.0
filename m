Return-Path: <linux-arm-msm+bounces-86114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D76ACD4D31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D6E3008FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7137B2417C2;
	Mon, 22 Dec 2025 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkYhFwd7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDtX+z5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93532222BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766386286; cv=none; b=s/nh7YC5s05Sk89Q8CquNWJFQmCNyUKUBwl1V+FP8O5IfOv5aKn9rhJwiFZiln+VGYe7AE1OfdCobZw1fVbZkKmV1c7UezEZXVytQXpRZYYmE+fgIN/qk7vlTa2kiPlLuK3H9Te/TWx6B7JivdLmvOOPnyxNniwmXE2udqv/6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766386286; c=relaxed/simple;
	bh=p7ApNdtHB2Xso3s8fjoNKww0TbV+dZf1r4pQxjwJks0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/Uk/zU8B5CRndvZIdGMqic/EMuc62FRdySleQ+WAbBkwGw94WCU0W35D/t8J0UEQD+rmZSNIefxOvwg1xGF5vSoeC6CPewt3lqQLNe9TyhIauKNJBGM2Kiox2SmXD9DSozKv3Fv60R8Sn3ut+IXT9kEmM0EUh4gitO4dylzjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkYhFwd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDtX+z5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMQjbw024605
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5IBEk5VGJnkWt3hXkCW0xh6EACRykLwKHgEX/vbT48=; b=RkYhFwd7Ko48pB+t
	omqAlkll0OiNLIz6/Xi1RC3CpKuyEV2PW8O8v8i3l1LRM744Pr56TDhxdOfkB7H5
	zFitxrgbkMfov8BJdHPibjgHLEp8BCLuw/rVncmuUBr4mjr4YZ6Oz2iDSf1LMRZn
	WvgjGH7ceZXKZ8jC6xjJ6rUulfkvu1ronyWOBsxe+rsJ8RCUQ7FxEg9zcpbAGHNS
	nnHRqauViEU1gXx7vVV9h7sXuTmrufYLcRYScZfjX6yDdthq/lVm6k7rYHJe7u0o
	LY21VFofOLqw67zFcIsL7Mx1gFeSU46pubYynCdIrTEOq2ke39hsJu1tQAS4GWrs
	VK4s8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrabyyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:51:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso52198955ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766386282; x=1766991082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5IBEk5VGJnkWt3hXkCW0xh6EACRykLwKHgEX/vbT48=;
        b=aDtX+z5E+j4FpvmNEz1BPDbknMHLaWwOtca9yXpTKcdwtoRY6PQmYbUycJz1dHyog4
         WkuigaEtTa74K09AEMC38IIgHpr9VkHpmECOuwUk6WDSAI4mDC6R/CKffwPOyqY6Qia8
         2WnpvkeZQl6LL7TEaqBDVP5tzyjWv1MQxbIUOPV2XYrV3dde3dGdY8UWyKqmP22txQZv
         o7GS9QvtAY/Q1z1DOQ8neae9vs5xV8udj2wdqa3asliz7SHnB1G+100VOWplgbNE8Z/q
         oP637Iec7hxDwmoaS6DE0VLzmSMYtIseUAekcik3UsDJWuGhAK8yZwCuXSnKl9PvYTSw
         SiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766386282; x=1766991082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5IBEk5VGJnkWt3hXkCW0xh6EACRykLwKHgEX/vbT48=;
        b=vnie1u8t/f7hn9cN2XMtCXXxXt0hoYq2bk6Wnpt/MQMVEJCulyfeqZTtVShngi8mHP
         41jyNvB359nuFi5LmbasmoXM49GFWudilxAPou8zRExtMoL1xktsDnhVaBelCMyQJRMe
         IxdsWYMuLPvq3WkKHyL7MSIFDOeBZpmE74FGVGKD30g+bwlV0l89OvpQ9jey/NRBJR0j
         qCnjYJZCMZ4OdSocKWRUoN0iX0ojp13xdrNuCL+qevsrNNkX6NsV2ryUqu9xk/tsVUAY
         VHXkCwK89ZxeuNSeu771XI+CIQ/UPzouBzmbNaFEeYeHIck/tN6DOPhp99SpXm3xyaBb
         R26g==
X-Forwarded-Encrypted: i=1; AJvYcCXEcvFnfiZZ1UTaWsGreCevwLP+scfTflaQlAnrJybbljrLgsaQAqS6qr4rwHoD7/bPg0v7NO5bJYmM5T6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wtVVZ8fr8UzA4FYmUSHEVgMUBZjR4NC69PnSTOkyUkFpLYgx
	bF1wvlxTrotV60I3CA11TdBdxta05M23PuuZONe3LqmFgF9M+W1ZysA0JNI/B2pR8y3USNxHfGo
	ixjM06IwMIdX1xcUq45xJ57m7+4fTlICWXy80KcQyQjbgtiA4pGuii3gjZOLV4NpI408u
X-Gm-Gg: AY/fxX7x4Ck+xlrGOOncAQhORKg7LW6qNDhgFaSQM1D1gLjqlyq78bTPjCVOJ4t4y+u
	297m2dWREhSXqzYRs0oeN4jQ0v0J2kmO/wLVmkKvwm8J7i14jpTbMK7pk94ovaR17slRizlZ2re
	If204Bne6ZQ8Al1i3mf0tVpunRoxVy0mC8rr6A70+oUZ3IuYEjR/GzycxwL1xi4Y7Y0YYUwUFOO
	T15TLzeaI0232dnOuERDM6PDZWH0rEcgXqu5XpqBnBnxb9bACjcI0wkwCAmrB29AOo1H8SbhIO/
	se2E3wQgNjgVq5zK2rqlfddB/s0MwXwC0AzZGRYmSAQHvwYO4+LBJ3d8dwaf2vkHt3L98TWexKx
	SUyqDMkx98iiv8lPHLDCVA0wNlX/pwF2sWHgIL6M+Ww==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr63910865ad.46.1766386282445;
        Sun, 21 Dec 2025 22:51:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTvgv1hHER1oJ5VEZI/LUm+x0Rgz+j+dmzfrj2FJyfQHSPSjcRw6dQUbfv/KXkbw7LePCVTA==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr63910805ad.46.1766386281921;
        Sun, 21 Dec 2025 22:51:21 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66932sm88235205ad.11.2025.12.21.22.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 22:51:21 -0800 (PST)
Message-ID: <efa4b3e2-7239-4002-ad92-5ce4f3d1611b@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 12:21:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] Revert "PCI: qcom: Enumerate endpoints based on
 Link up event in 'global_irq' interrupt"
To: Niklas Cassel <cassel@kernel.org>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Damien Le Moal <dlemoal@kernel.org>, stable@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251222064207.3246632-8-cassel@kernel.org>
 <20251222064207.3246632-13-cassel@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251222064207.3246632-13-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5mbUR_OhioO1psier66w1MzHJ871yLiQ
X-Proofpoint-GUID: 5mbUR_OhioO1psier66w1MzHJ871yLiQ
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6948ea6b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8
 a=gPGEdhGqammTKEiSqskA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2MCBTYWx0ZWRfXxmAzJPMQLSB1
 /2TsgOvNJimD3cpk1+78kSN5s1DXY/OM5XdQtYEdW/p8Lrfd7/qPkMdjOEWaAivfJn+TLVw6ty1
 pFLrqd8CiAaEtUToNYlpFteD343xIoppk45zAUii5Dq11jiIi4mVskR3y3TznocgQH7EhMIKHqS
 0Gl/6xyjHRdtcdcyb0XdfnMU2fDTTmViI4T11VMS0UNHJf2HLnrjuYG9Y2kbMRhxAMdkJfKcXWX
 r7yHQjlFeEcIEVexDVqc53BrS9O+bzuLWvhOLBNi/2ugCoGlBn9p7m0iSyGVLb3HeMYft9uxgcO
 0X6V1EJMTYylyr9/Ghgig7u7UEc5NKD8RJGWOIpd4UuLCxzziX66evd4rZgkAryga2Kpwc4edIF
 lRIUHkEpFxgzWXBA0CFhE8UYnxwprl3OYVvMAyKaf0LxoJB4+KtPTIhogF6fHvX7qSSjnzLg+Iw
 GK+4jhrMRGlBjxpgXww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220060



On 12/22/2025 12:12 PM, Niklas Cassel wrote:
> This reverts commit 4581403f67929d02c197cb187c4e1e811c9e762a.
>
> While this fake hotplugging was a nice idea, it has shown that this feature
> does not handle PCIe switches correctly:
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
>
> During the initial scan, PCI core doesn't see the switch and since the Root
> Port is not hot plug capable, the secondary bus number gets assigned as the
> subordinate bus number. This means, the PCI core assumes that only one bus
> will appear behind the Root Port since the Root Port is not hot plug
> capable.
>
> This works perfectly fine for PCIe endpoints connected to the Root Port,
> since they don't extend the bus. However, if a PCIe switch is connected,
> then there is a problem when the downstream busses starts showing up and
> the PCI core doesn't extend the subordinate bus number after initial scan
> during boot.
>
> The long term plan is to migrate this driver to the pwrctrl framework,
> once it adds proper support for powering up and enumerating PCIe switches.
>
> Cc: stable@vger.kernel.org
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
Removing patch 3/6 should be sufficient, don't remove global IRQ patch, 
this will be helpful
when endpoint is connected at later point of time.

- Krishna Chaitanya.
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 58 +-------------------------
>   1 file changed, 1 insertion(+), 57 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index c5fcb87972e9..13e6c334e10d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -55,9 +55,6 @@
>   #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
>   #define PARF_Q2A_FLUSH				0x1ac
>   #define PARF_LTSSM				0x1b0
> -#define PARF_INT_ALL_STATUS			0x224
> -#define PARF_INT_ALL_CLEAR			0x228
> -#define PARF_INT_ALL_MASK			0x22c
>   #define PARF_SID_OFFSET				0x234
>   #define PARF_BDF_TRANSLATE_CFG			0x24c
>   #define PARF_DBI_BASE_ADDR_V2			0x350
> @@ -134,9 +131,6 @@
>   /* PARF_LTSSM register fields */
>   #define LTSSM_EN				BIT(8)
>   
> -/* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> -#define PARF_INT_ALL_LINK_UP			BIT(13)
> -
>   /* PARF_NO_SNOOP_OVERRIDE register fields */
>   #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
>   #define RD_NO_SNOOP_OVERRIDE_EN			BIT(3)
> @@ -1635,32 +1629,6 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
>   				    qcom_pcie_link_transition_count);
>   }
>   
> -static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> -{
> -	struct qcom_pcie *pcie = data;
> -	struct dw_pcie_rp *pp = &pcie->pci->pp;
> -	struct device *dev = pcie->pci->dev;
> -	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> -
> -	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
> -
> -	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> -		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> -		/* Rescan the bus to enumerate endpoint devices */
> -		pci_lock_rescan_remove();
> -		pci_rescan_bus(pp->bridge->bus);
> -		pci_unlock_rescan_remove();
> -
> -		qcom_pcie_icc_opp_update(pcie);
> -	} else {
> -		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> -			      status);
> -	}
> -
> -	return IRQ_HANDLED;
> -}
> -
>   static void qcom_pci_free_msi(void *ptr)
>   {
>   	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
> @@ -1805,8 +1773,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>   	struct dw_pcie_rp *pp;
>   	struct resource *res;
>   	struct dw_pcie *pci;
> -	int ret, irq;
> -	char *name;
> +	int ret;
>   
>   	pcie_cfg = of_device_get_match_data(dev);
>   	if (!pcie_cfg) {
> @@ -1963,27 +1930,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>   		goto err_phy_exit;
>   	}
>   
> -	name = devm_kasprintf(dev, GFP_KERNEL, "qcom_pcie_global_irq%d",
> -			      pci_domain_nr(pp->bridge->bus));
> -	if (!name) {
> -		ret = -ENOMEM;
> -		goto err_host_deinit;
> -	}
> -
> -	irq = platform_get_irq_byname_optional(pdev, "global");
> -	if (irq > 0) {
> -		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -						qcom_pcie_global_irq_thread,
> -						IRQF_ONESHOT, name, pcie);
> -		if (ret) {
> -			dev_err_probe(&pdev->dev, ret,
> -				      "Failed to request Global IRQ\n");
> -			goto err_host_deinit;
> -		}
> -
> -		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
> -	}
> -
>   	qcom_pcie_icc_opp_update(pcie);
>   
>   	if (pcie->mhi)
> @@ -1991,8 +1937,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -err_host_deinit:
> -	dw_pcie_host_deinit(pp);
>   err_phy_exit:
>   	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>   		phy_exit(port->phy);


