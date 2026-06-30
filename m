Return-Path: <linux-arm-msm+bounces-115260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vppQBGdYQ2p1XAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:47:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 724596E0873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e+eazqqv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XtD1EW8j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65F38302C372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CFA2DECCB;
	Tue, 30 Jun 2026 05:47:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AFC2BE656
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:47:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798437; cv=none; b=q4vhK5rv0a7x9mBRwo1IApokdsmFTgFJYmuBkFxYlYrmEWOscNGLGkI1owrAS7jDcJkaMMX5TLxm5fWlOQz8Wy7WSj6+16cHng9s5c+khYdnzCkgyIUdveYEDQj3i50xcfDM4tqKVQ76VVvtOift2ehSEfkCkC/nKS8v2kz92aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798437; c=relaxed/simple;
	bh=mpkM47434tD0wGgOHIo6k3LyRJFJ5GBBtWyy29+bjDw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xz/OOk0xusBS0bVMbv0ICLReBEC9nhZFBhktFZRwOeZVBEGde2GTdcioQNDwaa/eNx3R5Brpz+cKSu5yZ37Um8cxHrG+LdJ4pFQ5GP3AAtZs5Zo2H4c4ctMaYhE0ViBlWreKd78oy4YRi+qZQxN4CUtX1mPdPidyoKmOr+m3q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+eazqqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtD1EW8j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5cHC5931654
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=; b=e+eazqqvs2KdUFol
	lnOI2Cv4+UQK+/sbKissHcvRy//hrtAIKdfHQaPswozUzjxtyTjfNwGbTh5vlTrD
	Fka21daja3ui9CXWCH+gGP6lP2kbUlHj7YQNsj6zrHLGop7bD9FwmFJyGFuVLPj0
	yHdOlXraiHyN673tVHUpynO4L0PsoeLEr5AFClsy8WXkijNFionagHoVppGzOSIp
	VHi29v2Hahif16GK3lV6kelQd0Vb+F0tYZZRYJaZNagrWEQZGvhPZfhqQNhdjogL
	ZTDFKfXdZP8y0qDRG1PzV9tbXWyrOTx1XVGJzhzQpvBT2DS6ryDIikf4cgsKoFcX
	CcGQIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw91jph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:47:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca3b314193so2668215ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782798433; x=1783403233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=;
        b=XtD1EW8j29tRJeQaRfc+2hSdiXymzeEv/AbtU4Ag4FJfVQcMS97BjtAduOwQMxkY39
         S8EDmUGeoJZ4YkukWn3zXZvjn8eWo9Oy1IBRTCqXQgu50DVeeWUy5EW83OQKzEyZWQ/A
         LIwP+5sa++PEBDtEXHmzYR8smGUnY0JiMZkql6SvbR+jsgdlgliFkN4YbdV29ZMQo4EA
         f+pBfopY5GPKAs8m3GuDI/yxGOexB1BJnNtqbQ5kT23gmHIsQbp7zhhb8CEwpYd8Foht
         TvlWnxq3Na9XBB3mqhw50asuvHeJSyKrEuPZziBvFTyh23Q2ZEOnc6zmdZ83NhLTTWyf
         5FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798433; x=1783403233;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ExZ2dZ3mZh0DRvVQCg0gTXdRYsW6Gjpzszbogo+cOM=;
        b=qvWkXX/vJh8fRo5B07y22OqsTA89iAusUF+h47jpnE++vimKBliZR1j6/PeUrVdvIT
         juy9iE/A7ACAK8Kl4x8tEHYxFLOlYLQKXGid5cwS6mGX+CpBLh/uc50KaABbViFl1uRp
         hUWapefi8oIm4hZpUHowB0y53wpvp9c0/p9T/QnzymdNUivNsI4fO33O51A863hgNjc/
         zExPOzgK8pyxWRLRASCL7vGS+eR26hD61wzWWXodk72UmzHo90fh9yvypBl8IMsK9y0k
         6E8uqia9bDbq2YODvDLUdc6M7yuvvWDS4vStNwDfvjeY4G+wZ3uDTBtJBLl/382ePQcq
         /S6w==
X-Gm-Message-State: AOJu0YzUCcL02r24eAYHJvljuVWzs1EjMsJyFP7B40CPVrwKIXJedrDe
	/97aQtBA1EqfLmL8UTHh2/K/EXb/OSclTPFgruHlV+hoch3mUT19XBSknDPKdab4v/M4ZCpGCwr
	XJRXYb/qZC0oLby6J/pcizG7n8OnNTFoq7TmN1ovhRS5L6iFXGJms3IG4Hq6LahYqIIUM
X-Gm-Gg: AfdE7ckpiZtb62BLyqmXJDhCAl4dUL6iMhTVpK5dcZSzbP3i5+Z3OuVy/cPHm7InEKH
	R2+xOws2s4nidtn5Le6oN9SqVJNXHUCrptGS6eJ4HVYNUErwJrLLYl7adVIINc7wMe1vDyrWO8n
	UxHBzm9P6jI3e03nME+ONHaC2UhV2jUpBBiU6LUWpHk35C55LJalrwxO80eLhla6ylgCOlgO3NO
	c2QeEQDOSuUc3kmcPntc6VEQabCBqCsEwIQWxWWqxa++kFWnMLjU5FCxc4WVxJ6fb6dgt9FCQU/
	gQ2AAsblRSTtX7NLyClX7wT6+Q4eRB0pI5yEZpPZiFzHUm19/ilORyYkQqXonJvH/ospZiSkQyC
	GPn0S6yRVbfrV6yh6f1l9IfeIMs+AtttRsAIc/rlZnN7+EZMSdmLqA2sF
X-Received: by 2002:a17:903:240d:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2ca2d3f0965mr15937225ad.0.1782798433273;
        Mon, 29 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:903:240d:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2ca2d3f0965mr15937135ad.0.1782798432810;
        Mon, 29 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.152.199.171] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm103195ad.73.2026.06.29.22.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <5957b2b7-270f-4fc4-9b06-adbb54a13cf0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:17:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
 <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1ab3a88e-29e6-4e24-be83-7c8891addc9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX0CKZCkNP0Sel
 n8aevj/NLAxYvDLqv/JWuwBx5YChvgcGaKsL6Gl8YfTmNiVX/8MR+2jBjK97bGwFUyi1Lrpgd9p
 DBKvo6t7LVdPxIZKhyNAiLTDRHSCfZ8=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a435862 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g9OaShGYrvlb0wzR15YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: A8v-RooAc4qwCRQrM3oclf-Z7XPW4Zgv
X-Proofpoint-ORIG-GUID: A8v-RooAc4qwCRQrM3oclf-Z7XPW4Zgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX7l/ZmGkPf8mJ
 9UiffP5dHKEg5fwTcMTeJ7uaLU5msC3wt0fNi3peiQmv/9DzCjzfQDXZAcXb3KCOk4PGYV9bPmp
 HW1fDrvfMjj010SRV4ZPCLhLWxpGeap1Pq30LK+fQ7rP7bHCMyWCoKFsxIVI9xo2hFKhahtcUp+
 0j8tptWK1xa13HvsxTqgo0JdyE98cN8+ZyXQnpOOGVYYd6aHn30xj4ygYZ0ZjUo10czrJBFCW3G
 gmP17qy1SAhAh1ocDcQO0K7ySTMNKVHOVyT28wVYz6YYJCJRI3LIRitnfLJ+MQXDOkItnOu23dr
 Mjg2DKnR8gCmAkWITaP9kpo6TKEFcj5YETccGH9fbNyEIrfZCOYSG2t/pr4LiE0eukql2/pAoQs
 I2Oqa4kqu/A3t8jBp37I0Bc/nM8rcNVFoBwy9G9ar4W7wjEoi1N1lNIGJuVLfTWYqalZSXwpRPP
 JEf48DoCJgw2n06kCWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115260-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 724596E0873


On 6/2/2026 10:39 AM, Kathiravan Thirumoorthy wrote:
>
> On 5/13/2026 10:30 AM, Kathiravan Thirumoorthy wrote:
>> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
>> timeout, there is no way to identify it. Current approach of checking
>> the EXPIRED_STATUS in WDT_STS is not working.
>>
>> To achieve this, if the system is rebooted due to watchdog timeout, the
>> information is captured in the IMEM by the bootloader (along with other
>> reason codes as well).
>>
>> This series attempts to address this by adding the support to read the
>> IMEM and populate the information via bootstatus sysfs file.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat
>> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus 
>>
>> 32
>>
>> Upto V9, this series has changes targeted for both qcom and watchdog
>> tree. So V10 was sent with only watchdog changes and it is picked into
>> watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
>> which needs to be picked via qcom tree.
>>
>> Since the watchdog changes are not yet reflected in linux-next yet, upon
>> merging this before the linux-next gets refreshed, below DT binding
>> warning will be seen
>>
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
>> Unevaluated properties are not allowed ('sram' was unexpected)
>>          from schema $id:
>> http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next 
>>
>>
>> Signed-off-by: Kathiravan 
>> Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>
>
> Bjorn, Gentle ping... Can this be picked up for v7.2?
>
Bjorn, Gentle ping... (This series cleanly applies on the tag 
next-20260629.)


