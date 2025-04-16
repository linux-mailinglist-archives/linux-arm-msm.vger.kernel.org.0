Return-Path: <linux-arm-msm+bounces-54519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF7A90681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 16:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9504B165A34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04A21C54B2;
	Wed, 16 Apr 2025 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrtSEdKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AFD190462
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813902; cv=none; b=ATOoVDP+DZLXUcAtGgwWQa9Fgp82sBiw8GTjh9G3sfUEvV3Kp6Vc/FB/Fmps9cwdCcUDSYwEXAKc9jWy/UoPirHCC+5o0uncDXYWfUcYng1XFoHRzO5OvOT8lPAYjC0kS97rsvOir2n4gZP+fcEXF+u8Yg0KF980k2R0k8g224A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813902; c=relaxed/simple;
	bh=TPACpjjfR71KwjatzwKAVTVQ2f+EX9p3TahnvUdcHu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1cos8qU+f/0gnXrWaqImZNNh8a7TJL+c73fBRF5Z6ONGA5xfPYQKxuSp2PvQ7E7FU1I/3ITgVw9cvNGKPtW+00GNRHM8czYdB8T9w3GSLfUoxJnEOhgffBdHSCkpXhmT/Kzf0ei46pF3Lws5fagLdH9f8EOWPW/0se+8b8dr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrtSEdKP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDAX007005
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/qDGy2ycm6kc3mzErBzyrqXxXsu6MYaqlJOZ4io7MM=; b=SrtSEdKP2VLjiKFs
	HooC6xJXeRjeu37RMRgAD3dUHU7h8H+bghyHux36hRf2ik81OU+75EIR4U9CD4gW
	z4iCZC1LbV/RBKZ2fwlfqAw93K2BsNiA38A1IFyLxe1T1p+Fh7Idy8K7tc3dAppd
	XWKuvvr/ThqLD0hIo2enu7sVdnvZ87fc9+L3pqQXZJ4XHqz1Tk/fI5wIZKYSl5EP
	wUwiJfhbZxJo9wbNvUTdiJ1TrQGyKGcvVbJ5DJw7hOxeNmQGfQgCsSMLxQEg8i+a
	wsX/aXvYQMJ9WhisdApp0KWBAAN8xB03/3uZHIOodk3R1wK8dCR2NM2rD25Ct5MF
	xP1QAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6kur3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 14:31:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3766737so15271706d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 07:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813897; x=1745418697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/qDGy2ycm6kc3mzErBzyrqXxXsu6MYaqlJOZ4io7MM=;
        b=FKaVJT3JrLIOggaB3tdIv/QpSCHRmT16LCQqPaUGVZgWhheOMGL32O/JBIj3z5TsTm
         4XbcUEjYyLXrX8ClVFmxIkC5Mfo0nhQ10ul5GbgtpY5BK17PQx5U5WQAvFgj6TnWvpkv
         bHRFGXHs1E04zCmh/ByYIThkNFgGHVIIVeGIWrSHJ4UzBu0pvwGaTdHKSFnZY4U5bWvk
         u3Jt6+u5lwMo1QbNuVwhgV+vgcnE9CAtf2s21w0Hn5aH9e+by5Y1x+pLMEjWaz59CFi8
         tYDtI4uvJ/MEkt+gQR+/94KR0jp3AbKRvvGmIu4sm3qfOSwJmQbQFvBKrl9lVOwSZaiU
         zXhw==
X-Gm-Message-State: AOJu0Yz1guZk6zTg0joNqFlW/4/L/8Fyd7cUPu8fOcagq3wDJj8YMeKM
	MovimdfATiQuiVdMqvjBmeXSeRevqfDexu+b4d+k5HCwhxj5RfR//Fag2hbZVvNs6LbjFJDO7Wc
	1CZR/4Aq3U/qo9BkJnZKG9B0/973OwnyzxtUzhV6K6HABBEX1/z0cSUqWWFJ5SXv7
X-Gm-Gg: ASbGnct8iGa9nYKg++KgbaQEc/UHKJJ3vltFex3koobPf9H6r6rtvJ4T9LH1fVdbKD2
	WLoxYRcEU94zcR2Rh3SnUYY4H0WRXucUARRO8NBIwp+XuqzBOzu5gt+uYHOaOM1AT54pHBjEMV1
	LjDYbeu1JSny4aUQ96rC+LftD9WNup5zND75mck9UtcC1pTPfbVx5qs2luEZwsnVeWsIQvU44F4
	a1NWOEEr5gA9a1M7f6gZ9/yk+jSBEMjaKow+vD1tlCMa8cBECyA72FYe5OCbG4hjGxPpnBnT/qy
	UW4NYdz7VhBLXqRRw8HauAymtvbVSxwm375/FER5Nr6/4kAllN0NmngiHcKPiT2e/XM=
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr9724836d6.6.1744813897359;
        Wed, 16 Apr 2025 07:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwB6e/uaPkdfMVVa70tVHqNla8oVHRPsq8DlrduYG0CTy8e0RvQw7EDQnPlYw1r218WwFBsg==
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr9724666d6.6.1744813896910;
        Wed, 16 Apr 2025 07:31:36 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d349900sm140241766b.179.2025.04.16.07.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:31:36 -0700 (PDT)
Message-ID: <823b3448-6c45-4595-8067-8c329203d245@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R5DIPjWPrgkekJXYRdam0cHNMycnlVOA
X-Proofpoint-GUID: R5DIPjWPrgkekJXYRdam0cHNMycnlVOA
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffbf4a cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=b2D0RaZ-bvYcWOOTphEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160119

On 4/16/25 2:09 PM, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../media/platform/qcom/camss/camss-vfe-340.c | 281 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..719898f5d32b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>  		camss-vfe-4-7.o \
>  		camss-vfe-4-8.o \
>  		camss-vfe-17x.o \
> +		camss-vfe-340.o \
>  		camss-vfe-480.o \
>  		camss-vfe-680.o \
>  		camss-vfe-780.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> new file mode 100644
> index 000000000000..fc454d66e1d2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 340 (TFE)
> + *
> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define TFE_GLOBAL_RESET_CMD				(0x014)
> +#define		TFE_GLOBAL_RESET_CMD_CORE	BIT(0)
> +
> +#define TFE_REG_UPDATE_CMD				(0x02C)

Please uniformly use lowercase hex

> +
> +#define TFE_IRQ_CMD					(0x030)
> +#define		TFE_IRQ_CMD_CLEAR		BIT(0)
> +#define TFE_IRQ_MASK_0					(0x034)
> +#define		TFE_IRQ_MASK_0_RST_DONE		BIT(0)
> +#define		TFE_IRQ_MASK_0_BUS_WR		BIT(1)
> +#define TFE_IRQ_MASK_1					(0x038)
> +#define TFE_IRQ_MASK_2					(0x03c)
> +#define TFE_IRQ_CLEAR_0					(0x040)
> +
> +#define TFE_IRQ_STATUS_0				(0x04c)
> +
> +#define BUS_REG(a)	(0xa00 + (a))
> +
> +#define TFE_BUS_IRQ_MASK_0				BUS_REG(0x18)
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE_ALL	0x000f
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE(src)	BIT(src)
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE_ALL	0xff00

You can use GENMASK to define the fields and FIELD_PREP(field, x) to
fill it out

[...]

> +static inline unsigned int __regupdate_iface(enum vfe_line_id line_id)
> +{
> +	switch (line_id) {
> +	case VFE_LINE_RDI0:
> +		return 1;
> +	case VFE_LINE_RDI1:
> +		return 2;
> +	case VFE_LINE_RDI2:
> +		return 3;
> +	case VFE_LINE_PIX:
> +	default:
> +		return 0;

Warning?

> +	}
> +}
> +
> +static inline unsigned int __regupdate_line(unsigned int iface)
> +{
> +	if (!iface)
> +		return VFE_LINE_PIX;
> +	if (iface < 4)
> +		return VFE_LINE_RDI0 + (iface - 1);
> +
> +	return VFE_LINE_NONE;
> +}
> +
> +static inline unsigned int __subgroup_line(unsigned int subgroup)
> +{
> +	switch (subgroup) {
> +	case 5:
> +		return VFE_LINE_RDI0;
> +	case 6:
> +		return VFE_LINE_RDI1;
> +	case 7:
> +		return VFE_LINE_RDI2;
> +	default:
> +		return VFE_LINE_PIX;
> +	}
> +
> +	return VFE_LINE_NONE;
> +}

All these translations looks a little fragile.. Not sure if it's in the
scope of this series, but adding an op to do this (or a static map)
sounds reasonable

[...]

> +static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;

weird linebreak

Konrad

