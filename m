Return-Path: <linux-arm-msm+bounces-89543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE13D39933
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 19:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0AFC3001183
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 18:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FC23002BA;
	Sun, 18 Jan 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV27rbYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g67BqGOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB9BA34
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768761494; cv=none; b=oKkIBeTPN2xLSuv8fWAsqEuOAs6mgwk2T710qR7AF17kn+/mXt47xlZuuopuYVqnO2xsiofzRUEgyhe/5CeCG9s510L42LiYZ+it92HJYZVOOLQDrWDhhLa0TGhFAYpl37o34+UIyotxWvdzlSkhRlrpVTjV9Bd2znGGtDjD2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768761494; c=relaxed/simple;
	bh=fap6q+lV+ndLCOlD0LNxdpd0P9dPjJr3wz7qo5n2L4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVqv5v5nKAKRz46K8VM2g+wWzlzhNVgEJyDdKWDW1QqihG0an9wn3N9OjJa4ejn1I++2tXp5lgRY+SGTAJOke1uxnqf+gVJGVbBDt3aaCQvCvO4ginXlGyUha4Kx1JVt7Afq28kjGwFJehpcq9M6t0qG2IxPKrh2gnL2mmsEYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CV27rbYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g67BqGOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IBKjRt3010904
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 18:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=; b=CV
	27rbYXPYZl9F71kuekp78woUOTLY3TMuwn0+byQ/155TQoShTdu3oayFm0g7Ce3A
	lYQ4qJVIwVLHQQs4K0NWmlJR7bbaCzT5lsPk5C536S1woy26gx9VjGGLPCIykNWD
	31RmkvnXio96b3FF/N1UkQxUdFgjn6gkJx81mMtggyCJlvQMH1KpBdrApG1TRpdb
	5VCiQuLugM6C6HgBgYE1AZ73Ees852ZEr+hJUdxsRaumduFtFv0RpQQhD8j8izLx
	PbnBUPTtSku7XGxw8cYl3Iw1lcT++kGZF+jKlbkiY8Axcua/QoVSk44xvowz5D+q
	jBZob4VY3c/INJ1FcJMg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gujv6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 18:38:11 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45c7dc03e6dso5312838b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768761491; x=1769366291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=;
        b=g67BqGOYvpe5mkwIHI6jwCoie0/PGkx4d0kOnIOtKliyge7sm/NYmhYAqrpZqmmPUI
         hkgwJwK960cuLDI02QWdzacr5ujy4z17dRuiafQ77piZm6UkoGY3Qz5y3Q1qyWab5n07
         Ch2+myDF5UekhxvlEDKQUHH84d4q725e0/jvRAdEuDofEFQKwWYPFip3heUInUUo/rv1
         nL1qfbLahHV+aXcDIsCDcRZrPg70ibtA9Zbgpal1HxRnVorlzuRyw76KFkWY8IDHRe5V
         YIzhMtQqj1Jws6I2o5De+yUQ03Vaa8er7qXl4h5JuTNQzarpRZ29Ob5E3diT7Xiro6X1
         +eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768761491; x=1769366291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=;
        b=Ghe0y/YBiPjutu1FdOnrPIqAGofWWVlKDBmBNdo1cDDXMLTuLHSeAOQcFVj2aXIX3Q
         HO0MugdSKu6KE6cDvBRHQO/OUvQtugdfikwuQ0C+dCOR+VdjV0CZ9F/GNPMGb7A26wVp
         Tro+7KDhjK0mk5Yrtor5yAf+08PvtHWyQTqRzg4vI9lmHCrU/COfkUhCW289INDBOk85
         61KOAh475ZnOUT34c4DL/ZoNMNeN/QgaFcJCU5ToYGQLvnZckdBtg0V6vOEP2BpghuN5
         2wKWshlPerrIYRXuNnOaLO7KF9jTK02/FVBu8Gh6koQHbRDDKidsHsBxkFibyv1BIPll
         QUbA==
X-Forwarded-Encrypted: i=1; AJvYcCUnwKT3hNzR0Q6UsluEelb41EMkkhw6UwrDVGnuwo77twu5rdjDRrEjAI2ZyVzVEpdO00CxO6NNUiowmGzf@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiVzyIC9mPoKedHskAuvd2aM7u5jSxi9XcrQusX/+vWgdST7j
	D1Gq+uyxCO103Wl1DZ/6aE7hlpP+lqWZQuYJFw9+cN2XJroPykZZ9BBPzXIr4XdrYh7FAMi+dke
	emdfbArA+k8P6cHUmTuqrvF63l5wpYogz7eCSqqrPtw3pS/pMFbmKioMITGVnYSiaBe0RST6S61
	k2U8WdY4pMi0khmQlPPbCUh8htWRTqDoU6/cUK8DLuxGYU/ZUtW+k=
X-Gm-Gg: AY/fxX61dgE+R6fDyBG+Ok+9XIokcV1Ai6/dCVbA3Fy0/d8QJ7FyrePVBX6xSPQl862
	4SOo7iaIZQbalcgH2FZsLmfKAtTszuk5E8FlZ7yPzyFqlLSv2AS+H/9wqLCms/scM3m6zAwl4xn
	ofvc64ODyXRhRcANmd0McM/DCvY/Zeeptfu14Ge092la4T4lE+yG4qIxLE1E3CsVIhfQ==
X-Received: by 2002:a05:6808:4fd1:b0:450:bd1a:19b1 with SMTP id 5614622812f47-45c9bf853dbmr4708165b6e.7.1768761491094;
        Sun, 18 Jan 2026 10:38:11 -0800 (PST)
X-Received: by 2002:a05:6808:4fd1:b0:450:bd1a:19b1 with SMTP id
 5614622812f47-45c9bf853dbmr4708156b6e.7.1768761490719; Sun, 18 Jan 2026
 10:38:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com> <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 10:37:59 -0800
X-Gm-Features: AZwV_QgKLlYDPQGFk2klj6r5W2bSSRNovXrFJIeJ0DKvvOwX1LEbt5gRB_dHw38
Message-ID: <CACSVV02muSij-mYodK9uXRbe0WYso4DW_43_px_w=FDmK0=V=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on
 UBWC 5.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MyBTYWx0ZWRfXzWuufSO5UNVI
 ckLPtVUuvnP+BauCn9ubqdboJqpJbP1rp6ZpN80urxQqPykJYuqiGV9ZIYR3ATjBbtr59Fmo8k1
 0H29TYMDFT0TnCWG963L68Y8PqMGoP4xZm6y5UBzjQnKFTE+T+TEQYj74KePw/NANyc6mdDrGs3
 riZjofXQvUb1DfvxFW+Ey+LXLVc2zWYA1QtiJd2yRU1ZLrqfxUOT4umUMVT5j5lt130EPVukLr7
 yQetDPVVY2252BTQM9fKf1x7GoGUNn4l+2eGe8QoqLKIC5nx9BBLjhxQs9iN7UKA4h5hdx4V/Og
 k+BszRP76QHwT4IV4ECnp/7uGuUFKZCLJCaUNdnugwv3arR1zH5+0R8Dg5tKvt+1/DcKrFTssMC
 mFzwpep0ZqT+hfiqv95r1MUc0mOKCFoREj4aDLBiHuYUGdxqmoLIgf4mVWiYedvv1W+C45zm+rE
 MBQd7wzgjKu+125XDXg==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d2893 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pSJFZ7BqxfWaFcy_hbQA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: C7CpooyEwWmL75Go0YdQMgUDKOqqMRDT
X-Proofpoint-ORIG-GUID: C7CpooyEwWmL75Go0YdQMgUDKOqqMRDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180163

On Fri, Jan 16, 2026 at 10:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 41 ++++++++++++++---------=
------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_sspp.c
> index a99e33230514..b0c97f5e47ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pi=
pe *pipe,
>
>         if (fmt->fetch_mode !=3D MDP_FETCH_LINEAR) {
>                 u32 hbb =3D ctx->ubwc->highest_bank_bit - 13;
> +               u32 ctrl_val;
>
>                 if (MSM_FORMAT_IS_UBWC(fmt))
>                         opmode |=3D MDSS_MDP_OP_BWC_EN;
> @@ -286,30 +287,28 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_=
pipe *pipe,
>                 DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>                         DPU_FETCH_CONFIG_RESET_VALUE |
>                         hbb << 18);
> -               switch (ctx->ubwc->ubwc_enc_version) {
> -               case UBWC_1_0:
> +
> +               if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_1_0) {
>                         fast_clear =3D fmt->alpha_enable ? BIT(31) : 0;
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       fast_clear | (ctx->ubwc->ubwc_swi=
zzle & 0x1) |
> -                                       BIT(8) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_2_0:
> +                       ctrl_val =3D fast_clear | (ctx->ubwc->ubwc_swizzl=
e & 0x1) |
> +                               BIT(8) | (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_2_0) {
>                         fast_clear =3D fmt->alpha_enable ? BIT(31) : 0;
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       fast_clear | (ctx->ubwc->ubwc_swi=
zzle) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_3_0:
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       BIT(30) | (ctx->ubwc->ubwc_swizzl=
e) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_4_0:
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(=
30));
> -                       break;
> +                       ctrl_val =3D fast_clear | ctx->ubwc->ubwc_swizzle=
 | (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_3_0) {
> +                       ctrl_val =3D BIT(30) | (ctx->ubwc->ubwc_swizzle) =
| (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_4_0) {
> +                       ctrl_val =3D MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30)=
;
> +               } else { /* UBWC 5.0+ */

Is this the same for UBWC 6?  Should we warn on version > UBWC_6_0?

BR,
-R

> +                       if (MSM_FORMAT_IS_YUV(fmt))
> +                               ctrl_val =3D 0;
> +                       else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but i=
t's unsupported */
> +                               ctrl_val =3D BIT(30);
> +                       else
> +                               ctrl_val =3D BIT(30) | BIT(31);
>                 }
> +
> +               DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
>         }
>
>         opmode |=3D MDSS_MDP_OP_PE_OVERRIDE;
>
> --
> 2.47.3
>

