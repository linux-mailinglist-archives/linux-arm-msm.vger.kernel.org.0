Return-Path: <linux-arm-msm+bounces-32689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB839888D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 18:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DC89B2304F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 16:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB761C0DE2;
	Fri, 27 Sep 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP5ZGoxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEE189BA3;
	Fri, 27 Sep 2024 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727453640; cv=none; b=lFQndIBq4JWD7SdEdR5iTamG8NzsY+DD3Iz8KrtY4PzvpJ9yunKV3qSv7Vt22OsWb+Vv43tyOJX82Psinet/Iiv9Sr0mOLTBtPMVLR/iYjJaZu7t7RPTye5HGNv6m6/LqvxgcfmF3mPNyG77WLqsbe2rLBcEyU+ro2uIV80Ayg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727453640; c=relaxed/simple;
	bh=EF0Av991yhny8U1gCitGfS/KZoWeWgh1qn4rm107pVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZZkM+0VTzdWTAryfyh4OLB0QEEFJqCZJhpVIDVdEsjOTzLiITI4hi6xc4FydzhQy+L3T9/YQz5eJATUfXQznYDdV2jpsVS55Tx6AAnTMpEI9MAQCvWugJ5UBAXq1bR+IWM6eIkCLIa3irundgDPtxserGI1yVqeS15ejF8bxcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP5ZGoxA; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a34802247eso4303835ab.0;
        Fri, 27 Sep 2024 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727453638; x=1728058438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEn58HecF0TosxZt+Dqr3/YCoDZ17RngyusZkdzm+yE=;
        b=cP5ZGoxAbzhhQ23j9BLRvkzsSUKHoIgqmoPuRs0bgnlsleMKHlie5aVbRzUqst+XeM
         dkkrSaeGD+zHVs5kDsCV2Gm5C89TNAoK7gedjKiPEUrc4+QYq5KaGnTgmH3nCEG5TveK
         /0ZG3ETge32+4CNCDo1DenJ4JDunRHon7lTblQEPPznqyWaSX/GBFcp2kPRuHzN54aC8
         OWvOpM4umHLT1CkJxkXJZW0qbZAHpuarMSxEKI47J0MYAjdwcFO0wq73RXvIZd9hcHMS
         LIwaXNa5ak+jmrqf34Xgk6BxWdVT7D7yuvqhUDsIjGy5mXePRfoxe5WKHw4VcFF/PJYK
         51cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727453638; x=1728058438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEn58HecF0TosxZt+Dqr3/YCoDZ17RngyusZkdzm+yE=;
        b=BzIOb8c3yDKWhnzgVrh/8ysbilF1Eo106NPEn/7+mwKxqf9mAoDye32sj7wneX+pJe
         chJYelNLUfugjDu2RedWsO5syYPOiRsSP/NrCquNxYIZegZwSm19M4+hJWkNNZC9gGTQ
         yMyyFzlB+eo15x2+F6P2CnN78wc2cH+oeMSiUIOlPryliqD87WcXcg5446DHIl0W0sFo
         9fVwqomMCjDrWRHKgN3FN+gG27H7bQp/BLkF2LqRmBCDGVqcJREDwmhpF+XLRNZO55cy
         1WergmpxMsmkFI6Ox7P6E7cnL3KBhU/GQbzQqKJ7ApIQ6pZUOc/DZfPDCd16HpcgQ5+Q
         emlw==
X-Forwarded-Encrypted: i=1; AJvYcCURMmVjwQwp77sXixQk5sVHZBAI+uH9ikXa1qciimBkwwvzL9v2J+uVPXnzUirjXCAGh4koo+1C3k/5d+wg@vger.kernel.org, AJvYcCUSm6jnMEKFvEcBM3erPE4yzfPkt3NKIfQqqDYFZpEMVMFl6LE4TbguHUPfQQjtQNtRAI02mz142Urr@vger.kernel.org, AJvYcCWajmeO5PlsPIspDfA5SYuRXpt387F0oqdANZHKBVYwGimb0HzGoqf7/tlL4X7KIQ7gamuhgMvpS47hz08f@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8sP9jYWi2Z7reGnB6kZPjS8A/6LyGLZZzv+lK3RIdNJuzK5V/
	vsQIUAuE/dNYdug6x0ux3/jzxNWlWkW0Ec67ituOBN0q8tfV3a1f8gudPFpVBgu/gsHdWowR56j
	SrRxzTiaVzFJ/9lJglJ6z8HyGWUT5jA==
X-Google-Smtp-Source: AGHT+IG8J8ayTBM0SIM96790nCwHY2riAMEY+VMgtSqhHWVj3meExklYvjvN+tePgujrZ2Yd48FUNnuFRhUvZao5JCU=
X-Received: by 2002:a05:6e02:1c8f:b0:3a0:a385:9128 with SMTP id
 e9e14a558f8ab-3a345169251mr36411535ab.6.1727453637742; Fri, 27 Sep 2024
 09:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com> <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Sep 2024 09:13:45 -0700
Message-ID: <CAF6AEGtgSCpsOvikwEchyLhT3mnA38oanLGgbBvJVPhaFa+M2g@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 825 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index f5e2838c6a76505b353f83c9fe9c997f1c282701..32e915109a59dda96ed76ddd2=
b4f57bb225f4572 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,6 +23,7 @@ adreno-y :=3D \
>         adreno/a6xx_gpu.o \
>         adreno/a6xx_gmu.o \
>         adreno/a6xx_hfi.o \
> +       adreno/a6xx_preempt.o \
>
>  adreno-$(CONFIG_DEBUG_FS) +=3D adreno/a5xx_debugfs.o \
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee28=
7912271c353402a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>
>  #define GPU_PAS_ID 13
>
> +/* IFPC & Preemption static powerup restore list */
> +static const uint32_t a7xx_pwrup_reglist[] =3D {
> +       REG_A6XX_UCHE_TRAP_BASE,
> +       REG_A6XX_UCHE_TRAP_BASE + 1,
> +       REG_A6XX_UCHE_WRITE_THRU_BASE,
> +       REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +       REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +       REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +       REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +       REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +       REG_A6XX_UCHE_CACHE_WAYS,
> +       REG_A6XX_UCHE_MODE_CNTL,
> +       REG_A6XX_RB_NC_MODE_CNTL,
> +       REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> +       REG_A7XX_GRAS_NC_MODE_CNTL,
> +       REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
> +       REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +       REG_A6XX_UCHE_CLIENT_PF,
> +       REG_A6XX_TPL1_DBG_ECO_CNTL1,
> +};
> +
> +static const uint32_t a7xx_ifpc_pwrup_reglist[] =3D {
> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> +       REG_A6XX_SP_NC_MODE_CNTL,
> +       REG_A6XX_CP_DBG_ECO_CNTL,
> +       REG_A6XX_CP_PROTECT_CNTL,
> +       REG_A6XX_CP_PROTECT(0),
> +       REG_A6XX_CP_PROTECT(1),
> +       REG_A6XX_CP_PROTECT(2),
> +       REG_A6XX_CP_PROTECT(3),
> +       REG_A6XX_CP_PROTECT(4),
> +       REG_A6XX_CP_PROTECT(5),
> +       REG_A6XX_CP_PROTECT(6),
> +       REG_A6XX_CP_PROTECT(7),
> +       REG_A6XX_CP_PROTECT(8),
> +       REG_A6XX_CP_PROTECT(9),
> +       REG_A6XX_CP_PROTECT(10),
> +       REG_A6XX_CP_PROTECT(11),
> +       REG_A6XX_CP_PROTECT(12),
> +       REG_A6XX_CP_PROTECT(13),
> +       REG_A6XX_CP_PROTECT(14),
> +       REG_A6XX_CP_PROTECT(15),
> +       REG_A6XX_CP_PROTECT(16),
> +       REG_A6XX_CP_PROTECT(17),
> +       REG_A6XX_CP_PROTECT(18),
> +       REG_A6XX_CP_PROTECT(19),
> +       REG_A6XX_CP_PROTECT(20),
> +       REG_A6XX_CP_PROTECT(21),
> +       REG_A6XX_CP_PROTECT(22),
> +       REG_A6XX_CP_PROTECT(23),
> +       REG_A6XX_CP_PROTECT(24),
> +       REG_A6XX_CP_PROTECT(25),
> +       REG_A6XX_CP_PROTECT(26),
> +       REG_A6XX_CP_PROTECT(27),
> +       REG_A6XX_CP_PROTECT(28),
> +       REG_A6XX_CP_PROTECT(29),
> +       REG_A6XX_CP_PROTECT(30),
> +       REG_A6XX_CP_PROTECT(31),
> +       REG_A6XX_CP_PROTECT(32),
> +       REG_A6XX_CP_PROTECT(33),
> +       REG_A6XX_CP_PROTECT(34),
> +       REG_A6XX_CP_PROTECT(35),
> +       REG_A6XX_CP_PROTECT(36),
> +       REG_A6XX_CP_PROTECT(37),
> +       REG_A6XX_CP_PROTECT(38),
> +       REG_A6XX_CP_PROTECT(39),
> +       REG_A6XX_CP_PROTECT(40),
> +       REG_A6XX_CP_PROTECT(41),
> +       REG_A6XX_CP_PROTECT(42),
> +       REG_A6XX_CP_PROTECT(43),
> +       REG_A6XX_CP_PROTECT(44),
> +       REG_A6XX_CP_PROTECT(45),
> +       REG_A6XX_CP_PROTECT(46),
> +       REG_A6XX_CP_PROTECT(47),
> +       REG_A6XX_CP_AHB_CNTL,
> +};

Should we put these in a6xx_catalog.c, in a6xx_info instead?  I guess
they'd differ on a6xx if we enabled preemption there (at a minimum,
the # of CP_PROTECT regs differs btwn a6xx sub-generations)

BR,
-R

