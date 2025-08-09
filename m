Return-Path: <linux-arm-msm+bounces-68149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F14B1F1AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21321AA8666
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD142376EC;
	Sat,  9 Aug 2025 00:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdaISzC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB0323D29B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699912; cv=none; b=Vb12FyYXWLsKR6pJSN9cQHAA/gwmr413AJByx9CCW2L/Cv2vxNvEHYhBIDIvJDmPIs4Yy4SF9e74Lg0A1g8W1ju8r6XUv7z/+hB2K22UDft4rX2gpzgvZsAToHTcCfcDHhiUHizXJw+EiVeUwipd4v3XK4o/+A81grb+TLis2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699912; c=relaxed/simple;
	bh=926dX9L2/JJUd/PVWhA4Ycu4EcbB+uexFLF9GYcID/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAxTRuFsiFaB1pZYu5TmztIOigrpt/VWrVQ6RzH1PYGW8oznKztjg3JzOq/ber5RQB79tOFpnjx+IK8burOu7QBOcRaJe9KDmNjUVLj3KrxTP9+CcCHUGB2ESHoaEGPjHAGaxKRzcxVgK4s00xbvfUoO1ZnNRLQPYxPb1Yd26co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdaISzC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NExFg019380
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=; b=LdaISzC6Mk0H1f3L
	7wMT0DTVRifFjawkSDKdtlKTtj9B5XZw3HSXv3Qh036YEhFB9Gk6oRvW9wDquURO
	opBBDh8NxQOpZinl0H7xKsxepoD8guczKynrt0ZcqcOdWLA0bz1qlru7VV5X4ggR
	XAAdsAW/428KfD22FTODzhwf4ugbT3kl2aXmzPaoKkBFCfVQRpabZcB/NyZqCdog
	6GuYU7Ia+UgQ06g2Kre+QDz7pB3BsiVxTDYg/N63eBkpU8f5ncGBoJwLBjEUfBu1
	GgaA34FlsmBS43Y2UVpaZDHBxwLrTB2VFFvMlYUFAiGTrVqIvEuJyNs9NY6uxzvg
	XYQYBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt5x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:38:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08a2b3e83so74565711cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699908; x=1755304708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=;
        b=eQv9A+iAnc9uppcMSyFear/7w0+/eP5HTJ7fRmbTdobKbU5ADEM7TZxJPn96uHdBPm
         lQnypxfRLTJtXjHlZjhr1aS6CxA8OZnSJXf+zu2ooDDNL5+LvyzBOQcb5GmtIC5RzRwh
         I5yFVaImEw8fu3HJgQjZCieizy1G0HYUvsH935lqBzfVEkI8YO0tTBC9jhIhpxn2SZgK
         BmR6bKt8vmU6zakuWqWGwCF0nsy4EytF91IdSQcNMNl1wEucA6fMhc+hG0KChQb8rnkE
         cZnltNlf0kq0V1NBc37g1d8MUm9g7bUirNL2ZXRw0RGVtt/P7odaEmqwD0ntHT9jI/12
         yRdw==
X-Gm-Message-State: AOJu0YzFsXdGyS8WLT0c28yAJk9/Pby1mX/CUdh38lkRLrpVq7KBSk1L
	X8MDyTZW/+H1xbsd9XHBjZcAzHJG6RH78HBiD6PZWYAzRoOS9lwqApTMQJf377rPoPl1Sp4pfJA
	qs740vQeknAuW0+jj8g9P8v1DIleq8rmdN8ZUIgc/+/nQLX2WydmjfSCZ7IJASodAmHxe
X-Gm-Gg: ASbGnctSGlkOV5MW3COwa/B9Ho+5bN0ShXdWaKWK0s9jzjSx2SN/i8lDqs4xsfwpVTr
	i6mQiofPKnegUFP0+KDMWCap7cWL9PJxBuyZrUi/S0FTxrV+HD7G4gXEwc2056VSJgvywUSj5XP
	TX5NFyHas0MqAIF+k/XzJzvTsxNt6EqQ57VS2TbdFUlS14f6XS7lMiq/JbCXxe+c9lrVPy+MvIZ
	eZsBJ5OfXoN8ZUA2u8kLKNJ1ugvqmiOpfMGI+WjwgwaeojAIpaQ6e01IpCWD7dP0IR6sp/hCLFu
	CHpz8roie7kpz2WN1ZgO9m53hgfMK0p91pUv8gUjj+vvKkrPNlfBNqJ0AUNBB5nIdBSdmE9Y+D9
	FjYwkmJxQDENYLorfowQZ/SDrDhbrNOtklxOgKRR54sc=
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id d75a77b69052e-4b0aed6b5a1mr75846321cf.26.1754699907723;
        Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0Zzzi3J4BDnMVp/K7JP6Y2aCQjHuVGq6KrsN8qluameirnzlp9r1HdWb2M0KJC5/NMX4mA==
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id d75a77b69052e-4b0aed6b5a1mr75845831cf.26.1754699907027;
        Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc9af8413sm13671e87.28.2025.08.08.17.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 17:38:24 -0700 (PDT)
Message-ID: <200ee7f2-ac66-4619-9401-220dc578f8d4@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:38:24 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfXzFxMV1tBmiH2
 wO39wOaNmP2KbSCAI+9xBfbIXniCi8S+Ufqwz7M5PxrdfcbtC2TIjtUCdYOlep+f8cC6A0s+hVX
 Jnjt5kN8QL42/5zJt3Im3Csr6e2713plHbdVCKnIKoZruSaLVlRS9RWlilwzfEu+nFK/IDrD7Cb
 6476MU6BvdtK/RGpBDssS7qhn7Eo9QuZ+2L9U9n4pWMt95C0wpquYmRiLUYUyWr/dIpENrp6jsm
 SKcpzBBywgd9HNOaOS0yZT0k0KX0fhiWiOrg4WRgfKjzurOlWC4Cq2ZEqrtAjO6+F7SQq9XbFj9
 hwz/l9fnE4NWdjgi1y2pk2iQMx3Nd6gx63w594jZJaH5FwhOGNBLFo4zl4evWGKn/WDWMTKYran
 pmQnpg64
X-Proofpoint-GUID: GGPNtomIPEHXcc6Nzti2YxnUnQ-wi-nj
X-Proofpoint-ORIG-GUID: GGPNtomIPEHXcc6Nzti2YxnUnQ-wi-nj
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=68969884 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tINfiVESruKu4bDgj1EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

On 09/08/2025 03:35, Jessica Zhang wrote:
> The HPD state status is the last 3 bits, not 4 bits of the
> HPD_INT_STATUS register.

Then the mask is incorrect too. Also, I'd suggest using 'most 
significant' instead of 'last'. The latter one might be confusing.

> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 7c44d4e2cf13..b851efc132ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -69,7 +69,7 @@
>   #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
>   #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
>   #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
> -#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
> +#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
>   
>   #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
>   #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)
> 


-- 
With best wishes
Dmitry

