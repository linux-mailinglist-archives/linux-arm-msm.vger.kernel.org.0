Return-Path: <linux-arm-msm+bounces-39716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E39DF07F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E25163263
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 13:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EC515D5C4;
	Sat, 30 Nov 2024 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCV5A7up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA922066
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732973474; cv=none; b=g1HFM29pKwjM60KcOJPrk6CJVoD17HPUHmWXLw36MIGw2+AKn9XwseH29gG4Sa1ySIpKye93h1EYif5TzAsh4bwDDfZgeMxDnYhsOTeokuT+5IqWbppDMrjyet6x7+fnHgIxFpq3Q4Ro0qRjllQ57zpkIbJ5Wl9aDY80+3KugWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732973474; c=relaxed/simple;
	bh=KPz1SjBztz5JdaMEn6dA+9ukipFu5uVo/ow1c1Z4s74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPp2BEm0KJiHFp+pleCAylUsDYmUefrHF7NNdVRqCiguj1N1r3fA6qWq4BCWfENOxMBdSczhQ5HkUfPQcYh3hJ9zYEMhwuFczuhj/jhZfDRTzZeOZISsCDE5Rq/mFH8NAqwjtZBlWlXuCH7HZiOaUcq5DhFLEPX/QU/YFTiCoK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCV5A7up; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU4o36V011083
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxJ2wIRNvSM3N6UVUGLPO/sM5c1M6IW8tewhLB69p6s=; b=NCV5A7uphBpvtj1k
	VcAf3jplIuealtib1G1mS7TTTegB+u0yNAj/mHtjvIULIHp0jqtle1iDRav4yAk2
	PaERcYmylCxE9fX7O5nq8kVJ8dt6Rphbnw9yulOOtJmHpTAGVjgUtE1oVfvDh7A7
	udAkT9S6PT47fZ+Z/aY8qe/6juJDUrmyx3D8bzgCpV4MyloYvavAs5ihWPPl9sUR
	4edn9Tz5B4HCox/p0j1Q26dFhPu9afVFG1ZLgoq2NhJD4AWvZNP7/BXka6oHs3LS
	tFviutw9bZZZRJb5HqcUuCZ3+nRkkuBgJsqpvecsJH27iER0tK/75itpn+QFGDmn
	JIlSgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07gnu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:31:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46692fb862bso3516831cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 05:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732973469; x=1733578269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxJ2wIRNvSM3N6UVUGLPO/sM5c1M6IW8tewhLB69p6s=;
        b=Lu/yIcKIuWmH+HEJQqbPXvBy0jeNXSWMj9EmiZ527U7bS7URKvOQstNKDfE0BgcJm8
         wzSqRplRgAtQZIlRWqLMXfDs6UV96WJrMuZrHBfafm5/4/beTLVhLu33WvdCaMpnTqz9
         UPDfauns41YvNM4j3kxUYVxaepiT9bZwtZPyygoq2pjrUUM3Bo7jhqUJL0HUxBS3YvTr
         WWlA4AT7iWg6tFqJ/e2TbG8IclQ4rov907rkRVQMfKl2L8CBSGeUEhQWllSmCi64qmiM
         cK2CbAyhP1Ch9bAy11NDfkrbgnQn+Wwb+e1LFaynyeaVCK+coajeJzxlcmHVdHBso5Qf
         Lx5A==
X-Gm-Message-State: AOJu0YwqhzOz7WxL2tMaHs8ipBdI/G+/qmVetWi3+XgxprJynZtjv4vd
	mCrH08Xm+19qT7EMv5S4K4X7VTKQPosqhCWH/ASHqtc+8DjqbFLA5cQsjnydM5h2SMEaLlGhtWg
	wTwIKUbDy2laKXNn/n6FuQEGOdWPDgiFukpta0CkD/t5RtCZEOqFnVdQF7XaQQbGc
X-Gm-Gg: ASbGncsQv7ihwzzfyiaTidxI5DTABrV2X16i/r43uZHQk97gJyRoVPOMZTHRT3hzIMd
	QNx4Eykist9BlJQY2NG8JyzX2OLWj94/4denRRqBHHAqfQmr882EJJeZoUXCiEvzT+P82jZo7tU
	7knaM0skFE5+g67MH7mvcbCRouviwW8z8vh9fH6ScXQb6UcY4+ZFx08S2FswVm7jAsg3bDazyIX
	VVymgScs3vK8/MZFK+cq7GTxHlv7IrC5d+26Aly/XZ9WNuXuW6ExQ0N66jtkLyog/D4Rwn1EWhz
	S70xQxGcvz9p1UjAI6dJBjDdDNa6fw8=
X-Received: by 2002:ac8:7c52:0:b0:458:2619:457e with SMTP id d75a77b69052e-466b3611145mr92207581cf.10.1732973469520;
        Sat, 30 Nov 2024 05:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA3A1BRN4RMAIbP6npbCwI+ZoMyXm/5LUNoiC87xG0beQy19ime/EPwkDRNZ07vfeLL4l0Sg==
X-Received: by 2002:ac8:7c52:0:b0:458:2619:457e with SMTP id d75a77b69052e-466b3611145mr92207321cf.10.1732973469125;
        Sat, 30 Nov 2024 05:31:09 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8da8fsm2828475a12.58.2024.11.30.05.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 05:31:07 -0800 (PST)
Message-ID: <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 14:31:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7X-Sk2vBMQczo1HfXS4Y0TNEJ-1fJB7p
X-Proofpoint-GUID: 7X-Sk2vBMQczo1HfXS4Y0TNEJ-1fJB7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411300111

On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> There are a few chipsets which don't have system cache a.k.a LLC.
> Currently, the assumption in the driver is that the system cache
> availability correlates with the presence of GMU or RPMH, which
> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> with a full blown GMU, but doesnot have a system cache. So,
> introduce an Adreno Quirk flag to check support for system cache
> instead of using gmu_wrapper flag.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a..5e389f6b8b8a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = (SZ_128K + SZ_4K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a610_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {

+a619_holi

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..a8b928d0f320 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> -		return;
> -
>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>  }
> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  {
>  	struct device_node *phandle;
>  
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>  		return;

I think A612 is the "quirky" one here.. it has some sort of a GMU,
but we're choosing not to implement it. maybe a check for

if (adreno_has_gmu_wrapper && !adreno_is_a612)

would be clearer here, with a comment that RGMU support is not
implemented



But going further, I'm a bit concerned about dt-bindings.. If we
implement RGMU on the driver side in the future, that will require
DT changes which will make the currently proposed description invalid.

I think a better angle would be to add a adreno_has_rgmu() func with
a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.

This way, we can avoid this syscache quirk as well.

Konrad

