Return-Path: <linux-arm-msm+bounces-117315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id otxDKKf0TGolsgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:44:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499371B794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:44:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XD7NvtCv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AILvytMa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A617C305CDC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DFC40D569;
	Tue,  7 Jul 2026 12:44:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262EE40D599
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428242; cv=none; b=HOtasEHNG64Tlc8IXpawwHlU25176bWxbtCWHyFgb7QoP1rDVnMAhFLmT5ko59V7v4kbmwG7ZvHr2c1mpYWAVKcquJhoPzLcKt206Sp/5mjTd1Erode8WSdc4MjApWDCuRuoovctX/uYh6MO4YaUzem2nqS72nDbNKvQmp6BEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428242; c=relaxed/simple;
	bh=jj2vRusPH5dQvYdLb63Wzcj6U93bufwVr67iZ8YvRfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+Zy9p3t4/E+yO1a60bM5NnVDitUK5vouZ5ZM1J49Kk4m5I7tRrhHuHePp4nBq5tI+EK/b91PQnlmgcRyOM6PHF7O/JXgxf/N5+De+TQkG+Y5CcB+kGabovjlQYKlnONd+WqygkvDFD+WqDvNY3TlG4hG8IV45/UaFIocI99V1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD7NvtCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AILvytMa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8hof3742109
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=; b=XD7NvtCvt+ciicLc
	SFxlsBX3lxxlCeJzhe7+FCQ7sllI9nmp83Wp7Q5Sdw/jmrb5rQBlLklY94ke8uxl
	K6pKpodACkGCwZANRoY/ahbVze0XEd0WNFcHhLwgU45NyWXU71Lmy0HjRcqBT1/2
	3Us/ZWIr7YBgPOnRx+bZ6X4v/YQLBykVEJDkInXoliJRFKkAS5aeKDAGa9+eRVFX
	Pmfneoxro2uCyK3yJpFMhoyo8ImDUV4ajCP+8UxV1LpodyHlMaOY+ojAQ8Y6Gkz+
	jxvu/VCOpPonyiTABDAOLAeapPcB7X82j1ji7/KjywSz0hc9DpPkkJ65jwHRwfOp
	nEXIpg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0gjn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:43:59 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb58b8b31aso5554348a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783428238; x=1784033038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=AILvytMaYFakWwwElrsc0BTGYM2TNlJsgz9WT/ZUJs6qjze2eeayRAK92f0N430d9c
         1be267h3WZiaW4FSzXFVGVG4qG7xZ3jg+paSW3rZDm6FtBNNdOBUlmXWekyiJV+niyKb
         F8t8vUdbovoGRLwzLaoQ7BbmLQ0//01JFW8+XND5W5ZeuNjgktTJEt5NLawzkBSH7lUA
         5p8YJ0ej2pAPbofqmCD+ee8bONqxYJ8lFfMt/cF//bebW6aEiV9zP/FnrAxAxxA6SZMZ
         Zdw0Bn+LOJeewbrOfJy/ORDoch6hSpPr8FXR4JoNz/hhCVWaArasM83pa0fH25uxMHgE
         HDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428238; x=1784033038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=PMfrvYg9z9F34iMLZlyvaBtgbPksI25woy2hHbjY1D6/QKmPXM3zTOhzpogto2Hgrx
         BefOPHW9nxs5RhT6ed3Ndh6w0AijfAYwQQ89aWl3VYevEkMnKYdOV3yB6/IIH8vtdfcq
         i/wh0P8VVnsVHdwql0rLzyfo/UEe/MeMaa9K9X2ttg/qaceXmEjLALKuD04GQqLHrsmY
         NzUrW3Wa+iZGjk3loZp2M+8RCTiisiz1EVv8SBbA/wA1v/N4JAUkB/9P8GC/z36POMHN
         hZuYY9SfnqEAQbE7FJWKjuOf4uzZhV6iFLHPieJ6AiZhyk7hb4dbcGc2ua80rG8fExLY
         fkiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TvEst+VAJAr0N4cHNQCxFYWvO2n5THFxYKmGL7l/RgeLkpZVpsd1LScsfvd0hYdmqHQZLdiAFsvl9I5SE@vger.kernel.org
X-Gm-Message-State: AOJu0YxvogbaFSjOk913azSJBif5kYCm2WYj2Roj9ccMWqUWb+ftuuNq
	JRL4iTGykr2oBF4JFhQUo44cOCtXfiM+fRKqEjcz2Bms0Lx9wa8XS2GhD6Jg3LS3myjuZa4WdEq
	cFfQxYF3mq0p3p0JdpCeB30uqDi/PRB8i0neOF4xNPmXllKpEngkeFPTXH6bnEqXazJMI
X-Gm-Gg: AfdE7clpfFghyUrmU+zrU1P3QTlgTJ3rQKnaxiSb8H840X0amJ7nptvLi3V7do2Qrjx
	VXDwll3qUSe29aTwhsm/UfL+8muc5ezHpcDomB72WuF/NPHfiSmejk8fjHAcwmfajoiDRKSES/f
	xcdQeDwj7IHVpqsDK7veT6zPgisXI6UKIxZxmAPX2dfNgV0UcQCiWDvNQ6eNRatPQmtqSJ2gGBA
	nnZksmsAR6HQHb3YXGS12ef2/+Zfzbjwk3cGstfJMqS5PleQJp+A6xIl3gw1yhiI8ZVQ554A+NF
	+iZWCcYmq7K86ZtoOe56a54addHuO47D5U1wA8+9u2kxQYJjmHInsXoMEwLvdosNRtOMaYqhvYx
	LG7vhMJGatV1vlMnpQR2k3O/nWRYkBpt4d1/2Wmw=
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648921eaf.20.1783428238427;
        Tue, 07 Jul 2026 05:43:58 -0700 (PDT)
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648859eaf.20.1783428237043;
        Tue, 07 Jul 2026 05:43:57 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a31fd2cf7asm8442320eaf.4.2026.07.07.05.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:43:56 -0700 (PDT)
Message-ID: <8fcdb7be-0bb4-4cf5-b969-6e5b0b516f87@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
 <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5r23TKJlHcMtUQDL4A2gijCradcWcbEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX+6qh7Ech+WBa
 hzgMwFD7oHPzWPmNMU+kElOuCBJporyYf4bZswT3+HpI8Mg+jtzXiv7YTi+Pf2HmBHZpVjUdxK1
 /rcu8qiOwlPmwqTulxU9Quqv6qesZYE=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cf48f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RRvI01qy6g1rNRViaBEA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 5r23TKJlHcMtUQDL4A2gijCradcWcbEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX8TNgJEWNUJKN
 MTdajrbY3aMKcojU/MRWDgtzX63Id0mEcdd7mrwa1IAiiwMNjX38a2Au1GstA+cUzRKd+W7ruc4
 vMsE72T+K1PLDbIoZTr638wYlvfKI0G77MmOTb80Sp8LkRuQLmEic12FgANphn+GZ6R/7u1sExq
 xfmf+8Cak1R6OynPytBj4+dcvWAa0nAFR5v1LimdI8V60z9oHxKBIXb5ylFiHdn2r2tNGB7pAhf
 qToozsEPyzHDN/LifyRaX+voPDU5Tvmi6AQkypfQYBk4QBmjIhifQ3SCRQXeTL3/DGyCsW4UX1V
 U3KbKZ1jrd5g5b+op0MzZDqRZ4YBbGdfJ6fpjBLsX2LL2y3SHQMxawJ8x3+R6No/ZgaVDXSb7H3
 VGFEbNmMy/D7TN6UCYOi7xZPR0bz+IJrY2auoUBUNDWZVRBu0klqXVMxxRslH8NZIC/Juih4ZtE
 L+L5Y0KwKoM1pzE7M6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117315-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 2499371B794



On 7/6/2026 11:10 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
>> On some SoCs the SMMU registers require an active interconnect
>> bandwidth vote to be accessible. While other clients typically
>> satisfy this requirement implicitly, certain corner cases (e.g.
>> during sleep/wakeup transitions) can leave the SMMU without a
>> vote, causing intermittent register access failures.
>>
>> Add support for an optional interconnect path to the arm-smmu
>> driver and vote for bandwidth while the SMMU is active. The path
>> is acquired from DT if present and ignored otherwise.
>>
>> The bandwidth vote is enabled before accessing SMMU registers
>> during probe and runtime resume, and released during runtime
>> suspend and on error paths.
>>
>> Generally, from an architectural perspective, GEM_NOC and DDR are
>> expected to have an active vote whenever the adreno_smmu block is
>> powered on. In most common use cases, this requirement is implicitly
>> satisfied because other GPU-related clients (for example, the GMU
>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>
>> However, there are certain corner cases, such as during sleep/wakeup
>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>> is powered down. If adreno_smmu is then accessed while the interconnect
>> vote is missing, it can lead to the observed failures. Because of the
>> precise ordering involved, this scenario is difficult to reproduce
>> consistently.
>> (also GDSC is involved in adreno usecases can have an independent vote)
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>   4 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index e2c914fccd6f..5133d3ab023a 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/adreno-smmu-priv.h>
>>   #include <linux/delay.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/of_device.h>
>>   #include <linux/firmware/qcom/qcom_scm.h>
>>   #include <linux/platform_device.h>
>> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   	return ret;
>>   }
>>   
>> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int err;
>> +
>> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>> +	if (!IS_ERR(qsmmu->icc_path))
>> +		return 0;
>> +
>> +	err = PTR_ERR(qsmmu->icc_path);
>> +
>> +	if (err == -ENODEV) {
>> +		qsmmu->icc_path = NULL;
>> +		return 0;
>> +	}
>> +	return dev_err_probe(smmu->dev, err,
>> +			     "failed to get interconnect path\n");
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>>   static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>>   	.init_context = qcom_smmu_init_context,
>>   	.cfg_probe = qcom_smmu_cfg_probe,
>> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	const struct device_node *np = smmu->dev->of_node;
>>   	const struct arm_smmu_impl *impl;
>>   	struct qcom_smmu *qsmmu;
>> +	bool is_adreno_smmu;
>> +	int ret;
>>   
>>   	if (!data)
>>   		return ERR_PTR(-EINVAL);
>>   
>> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
>> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
>> +	if (is_adreno_smmu)
>>   		impl = data->adreno_impl;
>>   	else
>>   		impl = data->impl;
>> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	qsmmu->smmu.impl = impl;
>>   	qsmmu->data = data;
>>   
>> +	if (is_adreno_smmu) {
>> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +	}
> 
> Move this to a runtime hook to be declared in *data.
> 

Ack, will implement this in next revision.
<Missed to make this a runtime hook as it was not being used
anywhere else outside the current scope of this file.>

>> +
>>   	return &qsmmu->smmu;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index 8addd453f5f1..6835b40339ce 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -6,12 +6,15 @@
>>   #ifndef _ARM_SMMU_QCOM_H
>>   #define _ARM_SMMU_QCOM_H
>>   
>> +#include <linux/interconnect.h>
> 
> Not necessary here. Just forward-declare the struct.
> 

Ack, will take care of this in next revision.

Thanks & regards,
Bibek

>> +
>>   struct qcom_smmu {
>>   	struct arm_smmu_device smmu;
>>   	const struct qcom_smmu_match_data *data;
>>   	bool bypass_quirk;
>>   	u8 bypass_cbndx;
>>   	u32 stall_enabled;
>> +	struct icc_path *icc_path;
>>   };
>>   
>>   enum qcom_smmu_impl_reg_offset {
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3..a27804e15738 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		err = smmu->impl->runtime_resume(smmu);
>> +		if (err) {
>> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +			return err;
>> +		}
>> +	}
>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
>> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		ret = smmu->impl->runtime_resume(smmu);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>> -	if (ret)
>> +	if (ret) {
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>>   		return ret;
>> +	}
>>   
>>   	arm_smmu_device_reset(smmu);
>>   
>> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>   
>>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>   
>> +	if (smmu->impl && smmu->impl->runtime_suspend)
>> +		return smmu->impl->runtime_suspend(smmu);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 26d2e33cd328..ed08f86cf99d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>>   	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
>> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>>   };
>>   
>>   #define INVALID_SMENDX			-1
>>
>> -- 
>> 2.34.1
>>
> 


