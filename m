Return-Path: <linux-arm-msm+bounces-72597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D64B493B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476D23AADF7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60EC30C616;
	Mon,  8 Sep 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFIdD8hN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236AE1E130F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345887; cv=none; b=q2+HlqPObs5bY+qoL4Qn1U0p9xyl5hQ69zLTJJecMBAWaY44INB27xsQRVpDz7nrCc7lSpB5AUzEC6g/ZpRTl1O6C0Yx/gyZRN0dZAwnO5OL9rgwZW0gRdS+pbw1a6Ivt17YYr9DRvulb6KoSYA5wW1wkomMLu9PHyFaool3DRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345887; c=relaxed/simple;
	bh=qE4t/JphJuE6tOWkF9SSkebo1CiAgeSUWHmJQwKOopk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1HCc3oyq3i1zS96mC/ejWzUkrWA9Ly3M3oejx0TzDdKgHnmvgE/JZN5mpuK6nvF5724E/YiU2/KrB23Vr82zOWlcKeUqQWvBEHXiP4BtR7yyaD2ugdYEu3tJbX2ET/Go6g/j5kJB+bOhB+iy0FQiXem+utDA47J4pGLiJfmBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFIdD8hN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xWrC007791
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=; b=GFIdD8hN8FyF4bNq
	dhcqYmW+iPIZ8TBq67UlEy0/8yzA3wwwpTrRyxIPuKOEergP7gnMI0zpbK/dn29f
	XRqI7AbVN8X2shw6sNLMD/hNfk/37wp2yktw8PqpDnEJ+CHz+tAX+NK9hKxUE/iX
	Kr+pkHyJSI6G7+xZ0d9oljO+hlnTjrVP3RZJdx+KAHb5Wy0Qoo5PvDrYBP1CjupA
	SsTpnwpGbRKas8Ag+0PqeB+SX/1deC9XXir53r5AfC1C3MEhkFeKQBffcu9Ydqv0
	gcS5sXoIN5Op9wOfZIvAEuhjF+sMleHovORE50aHAyTAUXWIR1EO+MLGC7xvkljz
	dQJwjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8d2n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:38:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b33e296278so7736351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345884; x=1757950684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=;
        b=filyD81qRimxD12L/wcPmf6kMtOtRvOzD29DIosKJyHj3gVRZpmvMwPxQ3kYL0uq4f
         G/VqWeKLmolO1t7V1N7/nl+yG7ULGGmIrnYIiS0V4a0U5H+Q/DIcZfKmu1AqS63p6+LU
         3W/qLK51dgqI/H1Z1NVUgwnOmiDdwQqMgGUKP74Jy8UlRKvsS9IR9jBZXFFL8ml24Qgq
         7VvbetK4QP0RGYmoQHiaj72EPzmOH0Thjn5xx3sSiRkM9mvJ9dEkzVRfNpaXO9yIzbZ6
         8PD/liOevbT11vNe0NJykaWRVIdApwA/g7pQ8H5u1j7JjMNEEXYvbXtOb7dofkbPkMOb
         ZFGg==
X-Gm-Message-State: AOJu0YymkMq4IRLpNmrwsyc8u8xQA1/0VUMb7E1bk7qxQCJ4yko+WqM/
	BGh6iwaNBM/bzYGN5ROxFW8p0L2WSfRGHZVEkDWEb8w/B6GKkT0QtNzK8pow6imSiwC3lAttcW8
	l44k2rM9zGIADjP2CC4c6cKX3PJ59fIART+864dRrHWdMmniZNYSbVZL/TAqTujJFXAvT
X-Gm-Gg: ASbGncslaTlOn069NwgjDkieycd+P9jQyI8spTffStVGmPbBP/RQYy9G1MF8AG9Fbsm
	+sOyUo/vjl8AES9G7HtLSkKWH0jDMXhqn2tqhunrhFvojSexlEdK+TzDgkZSWiwhAWcOTdn31D7
	gew7TSV4w0zccUrcGnwW2sU5wdurBfAeIcx94sKRCsDaSYleyVPJdMvnclhcoP6RvmEgiStdwpZ
	H17loCVbC9EvIes2ZvoWWOXGNAfjEbIA/7T5ROMu1gYvE9v82jmDTLK64ZUVomb8d7hfISufVO3
	mEXCUQjmkKSIb2brxNwCFOMFbPHPdwXMkRugOmQc0QT9yqi9wwgqUpK3mi5M5njZzaqjm8m/OcJ
	QKplJJ1nlvxogfWtaNJZRmw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr58304611cf.7.1757345883535;
        Mon, 08 Sep 2025 08:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcsvpKBaQ4jCcWP5NtvuePywTOTY5oNYfv92gdyrYQkqbJJAvrzNLEIVI6ZIbznl8lDhI5wA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr58304161cf.7.1757345882765;
        Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0d9b1b53sm2408307666b.96.2025.09.08.08.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Message-ID: <59ac7827-6258-4268-8b71-4cbcbad859db@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:37:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9T0ZsBQjf8d5
 agBLFV8DcsK+X8OWfjb2TTHdtHzOX8nua76kG5dypgqWZEa8kgSZsygA9zI0s0k//DbnAMCMNst
 gEbC9v6pEd7UgRPiitvhLWycG7bCw6bePHH8CuczEd/2WjiddqpqliAOWapT6LBY1Bkr7Y/yC4g
 5c07wMQ4YlxMhY9KUsesxbEjb5CTIDHucFxFwDWEhuEh/0cNY+FCksp8LOrggqRy3bIhV1EsJtJ
 sQC8NkXZCUWKOIs6nJPrtuqeqROhL9ZrG+d1rT1liju+7oInlW2bsPSeU0W8hL+/Xj1ktJb6KIH
 ke69fA8KBaot4skjntZcBTzjHkw9jYrwKoKrZGTpqPOr0pROa0zFmsV3ubmumZNIQACLBtIAjk9
 /oZQdgwR
X-Proofpoint-ORIG-GUID: kruDpEhtObDQxFaM8W7bKkYOpLmwiT90
X-Proofpoint-GUID: kruDpEhtObDQxFaM8W7bKkYOpLmwiT90
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bef85c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sRrLox2IjJLVq2cxUxUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>  3 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
> +{
> +	/* Success if !writedropped0/1 */
> +	if (!(status & mask))
> +		return true;
> +
> +	udelay(10);
> +
> +	/* Try to update fenced register again */
> +	gpu_write(gpu, offset, value);
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */
> +	mb();
> +	return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 status;
> +
> +	gpu_write(gpu, offset, value);
> +
> +	/* Nothing else to be done in the case of no-GMU */
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return 0;
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */

I'm not sure I follow - what's the relationship between the write being
posted and the power domain being collapsed (i.e. the hw not being
powered on)?

Are you trying to get rid of the delay that could happen between this
write leaving the CPU and arriving at the GPU (which would then be
woken up), so that the 1ms poll below has greater chance to succeed
because of how these "special registers" work?

Konrad

