Return-Path: <linux-arm-msm+bounces-113713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id whcGE2C6M2ooFgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:29:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A469EDEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nb+ExJoK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Da4cHIAs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D3CE3009830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F893C945B;
	Thu, 18 Jun 2026 09:28:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809443C414F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:28:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774938; cv=none; b=NqXImbrknf5jNi5CW3RlRPM4PiPddFHeh0V7qYrEDdtv/lFWdrMbbmboTFjkFReFe9HtK7bmoB5bLOS59OR0wZJyQTvuh5PQ1/dCGzwnLzqEdnat0JtQlQW/OGQjpU5rtPxX3fQr5eSyto3nj+dLi+8h97d5ZUFuF2peTiLvh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774938; c=relaxed/simple;
	bh=n0ehsZOkSmTfJUHo1S4dKm5sKDNwaeJI1q+rZLaqI1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emFs97Uomx72aZgIdll69cVEuRiQtL1tDsmodtzEqzb8xS2DS0G+9wAii/npe+JWandM+/4JJmQrknUHm3ochYJ3FtzirLzZcE635hzfUOAyWoC4lGo0AjHa9TXWJakOShEcX600kVPDqjmIRLQa8f+YS/4YbDPwbYLOv88CaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb+ExJoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da4cHIAs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FSin975784
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=; b=Nb+ExJoKPrZnZUDd
	7ZNuwFiLLwUionlJ0TLwqBXCS/Csod2cbRdklqc8B13YBTjkdHz8kjEriLfbTx8r
	M1/T4UGZbS6akBVNdIzTYq3PuLgoQwV90Cr13XPM39RjdbOKtFx+QkBRnGtUnxav
	KXt5a+ou+cmZrbfZ9IAxC9UvLsK0y5kQ8OxtZJ/UYxmGldjC77sopevEcMHp1qbU
	0hUUfkzDuWpKlGZ8qMru1tAY1rDqmIxD3QG+6f+bvXxzsgU60TPzdBTxgWN0sTZM
	VkXqZyeM47VAr0KEqv8U/d0u9ieji1ITrYMAYGbiRB9PDMHeMtuHRN7aXjjiVZ2H
	YChpIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2hyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:28:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915976b2dffso15175185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774935; x=1782379735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=Da4cHIAs5ZqG9B+WbystUNfKvpMbTuTscHrtdTVzyXjqzMj6hyr+VdLavWKbYv3Dzk
         7QuPC9IgBNbVZWjWKov+UsArTWlOPTuKYNNYYIaSMapBH58O2//A1CKhl0ApvB8Cre0k
         67lXP/gFMi75DF6TCZJjGE7vo1RKkW5EH294YjLr5ORJ4nnzOWY6b/0wRl16YZZsf4YM
         HFvQQntFSnZVv4lQAM4QoRc9M9GiL9i3gWGRfTb/DF3sLt6wUcf2oxOLgXwZQDdM4SSL
         5/eXYQtTugyaNlu54Pp69KBq+TNZdMzWu/x7fZNa0cuZlaWMW840Pim17/1S8O3uTVzQ
         WAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774935; x=1782379735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=AnNEWTDDLwunSMypIPFR2FGVAj1n4S9TvhrMeC12BI+xKibu4xjhr/D5J88aGWBt9Y
         DEBC2jrH6DADUwr5XT3gP2rCgCZzocS52x07L/4pr88TUDAeuNUwzb2cEmAeD5X5K66C
         mB8zLgFq7qh73wGkBLQ55lxwnguykdKy6Tob3y6cXWMsuDHk2OHm+ohmk/PBS9QfdqHB
         zxR1RJr0Ze1hWau1FeEiD4mjNxd59ORVX6tARKrkGSkYv3rszPSP5DSitM3AB0sAaOR8
         SSxDuMGrPryUEoGlNRq1RVwW8a3G0oE0pjC/loTRrQbgNLe1+TiVpYniZDUAvD5qpOj9
         h51A==
X-Forwarded-Encrypted: i=1; AFNElJ+wkjRExOKWSyxBaT8JNqcNB5jqcJwlqsRWSb0KsIhlHs5rshUrq4r4MT2z5xqu+1yECdwXE2kwBJunI36o@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVVCNUbZHjHZZzpGAHlDh8SBvZwxE9m8hayfS6QcX1drSsgIL
	E8x4qYUwA9hrx5t4+L15B1DOXR5aCxz/kIm217xpTBWK7Lwtx60I2Lp7mlJLzU75da8yr/S/gl9
	at76xznWj//65RYArmwcnsrZ8cWDGTcmNpCTS1Wy9duujPcNp6Hx91PR26KImrXV1YKLh
X-Gm-Gg: Acq92OH6oXEDUzscu0HEkYjCq36VnJYOry8qDz+4I6QzXQyCqupwqkx+MEYBfAWiOob
	IG0weAFQkLNE/J0rgtLNWWTUJAUMy47VAoncu9MZOsafVGUdiutYMvu0zp5qzO1XWptaTizfONC
	Rp1Fb3cT5YYAW7kDQF4DSFWRIS8xjALo1PiWG44WHHBi8JcdZMj9Zto/VtrprJzzQBeioQAesaw
	IHXyOrsN+nKs3oSaXOkpE8LpPuRhFWz6lUX8Dp9lzM70/7dntij7uHqM/lpdI38UWZltO7JBhOG
	vdZd9t810sWDXHz9Ef1eZ6D8Cm5Prr2byCvP1iVbMh8SCTdsxUTj9O1+GdTZR+aUPnJfgLKcgGK
	FJWscNU9k2SQF32LqvRt/iDUCit5P5DnYio4=
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293829285a.2.1781774934792;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293827285a.2.1781774934250;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69595d7934dsm1638902a12.30.2026.06.18.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:28:53 -0700 (PDT)
Message-ID: <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:28:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33ba57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gDzzPNA0uyMDLQwxZz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TXGkakvB-5qi0thFRth26IJHRdAH8BT3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfX4ibzgtry/WHP
 F6EPb6WbEkESHd0/p0HVJpZyiBkc4K+2o/ZUhjisQjLX0xV7Cvc0ircbyphq9zoFRsU46jfbQNF
 NnYLVrzrUiWU8KwStqPMEtuFKGBn+U8=
X-Proofpoint-ORIG-GUID: TXGkakvB-5qi0thFRth26IJHRdAH8BT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfXybNBRme3gxpG
 GByxO27jHbztZv5uscgesxPMq4Lv9Ml9QdVusR/F9UKsQeFp4ltLC2R8yNecxAjWiZg9RFITj0b
 SpEedFPaADQeJL3HGjxR+6Q+CpgV3nRYznF1sUxwWmw8Gj3v4KyvngBNZRvs/4TuFgnI244ws4e
 6pO5OgsWKdIkBYzpRT2O2G7WbJpHUkUFZZhiIN7Lxe50HloZmnEhSV1qYqVrQcK1QMNPXqJcYUq
 p2FYVvP3D1mJnF0Tk0uaiFYbOkbVSqoP31bl9kSGTF+e1qewHELkgRuuO+H7fJc6NDlfKuFFbyN
 k/IdeKwhghr3G+EEPQYM4v4LAvgRCBfX2yyKAe6wB0K0IiXgCDPQPN8hBhvGvnUOtjrVcm7fVNz
 arITpdrT56nPbz+iXey68XrJs9feeOxz+yu9J6gAODHlR9hIuP5UjK4D3hhweBp2d/ue82vJAZd
 9pVIQbIPKdpS1EcuvCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D5A469EDEC

On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>> bandwidth vote to be accessible. While other clients typically
>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>> vote, causing intermittent register access failures.
>>>>>
>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>> is acquired from DT if present and ignored otherwise.
>>>>>
>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>> during probe and runtime resume, and released during runtime
>>>>> suspend and on error paths.
>>>>>
>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>
>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>> consistently.
>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> @@ -53,6 +53,11 @@
>>>>>    #define MSI_IOVA_BASE            0x8000000
>>>>>    #define MSI_IOVA_LENGTH            0x100000
>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>
>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>
>>>
>>> Ideally, any non-zero value would be enough to keep the path active.
>>
>> This is true for Qualcomm devices. However, you are adding this to a
>> generic code.
>>
>>> Here 1 Would be enough to keep the path active, but might be too small to
>>> reliably keep the bus active.
>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>> power penalty.
>>>
>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>
>>> seems to be suitable here to reliably keep the bus active by BCM
>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>
>>> LMK, if you feel otherwise.
>>
>> Shift it to the qcom instance or provide platform-specific values? (My
>> preference would be towards the first solution).
>>
> 
> 
> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
> 
> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I

(you used decimal 1000)

> can evaluate if this could be moved to a Qualcomm-specific
> implementation.

Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
the QC driver

Konrad

