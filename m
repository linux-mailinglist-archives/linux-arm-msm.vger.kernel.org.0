Return-Path: <linux-arm-msm+bounces-89457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FED38463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 19:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8467E3059A8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 18:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973B634CFB5;
	Fri, 16 Jan 2026 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeXJeooC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGIUZ3AH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467D3491CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588352; cv=none; b=tPARmyZPjmwKGjdiOfWoOgk+21TATeg9eB6/iOcRhZZQoRNxFnZIHK1dZDClj8a0H/0xZOHY0n+ur+YPzQNYUYe/EOHyXTkIUw3QDc84rhCogMGs+WJ+bBihI3dXGoGhZXXIwhMbW/+motbUExoPQ6akWBL55RGamSRtNU8Ho2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588352; c=relaxed/simple;
	bh=GNtOFmbQPCuGx7/cehoqKwaq1nJk88tQ5TpWevZY90E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp5GbdQjLXUGisFPh9faqRIe3kYXoBGkHElgu3mYcmYzQyE6r6shR8oD0KCpF0o1XainJ2lanRBbyCfVYEXFpsKRW+zgZihXqOE0GRyw8tKCBorVUmHYAcz9YCvq22m0y5rPpMz7wm1zSVfncEByq7zLV5YMeL1ZHPZLzyutc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeXJeooC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGIUZ3AH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GGVZVO3192458
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 18:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=; b=We
	XJeooCi/htsfcbB3EGGRbEd7Rfn+iUsr/AiADvRPO5UG65C1LpKcIlWJNEx9zTsf
	nmUrKVrm1VOsu98IUq3QqYRvA0nB/kswxtEDZnxv5K7x8V0MMYVhpDG5q3XT6ntC
	L8qWt7rDw3QIo4PUYBL1kB/1cTUfjWyU4OD5kurVUwHKaTm+I0WAuA58gt6bhUpm
	kCJAfskyctKgKxTuYopPuEV0j4zNxKoLUngtbx7lrcTtE4mRFJURjRs4FaLoa9X3
	3PA+szo8g+2GGEJI1dO7Um6uAUmQyJvJoXqGShkfcdTkCRsDOMJrN0Nl5yryGViw
	hEnnaIUvNfiTgoPu7mJw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968k8ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 18:32:30 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45c8a31b1fcso3032636b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768588349; x=1769193149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=;
        b=MGIUZ3AHoL4F6Sb1nCAAxcx2D56BLgVtqxly0SPdsAFXBXJyhOqXsk9JMcTLmzgxyY
         InhfN6jlA9SGp+tMm9W03S43hVXKARhDBCKA0h1/zrm1zNj9afBgGQZlTzhx9X8NUhBy
         PprQC15LwU2hnR5p4X5MLW+bm1qCqMEV/k31DyUfxYlX+AVfh5KnaqTgtoK91vZMz6+A
         3SwRTRIkxs54JpBRd7a8E4F87oHYFvH+HZ378JDasxMOiiqAf1FHrkVBU4wz9NPkq9cp
         UsouHdfZO/BCSmBPB6f2cl3ZjUHTuzxJdysUurgK2Xm4DN/MJ8/ssZBzg0J9M/xIzwKF
         jopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768588349; x=1769193149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=;
        b=LV/RSRkRE97UxoqxcO+J8oQfwvjhllIqUZ0Sfvdqh7ihEQcIGQU3mcW1F73OF5O9+r
         q4xkBj5PSHlpOJmCY/0ziNEogHQy3R76MPtP9r4pagVgadrx5cTaXPz5MgtKQQ/DMjm8
         vbLakztuH2pfuj+74HjliZUkINirCkJDqaoXZNHJ9riZ+RS84RUPLwbQXzPGW2erhE/k
         0aQX53D6hTos+FADhZ9zfx3wvJBlYh1Gz7b4OWfPYR6fKXr29IEPDbjkMhBS4KzBo4HU
         LvPRcef/nN2BTkxBJ5/so0IyvNkEqQkiDePTXcMBM0xbQXtzAoWDzLfaQhVpNw6aCbKN
         BAxA==
X-Forwarded-Encrypted: i=1; AJvYcCWCKEH9mAPTQ9WJxmzJLoCgkuLO2J1etgZdX3X48II2zWRmX5kVtDL0SF90teGSccD/v+vqjNdvkiNi4PB/@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvepg9O3RHA5ZKqrMz54/5YFzs5RHwH1NODeTWIN6EXjdTlbU
	KAOd69XxJd0soqHgcXgixy1kx/SJlTL44FlRXkoNSWOdX7gvmFaxzecwM9cD7VlF82C/ugkacfh
	kxhVDTrcWxz1XAJSYnb7MneP27ZQnTFA4MbR9cy54a+NRNE0O5k1JHK7qkRCQjWVf3MecJbClp2
	GGaOz6j7okVYafNYkyJVAMqiV6YkL63y5KqZrq9z2nUBU=
X-Gm-Gg: AY/fxX7r8Gp7vFIoMydFg1hSCm5HdIbyiS3ztH2JfHbcn47SD+fl5gthybVCPTELlRz
	mvN26Z+Yre+xQyyu3STb4yaMR/LN1u+LIABaNicgtAYhEW9YK32N9l+7P1XoHe6B77jCWkHemdX
	vu6CWz3lsaydsaa+YNhX4XbCDtyBtwJojjDJvTjohTqcyJRCNOFQxILxMqlNEXJzWy1w==
X-Received: by 2002:a05:6808:2902:b0:455:ee1f:e1c3 with SMTP id 5614622812f47-45c9d6b8fccmr1377676b6e.13.1768588344652;
        Fri, 16 Jan 2026 10:32:24 -0800 (PST)
X-Received: by 2002:a05:6808:2902:b0:455:ee1f:e1c3 with SMTP id
 5614622812f47-45c9d6b8fccmr1377653b6e.13.1768588344235; Fri, 16 Jan 2026
 10:32:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com> <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:32:13 -0800
X-Gm-Features: AZwV_QjH_LAJrQbB9_T-U4SXhnS2PgPmgjjp6eFhzSG2zqHvjXMmhiR_pWC6tNs
Message-ID: <CACSVV01EiCmG=tLH=UOyHUVeUVnQ0X52OUeOAmXHFvRfeuj2JA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696a843e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d94RvPs_YAZp7DxcWNsA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: fBJxM_c-jGBQgGre0EtAj8sga4OCXTGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzNyBTYWx0ZWRfXwJ061QE6rd91
 wFy4rHIO1fGMF9wOA1o1GBYjjv5pASGzNsVrWFdqz5ltd7IqfhEH4FrrIX63n5DfpUuAC6ZCZMb
 XmQtllTrgYqQJRIQUt+IJGC2bMZqPxKOej/Jj1ptcONtbyzsM9RwMgzEcpeD1YXnph8Yg6MVwCU
 GHJHhs05vfW/kh5EuJln0b27XKUlDbeH2NmMCHRgxsFpb9kmSfMMnLeaaMP8jCly75KVfbPCLo8
 6Yo01pemQS3fHcL0G3SCTksQOV5tpk30ekXkmE7lWKD+efb3CoOhFiUDNxsnLSXLMjKeC4jydjT
 H6yC4IVU3jp14xHDtc4RoGBs6qoxWlpGL86GZglQBnm+0BXGTCd1ploUt6pczJYGAwmfnuyjw2C
 DyGGNQv2IvvY1dRU75CIWUaKBiABuRJacDtaO1Lo32dIPMyN9EimBRZgWTTQDQCbGad9oDfmscV
 a4sEPtnMXFIslESM+Fg==
X-Proofpoint-GUID: fBJxM_c-jGBQgGre0EtAj8sga4OCXTGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160137

On Thu, Jan 8, 2026 at 6:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
>
> Get rid of them.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------=
------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 56eaff2ee4e4..eba6e74d0084 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1728,7 +1728,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_dev=
ice *dev)
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct platform_device *pdev =3D priv->gpu_pdev;
>         struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> -       const struct qcom_ubwc_cfg_data *common_cfg;
>         struct a5xx_gpu *a5xx_gpu =3D NULL;
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
> @@ -1766,13 +1765,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_de=
vice *dev)
>         a5xx_preempt_init(gpu);
>
>         /* Inherit the common config and make some necessary fixups */
> -       common_cfg =3D qcom_ubwc_config_get_data();
> -       if (IS_ERR(common_cfg))
> -               return ERR_CAST(common_cfg);
> -
> -       /* Copy the data into the internal struct to drop the const quali=
fier (temporarily) */
> -       adreno_gpu->_ubwc_config =3D *common_cfg;
> -       adreno_gpu->ubwc_config =3D &adreno_gpu->_ubwc_config;
> +       adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
> +       if (IS_ERR(adreno_gpu->ubwc_config))
> +               return ERR_CAST(adreno_gpu->ubwc_config);
>
>         adreno_gpu->uche_trap_base =3D 0x0001ffffffff0000ull;
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 2129d230a92b..3a2429632225 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), prote=
ct->regs[i]);
>  }
>
> -static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> -{
> -       const struct qcom_ubwc_cfg_data *common_cfg;
> -       struct qcom_ubwc_cfg_data *cfg =3D &gpu->_ubwc_config;
> -
> -       /* Inherit the common config and make some necessary fixups */
> -       common_cfg =3D qcom_ubwc_config_get_data();
> -       if (IS_ERR(common_cfg))
> -               return PTR_ERR(common_cfg);
> -
> -       /* Copy the data into the internal struct to drop the const quali=
fier (temporarily) */
> -       *cfg =3D *common_cfg;
> -
> -       /* Use common config as is for A8x */
> -       if (!adreno_is_a8xx(gpu)) {
> -               cfg->ubwc_swizzle =3D 0x6;
> -               cfg->highest_bank_bit =3D 15;
> -       }
> -
> -       if (adreno_is_a610(gpu)) {
> -               cfg->highest_bank_bit =3D 13;
> -               cfg->ubwc_swizzle =3D 0x7;
> -       }
> -
> -       if (adreno_is_a612(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a618(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a619(gpu))
> -               /* TODO: Should be 14 but causes corruption at e.g. 1920x=
1200 on DP */
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a619_holi(gpu))
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a621(gpu))
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a623(gpu))
> -               cfg->highest_bank_bit =3D 16;
> -
> -       if (adreno_is_a650(gpu) ||
> -           adreno_is_a660(gpu) ||
> -           adreno_is_a690(gpu) ||
> -           adreno_is_a730(gpu) ||
> -           adreno_is_a740_family(gpu)) {
> -               /* TODO: get ddr type from bootloader and use 15 for LPDD=
R4 */
> -               cfg->highest_bank_bit =3D 16;
> -       }
> -
> -       if (adreno_is_a663(gpu)) {
> -               cfg->highest_bank_bit =3D 13;
> -               cfg->ubwc_swizzle =3D 0x4;
> -       }
> -
> -       if (adreno_is_7c3(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a702(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (cfg->highest_bank_bit !=3D common_cfg->highest_bank_bit)
> -               DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (G=
PU) vs %u (UBWC_CFG)\n",
> -                             cfg->highest_bank_bit, common_cfg->highest_=
bank_bit);
> -
> -       if (cfg->ubwc_swizzle !=3D common_cfg->ubwc_swizzle)
> -               DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) =
vs %u (UBWC_CFG)\n",
> -                             cfg->ubwc_swizzle, common_cfg->ubwc_swizzle=
);
> -
> -       gpu->ubwc_config =3D &gpu->_ubwc_config;
> -
> -       return 0;
> -}
> -
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
>         msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
>                                   adreno_gpu->funcs->mmu_fault_handler);
>
> -       ret =3D a6xx_calc_ubwc_config(adreno_gpu);
> -       if (ret) {
> +       adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
> +       if (IS_ERR(adreno_gpu->ubwc_config)) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
> -               return ERR_PTR(ret);
> +               return ERR_CAST(adreno_gpu->ubwc_config);
>         }
>
>         /* Set up the preemption specific bits and pieces for each ringbu=
ffer */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1d0145f8b3ec..da9a6da7c108 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -237,12 +237,7 @@ struct adreno_gpu {
>         /* firmware: */
>         const struct firmware *fw[ADRENO_FW_MAX];
>
> -       /*
> -        * The migration to the central UBWC config db is still in flight=
 - keep
> -        * a copy containing some local fixups until that's done.
> -        */
>         const struct qcom_ubwc_cfg_data *ubwc_config;
> -       struct qcom_ubwc_cfg_data _ubwc_config;
>
>         /*
>          * Register offsets are different between some GPUs.
>
> --
> 2.52.0
>

