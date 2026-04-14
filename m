Return-Path: <linux-arm-msm+bounces-103158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uELILWJa3mmLCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:16:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16B3FB9BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 973AD3021C32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF053E958D;
	Tue, 14 Apr 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVigGB5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhjwLadH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2C248891
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179684; cv=none; b=l63TiJi2L5mCRqH90PfB12DRYEIMKF4ZsIMsJyWilnU4cIS3JJbY28EwesEUslYPjDhXJInz1pz9/SX66FDU5bH85GcOYNZ8gvW8LifZZatsRkuDTYlGiUDlsaQb1Zrr5m1mzh6AdvOf+grBo2BFMBFZ8l96US25jj7tlqY6qrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179684; c=relaxed/simple;
	bh=kz5rVB37M5fxScKGUAVyVpMiRJhrFFk1kH1C6GoH3mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZtSdVauf0H+GkCQgMe7MeKBAVHKvJ0NeeSwrqBvAcDjrWC/PyMXauZgKHQH0joIPOSkeog5s3G0UvxffWH4exxyQ6ExcTcy3wm4lYTIszgqRtQGCElaku/4yGP7IvMIPLBp8FkFujooGgetpcvwRNhnqprZNlkBfybbimOO8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVigGB5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhjwLadH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBXkUQ3425969
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G4aks4H+FpBEhHapfREL4acD
	uXkNuXLZB9iHD5QRayk=; b=BVigGB5DQCUAuMqT9N8E7MhX51L6Wpm34hRvStzt
	589YH7R1IhsGrQaDAu5OSwdVorLtvYLlEhb4n+hVbo+D67SB8f1Q337qvxM/3xMA
	wqakA9SLntF3lCYj4Y84QT9nKrSSDo5/rJpSLRL7MdexfE3T9ju51Z1DbWg1I2kr
	i8LBKfG2EZJobaPtrXcnAuEm4ODWqIbmzHJ3t8/LH8Pn5zj+MeAtnmxbxVwovATY
	K0Xj8WEZSkFReiDDmGHLP16QDW/mGMArrntaV31Wlk1Y8+795ERgxnKo+HgZ6umc
	1qLUTVrMiDCjVrLvR1ZYona1CoGDvfg4I7Zz4Gr4I2dnRg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fba1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:14:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605c1beb746so4396483137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179682; x=1776784482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aks4H+FpBEhHapfREL4acDuXkNuXLZB9iHD5QRayk=;
        b=EhjwLadH4PbtytNvORjJE2mZxs6F99RsfaR5q8FEWqySzPVM3PO7RWTGjCRkhozv+L
         kZpxR9eu5LQtM3A/eETpiQpufIuY/inTINT2Nmg97UPbVUsAOuObXzCHVGn/hZMnrZgj
         hNsM1J6T81dBd7yvynphxFR3tkGtO3uJFhpgmMjggOow22/ZTCPx2WtpSdJCXXdiNSuC
         u1WzSvaIoO9C7v/8rFoIdppqr0VOM/SA938YQVQmB8jgtACal3D6muusGwak1/BNbtk2
         2bzoshX8eCLfVSU+Yt+wQEXas/m1ixvzVamJ9CpO6P46orK2KILCGbmm6IjRb/bNYT7d
         s+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179682; x=1776784482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4aks4H+FpBEhHapfREL4acDuXkNuXLZB9iHD5QRayk=;
        b=DAB1uQEmT+XZK6EJomqEe47eCLSoSJnE2bhEqBfQtw53UG0eKvnSBtzz1Mq2gXUO98
         YHfCHRhJvWkG64fklX4KOdnVGx1Cv2vhcrInm3tUyfEQybcjNP1x86U3r53P61kS48e+
         amJo7/gUQlZwynvu3Ma+18VAsQd3uUVFC5wQuwOnyYkefidWMSLzWnEQ53G45PbuedTp
         qNo/vAkYT8kpjHhZFnZgw123Own38Ozbm0W7drWV6kZshddeTFRcM7/ajMMACRXsxUog
         7vA/r1g5UDH5silk6Taz3ZENBvqD5ltbnCvp13PjjK71sW1WOFJ/LhikEVZGWD3rWpt7
         a1Hw==
X-Forwarded-Encrypted: i=1; AFNElJ+XiehsFF7VxhoFg8b6w9EV6KHCxRJ2hNF7pg9LmvcUgFcgbIG2YK8zAeVYC7jZLYyWj3XkZwa7eXCXdE3W@vger.kernel.org
X-Gm-Message-State: AOJu0YzET5A3OJS4CIXrzztgyDLQ/Kb6fsbuS1lSrV9sE7mHTAhBTQjz
	4gTCKOwpr52faVryYqG9KoYeI2k437ZybSVfYpoSG5qFZunMQad+96xlGrAjSxIGK/9NFWPloIG
	KCXgA1vLcaMlIB1PbMdSFPsd5j4Pn9ARgb0MRqY+MfJCeqDA4iv7/Lt6XSSjOh+iFIpU+
X-Gm-Gg: AeBDieu/LPWgHyAHwtp5HU7QD8fBRwdQV2ch7O5b8606JuXNX5aC1mNydpzLWzw9Owd
	Kzw4fsqE7/5BFEUtRPBD51AJk3KqJiycENSwuh/3aERqzWUKS//6PNrl4sSVFjfRDqsA3hJir/g
	XcKCMLXz+dM52348HETsRfN+XIH1o/R/8sv1mKzOJXZTvQet1vNOFHtzjhoDwDe8syTIX+UgrX6
	6rj4U2To1zcFhcNXp0fUGWQXxYS2EGTV1J1DpE+Hp7kNyAKeGqjnAu11GG/lXg1sBGOdO1A380t
	pgq24iqFiUtmilC2OsGmqnm6oEl5mIxLqSfEGsdmxq69sB19BIr+zuli6JCgcMKDxwqYG/MwMEY
	0i0GKeB6ndzNVEH412MVdQQkrP66BJUklqFpmCermLiwmhjTB+rwYH/VQnqjMf2+JPU1J/ZFrwy
	L62do5jc55o3vxiXj//TmyIpkXcJSSpByQXKzAGIJ7h8JLdw==
X-Received: by 2002:a05:6102:441b:b0:609:4d86:77b with SMTP id ada2fe7eead31-60a00f39005mr8189056137.24.1776179681615;
        Tue, 14 Apr 2026 08:14:41 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:609:4d86:77b with SMTP id ada2fe7eead31-60a00f39005mr8189005137.24.1776179681134;
        Tue, 14 Apr 2026 08:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492702f7sm31782441fa.9.2026.04.14.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:14:39 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Message-ID: <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX1U2nPfq150jy
 HsWyeZ7WSG63wTO/9VgGpImKB3+nPbhKXMs6znvYQ4E/duCgrSxl8MHFu9vsNRClhly4w4S2Sm5
 sqLcy0b+9PAIAjopjl/kZBRhTjwTcBtbys7VJCznNqm/NzjnWNNAnyUoWgpLrC3IciZTfgvp5ci
 D4GZ50HQq5WKetTwAK1DVZ9dzf51tZYWfIjfl6E7CoHGm4AWcvBxvhPGTzUyD5tRVKptJZpzzmn
 jpHwp94/kPE7hYWGJoUKjX/iSG/6RIfgsoacwULpzKOEKz/IJ2chqzlgtABZfSt6+VL8zl9Zd3R
 RmvQt8y+Xt9y+xDmdp+aS5GZQTO3nK8bEYM9r2OoaYc/27ua21U7iBuQ9hj+sZ78RdVvLSjoAuS
 FV2W2PjrGTUt/f0O5KT2+6hwA6bzS6bA/lWi8xoXHqP3kWtuzBH3zjRpQTUwDPGFkFsthasI2Ih
 kbJWqBTEnsda35Q5h4Q==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de59e2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=A7GDoH_M6FUROJucG8cA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: CkKwMZwm-_jzI4Y_5Kwn8YfHYb7CUxef
X-Proofpoint-ORIG-GUID: CkKwMZwm-_jzI4Y_5Kwn8YfHYb7CUxef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F16B3FB9BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Add a dedicated iris VPU bus type and register it into the iommu_buses
> list. Iris devices require their own bus so that each device can run its
> own dma_configure() logic.

This really tells nothing, unless one has full context about the Iris
needs. Start by describing the issue (that the device needs to have
multiple devices talking to describe IOMMUs / VAs for several hardware
functions), then continue by describing what is needed from the IOMMU
subsys.

> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c                           |  4 ++++
>  drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 13 ++++++++++

How are you supposed to merge this? Through IOMMU tree? Through venus
tree? Can we add one single bus to the IOMMU code and use it for Iris,
Venus, FastRPC, host1x and all other device drivers which require
per-device DMA configuration?

Your colleagues from the FastRPC team posted a very similar code few
weeks ago and got exactly the same feedback. Is there a reason why your
teams don't sync on the IOMMU parts at all?

>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 61c12ba78206..d8ed6ef70ecd 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -13,6 +13,7 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> +#include <linux/iris_vpu_bus.h>
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/errno.h>
> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +	&iris_vpu_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..6f4052b98491 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +
> +ifdef CONFIG_VIDEO_QCOM_IRIS
> +obj-y += iris_vpu_bus.o
> +endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..b51bb4b82b0e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_device.h>
> +
> +#include "iris_platform_common.h"
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *f_id = dev_get_drvdata(dev);
> +
> +	if (!f_id)
> +		return -ENODEV;
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);

I think it was discussed that this is not enough. Some of devices need
multiple function IDs.

> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	return bus_register(&iris_vpu_bus_type);
> +}
> +
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..5704b226f7d6
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_VPU_BUS_H__
> +#define __IRIS_VPU_BUS_H__
> +
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +extern const struct bus_type iris_vpu_bus_type;
> +#endif
> +
> +#endif /* __IRIS_VPU_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

