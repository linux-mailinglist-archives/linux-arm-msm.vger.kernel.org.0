Return-Path: <linux-arm-msm+bounces-76556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98679BC7BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 09:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A881899839
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 07:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DA1F4FA;
	Thu,  9 Oct 2025 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEpY8FwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636FF1F4606
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995752; cv=none; b=nBUh1qAYVdVSZ2QyD3s0b4hxg7dfOGDcNQ2qjbg7iRVTQYs47AngejaOP9XIOouhjLh0QSxpkDcv9MdVNC0Eq/ES4pdtcGoRtIAipMnbr/84/Wdh0ReLk/1jfgkg0goiosTpYefo6VqT48GjOOMjdQlXHFQGMfAn1AHHA4cVU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995752; c=relaxed/simple;
	bh=AzylpSSRl2CcWFMwrusxn0okqICGeGTSDI+hXJ9p06I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQM+YRtf2FI622/lEepLbJs41PGjCf94Vy0DdrtajPpfAZ62z6STNs3ku9T5/yDUv3lkVk3UrejebhwGYKQ4DgTQtKLcXWw+yuv30z6CkP3vlJvVQ/MvgiI3bNbwpsJdjvCkY9voi10kBJj33Wr2RvHUBtM7/JlhUc1hgdZqMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEpY8FwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EGht004125
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 07:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0SNXJFOsVYzhJ3jhxVt4s2J7cKV1EdF3v23DlHkr18=; b=nEpY8FwNsDtDNysz
	zqqPgoiWp+jAyMEyPXnGe6hKhP/jT+kTbh7LbryJbxFZaI+JdTndSLCPU3YfvjvR
	Cf40mQf53Pn+qGtNA8SW4hLlLfN6eWkasR9yQlZKZwArygsVptrNGyjktPLHNf3D
	8d17+YV2wFe5HZkozUpreH2RcQe9amvhstXiFSesWEUb0RiQb9RuvtwCpwn+ZvVo
	ub6FsFcwyyhEybSokAstHUe/SfhDh1tdVG0zDATIdOir7KphmyjH0vj5jfdJIRIt
	Gec212uSUP7xl8/D400rnIXEfi3OMgq+JBC6xO5ub9J9P9oWIci1V9nAbfmKXLen
	QES6WQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j1x04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:42:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-332560b7171so2932388a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 00:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995747; x=1760600547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0SNXJFOsVYzhJ3jhxVt4s2J7cKV1EdF3v23DlHkr18=;
        b=f6fpB+0oSs1thr9bEckoVieyWnFjxXoYGQL7eYZHCYPS3leRsPWBu3o8ph+fM0Hlow
         gWeveqqPfmxGx7HCI7flUpEjzz132hXtnP2P4b4lVPg1XEZck/wdTubMAPpYaTLHA/J+
         8gAeec6FtIZon7iWKywhL+hCDCifaxJ16i9sKWU/pTxtpDPorm5YQiFKfdApZDkyCOLK
         5OPUbiQb/eUlYifEjMfy7LvtN49TQEpeEEh9A9dpJJ4fm0LHJDiC4TdlfwUKcxuj5s5D
         Az2AAAktg/lzLspXOleyCRCi2Zi43zxJigtDa1YAccwGSuQSa/YPjk1YYHchod2AFrtc
         i3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWM4yT16aURqCmSUfvMZJ7V7+WQpo15+2D+G3faegxwnWWESgCrPcIV72k5tYAFuZ9i9r5cXnWjsQqPEbEP@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjJu0icQFzgT8TAFrcOJEEhJY6mtLiwbLFrWwSsxMJ4qhS1BC
	WRVhCYGCEpB0BEb9oxB2xy+tIoNDMHrFMeUjlChqvG9iXx4mZxBhv76BPNrS53t3JYsHzB7i7Qy
	AP2es66S3s4W0COuRiKmyf1JoYMYI8Cz8b4PQOnWmXOlBOX5wdwElgASUHTI0ZucmwPdw
X-Gm-Gg: ASbGnct8XWMketQcYu9nVMOysH9uyI1IGsmBEU7WiY9UiLeSLwqFrrh1MDSPGB54QUD
	vgd4kQ0AQ5aWLbUbt/YeO9aXGkJB64euZs9G2McEaOHz7rpFVp+ng9OvVYqzauZrlEcoyyYqXTU
	JpIDCCbwubUU4YYckbF+7cioI8Bmcc0POiZlgpFxHocnUrSVAWOkNb3+yiRV6zbp0lfTa5zYLT/
	SxcCky4dyxRmcfmAv/Uc+qKuJCxFFGxHY8WbwcjbkfeYCK0QQ1AsR6smxp72LfOTY7JAmD/oEV7
	rZ/GvUktNd/IFUSybjIrV+dqk7XstwB2dgM5DCoHB4Fb0V0mMlc3GBYEY719B3h9EY1VmX+fy6a
	nYA==
X-Received: by 2002:a17:90b:4a86:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33b51660564mr8437425a91.2.1759995747359;
        Thu, 09 Oct 2025 00:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqjOQsyOL2Qw47P+sV2iqJMDYIT9HSU7jqLVRJxnFw9ShvYRafKJuyrx4mwmq5exGrAA3wJA==
X-Received: by 2002:a17:90b:4a86:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33b51660564mr8437385a91.2.1759995746818;
        Thu, 09 Oct 2025 00:42:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5296d52esm2958054a91.2.2025.10.09.00.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:42:26 -0700 (PDT)
Message-ID: <c97dba5e-3b1f-4751-398b-c72393d03f9f@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 13:12:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq()
 NULL check
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pa3hiWgfjo82s4WdPamc6uAYgS-mfEEk
X-Proofpoint-ORIG-GUID: pa3hiWgfjo82s4WdPamc6uAYgS-mfEEk
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e76764 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=d3DCbir4PBIb6Zx2eVkA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXy6UXlMo00e//
 Y65M/M6g0IfqrST/a/yXx1q1Djwqa4FT/yrFVA4BpT5s9P6Lwu8ChBVr+ZDi1ogy5hhMD2/Rj9F
 nZYS8DoaZzevqS39KJn7YhA26ITHniVxHkic3TrrUSQLB5T2zhNnUbJLma4pgkRnPOdWqXFd+SY
 3+LLfBJ3WWhhsSHbLIF0AwJk83wOp4fM8aAh24H6sd4SJuj947AxkA+k4GsOlU0IM0uR7DLdDYr
 kg4u0XyQaH1MVFJBaeKEleFdf0b8BegUH0wd/b+L9y6y4Ol40Jl8Y26QQXPvCFdxMU5o2xLszd2
 4Agr7y8IoTZh8ZKWwz1v1bqVudgiR/SmXpP/JGbji5rRwyOzEeL04zCWxF/yhwM1kXO+T17IoRP
 wgiUd+pgz2BZ9EgaC8T8tBgdH16ZAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 11:20 PM, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 2 --
>  drivers/media/platform/qcom/venus/venc.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29b0d6a5303d..8c77db0f6e76 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -329,8 +329,6 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	struct vb2_queue *q;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c0a0ccdded80..0fe4cc37118b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -241,8 +241,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	struct vb2_queue *q;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

