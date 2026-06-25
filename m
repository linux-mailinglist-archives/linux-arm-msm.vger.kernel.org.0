Return-Path: <linux-arm-msm+bounces-114444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8wTwOSzBPGp8rQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:48:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9EB6C2D80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:48:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="knk/ccUx";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XEG63ndx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29AFC30053CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 05:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CDA3BCD37;
	Thu, 25 Jun 2026 05:47:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1813BBA1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:47:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366471; cv=none; b=k3DMSSxkTW6KVSB1/PnAQzy/S6d70JuhT5mMWHlhDpYmIO093feGkCr+xuJxC+vasTiHcrtn0cGNyW73eb+1iUoP2QizQ+Nn6oGCyePtt++vab/ZwZGz/ntXvAxHk4N17GRPnnYi6zNNMTRV6BaZkfhkzI7tjphHzlsIbDX8n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366471; c=relaxed/simple;
	bh=9TaWxQHIK3+Vm6U0liSitnPiiXKLQ1md4Yaxeni3Bho=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wooj/N+7Ni6i4P+D8p5amZaRRaqzHMWgLxR5Rvgrveqa7f0+pr7OGRiR9tzHh5siH02BTS7bo4GZtNYIMCBch1bvNpsLICeEjOYne9hwp7aMp+wfUM2A9fuJCF3ANk0JD9IPKgLu2oBOlDNTEvBwHA1rjxRS5CZX38mzQX7WJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knk/ccUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEG63ndx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eAkH559046
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=; b=knk/ccUxuYUeuhqY
	pdLnzCEbOCPpAxWu3+BOFN6RC5NhBF7yiQbjorS3jGDvc6Iw74jH5SGVpDpXEHWN
	VfRuvUKqrGT/hOcQeR0Su3QkK55YFvxPGgBXUOk2qgJcrIEFwQEGvgYfn32VAQSK
	25Ck37sCRMHpaRWSoTbvYQBJkM2bePYYo8O4aWa8h6Gsfzu/s5cRaiSUWIH5itce
	bqC4u4l8wulKN69i7W4QoDXJO0OrDYyunytLkkrZ93yIIg187fhop3Mx5LBDxKQK
	q6QcvskHQsRHwoikLAUpXsLGVTsMDcy2lvOt5KnidoalAnxgR18i8GeK/zonCY2p
	q6uOYQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d45470k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:47:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c567so1424912b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782366469; x=1782971269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=;
        b=XEG63ndxZwz9Eb5BowrDwqw2XLgeJNsd8oREX++8EBj/PV0xHhCgQdsIRP3ooV22ul
         drbcyuJBnYy0abLrqCdxnlw9n98jHhy8MbI7vjxe1Z2ZOpRNyNwHzEoFaaUznnRlwsxB
         ygssc7K3vr7ZuOTGEfIB9gegNaMf84F1urT8M4RVb39H2s1ZzUVsI3knDVkbM/QbnqUg
         YuAcpM7Jw4WbKWOOyisJlN5L2uTYJRGAQ79bhTrMbAqWgYAs2VYqdZTbPh7ZzjA5aGxt
         LQrCFs+2rCYHNV4L+2YbFsmfGHEnYHSDyZIdAvaQhGMJo9klY77uZ7iSt9HlsDZ6Bnox
         bLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366469; x=1782971269;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=;
        b=HAf6yzR5zj3jSwSvYjRT5q5fQSXsJlAao7qapXluLDghjpbacCRA5P0zrawFhVFV0x
         5ZrrFS+ZzWw1RVg7FqNi/yyB5znXJA3W6SEMxHki8rfA0byuoGI4l7tPbBPSE3bNm0Rj
         mPHdUMNjhPHW+/yFFQoaKf25MnYuKp0tR3lH9qeLqnXFXY+Yvfyr/mo6yR/Yh9RHa5OW
         d+1dQdV5irN3deBcRTbKa2Fsq9pDR7o/8FdGdSIKFZwan68XN1YvTHLaPAjXrCDIixbI
         ej+1cuezxiRd8j2bVlfXyMXeFSeNXLKH/uqhI0vqbrJW4MPj2dyIB8rBv2WELl7Crjid
         inAw==
X-Forwarded-Encrypted: i=1; AFNElJ/MJUiK43E0MsFRgNON2VaKUEtzZsm6Bku4jpVllF7pije+iy6IaNfevM2He54kN7v3AxX5fNtlkse8wDZD@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYz1q1kGpgb5JvzFQ+ZNJlNJuRjlLO4RsdbzYHWJPTb2Hi1eP
	L2Eud30wSHtFriogdxRbAXQ6xAwk0gcJ4hWBTfQuwkuWyVrHTzwXnfOwoAbnUfNM9PrUhvJ9t7e
	YvNQi0l4ooOCBEofQbM/Ze2YV0qr+hAnVYqB9hxwY9CyBlqnLF2sK50Wmf5xsozJ8rxQM
X-Gm-Gg: AfdE7cnDW33muC3tW39/rVOOqYZl3bWvbvxhOCvPZTIkW4prFqS8zhez70xEzzbI66L
	cF0bXMALQOExbqKQ59vc0ixUA+156+p0VXxssjiImUm63L3Gazjl9wimvA/sTi20aZoAzV8ofAN
	SLUrlTzfnGZNR22ut1+GJTLj1rkDR9jxkagy8EJtwZAfy52bpSqKDzcCg8cZ+3ml9GHVFMSYJbu
	Wdz8aLxRST1Rrn4AJDTNylwzVIggyHyO7SkkPR+CE1/Z/CC3A0vBy8b8czaBljzPFMv4qHAR4Pb
	iWlKapzndxqE5rX5kEo35Fo8QnrBVLvseBeFkEHQzV/uoBV0GCtl6c7s1vpB4efJx/m3J4+SrGN
	llLMSi91oHKlMdHFCMkBdVmjnA8ImT4iSPb8B8j6WUFGg
X-Received: by 2002:a05:6a00:f8b:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-845b3ae1ac6mr1470946b3a.37.1782366468449;
        Wed, 24 Jun 2026 22:47:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8b:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-845b3ae1ac6mr1470925b3a.37.1782366467845;
        Wed, 24 Jun 2026 22:47:47 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc82dsm4343164b3a.7.2026.06.24.22.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 22:47:47 -0700 (PDT)
Message-ID: <9b5b8feb-da05-4381-93dc-c11e135fff10@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:17:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Daniel Mentz <danielmentz@google.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfX7d91tDZhHv4m
 wuDMyDMJx1yUbsM9HGVQjlKj3gGm2NJxT/bW1la8ebhK9yNuTGSQZqhSBqV25KmnGIhNbCp3hjY
 adN13vQ1JOJIx+sO6BaJhoNKLW3KZxx+iC4bwOghNL78uCY1PmFVtpQdkqGqBLIDuUGEIDG7vZJ
 9ECiIqE8pDL008bHkpbv9GdgxUA6wVDlts7XCS1Xfpg2cLs29lfsZNRc1j/52qSaVBF4CQGAz/u
 OK70eCJEYvjcfzsWau5jJUcldvrSWyUwKo03maFlek3gjkC4MyItF2oM3jMlZ7gEadf8JwWfGIS
 UcHSRegsc7B20bsy7DLvkDiVgPz6jmAz8Kyb3KoFMDm5W3k0WEiZ0XJqfxsSikTTyJIvfTtq3ie
 SEXw0RPZj6VNABacg5fst5dDIdANVnvfaqqJuokZsites5oZJVy452zCHbz0PPTNH0YL+ohUksw
 lrJWkXdpmq+lYEzFS3g==
X-Proofpoint-GUID: 4LX3p91UnfJPckhKX09K8QzLA63nouEF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfX5gvzVCJY2Q1u
 JrI3Lb3VYCFMzq8vVqQevug3jB6go/YSoxwl3RzHB9je5vNpcFVdfo1WRXbtbZWkryKiERGNZT5
 v9wRes5WtaivZ3srnHmaMUBLceafQmc=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3cc105 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2pZLd1I5B0H_JK-GwgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4LX3p91UnfJPckhKX09K8QzLA63nouEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114444-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:danielmentz@google.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F9EB6C2D80



On 6/20/2026 1:10 AM, Daniel Mentz wrote:
> On Thu, Jun 18, 2026 at 2:06 AM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
>> provides a compile-time opt-out for hardware affected by SMMU errata
>> related to the contiguous bit.
> 
> Have you considered making this a runtime option? Compare this with
> arm_smmu_device_iidr_probe() where the smmuv3 driver disables certain
> features based on the identified implementation and the errata
> affecting that implementation.
> 

Thanks for the review comments.

Good point. I’ll drop the Kconfig switch and make this runtime-controlled
via an io-pgtable quirk, so SMMU drivers can disable CONT based on errata.

>> On the mapping side, __arm_lpae_map() detects when the requested size
>> matches a contiguous range at the next level, sets the CONT bit on all
>> PTEs in the group, then recurses with the base block size and an
>> adjusted pgcount.
> 
> I would perform this check at the current level not the previous
> level. See comments below.
> 

Sure, will update this check at current level.

>>
>> On the unmapping side, the CONT bit is cleared from all PTEs in the
>> affected contiguous group before any individual entry is invalidated,
>> following the Break-Before-Make requirement of the architecture.
> 
> My understanding is that for unmap operations, the following rule applies:
> 
> The IOVA range targeted by an unmap operation must exactly match the
> IOVA range of a previous map operation. Partial unmap operations are
> not allowed.
> 
> The iopgtable code previously had a function named
> arm_lpae_split_blk_unmap() which allowed a block mapping to be split
> up. However, that function has since been removed, which aligns with
> prohibiting partial unmaps.
> The other concern I have is a potential race condition: While one
> thread clears the contiguous bit, another thread could try to unmap
> the same descriptor.
> 
> Consider dropping support for partial unmap and just triggering a
> WARN_ON() if you detect that a contiguous group is partially unmapped.
> 

Sure, will drop partial unmap support and  I'll update with WARN_ON()
as suggested.

>> +static inline int arm_lpae_cont_pmds(unsigned long size)
> 
> PMD is not a term that is used in this file. I advise against
> introducing this term.
> 

Agreed, I’ll avoid PMD terminology here and rename those helpers/comments
to use block-level wording.

>> +static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
>> +{
>> +       if (lvl == ARM_LPAE_MAX_LEVELS - 2)
>> +               return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data));
>> +       else if (lvl == ARM_LPAE_MAX_LEVELS - 1)
>> +               return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data));
> 
> Consider supporting the contiguous bit at lookup level 1.
> 

Sure.

>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>> @@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>>         int ret = 0, num_entries, max_entries, map_idx_start;
>> +       u32 num_cont = 1;
>>
>>         /* Find our entry at the current level */
>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>> @@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                 return -EEXIST;
>>         }
>>
>> +       if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_cont)) {
> 
> I would recommend performing this check at the actual level not at the
> previous lookup level i.e. not at the (lvl - 1) level. Imagine the
> following situation: The granule size is 4KB, the initial lookup level
> is 2, and size is 32MB. I'm wondering if in that case, it'll just keep
> recursing until it hits (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1)).
> 

Right, I see your point. The contiguous-size check should be done against the
current level, I’ll fix that in v2.

>> +#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
>> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
>> +                               unsigned long iova, int lvl,
>> +                               arm_lpae_iopte *ptep, size_t num_entries)
>> +{
>> +       struct io_pgtable_cfg *cfg = &data->iop.cfg;
>> +       u32 num_cont = arm_lpae_find_num_cont(data, lvl);
>> +       arm_lpae_iopte *cont_ptep;
>> +       arm_lpae_iopte *cont_ptep_start;
>> +       unsigned long cont_iova;
>> +       int offset, itr;
>> +
>> +       cont_ptep = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
>> +       cont_iova = round_down(iova,
>> +                              ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont);
> 
> As a result of this round_down() function, you are accessing a
> descriptor that describes an IOVA outside the range targeted by the
> iommu_unmap call. Consequently, you might race against another thread
> accessing the same descriptor.
> 

Agreed. I’m going to drop partial-unmap handling for contiguous groups,
so we will only operate on an exact aligned contiguous range and
reject partial unmaps with WARN_ON(). That also removes the need for
the current round_down()-based logic.

>> +       cont_ptep += ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
>> +       cont_ptep_start = cont_ptep;
>> +
>> +       /*
>> +        * iova may not be aligned to the contiguous group boundary; include
>> +        * any leading entries so round_up() covers all overlapping groups.
>> +        */
>> +       offset = ARM_LPAE_LVL_IDX(iova, lvl, data) -
>> +                ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
>> +       num_entries = round_up(offset + num_entries, num_cont);
>> +
>> +       for (itr = 0; itr < num_entries; itr++) {
>> +               WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_PTE_CONT);
> 
> This read-modify-write operation is not safe due to the potential race
> described above.
> 

With partial unmap support removed, I suppose this should be fine now.

>> +               cont_ptep++;
>> +       }
>> +
>> +       if (!cfg->coherent_walk)
>> +               __arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
>> +}
>> +#else
>> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
>> +                               unsigned long iova, int lvl,
>> +                               arm_lpae_iopte *ptep, size_t num_entries)
>> +{
>> +}
>> +#endif
>> +
>>  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                struct iommu_iotlb_gather *gather,
>>                                unsigned long iova, size_t size, size_t pgcount,
>> @@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>  {
>>         arm_lpae_iopte pte;
>>         struct io_pgtable *iop = &data->iop;
>> -       int i = 0, num_entries, max_entries, unmap_idx_start;
>> +       int i = 0, num_cont = 1, num_entries, max_entries, unmap_idx_start;
>>
>>         /* Something went horribly wrong and we ran out of page table */
>>         if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
>> @@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>         }
>>
>>         /* If the size matches this level, we're in the right place */
>> -       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>> +       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data) ||
>> +           (size == arm_lpae_find_num_cont(data, lvl) *
>> +                    ARM_LPAE_BLOCK_SIZE(lvl, data))) {
>> +               size_t pte_size;
>> +
>>                 max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> +               num_cont = arm_lpae_check_num_cont(data, size, lvl);
>> +               num_entries = min_t(int, num_cont * pgcount, max_entries);
>> +               pte_size = size / num_cont;
>>
>>                 /* Find and handle non-leaf entries */
>>                 for (i = 0; i < num_entries; i++) {
>> @@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                 break;
>>                         }
>>
>> +                       /*
>> +                        * Break-Before-Make: before invalidating any leaf
>> +                        * entry, clear the CONT bit from every entry in the
>> +                        * contiguous group(s) and flush the TLB, as required
>> +                        * by the architecture.  arm_lpae_cont_clear() covers
>> +                        * the full [iova, iova + num_entries * pte_size) range
>> +                        * via round_up(), so subsequent entries read back
>> +                        * CONT=0 and skip this block.
>> +                        */
>> +                       if (pte & ARM_LPAE_PTE_CONT) {
>> +                               arm_lpae_cont_clear(data, iova, lvl, ptep, num_entries);
>> +                               io_pgtable_tlb_flush_walk(iop, iova,
>> +                                                         num_entries * pte_size,
>> +                                                         ARM_LPAE_GRANULE(data));
> 
> I believe this is inefficient. Consider the case where we unmap 2MB
> worth of IOVA space mapped by 512 4KB page descriptors with the
> contiguous bit set. If I'm not mistaken, you're running CMOs
> (__arm_lpae_sync_pte) twice for every page descriptor. In addition,
> io_pgtable_tlb_flush_walk() will submit an extra CMD_SYNC and wait for
> it's completion.
> 
> Additionally, you perform rounding in arm_lpae_cont_clear(). However,
> io_pgtable_tlb_flush_walk() is called on the original, potentially
> unaligned range. Can this lead to under invalidation? Again, my
> preference would be to drop support for partial unmaps which would
> also remove the requirement for calling io_pgtable_tlb_flush_walk()
> here.
> 

Agreed. The current unmap path is more complex and expensive than necessary.
Since partial unmap of contiguous groups should not be supported, I will remove
the rounding-based handling and only permit unmaps that exactly match an
aligned contiguous group. That also eliminates the need for the 
extra io_pgtable_tlb_flush_walk() here.

Thanks,
Vijay

>> +                       }
>> +
>>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>
>>                                 /* Also flush any partial walks */
>> -                               io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>> +                               io_pgtable_tlb_flush_walk(iop, iova + i * pte_size, pte_size,
>>                                                           ARM_LPAE_GRANULE(data));
>>                                 __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
>>                         }


