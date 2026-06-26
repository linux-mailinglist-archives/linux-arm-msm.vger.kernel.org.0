Return-Path: <linux-arm-msm+bounces-114633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Ss5JfBhPmrdEwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DA6CC6B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nxse7MpI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PBqH89t5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D35A6304A832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5BD3EFFA7;
	Fri, 26 Jun 2026 11:25:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D43E172C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473151; cv=none; b=okjM1AxIgX1V6E+z/2d4KSJQ3AHRbjbWdwntiDGfA3/iRfFyEkvSIuSGnwFHI7FBD6hDd8nIi6WrLKUa2cFg28UQy2kBVDeJYAJGvCVQbI8sQuwcQLEMQPR6Mobu9MNIhZt3Ru+dZ6DXdH5GfvXH/0pVcM354diQrraUjTREXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473151; c=relaxed/simple;
	bh=ht/Pf4XLV9dCsPC42qhVTYRywrk/rJ1Q+lPS/ZazSqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYJuVq3c2zdiRhCT3cmHrMIgw0XrNtMh0GC0QFKGccNs1JRbOSJCNvUnFZLTG+rD2JHRU+xlVavEN1g5O7Lvp5GSU6DKhsXWrnHmIB819HNipvFZFnvCT6oPOnxUSKbxLdRe9ZSYcJaRzA/Wo8c3i7Ts4nUc62VTmtd5n8gwHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxse7MpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBqH89t5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAd8ZI881866
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=; b=nxse7MpIWKwRS9Kq
	PzD23s235gtdv3TG4eC6YWz3k2Ihyta9XyWxIpJx0isDek4tTXfSirVc8FPCDjcB
	jX6CLqpCq3/OD/riyHZxJTUhQRDQ4sP5bC1lFI8zSjM3jhhxXBMFgq1rh4gdITVK
	j9KncVe/esV8QZcP679zaL3TW5K8JtvDPLTdY77yHkkhmWaKEbEnCeSJMoD6xpV4
	Xoon2A/LR+Vl1J4usG6/b7oyWWkAXb5rRTaCrzaI96OMu5cv6ureohlVfE88jZUa
	tBw2AERzFTOTifvxtrmbSZCoiGqnXtqcsdAIIZGasRE8Xx9zFzJg+Ips8o+76E8B
	jdZcaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqaet4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:25:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3926711eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473148; x=1783077948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=PBqH89t5mAaJnSG12AgCHS/vz+RSmSZ8GIHE+2KJfdUxfrpz/OEDAs7GR93cguubbx
         R0llbcbqisPd3XPblyyr8gv+gHM9c0hjIXiqzpXkS38aOnQzTPSO7WP4o02xqyNsYRQd
         looZ67L/HDRoh1pdVhdz9xNfxaT0anovj3JSKaE/hjkD1G7hqRREH14wYlb0JAXcdqaB
         cbhh2iQks9LsQjwOzaUHquziNelIXGi7kLax8/3K8TQSTE2k5UJyX9CHIlNbZiyRWVLa
         xsmpMQJOSAjaie4FdKBGG+OpMHJtYb4ImKIN8OgjmXAaZSm8s/FI4hz6KtUAoedSOswS
         oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473148; x=1783077948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=N/8Lb/4RJW6uMBdjRdK5m/NHklv4KwHi5MGoI41ehdDTL8pBzYLkwXIf2XFBH+PmGj
         HYNgz+QuDdaXg1qJNdo2LgG7UOB2TckOsY1/JGOHVegHVqN2lUsgATsApm36Wttt7agu
         zvnjgrb1pYYIjbCXm7/wAhy9ymtUn/eoTIX7sj7nkFdklAp2vI1eP+n1sbH4gR1b1UKe
         q0Ttx/NX7HoXPVA32pUepVKN8ACgzXmbA5h2m/Rh/GM5Istu1LZ4oZ1uP4V5ZfWi6eO3
         bI+OyxygTC1e/wqJet7ZnRoSKrC8PeTnF/8RDV2nHCEUu9kmHUuz9+0TP+ZJMTDlpc1K
         C9UQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZsMH7qB+39wEzYv4Vmx4FHE69T//n0B6q8MItpLGYYvuQtck/zsGZ6h4x4u+TYmO1Evyv6ubTDiLFm/Cu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9zhAfyLm3W7PmIv/Temp8kMpOfZbZBVRwYChZ9ZDo/quQXe/
	KrWwOZyZW4Ii9TJpcTZp5YLRvp20RAmTqwPfuf7knK7Wm5ClXl2Lw67AjPNF7FLcAUjwshV9FyG
	zUVRNpmz1bAXMg5efO2nsls56Y/o5pjmP7I5xArNbfcoCTSdZXns0s0j1/BAbHvGc0PNx
X-Gm-Gg: AfdE7cmfWKPHdDwvySFIvUnYmRGlY9uMTXdZUEyPwP/w0Tsv8Ss288GFnOh0bSvln6B
	bgoJa+x9u7OTQ1+SFdfNtbf2rjM6GS4rxnZf0GmiJ6KpOZQXVaPW765g5qPlgYo1xkWmQr0vOuQ
	Ztu5l9Ev/Hi77OGyISf0uO89MNY+juDfo3OrYaVkDIgIu/W+kzeJofy4riFbUn+oZZd4TqXInOg
	FqGZigbPA8Eupie8/nmd0HoEh4Hch57faDDzcsU/e6k832IJn2P3YInTPTtTPZ1sYIJqRALzFUu
	FE8grBMerF5cybTbf7fJG2hezUUtzqk7ippPuLMYKRrlON6TXixPob+tSAQa2iSFV3OMZue+SnO
	i45JpH5vgekBnMYfzZpFrjcRExGXOd4N+yUFAIg==
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352321eec.34.1782473147708;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352290eec.34.1782473147186;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6d2e4sm17343537c88.7.2026.06.26.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:25:46 -0700 (PDT)
Message-ID: <abfc0099-be71-4e4c-abe4-e8341a06f15a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:55:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
 <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
 <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX7EbmHjaLnJSU
 HUuWKYo6gm7C9HDLABgVEtZDrij5038rs15AKz76vUoTZf7jh0nJYc4zKKrhSF51wIu5hHKFMTW
 Dpf3gu5quE+NsW4aaYU4mOnBRJVIe/RYx3Ti1GXyk6PvcBO/frSvrfebKkJ6hC+Vb5PiQ507SZ3
 g9g3WbZ67WX6UI1meHfKmbPh/qI5s8JkJiL2ea8cxfMNv/6U6x/p7lfzhkAq64L0eSTat1fqPU+
 SbbuNXM45h1S8VwbBTIBvMPGOcMx1h7knHLrL2taxlfXnPYBxhwypchzZ+Yw3mCd6MDMZYqdoeU
 l20sm0q8TBO6W+miLuWDDb8bels+8mw8saPh0bSyjevs/hskTvOzJDBwrlwxIKiDtKRbqPt4HR8
 J6O+zUXcUf8MOUeM4KqUSy7vT3tvYZ/u+72izEoNwCb+29usS5rtrQSGv9RdkZsAMKZUFt50lel
 y/0BYkDyu/PRXtWjYcA==
X-Proofpoint-ORIG-GUID: bDZVgflFIR1k1rDuyeeiJSMEnmm7OEAH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX9frjT7Fvddyv
 AfzhusCBPUr4vzG8XMb4r7dy136vwwhaJXe5QTNIJQGi3ECZm1JzDNNI5p3IQktf9f1DyHhX4O7
 qop+X5kL1uJ/cxU0muz+9Yagk7E8+aU=
X-Proofpoint-GUID: bDZVgflFIR1k1rDuyeeiJSMEnmm7OEAH
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e61bc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j3I-O8hsx3pVybSV4xQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 370DA6CC6B2



On 6/25/2026 2:17 PM, Konrad Dybcio wrote:
> On 6/19/26 12:54 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
>>> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>>>> vote, causing intermittent register access failures.
>>>>>>>>
>>>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>>>
>>>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>>>> during probe and runtime resume, and released during runtime
>>>>>>>> suspend and on error paths.
>>>>>>>>
>>>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>>>
>>>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>>>> consistently.
>>>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>>>
>>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>>>      2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> @@ -53,6 +53,11 @@
>>>>>>>>      #define MSI_IOVA_BASE            0x8000000
>>>>>>>>      #define MSI_IOVA_LENGTH            0x100000
>>>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>>>
>>>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>>>
>>>>>>
>>>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>>>
>>>>> This is true for Qualcomm devices. However, you are adding this to a
>>>>> generic code.
>>>>>
>>>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>>>> reliably keep the bus active.
>>>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>>>> power penalty.
>>>>>>
>>>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>>>
>>>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>>>
>>>>>> LMK, if you feel otherwise.
>>>>>
>>>>> Shift it to the qcom instance or provide platform-specific values? (My
>>>>> preference would be towards the first solution).
>>>>>
>>>>
>>>>
>>>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>>>
>>>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
>>>
>>> (you used decimal 1000)
>>>
>>
>> It's my bad, i meant 1000 only
>> (I'll check on the icc_bw calculation to get clarity on the values)
>>
>>>> can evaluate if this could be moved to a Qualcomm-specific
>>>> implementation.
>>>
>>> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
>>> the QC driver
>>>
>>
>> Just curious, wouldn't this apply for all the arm-smmu users in addition to Qualcomm devices as i mentioned here [1].
>> Vendor hook would make it Qualcomm specific.
> 
> You're proposing to use a Qualcomm-specific bandwidth value so that
> fits
> 

Got it, It seems valid. Will be sharing the new implementation post
testing in next revision.

Thanks & regards,
Bibek

> Konrad
> 
>>
>> [1]: https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/
>>
>> Thanks & regards,
>> Bibek
>>
>>> Konrad
>>


