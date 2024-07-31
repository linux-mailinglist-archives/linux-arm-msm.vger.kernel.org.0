Return-Path: <linux-arm-msm+bounces-27560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85249433D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2920D1F22B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2278C1B580D;
	Wed, 31 Jul 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2QltPbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F31BBBFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441929; cv=none; b=snyUa6HJ1kAwh1iBsoVECVlWGVpIrLSksM9hthu3okJ7h3n4lJOV9sevngKYmehQbnoo1QcToIFUVQ5HseumaFT1K2MU62QEoARPrnoa2tDqSPcvTLqi8/EJPQBybn5Hx9v2FjlAok6DQaQ/UaJPIa8WFCfO/lZMqOasOZo2Kwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441929; c=relaxed/simple;
	bh=o0U/AZOxt8/Fbro/OePuV8wuZfk5FH2BytJGx24x8fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=my9bmXU/KIpQsn3ClWZa7mTFRJ7BfXKoNFaHs1rQIxdGtsYToJCGPEbWor6UtBnOJFE18lZdUz7THXNwR/V8mb/tg7XsY8jloFEia6rP6YoFlC8Ik1NVODkzEBpBpH2Fzt107oTlr5aflYiyM4PAJYbGRrTVAqbJrjdcwYc86sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2QltPbs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc3447fso8085500a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722441925; x=1723046725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PK3XROm8AdCzvoF33BbXJKpI9sLb7+6gEw3RJDbeG8=;
        b=d2QltPbsYuPVUWDZejdmTYPgwladNPeukawFNNhCcsVBSsI+ePZfdpEV9JiE9xexXH
         E1tB/MKIHzI291OiqK58I0Wo2BfTC6JkEiA7EHb+AlFxj8mjjYtDjWFtJix1+674Aakq
         EK4OL8SHpgZTR4/M2fnG5wudlucyLzNCNJep2qM3Q2rdFaOkSp60f+3hc+BxBj+TLZqE
         +YN//lnXMmLDnBrjMCdtmUqsbBTiNS+ZTbx6nE7R4ayG7QGOpPCw3bmHRrONx6zNsLYY
         j3sFqDcugw+T5jGSt2/uM7P0n6Pb0FFHDpPaxNIwalsrK6lvm9vPmOHBxEB1zuuyCSy7
         xKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441925; x=1723046725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PK3XROm8AdCzvoF33BbXJKpI9sLb7+6gEw3RJDbeG8=;
        b=dsvTXW8M/CN0hg8wJ8DKf6LunTx+BhNMLskObk+W80xyu5idC3sC17lZm3jSR8DwLI
         9UIjeyQaZs59vEz4VFA2Y/ai/CqDJSqa3qnl11UNdxarKsvCxlB1KpIiRn0DrOts9QOR
         Z5pVFL8qSE4wFCtq+lpKqimoQde7Ah+cn21FF5HN++Va8ew5nRMSDnHmwjmw0MCkz3q5
         1V3lnwl+fX8DsPUBmDdcjWNLn5Nz5F17QMMuxJ9NJ+MqmN8iqBPZ9LqVs7ndTC2z5tBg
         Re6pON8LzHDp/h0KOH/McfibC2qorRxjjYrCeHDoHTQODB7l80/NUboWDQID5w7pFjuL
         AOxg==
X-Forwarded-Encrypted: i=1; AJvYcCWA2Skl/NTNESAwPweqP9JotPrYdvy9qLHWTdh0aAXHxFhOTSR+HE9ztjZrszAnaGbDfCbHdGm07Xuj9rlM+EAqJuA51TATKMM3wUyrBA==
X-Gm-Message-State: AOJu0Yxt6fApao0EmJenTLZFByBDo/fq2Fyvda6+iPlz24KRYpRjiS7d
	ca/JETfoqIrJ2pRRg9c27g2vLu9KF0NACBLzzfK0Ln4ohsH/DlD/y+FTB3/b5Xd7o2oMqIbTXei
	LgTMKxAAP6OQ+ZAePJZzaeO0Awa74Ag==
X-Google-Smtp-Source: AGHT+IGIujU5BUmectRaXmqxV7kvHeg9YagD7Xq3hkgu9fb0INf/OlW+SsbFPBQWXRkrAlltMQY/ZujPn5Cf9ImCObg=
X-Received: by 2002:a05:6402:4301:b0:5a3:27bd:e264 with SMTP id
 4fb4d7f45d1cf-5b0204e024bmr14456021a12.9.1722441925094; Wed, 31 Jul 2024
 09:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 31 Jul 2024 09:05:12 -0700
Message-ID: <CAF6AEGtr70TqFRDS3U9fEJ_vWHC53BC9G4tqgSJbsCD1H92qFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Further expose UBWC tiling parameters
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 3:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> After testing, there are more parameters that we're programming which
> affect how UBWC tiles are laid out in memory and therefore affect
> the Mesa implementation of VK_EXT_host_image_copy [1], which includes a
> CPU implementation of tiling and detiling images. In particular we have:
>
> 1. ubwc_mode, which is used to enable level 1 bank swizzling to go back
>    to UBWC 1.0 when the implementation supports UBWC 2.0. a610 sets
>    this.
> 2. macrotile_mode, which we previously left as default but according to
>    downstream we shouldn't for a680.
> 3. level2_swizzling_dis, which according to downstream has to be set
>    differently for a663.
>
> I want as much as possible to avoid problems from people trying to
> upstream Mesa/kernel support not knowing what they're doing and blindly
> copying things, so let's make this very explicit that you must set the
> correct parameters in the kernel and then make sure that Mesa always
> gets the right parameters from the "source of truth" in the kernel by
> adding two new UAPI parameters. The Mesa MR has already been updated to
> use this if available.
>
> A secondary goal is to make the adreno settings look more like the MDSS
> settings, by combining ubwc_mode and level2_swizzling_dis into a single
> ubwc_swizzle parameter that matches the MDSS one. This will help with
> creating a single source of truth for all drivers later. The UAPI also
> matches this, and it makes the Mesa tiling and detiling implementation
> simpler/more straightforward.
>
> For more information on what all these parameters mean, see the comments
> I've added in the first commit and the giant comment in
> src/freedreno/fdl/fd6_tiled_memcpy.c I've added in [1].
>
> Testing of the Mesa MR both with and without this series is appreciated,
> there are many different SoCs out there with different UBWC
> configurations and I cannot test them all.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

for the series,

Reviewed-by: Rob Clark <robdclark@gmail.com>

But could you resend with updated a6xx.xml now that the perf cntrs
have been corrected (to avoid further churn later)

BR,
-R

> ---
> Changes in v2:
> - Move ubwc_config field descriptions to kerneldoc comments on the struct
> - Link to v1: https://lore.kernel.org/r/20240702-msm-tiling-config-v1-0-a=
daa6a6e4523@gmail.com
>
> ---
> Connor Abbott (3):
>       drm/msm: Update a6xx register XML
>       drm/msm: Expand UBWC config setting
>       drm/msm: Expose expanded UBWC config uapi
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   34 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    6 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   32 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 +++++++++++++++++++=
+++++-
>  include/uapi/drm/msm_drm.h                    |    2 +
>  6 files changed, 1664 insertions(+), 31 deletions(-)
> ---
> base-commit: 269b88cb92e62e52718cd44c07b7517265193157
> change-id: 20240701-msm-tiling-config-c5f222f5db1c
>
> Best regards,
> --
> Connor Abbott <cwabbott0@gmail.com>
>

