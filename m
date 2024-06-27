Return-Path: <linux-arm-msm+bounces-24532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8091B13A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 23:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E7C528302F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E4A19DFBF;
	Thu, 27 Jun 2024 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAeI6JIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE52139AC;
	Thu, 27 Jun 2024 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719522834; cv=none; b=ok0fz+tk6RZhlMLtuI1QUDkDQT3gasyLLLDd5oDMFpnImcKIXiz+GJ5zOUnPq15MqyrOQSC35ZjCZJUh7p2m89uo0GxvpeoZLYr267dpciyJLuASL0AewiHVKBNvv9/mnUQ/eRPvntml+5Hl7cJJjfPEPP6ZoSCrUnJ1/53BTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719522834; c=relaxed/simple;
	bh=LnSiqNX+hbITWwyhDinv1ziWqNgSM3Thc9hUA+Mf0l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhMwTfiBYNQdNnXI/gEYwNBPsfTSd/GhmHW+ctlvHiWf3SoolGn6NI9FkuhMfl3Aw4Cr8MVpioH9iuKHCedsSCJryYvcpxSC5oRg92mvExQE5j7BR5EUUbrrVgUZM70X7k4KTfiCdgxNjpbRFxvFRaRv/ltuSQVqaIUwoBk8x9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAeI6JIJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d106e69a2so696567a12.0;
        Thu, 27 Jun 2024 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719522831; x=1720127631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdyLy6/EC6n+nWMktm84sF7VQwRPczuMD4vDAUu/UKA=;
        b=YAeI6JIJeuTIN3cl9A/yCqfHYZAfLKbHw1wwcqxqY8I9ZstNHDGNaxS9uMvKB1f70X
         o9jbhFfaMaC/7SgobXacr+YfCyTIaQ20txpHC33nYYPtJTqpoWiTeKxZ3EQ57w6lV3uu
         +N5e6OlwA+OyPD5sugMuW9x7SDLYxfCvitWTmgaZYtejWIplQWeD40PttnVny6TFkHIH
         PO4WIxW4VZgmKkZyScwGgSpX8cSl9GCqinrGP9F7gJQv4x9zX3+lsaDyeQY5zMBmJ9RI
         IOgnKDpxFNatygLixoVGJonSKTVoUbI+5QaZmlabY2r2EFQtVekzuKcSRymVr+3wGCiV
         ojjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719522831; x=1720127631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdyLy6/EC6n+nWMktm84sF7VQwRPczuMD4vDAUu/UKA=;
        b=mIrlBAvKDPrwhhfLS3qgtEAr0qEbxv4K9BeeCWe5d9rpDigC1I2Cl3RV8Wbh02NOzb
         UDLR4ondNxXIE7Zf5Sx2dY1/nYToXpEaBfnL5yUaFfMZN1MICLjkECYH1qLR+MGkiTej
         LtXhb+0cqgLQJntO3JcUo2e+DjXB4IrhzyRIGVHUzVECPLmHXjejKQpbnnfP/cT7thsE
         Lm+IgYyxRRkZKfA6HX+4swKLx9OS4R8JgLw1A4+JfytkceQsOqWz51MYgo8f0zsqS/es
         AhqzdD/6OXrEveB0xwUiQN9CnLc2z7qnHx1NAWlZNCWMESzvu4/peoLSbY1x1KN+lSG1
         OVYA==
X-Forwarded-Encrypted: i=1; AJvYcCW/mJZiVNv1mrxXq/fktsWCwY6Hdb/QxtdoXKr9kyLDZ3zd5boRSqzrMmKo55ab19rXctAFMBZMFWtyYwVsG32r2Pc4NkpJPISsAVllnXsD9bZnFquef1RNcr6ASH4pvxl6Mf+HEZyeeuM8tA==
X-Gm-Message-State: AOJu0YwC1cK5vZaSoUi4y6sgcpqLJgVEbvn24taZJQkEVDv2qoyg+TNS
	m9XKjDMCSPOkPBNZIqMQLHtl2DJSDS0IXUJqMAhNY+YmHckMsBxnsm2w3ZyougCJnbeH4fLZ7IV
	/JwdNDzwGW3k73NURhVD/iAe6BQc=
X-Google-Smtp-Source: AGHT+IF1DmPpmZoGMqNyD84MEzafXnIe+fh//3HqVzkuJ6xtrDVjUhmfm2mBoN/JpPHZG6+S6iR8Ztks9DhAPiT79Zc=
X-Received: by 2002:a05:6402:12c5:b0:584:66eb:7e76 with SMTP id
 4fb4d7f45d1cf-584bbbf39bdmr2468214a12.8.1719522830484; Thu, 27 Jun 2024
 14:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Jun 2024 14:13:38 -0700
Message-ID: <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 1:53=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> On QCM2290 chipset DPU does not support UBWC.
>
> Add a dpu cap to indicate this and do not expose compressed formats
> in this case.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/dr=
ivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 3cbb2fe8aba2..6671f798bacc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps =3D {
>         .max_mixer_blendstages =3D 0x4,
>         .has_dim_layer =3D true,
>         .has_idle_pc =3D true,
> +       .has_no_ubwc =3D true,
>         .max_linewidth =3D 2160,
>         .pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index af2ead1c4886..676d0a283922 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
>   * @has_dim_layer      dim layer feature status
>   * @has_idle_pc        indicate if idle power collapse feature is suppor=
ted
>   * @has_3d_merge       indicate if 3D merge is supported
> + * @has_no_ubwc        indicate if UBWC is supported
>   * @max_linewidth      max linewidth for sspp
>   * @pixel_ram_size     size of latency hiding and de-tiling buffer in by=
tes
>   * @max_hdeci_exp      max horizontal decimation supported (max is 2^val=
ue)
> @@ -354,6 +355,7 @@ struct dpu_caps {
>         bool has_dim_layer;
>         bool has_idle_pc;
>         bool has_3d_merge;
> +       bool has_no_ubwc;

has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
you wanted to avoid all that churn..

How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
then we know there is no ubwc support in the display.

BR,
-R


>         /* SSPP limits */
>         u32 max_linewidth;
>         u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 6000e84598c2..31fe0fc4c02e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1341,10 +1341,13 @@ void dpu_plane_danger_signal_ctrl(struct drm_plan=
e *plane, bool enable)
>  static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>                 uint32_t format, uint64_t modifier)
>  {
> +       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> +       const struct dpu_caps *caps =3D pdpu->catalog->caps;
> +
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> -       if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +       if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED && !caps->has_=
no_ubwc)
>                 return dpu_find_format(format, qcom_compressed_supported_=
formats,
>                                 ARRAY_SIZE(qcom_compressed_supported_form=
ats));
>
> --
> 2.44.0
>

