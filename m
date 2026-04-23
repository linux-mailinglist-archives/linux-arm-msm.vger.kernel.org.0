Return-Path: <linux-arm-msm+bounces-104280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF1zAmzt6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:59:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C51450241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D0B63007537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0DA3E5EEA;
	Thu, 23 Apr 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNpOaVSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEf5ZqI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FC73E5EFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938345; cv=none; b=Hc/wkWAllK6PnUgQYSMXt20si1WKMsOMidIe50KYA6tINYNOGq0gvqAFNpml6JO2c5gpEUtuEYUTYLesDSqGmDu5Y88QJUftgAG5347jCywxm4U0K2rPN4cMUnFASwUSdyo5usxjr95Xy6w30NFQyuQqLC5+avoXoQiqIyE06gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938345; c=relaxed/simple;
	bh=IMnzqB1YowleuSkvqgO+9Pi4sJKmxQTYl3iRWwhgAa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5lOMCriE/oLz1KhkA/wdB9uCV+APWOAvQHds1eWuddMrDXuJ0ufERO0B4RASKAUTDzLHa5yty5hYKs4NgCu53RjMv+dIaGivpkoj82gyi29BeoKn4jSWChKSNJ53/vlEVIQy2LRvXCtwxLyitbMgrP0Bvq4+U9USnug9YKzRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNpOaVSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEf5ZqI6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNPQ1565720
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=; b=HNpOaVSNpLq667iW
	fnTY+KZSZnBfaxP6pAbEMz5rkSaxC1i63N4sHioPYORIYbinQC9zjZtTj8tAgsaV
	PgpZldHhYu0/lhc8NKfRePKm1IXWSo7oKZBLVEhFjtbbBAfXFN0qYKHJAEwx8eSL
	4zVWaaO9TBPszpGNYLafC90IIbWwWKRbw8y0WtNK4CIcKX/vtTt89yyi8aPO9KZ0
	Fxu4cHuW6VdoHvKNJD5i9oL0Su2FThsndwWyWQVcpWJVGvHg7nvk8g5oyCSp1dz0
	yzfis0elPaYS2nObFT0Yw5kMGDc7ltihF/kyjl290jk7E0Vzh66lNoPpHrpEUQyB
	LlIIMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wue2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:59:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso58285915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938340; x=1777543140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=;
        b=QEf5ZqI6f8QyscHo9Kr6K0IHL1Hep/JAFzakvKJrK9t2DKJGxLwRE+CZT/7yaYEhH/
         mcRD/tDLGzotstngbjEOV5kF+j6s5/W+mg4LSdrzMg2g+Jig4U9VR3a8p240PHo5ddgG
         iFiHF9/e2TjLAo72eYIqBMTKGt/q+DY+WUKLxGLgynnwR8HdIZpfoonWKC/kRqWqO2jD
         3Tp0QwUeIY7BT98UtAYh157avIyMevwcWIldoqsGiYLBTS/nlS7tuQ1kJPqRUsZKLhGB
         C05teQD1fHzPjgCD0KQMpa7f7iugPtpy8RcbXv/a33etcfG+uWqwJuhJHx/Z8uQX6Qne
         izdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938340; x=1777543140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOf68G2YKk2F4dtcwU6A7Avk0OBQ1QvXguPWR08X8f0=;
        b=mxBzhc0tbNCEB2cnnfHLxFzNq8bYp7qpzdmqIf+40YPRRsJOlMi/uPhKeVE+XegeL4
         gB3bBG/4NwaAAaiQaWRVjlIn7E7wKFUUWnkXQapKAV8bbwGcQlqCiJdCRnZHm8RPqwap
         XpVSwFahH2tDmh4NjAkuM+0bfTGhClMkBjGzqO2dv1oAQzH+YaH5bBfA44vaL7p8DE15
         2LzmAJPpjO37j+krTPMWs2nlhxUVUegxduCEpVjgKSTX+Ctgvr5sXGzhUbu3UUV2autd
         trdT6aSbO0pDqCv7zkI9WqeIMoPUEaoedlbW5+GgyU3iyaagkx3ko2UrILr6rFsrrkuL
         2New==
X-Gm-Message-State: AOJu0Yxbh4P2NC/cXGlMu3lu710Nz92u8YxsT7NTXHVBLkxMCIxz2uEx
	OOzzoOoOIq0f2JJoa1wa9qduOMD+vig6JnygYYQocm0+D442oZCSgdvZcImnUsFrZiV2+XzttNz
	iab+5/Aszz/HBsc3xfA3YDLUWa5YCD2xfBlHIpnnEfKxWC74PJST3HP8ux5qeIMynm9bt
X-Gm-Gg: AeBDieutkCo45t8R8X2XNZK2RKFHRNODXgPnZ88PDDiSWe4mARRPmTzF91UL/JhlXMx
	XLRBWEiBxqqrhJfF1H+i/7dzCE+lyLGMz3Xqi66jKjFM30+2LLcF7a9h3qKgaLe3aTyhRxNpQT5
	87pgWxSXKC4e42wqR0U9qDNq8eKkcTm/ZXTDJfgx3PibW/9R/kI7XWP/puXFVSVlRrA7rO9LOSl
	8GaUsxSzVqS71Ads908pKlhEEnV5KiB0pNDW1rmT9qiJDoxQaKL69jCKrSsJaiElYN140DdLtvg
	pYVNP9JyG0sEhhbz5e7hLJpgkrpVOUyNdh2Xr0vQLe60tH0OMXgD9Q/oO+WmgL5begUxzB9o9J8
	jkYdPvFKtIV7gG0qZlVruhxTbw+0JWp2zCJUwsxWDFTbdk7/kuwhrzVDrashR
X-Received: by 2002:a17:903:1663:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b5f9efc3b7mr300413505ad.12.1776938339799;
        Thu, 23 Apr 2026 02:58:59 -0700 (PDT)
X-Received: by 2002:a17:903:1663:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b5f9efc3b7mr300413265ad.12.1776938339324;
        Thu, 23 Apr 2026 02:58:59 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ac1fsm201512955ad.70.2026.04.23.02.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:58:58 -0700 (PDT)
Message-ID: <9d2ba2ba-e560-44ba-98de-fc3d410f9b94@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:28:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
 <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
 <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5NyBTYWx0ZWRfX69ZvkCh9oBDe
 7T+irqF9dYilRcnxIOFbcRzoHv27EfwrzZ/I0hvBXwxLHokl/V2Ga57L5YpbdoJW4XasUnMHdlG
 fzpc46XFiXBJfV3WKCTUnoypq0v4muBj2xJYPPdgs51gr9jd85/Un/WWZDmLWcMe9YHZsJqE0/t
 lcW8fnHZV8g87TUObicmS0CDvH25IX4IbhMgm8TVlUAZP0yq/+tB7wT6+5pFgtY5bNfFFzpmfqV
 ZoCHCs+rGYaPk5+HTEFHcmnfiNiJ+s47rPczww/ph3xKDPTaDB7hlg+pgtG6R7lvrStVlEtjFXp
 qa2+Rb9U8exWpOyW1si3vU3T5oi7nVEI/qOhx9YQglaCIzcvA5i/HPHNE9OIdsrrd4PU2j/rI83
 SSwkKPPmJ/qIUZwl0Y/lYjAf0Tf+7ooWNVqRDT2c0hAsGraMpxXR/N9A7cbMEykS/V1SmsVTmpB
 qP+Nd+g/etcgMa67YLw==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9ed64 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uz4NEalOebycq88qK4YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: co48-WCXmbQaCb9FidQdYNr-XFk0jP9d
X-Proofpoint-ORIG-GUID: co48-WCXmbQaCb9FidQdYNr-XFk0jP9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104280-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84C51450241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23-04-2026 14:58, Konrad Dybcio wrote:
> On 4/23/26 11:19 AM, Ekansh Gupta wrote:
>> On 23-04-2026 14:20, Konrad Dybcio wrote:
>>> On 4/23/26 8:35 AM, Jianping Li wrote:
>>>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>>>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>>>> runtime). The kernel then reports failure to reserve the region and
>>>> subsequent EFI runtime activity may trigger aborts.
>>>>
>>>> The remote heap node was described as a fixed "no-map" region, which
>>>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>>>> reserved memory region with reusable CMA-backed allocation, specifying
>>>> alignment and size.
>>>>
>>>> This avoids hard carveouts and reduces the chance of conflicting with
>>>> firmware memory maps while keeping an explicit pool for ADSP remote
>>>> heap usage.
>>>>
>>>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index 988ca5f7c8a0..420219823496 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>>>  		};
>>>>  
>>>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>>>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>>>> -			no-map;
>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>> +			compatible = "shared-dma-pool";
>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>
>>> Since DRAM starts at 0x8000_0000, is it intended to only allow this
>>> region to be in the lower 2 gigs?
>>>
>>> (it may very well be for some historical reasons)
>> yes, this is intentional. ADSP supports 32-bit address.
> 
> Okay, so I think this should be one of:
> 
> <0x0 0x80000000 0x0 0x80000000>;
SGTM.
> 
> (where we directly specify the DRAM start, which may just be form
> over function)
> 
> or:
> 
> <0x0 0x00000000 0x1 0x00000000>;
> 
> to cover 0x0000_0000 - 0xffff_ffff
> 
> Konrad


