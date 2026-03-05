Return-Path: <linux-arm-msm+bounces-95547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMHdLtxFqWl53gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:59:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16220DD65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 200B13008A5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC87372EC5;
	Thu,  5 Mar 2026 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLlZPU/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7tSsJ+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E469A2609EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700993; cv=none; b=QR/wN+HOceyV/4npR4uhcnLKv+8HWFLlpx+fdGPW8uL5WcRdMj2LTRLLn4/yEDjdwv1GSdK2za6qeRyNL/9irnXJLeMvT7U6j7L/v+lqQ/T7LZQXFA3K23OsHAXr9H4hZ+A4nydO1E9h9LoAK2blGpAT8OijiDUBWFdr7kkRg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700993; c=relaxed/simple;
	bh=XOUtMxJmY/xukrKRhAKSN7CNtGlaNNQUyMKgIxDbAXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxTUQUSNY4vquxzKcuYFPu3zS08o1168iU8WKekqzRcL1wceHhEQ4dPjPbKdewuKj0Z5IoMA7/yU7iNiYHT2WIyoYpPeMNPQuvWJ1aN2zyWSZwWOjjCRAmkf5ITBqi3HSCGG7R8/cn3qkhPD9utbNJQZjXYPmvJM2NOqa2DgCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLlZPU/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7tSsJ+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254K22Y1852690
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=; b=jLlZPU/X1OCwF0wF
	1UcdeX6avnQUDkUN05L8dAbQAN9kQJSjq1JuhbrHdM+l0bcNeZdPLU8AeldOtikO
	ZVO/yTrlt5W9h0Rhr0Ny8zDx8jqgypT4tpQcyCWAGhLTewI+FGp36qDakLgCIFNU
	crO9KULtNdiuY7AZUmPC2gP4iHSR3OMBCC3I8ZFsrcccbimQiZOOAdq0czBVP85e
	0OIkIVYunJZcU3D2vRJ3hh/P6IiYn++rOdPecUFwau2+hGYGmKNgti0f1qqf1uiJ
	Ub14ovt9Eag1EA9ugWUu2vNHof1rl9P147S+TtZn9m0rEiYP6MlRne/HpCcAWgpJ
	9gQimg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80ur6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:56:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae44db60c2so45614485ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700990; x=1773305790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=;
        b=V7tSsJ+ci4kYkR6nDVOlrXbnjPtSqw8fW+DItokiuZ9O3T0GPFk3VC5rhWiEvmWmPq
         qDZv1HWomA4c9vHLX/LAZE0fUDzyCQ53H3nMpjmNeEXpYOpSpUQxjaDSN5W6gk8eXLNO
         EgqhNV3hZ0RGQ++82arUJkfIib0Wa8LZtPTMXi8bRzMya+ePGOvOSIcR7U4V45JloFu4
         Ippca9lXXaCMp3fnfsL0GrLEvg8H7BOIdbmIL/KuLjvjo5Wu7ftwI4KHrjZxJgSxrszj
         4lHC1WebHMaDGCTr1MW4z/vD2TJJ+4kAswzpl+a8+qbSSdx2jIhdFjzcVyamPUa9oBEW
         QZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700990; x=1773305790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=;
        b=Gk2kfCdfOLPorQQHLbsya0ZUd71WsLW+IOo0V1hlRQuvpjoz1rB/DczNDtnA5WO6GG
         miETdO3QJwqVa62hfJXFWrzu1TxKVs0+0pfHnHnCov7TakfCFFNyBH0EDmd6hN/YY6Nu
         P028qmGfsIfIG9skA30TKRRYCdgYEf6YroXPKEXbqRA+FGqE+xaTbjQRweLBMQ6tqUYv
         CKWJ8YagyOar81QiNth5Mj7r+TM5dInUeV9AFIV/JBwQPhDlM7bWnJ0WUok1xalVhiKt
         579pbfXFVJVciAPN0zIh1ycSul6rXRTvkXbRz83IT9dDub7qEEe7gPyvuKoPonT3F0da
         MgIw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZyfGuR+Czo5lwZ1EsBEN6/ca1McrpmoJNbY6WxUayrQTnVVlHgsaDglG6y6homPYsNraT9B8rEmdx/pK@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNZuDNG/aLn9ZAk8KIKdnVlW+5a22JiGWkED2pTlgQbmvML5O
	saJMjsXiLkGDZ+AQ8Bz+nanT+1yj07V5C5IaPoVpSgBVVqXuqEH0spu4sD5ug2UyXZnvD/dCsdx
	hXTjCQ+HPAyiLlZLjxlgoGirr6f0Qz1I6RklrV89mqnKqsxBBMLZz+L87u9oYvSdxxsPd
X-Gm-Gg: ATEYQzyOlEMKE3wAlSf9qJ1PyqN0qhOGZ9jwuSqJODG8riZW4h/2dktD1oTtzpe+re9
	wLe2/wa3INIqOi0y+wakPmvzT+rv2UcijLkjODoEg1Of5M2dMC9v/0RrrNTpLPMbwG4hHaAY5RS
	fKvc1RI49DiFxVYUL5olecuYRwem1Z0JJ9TiCXDFBQrcD2o+b/EWURDQVNiCXnQFb2RAEgyj2k9
	niFTuDTSbDrdkKs/oIORnGeC8/c1AktSMJ6Z9Ei9Pp6+Qqc4zjgjcnDCuZWmnIfOTR1TlynwqRB
	wbHSzi93Xg3JseQsubmR8x9xY3MeF10MCwVgskzbW8dEuMIACfm3PkdS6rbsabw3PrUMCpJJg53
	V6sdovqU5PXtmgn/06vo6SfprGFkEr5z1cZU2Pi2acPnBidj1LIL2SA==
X-Received: by 2002:a17:903:388e:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae6aae8d8amr47956905ad.37.1772700990110;
        Thu, 05 Mar 2026 00:56:30 -0800 (PST)
X-Received: by 2002:a17:903:388e:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae6aae8d8amr47956585ad.37.1772700989632;
        Thu, 05 Mar 2026 00:56:29 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6bb5b2sm224434525ad.69.2026.03.05.00.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:56:29 -0800 (PST)
Message-ID: <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OjXI9X4vbu_DL3FnB3mKx1kU1QALqiHu
X-Proofpoint-ORIG-GUID: OjXI9X4vbu_DL3FnB3mKx1kU1QALqiHu
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9453f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kJBpcOZ6olZWUerAqwAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfX+GiEpFcRP8eG
 PA+HddJ/2+fYDjsXshFQ0rBSSPbBe2YsIKqMPtU4sDxypA6BhsgnM+BX0IvhBan2osC+tW9o+2L
 NkHKyN0sFJQtYuWwM3g8bB/c6pi9doejeVAssc23u0YIc8UmNE1jfCGnImPnn+WVt3TqT08HPRh
 MgUfDEv2M5fsgD9zZpakQTntlLjWCZS7/UZECoWQ/H8CCdsYeNidbvJTFz5MhHkzTE1HPPYo6HC
 7DOAd+72g17rzqktPNXS7Cn4P3MtlWiNHIH68xf5o/h0FARFxU1iyqZc12vLFoEVi9lHz5df2G4
 RFlCGjUPEg8zT2cff8J1feYOW6Xn8FDto+BdrwVRIx22znfwNRlcppqW3tvJbcxcGsVxlMQDuGU
 3st+y23jChXNNVlZki+bhWStBuA0nq/Gq6vHG0f6lP/rlDKbT3hvysevv4W8tRnRwLDzlgSHtTS
 DJv9dStoBMH9SrG0AKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071
X-Rspamd-Queue-Id: 1C16220DD65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
>> Some Qcom PCIe controller variants bring the PHY out of test power-down
>> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
>> towards D3cold and the driver disables PCIe clocks and/or regulators
>> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
>> partially powered, leading to avoidable power leakage.
>>
>> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
>> power the PHY on. Also, for controller revisions that enable PHY power
>> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
>> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
>>
>> This ensures the PHY is put into a defined low-power state prior to
>> removing its supplies, preventing leakage when entering D3cold.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>>   1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>>   	u32 val;
>>   	int ret;
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY power ON */
> This comment is confusing since we already have phy_power_on() API. What does
> really happen in the 'test power down' case?
QCOM PCIe controller wrapper has way to force the entire PHY into lowest 
power
state by turning everything off, without this bit being cleared the phy 
will not be
powered on even after phy_power_on(), we can think this as a kind of switch
from the controller side to power on phy.

- Krishna Chaitanya.
> - Mani
>
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
>> @@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
>>   {
>>   	u32 val;
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY Power ON */
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   }
>> @@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>>   	/* configure PCIe to RC mode */
>>   	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY power ON */
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   
>> @@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   }
>>
>> -- 
>> 2.34.1
>>


