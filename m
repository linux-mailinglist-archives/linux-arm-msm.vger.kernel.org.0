Return-Path: <linux-arm-msm+bounces-53666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23DA829C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979197B31C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C525266B56;
	Wed,  9 Apr 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTdF9M8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC841482F5;
	Wed,  9 Apr 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211566; cv=none; b=ZiG/rimj/lz9rjXYWqpA/plMfHqPAclvyemrdySfMnvfPj8raxv5qEWs+rTYuQKI+1bxP8bN5FXUB1tQYgFu4axqECFBLiXn1eZLxitq0xCzV2+R7xzAtWtJgL82mKVaYsVlUPLaDz6ygZtWS55RZPulZGtkeb2Ujdw7QRXw59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211566; c=relaxed/simple;
	bh=vu2exUFThJwbvoVqWPV9NMmJKB0SNuLELwxV1uAi9N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgqUFdQbBRl2M36iTy5sKYD6z/AxpEAbppYjuGojWALYuYEiTIOI6iKZba3SwsIBUCDk7sUmJx8JKhbimCNYg+qB2dyJ9eljvs+cbH4YMxYXgF7c0QFEyc4RXCYLHRPm52gN2NdTt0mul9hMCsMNMKczRnoOhWookXg24ABOkqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTdF9M8r; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso636611b3a.0;
        Wed, 09 Apr 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744211564; x=1744816364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spXIMkoF1Z09BVLFL9QdSknj0ntJh/yAq4L0FidyZ90=;
        b=RTdF9M8rqk8EtRykJWwbrhflSXRWPCVk/F0iHzSuJXsoVk2CYUJE2pP8A4uXlbdb+h
         qUqAWvc4Z1DDBx4obYB3nNwS3cSAIM8Kd+BZHaJKVxhCfPXs6glY0tUh8oDU4LkVsX7L
         sORUb9Vrttkc9xhHg/KMO2vpVJLBVZwS58pAsQAMTAyERQLRYf/+2wuIXBUiyWZqDjb6
         N4P4h/tQ+nvET9V6jF7mI/6lstYWLTOJyKXJ9rxY1seQm2h3KpwDf5ASeE0hgGq/xfkU
         BM0cOZmUQgyrDFJUGJd0asRry7+E40Y8FpMcj/S3BDrKxa22Cmg+3VW/1SS159IfOYlQ
         yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211564; x=1744816364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spXIMkoF1Z09BVLFL9QdSknj0ntJh/yAq4L0FidyZ90=;
        b=uRoY8TqETWJEZU8KLRoZvRxoxrgobsY2FkyygOdELDmK9u/Fa+ZrugulDyzVtN8usN
         5oktAp9WJNWPvw8mRWJeg7uP9iiXup2EwY83ISQpJU+JFjHyDiFChP7Gg6MAmA7MtYsm
         JL7V8WtQAwtNAQ2iPS8V3Iqt2OKtHaVpE5GLhudiJQE9dc2EUGhl4Vww8VaX04SOtilD
         Qe10k8wYWKlgd+mNe6+Of1W2EUgsTEW2MdqQkCO95S2hqkwxy1aEn/YbZTqsB1g90J99
         ozinZ8dnyrUm8JhNGJkcHQBopNAdr+G1sTaNoUmdTUB7STq4AhYGuFOl+d0+vH+ihAXc
         fswA==
X-Forwarded-Encrypted: i=1; AJvYcCU+7ej9mnPvDUzD+qCpmvADmreGE1OMokwxYwVpNkToAvbPEi/5bQDeEYiUAG9V0m5NaO0sKszuASAlxyrMxujd@vger.kernel.org, AJvYcCUhanjA7ZZUp4oE4LykdBBpZ2uzF4Sj/S9KZtfPqyNHsZJGLh6CV0aiYclWuWM61i36j+WR5AAB8T0Z+uEc@vger.kernel.org, AJvYcCXMvNEgNybanVVp+Abk7jJ9Hes36/m5w/FBRZenqU8z0t9xgFN6owsezA/TAtorQqzKIQFMYJPm3rhkLeck@vger.kernel.org
X-Gm-Message-State: AOJu0YxCL2yAEaCGC/vkeKPOyn/6S02BBay8aggmjq02zEQeT5UrwxdT
	ID3fXA+7ZLHJatXnFE/IjkEFmDfYdq4hIZj6ev80oa6Fgj7OMOQzWtbVu6FOwDMGuQcRc7vO9l6
	HLJmiEiPkAQpG9H81S05ut/jfQtk=
X-Gm-Gg: ASbGnctTp67n5n5eRWRKWU8D6Y/IQnEKAUjFhompe+BWWfXgJ6Fdpz8R8q5VECIKum3
	8m065KPm76kNvq1N98pHSOw66T2N27sSkCHuWeMFcHoVTmNrWWdl3zxd1Kd8QZEECQt9WEV/hwg
	wyXdMz82TYfKS8hlJyfovaMQ==
X-Google-Smtp-Source: AGHT+IGmvjw/CZ0ahGJko3AXY/wq4QVFoHwj3QvuU8T+/npoxIO1lkE99naDDV8VaKBZcMlrX9YQHA07xRRq12EhXRk=
X-Received: by 2002:a05:6a00:3c96:b0:730:8526:5db2 with SMTP id
 d2e1a72fcca58-73bae54fb51mr1430135b3a.5.1744211563880; Wed, 09 Apr 2025
 08:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com> <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:12:31 -0400
X-Gm-Features: ATxdqUHV6LVmuZ52LZQ7mUM3HFrIL30_gejAbDkXbhXaGiKJi8H-XzjJ57AVTyE
Message-ID: <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The Highest Bank address Bit value can change based on memory type used.
>
> Attempt to retrieve it dynamically, and fall back to a reasonable
> default (the one used prior to this change) on error.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d02=
65ad9223e8b55c7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -13,6 +13,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
> +#include <linux/soc/qcom/smem.h>
>
>  #define GPU_PAS_ID 13
>
> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> +       u32 hbb_hi, hbb_lo;
> +
>         /*
>          * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
>          * allowed by hw) and write the lowest two bits of the remaining =
value
>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>          */
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> -       u32 hbb_hi =3D hbb >> 2;
> -       u32 hbb_lo =3D hbb & 3;
> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
> +       if (hbb < 0)
> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;

No. The value we expose to userspace must match what we program.
You'll break VK_EXT_host_image_copy otherwise.

Connor

> +       hbb -=3D 13;
> +       BUG_ON(hbb < 0);
> +       hbb_hi =3D hbb >> 2;
> +       hbb_lo =3D hbb & 3;
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 |
> @@ -2467,6 +2473,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>         bool is_a7xx;
>         int ret;
>
> +       /* We need data from SMEM to retrieve HBB in set_ubwc_config() */
> +       if (!qcom_smem_is_available())
> +               return ERR_PTR(-EPROBE_DEFER);
> +
>         a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
>         if (!a6xx_gpu)
>                 return ERR_PTR(-ENOMEM);
>
> --
> 2.49.0
>

