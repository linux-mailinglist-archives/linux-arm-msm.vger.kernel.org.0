Return-Path: <linux-arm-msm+bounces-57318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D29ABAB02E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8DB189AC4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78405207DEE;
	Thu,  8 May 2025 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlsycKxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B94B1E7D;
	Thu,  8 May 2025 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729202; cv=none; b=W94+jBIU4BThsKWq0ZBgCLkHnoZ0vZuh3KABBcMXD9wGlCaHILeh4/WShP9xWc38hcIpUdCRyKJT6l84/2puBJ8YwALKoQSeP5sXlbT+vqSIqimcV8pnfthCeEqBSqZUB9HoANjL1F1vHPuZK493sJ4CNDgyfVdRtZDyFQxRFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729202; c=relaxed/simple;
	bh=JOcc+M9rOvZ1c35pE9SCvCiacPbTkjMI6AluzJW0xeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CASH50w7AjBxlLRAPYRUr9o1gO75ZxbhupMKRPO3jUsRuhVZKKacP9icyUCH524cRV3lPDWdRodji7uvXjZ+P8SE/WELZa4hB1+3MsjyTypXSEGq87OQzkIUia9ZeqsjLfkQSHEGYaea8P23E32TPeB+59PjGn0SLpVWyhLMnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlsycKxc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30a892f8124so157983a91.3;
        Thu, 08 May 2025 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746729199; x=1747333999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FQJhUt0Xs5KmiFJABZgU0fKzpM3sDlbu/it07qeVBQ=;
        b=mlsycKxcF8Pg2BcgDOnKZQqQaS/u6EZP+9530Gx9qvWlO1TFL63NAOtOxTELlRw07B
         BoCT3kRNSgn1QmuaUyCNDhBu8mo5tVGvZqldxeFnbpSR98hR2IG6bIQEXyYg77XkbxVu
         1m3urNIMCkyJS72fD1YFw3UAp8IA9GSItQ9D/WBnUWNLSf5N4pGxVNUDXYaAo8GZg/1E
         cNv8Ym5Rm2bmt4LVA16ZhKX5bDHDWiUf/EhK4ah7Gqz9vQ3jbisESk0hjpMuoYXWYOfG
         FKVLc6rYgkNjIUiszH2JvDymvfY9HZeS2fiBwRIUCnWATX4ORTq1p8R3hdWwBwKfkjE2
         Huow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729199; x=1747333999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FQJhUt0Xs5KmiFJABZgU0fKzpM3sDlbu/it07qeVBQ=;
        b=Wt9wSfPcApjmC2YL9w/UKRu2TAISd+uQqOu3yCUROXgi4zTu+tTF6gKvWRpTMCoUxv
         b+4eyQvCvxqYSOW3QC40rQSZetiGWJjU9C6X6D2vO75FkVhWPIaNo8nDMQTZyiFMeIG6
         RDPgN9SjbAdIF38ccgnZTTn2SlC6jK6Np+FDTi7Nb3LwOzI4gjNv9ri41KFWPXBiKh1H
         wINysYc2JgUy+EwtRTFRokH1m/VulDYlN3N556+NMjyR8yp7KA4MUcx814LayfyL9zM3
         BNeOxKpaUtc6rLL41J7zxOykDO1PVVN0nnQBxecC/Uk9C0j1tsNVoITGdVb0Njel2xz6
         ORUA==
X-Forwarded-Encrypted: i=1; AJvYcCUXqiDv1KfEmXZqs1yQiMpYai2QXK2RpOO6XOWb4hdkPiCn4s0HJXm1p1bAnv4bDDnC2qK4yFVkUkjZNACW@vger.kernel.org, AJvYcCXBSyy7K0DNtYQ9MKCggg+5YgZ0Q8yzbBSAVrqfiekpTRghS4HKJqmOCdMAosn5Oda49yMnQwJqAydZpinY@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjfInwtwQz3XR7EXugmqlKWQk4vJj7rdRjBkSrLayFovrYbIY
	lgkkvILQ6/qfXElVQJT2EkqMT3luutW1qYwb1qh66AqhEze9jXXxU1mkV6hgP6OcXu19CcjSGbr
	dZXlblhD/giBcQ6iFrFlNr3bLKPs=
X-Gm-Gg: ASbGncvyQn/LlN2nat4x81cM0g0Iw6asdMIefLB+uWD5MoUH5WYsZw4GBGYLp74K+2c
	YnHPuy4zqBNsR8zq7Wu7kxGUBPeYc0K7igRS5Gd83XrA1RHWRpsTjunQbe26gfr66oYpwabtVI3
	2kw8XuxX3uAE5jBRrNSvUjtg==
X-Google-Smtp-Source: AGHT+IHpUe5YqkWw0UFJtqeULReAr+4JR57SpZTyi/DJlRlRiBws1wPRXwVJgzIDpy8odTqgv5arRpEHmEIb9VOXibA=
X-Received: by 2002:a17:90a:e7d2:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30c3b909b29mr304390a91.0.1746729199120; Thu, 08 May 2025
 11:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 14:33:08 -0400
X-Gm-Features: ATxdqUE2vLeH_1fBevqnXZeORD_v0wWgDms-Rnd2Lz_3k2tRIEmXBn1VABvu08w
Message-ID: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode (again)
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> SC8180X (A680) and SA8775P (A663) require a write to that register,
> while other SKUs are fine with the default value. Don't overwrite it
> needlessly, requiring the developer to read the value back from
> hardware just to put it in the driver again, introducing much more room
> for error.

I'm not sure I understand that last sentence. The original reason I
always wrote it was that for host image copy we need to know the value
of macrotile_mode, so again the value exposed to userspace must match
what's set in the HW. We can't read the value from the HW and send it
to userspace, because userspace queries this when creating the
physical device during device enumeration and we really don't want to
spuriously turn on the device then. That means the safest thing is to
always program it, guaranteeing that it always matches. Otherwise we
just have to hope that the default value matches what we expect it to
be.

I know you're copying this from kgsl, but kgsl doesn't expose the
macrotile_mode to userspace. I expect that HIC was added afterwards
and only works via hacks there (if it's even supported at all on the
relevant SoCs).

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 60f89a2d851a5c383fc14cce4c483f630132a9a6..bee7e9685aa3ea282fb20ef47=
9e4d243d28418f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -594,7 +594,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> -       gpu->ubwc_config.macrotile_mode =3D 0;
>         gpu->ubwc_config.highest_bank_bit =3D 2;
>
>         if (adreno_is_a610(gpu)) {
> @@ -616,13 +615,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         if (adreno_is_a621(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>
> -       if (adreno_is_a623(gpu)) {
> +       if (adreno_is_a623(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
> -       }
> -
> -       if (adreno_is_a680(gpu))
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>
>         if (adreno_is_a650(gpu) ||
>             adreno_is_a660(gpu) ||
> @@ -631,19 +625,15 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x4;
>         }
>
> -       if (adreno_is_7c3(gpu)) {
> +       if (adreno_is_7c3(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.macrotile_mode =3D 1;
> -       }
>
>         if (adreno_is_a702(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> @@ -691,8 +681,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 2=
1);
>
> -       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> -                 adreno_gpu->ubwc_config.macrotile_mode);
> +       /* The reset value only needs altering in some cases */
> +       if (adreno_is_a680(adreno_gpu) || adreno_is_a663(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL, BIT(0));
>  }
>
>  static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>
> --
> 2.49.0
>

