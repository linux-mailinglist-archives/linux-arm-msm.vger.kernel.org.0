Return-Path: <linux-arm-msm+bounces-39388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CBB9DB3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28F86B20AD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376B914A609;
	Thu, 28 Nov 2024 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ReHHuzBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973AE1482ED;
	Thu, 28 Nov 2024 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782432; cv=none; b=q4nw7rtRc3bIr6bvrAOp1FgRLiwh+EFLK+fluhyJYoYC759LwR1wNpm2nUInlHATuiYBraw/59UOyG6pd/bewfWWQ7MEgOL+l1mQOXHsRbGmtCfHWQBj7gOxgpG6JNt/czr4s+SRNkACvoSUTr6s7JztsBNau7HzoYIV8OBe9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782432; c=relaxed/simple;
	bh=z60GP//s2n3zdGQZS67JacUbXYhH68n2H4fz4fiRzws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FtiqYrrQZhyoSNjq34wUdGK/QhyNLeWT+8n6umSwgZaq7N+lFe98Dulo7rRGXJTxndNnXj9qQnI8j4DAWj0RrkD2XgwpqIcihZaDimAXgHbTtaSfFz0IQ5NwRwMcqWSYDhpCqT9SHmKq/ThPGupusW70XQfeHE3HGX+n7MC/rNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ReHHuzBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQaCw028888;
	Thu, 28 Nov 2024 08:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFSpMM/1LZHGjcfYNl5o7E5Lgs4vzBhEEiU4tRaP+Yw=; b=ReHHuzBioMEX3OBI
	OeFmjRGSQLFlMUt3EBxpuOs4BLcabEuC1YJHnT9NVHt1yQnndP0ikWDeQde1YBza
	a8kZ5vhQPBg6op63YBb8AuEmnZwnnKP4B4Lg7Lakv6PAxGzUJCbdE3SZsItDKzuY
	BHXyuvGRzU89DJGxQDSJ0yr3IrpbOJbPV33Wnn/Y6PxbcEU9WV8Rl0gDRUKRtO3+
	Sz/Aih4cYOQkQFc7GHwtyizxgezYdX04JRVYqyiBXBoAKmlpnWoAZsnbl4XRNi09
	oQXKaeHIzlUe28+sQ9zsDjYTpE8AAXAt3WJUlLvyoQp8G95RNoL/KfA7dfUjXWrw
	x4neMw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xxhvf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:26:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8Qw5b012341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:26:58 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 00:26:54 -0800
Message-ID: <c73dfff4-2945-401c-a292-9225a6bd415b@quicinc.com>
Date: Thu, 28 Nov 2024 16:26:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        Xin Liu
	<quic_liuxin@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>,
        "Tingguo
 Cheng" <quic_tingguoc@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <5a4a80e7-b6dc-4c01-a16d-ed8ea1aefe44@kernel.org>
 <766219f6-a535-4eaa-b1cc-768e0522d71c@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <766219f6-a535-4eaa-b1cc-768e0522d71c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iA9UYIi4wpziYCCT4S4fx7PYBmaNVJti
X-Proofpoint-ORIG-GUID: iA9UYIi4wpziYCCT4S4fx7PYBmaNVJti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280066



On 11/27/2024 5:40 PM, Krzysztof Kozlowski wrote:
> On 25/09/2024 16:01, Krzysztof Kozlowski wrote:
>> On 25/09/2024 12:43, Jingyi Wang wrote:
>>> Introduce the Device Tree for the QCS8300 platform.
>>>
>>> Features added and enabled:
>>> - CPUs with PSCI idle states
>>> - Interrupt-controller with PDC wakeup support
>>> - Timers, TCSR Clock Controllers
>>> - Reserved Shared memory
>>> - GCC and RPMHCC
>>> - TLMM
>>> - Interconnect
>>> - QuP with uart
>>> - SMMU
>>> - QFPROM
>>> - Rpmhpd power controller
>>> - UFS
>>> - Inter-Processor Communication Controller
>>> - SRAM
>>> - Remoteprocs including ADSP,CDSP and GPDSP
>>> - BWMONs
>>>
>>> binding dependencies:
>>> - remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/
>>> - ufs-phy: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com/
>>> - ufs-controller: https://lore.kernel.org/all/20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com/ - Reviewed
>>> - smmu: https://lore.kernel.org/all/20240911-qcs8300_smmu_binding-v2-1-f53dd9c047ba@quicinc.com/ - Applied
>>> - ipcc: https://lore.kernel.org/all/20240911-qcs8300_ipcc_binding-v2-1-ca15326c5d0f@quicinc.com/ - Applied
>>> - qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
>>> - tcsr: https://lore.kernel.org/all/20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com/ - Reviewed
>>> - rmphpd: https://lore.kernel.org/all/20240920-add_qcs8300_powerdomains_driver_support-v1-1-96a2a08841da@quicinc.com/ - Reviewed
>>> - bwmon: https://lore.kernel.org/all/20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com/ - Reviewed
>>> - others: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com/ - Reviewed
>>
> This submission has bugs and instead of fixing it, some other people are
> sending already patches on top.
> 
> No, fix this patchset instead.
> 
> Best regards,
> Krzysztof
> 
Had an internal discussion with Cong Zhang, will combine the fixup in the
following up series.

Thanks,
Jingyi


