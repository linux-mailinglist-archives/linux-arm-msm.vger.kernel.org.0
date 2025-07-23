Return-Path: <linux-arm-msm+bounces-66229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8EB0EFD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C23AAA4DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95E928C2C5;
	Wed, 23 Jul 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVLRDt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747028C033
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266502; cv=none; b=nbymASptZzWGhK59G1mS441/oSt+Q5OcHBMhj3Tb711x2HLEbBCz4h3TRHxN25sysSLqbAgcNW7rzAZpJ0pdhzY5teFgfqjrIVNsAxuzo/WTIrDFosJvD9ht2XNKXrcT9sCz4KdM8axtXS2fvnDJCVJNjVJ33gmDq+6SwaW+DSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266502; c=relaxed/simple;
	bh=z5lfG1EpSl/3RZ9cuRBoEl4NtbYs4VztWV2/3vhxbQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn8VJ/WpwJSWoGP3Z+awID2GWC4Fr8uz/DGwwJOMj/nExVyXoldFIlRve7u1Xv4Fm7bB4NkPigLQDQg801ZXL0W+kp4PpFWc5mMruPbI1LJYzSMrgjjcNcyEKZ9Z8FEw1bLaFbnczXAuR03b614bLalcfDMo61R95NqcWZ/MBvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiVLRDt6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9P2j0030795
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzR/vX7Xl3wBXcTUtNpoHInSR+HaYsHrGxjxbc/TMBQ=; b=ZiVLRDt6zu3B3KDe
	ujWkglWD0BULfoZK8aDE0iM7y/RNm6W3KcRaX239CA49O8hyuIjMGe89LV89fNri
	SmEiKP1XGZD/geJVS9w1ntu2a3sssHMQsCMPhSrR+6INDMEDnk88kxQpn0DDXw+t
	gZECXNyun+ijKZ0yxCxO23dLJ94v1gIlyIjrNuuWsFBamYwrHlW0ZUrfVqU8DuId
	TNVUJV+kr4JRGLGwRnlc6pL399Zy7UmgTkVbhUnoMtG48ICjZAyKhP1zcB57MlLj
	UEAefD2h1HrsSTBgEBEXX5JZ5NOKyAMdcBsBhG4ZSi9aIxoFxbOc1uDepMRKb7NC
	2JP7jg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w367c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:28:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facbe71504so9869266d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266498; x=1753871298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzR/vX7Xl3wBXcTUtNpoHInSR+HaYsHrGxjxbc/TMBQ=;
        b=Y4PEv3DuNVclk0CLBpzsKFRptV2GM6bp8qBFqqCnY+Jl+riYcQVrEE6kZEPZHnhlfu
         WbF4GbX3A935gEh28XTF1Q8OWXgOT52E1nsXgFhhM3NwY2g9HlTlvkICRpUYhLzZo2y0
         abSI65nhx05Aqc6eP5TwO6bOuUO0mZgf2dTm307Yd6kI6AcNXfnI04Mp/OE67XjbQGwg
         uDBsTJ4TxnYW/PrCiYl8SQs51AL1vN+Rk/mv9wuMuKINYeDsJb0PzQhItRCbRBupG7Fk
         AUNsQDbqcsGKG7e8ozyMCEJiUxMD2wFH8WX98HsLOIQ49QH9xK3ZE5eawSnWMZCwTH/f
         ugpw==
X-Gm-Message-State: AOJu0YwSXXKOQrwpdkqFzAP5MN/bGsx3Lhi4Irw/G6nn84fiH4f4Grya
	CYHhWK5uus0vlOhiQw9juVKk1EjGNhlvQK8pDOpYKylBgC+JusiTggkVT1bjsBQDccbKrZVlgwa
	qG5+VNrqFcFTpCNlTBM/e9r8XTzbNVI6MOH/8nTCVtoPEZvUKmPjU3r6v2xcQ2NZPBWDh
X-Gm-Gg: ASbGncsva9wLLKqL7emhESUDxle+zUKbKrvB5hsFKeF+TZoy3t6XRAWBHS2fVwt2BFL
	tUpu02OKeupVlYagy/IJvKG4cZPFKvtZkgWexIVUy5S2LLjG1qxu3I2Lo29+kiNqS8go3RFB/+a
	Se3mzLPWDu3EO9IqmMdHD71BrRBdoKIIPHmQJ+swuHs+RGo6n85ji8vfVhiRXLD49J7CSRQOQ6/
	XLx9on3Ujn9TGE7gEZEIF6yl7n1FuS3kZVGDJtRkbR8IPml9E5wpg8idNfplyA87AAEQk2n0gJQ
	Ct7HwTUZ1Fef2MgZZuIMN07kbuUwRKtj/A3s9YHnN+WtvLsKc1LNGjOxiqkmaph8ZFYCKJ4tlu5
	NBymlXCeAv2UFERIbiA==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr16607036d6.3.1753266498249;
        Wed, 23 Jul 2025 03:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbL39UtPO+SV8wf9+PGiKf6rdU9y7bVc7YUr8WF8xNy4i+xE+jtF/o/Z3VWa+cAEKKOMUmAw==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr16606856d6.3.1753266497737;
        Wed, 23 Jul 2025 03:28:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f09da6sm8325019a12.5.2025.07.23.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:28:17 -0700 (PDT)
Message-ID: <8267f6b9-2929-4dac-9e55-f2838ab64f50@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=6880b943 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=ZrogrxV2tr_2hvHNPc4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: aWaa8tTxNoIaK0eBtJwnvl1U__MJVkDZ
X-Proofpoint-ORIG-GUID: aWaa8tTxNoIaK0eBtJwnvl1U__MJVkDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfX8ZkErtPQKJ4f
 IYJRs6l1X7ugHXAEZmV6AvGGsyFKnsrdAuhRW5jupnZiMFHoYKOc4aS9zW3kc1auD/8lAPGByVp
 CisDuRz4x2tDHX1OzDOUlfekmyLpvmt4916MvHRgPe2vVEzzFMRsa8nsyXoulxbc+qmZqaz49hX
 v4T7qMyhD7ewtVrc/Zlmu4olA9rYcxq0dTSqUz5BjLOJRlHuTI6nETCYsPOoU+tyNrZ6LgQUzeH
 oQHNEmfj6fn0EWbDRBDC5D/Dgh6rmFnv6yNb+Vkk+s0XGVUfsCluATjRTfjyDLJD0cfhd2ZCFec
 Ru8U8/x8FzxlsL8ilzzga5GKkgvU5aOlLNDKWIdcXEVNJqFdvCZX18iG3yHi7ZlZnEc7YjJq6FA
 S4m1l/QBZG/5VzMxxGpJuTg2PE1QvxfwCirFz03k2p0QoiXZgA2lvi8fwcT4EYuJsddeN+pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230088

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> When IFPC is supported, devfreq idling is redundant and adds
> unnecessary pm suspend/wake latency. So skip it when IFPC is
> supported.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include "adreno/adreno_gpu.h"
>  #include "msm_gpu.h"
>  #include "msm_gpu_trace.h"
>  
> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;

Do we want a static_branch here instead?

Konrad

