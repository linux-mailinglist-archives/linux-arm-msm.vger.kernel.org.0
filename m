Return-Path: <linux-arm-msm+bounces-66226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E155B0EF9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B29837B5014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE2A28B50B;
	Wed, 23 Jul 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnAwaWWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA128A73F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265959; cv=none; b=HnmzmZX4HOGiRTnkcO1HPdKpfJmu27VFUTnCpuTVDpYrsndNGEUeihCtLmTt1Jcn1MMwAkWld5I81Kq98UMXOtIgTmXp8zfdMU93uap5B07d7lm605kNiXkTNLtq9oBZwU65gm9uZPfBBlgwtppse1U26CEqLJIVBPcwaqZ529o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265959; c=relaxed/simple;
	bh=IZScodl0d280cLNmqTN/R/W3z9m94O1zjZPO497+k2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjH6MwpKY10ifBBLwH4WWxlF13MT0cKuNdQuurORXTw4MjTRB+D2EaIaQ0Y7YcD/OcUIljaojZVqGgZV9Y5DULK8OOg+tFeR9LnfAbeqRrzAHvsjQVoa+YBQ8IFjL0OIEhoI7jvD4kaPLsGYIL69dgIm+UYAGdyxsZcuTSsS+hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnAwaWWL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9WRQ3020620
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=; b=RnAwaWWLrHfE57XP
	nhj6x2QQPoD0TcW84iojwQf4BBA2WEsS5cttmXK2FdIjSA+riCntCZiCKC2vg1Js
	IpksfbZV7Ad6pToZP+t7Mw2fJ6MvMvmZh/BWcwE8yqrp3yanbkkYeNryATXoHcHk
	dfBBeLCnTVuEww5C9k+w2xGmx3sn9YEIyrUJSwilwzEDrwhqthlc7sNRhCe5GWTw
	ZfL0SCHyrQXLXXmd56ZetbyAG0cqU8JcELt2s4jX67XLkIgqWe/T2sv3SqCAg1Pn
	S/59z4TzwKKSUo8n4cn9YWzVxSfth1i2SR32ErWs1bokUchZPyw/6bE1sWhv/gaz
	kaxmeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eqk9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:19:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4abd7342386so4655181cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265955; x=1753870755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=;
        b=gMI8r65hK/Qp24bunfUNIOChCzZTzi5SRTxcaZ9VUBtMktUK6+FYV19rj71LA6aTCv
         AR6hVSd7m8tr19N3c8x8ydFbJUgF/ELQ44ja2LQRDiB10GatBotBQ+wnxSvbTKKSOVfN
         T/MglLdYjJLX+xD5aZhhq3Gtk47tzl28Racf4XrOe4IcHjvB39eZraznnclEs9Vod5LA
         OIATm2kxL0CDZfWxdEuZjuM+YGFgQavS5rI3fiXYiiFj5jBgVJixa6XDRNn3ifiS0jId
         yaAbXcTxHN2pxQ/nVS9jzTsOg+c0NDRfYSbszqy3BZi2tcDDEkFCERt2LoA3qVa9dnYX
         +tyA==
X-Gm-Message-State: AOJu0Yy+FoyQg4q8mskwIe0rTlq7p2IkqQrFwd8bQZkOQ7ehRf22W/iO
	kbCIBj+sf/jTsYI1E0g4TTwKl9iyP/zdotx2s1F0VTg6o7a6MyI/iwwZSII539GkdHuzBVQ0Gra
	CRoB/QyxOAz6LBwH8XxfxvQa6dEEkpwiU+aya3TVSwaouB/JRaxfSfYAxybGMoOvv5ys5
X-Gm-Gg: ASbGncu3dl8Doo9zRhUKor0qTqXyVT3uePd7LABwbRrUPBoSiMdivo7jox8DsHM4YEz
	/adYl3Ptk2bwV3xv3mXSb4tz2d70zH+2AxWt2JSk4RMveyw/g/OUpyIMCre95f1NAJQbwkSpz6Z
	LUQIujv6hR/X1sMsaxmDygrqpG5praeVTpvJ5C6C3tTCuQCA+VoFKJwbbZFDbFCqpXcjpG/EO8k
	aC+Ej+vWrAZMUPAMUXcM+BoELp83eVUWpRpaJnT4IWdA67IT/PUUlcioQncKazQEkfyeTNTW3TV
	KeUlxT6ZRgR9kIFCpyMy9ifdFj4D+IJl4BERIVkcAtLbaIb0+1IeVYjqFBapAGf/111oPOGfeqG
	TRxrCFHLVpwCuFq985w==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id d75a77b69052e-4ae6dc82f5cmr14375871cf.0.1753265955188;
        Wed, 23 Jul 2025 03:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFby7S9+brNY6voLnyjlEtGVWjDtOvm42SqEKk7jFypebfRo0SRww046lz8A9ap0ikYoNWxlg==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id d75a77b69052e-4ae6dc82f5cmr14375521cf.0.1753265954448;
        Wed, 23 Jul 2025 03:19:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c795282sm1025387166b.6.2025.07.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:19:13 -0700 (PDT)
Message-ID: <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
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
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xUA5krFQmSnEZQ1Y_eELVvpZWRcScNbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NyBTYWx0ZWRfX5OYxeu3UE47T
 1F//XF39FIRRjinSzxHh2bFYBqVkDImK163pjlBCDUL6G8gUTUFp/4fKyy4w9qNxFjzY4r2mFgq
 GjNPeg0ACzE4ZXwaN9BWm4ORYIgrC7L6xGBNRmnynyVhwth5lw4RuOubd+Tvl+HftFcJNyeP5YP
 GZqXcoL5r4nWtF4P3oMdvFRMy5aPKbQL4O5hrZLTMtgb2TSsn9nqCUp8bpWlP1IxO9laGP381+2
 hFk3+9qD90SZKvqvWficfIs9v1uf/g3mBOn0I/wMtoWzhZ5ypVY3xhlzwXc7C0k6WbEIiZ5ZnGs
 C63RvaZaBShSzoH9LZZ7vW2ikvn5atsKUTga/KJcDXzP1ND8m6GZmyeemDukRYcxAUSXDJjakDA
 MJ5e3HsyVS0pEOqiPO8jzdgu8Ep1i3GSjEm6Kk+9oTGWSXxLBhjupulJuKjXkvXzTVjCFfK2
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880b724 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oovjfIWShZiszQ5o9iAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xUA5krFQmSnEZQ1Y_eELVvpZWRcScNbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230087

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
> not impacted by IFPC. Both counters are clocked by same xo clock source.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,19 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> +{
> +	u64 count_hi, count_lo, temp;
> +
> +	do {
> +		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> +		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +	} while (count_hi != temp);

The original logic is as follows:

static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
{
        struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
        u32 lo = 0, hi = 0, tmp = 0;

        /* Always use the GMU AO counter when doing a AHB read */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);

        /* Check for overflow */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);

        if (hi != tmp) {
                gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
                                &lo);
                hi = tmp;
        }

        return (((u64) hi) << 32) | lo;
}

Doing this in a while-loop almost looks like you want a lot of time to
pass - REG_WIDTH(u32?)/19.2 MHz

Konrad

