Return-Path: <linux-arm-msm+bounces-111624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jXBLJ/bmJWqRNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03605651BC0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ieHjw2JL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ki7SDl+W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD96300DF68
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD3030C154;
	Sun,  7 Jun 2026 21:47:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC94071F5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:47:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868847; cv=none; b=iKhFJGblGWYbwhVSdxA8J3aTMW/CklZDxHrnqyp3L4LSg+y48dUbrqtoYssdUtqB71QMGzE6SndOZLdNkcHIstXLLJw7mOwnvIYVCE8ZNu99T7GZu4IvHwktzallVkHP+X+Nq1gpKkyW+cRdTzrvpdmEzRcWKyJD3BE548+OCeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868847; c=relaxed/simple;
	bh=o8gh3GBhsqBBq+L5KMKWxrXgCRkn6VkVN4YlzVqZycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nft4omjUS3FS6+FF8c2WeT+SuLJ5gt3/ImhbKO/vPsZbPMtPLif/+6M9znRtaIgcNYp/v8nbkjmsJRqavsOZQerB1QeeYXzH7Wl0F58W7ZsLKg/jeFmLUDuxRe0RorERhcNPi3sLZvNglibmkPgvOYsQO8x5jxc6bnSA4HRz4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieHjw2JL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki7SDl+W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El5rG887472
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=51lBbpCYJCXT+JKNHVZsiJOe
	yNd6G5pwkWCrK7BFzFg=; b=ieHjw2JLCF7b2hmy7afqVeegZ8cLsKdSOQiTLBCd
	F0thDaa7HptpA4xF/pWHXIwwIkfyM1PgsHZ0LKX9d4BpeRf/i0KZ6JN/InLS//04
	LeGuET1Uez59k1BQQ8naj5WJKqxnv/UYP7GERUGftsPPR+1fT9yhpoZ8uKTk1p5I
	wvYLR5Wrj3/w0o6URJ6yn7wwQK+rU9ajS3cIZzXMwXYmeIjLmxF7rOWmQOGFQUWV
	FU3TiSggsATXc6dq0VhWpYe3JMfXCxEyLQk3JEymPkBMHXnX/Y2nHZNvK48VkK8J
	duCyP0fM7sQ3Abxi8gb0tO4pzxMfDXFwLobxZDnHwjfZ7g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w5nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:47:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59f18de8482so5441099e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868844; x=1781473644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51lBbpCYJCXT+JKNHVZsiJOeyNd6G5pwkWCrK7BFzFg=;
        b=Ki7SDl+WY9MMXq8Okh82O/AsHwRM6wAxSA6uYQ7PkhOAYSTNKoXDD8wjHnSHDNiiX8
         nmlYRBWG/wNJaLxhE/Im35gNhRBbrltckv0HzFHF/5n1zJY/mTAMz5b+IrRFjWEc+gpr
         XjGiH/ouVFCCJ9k2gGh10u2ng1TM1JOuC4EdxUjgdhiFchZIx/rjcJU0ckjGa87pLReE
         wVK6BezoUBSBc/TMreHunHh9oJJINd7wPQLGmljhmxc7QgiA/c1EIThiURtIVeoPABiw
         F+/ei+1qhKPLfdbcSX5R7mrdyodD8FXpvW6QDvIpcLYT8x4p7Xzd/LUPBUeqZXN3+B1Z
         fLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868844; x=1781473644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51lBbpCYJCXT+JKNHVZsiJOeyNd6G5pwkWCrK7BFzFg=;
        b=lVZlsA7yI9xq2qXiqpiKVTH0bypG3q/dxht7nWrqfrO+m7s82fOwGOu9CT9JQyJvG3
         Z/2W+hh4l1kPRAwY/cLvSbPXGV6GJCbrXyXq4kALbPsRx3YRN6Zda0Up7m0ps6bHqZFV
         EonkYKCKKRva/m9DD7wlutrkzjUqlN9Qotu4iQJ2xtclx8d+s60jfmgJtTRrE07z8rd4
         w/HUP2euOpitdBaqPs+/RbKSMoFqIxOh3Y2JD3gBlSnnLlYByPns8SbUkRkwME+Xrjji
         S1fSR+RS86y0lzR3WVxpyAdxOAmNHSxqANHM2uwRfmPJSljSLCSmxR/Pwq+AEhsUSWXP
         yLmw==
X-Forwarded-Encrypted: i=1; AFNElJ85lPTU+YFQU4IqLwkxxpjfxhQ5FfjtbvIewzrM9fbAFPFV3rIKDxmKRUXvJHIVQ1ED17JcF8wt2dqdl7Jh@vger.kernel.org
X-Gm-Message-State: AOJu0YxjiW/ZMUCvliGvakFcH6Q00+bqSEcUHnkCbeb7+1n/FknjrnIM
	VXN5wIzsx84TU2mD5UIqzwqJd4dq3EccERCjvPNLPbajJYZ89bVXa/GzQ1i1mNqMFw/Wt4HLy97
	P2GsFniTOx3Mlbt3Tj+9d1FkeshZqRlX1eUOdTQPHBU5EyqP6PvgHlucKMvPRBdG62eJ0
X-Gm-Gg: Acq92OHwFkVHHjItUjzV7lTRxGsQC8IgpQT6UL5d3zVoyglBFg8GW5zmGKfQ+k10Lhs
	fPt5qjXGpCGInxWi4rvUbMPYbE92Bo1RFDBo7M/z0wYmEPOddaPEKPp6GSeJ5eDfggDbNKnj1I6
	StgASxr0vK20TWxF/Lsxd4wgdojUuNNKgXkOfMZTrnUkeICFiD3aSb0eGvkFRgfHWxhoFVhTWk2
	CtZyidv7ZetIhHNQYz5JSJgiHjjIvEHXKtZbDJyyDNMkF7bMyFNMUPWF2M6uu9BnCGtoxNL67Ub
	pb0u85sWRR+pvnWQZ9Lqivd0exvAh734hQ7tGS6sm7Ypbg0opzKbT0gedXaVWA7JpWc8eUDKgDY
	ROsPSfdFq5ezpv0qQoiwwiIPWeiaJAsFpMXlOVZuHZ2Rb3X3FTKVFwIrq+buqH9no8ToJ5TNI5L
	hCugnebDtLxpwq/N7gH37W64LqkMWHZnzS5J5bwTbD9ul0GQ==
X-Received: by 2002:a05:6122:3d12:b0:588:2fc:f169 with SMTP id 71dfb90a1353d-5ac53c970c2mr6805014e0c.13.1780868843843;
        Sun, 07 Jun 2026 14:47:23 -0700 (PDT)
X-Received: by 2002:a05:6122:3d12:b0:588:2fc:f169 with SMTP id 71dfb90a1353d-5ac53c970c2mr6805004e0c.13.1780868843454;
        Sun, 07 Jun 2026 14:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed659sm3341110e87.12.2026.06.07.14.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:47:22 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:47:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
Message-ID: <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JJPPw9XoACPT86s2SS8r6q5dR4uR2as4
X-Proofpoint-GUID: JJPPw9XoACPT86s2SS8r6q5dR4uR2as4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfXzvqksJ/izFO+
 +mbTsAs56k2iKwYqFXAf42pXrbLqwEfs+fcmqulgbn0FlPLQvIc8rH426dOlwVH2FxDWvfohmkt
 lKeCD0i4kTzSKuAJPdgzjz2TMcJrrFNSHUcIPTzUysZXJiM8zfQOzNwO9sXP+tDQLDU6DeKClr4
 V617LaR/T/dxCVF+CwlOxmMtizPa99u97YYEZ9eHKUxrizz45bgUeHMIT/ACg8+ZDGhFHbL+8W7
 fhzfS5etL3WClLguBtQJwQKs3P4zORv1MseLzu0qhrE60470QU1I+Eg8HlzaoczPQ0f1u8nncZA
 EXv1cz05R1hqsarcZfvMA9aA6fYbG44HMXr1QtPNaKImx//5mrf/dpgWWq4dgo8FBqRbuZSPeOx
 B0Z1NJiV950LWAsxjXPWK3Yq6Zw11Gt91w8iXsosRgdS5+8akm18DgGeWbxtkj0y2+t17PnZcGA
 hYuh9VMIY9IYt4kolvw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e6ec cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=xfsqrxKm7_4DSI4w90sA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111624-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zsiafc57gaco:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2001:14ba:a073:af00:264b:feff:fe8b:be8a:received,209.85.221.199:received,205.220.180.131:received];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03605651BC0

On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
> Glymur platform has two video codec cores: vcodec0 and vcodec1.
> 
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> 
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> 
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  3 files changed, 117 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 7cda94601555..f07eaf4b3be2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -17,14 +17,14 @@
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>  
> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>  {
>  	u32 value, pwr_status;
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> +	pwr_status = value & pwr_status_bit;
>  
> -	return pwr_status ? false : true;
> +	return !pwr_status;
>  }
>  
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	u32 reg_val = 0, value, i;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	u32 count = 0;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  	iris_vpu33_power_off_hardware(core);
>  }
>  
> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
> +{
> +	u32 value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core,
> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
> +					 value & DMA_NOC_IDLE, 2000, 20000);

Unreadable. Extract register addresses to separate variables.

> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
> +}
> +
> +static void iris_vpu36_power_off_hw(struct iris_core *core)
> +{
> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);

Can we trust the patch authors that VPU3.6 hardware data will have at
least 1 core?

> +	int i;
> +
> +	for (i = 0; i < num_cores; i++)
> +		iris_vpu36_power_off_vcodec(core, i);
> +}
> +
>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)

Lowercase hex.

>  #define REQ_POWER_DOWN_PREP			BIT(0)
> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>  

-- 
With best wishes
Dmitry

