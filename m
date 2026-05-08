Return-Path: <linux-arm-msm+bounces-106730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCuHI6k2/mkroAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B5E4FB02C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67AB13044626
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457ED35C197;
	Fri,  8 May 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClFrJTdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+E4UaZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C436D50D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267791; cv=none; b=FRbarNP5OKXXPyiwr3ME8le703oKGhZb6MXUaLVUcp5jcbK6MuENcU6nCWOIcQ1n1obUKrz4qMWquK47h1GqVvHU2qfBoQDyUitV5dHbFRXhyxj+ARQI4LsO/g2FnaIi1FH/tl/B/3xZvOYqd0gwxEM6bDitPWGEKneDLJmZFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267791; c=relaxed/simple;
	bh=8BmL+CWOecwAJ530xbi5ghoHg+OfAxe8bxaz1uRjde8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBxuiTYS+XhxAVvAI34K2szKHMjnVAuPY7zTAbIGLt4VV+RVf1k2uMFw7b/59fF8sumOdjsrlcESRwKXw+5R/ZxRWg82cdd7DIjopEuf6UyEBFXYiIVErnxrM0KYSqlPg2GUFvOxzAlRUaxX4nAI8YKsl7CS0/UIGMqGuSR30Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClFrJTdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+E4UaZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GU0dH145541
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sVlipysOkBuAV8gAYceMqlYw
	RvO7SmJQFQT+Lf3VYoc=; b=ClFrJTduf/AGwgBQNiSB07zBanK5DmhZ8zKq7Ci1
	0eLDZcWPp0c0IMQexFI4rKvvTgy2YveLru9UPZkW5UTl9AVX9lZrzfJJAO2R0nGV
	GG9Z3OcuLv+ywcUuiBccd+uTYT1VSCP7JKHpOcbTysXNH97329IpUXyhoxLWhShU
	ALFCgxrZR370tZvuFOBmMQUHR63LqzzoVnRCM1l//SM0KapM33fj9mWEJfbayIr1
	qKsq8Y6ZYDuTw8s5olbA20p/muWhYyjZHMl5iOgTatOILO+y3C09HHJHMcbNQ7ZV
	GnaxW+pGi9zRgzUhpsunAOPlulejlPoHvZ8DJNxTEuA8Tw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0jek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:16:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6314daf0053so319245137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267788; x=1778872588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=M+E4UaZkW7tL8AO0gSdaTnja1P/olKT/MNGYk8FZQfn/ujwCSLercVoUJNyHPdFZAu
         Muahr17WKLEciitjVH2ihoIR9MhIjPjWSzoCWaHn7aderSKthKETEw2k3mdnQd2VXuBa
         Pq09hBhXd855FRH55opdtb8uoA76Dpx/Fo/dpl0ljDibiuJJmZUO7dEjrYiqAc1Ku/KQ
         SdMWUnwOp7t/FUgdCJTTeUvYoY3rIi7PmiUUloyHiCrxZg6UK9S2iOCZlnSEO7dPY8rF
         Pip/N3JAOooNFOy3cRNiPwny58rsHgd0LSGEUcHuD2wX752aUsBT1/x9lO1Ko8HQ6QOA
         qd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267788; x=1778872588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=BmUbNq0AaW5rCZlYwgNxItsggorvBRXZ0yqIn3BYzwhblk981E5y0qjrB7m9b19KAA
         XdD2OCukOqXOj88lKcuwOZlBMN/dQiIgGfzCdtkTdUL6y++PS7LRm/mpIShZHg530PKq
         9+D1hDPdwNg0zFM+vBtKBfVv/vjGpxVF+/hw8vKCKwukkz2MscjrHXLiQ0Wq+Fp5FJCz
         6mcxOQujhlAQXYY222MY/KuM/Ci+BMhw+XbjpUkoHfvbxy6nEviIWTI9twm1OAk1bIxZ
         C9VcDJqOoAaG3d8Eknuo+UAo8zLsXHfhb17nQXSFReKyW8jB+Zo2ZhYpB/dyVR/eGUzY
         vF8w==
X-Forwarded-Encrypted: i=1; AFNElJ+AFNDowrUYNG18wjsrmlWrPHlzIDpTN1G344e/9Jots7u1CQds9shIy/Hx7yscw10SsCUPYrymx3QwNyDc@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR06wmx6Z+IPAIHjYSriShydShQ6INLgHnW9tWdFh8GF2Q4Xr
	8YPRybVhqTjIaYLLkGPUIQ+FkDQKIcAvQgStJ9RvJcgdBkx2lMZIl8WK1nEoturBhoo1c/tmuE1
	ykXEwxNTTmEc89UtLFW9Qmx64itDJFDmnXxG83s1t30XNU6wC2YreXr8JgL6mtaG5mHcr
X-Gm-Gg: Acq92OGzs5uqymahF7AG6euR+sXfMkp8VZtJqvkC1gqnRMN/C2KV1vFglsQfo+QZTyk
	w02ga9k5fYMx5nKXZK6w2RjPc1F1ZznrfM/+wcyVhiFTWb68gM1v94mTdlfsxcw0jjaB3cIkfOd
	ypsLtw/jq6woPcaxku9I8uZr5fd34ok8NoQ6hFEyup6bM46o1Wcj5IVSrPQ7E1ciA7DlO1RdR5q
	G2sycH11khMttgeXAtPUQMlBpVG3bcNOwafbvPosDgZmjxQUnbS/dDMti6flK4KOKCAaGeMZf++
	RGvTCexBXj34jR6z8EM1G8G3wYLi5V0zYkRDoPlZfBAeZTGMC36AgupsjabiH5avnaszOVdgYDq
	q2WMtsGmZ20mx7CYnLoZ+MNFM2IEJBgQ/mzFVSqtvPDDe3UyOM7ZlsslCW3pOcAcd6Qtaw8QUQK
	KtPfZMYKn171XfwmUgd3g0UbHpNV12l1EI/5Y=
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6998006137.6.1778267783570;
        Fri, 08 May 2026 12:16:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6997639137.6.1778267781168;
        Fri, 08 May 2026 12:16:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515444sm723771e87.9.2026.05.08.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:19 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/14] media: iris: Add iris vpu bus support
Message-ID: <brt5t4b2eaudpb76rfdutfpe2p3rgjjyyrezcpsarqvuzsvvru@fgf22ttmijfs>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX87IcvDCqezjz
 XOISL4qkFTnvrklHz1oRDqf/vzgR3rqtx8Ul0AclRc/o2lKfW9vb6YBboQlIDPI3YSv4NcKEIlR
 jcNQersVECTXAMaU1Dl0EBpaFBt6QPNrLP5W48c9l8KIwV6ndXDWmmfR+ynQkI6drkRCBowwXUS
 Ichh0ei72exAZsOtDgJ7KgfMrusYC8ujzDGLboTb1PTo982piIA7ZX/JU8zGafcSgTUdmgVt7Vq
 Jt76dl4/wCFuNkCiCqhrYLkFyeQHFqPyuDpDkAAjBk5+OxqNZW4iNw7FwBf+1JX9nOrwTHxltv+
 yRH8hVVSeh6bGwVfqyThNfRIDv8bYaubjne8Vx9pgiyWKbvYphbzicIc7/bTjONUSmk6ghD75Qm
 ORBRKbwwWlrFn6qhLLJywMg8fdNAYnyR3nLkyPXSBSZwi7ty5bGWrykHmyreaipELNl4nfpchiC
 7/ec2iPej+aKgm6aURg==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe368d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9yz3bF2usBS2VQdoGnQA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 7MMpUBF3z9Hm4hU_De-9f9h60GAbfFZz
X-Proofpoint-ORIG-GUID: 7MMpUBF3z9Hm4hU_De-9f9h60GAbfFZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192
X-Rspamd-Queue-Id: E8B5E4FB02C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106730-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:50AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> assosiated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 +++++++++
>  4 files changed, 99 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 5498f48362d1..025280ef1221 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -1,3 +1,6 @@
> +config QCOM_IRIS_VPU_BUS
> +        bool
> +
>  config VIDEO_QCOM_IRIS
>          tristate "Qualcomm iris V4L2 decoder driver"
>          depends on VIDEO_DEV
> @@ -6,6 +9,7 @@ config VIDEO_QCOM_IRIS
>          select QCOM_MDT_LOADER
>          select QCOM_SCM
>          select VIDEOBUF2_DMA_CONTIG
> +        select QCOM_IRIS_VPU_BUS
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
>            hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..79bc67980339 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,4 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..15ba4d9c563e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid = dev_get_drvdata(dev);

This should be drm_get_platdata() rather than _drvdata().

> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static void release_iris_vpu_bus_device(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release = release_iris_vpu_bus_device;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = parent_device;
> +	dev->coherent_dma_mask = dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", name);
> +	dev_set_drvdata(dev, (void *)iommu_fid);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}
> +EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&iris_vpu_bus_type);
> +	if (ret) {
> +		pr_err("iris-vpu-bus registration failed: %d\n", ret);

Just 'return bus_register();'

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..7437a2ba411c
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_IRIS_VPU_BUS_H
> +#define _LINUX_IRIS_VPU_BUS_H
> +
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
> +extern const struct bus_type iris_vpu_bus_type;
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid);
> +#else
> +static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,

You are adding globally visible API without _any_ sensible prefix. It
should be named other way: iris_vpu_bus_create_device().

> +							const char *name, u64 dma_mask,
> +							const u32 *iommu_fid)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +#endif /* _LINUX_IRIS_VPU_BUS_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

