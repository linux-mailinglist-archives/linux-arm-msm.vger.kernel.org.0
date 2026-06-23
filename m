Return-Path: <linux-arm-msm+bounces-114241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vjw6H9uuOmrHDggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03B6B88E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EIyIx9f0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IdhFvDnS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114241-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114241-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0684B3165D75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B4C30C15F;
	Tue, 23 Jun 2026 16:00:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302EA30ACE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230435; cv=none; b=UA9xsFn8yG5SRpmSsKxv9dwTvV7aFCrYCefDqQP7CyRTlxtIa77WKqzYV/MlG9B9h5X9srkPqcM71pmjWvCutpLac48LgCwRP5guabexRtmrPp3mJp6qwZ3juWGTITsw0bBMuX06PR4NIVxfvqeexXNs8446AkCjwkHzYBqVzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230435; c=relaxed/simple;
	bh=z2Vxd/2tM2532gtQ1Kzukk34nRBbD4l9UDtgLjNDRXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXCw6o4+5kQYXYifNSMx/Pnh2oMHDQm/2ixurci8FGfOeF8UC3IhLL4G1+IO0/syweZww6jej4Y6quMrJweRQ6Db63n7tE8bRNOui3nhSmukieli7ymUaOb3pKefZsQJ+eZF5qKuA832OpsgliffszeIL7bADP2kbqYu4iK+9GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIyIx9f0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdhFvDnS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXgOL3753484
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=; b=EIyIx9f0zBiXE/ft
	GvJtD5yz45oJ3KZ5VmYdMAfQqMW13fA3Pyyd1APY3fKsobzmnG7zh8k+1Nio20Hg
	IR0xNNCAvytNmFFeSqihmoPDkDPbaF/NrM0g9GbMbQtkuyiHplpyXecbo+fp/7no
	N5F1LLC20LsKLGkM/9rc1R6WGu4fZN4bcuqvL668lG9QA96cmxmi+wEMb+QGuhp8
	RtllTQ3H/N3A+G2KF7xYPnCZnVMZsxwOha3SpguietOBtTU66JxdRMti1xVQdfKf
	AHRHq6KK90t5MJUa43i0CcQi8zlgXmZBuGbxrox8ffDCE9ajtL2u+AtL+YyBd9+b
	Ru7dFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29j2y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:00:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso266896d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230430; x=1782835230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=;
        b=IdhFvDnSY2mziMg6ocTWp/p1TC7qGw0Yvu4/7p3hY5n6qAE0ZAihU8foGR6PVZkr+m
         aS/phgyFfNeVMy6MZDeFmlp7phM1ktltNBo+3mk6/PB1wsVZeYOdGgXsY1WS41r3O1kT
         Y8vtSpXrFv28re2FaTu8WSgMf5zNHzQtHUo+KOodQ2F7LFgouGMPkm4LFXpIs0iF1Rfu
         HL+8g5OM5T59jTqC17iElSjHgCn41s75Kx2v8K2DOzew6X0CxHt5N/TbQKMNC6mnaEfZ
         u//w4HO4LIdmxpI79UyZaIaDMvQFU3s3hvJ/n8F0DujaGA3E7PwGrSI4tKzABiZlEuQW
         Bd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230430; x=1782835230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=;
        b=XWwGUxd4VtKZ9eZ69uw4Xw8kBsZuRGh1TDIcQuz9Ty8xHXs3aLzxkH9jfFI+ghzVZH
         wwfkaYQiUy4uAhvzsLSDGEK2PAFu+bNFMGgqr6cw2RYdclinZZIJx+xg4K4gb8JPJ67w
         24iopd5ASbWOvEUIqhvQg621tzAN7MN8h48m/TmNgVrXDIwGP4mLIQWYZ7Vfd7QN3/mx
         wpfrBrdP/AdXwtsnKWohKzChvTwMA5Wv5eMPLgcrwrjmNdMHV+hfEsINOgpb6QDOX5he
         z4q7qRaKvto+tV4B+QE7zKdJQFW4GzRX4dQc2dJbJu19YaboCB6p9ZMKngBqnDzu68Gd
         BVHg==
X-Forwarded-Encrypted: i=1; AFNElJ9a85qcBb+jXildnr+LdUSGMLB93iokwjcuVvDVlRv1Cy4Sn5BSIEUxx7/Umr7i6w9nTpwJ/Aus++vcKi5S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bOFJbwl2a/q2dg9XqWqK8Otzb37wYlVG28GcGUB+S9LoNxES
	lpP35aZLeIZkTsJFF0V7ioiP49gHC/IubMleYMzJklhyAAbKIba3F4pVRPk9vsGhaCPw+PDPUtF
	Sat7j87fHKURhsMWlj9IvmnHXUWE8IxQ+dCbNThzfcJw2WHVxUARbdjC3QlxBU8gu/yUT
X-Gm-Gg: AfdE7ckUgqMqvtjDWxFwTp40nDuKiiHHkqF6OspRMdy11q2B7VFRkrRV+nIIIRbu+ZU
	e7a+eBMRKblXy1umBRkH3NllqlEbixEPVAfd4n6QBB8ffIgG1UmsK5jUXJmrRdafqJfSOXefYtZ
	agm7twe+A+WtRCPhVPuuF38uUarMJ8bTQu5WRKA9GKsTjNlq7ZETIZ8dGn+euVpN3uf33jKvsKr
	vZZL4x+bNGB52ZnE9oCk/bOIB9kvE9vl2POUkvWH+Mv74B62+aHhOqcs3kOflkmHeihsCvfMhsp
	o1tQ2fCIgKrvDQ2Hfc1nt2y6sv7D49BoC43yG2yhgow8o1ua2LCHnl4A1MEEX3F2g8qCIdcDrPd
	IWA43MqoXBEJbAAyYgsP31HYLa3zzR8XYUKE=
X-Received: by 2002:a05:622a:1a85:b0:517:6a56:accf with SMTP id d75a77b69052e-51a4f417e62mr59007211cf.1.1782230429972;
        Tue, 23 Jun 2026 09:00:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:517:6a56:accf with SMTP id d75a77b69052e-51a4f417e62mr59002911cf.1.1782230426876;
        Tue, 23 Jun 2026 09:00:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm540916766b.36.2026.06.23.09.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:00:26 -0700 (PDT)
Message-ID: <d334e36b-5857-4d2f-b493-08f48398c02c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] iommu/qcom: Fix inverted fault report check in
 qcom_iommu_fault()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3aad9f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yRyykpyyrqY15ofKUHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: iQ7khfiZbU5kGNZ8FsNY89Y4WqSaXarH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX8qp9UxxPyuBD
 tD8v4P5RNTU43tzSf8PguFzgHZlok1DRk8FJ8RKg3Z22s55D2u6HeQEgxORsJifsNthk2qurRdP
 /6/uMPqNzZnjM6FoLdVKoeha69axOO4=
X-Proofpoint-ORIG-GUID: iQ7khfiZbU5kGNZ8FsNY89Y4WqSaXarH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX3+vfRlmjDhcn
 et9nYpHkJaCE04lLFWX8ktzTI90RleHiDUtBwF1J3gYA7RQY7ZHin4xkuyIZI1gyn9J68R/+QAy
 erL/OnIud7U4z4fjXVkclMsow1hoGnjxcqUl41JKKLlLoucvlyHUU3lTtpMAzYwNnofPIiEkvpu
 Yr4c8opPFjgACSPZ7cuN9prB/Q5W9WyzahFeEZNGVg+oVTZTrzgfQM1CytGbsZ2XOJKVqYL/gAa
 nQDMtmTDpRX5lJIvw0K/91sBDC7w8V2QATjbFzKOotaLZIQz7OHJZHpBEhLzsvHQS9CQNDNGUkN
 DoTTIBbvzqbui9455kmUSazbJ+uLhPCU9Z+7wkUguDNlGylmT2eGgasqgBweLHDQA1JuUBHEXI+
 h2WL0dqa09j/a/tiuY8pCYj639jL1oXb632IFUhNrk7YqtanXG4B9z7p/ZnM6zYYJ9G123co/YE
 Y8zpO5n9329+RCXgo7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230131
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
	TAGGED_FROM(0.00)[bounces-114241-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD03B6B88E8

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> report_iommu_fault() returns 0 when a fault handler successfully handles
> the fault, and -ENOSYS when no handler is installed. The condition
> '!report_iommu_fault()' evaluates to true (printing "Unhandled context
> fault") precisely when the fault *was* handled, and stays silent when no
> handler is present — the opposite of what is intended.
> 
> Remove the '!' so the driver logs unhandled faults correctly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 32efef69e72d..09f2ee6be988 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -200,7 +200,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
>  	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
>  	iova = iommu_readq(ctx, ARM_SMMU_CB_FAR);
>  
> -	if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
> +	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {

Absolutely hilarious

Fixes: 049541e178d5 ("iommu: qcom: wire up fault handler")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  		dev_err_ratelimited(ctx->dev,
>  				    "Unhandled context fault: fsr=0x%x, "
>  				    "iova=0x%016llx, fsynr=0x%x, cb=%d\n",

