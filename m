Return-Path: <linux-arm-msm+bounces-94386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NnMEkw2oWnRrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:14:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E95431B30FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BC823033888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A525E3E959A;
	Fri, 27 Feb 2026 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O8HFY8y9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78267334C1A;
	Fri, 27 Feb 2026 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172873; cv=none; b=jJmT40bor37D7gcyJ8dySqeppl/sClMKfb1mHLtt4vAEeNzYpTWVKwIgUnamE42O2cMWBBHB57dvEYm+1CruuygRy3UuYvY8v/JBn1Ab7KSTVzfPxkStGt2GqBTZKqbq48KHEE+DGhLnM2xxn57RMAy24nrclPbKAsxOPI5xUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172873; c=relaxed/simple;
	bh=UpBzNVxkWCFdrJy25xweT3xOfEpxJ8mVnCaTHWSdsgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ds0Wxu60sO6wSbJqTWou+NB0junewd6yWda7aUZC1tz28XoCKV5gDbSLSlDzE2nz6AXxc2zZIT/2V4EyQHU983zW4KayZv1lex3L9q0WlmT1XryVwh1DnwWhFv75nFHZMmCeF2E6KpQEGb1MvAEsnXJF53K8kxrKySMAv1fjtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O8HFY8y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KMK53763242;
	Fri, 27 Feb 2026 06:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kl6vDiQHBTLZuxWT5ikN50rM6OiKeQl0XB5yx05ltQ=; b=O8HFY8y9KSDPUmDx
	ypgNQ19D4l96XJtgyb9ZOX/7fJPopOnIZG9HxTCAUoRwn1uXU4cKMunD8JEPOAKQ
	L9JFaM5eTChletVH8PqX8Dx5Zvr4e4hFzS7EXkqwckbrudVbQNHgHh0PLR+GHLoi
	mgS8osScvm90p+VXaY4Z3LZPqp0B1rqKBK65AcFw0HUGaA153RfI3Dh3hSkq27kF
	UbE/U4mHWMVnW6ev28k6+SDxpEQAUUSLoUpb99f3yktCutBF0Y8eiOcklvFKPJwv
	vB6Oq6/YoQ4prYkQmM7NkiuN4s0bEKGZ66Mw1S06NWkPekvbrdHhz+Dp9y9HTaHV
	WMR0sQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yachr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 06:14:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61R6EToB002499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 06:14:29 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 22:14:25 -0800
Message-ID: <b6bfb049-c25f-7fd5-cb1d-1bbe438a0fbc@quicinc.com>
Date: Fri, 27 Feb 2026 11:44:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: ipq5332-rdp442: Remove eMMC
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
 <20260223100552.1050303-7-quic_mdalam@quicinc.com>
 <106fe923-a840-40ba-9ec6-bd22f9897063@kernel.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <106fe923-a840-40ba-9ec6-bd22f9897063@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9uZG8-JdL2giK1-DR-TcGWbTw83gC1xt
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a13645 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=u8L83KB0VrhKYHKtz9AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9uZG8-JdL2giK1-DR-TcGWbTw83gC1xt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX/JVEZpI8klhj
 mLVUBKvxzxlAuSxIOf4HVK96HkL1BPH8LEownGcvhJZLNkzDzChuY6Oqa4FiKuKwYxkuBTGKpNK
 OlUDSrV4ooKRyn9RMMuk7bYW5Vf+nEBont2ELh6jriUGGRiLsHbks2EMC9o6ZFAFhkf2/V8rfGM
 4WF6GcxMCqEG6D6QG+5EEbdj6ViT7qBMs1t3yKCGkrRXIY5d8O3MZAAlrtGbAi7f4qNR/ieBNOl
 +QnrFXLuQkcpJpzBB81Ep2tvX2wpF958MrdGDXqsh3g5SirreXPb9czG4Bygy80tu5OTxngnzcx
 c7Y3i5bS+/TfpAB6LyJ+X4KwP4hmcZxi10ZJTUB0XmCEJbWLzKcsCz7k0Yrnvb0JBimzPiMR57U
 SE6Ojr7bpeuaeim09C80I/DiHc4vS6Nw5HJ+iYePjKMXQpqFRtQ/6ehZP9khIwbPdS3lthJ+RLA
 bTRCRk53lLC40e+KRrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94386-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:mid,quicinc.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E95431B30FD
X-Rspamd-Action: no action

Hi,

On 2/23/2026 8:30 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 11:05, Md Sadre Alam wrote:
>> Remove eMMC support from the IPQ5332 RDP442 board configuration to
>> align with the board's default NOR+NAND boot mode design.
>>
>> The IPQ5332 RDP442 board is designed with NOR+NAND as the default boot
>> mode configuration. The eMMC and SPI NAND interface share
>> same GPIO
> 
> This is not a separate patch and it makes no sense to do it separately.
> You do it because you added NAND, so this is part of the NAND patch.
I will merge this into the NAND patch and update it in the next revision.

Thanks,
Alam.


