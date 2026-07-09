Return-Path: <linux-arm-msm+bounces-117871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id erwBIqhJT2pYdgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC472D7A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:11:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="L1M+9o1/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mv4AuHuh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117871-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117871-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FC933017B97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3770E3DB315;
	Thu,  9 Jul 2026 07:11:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19DB3C0A19
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:11:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581093; cv=none; b=tATmj7Ybx8NEdefDnCKrMo4tNFgnDjWIz9ieZMSlh7jBTgb+G8Xtenm1NK/w03C8Pa0/t5VGDszEbgUwDhX4R/ap9WpJXyqtLJTHIz/gIjQ6Be4OWWbqBQVlpAUljdzvIdKTblybMIlY4nVc8a1daihRLfBfTbPOwEq0aP74VMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581093; c=relaxed/simple;
	bh=k4WjHrGP5hzSBCqFQquQk07WAE8+kvvugs3y2kg2Sx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3GGS2btRKz+TOyWqrP7YQPZh8B4hW+x7FK6HUIU/t6nU4QJa3cRgynhnEMdP3l/O2miCSkJts8p9ob7K5vpj4R0WMwKis4wuSn79h8O0Q6/t7Ccf6d+thD/nybUzdiO4Q7DrXJe0L4kNalySgBhusIpQKmx+YU210FagHXiDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1M+9o1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv4AuHuh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669608f0712373
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1WlJwgzk7BqfXsYW+BUZ91gU
	claN3oR2tWQMtMO540M=; b=L1M+9o1/qy9yaBW1VxShfpa8f0wdHboR/aCx+LBA
	C1zZ53Ej2Fy/9eBiZhJbkqMJB8HAZ+vt5C+azj0QTltAGx9jUoaNkZZkdY97aNzw
	URTPapkeN1wy5d5v6Blxy4bC+B4IL1I7DwBapsZ++JaFGm6yf9XJtlB0MkYJUtaw
	0YSdEHj0H2b2gJEKMUUUblB8yvY152n27nd/SZcVzkACofem5WktE6c2xmjKR7o2
	qDNid2dnig0aQ08VDHgOaH5xnIvDgdSBxXgbL/aPsw07L0twWL652HAPseEIKXot
	WxGFSsNynYPM49nkJEuoYUKQ1G0hp6UbK7gxFhjL6/AOIQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgf7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:11:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1425367a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581090; x=1784185890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WlJwgzk7BqfXsYW+BUZ91gUclaN3oR2tWQMtMO540M=;
        b=Mv4AuHuhFtPkZVG/h8+HG8uW6jNWw4iMvI6VJil4PAhuahTyD2iqv3Xk4V/k2dROUO
         JoxORzAttK08PIP0TPMuLEP60ixYxTKw9zSj9YfZuqqN6FH2v1wxCVqjfwjQYd8sYmjr
         UTwOqFDx2YCXRW6YOJrgdeq/CIYxjES5eWSDcmKOsGUAl1XFN7vuoPcamf3IGtPevdWk
         fUFkJEgdLchIbXLwykVdnawDcEcXVh9dy6VPqDxEuV/NwVQh7OaOZRctKRAGd6PAugjS
         c2i6pno02w597NgRlX6+LEv1tqX/X58PulRQDGX3VyMrSj9mBgPO6oJnGKylSLrft2Mf
         UT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581090; x=1784185890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WlJwgzk7BqfXsYW+BUZ91gUclaN3oR2tWQMtMO540M=;
        b=faO+uMrdvV/7pW98jg6uJlZTZ19A5E5FG1WWPMJ+D+tydzP0EiAkMs12hwhiQ5lYQJ
         odo+0hQ2wsjPUFaG93uyh5HaHPVQGGLx5ltL6JeskJSquXB1arbws34o0/Eo11NIv5+G
         OTAXTNfYwjwj53UoSiMBGAqSjH2lrHDvokMdGaSn2VJ3UBOW9dEb8wsKugbw34Orn3tR
         ZdryTTI7/vI3SFlgCdq2UIDd0/3yZFgkY+PKh9nnbfDPQL6dTAcJOUstTHuhSZWihZO5
         sGIoibNr4a7RpHqvbVpZFKxvvuSMU877IPHEnlYoVo2R+mUCaNxYnFUG3gfPB5vh87ka
         kVeg==
X-Forwarded-Encrypted: i=1; AHgh+RrpmD4TM+n7HELmkvEGC8SC2vzwLYYUaJtiI7/JWOqqQLPvihkEmfeXkvmOlnb7nT5W6+isEoNT+dxBVwkH@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsciM0IMEoA6JFvy/ayqQs21xpT3AKtr82gPCv7/f6u2q9WQj
	M7Qbtg9cAVDJL72F909GJtQweEQ+ll9MO2EQmrSCCg8Rve/agfBZuvB1yJBcmt2b4W+djnqVGZF
	EWVbuhG5qJRgvXXaI+CtRSY3mbg6JrnogdzvDSfJgZN31skv0IMGOkqrpPQFYu7patKZa
X-Gm-Gg: AfdE7clKqUBoiHKZCm/mhbkn2XDQfxRqSdockBDOqr4HB5ybPFLJ88cCzB7AGdTiFvU
	mps1V06MT4o4GcMV+gaF9DnnXzya0zuC4uPw2x6N+UgK2LHXT0WoiX8nMIunfB8i30x8deSzhYz
	79dGHmThWj9paMvLUpVwhqKaS9425jXBizYTml0kleWZkcVEhUS7fChU9ki2hELe5CV7gT94Wfi
	p2jjJNd9EWrgybKwdrgMUwlD4cu+R6wc1OEKA77oBJ/HXB6iic21ZiuZ8bgAIPfwBfgEq9n/WCx
	xanF5AFeX4OHIgcSHto/DsZH7KlENH6h03EmRoK3Wz/PReJ9/2OrGy7OVg5Ghh5elaorh9aJs8s
	TRgJs8sQVpbgyiQU24mhw/Xr112lxUruIoG7U2Q==
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr6790947637.53.1783581089547;
        Thu, 09 Jul 2026 00:11:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr6790903637.53.1783581088972;
        Thu, 09 Jul 2026 00:11:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm44052133c88.14.2026.07.09.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:11:28 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:41:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Message-ID: <20260709071121.uhk5jx4lpfgi6mzn@hu-mojha-hyd.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfXx9CqYNIFbvtS
 sSxQAOXuvarq+Ke45OvrJ9662Q6ixpZ5EmScqNVSsfaUhH2Pm0n7AgEiYN7atTDt5eIgneG2aPA
 RObcJw0v7Y8LI3j89t9bqY4XbXflR7qtu13jDhxzzvRNJuXUJetyYBXQoPFLDaX7oB5nWNWpbXh
 rnIUwJvx42AWFq32l6+IiW1UrR05wQ23/VvENadFzQDAfXIbXXSQqRmU3rDPa/kcJjCeO04jjX5
 OqGXUusf4Cvh4VSNTilqYaM8uMW0Hp8fU/BPMqSBRvTzcr68GwCvtrM/iPccgjRnWbKCjk18MlF
 kwZUs7u/nkOJuf/lUQpX4FX/KN1AyxRE1sQbj2/N3UgjH3xGIJlfaGO5C2afCrwmw8vORt1tb41
 vQ6iMkwQGculqqqqUUKyfgVlNiTGN1GrcqvBMChhEiI1cCBKupQmbENlTH41Z0RY2ypiqqSmAwa
 SkV12a69c4VuCzhrztg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f49a3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jZQ5m3JRttz7OcbpC_4A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX668BPlvByy5l
 90Ai0OPNpMVKUP/Q60JehuUcxvAhNlilc2xmYM9XHVtNYbGlD5L7LQ9XIMsJhmBHFMyaoolksgU
 j/8H+QMEyAY8EeXqsx5qRI3MeXq/CIg=
X-Proofpoint-ORIG-GUID: oDnqz8A568zOJnD9vy7tmEW9e0yT7d4z
X-Proofpoint-GUID: oDnqz8A568zOJnD9vy7tmEW9e0yT7d4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-117871-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ananthu.cv@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ECC472D7A6

On Tue, Jul 07, 2026 at 03:12:44AM -0700, Ananthu C V wrote:
> SHM bridge creation is required to enable memory protection for both
> remoteproc metadata and its memory region on Qualcomm SoCs running
> non-Gunyah based Hypervisors. We currently rely on the iommu property
> being present in the remoteproc nodes to detect this.
> 
> However, this doesn't cover for cases where the remoteproc does a late
> attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
> Management Sub-system) that doesn't have an iommu in front of it. In the
> former case, any attempt to create new mappings would fail with EEXIST
> as they are already setup by the bootloader when the SoCCP is brought
> out of reset, and unmapping them to create fresh mappings leads to faults
> since SoCCP could have active transactions on the bus. In the latter case,
> absence of iommu will be caught by the has_iommu flag, and SHM bridge
> creation will be skipped.
> 
> Fix this by introducing a needs_tzmem flag which would cover for the
> above edge cases by serving as an alternate trigger to the PAS helpers
> to ensure that SHM bridge is established.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 60a4337d9e51..cd7273fbcf98 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -61,6 +61,7 @@ struct qcom_pas_data {
>  	bool region_assign_shared;
>  	int region_assign_vmid;
>  	bool early_boot;
> +	bool needs_tzmem;
>  };
>  
>  struct qcom_pas {
> @@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		goto remove_ssr_sysmon;
>  	}
>  
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> +	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>  
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
> @@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
>  	.early_boot = true,
>  };
>  
> +static const struct qcom_pas_data glymur_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
>  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> 


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

