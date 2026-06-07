Return-Path: <linux-arm-msm+bounces-111623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7q/G+bkJWohNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:38:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBB651B69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:38:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g4CVZ1tY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fh02D0AG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111623-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111623-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C976300103B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B70A317173;
	Sun,  7 Jun 2026 21:38:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1631D555
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:38:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868324; cv=none; b=ATb+hAs1Mvrby9rmcT0BX16rxpsaf8sF5Cyzvm6tBntVLjW9r/NTm8TxKJb0CMBd4G2Ma1k/25rhgm2+zSozEELMLktO8Ex/Y/FPztU/myzkSzCphyyJqnui9DCj0Vt/iaazzh9AsSDHi1OsrimUipWdI+tsJy7Y0ABUd6qLm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868324; c=relaxed/simple;
	bh=VAgBwjDSeNlnZ4qckfBu5Y1PBlob+5OYl4nU7oWlIok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZKYmKwS2Wk/QVOe3qwTqX03y07Gd68XLpKFEXm0rxVcMnbH3xliin024+KR1TVbPo2507t0YdGF3OFrxJ5vhtBnFbn2qg5AOsJ4r14LdBydvaRBL+7NRXRT2ojLkZI0yQmQIi7c6KKkmDu9NL6VWnZxp1iNV/naw+ugA+mL4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4CVZ1tY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh02D0AG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElJOb887879
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92I4yuoS22Z9HO3EyiCCTVSZ
	iS8+EKZGlOF800tslZs=; b=g4CVZ1tYnf18m/FzTun8nLzBWNZ8weQeE2NaPEIq
	F7ZUCjB7roM0/g7YcSURCGSxbZVUUeaOZ7SIY/knkn+7Fq3hiu4RVJH8PzWnTRcy
	Wja6yNcnIBDLE2dhJ7nCCOg8tWbwgwkeJQXm4B3rYK/49AmjqJ+Af4TnmV80gfM8
	+8ONUWSmeFeZrbZBRRRZGSBaVXLpoXVfzvIp37kIIEpXu/uYFpulfMnSUpLscSDM
	uvWRabQGM7R/TWt0kz8JRrGKaaYZTQ++iTpMasWy1I3SPh7FeEBruIiK6qZ25Jou
	fjVbnFXfdWnfUlESk0Btt7VlWPq3BTTjJIArA6moBnghug==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w57x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:38:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2414756e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868321; x=1781473121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92I4yuoS22Z9HO3EyiCCTVSZiS8+EKZGlOF800tslZs=;
        b=fh02D0AGrJyq1N68SnhKekMJprPOEEEq7b7rtHLA+idKa+EDs8X9riTIauMEbvqG+G
         wFvrEbgtbXCg/FK/dsxGG97VFDEsgwXn51HVop5Yj1Cwpq6rLyRRIoobPj4zsDh4Kaa0
         KV9V9kjxodKZjDsO3y25w9/fsTfAQ1fDkyqvEdsU0l2R+L+mgPtOdvJlhfKb57kop0fl
         ldKp80nO6KRLH9ITKPFpX9+JA8qzKy673dGYO2dBJckyAxNUAUpUMrgf+vncrsNw10IY
         3eIQyEirYsPL1/l+VZlwjZOpgVhXhwtPp7iPsDGkCTC8QiB0onqgsweBtMl0DiLK5DJH
         xWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868321; x=1781473121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92I4yuoS22Z9HO3EyiCCTVSZiS8+EKZGlOF800tslZs=;
        b=U/5FYPZ4oiByv508F/RgbHGG0bc7weE/dGJmPoRd5hUPLsEUnov3bVrMnd1bvbPZFZ
         RI51XjesGJuDL0cbbFVxHViGXW8pqkNTWVdoF4MccbH5A323iHor5sIgcnpUgRp6SCi1
         BoheAcUg3ZiTyLM4YmRyZsrl8ulk5Fq7/VMK4cKTN1X4kK8G3atvtR3CLWSYAw0xbEkW
         s8jDxujVUqzYGvOxLIvflbd8Pq1eUG48XPFs8850Lxl0tOgAvRnBjOJaU39AZBgakIQQ
         zRcvKkA85wcHRrpfvcVpGFJOXAhjitpRdX5LKSy1bZ7inwP6H+sCStB9R2rKnTedaVPG
         hx5w==
X-Forwarded-Encrypted: i=1; AFNElJ9/PB/yyYUj67xKAL9+F/BODyHG/0sh6L27vS95h9nS1DQsptK7ji1rnrZDqF7/0E+WM2sb69/riTBZpO3f@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkENKtJR9ceQ6LnvROFiOTBjLShe97IyjMCYeuXswp0E+XUeX
	wda9YvhzuDHFHAs1jlbhsqq9lLeWnBSHq1x+wNhzD8cq6Eypj5uPvtz4V0lL4ffy+5Y3mqpAxs+
	QYMhzOekCB13yQ7UGTI/F3nvnx6FsfxcrVXE4yzJeUSyGChozjwKcEKPO7uM+pzsj2sS4
X-Gm-Gg: Acq92OHoGR8n3kbwwOYRI4lqY0LgWAm6MnQX0PkTbUORn8FWnyC6RRHKaQwjLhjtjI9
	rkfcMBAKklWHT7D4c7LyqUI3HmXMDuZWQoglg9Nkj4Gf30Rb6cEzA/IT6K/bXx/pmBqlhqDJiz8
	UGB2wzQYapUUAxJyFjnjpJ+rvlvZy7iHmw6oajXcu1R+WMQlS5kbbpEpdv1XSgLfS5V2FrdL42d
	lhp4hYySfVLg7sbYg5O1oLGsZQqC92NQ9XGv/6PE8e3gHQhsiyRmG6XrEu6UuOMWur4L8313Th1
	sDgREO4GRcOp0Mdsv2rSqTd3kzhtHySAsW2/CkOg2NQsoOwB0lIhLD0ggmQhs/gwsqDwJfFNELm
	CpqcUoFH/83YA4uA2EAwoiFUj4AJySdWmmps+KaQUZvNQfqe8QGveel1SSLRIn2PGwYP+HLCXc7
	8kb+4/mDPb44XP8iS5SQLC3Bqy3VdbaTAf/FOQSBZTw7b/qg==
X-Received: by 2002:a05:6122:54a:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5ac5197b908mr5984184e0c.11.1780868321403;
        Sun, 07 Jun 2026 14:38:41 -0700 (PDT)
X-Received: by 2002:a05:6122:54a:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5ac5197b908mr5984169e0c.11.1780868320935;
        Sun, 07 Jun 2026 14:38:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm3299246e87.29.2026.06.07.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:38:39 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:38:36 +0300
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
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <7jqvyudwdngiln4mv5752qpv37zc7fu3donqrzzpjt4olug427@5lcbz27qzumu>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MW-9NF69PhIV_yo2Py3NpEmUEE5KS_Bz
X-Proofpoint-GUID: MW-9NF69PhIV_yo2Py3NpEmUEE5KS_Bz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX2OzSxltFODj/
 MSN0LAyxQ6PhPH5pdIVlmjceCN4vnBZ/iZPm9kHk4ajIPWd3MCfGLV7bnpO/l5xDyKCszsY2L3g
 51+z2jrpATUUal8cZsLJHHlMQNJd8cAGW8RZLgTL6VGivh47P92kGMaBHKWC2z+t0/zhsaSAcGT
 eRIx0yxSUwtqNamCiI0AkAAJGsRncPBYsr0zjn3B9Oz0XYMF5U193rSYxgwF22zj21/nbDAteEY
 00P3VHl/nCAHC04Fu19X1pVE2SgI0dt0h8h4g6LZoyW56S9E6HVRsjzMIptuo8Kw1q1X/mHFYaC
 r/v7eeXz2l6fpMEcQ2PewrZOfto+sjSGKhIpYN/2vjzcRmN4oP/8mXhVV+cBzBdHq8UYVxDVcRg
 WgHr0TvsOPuFYw1YYiKFGuto4fuRjYppZASjWgB95pDOynrhXJnkm9mHBCE5xjDpC7Di1PQVVgQ
 wauV2sluD73joy+l0Tw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e4e2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111623-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CFBB651B69

On Wed, Jun 03, 2026 at 07:48:43PM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> 
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> 
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
> the firmware function ID. This SID is specified via the iommu-map
> property in the device tree using the firmware function ID as the lookup
> key. A firmware device is created and mapped to this SID.
> 
> The presence of a SID mapped to the firmware device via iommu-map is
> used to detect whether a hypervisor is absent: when the firmware device
> has a SID mapped, Linux manages the IOMMU directly; when no SID is
> mapped, a hypervisor is assumed to be present and these steps are
> skipped.
> 
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> 
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
>  2 files changed, 67 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

