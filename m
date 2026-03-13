Return-Path: <linux-arm-msm+bounces-97553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FWNAjIwtGmuigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:41:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20628638F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09ED3322184C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAF73B4EAE;
	Fri, 13 Mar 2026 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCe+ZMdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7Afgsr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F23AE19A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416138; cv=none; b=uQVpdCqsyaZ9Uuv+xYhddIkh1g+yqSvbibElNkRx+Z+sFXkaOSmrKBvm+GmOoUfos6aGZMFx2auMFxGhTg7RYLmseeS77tar9qbK+suGJu0UZ/MA615JPS9zbkZgrwwHbqoDeWvw79JXlcClCmyDkWnR6TpEjnwb8LSC4XF+Z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416138; c=relaxed/simple;
	bh=YJoz91c+q7in7/0KxjZs6mQ9FJ9MYdwGNxoXlFbnDBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeBb0XODv6AiOkMbjl/CrpS+qvXvaE6PgydlPnk8dA2Vmct+mbqCxCn9QvqgcKiI1fnslzKkHWAxt/Z+xjXa0b2PnoBhZnhu1w7RfZAO9qqfZ4UVu306iFk0IK+zaRknK8FMhXNtv3dDnNXlg+MAW3kF7r9BbdI4Ewv46k2NTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCe+ZMdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7Afgsr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvS12391118
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ne/tYUaqy6oEHvVkZv5Q/L0i
	cxB9L/q8cd0LTS1N8+M=; b=DCe+ZMdNBcGKvv/NoeknePIR1wruYpaEEKRPagPD
	wu9vE7e4G715qehUMlhjXIq4H9NaQp+0k7jZw+dn+gNpFyxlG6JIeemsz8nzAb1D
	JfGfEQDH17mMwrBmw4cfZtxI/h+50N+jNOcYUxJ2Jp7EE/cgjwOdH5QmTEqeB0nI
	ipSDgPxUMaxXh8Mq1vOr6dVqLog8QKKLo6x3M7DU+6RYA/voHq01QaOYP/rnOReV
	xobPe+LABk98BObYpG9s9WC2Xi0FvOefu+58G/N/9L9X/Q/WkwdmcsKsy4LWd7jG
	qhs69qyDLrXSe9nggec3hc7ebAn+HYkSWNpRzKErq5rc/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8xaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:35:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fec8d44so1488490785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416133; x=1774020933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ne/tYUaqy6oEHvVkZv5Q/L0icxB9L/q8cd0LTS1N8+M=;
        b=F7Afgsr/8ruUteYrRyiYeBSVHroUJzVjuzF1kmGktmhnvnTXWyCTOyQdjw4H8HSbn0
         gyh2o3g9rwUj9X3V0KUC1iAhn5OlH7WV0sacCFm57749fPTW1Rz48SEG9O9ahSjgPBP6
         kkf4+tbjCxMgs17tBOXuFWOLSMm4BFcQVSI7dSK9MaAFAyhod60DdBa0kf95iN50gc0y
         AFeG4nGxA5C8KPiOSHM3QNYeB3gcoBS68tNbBb6scXh9VucANuKI0UnXV6ATgz9SPatH
         0yBV/NsZIj/cGPNt4BCy8kFF7Ha9BO7iHsSK6bYXAeGLfSRO+YAQ+MhwHR/RrCxVOwk3
         Kn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416133; x=1774020933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ne/tYUaqy6oEHvVkZv5Q/L0icxB9L/q8cd0LTS1N8+M=;
        b=ffe8tpz06HD60OF+wd2FqFNFBO3zaiQMQ3AYndGc4ZHSJfUemkwqBlKr1+lc4fQPaJ
         btBlzNmRUo38bDCINKQgY6GAelv8J1fMHauRhZipKrJagi+MjqPw5J9evvfu4Fr/U9+O
         S2DcOmw388JJxJ4ODsAXULn/p4SGbzL6FExSSICUVS/+KmttXntV29b7VkijnGPc2PrQ
         tXExJk0XQe6hgrrR8DUF7LBR1TtsczORPsDwNUWY6JK+06jKKZ3mSlinl/MrIgt6A6nj
         7tHzDvOUhaDYNg2Poarr2Rb6gV5JEdg57Evkxvdx+kmDd6ofPMVxzm9H1oYJyXg/mdiQ
         frtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQwBuqGst6jDegyrL31d4hUK/aJTK6ocNYTy13pgof90jNuLoo1DC1aWJ2/v5luyisakNwSTWgDa44NAmd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7bOksTJQyt9rk06kUtMC2HJnau7Fi9N3IHy6aPR325pzhA/W
	XtNkAKpBLJHpBCsx1Shsd8/Nv1wH4MAA6eFUcal+NB/ElcTYp3ZAvpXbLUDEC2D8XymzsTW6yRp
	O3C8bpPLUIXELr1evlY3Gkj2Wg3jbL8DUzONA0zxzXVLMHjABzS6YNoBpPBuissfFc3d6
X-Gm-Gg: ATEYQzzRk02hAoWXIlapY5rgUku/jJyS5aG3LieqYsc+Sd3Co+IhLFDstrPGhvG1+Js
	efv+CiEuSPNdOyX3ol+nhCoGUi1XL2CMi+ciQZW4Sen63q+283aw8CK7KAzdWgAXO6tJ/+1bAnu
	oboaYnWzkOFot4Hzhy0xD37t+fFi6W252ylX77GGH8ePNMwmV3euzLfHokpcGfWZQ4e4wyQbgYB
	dvxGnZlp+ZZDJBFeXeXmu16uZW6XkmoijrN4XFqcUsR2a6tNJBn92j0cxNTQWI0meWOmV2TbPYM
	qEWf6xe9fipL83xgSMV1tA6jlVo9cam8dJ+brnt/90zMSzUxifoM4s5qgIAwgcKNBew72CwigBM
	zlcJhvw5c6XNhGnujHXIHL3WYg0YUsDAOi7T50oR+kWwqjBLBZcYau20nAN4tom/ZD5BKjyXFKq
	LyPAsGwdtRGeaIeYCC41SZ5edz2/hBOn3JxKc=
X-Received: by 2002:a05:620a:4005:b0:8cd:9938:9803 with SMTP id af79cd13be357-8cdb5a62213mr510790385a.32.1773416132753;
        Fri, 13 Mar 2026 08:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4005:b0:8cd:9938:9803 with SMTP id af79cd13be357-8cdb5a62213mr510784585a.32.1773416132102;
        Fri, 13 Mar 2026 08:35:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1561943e87.77.2026.03.13.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:35:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:35:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 3/7] media: iris: add iris vpu bus support and
 register it with iommu_buses
Message-ID: <nqsysgx3w7awyfvhiq2t5jgelpmptht3art6bsfsvjz5sq6xkj@3wpkqy4a4c3i>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-3-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-3-9c0d1a67af4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i8KzGuLq97SLbMZqq1hEqI7Lu9GgkFva
X-Proofpoint-GUID: i8KzGuLq97SLbMZqq1hEqI7Lu9GgkFva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMyBTYWx0ZWRfXz2vO1uaKvauA
 4ydf/XiDvzDvXx5cCOV2ZcLIvOI8s+t7LkHcm5SiFR6JiUxDxCk0mCy8+vXfCSxnTDdfwCU3QeN
 8sh+07wrWGc53Il4U2ZCRhrUHpKea6KjbSx0tejdhk9lP3A022J7+WE4eiCS9bSRYmpQtg7fJT+
 Di5ih0fEdsNy6lB6LIzW+GpFPLa4j/gSEqXQP/Exhyb8FS5WMFiSqXCwxDC9AbmTULKkxWsSWhK
 LYW0VWCM/1ruZot2UohB4DdfSzmIn7ytDSnUhv4tACCPa3mspUZjOkyBAsjlZpvEVkO2WTM4X9I
 9tU4vSdfMWzEC5Brh5Q4pCp9+aBvOBt72tcFmxc0z3FS+LN/CGl7hb5feD3JiVJiNEwuT1MDa8D
 SJg37jHZCFG8xaxPJfCxumishMSHpWHg2WHGoHlo0kxosul+Qj+f9E3zUeD+pxo6uIziidSBTw6
 jazabS85C2W/BamatJA==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b42ec6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=z0f7ToGzsUK0FFPo7AcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97553-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F20628638F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:37PM +0530, Vikash Garodia wrote:
> Add iris vpu bus support and hooks the new bus into the iommu_buses
> list. Iris devices need their own bus so that they can run their own
> dma_configure() logic.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c                              |  4 +++
>  drivers/media/platform/qcom/iris/Makefile          |  4 +++
>  .../platform/qcom/iris/iris_platform_common.h      |  6 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c    | 32 ++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                       | 13 +++++++++
>  5 files changed, 59 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
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
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
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
> index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
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
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2273243d1a80446233dd82dcd77444aa043ad064 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -204,6 +204,12 @@ struct icc_vote_data {
>  	u32 fps;
>  };
>  
> +struct iris_context_bank {
> +	char *name;

const

> +	u32 f_id;
> +	u32 region_mask;

Unused here

> +};
> +
>  enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
>  	IRIS_HW_POWER_DOMAIN,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e9fdeb6e405aab26ecf5e57ca91fca6b8eda2c5
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
> +	struct iris_context_bank *cb = dev_get_drvdata(dev);
> +
> +	if (!cb)
> +		return -ENODEV;
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
> +}

There is nothing Iris-specific here. Can we please turn this into a
generic code (ideally also shared with host1x)?

> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-bus",
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
> index 0000000000000000000000000000000000000000..422898cdf2f62eb7f4583d970a01c8776dd12164
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
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

