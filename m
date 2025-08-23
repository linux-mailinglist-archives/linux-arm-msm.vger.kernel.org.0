Return-Path: <linux-arm-msm+bounces-70468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA218B3266D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 04:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C7AAC48C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 02:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9034C1FE45A;
	Sat, 23 Aug 2025 02:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5lWmfyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC241EE02F
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 02:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755915583; cv=none; b=ZMtQLlEImO7TwvdP+z8O7qClg1pEtj7wcItxlvgzrZcDETyRbdXFVYpcKsHQbmpi1Dls4xTrr/DGyZuzxcdUJubSvBhvROX8TqEZ7OzGJtgLQi9+zDVdTdUCV4xaD+Qd5waaWXZOE15HKTiwPRgFVbSQ1KOSdsiyJOrW+6Kun9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755915583; c=relaxed/simple;
	bh=AKqLjIt4HEsbtovOs/eWeAXjLqrmL/RfqrYBUPlAiBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDJQbRz2SMG4gxDl/eh+db2NBeiT8NfNpE1RG7FKNNk8USBNGctne1u1JL+nwD6i3Ibosoo3wfUVUemCAMRM8tZ/FeBgTNwcjpSFx+KYvdgmpO7llS+Ej2+gvYwtTa3KfeFngFAsP512NlSsNyxkPk/pWEEZX/FXqASih3sjQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5lWmfyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZpH3025541
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 02:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=fcIfjfnVfGNbHcd7e8hiRw7YOvUEvWgkg1GUjTN07ho=; b=P5
	lWmfySx1GV6fNi12kQgJKZek+U9c3P52JpmDmOY48Ocz+Vsu2kk43xm5qHDzm6CK
	yzpFFVQbQkSqzadLg7vsn26qrGWAmaRnA9wbcWq+yx+6LGYYBn5XLFsN2HOJGeJM
	QpvtkJkx7wAjATs+0OyjmsV1JsRviokDqwro2d5hbRBee/DJYRSpJfN9+ToL4TuG
	5Zb86q87sydGk0B4G5xYo9VI8vREHkwkJMDx3mGPqlPBVHjhjETLHaykLs/CorAy
	5zLtcdSs3YHjW9OEg056dwQjq+Ehc6fYDgUDyJTCWGNowXAi1WT3gDJeqzQ0puZG
	7ag9UfSIIQSM3UdVSUdQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3ch0cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 02:19:40 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-435de5bb378so2885912b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 19:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755915579; x=1756520379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcIfjfnVfGNbHcd7e8hiRw7YOvUEvWgkg1GUjTN07ho=;
        b=deSsRXAjbugB+nryISLMgwljTfKYhdv73Xa1a/ag1qukliQSNkF1GAMb51V23Toc4A
         T/daat6fEWStbbuxjWVu7CjVLkp4uMbCWPMAfFgeHPifkqVK2vwxvyhfqJJoXCyws1Xr
         trrT+B8irB/BXMTouyd0FsHg/QOVWusNaM3zkGOjzNVWVHZ5/5oDygYBbIj+SG1F64+Z
         sMM9crT4uiz3S1izcb3Wpjh+Plplu1L69yhfR+a7L2er8rwH7BQBFCae474sF3GGOb9j
         JApBclqIjxrjlTvEaYKHs8jEuap0x+mFZsOFDp5wqALTVyzULLDK/3+PHxsC5QlbSsU/
         06Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXUcC9moJQs+jJfWD/lcVvv88ZmPyajBRlHgBEytlv8SAb8qSzv4u+eQTjbw707AyIPWOaEGJU86ee19qRi@vger.kernel.org
X-Gm-Message-State: AOJu0YwlPsA9v6r4OBZWjMn0otxMX2mB277W7+MlxHv1X6lSE/5gL50m
	hBbuPblibAG0xkf6brek7AZnvA197R7mHk+mcdIIZJDDEce8khzn6SyDqKbW7qcBwvlTuv+0J8/
	qbhGrzArCSCIZbtd7pbbIZtoJ9uUJx+805QNkobOfDpkpzteZ9FpzfTvwodmmIT84UWyDx+yCo/
	jYrSjBvnZ83kRoVaa1Cgw2NOl7wSMtekzNaw3lutZjsOU=
X-Gm-Gg: ASbGncsKr5XFdDTxn5hmMzVbXj2KwEzyl5bCGa7U1Isos6qLseRUGSVxdGAAUW/ntcY
	a6pQSddmDYJtuvTBW2AKDoIDd0s79oKmnG9cGEzLrApB+QJr6bEfJUnDr5jDdJyNRByjwecMy43
	mYhgbRdu6b7ZrLNw//NlahP+N9Ogzv+CdzVARdP5XYbFpYqtVAAaLm
X-Received: by 2002:a05:6808:f0b:b0:435:72ab:27f2 with SMTP id 5614622812f47-437851b7dd3mr2277965b6e.13.1755915579410;
        Fri, 22 Aug 2025 19:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5CjI/gv/KExsc+EMaEtCGFyVs0a7HKS9AHni4JNlhHKAlhjpKP3Uf4Wk/pxR2j928N9m53mdEp8t9ikFUYhI=
X-Received: by 2002:a05:6808:f0b:b0:435:72ab:27f2 with SMTP id
 5614622812f47-437851b7dd3mr2277953b6e.13.1755915579018; Fri, 22 Aug 2025
 19:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823020919.9947-1-alex@ironrobin.net>
In-Reply-To: <20250823020919.9947-1-alex@ironrobin.net>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 19:19:28 -0700
X-Gm-Features: Ac12FXzn5zBeb4qQ_eAhMiXm-81g1Hev67bQG7OISckEeYi_q2b9VPOFynHwe34
Message-ID: <CACSVV017Hv11uCmFzTgzZ524qGxQtdEyL93DBS9nnoH5ZPrddA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: Alex Robinson <alex@ironrobin.net>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfX2FvuKms8WFQ3
 U89M6iYAulZpU1WLF6zXoBb5DIyG0zrhWuaLKxAovln221Sa7yB1GS0YkGS6VNtXOWIxNehDktu
 nsuVDVQr/ZnQFs84DOXoA1djai6v5/4mV3OzHIBHEIOaVtx6NIrLUpD66nv8LmmO1pqSNZfDJwO
 hqEuHsoE7bHOL7+58ZGbQobXAT2yNKIIE2ugsXiCNVGQx3qEzEIt2MCSh6pWMBqCQ5nozi8ENnr
 TWUqdt5CKijbW7PnAERcCV8+Viis2f1peOKScNAKyMBNEhCYuftrRojBtWd+3hwbyj8Ps0oNpcc
 w3ZMGVWWOzkssnTCr8UX3tdh2Ill5zRLT7omKnXjYWBnbbLY5xoC6AkgSLnrEI0ySMRdfJEVBd0
 yXjN07uF
X-Authority-Analysis: v=2.4 cv=EJ4G00ZC c=1 sm=1 tr=0 ts=68a9253c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=e5mUnYsNAAAA:8 a=foaXouvCAAAA:8 a=wDp8g09hmpcQW3DN4l0A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=Vxmtnl_E_bksehYqCbjh:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-ORIG-GUID: HrW4xLPmg8JQvpyUTwMdx6DTXpyafV-_
X-Proofpoint-GUID: HrW4xLPmg8JQvpyUTwMdx6DTXpyafV-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161

On Fri, Aug 22, 2025 at 7:09=E2=80=AFPM Alex Robinson <alex@ironrobin.net> =
wrote:
>
> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> before adreno_common.xml.h is generated in trees that generate Adreno
> headers at build time. Make msm-y depend on the generated headers,
> removing the race.
>
> Signed-off-by: Alex Robinson <alex@ironrobin.net>

looks like the issue is introduced by:
https://patchwork.freedesktop.org/patch/664829/?series=3D151864&rev=3D1

BR,
-R

> ---
>  drivers/gpu/drm/msm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b..1a918d44ac48 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
>         generated/sfpb.xml.h
>
>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEA=
DERS))
>
>  targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> --
> 2.50.1
>
>

