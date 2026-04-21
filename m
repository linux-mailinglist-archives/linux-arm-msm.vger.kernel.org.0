Return-Path: <linux-arm-msm+bounces-103892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LW4Dfgr52nv4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:49:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE6437D82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 013B93005657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E338237D;
	Tue, 21 Apr 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kfbh7Q+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSgQSlJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF832D97B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757685; cv=none; b=a8VSclnh8SW7Q7gRkj9OPZvMB8pfIkMXFNDbGCaTkIQzDXcNMG+HMqvI536FicSBeGH55Pa5Lv9bY9zTsN1iHWWrPIbs0x9M+TaMriVhnKC08HsJ3av7vUJrzijCzWzEFCoISb+SE9AGkt2oDX1qCECCWbkBXwwRCIxXVwWg4J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757685; c=relaxed/simple;
	bh=eRTKLnLtLXkmNerM66kPvDnNPuXAQPh9wE1hbZ6mJDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBlOj+q2ZXaF/0mwioxoFAG92oCSzRZVMIH2H1mv/OJj95DOOrr505yCUXI65IJbbBgYh6UiPP75ZmrmZrqMQkgJ5c7f7j3dNu+lG4Jhdzd87MvgxtIwDgRV/j6D9XWnirs6C/Te3l4eKagR6P96XO86s+lOC8T4uZfsVQkXGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kfbh7Q+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSgQSlJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1poC42755827
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=; b=Kfbh7Q+4HjjJvoKj
	9/CpJeHcTEAZmL0h8kY0d77/Iw3u9jQcVoai3Ubx53eIOX5ZWb8qCVGx9atdCy4C
	fp6VG6prt0/bezE7s03PXPqMyNaJPjovSwauOoA5ltxNGMoaEmWB1xo56rrx6X1F
	w6MkLQc6uQXeB9Ofp+D6iV2TUI5uIiQe7nibZc4+kaPpXhZSuXMEjySOK49bG6Ip
	RDVAcf6Da04jPLp4limSiWIz9QmMgCDgxDmWvV0wFKcybPl8d7OFbKk090o8Gdeu
	MA5fUU5OIWIc0T203R0ekiUWd4ldHPSfMQPCMXCrgqG8Wahl0yQ+rRilGqAMMjPk
	W9RzHg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xmcuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:48:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so52862705ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757682; x=1777362482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=;
        b=FSgQSlJ6hx4I4+2cppbyETTU0/4ECg/8iy39F4AqyNrIm1xmV8wvs2VkGQOD7NqyzQ
         jqnWKlMhGcS2+4P/gglnL2uiN3CrUbfvi1isQSeuYKE8I1EggmqNzdFDU/N1prmmMwCT
         jyOWc2hRMreEix+PdrCXUqOp5BGmeu/4fbE8isNKqMWD8Djukj0g7Lix9PLb9hvV7qny
         nnEx+djIvCYcbGTg1czlMNWb26rIl2dsbv2Dc1qEPeYYfXocO/gbSVE7tbc8FHCIGf4r
         90N6GQZGPQ2hSa2oiwV1zmPpUa5BJGXoA0D6Y+2Uqmen9eB2xq2iENBVJHiE9QzwWEBA
         bYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757682; x=1777362482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=;
        b=O6Oz42mX3BjIrOjer/lkNUdtG3u5vQK0TwqikLWTEFP8prjD3bqSE0osfOGfLXhEA0
         BIhAm6SWYCrHIQ29SakEe8AfATa/uCW/QU0kusZ7RsMJtwo8O7XerS3PsrpjfYugk2eP
         4bS2T3pnJJSEqNcSFI8FMDe+Tso7dhL39228Ru1pM/vIwhYYIQ6bQKh9hz3a8i6LP2jV
         91U4R65sqviXQ2oXjkZdS3aDiwTtBmI4zQYzcdp14JzQOfomn2Yhq/0ZgXZi7ZdGx3sn
         2Vvm3vSTGLPIT76to1XL0Hpyso6coEmz+zhkkgzOu1Rbwn8nbGNlxb9+2W/YnC30L3kZ
         1Bvw==
X-Forwarded-Encrypted: i=1; AFNElJ/0+TgBCWyqZCkH9OgjdkcgXzogztJZmfhMtPMVOyF5Yt9NH2tEH5mfhnjMbP6KzFz1G02Klzl+WkR0usTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YySoaJfMkaNVvPod5fHGpClC3XYVvdkUJamIyeDL8aeecuLqN8/
	MGrsvgayoac4dl8IBEX3Wbe6FBjPFQQVHlLSB2kkysVxZV5LvVKG3CzmemgAcbPG+aTRKWMOPXE
	iyAVoSzmOT6oanuQ+fzbP0BYNoJjU+FHvLWmyEgYJqpIUPhsBTXvbu31j94HcVKXlM2KV
X-Gm-Gg: AeBDieta+q69OFSRL5HW5KDjkb4LPkZNuJh/kHtqopfjkY3iCAA6JycuGCRS5qAvHDl
	jV5x4iuzbpBNH30AEYDYixIPrkVkqyRHHdoUZgIxJzarxM/3CNNeGWQ6FDugHLojldmNtCVp7WT
	KRm4U/6Fs5qzi/yYYJTF6myuIFzyKUvZkV+Ybgm1nXK+7MJ8mSVfh11YHWNmgp5MqB5lyLSirFv
	+LdyxvrBt6Vxn22A6CS69fjGdt94WVaXpW9x2EpoJ0BMSv2gBiDMj+MRQUgu6w8vNTdAb9uAaAI
	RR2jf6XmuMmHI/GV1laqqk7QC3p5hLDr/WytpWNDcIqineSFsq1DqQ5Z8U1+2Pf+eoRlo/eQCW4
	nUoVfbVJygccfibyDEAENHDiJ5WCgfZFeTrXeUWJaX0tvcsxlIkmBaWlFdL3Kzw==
X-Received: by 2002:a17:902:f54d:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b5f9edb4cbmr183222045ad.15.1776757681944;
        Tue, 21 Apr 2026 00:48:01 -0700 (PDT)
X-Received: by 2002:a17:902:f54d:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b5f9edb4cbmr183221615ad.15.1776757681364;
        Tue, 21 Apr 2026 00:48:01 -0700 (PDT)
Received: from [10.219.57.87] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cb92sm121375995ad.50.2026.04.21.00.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:48:00 -0700 (PDT)
Message-ID: <ee552fdc-e35b-4132-b8c5-35bf409adec0@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
 <ac8j1jlFNxgZWzzK@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <ac8j1jlFNxgZWzzK@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NCBTYWx0ZWRfX1OIFqsEKiK3r
 1X/7bTATxG/KM5AIVgZY1Msc1DzqxqN5AE8SHuMeKQdZgQMhjsh49/BfcSvHoxDhT3/3g5WbWzW
 CQE1uk+CfKkvcXzByasKmjTUFN+nt+R2gr31OF9neL3r1ygRFvoxmzXkbRen8D5g+zkqwi+34AX
 832uhjROftd3zYfxm3MF6nyPMpiyR5ni5TQP8HG+5NxTlXA9ZwSnQv/4kvQepeSjh94Kb4rmobM
 0Vp1JEGw44Ipdmmm3uAAdEVgiF+sZ25aBDcr7voelXbd78/O0INepp1+8+Efge4QmhtY0uT8Xiw
 O4sUeZUgVQcFxMZ+/WsNAuBn8KLQ7641E976LsMQ3D4zJJZg6aWoPF+Il0aUlaGSBBS5wwd3nLM
 xe8tJ+zyuNKvVAfJVXNh4Kzw+cL5UobnXLNDdmUfd6/wgnCJnqRiZkB6aLr+ONvAtBtiI5XW7cW
 mTDqQKLqenRElKs5Q+g==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e72bb2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=X3pBVciGceusgIsGFAAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 68H0nbBq5dOAwmXggL0htxRyLqTntwuh
X-Proofpoint-GUID: 68H0nbBq5dOAwmXggL0htxRyLqTntwuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prakash.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EAE6437D82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/2026 7:50 AM, Pranjal Shrivastava wrote:
> On Fri, Mar 13, 2026 at 03:53:53PM +0530, Prakash Gupta wrote:
>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>> sits in a power domain, all register accesses must be done while the
>> device is runtime active to avoid unclocked register reads and
>> potential NoC errors.
>>
>> So far, this has not been an issue for most SMMU clients because
>> stall-on-fault is enabled by default. While a translation fault is
>> being handled, the SMMU stalls further translations for that context
>> bank, so the fault handler would not race with a powered-down
>> SMMU.
>>
>> Adreno SMMU now disables stall-on-fault in the presence of fault
>> storms to avoid saturating SMMU resources and hanging the GMU. With
>> stall-on-fault disabled, the SMMU can generate faults while its power
>> domain may no longer be enabled, which makes unclocked accesses to
>> fault-status registers in the SMMU fault handlers possible.
>>
>> Guard the context and global fault handlers with pm_runtime_get_if_active()
>> and pm_runtime_put_autosuspend() so that all SMMU fault register accesses
>> are done with the SMMU powered. In case pm_runtime is not active we can
>> safely ignore the fault as for pm runtime resume the smmu device is
>> reset and fault registers are cleared.
>>
>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
>> - Added support for smmu->impl->global_fault callback in global fault handler
>> - Remove threaded irq context fault restriction to allow modifying stall
>>   mode for adreno smmu
>> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 60 +++++++++++++++++++++++------------
>>  1 file changed, 39 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 5e690cf85ec9..f4c46491a03d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -462,10 +462,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>  	int idx = smmu_domain->cfg.cbndx;
>>  	int ret;
>>  
>> +	if (!pm_runtime_get_if_active(smmu->dev))
> 
> Note that the pm_runtime_get_if_active(dev) only returns a positive
> value if the device state is exactly RPM_ACTIVE. If the device is in the
> middle of its runtime_suspend callback, its state is RPM_SUSPENDING.
> 
> Thus, if a fault races with the suspend callback, we'll return IRQ_NONE
> and the suspend callback doesn't seem to be disabling interrupts.
> 
> This isn't any better if we're in a fault-storm caused by
> level-triggered interrupts, we'd simply keep entering this handler and
> return.
> 
> I believe we should clear / handle any pending faults/interrupts or
> atleast mask interrupt in the suspend handler to avoid this situation.
> 

Sorry for late response.

Thanks for feedback, I see the issue with level trigger causing
interrupt storm here.

I don't see how we can meaningfully handle all context bank faults in
suspend path. We can clear it, but the idea was that smmu device is
going to be suspended, and shouldn't have any active transactions at
this point. Any remaining fault is expected to be stale, which will be
cleared in resume. I think it would be better to just mask the
interrupts in suspend path to avoid interrupt storm.

Will address this in next patch.

>> +		return IRQ_NONE;
>> +
> 
> Maybe we could add another wrapped-helper to maintain consistency:
> 
> static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
> {
>      if (!pm_runtime_enabled(smmu->dev))
>          return 1; // Assume active/powered if RPM is not used
>      return pm_runtime_get_if_active(smmu->dev);
> }
> 
> This returns -EINVAL otherwise which isn't a problem for the if
> condition but slightly cleaner.
> 
>> +	if (smmu->impl && smmu->impl->context_fault) {
>> +		ret = smmu->impl->context_fault(irq, dev);
>> +		goto out_power_off;
>> +	}
>> +
> 

Ack. Will update in next patch.

> We've moved impl-specific handlers here, I don't see a functional change.
> This looks fine.
> 
>>  	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>>  
>> -	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>> -		return IRQ_NONE;
>> +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
>> +		ret = IRQ_NONE;
>> +		goto out_power_off;
>> +	}
>>  
>>  	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>>  		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>> @@ -480,7 +490,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>  				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>>  	}
>>  
>> -	return IRQ_HANDLED;
>> +	ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +	pm_runtime_put_autosuspend(smmu->dev);
> 
> Nit: Please use arm_smmu_rpm_put() here.. while at it, I guess we can
> also bring back pm_runtime_put_autosuspend() in arm_smmu_rpm_put() since
> it is updated now to also mark last busy.

Ack. Will update in next patch.

> 
>> +
>> +	return ret;
>>  }
>>  
>>  static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>> @@ -489,14 +504,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>>  	struct arm_smmu_device *smmu = dev;
>>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>>  				      DEFAULT_RATELIMIT_BURST);
>> +	int ret;
>> +
>> +	if (!pm_runtime_get_if_active(smmu->dev))
>> +		return IRQ_NONE;
>> +
> 
> Same here.
> 
>> +	if (smmu->impl && smmu->impl->global_fault) {
>> +		ret = smmu->impl->global_fault(irq, dev);
>> +		goto out_power_off;
>> +	}
>>  
>>  	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>>  	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>>  	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>>  	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>>  
>> -	if (!gfsr)
>> -		return IRQ_NONE;
>> +	if (!gfsr) {
>> +		ret = IRQ_NONE;
>> +		goto out_power_off;
>> +	}
>>  
>>  	if (__ratelimit(&rs)) {
>>  		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
>> @@ -513,7 +539,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>>  	}
>>  
>>  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
>> -	return IRQ_HANDLED;
>> +	ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +	pm_runtime_put_autosuspend(smmu->dev);
>> +	return ret;
>>  }
>>  
>>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>> @@ -683,7 +713,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>>  	enum io_pgtable_fmt fmt;
>>  	struct iommu_domain *domain = &smmu_domain->domain;
>>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> -	irqreturn_t (*context_fault)(int irq, void *dev);
>>  
>>  	mutex_lock(&smmu_domain->init_mutex);
>>  	if (smmu_domain->smmu)
>> @@ -850,19 +879,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>>  	 */
>>  	irq = smmu->irqs[cfg->irptndx];
>>  
>> -	if (smmu->impl && smmu->impl->context_fault)
>> -		context_fault = smmu->impl->context_fault;
>> -	else
>> -		context_fault = arm_smmu_context_fault;
>> -
>>  	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>>  		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -						context_fault,
>> +						arm_smmu_context_fault,
>>  						IRQF_ONESHOT | IRQF_SHARED,
>>  						"arm-smmu-context-fault",
>>  						smmu_domain);
>>  	else
>> -		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
>> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
>>  				       "arm-smmu-context-fault", smmu_domain);
>>  
>>  	if (ret < 0) {
>> @@ -2125,7 +2149,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	int num_irqs, i, err;
>>  	u32 global_irqs, pmu_irqs;
>> -	irqreturn_t (*global_fault)(int irq, void *dev);
>>  
>>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>  	if (!smmu) {
>> @@ -2205,18 +2228,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>  		smmu->num_context_irqs = smmu->num_context_banks;
>>  	}
>>  
>> -	if (smmu->impl && smmu->impl->global_fault)
>> -		global_fault = smmu->impl->global_fault;
>> -	else
>> -		global_fault = arm_smmu_global_fault;
>> -
>>  	for (i = 0; i < global_irqs; i++) {
>>  		int irq = platform_get_irq(pdev, i);
>>  
>>  		if (irq < 0)
>>  			return irq;
>>  
>> -		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
>> +		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
>>  				       "arm-smmu global fault", smmu);
>>  		if (err)
>>  			return dev_err_probe(dev, err,
>>
> 
> Thanks,
> Praan


