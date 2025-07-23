Return-Path: <linux-arm-msm+bounces-66218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E8B0EF18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868311C85B8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A296528B7C9;
	Wed, 23 Jul 2025 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="do/DoECD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8C28F520
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264874; cv=none; b=foAI9I/oqe8M/GTgK6E3bHLn86NbIFYAHW+FW8KmszM+z9EPPRav+mJv/dPLrrNuX1Lzk1V7zvYbXM0cL/kUDxXtn/AwjEJveJ51mSofcsn1ZcXMggp9n9nimvaNNhtzRf7EKZRLZAlriwQvb+VtSy+1L1AmwtakssRYQBdRdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264874; c=relaxed/simple;
	bh=UGP7plI1e6RwgsK0AHdr/vFkp8nIE0bKVNJ9KqHkh7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+qIjwxQVWeLBDkQAZh6wbxy2ushlAw/+kbbL/PUafeMhMhLnfLV+5T/phF3as7CGZW948Wj4mS5mO6R0xMaYwjz8z2GY3K62OS/NXGlNChYdGDh16r5ExnIMqJb8G77+LeYi1KP5NZuvxuWDdMgyF2pTwLKG/qeyO6UE1z4eyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=do/DoECD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9TAqe001853
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=; b=do/DoECDOeN90vpB
	KzWf4ibiN6N8XYYoDuyxMYCU5SUsmJVZcS3mPpqQsslsJjjplu5j8q7IRQBnT60P
	KOYIIKqpdpGL6d2hg71FmLCmxC7463Sstr1BHNgmXoQHZlfGLW3Rxf1KZ2ophO+2
	47olr6vATftjGZWXDIsUtTNNCu+qknvwkxbfm6YLpY1aEAjJkbX7mLhjp4DtDUZR
	mTKz2f96lME6KjCHSlkO+Yi7OqICekdFpbhIR2GlcvHPllDazIOBNM4zkCM9Hx1w
	2UZg9XUSGubuX1zWLjrykqkdTf9Z3cYBZHbNNTS7BEUs6XlCFuKBo3+6bUs9/q8O
	mwCCuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w5unc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:01:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e344f333beso16244685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264870; x=1753869670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=;
        b=WKnQr9IbmovCgUTyoiPI8QHokuB2EHkaA2jZl7Qomm8UmewePSqpqnOJpmqrp4iuuF
         Pfm+5iTKbTLcoo81vwGl3T2Vj8P0UpbW2wF0nT/DkLNZbUhWUFWB/JC2VFrBP1lb2ZDW
         UFlAiPZ8Ehc7//HgGeO/1X1nDSPGODEjz9ZMyLFLV1zuJlYp+KL3KSoATs4CovDELBE5
         TIYerIjU3pWiBLCLY5yfWTJLN+16s1rvqZ0NaEAn5BTcJULjntxlLrwYsjYLisAFMdgA
         Tg5g0WIwpeYAOzMPWgv4ULOswvV75zKSeS7nc/Z5Hoq1SpQMmszmGwk11CwBLOjxx6yy
         uVBA==
X-Gm-Message-State: AOJu0Yzag0pzG8ZB8MpmVoPuAp1AqPbYPKYlVARcVturUjZ57lBnRcCK
	4dMi9OLKMEZDSYW5Ss/EOdaeI3gTjwuurDjVzJ70Zw7MjmDiO2BFvIgWKG9FnM6BSNjFM8a9Jy6
	uOyK0A3uClOkdgXjzRWhLvEbH2zRFKsqKsEb9SgrBJb9BZ7F/AfTnem9AiCLDU6N2Bqot
X-Gm-Gg: ASbGncuSID4A1lRfL/hoUxZiYnoRu+tz70dheGYLO1BuVTDzf2L7dow7rQl9i9Cy8nI
	w0nUvHQm0AnKOumh0XS5eQ/dkE+dSU44WMiCxsZA45l1I7DTDj/SheucrsNLfK6mvahBpyN42EJ
	6XCPNA2qcVKXhubegFYj7+9LOJMPrZkWXJyuCVhxBRpiH66LjiG/OeYg94Qo/uPMpOIp+2ii1qv
	3C+lZNRmesc/nj2RWhAxHK6nJ5gtUALKSc1LKMfjhIgCtn4ZoFPVTFmCTOVZnHQbjlicBKVGl6F
	kGGjxWBIH3sAu3dTN3CywDDfgf+RrDSMXw/JIVor4vwGXRO9x9ZnkelInoMHihR687leDYFVaqi
	KEhcjiRE62b0gH9Narw==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr102520785a.7.1753264869985;
        Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpCoJV9xj9Gc/I7a8P3qXIdiRSdG1vduKGp1cHjyO1PBWiyVBdxvbjxKAxdAdhWKfRMhgQ7A==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr102517085a.7.1753264869322;
        Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca3005bsm1020602266b.88.2025.07.23.03.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:01:08 -0700 (PDT)
Message-ID: <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:01:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
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
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6880b2e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=45tQodLAf9T1fsO_g0QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX4ecyMWwgET9A
 8WUFW38OJBrTq7FGR7Oa2QIs885+C47w4CXc6yZWbZXO5c/vlBRbaXz4Ab+7/4AlHJAnuBCkAhP
 jNFWYtQZPQ+xzXksA2bxgGeB5ZFYio9omBcNsljPh/teKolx2Ygy/daGO0nhPjPGYFGig/jI3+1
 Xu6Y1MhU4Ll4z0WS/3QPkFak4Bw/mBG1/xxvfwwrFvp4MuxdpSmiQ3KYNjfxDzLetjWGzslY55x
 VuLCdml8yMcZ4tZrrDzJQ4GcFjAgBaEmKQBAMauO2nLGBKq2JWcheVw9jM8uhpxZEd894yVIKO1
 VeYugR8/8Yk+S8LJxCMHl97kTDGbgr7KnzlNT/g0+FlRGaUd+mMfjjOs45/MzwO8gZcwyo0ZcGq
 li00Zzf3iFfPmKGlOGBaGpKn29LX9Zr3QFKEyAoRiwH7NojeUc1akXoiTkJ73sGisk6omg+i
X-Proofpoint-ORIG-GUID: V9ipaSraUybL1VyRxqPyerCi_x5fCzB4
X-Proofpoint-GUID: V9ipaSraUybL1VyRxqPyerCi_x5fCzB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230084

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);

FWIW there are places downstream where it polls for 1 ms
(gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
to 1 or 10 ms here), but the timeouts are all the same across registers
(unlike TCS3 and TCS9 above)

Ultimately it's a timeout, so a value too big shouldn't matter, but
let's make sure the other threshold is ok

Konrad

