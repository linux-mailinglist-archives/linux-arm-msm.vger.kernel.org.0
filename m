Return-Path: <linux-arm-msm+bounces-77331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3EBDD4E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612A83A054A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37C226E6F2;
	Wed, 15 Oct 2025 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8nmNDdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE12D061B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515527; cv=none; b=LMwMBTCvMr/zFpZU8wBiGr67TMSl1u0XXYpnOnftBYPpPgs6OuCIjvjTjzcU/+Hvh+s63d0bZhhf6jRW4TqS4DNHrLhlR2SZaSmqcJIrWRM5YcAdF9b+7/AYDqQlPRbn37vg3X+Q03NHQPPLsYmzS5cKEuKA63gKZ98A2jXDFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515527; c=relaxed/simple;
	bh=jb5eUCp9yhOc0e25r/IYBA5EJMkAmd76xiXvXoc/QbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0NmuSTdAc30ry+loSgTNCHEYn/aYjKKJQ6Zh+TZkHd3C1Z/GqTgDuizduexL5dblTwUI8gQ3xAotIW3FiV4zJNKeEY6RFx9YJ/jl+lbNuLdZ6BEyXKkSBSWCscahGk5bT+wJ7bvBCD5oOkPSV8kCQCr2lYOY1gfR3qoBeHyIf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8nmNDdJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s8kl016143
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puE9uyHsdgGpcWDL8ZAvftsmoS6a2wcnSO713QdrpnM=; b=V8nmNDdJ5v6JovWw
	OPjTCi4E5CP51EdGMPNgZ404Y/QnKBzfPesP+0qx12jNT3VmBYeDL2ZxlOW2Urg5
	D1j8aO1ssJFIoengDxrhP1+YHDTLl6Err8rs0BmML2ztwREjgfij5DTF71NE6c4+
	ZsL14FH0o0Ltewf+g1pAjggxJyfB9XqICLfbbyWQz4EgV4lguGXTYMpXqSSWpV6P
	Oets5Yk+OAjVK7TC4hXOk1C5jQivKZeGcsvKYub/enVhOzhLN46xwRpfDHPhQfxr
	jYBOX/VOfetkOrZZlgiqEUm9skIJK6MlGt8d60hwIjeN3+BljWmzSRdCfh7kjfMO
	BsoEYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkbm36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:05:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befc49so960088a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515522; x=1761120322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puE9uyHsdgGpcWDL8ZAvftsmoS6a2wcnSO713QdrpnM=;
        b=bpPSBsTUEDuyxNA93t/AN2IO2siyJ37TyP6zFWXZVp0GFDo4UbM+BjDK2wrOBt4FE6
         vEMm9bN+fdP+jTvOZnyNOSXzdpvFKq0NaJ9S1mzNlExIO3Ls7KBYlOMGClTZzFyL6T05
         deNnNQh3gCK+VQiC4BcB2f1ccGF02sG3v/tfxRmyIb015c+u4CT5d3bOj7EsPaeFccWp
         L0HOHRhfurCw3BKc48uTFGrvDc9ZHP+iAnZ1rtkdH9yVyxdOw46F+LYhd7I5c5rm7SMz
         7cxdrWBF0G5B4E1p0kd4tdRiHQEFbfiEhrrqBeFmPJpIpxXOFaLtujETlqPIRA/m/6bg
         p4TA==
X-Forwarded-Encrypted: i=1; AJvYcCVpVAwQIECf4o5RdBly2T80cOIwpTDm5G7CiSA3DDUf+UxslvNxQdWftmiyS9C8+657c+d8cvFEvE79rW50@vger.kernel.org
X-Gm-Message-State: AOJu0YzQH9Ve4dI4D/0CM3B80QezE0u4DowGdhVmtwixZYWFM4AieGZW
	icYMPOb7fDCOJ3B8eewHpjylHS6G40F0i8ygaQB5Ig1dE19SS61Q9psUHlP4v3ZXhNNOFMdc+4n
	7evwTyaClnRBvgvX8kkFrnoEd91S/p52Y52+3/WM6c8lLlEgBE/7sOJ/V2quL0eYglHlH
X-Gm-Gg: ASbGnctvI7vOtulrmIEHA/ntSdZBb4GdsLR1y89Fst3q/f+gChrPvzgBsClNmhv7Rmq
	92UTaDdT4OdR16VDKHp3eXvP1dHoz76RV7ZOTKb0En3debiyWjKygmOlF5Lmx1fPiK1VTTsSG3H
	u1mYf0vsqD2wmKUqhtHyM03Xj/xnGJXOP7HVojCj/7fXntxNYUCUQWkrWYE1NEla56lz7vKzLXC
	+tvbLJAxHel+j3cJgwCH8J27TvdSYFy0Wq9Q74KW6TYVNONsudjT6BRjeN3zZJr7ZQV7vH6rhtX
	bHHSkLPS1jR1V23a7d3sJLJy9MDM+1ZwgE2T1fdjVmesqWgKxYrxHUbBc3v9+Plen+kEzR8E
X-Received: by 2002:a17:90b:384f:b0:330:c522:6138 with SMTP id 98e67ed59e1d1-339eda603a7mr42073140a91.8.1760515521486;
        Wed, 15 Oct 2025 01:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsUhr0x5bG5wc9zkEY1X2zXtv4THXFhdtP8ZdIeEC4XZTagaRI2yDrH/qESOvqeJ4sCfq8Dg==
X-Received: by 2002:a17:90b:384f:b0:330:c522:6138 with SMTP id 98e67ed59e1d1-339eda603a7mr42073112a91.8.1760515520964;
        Wed, 15 Oct 2025 01:05:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm1474942a91.9.2025.10.15.01.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:05:20 -0700 (PDT)
Message-ID: <9a946ac2-7452-9ca3-e75a-0d9abdc21f56@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 13:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/25] media: qcom: iris: Drop unneeded
 v4l2_m2m_get_vq() NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-16-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251015075353.22625-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4wAKHtwhkD_1ShOdzyGIwoC8xk6WU162
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef55c4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uC0m2VHO6b9A_3DEsbIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4wAKHtwhkD_1ShOdzyGIwoC8xk6WU162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXy1Vcn/wlig69
 1MD9DaIIGcXeaSpX+RlY+k0L7WPHPMItfWc60ldL2GVvkJAlzCictRrWjmoMOQe4Mr73q5OK4LS
 CefnAQc3a9p3D65+8qmLa1inU/28i1xkpUTyDpIHQdd+jHqSKtFv5gGUpLFo8Eb98POJVHfu/6f
 zYH2+B5Nr0zC+hKaE7gaPNkSkTErFdoLyozaZTg/ZknHc6YvyAwdCDRhTCpII8mL+Oncv4Wy1OK
 5W/P7NZxTV+xZAQA9g1Epms12ju2S8BD1DojB9HOW6brSwkRsntpCkUlM2pE4S/8QdexvtoyCwh
 Ko8N312k3yZNqyI4Kyg6uRotFuMLUgoZpeLEZfWFCkAbP4g0zCqRR80BQ4R6+xW9hWwKEEty02h
 mHdn/h8df8LdiDBebxvtK6rSDUMVtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/15/2025 1:23 PM, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Changes since v1:
> 
> - Address iris_venc_s_fmt()
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
>  drivers/media/platform/qcom/iris/iris_venc.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426..3926ed513f08 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -190,8 +190,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  	u32 codec_align;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0..8a65c9cc6010 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -269,8 +269,6 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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

