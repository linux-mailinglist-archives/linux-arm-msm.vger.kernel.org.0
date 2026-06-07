Return-Path: <linux-arm-msm+bounces-111625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wAJ/FT7nJWqpNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:48:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9712651BD7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:48:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o31dCwrl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LBZnyaA2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9911300D943
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0A32D8DC2;
	Sun,  7 Jun 2026 21:48:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696B2475E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868919; cv=none; b=JxOQwW9+Mq8zCbr4xRMXJuWbPerohuh02IWnlt4Rt8zHccx2lgKirySq71qL4FuO/q4xRRsg22kcUHQHlbZDKXzvJBOZRgkLGbXrhCC7pu8fM4soa+AkVKKFEPzCaAnTnrXrHJXsUuAcMUiF2vuCEj/CqHUkXkN+V5IpOEXpATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868919; c=relaxed/simple;
	bh=ILGDiyBEsByOArbZlYQlWsMFoQKUuCbBihFkErQKjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq6rZoMmGO6rDaiatutLY3cTFvQ08XL07/W8++nUqsm4AfC3J7+wpEv4EwSO52vhJrMjbdxTXuPUh0qsGMhpSZQp+CjsP9BOsXSojlPFo3qnKJxL0Rxb+2hBoa5A1lOfIF/Z1zdiI+Aeh/OjGcVjNYfR9tFY/tBgI0+Afbu0fTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o31dCwrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBZnyaA2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El62s375434
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o1R7z3tNM5aYb/NUqCfxowaT
	LqYwFCZn/Sdm9gTMZJw=; b=o31dCwrllcRSjxrYsp9xT7mw5iSnDJd1/XUwA/qb
	pjD0ZCyizmJXpvr54oR55PxQ48xH9I3GL77WHFMZOl6Bk0hbr/3w+K6IAN9klip5
	BJuzV9wx0CGLgkocLCtIhiV698S+dFCzu/qLhuIGiw33of+5hb5AnJGXn5mTiPeD
	3ZL4j8xbhLUUKuxEYkJI8diiOesTv7fIYzXkjjrJF2Y9yyN9KeHyp2E/ls9w02pN
	CnHfmibEFRba4sGZrqxsHMVbeIgx2Tn+UyPhZc+u+6CIFFMXm0INcjry4jT4ynK+
	L8C8Nn4MpaZzoVHSQpWGn+lsxwDH4yBvxNgut6GzRh5D/w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvjvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:48:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2067683137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868916; x=1781473716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1R7z3tNM5aYb/NUqCfxowaTLqYwFCZn/Sdm9gTMZJw=;
        b=LBZnyaA2ZIqQnkzk3ccOAITHPMc4/yHGnhqBGq/dX1TquvPzsH3bF2qocdw5bt8B/i
         2vJp9l7C7cOMV8uk+lOrYq9+NdtpuneP9ks/BzNkSbx0qzVT0ElCp+nLLwaggUU6JZbi
         +JaPkQd8tb41x1672Ws5WKRydTrbVCHyBO0IUUVFyr4zI+R5D+vHVBthysmqZ2dWrVqC
         1depjGgDysgZ1FOCZPv6eZaWooam4gs06Q8/95nirbqYuRiEqqqMFIqI9pEwF7FW+oiP
         O09NkLNFK9S/39QjR6oCT4j0AEsMNusCvYWBaouDDVA8B50KSRMuHPqrpYqVp9NGg982
         +PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868916; x=1781473716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1R7z3tNM5aYb/NUqCfxowaTLqYwFCZn/Sdm9gTMZJw=;
        b=RgBVse3YlxbFsoc4pslPz+1F2Ls4UeyYePbPpcviZDawFqx69qBql5M13uWljedM1R
         WBLa5mwKWUTpVmp/CIgyI6GtYwmC7S31bs4aNtrlVUZSoqzgO0EhnSyawB2FYP4Ze4Qt
         vcWHpV9LvpGBUvioyKg85uRpTkzz94dsrsIyDjlc/NQObYZslNttsAeBCocD/k8mxCub
         P6bLIyTMkhOMV1AGgMfaLPBHJESZO7VZoF0ljJ2z6w1PXpoZR0l4LM1RUuXqEFsXTxxO
         eUSBRoig2FdJ4HrK/7TtixVFyCgzHQxgqwUBJl73CsJCnGg6e8nUf5p4XDJwtpezaeY2
         zQhA==
X-Forwarded-Encrypted: i=1; AFNElJ+rBrx80yaI2yvWV04vl/w//W5C4T96S9vA6R7cM0LfGFpqG/EfHJJnL9cCywkSaHLVpAtKJ2IZk9cd36aO@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgkoErtWXxLka9RegrHRThxz/ppRcIouuitzjaJPcoUV5NGrR
	DmS/FfmyDQ36zKEVFlfxR2NbpbIMMfSCyQ6ba+GhdTi1zIe1/LdUWcguIukGmHGxvcM7pYibEd2
	l8TXaJMEZrTivPRA/6TUZdzcnvZAhfvd6Uw5QSMsf9dJHKEkprUMkqWj5tNvuPBhEbrHR
X-Gm-Gg: Acq92OGea8shy3/TxFadjTVdWc6WOTxCtethyEnE1RNFgwV2RZehCGJ3yWeFI0XU5tm
	Vrb05wiVvoymvsFCdveKSr7CLV/vOBoB4JarEaza89cJelPZ/cezjhRAnkaX8QeoxA/5meDIvbq
	o46o218hy/5HMq91G3wSvTEQVjMsViymqzv5kvQYOIIjw/FScfdzipkjjD8CTwN983+rnEfZPyt
	1EFu0nOo6+h0HJdFKmLfDbYMp7KMJcAJ6dZC4/tRXXYuYf+9O5Xqzn/b8k3HHPLT114PMeXbQWz
	Vyh0sApHRXDSjtuQ8Px8TDyqVTBKoM0EzcSiD6sXXgaxm96Fws4jEmmxzhDjwVy30ZirPEiErW2
	lG48X7kurtFQKrRjA/aiqK8MboK9+guKkRwE2AcYiJ93c1UUWfQPBE09nOMcTQJjPdyME6u2W70
	zJ6Z3RynDGtZo3+HfrqhnKXqj1jIjoZDT8N93df2deOrDw7A==
X-Received: by 2002:a05:6102:5094:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-6fef9971468mr5613932137.10.1780868916283;
        Sun, 07 Jun 2026 14:48:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-6fef9971468mr5613927137.10.1780868915837;
        Sun, 07 Jun 2026 14:48:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm3322124e87.23.2026.06.07.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:48:34 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:48:32 +0300
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
Subject: Re: [PATCH v7 08/12] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Message-ID: <u2mabnpmsql2mfnonw7263b4eb6wpzfdkdmn6q5gghutz2ir2g@ekr3bdwxa6nv>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-8-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-8-afaa55d11fe0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25e735 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bJ2oX7-cLgL2xx1Iw9EA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: yijUKV_LXwkPXn33hKQLhhIXYPrUzWAG
X-Proofpoint-ORIG-GUID: yijUKV_LXwkPXn33hKQLhhIXYPrUzWAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX7eI4umBrywBW
 hgXQ6MJPP+MKuKHRaTXXErhywtK+4gMDsTZKpOhJ6LuM6Ei0XtDS42Vg2iObesDOsTvnGEjNbAu
 120l86aeaXQlaoigPf1qBk3e5uF1auLMKyAWoWjK+AnXa4EjfJeKaXsB87++VVQqwyXuOrV5IvH
 7yuNXOZA9syzhPtP9mft82mTcjErdJuK6hxrSXL0YEvYbu78pR797VSeHqJ9UJQFIFaQ6ydRDUo
 bT7bVaeTdOG+cnhM99zFjtYBVCWKPAqognkJaBanmi1+KqivY7ib5gNnVsLHvKPIDt5xUiDGfJf
 J/Dm9zfdLkdv46Na+O4jWWaFNmXzxRpejDMORk4MckXeJ1g+A5UWKYI54B9Ofbrch4/gI5aFzRz
 mQiHVoy+1lktJ13gUfaDe9CpeQvD/RGhJk8zxmeQii5VS8NfrRSwZ448OWnuFf0KF6rdt3t/24n
 D47hVPyCe5HmwbbdLmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ekr3bdwxa6nv:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[205.220.168.131:received,2001:14ba:a073:af00:264b:feff:fe8b:be8a:received,100.90.174.1:received];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9712651BD7

On Wed, Jun 03, 2026 at 07:48:46PM +0530, Vishnu Reddy wrote:
> On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
> to determine the VM count and increments it by 1. Writing the default 0x1
> causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
> CPU_CS_SCIACMDARG3 as a Glymur platform specific.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

