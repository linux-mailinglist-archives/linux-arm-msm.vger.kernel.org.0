Return-Path: <linux-arm-msm+bounces-72590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF12B492DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AED1516DE85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBF530C609;
	Mon,  8 Sep 2025 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0WGRrFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D8A30C626
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344699; cv=none; b=Os6tYvE8ddLMlcGlH6NodFn3jQAg9ZQoZ5lA7b7hF/D8hPQPpj1Ps4OkDWEqNK/n3uaTKSjt+9BUEwP941moN59PArpuxKHgQAF9gi0NyTintKGByzivl0mMuBbIapGFXmSICWUruX1lqlGOZjuprA87ZYMLbbz45AuIr2EUTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344699; c=relaxed/simple;
	bh=44eWbUv2FAvl42HDZ2rGgCbInZ15HVOOcv/9qcwsNRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RacTtc2QhfhK8dcubSovn4pZJdTLlv0y0D3fE/LVqDiRnYd1039Xitg2ptNPpD3uunIAc76gLHry2QTaeDfRyn9AvFgIZAAo+jhvEldOD9fWDIdjZ1DrIhlywbvYrG5f6IPoA89GMHYiW77dza0OwlJw0V8aeak9Oh+us6GHTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0WGRrFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888e1qf023525
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=; b=O0WGRrFxyvZuZZ2T
	RfklNROy07xaXL3a+3GKtYslpD6widCTQ/LzeF4k4bsWd3umfIBWcIqPFKgSJgKE
	ZEIPm67WccjAAaK56vDSiNn2EIQ6XtMeZgpKM0pqTPhNFo3QT38B2LwU28kMNhJ+
	AZSpCkqDoCPmJsbjYX+wvIkltw8hkUJEDBbw4udQo7iFrH5UIoEkyQPuFAvfg6qc
	FOfcLIN7uOS9DvG+ChT4Azfo9ugB0PJqMmlnD2qlhwrUjWtigV+8zzkVnKdj/9iX
	4NA0IZHycYnFvPbgmMtyHD8AAnXZiYhEjW1ZKQZrE0EaR4cJ9MUs/OXYFWZ3+BV1
	fs+OYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8d0w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:18:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b601ceb41cso9381771cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344696; x=1757949496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=;
        b=jKc+OSQMYB86MZaE9gRrcNgIY4T2C4FdvgS1iawyFLZlVcGI4lFEnsqGE+M5J87J6O
         lDY3vrr3VaOJB61+x96beSKn7JkU1cv8hhHWq6UMYj46l9oexZkM8pGKHD8/HAh4f1Lm
         CvWo6WQ8PylOZ4fJvoR2JgdtzqmQN0ZHjNjU8SuZFULc6Y+nPxl7uD2p0tWKcvsUfIpA
         Fy3ql1KMzjYlDA4c+hrdEg5tpY+cqu8f9utW95mrGDxYPiy3ygMA3kpsw4s8/4yEG2Mz
         wujX7U9MFN3bdNiJlKo4Ppacqgz/5Z29ue58EXPFRRwIUqfwZFqZKJNsaQ3wGMkAcUlH
         yxgw==
X-Gm-Message-State: AOJu0Yz94dCKElKRUOWMljCXsk/NnldjGj+D1gOM0csusbd4xY7Mnv6+
	HOqrhZO2Qz3tDpTHU886QTvuQISRbCdUD4SR3Hg9+Ehb3JSjBmm1t6JDYZMNt6C99FP+unr6r+K
	CCVGFnjGIg4JGeimp9Nv0MktNvd76rxu0ZNzvmbjc11BWyC9QrymftnIOuzZsI0sL50ob
X-Gm-Gg: ASbGncvttIXWW3gGs+1y6wod2I+HaC8HLWiPEOAVfucx7Zkk2svXnjbx39nUnC3MZhI
	IaZ4sNxNELlKhg6hni66xMFAAVceptkkohW+xXRvLSf22I2AaeA9XBpbR6TsLHAF2YpfFn8DoCU
	q4TwlRA1S3emGT4ZX/DMzpzsjKVArDs1MlJx5bH9+HbfQtBe/gW2UI4oB6VDqy+z0GyahJ3KbHi
	IoCBpz+VZrsdwvlWfJdicHwEu0dOtK1kv9sDugmxycKHjH0Aujlz30tC+HrAcQW/ODdOAF7wGW6
	DJayL/RGZ8uQeTV+Sx9Df5Ras63zF63l69Y087gCURh92EriO8YxtPJthW5a+YDeaXhHu8Ynjo2
	ZUUsbCeR/2+e6PGlGjnTMVw==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr53837861cf.11.1757344695732;
        Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv3mcsIkkBXMP29rwffS5CTfl5UUIWU9i9fBerRPfpgMIylwxkbElL5PVh9knG1HqQmUlAXg==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr53837521cf.11.1757344695047;
        Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b043fd772bcsm1761417666b.14.2025.09.08.08.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:18:14 -0700 (PDT)
Message-ID: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:18:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
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
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXzwcY2nHXYet6
 6kdvEDbV6ENIx+8JzR76k/wasIgOOZlshI7qHl7t565nkR6wpLixANmOHtwgEQJ/kNRuTduEVDf
 GVamY2JYxWl5I0w577pCa7Cu9CjaZnDOqvALl//YLqWktIunRNAKh1oDtz1ViNWmJcD+W5CeQS6
 wg240wUHsZH2tY3+0TYSwvFgZyCiVlfyH1FM1JFbJwrqTbyNQ6aP7l6dtI6PG8r+VFwGLcPQYHg
 wLJljSBxPGhqUmeNFCfUEf2V1WQ0CcYOeEhSEo0hr8RE8030vyKKyBa2JEpCwP+99zP1I3Gw5Hr
 +rmNIeVdVg9V6RxGd8TsXsvNalMWrHn/D0aUSJ6PpY1Oq4NC2d21AAsh/IvrPmxlmNZnbla6kxW
 ktsDVrp6
X-Proofpoint-ORIG-GUID: NAzbZJwzOXhdD5G6KXrdsqkZlKi5-Nzr
X-Proofpoint-GUID: NAzbZJwzOXhdD5G6KXrdsqkZlKi5-Nzr
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bef3b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DmgBUSfskXSfToJwqCEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
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

https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

Konrad

