Return-Path: <linux-arm-msm+bounces-119147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ep70DxQhV2q4FgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:56:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C075AC72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:56:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L9w7LnyF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E6S23+qb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 829FC30135C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E0B3B635A;
	Wed, 15 Jul 2026 05:56:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580403B7B70
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:55:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094961; cv=none; b=lkW8Ql3+Hk5qajnwfLoV84aO9cFJ5Tswy0kuP8jT7/SDhHlvy4kE0Rovsgh1+KVHBpFcxoadNdaCUjAZQSwQmhn/fmFVFmBZnNK0QFH+ivvY4+W+G720OoCphvUt8QbDt+y7Ol9RgHXZYGgq30x3yn9IJyy0CgrdI/zGoqfhVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094961; c=relaxed/simple;
	bh=5HTXX++gicPMEiTjJp/dz1aR1JmBPBM9RA7EJEs+w58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1g2ZaPPpMvWX/XOldaxuIaCY/K+P46SCDmqyIWrMRjXpD8+LDecgFfeuLi1kh5mm/n9iya3NDtehst+GcMNbqXnY/VFfRO4LMSVsVnt67ywBfxFfcmPhy3F1DymfPKM++5nAMdUxkHpQqoNkyR/n6o1KrtguGOtg/eY1zxd86s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9w7LnyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6S23+qb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l0CD2372469
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=; b=L9w7LnyFUmzSTGLy
	yK2/duhNZU8lZP+CmJGkP12TeN1qlqOHUgI4rMbR7OQVLjvLvgd9afCBbQuXrUr+
	ZqJUp0wmuFzSDngL1udumNVEj0hCuv08mZi1Y2f9SeZsv8+/6spv5FTfgza4x1IF
	fNEce1u0eLMc5e/suI5aYAfswvCcbnoxb+MC1trsZc9S2iMNwSOubGNTP+7mFl6w
	j5tRExgm3kDrWzzjXAwC5XmQawIX6IpFwNBjUGbBhyQ72BR3dfVOv5rnoBg3q3EA
	zO5nNb/j9MRaK7z/baBtednwF0k0s6KGI6KBvG3WvqWoA7pjyfnVoLg+huXqN/eS
	F/iVzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3fwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:55:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so828399a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784094957; x=1784699757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=;
        b=E6S23+qb5S5R500tdax0tJ9+Q55KjB+jhA3PUKDRKXN9I2ih9WUGcoP96rlA/Qk9lE
         pKDVMw4pBapWvRcz1Go599CejMV9mWUkHiaJ/Nm+R9zwASsFxsOCy6jc7R4IiHaANHRp
         4MF6dWpuppYnUtLPt3wewSLxNEbGSMoEUeAdABS/7wizn5J1HQw4p6OUF7HdDuCVDAZQ
         tGMP3Hver3GH5sEv8dpFnsgk7oRLgqof9D5EYFtdE15QjSh0wxodJOX3wDIhzACk+fQs
         deOT+HYn/DUSm+phgpt7MT2zO4v72uOAbdnBYy0JdrNGTtQeSKYDI8h3FrIYnnBdMnJB
         sr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094957; x=1784699757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=;
        b=meCst2KNPO3Dt1fL8f8x4qTfRLr86Qd0Nw+ZqFMHUWPllaIYIzs8Kwz4xwuXkgBU8w
         0JckFOWWTPj+jq3zSPgf/SpWlwKZMqfyq6X2Fd9Ou6f8ntAwM7rBDi3FxvZenM7fKn4V
         YIyums2dTj/jda6ShYMX8tw/QiDJhsrD1zBt6KOdpE2TjOXfIJ6gkPhPVJh42i3YzFk+
         XzLVuVtBbbjl5ycBpCVOZNUs9DnmC0QDMQtdhcl11oQxtjshN31GjI4tVe3anyQA49H1
         z18V0E0gZAQL5K1A+r2Y5qCruhqgLahGcXyeOTNFgq5RvkEHdjBzzmpPzKVtWF0pg+K+
         89ag==
X-Forwarded-Encrypted: i=1; AHgh+RrRwvm77EWNiBKXvRF63bYNYE4gZfON+EDjFbBCes1qCCQqQTAfbceQuwAU1+UpcQRup2/dqU/QUuhLJqxm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JIbeCROWsLcw0s/Qu+sLoANOqNr0bA2t6zzdzsVYqu4ftqbK
	qZGiWXK9Wbx9atz4bZgmdH1oitvNNekkxB7o3bp8As1Ao6m7ai06qtUqpQBHEW1096gE32J9GiB
	jKB/s3O80haRetaETB8Sh+egBnTLFzzE6OsbRUvWmIJ2vFystx0n9CqiZOar3UPFQdwS6
X-Gm-Gg: AfdE7cnM61ghT7ltm84LiN2AZ1EWVRAyTuud7PrLX7Gh0ffRTtM1208JXvmk5mjZrmj
	94r3Ff15++O2kciJP1QKW8tbYj2qLyog9QvyOzwJVJbj9FrOFfzIlBTWMhUSphY66LjSdNGuGlW
	LFFwB1QdePwTARk+eO7LxevYp3uo+ekGZPKMlylm20oWmsU7MrXBMSQZW1GtmUQnxHGtVRXK+km
	6Bq6UHWMFoKzGF61ClJaAfJWB8PCImlWKIKomo4E/fC1OatbAAP/P1FLFllCWn6yS67wPa39JRy
	ggir3XHZeMDIJeGYtKHBQM9S6+vXiPlFFNK8yzsX+rS6jW8w/4HaTmcbA9F083blVtIPFKXEGDI
	6O6XXdtr8i3Hu+fo6JDCBC+nV42183GvV5mRTorM7lmt3
X-Received: by 2002:a17:90b:4a:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-38e1aedd604mr5217140a91.15.1784094956860;
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-38e1aedd604mr5217113a91.15.1784094956377;
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172fd17asm2560963a91.12.2026.07.14.22.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
Message-ID: <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:25:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260703161228.GA1948451@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oEkEvYFGDNurJIJXOuOqgB1a0z8eG8KJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX5TZhgRBfoHjm
 19d6vgD5dpEdzWu5mGLfkf1X7hvDMd3PpHOXmQKz7XD0dU2zP3Vxh9hR1s3hl7G1rdlv65GzMi5
 r3LJIylgFDhRz+LPnvkxsrS+1OJh4WPYYsrOQCSnqGt0C5qprxFHoDzFceR4Gsr0AmBWPcrkti8
 2YehilbSuDoirAJbdhRvLFMVVwcjHZMwAnRTqVJWEXz8FUIomEC9UY08B/iQkOz/RQAYJBSn9VW
 oxe5MLpLcFVxchJ2WJnrWRwlmE23Hf3Gyc6d92QOr3+qM/Rj9JGtHXARRhweDGEmQ7UpTd6FPJO
 7Ji0Sc6udKu0o+FhS9hbBeMqU2MA3K+MGVHR4sfymhGFPvQuApZGgdf6KCqI+jFFKZuNaj3F8HQ
 c+uZzrGXK13Hw078cHtTwsr/+ljlOCvF3j+D1/Q5ZE27G/sJamkcJQx/Cl2UtIRKCeTxvnOCSey
 cBsC8Ly6WhzE5mPWJAg==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5720ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fcmBhDXz9gjiIA-sPNYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: oEkEvYFGDNurJIJXOuOqgB1a0z8eG8KJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX9zQkOa2mZU9R
 Dz0+KpsB+jCOsDIE2s0RKiTtcEtzAHlaAy0NPxVDmEvoO/tmSpe265rRXY1GmdWuXQejEB12OlM
 m0vRjcqx45yA92asRx4ozHMwdDVKxkI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119147-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 422C075AC72



On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>
>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>> When a set of consecutive PTEs map a naturally-aligned contiguous block
>> of memory, the CONT bit can be set on all entries in the group to allow
>> the hardware to combine them into a single TLB entry, improving TLB
>> utilization.
>>
>> The contiguous hint sizes per granule are:
>>
>>   Page Size | CONT PTE |  PMD  | CONT PMD
>>   ----------+----------+-------+---------
>>       4K    |   64K    |   2M  |   32M
>>      16K    |    2M    |  32M  |    1G
>>      64K    |    2M    | 512M  |   16G
> 
> My series to convert smmuv3 to the iommupt takes care of this and
> supports all the orders too. I'd rather we move forward with that then
> try to patch up this.
> 

Thanks for details, I have gone through your series. As this patch
targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
Apple DART, etc.), not just SMMUv3. I think there will still be value in
this patch for the other users.

>> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
>> provides a compile-time opt-out for hardware affected by SMMU errata
>> related to the contiguous bit.
> 
> I reviewed the errata and didn't find any related to contig that
> required disabling contig, the driver was OK with the ones I
> found.. Did you find something specific?
> 
>> On the unmapping side, the CONT bit is cleared from all PTEs in the
>> affected contiguous group before any individual entry is invalidated,
>> following the Break-Before-Make requirement of the architecture.
> 
> BBM means you make it non-present and flush, it doesn't mean you clear
> CONT, this is wrong..
> 
> Jason

You're right. The arm_lpae_cont_clear() step was introduced to support
partial unmaps of a contiguous group — clearing CONT first so that
individual entries could then be invalidated one by one. However, as
Daniel also pointed out, partial unmap of a contiguous group should not
be supported at all. Since v2 will enforce that an unmap must exactly
match the full aligned contiguous range, arm_lpae_cont_clear() is no
longer needed and will be removed. The unmap path will simply write
invalid entries for all PTEs in the contiguous group and issue a single
range TLB flush covering the entire range thereby following BBM.

Thanks,
Vijay

