Return-Path: <linux-arm-msm+bounces-114137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfm5Hu9UOmox6QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:42:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9D6B5E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZzAbhvDD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jp0+VnBR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AFBC3018D4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6DD3C73CC;
	Tue, 23 Jun 2026 09:40:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602D3659EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207650; cv=none; b=CP5UBsMKHtnAQi7XDS7k8noDMc5SeqFAibWhHykFFVeE1nfbLAr8+NrrNoqy4yEyKTTvb3cLIMwQul93upj8qprcmrT8PXCyfm6aR4FtTdlgVleOtjKt3hpdwlLs6VB/VSnseeaHrY2OFdi9CmdDWsxEkPD+3Nzu0C/ZBxyICNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207650; c=relaxed/simple;
	bh=qH1RtQSTtC9cVkZCKM8WfDRkPAnefyPwpUkl1sSLI0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CybIbFRGER2QTPyAy0N0CcLObgN58Eop3EIgi+UXPpx/OAdiarbW/Qga4lNuCTaIXPCYxCaLQlHlaTru3kvmVNtKEIwIpKbvr4IEdx2lqUlCctj86Q5l53rFmoE5iVhT8ODkEJIpCZdUmaVHtlEbbt2IByK7GqNix5g4M72Bndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzAbhvDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp0+VnBR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7j9F41778180
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=; b=ZzAbhvDDccuFi/+2
	G8ra3h5Rp6kuV0uTKNZdVvEhr7poxkoAywa5zOs5yCLHeemKvwUsvb6YVzg36JMY
	6JzLgXh5OMAMXYdoLY0e7dvxRTATzvc63NyPGXjCu6F5lbD8AtcLgVfX4Ix9sGb1
	6L45/suxTGAw36tNBR9CV1Ihx//I+t8btlOumIV4xIMICdKEV2WO7TvYlVD2ega2
	nc1zUOnveSTfhHKfDao/gpn4K2AHi4PRvGNPg279f0FfD+cucHBUAy0E45xbxsa7
	/Q8f3T9s1tnLgoZ5VVAR1di/Ey2qT3AcYWrLedl9FUB4s6cqCWDDvP75XzIN9TBz
	sHNAnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grfvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:40:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-920f826bcb4so57640785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207643; x=1782812443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=;
        b=Jp0+VnBRV8JABMNYSV5iUz1Tn2r5IXjuOvA7mgs2OgYzbqNY/cakEeaLrBzhiH45Z1
         cqjftq2ZI24wBRSrDZf98HKbMkrUbwHZN1Z/4ugm3lwD0fAIApdwQM6UuIT4CbY4KBge
         /XBX/e1Mm02I7HMB/ph7zy8KjfXgnwsE5rEMPY9HHtwa0Xq/aSo9ikjHasXlVXtC+C3Z
         SQJW/05sec4WDZQv82jC00d4w02yFXxrnhbtPGgd/KINJ6iE99xEahmPeeHw2gufMy03
         IFPNMhnQxCBErg17geD7/pW2W+j5DwIh+tM8VDxXG29naRp0YAp4WWuFDRM7qKte8Cgc
         t3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207643; x=1782812443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=;
        b=IsITOsqOgOJtCZTKpcXJ7KkbswiBqPQYjgwGEKRE91h+ohSRG4xT+YQ9ukY09wCA5P
         hX1KbhuVYPnxsPdWePWEpWyVIeuk58zPfZC0QkqJmZs8sEm8LVztXgFVVPFDHX1H1RnY
         douOdOaucYadbu271cfSWet5daj3sO01+4psd3ykDRBnyQLalD+H/ejZ5Y9mj7zoIqwD
         pmxvM/B6pUxvybqKCDqPsxlj0yWx3ac1YLT7gXMYyXn1WWLTA4qU9Wvxe0f4wAeDgkre
         rJ2lhzCOKdNXEXmFO/JuvW81jkeCTWkwYm7599gYRRJrBJZC/Sq9FuX5wiQsyBABEy7t
         ltVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pxXl8DVibR5OEE/p1nwwIeR7yjYDAJuj6o6Y3wPEvTO5Nnhx7zrvKbjWZXqXjny37J0AUSt/PY0WVyV4s@vger.kernel.org
X-Gm-Message-State: AOJu0YyWuWVRhjY5QoA3ERt5OSHYndVD/l0h8+ecKSlyLls06I3YhqV9
	um9dlMhWznOa0PV934oI4f9oMV+kjWwB96f7iqf6dagOlowZeFhuv4N4jt5bbV65ZEXUlteCsFq
	nSdxMfHV+Dg//ZHDNjKs/GYl/mvcBEI3Fa4N+sh50oWVZ+ddzf4OR6vpy85sZND/RtvVI
X-Gm-Gg: AfdE7cnVquhSJO+qdvZjYdX/9/6ewEjeKjZvsAZDSXS1UFcEgGi4ZRCBgW7V1tY47SR
	B/0xwGDfldBbYNyTK2SkrXgA/twil/zQQ/kJPBFvMSrNJj48XzrUv6oyViRa0jW4ON8rFZgulP1
	yMxa/IO6C+XiNiAMM7O583iPPqry24woqQnaPYProgDdBEXSsA+TGZIdMIOxiNAiFU3B2DG/mpQ
	7iRolV5uY+2hGMcI4I+rroIAxgYGRXUMJ4bacDiZWgdIRq+nn26o28eW50GXpJ1q/AG5R/KzHat
	lT2V9AM3hslXn0vpeF3fGduVw0O6jpvw2GIE/hg0HTZs/m4B5bZTWCtrFw3i/bwK0B3rZCHg/5L
	KgZsA+ItOpLNVxzu9c5Tuanv5mLZvaYCeO7U=
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr411569385a.8.1782207642736;
        Tue, 23 Jun 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr411567385a.8.1782207642232;
        Tue, 23 Jun 2026 02:40:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm492261366b.53.2026.06.23.02.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:40:41 -0700 (PDT)
Message-ID: <4b60bb58-bc08-4bbf-be6f-d447050af479@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
To: Haoxiang Li <haoxiang_li2024@163.com>, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        jroedel@suse.de
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260623071245.1985938-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071245.1985938-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a549b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=cLxE6WtmSDgmiAOwmGUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4KqppGTinfTWZ_RZmSeGcGFhelmboTKV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfXxHcqwHvx5CiF
 DTXaEZoicN74Upkfd+wMg+Wk+wkIKM3hV8BrjyD3yvl+9GPxm+a8CA/XpEMBnaTFh0vPMDrrlfs
 V3e0zVT1NmVpbQtjkQx7ys/0ppbBq9A=
X-Proofpoint-ORIG-GUID: 4KqppGTinfTWZ_RZmSeGcGFhelmboTKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX/alv9R/o/qwu
 Z3GPgf8KWiy+YdKBBf6W09SpPp6hX01CnB/AdeLdqwrsWM9vsiWOTL2ozjQUGNK926II7S1NsYe
 ey9+Ns9tYL8XGYC11ZGQR7TJvnE/PkXSh6htxGxlfM2REbHy5UFVnrd6ooeXl39/+vbnT05bSJy
 6C3mCmlaqgjYKUCePrdBiKQF9mY27zum+FotA3L11ZwWwz2k20eL/9VmQch8WpuMvx2Rr97bjvs
 rihJ8GpGE0xwRg6yab59HKVku/sqQx45F5SewSscxJPsy5kn4wIHzRm3B+u3Oiuy/NlNLpXL/PY
 Mr5fNEEHQubLEHqf1yronybrVCX96HfCHqgKOFl5tAyoNtvOToAqRNHaAaOY/zphuo3CL8zGIRa
 a8ffpto8mZ9Z3YWrOkJHJozoRJnQ4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haoxiang_li2024@163.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:jroedel@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[163.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5B9D6B5E16

On 6/23/26 9:12 AM, Haoxiang Li wrote:
> In qcom_iommu_device_probe(), if iommu_device_register()
> fails, the sysfs device created by iommu_device_sysfs_add()
> is not released. Add a goto label to do the cleanup.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


