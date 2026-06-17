Return-Path: <linux-arm-msm+bounces-113672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gvEJJCbMMmp25gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0E69B677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FVpm4RLh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jnLmbcOd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113672-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113672-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D18930008B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8823D4B8DEE;
	Wed, 17 Jun 2026 16:32:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB14ADD98
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:32:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713955; cv=none; b=OW4NDhW4zLU8quaxbHXfbYgGIJJuz3ZdTVMXdMGFXx9kBqgCxzT3Gk994PSXcQmUFRL5cAs8LMlWczLtt0tvHgBfiPvyPgSISLZqRrYOYyA6+Mzz+4rTuCcZfC86+zl6jnHSDGdVd6yJC3PwqBarT8Fr26E9fd5fceEvZ0tO5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713955; c=relaxed/simple;
	bh=jz8icgNkivpi3ZbOutI3ya4laMkl7WzQNxajxvR72zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFKZeubUccnLM3FUiFXr77/ktirhXT7/puKYKhytB/fn0r+vF7eORBHL5z8f26Pjq92aMuhdulW9kqa0JEvBrqoSxOaasRoIW9pDA8sAgN27e6INAWoaRO91x8Am/mDc55joMCiWMquPtyZl2n6bCbY8pWZssPEwSloh9DGtJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVpm4RLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnLmbcOd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFoZF9083424
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=; b=FVpm4RLhwTJ5UyC7
	B6ZGjcXa2vAgMJ+e8iK7oJvmAAqYMj/eZMOaamwFRLMl12N5FkOXZvFP4Mlp1Ajy
	x6bwywCR6e810IfnJeqOF/JG4xSZErFagttXbb78rHgDxQQIag9OmUmlk1YrlXYP
	kvPzr17u2GI0bNWkxo/Sd+lSoyF5Wy0f4QmLN7kXlraJ8weXLfKW0ZG4dbTi5QCw
	Khy2/MkzufgcxzYGeE/fkpjvVsoexrFnwKkauDqwx1sOJLiOL2jtXApBr08HgoL6
	Lysw52Cz5XlOJ8GxYoaLIvslQKM+HmuRqp/nviqEEHzfcIgyxJ4BTvNZBbJS0f7F
	QZ2D+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vgr39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:32:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c40358e114so276265ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713948; x=1782318748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=jnLmbcOd6xg+FONfUf56m9L0Y+3N0hVZmXhbJzYgzcgi5dyAs4C5Y69uEScDJyknCO
         qRCfmij6qIu8t7Wui+iWDJfe/A3VOqjRgOEIMy4kecaeBDjmvphGvp3EwAEYuPkdriEX
         TgCWUC72f5Q4NS9Q/VfRdziQqdWEoK8dZZk0MRHwn0FJ9sUWyIEkmanPFsxRSAGZ2jzm
         uGZqHb04BV38bBpibPajeMvKJQhcGs1mlB3UeqieHPQ+19VNzhkbp5f3fBpju8EvT3G6
         uXZ0jkwzYbH7siw4SQz7HdZpBOXQMWRWz18DybBTxhxf4aRZ/g9RzC/tFaUswDy6vLDs
         utdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713948; x=1782318748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=NCTSkiVhOdOboMS36Rsuq5t/uZuWusOUnAdVQwnpbJiegyp17slj4Z5vsY9KNxmloo
         qm/POPUK6vpRfduno0/EodWbM7OZS9X62Sg6t0KOBSWVsYWUJgsMNQIiEzKS7tSRVVzD
         aBiM9mqSPeiVILvlMypXH5Ckc7QuqROPb0HQsDrWnvsIl6GHsFgHfylhJW0WNAVTXlyT
         m9E/Hdo3QQAqDKr0Pe7+rCS3+Qf88u0zZM3EHhdKMHQE1kKogDb7JywIEEe/9NbKo8Oa
         y2ogs7lvoJQ5eWu6hXJTno9zi3aU05x9ksArckOoRNRvy0wOkgEuMxEVsJYitMohy6uf
         xJzA==
X-Forwarded-Encrypted: i=1; AFNElJ9tLIcA8pcgICAJHv8iI/IjNnLy3/JPhuFd2IFHyQr+Xxc6T51T7ygsw+o0V1MG4Qw74U9nEOGl+1Hn1QqR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwljrtr8E9nvZMJibqMohXSQkqT97THt/9NJDytngDKGOcmyv9
	HNhQ7GSiwZVgCpifvUoE/AuqGvkvFVGzxso+/Mm6cF0BCRpeFLElbRoTIVc/B2TDXhKjxKzVH9+
	cGZB/1PuCZXTjijNqUBu6LodG4p2KzlAdUC53md78Jo9rstnd+RAdFwweY1dAiuMYecJD
X-Gm-Gg: AfdE7ckeA5mZ6Z5740ekDCozaexp8xI4nrp2TTRyA599sCFKAt9R5Cdw08KykvusTmH
	uNqUStQLW7bHetS8u5+CEPvquWE4wqox9xKBoqx9JQrkZ700lbI/6a6qFJ8TIf+HuRl2WHUidVA
	lZWEfX1/G+E7DV9iQ8IIUSnot7EN52hQGCg4+zjtoERODAEOT8JzAViYnW11hdiJXcPVQXiUzz2
	8YPxBAa2GnYHPPYO3Z6FQkP55Tjbsss6OP/kV8bz04ybp3kTZoGwBdvNiGq4QIGWIiYGDj7PQsy
	Zuf22Xcq3dIEE4pxDMwi+uRZkSvIFb8YG+n3ST07C5AC0rHCWh0w/tiXCOYVtaVl+K0KUbT/DbC
	P1TU7CBF3OROLE+AEowxN/AoWIPPmBmt4YN/sEBU=
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129585ad.2.1781713947979;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129125ad.2.1781713947448;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6d637caccsm7991475ad.20.2026.06.17.09.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Message-ID: <984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 22:02:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
 <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LrKaH87FwlUTjTVs_d-JtjW737_d7Ml3
X-Proofpoint-GUID: LrKaH87FwlUTjTVs_d-JtjW737_d7Ml3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfXzGG6zX87l+gx
 7/VsZZEZ/vlr8shtwEPcl3PiDporIjUK++oOQVkzGsqG8HYL4OJ/Q5py2T3J6kybhzQ6u6yBhVl
 /SzYeOLeGJmsN0F3XrLkOm+glmVsA86Nxk21xdX6NtS6hQ5Tm5Uh0QJtgQ+A0hIMN33rpS9xjwc
 ybrlFh4jrUSB9O+460DBM2pqIkrC0x5U5lGogjeXsr4gpYw+fHShRG6Y1CxiIQ44Ag6qGu7PH5D
 zzCPDNCZ53d0BCGfFoT4zhPiWUMlfph4rDak10rVkXBjgUw3iuGt4r7Hqyyc87tHjZW6dpTgXKH
 ihHvDUs07ZMv1TM9rJq0RG3M+MkRgrHRdBzjYgYkwteM2luqRSnSTPDDw93hLfOzhnL3gr3xKPv
 gYiqAa+7SENYp20zyluh4JxyVcXfiMdbtYC7KJ4eVkz6QHktrh6S+y/KFvWRtB7EOA5r9scsVNM
 87ZFXHTCvUeenmBFOQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfX9v7BTgrGqba8
 tZz2uuowS4+uVar6O257Ux8cMXZfD/qJiHX5Ep/1trntwFbEI1Y0TLs+We2vcMihtLTvHlnFsIo
 mK5hHNysmrjopKc8MgXE5SoFI/wb32o=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32cc1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XunzQJBhBzqSrgwI8wIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170158
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
	TAGGED_FROM(0.00)[bounces-113672-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 2CB0E69B677



On 6/16/2026 5:52 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>> On some SoCs the SMMU registers require an active interconnect
>>>> bandwidth vote to be accessible. While other clients typically
>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>> vote, causing intermittent register access failures.
>>>>
>>>> Add support for an optional interconnect path to the arm-smmu
>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>> is acquired from DT if present and ignored otherwise.
>>>>
>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>> during probe and runtime resume, and released during runtime
>>>> suspend and on error paths.
>>>>
>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>> expected to have an active vote whenever the adreno_smmu block is
>>>> powered on. In most common use cases, this requirement is implicitly
>>>> satisfied because other GPU-related clients (for example, the GMU
>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>
>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>> vote is missing, it can lead to the observed failures. Because of the
>>>> precise ordering involved, this scenario is difficult to reproduce
>>>> consistently.
>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -53,6 +53,11 @@
>>>>    #define MSI_IOVA_BASE			0x8000000
>>>>    #define MSI_IOVA_LENGTH			0x100000
>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>>
>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
>>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>>    	}
>>>>    }
>>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>>> +{
>>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>>
>>> Is there always only one bus / path in question?
>>>
>>
>> <Apologies, missed to respond to this query>
>> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
>> while accessing the DDR in downstream path (client->TCU->DDR), which we are
>> addressing here.
>> Hence it's only one icc path in question here.
> 
> Again, you are describing Qualcomm platform, while the code part is
> generic.
> 

ah yes, single icc path is specific to Qualcomm platforms as of now.

As per my assumption, it's possible for other vendors/ARM-SMMU users to
have one or more than one icc path to reach DDR in downstream flow
(similar to clocks).

I will revisit the logic for icc_voting to check for possibility on
additional icc path as well, so the generic code can cater to other arm-
smmu users.

Thanks & regards,
Bibek

> 


