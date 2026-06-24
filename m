Return-Path: <linux-arm-msm+bounces-114411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qze8Fq0tPGoelAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:19:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F96C0FBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PfZ9dcVJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SHK0Io9X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A4F300458F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B91F3806D9;
	Wed, 24 Jun 2026 19:18:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9A377ED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:18:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328700; cv=none; b=HEHfRr0wpuuMyOWQ4r6TTxRzUYpmIM72g+3tKlf0PuYdaWGr3sEpd5NK+sQLUt7YXtOdrwfuCHCWOay1BJLAslEVmj6ILH/VwqBZ+vks75FjdKIlpIZl5O0uEEf8NkIGWSfSipOF2qTDEIMKbiveqcbh/ArSue8G6JYtgshAn9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328700; c=relaxed/simple;
	bh=bKGyagwGNYczgH+kSDgfBX8Erf7GoVV3fEN3v0ydR4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBsLzApCz8QEL/vRBlhGtGwKTfqWEw8TfadLtGYjlYt2Rz/MsaZEHyGRRONAzOdz3sZS9Ae6CBOzD1pgfy8FhG/3alGxqihq6JnFaXY1QMTzfVODnFSg0WJpV2qMOOZVrJwrhaoudHg+Ak6riSTTSu6hCtMY1MaeZdBrsrdhLmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfZ9dcVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHK0Io9X; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj9eR3861179
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udgVp90SDPGbIOBxVnWXY1WC
	LuwoS5DPJrSoPLrCVAk=; b=PfZ9dcVJORqePQBzW6lwOsScDqmLHXoFBPAABrVB
	bl8NOEwNJVPz9F9RRiSwOTATqeOzi3U4tl/NWmovo8tLZARr71QzD3Nvj247z/7B
	wUxopQM6lI441zU39Kh5/IbvZ4nbvjK89ycUV8zk43XBo/rCedhW2l/hJlpRX8kC
	xoJWddo8113178eb8tBHy/cRjseMUDJWkS5OrCgxO17s3qsMTuEVCXyHCOeUUOli
	CF+poZdKWpZHRdfL5Cm4weW22j9M0XkyMKZIThomhDyx7d4d/8nrSCQNyLt+Vlw9
	+cF+GD5Umoj/xlmvilnzAt8KiEMf9FoQSjzIYt83hKPyKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq2txv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:18:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so987758a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328696; x=1782933496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udgVp90SDPGbIOBxVnWXY1WCLuwoS5DPJrSoPLrCVAk=;
        b=SHK0Io9XLjYdL5Kk9VqRakXjygPLjrSV7xCn1jUHpUAUFL6UrrsqopctS+Ny8kewQN
         DS9pNrad+HE6yjC13Ldc5aC3sNjEr1lcud9YwMn+QbuanA3oRbV10s8EskO/nuX90Er5
         DIjLdYLi3BRj+X/5B7fM1gwTrmYTtxhh9kviZP13Au2KTAY8XeaoevhnZCQy96njDKot
         EPkUjjXM6D+mONJqJYi8Vnj6aNMfNavafUzPFzAlTeOd5nA4otsinzjVrMed5fJEKH9x
         oyh6s+4CVQkFIaaX0W5FCCFy1f79Oz4vdZRXpogundLK+JQsx4rYnslNXOwxFh4eEZ63
         m5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328696; x=1782933496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udgVp90SDPGbIOBxVnWXY1WCLuwoS5DPJrSoPLrCVAk=;
        b=kGZCrt+D2HkXR3Y8I67pRjHaQBHIplHXq0n67kM5iVC+EuinsJIgrFNLeUJYMgsP2w
         ZSZJvNqvYautJi2idDhF38me/Kd2Igts3mRNZVDa97lm+/kH2ArbfOAF9LqfUiG//xtm
         iSCB2utRYfseBAmqhTYAwEUlfaDUpPU4O8lp4rvv0KIY3/NFCaZvN8ch8SE5HVIBa9yD
         VXKO66S+9BvFbDarC7i8PrDki1gTs2yX3HNjPiy2wvqNkXlywATLj1dyNwlavmfn6iRZ
         xoOG3XBmc4Jx0uGaU40eU/ZhTniwEeW5978t5imEVinM0qZIcX5nGUIoYJlhlkGSYNif
         GN7g==
X-Forwarded-Encrypted: i=1; AHgh+RqrUd5AW8BYVG/3QWXjVvkIfSte1j8TJyoerobzraEGgYPmBWdz534NiJBSNuuPl0PmfiyQ1nLbZyZL8EDo@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWYkE1/qeKAMmcn1AgLR6kjAtlksOD7YLm8I4/+Jx5x3tyEB1
	NSBo3tfA38hluCYT7bwpqiSH+W4brKrcKYeUUt8s0P71w73LiLacVoIaC9Lu1f7mGIAt1h9Gygq
	2zK6EgbDjkCL7bsfqa2NnqNiifBKr7JL4Jr7X+iwiRFoR8+lWCZUrywYZOfAyLy/bR5Kr1QZEyF
	9i
X-Gm-Gg: AfdE7ckDqtBcZLPyf4msMzy/NauHfkkbH5E8Xa2UszB5b5p4llI5xKYLxE0ipwlhoUc
	9geBHM8LD2YdN6bV+oijkDMFBaGoje+UIuGwlbxD0rWUfAvlv1uMskZf56du9Q7S6cVaxW6LfJ8
	GX7cfiMj8qnpneDGmpZ8u1R9NRHDTYoXuKYeuExSqBdhZRqcdPgAyh7BGYikOHLWi62OeLvzVVL
	PBYGn5vNlceH8/f8MnNEFrsv9rM4qyR/rlbyYftQRXn7Z3Es9qabOfnDV5qXoLRS5TvLRZ8DI79
	byzncQbO4iQ+KO1j19/DeMtOKa6zVdSDTQ9jiyIBcZhTMaDJeVW+dxbU+4MvnkYOtRaQv/VWHmv
	3Ra1m+OFsrh1BRPe53Sk257CuNNAvHE6wmvJuaQ==
X-Received: by 2002:a05:6a00:b52:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-845a2793df0mr5859853b3a.21.1782328695809;
        Wed, 24 Jun 2026 12:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:b52:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-845a2793df0mr5859828b3a.21.1782328695233;
        Wed, 24 Jun 2026 12:18:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d272asm2893385b3a.34.2026.06.24.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:18:14 -0700 (PDT)
Date: Thu, 25 Jun 2026 00:48:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
Message-ID: <20260624191809.pkpppasztzrbnfhf@hu-mojha-hyd.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
 <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MSBTYWx0ZWRfX/HZr+ZpxY5KZ
 HYF12WHqPrzq2I1W0J50FkTegloANw+z4/kRhfJCUwaQyBOd3/OPonNtFb7RKiq2py8SCxytcYS
 JX3JT/6EfC0HU8yRj6b7+LTaH5HL5Cg=
X-Proofpoint-GUID: as5MYnFoNc16O2q9sHGIPY8ZczJrm7BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MSBTYWx0ZWRfX5OfxCl0ztLZV
 tCLcm0Jv1fVkbp8u2EGzWXPVke45M1ehn+ld3JN/42ukRLwaI977e0lY6ezab7TpAREHCUea8hP
 KQCLAEVmC31wRwNdkxlhn+2KBMAQOb3pByTHMKmW+lQI1NFaROdPFCLg7CiT8cUzyjSMrspPtpl
 m4YkRanyWUDKGI1Tb53grCS2U5kDka1GBRO82CapWAVkfe+eBMFo42KKYMQIzTNBECgUoL/SdUG
 uBckhvrwJCbL8ehZSh29XmNI0V+eS0f7/6iAM3hiaPcIipb9R9t+X40NHZuvMkiElpcOpL8i4dv
 nSWgmnlvbOxqg+TUzmG4x5CUFxwPIaaz5yU8OBJGy94KTTbkOntoNkYgRksqIx0rM8MbaS4lqo2
 dkj+2SNA5WJBm9i7bQK2EFwgIq46qg==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c2d78 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dwmHPF28QfX-zPQw6RQA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: as5MYnFoNc16O2q9sHGIPY8ZczJrm7BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-114411-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE1F96C0FBF

On Tue, Jun 23, 2026 at 06:08:08PM +0100, Robin Murphy wrote:
> On 23/06/2026 1:20 pm, Mukesh Ojha wrote:
> > to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> > corresponding context bank failed to probe or was already removed.
> > qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> > qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> > directly, risking a NULL pointer dereference.
> 
> But if there's no context bank, then how has a domain been allocated in
> order to permit io-pgtable operations that would eventually call into
> qcom_flush_ops at all? Can you please clarify whether you've actually
> observed a real-world issue here, and if so how?

You're right, I haven't observed a real crash here.
qcom_iommu_of_xlate already rejects any ASID whose ctxs[] slot is
NULL, so a domain can never be attached  and therefore
qcom_flush_ops can never be reached  with a NULL ctx.
I'll drop it.

-- 
-Mukesh Ojha

