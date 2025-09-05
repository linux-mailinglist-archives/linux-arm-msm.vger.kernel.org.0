Return-Path: <linux-arm-msm+bounces-72178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D622B44D19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D1F189E297
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0881EE019;
	Fri,  5 Sep 2025 05:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lbc0m0r8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22985211F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 05:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757049474; cv=none; b=Jrdgzgi30EPaZ6o6cQtbpxQIPNc3FbAySgoRA82Q4+5g8jHBBvEE93+hpGpPxNnSJCSI5Jj4ne1K23o4uzoPOfpG2XZKx1shy/X4KU6ExY/6xqr1v+Z3yXKORI9HJ72eXVbRmXc1MXFnw4fR52YztEmumGwauPk7uj0jN8ifO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757049474; c=relaxed/simple;
	bh=MyDwk+JF8dckFakhkcfiJSqeBkt8fotzN0n+PuTJSZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqeI98l9XW6o9nJ4lo+4L39W5FXXDJZ0wN/duam6/rEeiTCcLjTKtafwt2V2pfV08g9OYxAkSDYbwY7hTWwfaxbVKY3CJ7dphbT90RnmFu8Q8G3BVhFRMW710ulN1R9/U8Q7Ten7lsX8WFk4XSIuaHTXkTfyx62bdpNxjc7BK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lbc0m0r8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IfJnl007823
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 05:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kkMetT+6syjiH0zDEnX+yyeCPRKqyQXOS64Sr9lqW0=; b=Lbc0m0r8GXRBSr9X
	UDq9lsgb3tJeVwEGkrN3/bw00o7K1G+TFL1eYZdf5pNlqehF4BCTOm8maXuJ+qJi
	lw1XoAeCI3o9+EtsTONLFS/mYDJaVSanuycIyglzEF5l1RfURTuTXkvzKAKU9d46
	SPPreKTlQxvsLfypfJGugLKR1yphUSNHUCqnOP5dlPL5GJeULUUd1FAwvjrDXJEd
	PEyRwyF5KBoB1jyaMK8cR591O3J1aRlZmMIifZclk3vn2zgIZTutdTvXtgPCOYLY
	mDIKtdddM4EG7Ydm+e/ScBF6S5IrrBwd+cHpuRsO+LQXHvACSokvzH9D8VmFekQQ
	NhjtgA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura91t32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:17:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b520fe32690so208484a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 22:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757049471; x=1757654271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kkMetT+6syjiH0zDEnX+yyeCPRKqyQXOS64Sr9lqW0=;
        b=mIJ2EPHtwapLOmjO3b+fc7VWzA0Fu5b3rRpcD9Mx2ipzf67JJqRHZhK2jzub6ytMOa
         ldnZeKQErPFoe97q+R2fOVfcYUlZ3FyqWgsWOdhlqr0Aq7K7rZXQiq8FgQtkgwitzjNG
         6PXpHbSEKBdMmvHfsoDKabocYcs1wZ8JJq5h0fVoGoO8ob08+66PLuEkSIWuE/8Iw+B8
         VTKqBxK95qrCS5HzEXIO7NdbMIPJmNYVCVyay5MQie/PaVtAWI3kAYUCGx0bunAN/8OK
         cWOXRMoGGzbLb4hXC0IPquPqDSEqZ3jlDgn0iGSWVXRsfdoDP6ps7cDtuZQNu24/1Dhm
         ZQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOnpKLTeXj9vNidSYNunvDkvGEU83Sn/WHyC37PCrsbwk53usbYu8jxr1NZXeFXbhZfnufWFRIueIfJoh7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5coJj0xY487gtGq/485uFWBhDyO7UY0Q7UcmxO1XEc756PWS
	VdZzXuvrSx6BNOSujNiw75LWvuuCgWCdGz3lSPuwdzLrBNPI0JnvahGho3CJ2Pied+ztpSKmZF2
	bVqG9RLwv4IJarsDRRuNrsOQ8UR/Jh8Y/p4xFyWxE6OnePtULGMHB1k+aObrqUCKzXwon
X-Gm-Gg: ASbGncsNCNc9sjDYb6ULMm7B/6QH8L46rFzU05ab0vMnI8smXhP7agIjqDPOUA4MlEv
	ACKGRan9LfakCD7c+5VtqRImrvSTn6ImM3acHZMlSQHRVNNW9LWNqDg+NM8GuoWAUja32vr7o6K
	l8uzdPQzmoLegRWKqLfwD73Qohm0AgCuClRdgHvUN9WzSFVjMM7ThWtqtKauyVIgAjKqBG6tvYn
	+t5TU7xo0pcpSLvF4QsoiiSB5uRrtBvh1JJ+EAw95Lx0HH2WQOOUN3gMF53pz/+hSVd1vF3R76C
	L3wrVaKyQ6QCVcCkrN+S0eCHa2D1UyMbldfeusth+yOgU7YD9iCXTli9R6tiNIyDtrqF+TyjQg=
	=
X-Received: by 2002:a17:903:1a67:b0:24c:b83f:c6bc with SMTP id d9443c01a7336-24cb83fcae1mr93316645ad.56.1757049470491;
        Thu, 04 Sep 2025 22:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/HudJkVHY47aTTdSdxbVjhGZ0iA7XAdq3M3NzhR8STMn+juzLVlL0XwOIV5uAOZ5kdH1N5A==
X-Received: by 2002:a17:903:1a67:b0:24c:b83f:c6bc with SMTP id d9443c01a7336-24cb83fcae1mr93316105ad.56.1757049469919;
        Thu, 04 Sep 2025 22:17:49 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f3205cdsm85944905ad.90.2025.09.04.22.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 22:17:49 -0700 (PDT)
Message-ID: <79d44c24-d853-4128-b966-8a25aaefad73@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 10:47:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] PCI: qcom: Add support for ECAM feature
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250903201233.GA1216782@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250903201233.GA1216782@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0vSZUzQ-1vNitd3zCCAAsx8R9TAgNwrM
X-Proofpoint-GUID: 0vSZUzQ-1vNitd3zCCAAsx8R9TAgNwrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX9AbpF36wBSdT
 D5+hH37fGbwNvC65yQ0kTtDg/DKxSlzRodXTIuuatwD0Dt0qEfBG9/mzq/1wGnU1Lg4IfeH3tL1
 xueWWxIgQYWdD0bhk6qM0TenXu3j7LwTTB91B6jAIzHJokjjBALgq172YgvBiqx4yFD7T6mo6Ip
 2BiDBxcjeNW80wJeMRnPuAcrHf8/3RGGEz5CqHv5uF8CBNWEVCZUKx65ENvuE3EbP0RQltL1fIR
 fa4x+TPmaZi3S+gq6ULIpzLk8+hnVjsnVLpwq8rrwyAYpwwWuVFDVXo49xfAqxmW9bCGK79LtCz
 SwhPlGZ+ArYn0Aagm7uBIiVSOXzFWHUr/adfD1FT7JVFReqcsQBxaULgdO8QW8rO0xeKDQnmaqF
 669jtmFA
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba7280 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qonHfBBtBxQ77LOI7bEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/4/2025 1:42 AM, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 01:04:26PM +0530, Krishna Chaitanya Chundru wrote:
>> The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
>> gives us the offset from which ELBI starts. So override ELBI with the
>> offset from PARF_SLV_DBI_ELBI and cfg win to map these regions.
>>
>> On root bus, we have only the root port. Any access other than that
>> should not go out of the link and should return all F's. Since the iATU
>> is configured for the buses which starts after root bus, block the
>> transactions starting from function 1 of the root bus to the end of
>> the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
>> outside the link through ECAM blocker through PARF registers.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 70 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 5092752de23866ef95036bb3f8fae9bb06e8ea1e..8f3c86c77e2604fd7826083f63b66b4cb62a341d 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -55,6 +55,7 @@
>>   #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
>>   #define PARF_Q2A_FLUSH				0x1ac
>>   #define PARF_LTSSM				0x1b0
>> +#define PARF_SLV_DBI_ELBI			0x1b4
>>   #define PARF_INT_ALL_STATUS			0x224
>>   #define PARF_INT_ALL_CLEAR			0x228
>>   #define PARF_INT_ALL_MASK			0x22c
>> @@ -64,6 +65,16 @@
>>   #define PARF_DBI_BASE_ADDR_V2_HI		0x354
>>   #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
>>   #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
>> +#define PARF_BLOCK_SLV_AXI_WR_BASE		0x360
>> +#define PARF_BLOCK_SLV_AXI_WR_BASE_HI		0x364
>> +#define PARF_BLOCK_SLV_AXI_WR_LIMIT		0x368
>> +#define PARF_BLOCK_SLV_AXI_WR_LIMIT_HI		0x36c
>> +#define PARF_BLOCK_SLV_AXI_RD_BASE		0x370
>> +#define PARF_BLOCK_SLV_AXI_RD_BASE_HI		0x374
>> +#define PARF_BLOCK_SLV_AXI_RD_LIMIT		0x378
>> +#define PARF_BLOCK_SLV_AXI_RD_LIMIT_HI		0x37c
>> +#define PARF_ECAM_BASE				0x380
>> +#define PARF_ECAM_BASE_HI			0x384
>>   #define PARF_NO_SNOOP_OVERRIDE			0x3d4
>>   #define PARF_ATU_BASE_ADDR			0x634
>>   #define PARF_ATU_BASE_ADDR_HI			0x638
>> @@ -87,6 +98,7 @@
>>   
>>   /* PARF_SYS_CTRL register fields */
>>   #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
>> +#define PCIE_ECAM_BLOCKER_EN			BIT(26)
>>   #define MST_WAKEUP_EN				BIT(13)
>>   #define SLV_WAKEUP_EN				BIT(12)
>>   #define MSTR_ACLK_CGC_DIS			BIT(10)
>> @@ -134,6 +146,9 @@
>>   /* PARF_LTSSM register fields */
>>   #define LTSSM_EN				BIT(8)
>>   
>> +/* PARF_SLV_DBI_ELBI */
>> +#define SLV_DBI_ELBI_ADDR_BASE			GENMASK(11, 0)
>> +
>>   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
>>   #define PARF_INT_ALL_LINK_UP			BIT(13)
>>   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
>> @@ -317,6 +332,48 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
>>   	qcom_perst_assert(pcie, false);
>>   }
>>   
>> +static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>> +	u64 addr, addr_end;
>> +	u32 val;
>> +
>> +	/* Set the ECAM base */
>> +	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
>> +	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
>> +
>> +	/*
>> +	 * The only device on root bus is the Root Port. Any access to the PCIe
>> +	 * region will go outside the PCIe link. As part of enumeration the PCI
>> +	 * sw can try to read to vendor ID & device ID with different device
>> +	 * number and function number under root bus. As any access other than
>> +	 * root bus, device 0, function 0, should not go out of the link and
>> +	 * should return all F's. Since the iATU is configured for the buses
>> +	 * which starts after root bus, block the transactions starting from
>> +	 * function 1 of the root bus to the end of the root bus (i.e from
>> +	 * dbi_base + 4kb to dbi_base + 1MB) from going outside the link.
>> +	 */
>> +	addr = pci->dbi_phys_addr + SZ_4K;
>> +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
>> +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
>> +
>> +	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
>> +	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
>> +
>> +	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
>> +
>> +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
>> +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
>> +
>> +	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
>> +	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
>> +
>> +	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
>> +	val |= PCIE_ECAM_BLOCKER_EN;
>> +	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
>> +}
>> +
>>   static int qcom_pcie_start_link(struct dw_pcie *pci)
>>   {
>>   	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>> @@ -326,6 +383,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
>>   		qcom_pcie_common_set_16gt_lane_margining(pci);
>>   	}
>>   
>> +	if (pci->pp.ecam_enabled)
>> +		qcom_pci_config_ecam(&pci->pp);
>> +
>>   	/* Enable Link Training state machine */
>>   	if (pcie->cfg->ops->ltssm_enable)
>>   		pcie->cfg->ops->ltssm_enable(pcie);
>> @@ -1314,6 +1374,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   {
>>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>   	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>> +	u16 offset;
>>   	int ret;
>>   
>>   	qcom_ep_reset_assert(pcie);
>> @@ -1322,6 +1383,15 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (pp->ecam_enabled) {
>> +		/*
>> +		 * Override ELBI when ECAM is enabled, as when ECAM
>> +		 * is enabled ELBI moves along with the dbi config space.
>> +		 */
>> +		offset = FIELD_GET(SLV_DBI_ELBI_ADDR_BASE, readl(pcie->parf + PARF_SLV_DBI_ELBI));
>> +		pci->elbi_base = pci->dbi_base + offset;
> 
> This looks like there might be a bisection hole between this patch and
> the previous patch that enables ECAM in the DWC core?  Obviously I
> would want to avoid a bisection hole.
> 
> What happens to qcom ELBI accesses between these two patches?  It
> looks like they would go to the wrong address until this elbi_base
> update.
> > Is this connection between DBI and ELBI specific to qcom, or might
> other users of ELBI (only exynos, I guess) need a similar update to
> elbi_base?
>
This is specific to QCOM only, with the commit 10ba0854c5e61 ("PCI:
qcom: Disable mirroring of DBI and iATU register space in BAR region")
The DBI address can moved to upper region of the PCIe region. When DBI
is moved ELBI also moves along with it. So if this patch is not present
elbi will not point to correct ELBI address.

- Krishna Chaitanya.
>> +	}
>> +
>>   	ret = qcom_pcie_phy_power_on(pcie);
>>   	if (ret)
>>   		goto err_deinit;
>>
>> -- 
>> 2.34.1
>>

