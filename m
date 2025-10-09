Return-Path: <linux-arm-msm+bounces-76557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5FFBC7C91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 09:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D853B3B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 07:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18DD2D238D;
	Thu,  9 Oct 2025 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHRvISp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92D2BE648
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996237; cv=none; b=f2h0ir0ut//AVcLmDvS7Rw6FfRgJ2lkbGOou3mB5jM/LziNpnfPoaPs959iADzrkJGrZrgbg6JzOJs42ikyjjrLEvedMDh1DVmsi3fSeDhGUZURjaOl7Nrx0q8SK5M41uwtPDBM9iY4akWUSDCfdUZ0X36ojIC60u7BY+Rp083k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996237; c=relaxed/simple;
	bh=B4Vj89Csg/2pPQICPMyNe8JOJW/7eU9JySvWVJZyBT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5P5R7Cpv5JRW4MZKL3iG/5hK2slL75jsFG7Vo2vVShFJvE55ZTEeoXyDJOqKfb0mdfdPcEuo/CQvIx7B8lSO/PGIzd0gw0T8u9pIlEWtqvVXIh/l4gixOMdHA3eWYWQMAjM8HZ+eceOSgpoo6QZ/EkidPTfYOPlg2q4Edton6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHRvISp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996FOYA014054
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 07:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoM3fHf9aKLa5x5Ru3bP13mn03nmNd2yNTc3MJOCNo4=; b=HHRvISp/uGXMiW2M
	KG5py2/1LefuUQ7IEVyAizFydZKxaHy5arXkaZWHcMKUgtoBArUxasXcquLNu7pd
	FZQl0TGK6dnWDNXzdRnsY2qZf0N92YVEW1WvY29bCQPzaK66wGIrs3WsaB1AqiUm
	fnKCjMHqMzm3eYyBK2DXxROm93dEUK1wY/cvYv9lDvdE7nHn1gj25zjD4JzvM5Ej
	UXAB/FHxKN7mxxEKmIqVIC7HEZtalBdfV5jWT6/sneve0IKdZ151+6J70Y+ilnNi
	qA1uRuh8fd2dtt2fKFwa3HiunMlbPHMtU42fpPsBCBZoETr4BGB7C3tBvyVyX9Pu
	tIVE6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4khy22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:50:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eed7bdff0so12439155ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 00:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996228; x=1760601028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoM3fHf9aKLa5x5Ru3bP13mn03nmNd2yNTc3MJOCNo4=;
        b=r4C0aukjtgTVRBXxTm2CR6r1mCFIOvdmfBIyuLz6Hfn8jhY6s8FN5bDPp7GgdNWg5K
         gH88v2kNH9NrRurke/tK65wcjTTYazuM7Ni7r4gmjY33uIBuHgWYiamFTnmLglZuZc1i
         i7gRH/jlnmHf7YMn9mHp0VHcCRwpyNXVJNHiu2rQ+rF+0GKf491zt6vzP08TtNiDHBcW
         HoCrIAOnXd5DEhwGFRDqJd1HLeF35YzZGNEcPeLg5bbp8fC9WxMpmz7ZSEyD+yoyO/ye
         vcdSUAVAF2JqwTNMaHjvc2EtHdrokTVxT7KYtiZ9hhXUMVzXxLsjsJzK6zgAX2T+lTdj
         ZW5g==
X-Forwarded-Encrypted: i=1; AJvYcCVQk7zr/EMIiSdqL4rKEOxpAfJMgN0sBfDQEXs4zo0Y1U+hUOqkkCFVi9DTdBmnBl/kuCV3kpkSsTEsPVuB@vger.kernel.org
X-Gm-Message-State: AOJu0YzovLJ3b6QlOmeyz17cKT7Y0ZhVP9vhKkn4Oo67Xw4A1+6cd2um
	Al5MazL0RDZFYY4ViZOWf//kYPZZZPBRQsfDWAPugKoLx7RC14IY6wNomxogh2awBQb2vQacEEK
	c7s8b6owsV/l3OonGnPUarj79aRo7kfpjRpgk+9EYibYEIxacIY2/Y9nOteovwztNpqAj
X-Gm-Gg: ASbGncuB6+yj5AHLLIdeaitPjivtTVduslDBV0X5Pzd6Re8shGhi0lu09K7gp0QNV1x
	q++9R/xd2WrGAxoxKK5NOXgE+RLdH/UHnMcr8WN1qSQA5L+21Nxz6h8jMkYygGGhDKU2zVKOIbh
	d02SGUOmCWI/eixLDFN5IZOzRjS0I+PVt4mLSoB7GfPZC8GqHhy7sM7LpdYMByckN7EqwLsziym
	Umd/25CwlfLrCnTji4CpjaaANoJOI3xBjDSg2yp3D5PyAOPAlaJAsQgjXIk1O5qmLOap6j57VPd
	XPGGIXDwcAyqBm4FUN8IqgoFQIm4UUWnbhJl8ktgwI8tsaiYewDyFA6W/4ikEtunCX+DKehZjDu
	rOA==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr122962205ad.16.1759996228012;
        Thu, 09 Oct 2025 00:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCIIEFNL9PxfVqSmk3+kqmgoJIsJR45HHjyjsfNgmlte+wJI3PPCLMHzRAxBj2NQ2sHRABQ==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr122961665ad.16.1759996227124;
        Thu, 09 Oct 2025 00:50:27 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de56desm20060245ad.19.2025.10.09.00.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:50:26 -0700 (PDT)
Message-ID: <c11dec36-a477-26f2-4081-fb0dc8188cec@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 13:20:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e76945 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=6XGvkFmkmJ0ZWo89MKgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bNA6nPYKMnZ-3g8L2YH3xfgpyOLv_bwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX97OnUuH/Roga
 NLDjemRrdNehtRF+6SCJM1ChUNTTjksKiFmGUE17cJzfWJVtwXoh6YR0DXdlc3x4PfeyHM/rw47
 t0FaicsBp8mmiCvWKPeQIpnmlDV6mhXJHDDBs6q8etFHcBXgYe2ruwf0bxdgAfe7TQlHzS0yv5e
 Oc2ZKMrtEcrMkqBdEM4tCIrW2Vi68k7kNuRJRVj6Hoky1M79qx3VyGtxqPJrY7wHTarCxj4Tt3y
 mN0eLWXxC6bDTHuOnAK/dEtWlA/SMGGpMadtBmflvgCMLyxQx/jhu9bYCudfxcp//ZcFAdVTkSm
 FmdsvFNiepqfD7eMSO8EMD6Ar1rwBskGgWk/1OdYjVBWtw/AXD9AJQg59AuimL0OS434DejrGcb
 nvgAo4aLGevf1cg7fERNaeckJtGOsw==
X-Proofpoint-ORIG-GUID: bNA6nPYKMnZ-3g8L2YH3xfgpyOLv_bwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile                               | 2 +-
>  .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu_common.o \
>  
>  ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_sm8250.o
> +qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

