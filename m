Return-Path: <linux-arm-msm+bounces-95549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I1ZFwhHqWm33gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:04:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103A20DE59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 228F930398A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D5A338597;
	Thu,  5 Mar 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P52m3yX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKdGElSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA82868B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701229; cv=none; b=pxVweAfLNO3XNvFBhvP3BE7Mrt8WiWJFK8Da/HqOwptsUOzUPUOFbROXO84nPm18Y7WmJ98GenZi7dYeSrQ2cg+v7i8tlNt38KQ0f5kRyNL9DNoPk4n5lHy0jwZZpQwqqYMuccjv1sklocwrOoMRTjur47ziGJoO67tC8H2O5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701229; c=relaxed/simple;
	bh=n9Fc58azlTl88dGqttef7BVIdeXVIZctkw5Ln4SbTVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+fFXPZTXWwTLsca4QYwbr5KX6LTRXBXrAqCvMKdC5xZa/W/nO9vg5xePYKEbQvQpKedaiF0PMeodxXKX1W6Uvv+MMQ9VuYevr4X0UdL67TWbIZpTxa1bKqHp9TPFqb/VUrHWd55reqAXmxugJXFI6zW7WsPXr6TcUggCwyReTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P52m3yX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKdGElSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KIOM1853037
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=; b=P52m3yX2Xvq1ovMd
	xX2lLqrEVfvXZxZEGlfrwt6OtPMkLFtUDIsBR16e3VWXHw5TLGVjwnTL68Z762pH
	izetg/Gt6qaRXjyqXJOfWo5879w4oIVdfyzYle6x9AVbkG//Ik58BhtWYG1Hdj9m
	U4MAOWixwsi03L/GSb2HqojNaKFtoWvWx7LQYMZJb/kRQI0n8RNa9H7JHRexKD6b
	FE+J0ZFRiefZwnDLtpwwkeaVNiQBcuv+Ht51UJ/g4sa+JlUTsq3g4TdRrvS54J/V
	pkISgqbpekr2i72GIzfISCzcjuw+vDabMAyHzdI8cLiuy1MJrBplrMMYC490iEFd
	7DUy/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80v4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:00:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c629a3276e9so29030571a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701227; x=1773306027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=;
        b=CKdGElSbXa4fOR5xTKdD+XCZWwXSuuVguMGO2bOSTNssA7V0xgnh/y/jJPXwvWV3+G
         fHKepXaHG7RK7nb82SiIPIPL/4jIRQxb34Fly9VjPP2DH/ar+ZUgcOz+x4MIbcaZXATp
         fTuShStr8IlxQ8g3Mlslb1oBomIkW7imJa6DG1PprvVZLsqZyXi+fC4G1RhmdpN8WCu1
         FxeY2puDSEHtK6f0WVctlgHN6AtLWdfaRF3jHWKzmZNqcyxCax+mRpTOqYJ5Gp+wMNb7
         M2Uzeyr4zWwgV2s1mz76ZwarK8y5bFSPFheKRyuumqVD8FZS7DPP2UU1W3AvtSrBuowV
         rT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701227; x=1773306027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=;
        b=DTWxEkpp/9kGqn+//pz/LJN7FWshGxPstG3csyi2zoqubuG5VBRf0AmAPtExEE4DDf
         bg/5duY295yiXN4zJkcO+qooFWaHWBZMN5/tEbDMaoZQ0ZJmMh4h4SNysIjnFggXhnbE
         82nz5zo/tlYKfXn2c6g8p4A80NMqr6yi/sY6JGUv3WWCzQSNtA6gmUgBrR7c2JOzNmkQ
         FH8u8lBbcyYQbFI+w0+FZRf+Di1Kus/M+ndJhO4cP5ihKd/w5kVFDqdHw+FEl7tUpMSm
         oMRzBYCrMI1KvAfFEkvpF2offR+karrVeGO09s9DReIulRiZ6Cro2ktDWuA0xND9ur4/
         84MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Mv/L4H30a91C3NZ1BQFZKOreoWlpGyuzhRhguaOtK4sy/XuBr8TcFZVITIYAjJFYmhBJxgNO70hCUmnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Wev55Qg9VXFvTei3Gbk/+iVyPuqMeS6nvkBKYUliQ8oO/FyS
	ihdpnSl6hbNd1Dx79bhDD9gGH7qrW6FKZcGnzH1DwQeV6GyXpSAqoiVtvn4+Fyx9QYyzg8IMY6S
	qAQX4qG3qRchoY2qPVR6ZfAc2msYa1P/pFGxI1NlfxHPH4Zj9UI1koRihKHNAYeHek4iD
X-Gm-Gg: ATEYQzxg7SUDuOWYdU4S4QcHwE/0Iu4uFMkRI0JZCqW1tO+qEKSScsdhmpEDs8/A8Fn
	S0TkJjRmqBCr3WbVVXbfo6PvYdHJGelFFaUp1w1uKJ8dcY5AazfCF2267m5ZhboeKQfxVbVxG16
	UMYvW/Z4PdWofR+KfjSgZDFSMs/5NZz1bez2bdKbJJXPGlZgVeML/Vun5rlhAh/BUIxsC+hxrdL
	NLyQgsoKd3/isURRIDXt7CLckCny9wEB43NtH+GlVLPny+R3XMKrait/AZlCCv+KShXZuIV0Jj4
	G9jhCqmaFBd8VOqJ4VmOgecalbWN31yJsbjumm+Co7zB54qib3crN4R//s8ONNMOx9ObOR8UDud
	Qco/JBccZKdqV1nQR2HII90dbq9Je6DhAWhBf55BG34p+qPGNmFu9tQ==
X-Received: by 2002:a05:6a00:1ca2:b0:81f:5f49:6913 with SMTP id d2e1a72fcca58-82972c326aemr4406458b3a.30.1772701225509;
        Thu, 05 Mar 2026 01:00:25 -0800 (PST)
X-Received: by 2002:a05:6a00:1ca2:b0:81f:5f49:6913 with SMTP id d2e1a72fcca58-82972c326aemr4406402b3a.30.1772701224928;
        Thu, 05 Mar 2026 01:00:24 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297ef26eb1sm2222701b3a.49.2026.03.05.01.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:00:24 -0800 (PST)
Message-ID: <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:30:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
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
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
 <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H7Xg6tRnO6qqtHHOrc191Me-nSccmmt3
X-Proofpoint-ORIG-GUID: H7Xg6tRnO6qqtHHOrc191Me-nSccmmt3
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9462b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cbGetAF2pF-RjulI4vsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfX3PHpi3KVVuv7
 K/KXiccvitBcj8otdvmO0rYr/jiQOtgcinjvdv5UJUu77qvCQlw8vBUdHOPvfxfU3/Q0P5bIYo3
 3TjNSCSCcYfYDEp3eYghCf8oW8C0j4NUFlJuFl1Xply+jMAYjVi1N3W2h+s/tTO4kWTLH21G1Qk
 D4NI/gzrn6f5UOBE3zPh6I6a4yWWHa8FThnVuj20kBgoWsKO8dwz+FvttOJpQgonjn/9fDtqLVJ
 E18mOkrR9ivq6gVzSxjzKSiDU1yv5pQGl2w/gcMNYPoCigOKAp2SugQG0eIgjpydcUfjfgZZg9R
 Mb1lqWKLdF4yX3S9zyPg7GCqoRrEPFZcedILXgDcsbpb2LRn5OS4rC4oW1SO9bvvhSFYMv7OpqT
 gLvzC3Ijh3Cj0xlbCa4VsxHpzzhB7nFRlTFpNQSAhM5TyL8TcXi/d+dYIkT5I19i0lhXDyxZ8Vg
 RHB+59iF+9MQB2kGAmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071
X-Rspamd-Queue-Id: 6103A20DE59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95549-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
>> Add support for transitioning Qcom PCIe controllers into D3cold by
> You cannot transition a 'PCIe controller' to D3Cold state, but only the
> endpoints and bridges.
>
>> integrating with the DWC core suspend/resume helpers.
>>
>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>> into the DWC host operations so the controller follows the standard
>> PME_TurnOff-based power-down sequence before entering D3cold.
>>
>> When the link is suspended into D3cold, fully tear down interconnect
> You cannot suspend a link into D3Cold. Link and D-State are different.
>
>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>> by keeping the required interconnect and OPP votes.
>>
>> Drop the qcom_pcie::suspended flag and rely on the existing
>> dw_pcie::suspended state, which now drives both the power-management
>> flow and the interconnect/OPP handling.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>>   1 file changed, 74 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -145,6 +145,7 @@
> [...]
>
>> -	if (pcie->suspended) {
>> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
>> -		if (ret)
>> -			return ret;
>> +		ret = icc_enable(pcie->icc_mem);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
>> +			goto disable_icc_cpu;
>> +		}
>>   
>> -		pcie->suspended = false;
>> +		/*
>> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
>> +		 * connected to the PCIe link.
>> +		 */
>> +		ret = dw_pcie_resume_noirq(pcie->pci);
>> +		if (ret && (ret != -ETIMEDOUT))
> No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
> failure. If the device is not found, it will return -ENODEV. So you should
> fail the resume if -ETIMEDOUT is returned.
Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to 
-ENODEV.

- Krishna Chaitanya.
> - Mani
>


