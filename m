Return-Path: <linux-arm-msm+bounces-65656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E8B0A47E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 968361C27A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0972D979C;
	Fri, 18 Jul 2025 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laAO2FfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B2295DB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752843276; cv=none; b=CW0Z0KlFcULwVXtKEHSiLcRkkYk2N+60Tayazx90A23Wc5rwaqD15+ImE6GecIW8eVTwdq4oOOj/lTDvW0n1fABdqC1TECo0ol3hmCIJdlPSP6p7oy1NtEMgubuzanexRDLGaTNMALSM01Q67zyXCDcgn027ehL6PEjBRU5u1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752843276; c=relaxed/simple;
	bh=yp2EstEwCT4CoozvDcTIEBHxQStrdJQXxv9tuVf4OzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Abb+t/cMzJQugMzH2hi1b1lRBmjl2xREvcTVDqcdwa50+tjwooISUWMrw2xSJx/uWLgxblgsY3xlJyZqhC1zBaH9Xiu2V5RYw1L017eHKUDDPQ8hz1L6s9PznUSAX+bSImpRURgHaHjUa9kJ3T3nRl0SGU3D4f5k2/SO5TTEBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laAO2FfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6gWF6000592
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYv5+TMFsC7Y+uQecq8Wp1+t
	656E5JgsgS2DLSSChBk=; b=laAO2FfARndPJS57x45jBDT9UmQWhvee7N262jrY
	gde/QniBZLBK4+Duuoda3y8uN6QRPnkBY5LGLvNC3HEkFLI9btGkWAzvQ8yXFSer
	qCvHPht1JcuZDccnBfWNINrKMmXnPRJqu4kmj2lG8WIq8WQuYReEvZSiMP9jvnJF
	XqIDXsa18ez2XByo2DWWVbM+nfNcnudzwCMFbcyjvsBUBNHOLQWUsDJwXstQMKe0
	TkAngvl0wTBkG/pWTJznTb7Q1QEKnO3WG6M6q/ApXFtOFYQbyyZ3d4sVgC8F6F+3
	M1kS6akmyCp0HmeFR/EA3/5qP2Lcl0WU5qpqs86DdRLv+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drxk6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:54:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e2c8137662so352511785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843272; x=1753448072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYv5+TMFsC7Y+uQecq8Wp1+t656E5JgsgS2DLSSChBk=;
        b=lOyYnc3EmEBrXxoJzzYZRARRaNc5NCCtays7kt4JIYBzwj5IlSpLrI6LxJY1Gh+7mO
         XNi0tlpAm7zaDcihfNoyhpGSStinKpQ2lpO30Pp/FzhYQNYWrkagSoo6Z5PokRUf2fe/
         O195g0jPR7YiOmoCpQifrv2a7ZIYwutPvCePCpwMb8hH2oLxj3o665nSSQTo3YXY3UVe
         DKscMapOipCVIXgwaHqjxGZQOtCweT2SELP/ROVt916OyjCSdhD2o7Uyxk5Lk8jOwR5z
         B2DR7OhZ02MX8RL+tLHqTPKa1+lAbhKjIbFejZjzvlEKZwqWVgZhbrgT1JF3TrrWyQ91
         jwDg==
X-Forwarded-Encrypted: i=1; AJvYcCXT5o8oTiCMN7B4SM4m40G1L8/K594mRD6Sqyzv2S+o+Y20UoD+E0p851qQMsdt6b0XtQVUTvW+ca3ZpLxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvD61gEA6buK5yHWy+RkU6J8GwD5HAkdFZBpKJDH++a4B/VAn/
	py533EHFFS/MgEg1DFKylPAvmg54pUFqEdD7xk5r3KpF/ksoF8a+dqceeQaen9l+gMzm5zwXb00
	eLjDCmoOItMhoICbYvXWm56pJgky+wnRu53qusTNzu7vRBCjDHqaCJJuOy/wF6Yt6m61N
X-Gm-Gg: ASbGncu2lxqNDWgTFnNaIaFri6Hh3Z6ljjY9JMO45kAs55Oc7V/y3K/1w1l/uYOS5Ay
	EDaDYw8WckrDP3FLpfu5DxeKN7XYwrlJc7FpDTdJ9Gjo2usYNA1EPJIlB3oVop3luEPUH0J98FL
	V7STN6lOP9i3D9PEY2bAtiHsmeFrswfvECCz+DOQGC0yccwJzSaaMZuy8gKunXCPzeAyM4UrPdM
	KIEvu87i6CX3VOdZYb8Jq5ILYSUB5zSv5Zdt6Gw3v5ePo1dk9ebYo+7visXhvyiQYx8yoSignzw
	EWLLORDx3hioOs3i8sg4fr/aVCJKv1H75NMrjaiUXr7/R8976Na9pbtbm6ELpbN6UyrJ5fIqFWJ
	cI42SZwmRUnuf2KAp2m4UGhuh9ha4P2MBV5gdj3Ru/6D4yNiqos9g
X-Received: by 2002:a05:620a:8d83:b0:7e3:4415:8dfe with SMTP id af79cd13be357-7e344159862mr1014485985a.59.1752843271751;
        Fri, 18 Jul 2025 05:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlL7G+rWZtjez8FqYMyBmgx/fNiSJjpphmk7YNUHy7EXBZiFWEofOBfgRiW2FIEIVGsw0WNw==
X-Received: by 2002:a05:620a:8d83:b0:7e3:4415:8dfe with SMTP id af79cd13be357-7e344159862mr1014482685a.59.1752843271069;
        Fri, 18 Jul 2025 05:54:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c14acsm1926161fa.64.2025.07.18.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:54:30 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:54:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/7] drm/ci: uprev IGT
Message-ID: <7c6suvc6quwwxni2nsos65btzim2lbv7f2u6mz5qbupzpmpzgb@g46wg63ubr6l>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-6-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718105407.32878-6-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: Y-iDI9ikmJxaEqytr-advBtYWozylKit
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a4409 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=W7FfGsJSNGCcAvtv9TIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Y-iDI9ikmJxaEqytr-advBtYWozylKit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OSBTYWx0ZWRfX6kv1dWDzq1Lo
 Zkic7fwZTbtmNyf4+H3Bd2J8MY72R3FDQZ6hBtjebwW8pww7lOI2OnVHuM7OO3NQ9Hm7kivKqvZ
 YEDWuE+dfR22wMFqeAu7Th9ZbOBw1ybogNRDanDmC2y1ABPCVBIrvZXE2/GLOpmfYLhXcA3OYww
 UTInDqhg9CYRixY5khqZMEwC1MGtaYf5JZ9OMghhe1S/ua2d8r5z43Pexeb9HUltoQJeuIlP2RJ
 FkDghJUNEdky0bhV8kFEbv7RMPzZu76hOiCzCMQq0ON1v4npj8WyttdiQWmfGBKGu20eXtAPnNe
 /v2k+Hf5AX0MhnkVAbLRDfc8Sy85PYS9A/ZuwYn3QSu2ynMdH6xMn3Cl0zDagGg8d0jE926TXbj
 H9QQ/P8pUOognSucmTjZtti/p0/ebV6xWAEJElMSbOCXZLwcVpQQNWPA6y+3r7c8f2WDn3/j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180099

On Fri, Jul 18, 2025 at 04:23:57PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   2 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  11 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   2 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +----
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  83 ++++++++++++
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  10 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   3 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   7 +-
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   5 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++++
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
>  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |  73 +++++++++++
>  .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  12 +-
>  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   9 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   4 +
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   3 +
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
>  31 files changed, 416 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index e4a8f8352cd6..9bf38c077f8e 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -15,3 +15,4 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> +core_setmaster@master-drop-set-user,Fail

Could you please point out the issue / failure log?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index e4a8f8352cd6..7441b363efae 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -1,3 +1,4 @@
> +core_setmaster@master-drop-set-user,Fail
>  kms_color@ctm-0-25,Fail
>  kms_color@ctm-0-50,Fail
>  kms_color@ctm-0-75,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> index 8d26b23133aa..f387c73193c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> @@ -1,3 +1,4 @@
> +core_setmaster@master-drop-set-user,Fail
>  kms_3d,Fail
>  kms_cursor_legacy@forked-bo,Fail
>  kms_cursor_legacy@forked-move,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> index 9450f2a002fd..84ffbe0981ea 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> @@ -210,3 +210,76 @@ msm/msm_mapping@ring
>  # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
>  # [  229.758095] Memory Limit: none
>  # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
> +
> +msm/msm_recovery@gpu-fault

Hmm. I thought this should have been fixed...

> +# DEBUG - Begin test msm/msm_recovery@gpu-fault
> +# [  153.288652] [IGT] msm_recovery: executing
> +# [  153.295317] [IGT] msm_recovery: starting subtest gpu-fault
> +# [  153.317588] adreno 3d00000.gpu: CP | opcode error | possible opcode=0xDEADDEAD
> +# [  153.367412] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
> +# [  153.383449] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
> +# [  153.393296] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
> +# [  153.436085] revision: 660 (6.6.0.1)
> +# [  153.439702] rb 0: fence:    2063/2068
> +# [  153.443659] rptr:     360
> +# [  153.446389] rb wptr:  533
> +# [  153.449103] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
> +# [  153.455746] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
> +# [  153.462387] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 2062
> +# [  153.469293] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
> +# [  153.475680] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
> +# [  153.475919] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
> +# [  153.475925] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
> +# [  153.475928] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
> +# [  153.475930] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 1
> +# [  153.529587] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  153.539837] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
> +# [  153.549597] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
> +# [  153.566489] revision: 660 (6.6.0.1)
> +# [  153.570099] rb 0: fence:    2064/2068
> +# [  153.573878] rptr:     0
> +# [  153.576411] rb wptr:  688
> +# [  153.579134] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
> +# [  153.585775] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
> +# [  153.592410] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 0
> +# [  153.597308] [IGT] msm_recovery: finished subtest gpu-fault, FAIL
> +# [  153.599039] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
> +# [  153.611856] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
> +# [  153.618498] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
> +# [  153.625132] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
> +# [  153.631766] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 0
> +# [  153.639162] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
> +# [  153.648502] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  153.650144] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000020 dir=READ type=TRANSLATION source=CP (0,0,0,0)
> +# [  153.650241] adreno 3d00000.gpu: CP illegal instruction error
> +# [  153.671006] platform 3d6a000.gmu: [drm:a6xx_rpmh_start] *ERROR* Unable to power on the GPU RSC
> +# [  153.687278] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  363.495437] INFO: task msm_recovery:876 blocked for more than 120 seconds.
> +# [  363.503070]       Not tainted 6.16.0-rc2-g0594d0b01a7c #1
> +# [  363.508838] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> +# [  363.517142] task:msm_recovery    state:D stack:0     pid:876   tgid:876   ppid:274    task_flags:0x400100 flags:0x00000009
> +# [  363.528876] Call trace:
> +# [  363.531554]  __switch_to+0xf8/0x1a8 (T)
> +# [  363.535703]  __schedule+0x418/0xee0
> +# [  363.539486]  schedule+0x4c/0x164
> +# [  363.542986]  schedule_timeout+0x11c/0x128
> +# [  363.547281]  dma_fence_default_wait+0x13c/0x234
> +# [  363.552123]  dma_fence_wait_timeout+0x160/0x45c
> +# [  363.556947]  dma_resv_wait_timeout+0x70/0x11c
> +# [  363.561582]  msm_gem_close+0xac/0xe4
> +# [  363.565405]  drm_gem_handle_delete+0x74/0xe8
> +# [  363.569951]  drm_gem_close_ioctl+0x38/0x44
> +# [  363.574297]  drm_ioctl_kernel+0xc4/0x134
> +# [  363.578442]  drm_ioctl+0x224/0x4f0
> +# [  363.582050]  __arm64_sys_ioctl+0xac/0x104
> +# [  363.586292]  invoke_syscall+0x48/0x110
> +# [  363.590254]  el0_svc_common.constprop.0+0x40/0xe0
> +# [  363.595197]  do_el0_svc+0x1c/0x28
> +# [  363.598705]  el0_svc+0x4c/0x158
> +# [  363.602035]  el0t_64_sync_handler+0x10c/0x138
> +# [  363.606601]  el0t_64_sync+0x198/0x19c
> +# [  363.610465] Showing all locks held in the system:
> +# [  363.620406]  #0: ffff0000840200a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x18/0x24
> +# [  363.629412]  #1: ffff800080d7c2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x15c/0x57c
> +# [  363.643169]  #0: ffffbd9c0475d920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x18/0x1c0
> +# [  363.654158] =============================================

-- 
With best wishes
Dmitry

