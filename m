Return-Path: <linux-arm-msm+bounces-33161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E599125C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 00:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A9C1F23C83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 22:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D1A1ADFE5;
	Fri,  4 Oct 2024 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mSJsj870"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221FA231C9F;
	Fri,  4 Oct 2024 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728081359; cv=none; b=jh1OcnqgEBLjTNg415adXlRbR5JwhhtFfmZUVrL3zGt1qRkW9P1+F45YEcvzwr9ciy/+v1/hHcc/Qsb/bsEEEgkm9fJbYt/0L0+p5HUnvIW6qChcW+QHH8KwQjVbce5Xvq6uSYF12AgZANercphJ6qdiy9iQ8XqECKJxLJ3Z+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728081359; c=relaxed/simple;
	bh=NatadpHEzWoBR4S4+WAdu5u3eu/b96DInrWu0tePK18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gLofZRv7HcaKeSROBiRhe5TJuNR4u+MydxPttcA0mnEEzzIElhnLYk0FEupdd0C6PeQS1G2hq2RIY03rWBhx4KNC4nP0KNHU17TfKmKmUtoth9Aqqska72hj5f8C5aql789iN4EUakBRP+7EHbAwzu2ZL6c/zQ6KMZJaitH2l2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mSJsj870; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AqPGQ022237;
	Fri, 4 Oct 2024 22:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vvWlUlBG9LiEOXGXDsCZuQHQTqb1u8zSsuk4WJvbAY=; b=mSJsj87075KRGY5e
	TPQR9IUt9ID9B28wRQMIj+2bd3n/h1tXp7BrO1MmyM42Os8HMnbrcKspokq9qHdm
	Y2GSLrO48Ocxhzhhr1PApAvau4U/kPG8A0sd6P8uQNJ4Fs4sLHU9R+abUOlOWCP9
	LGyHf6KW4Vm5dKnL7liMzVXM9VBGj4Zf4jUUJnOnZtl8YisGZeKNgxDlv0RO2E0W
	XI2vJXTuSlfyjdAKGbmkZJCO02vx1jw2MI0GZlxr6WDC3h2w95w0dHKWXQtsst7a
	RYQbEL88Pdna0LcQbNja8WF56TjALGaMGP/JArPBMa/6wOynIVSWU1lvNcohJ611
	vHEvtA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205dbdjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 22:35:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494MZksl026135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 22:35:46 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 15:35:46 -0700
Message-ID: <92d5f299-b931-41a0-a337-001f4a0d9b90@quicinc.com>
Date: Fri, 4 Oct 2024 15:35:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
 <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cmSqWPSkbKUyLnkLWUe45Y7wUrxh-GFk
X-Proofpoint-ORIG-GUID: cmSqWPSkbKUyLnkLWUe45Y7wUrxh-GFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040156



On 10/2/2024 8:01 PM, Bjorn Andersson wrote:
> Support for per-process page tables requires the SMMU aparture to be
> setup such that the GPU can make updates with the SMMU. On some targets
> this is done statically in firmware, on others it's expected to be
> requested in runtime by the driver, through a SCM call.
> 
> One place where configuration is expected to be done dynamically is the
> QCS6490 rb3gen2.
> 
> The downstream driver does this unconditioanlly on any A6xx and newer,
> so follow suite and make the call.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Hi Bjorn,

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 465a4cd14a43..5b06f7a04fe6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -572,8 +572,18 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>   
>   int adreno_hw_init(struct msm_gpu *gpu)
>   {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	int ret;
> +
>   	VERB("%s", gpu->name);
>   
> +	if (adreno_gpu->info->family >= ADRENO_6XX_GEN1) {
> +		/* We currently always use context bank 0, so hard code this */
> +		ret = qcom_scm_set_gpu_smmu_aperture(0);
> +		if (ret)
> +			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
> +	}
> +
>   	for (int i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
>   
> 
> -- 
> 2.45.2
> 
> 


