Return-Path: <linux-arm-msm+bounces-34464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C599F24B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 18:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AAF828398E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 16:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4611F6674;
	Tue, 15 Oct 2024 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VESkwxVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1831F4FA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729008386; cv=none; b=LoaSsVRlg8puQhrMK95Anw0HxVZ+Bk9uMxRKeOhwu6XzxMr9FZpuF8pfMEbyI4DXG888eebNw2y0f1UnzRGIPkAzT3F+zBuj+hu+jVfUhorfkxIXkwqyoJieIRR7Ggez+qdfVNsC8QodLkW0Mt3YoX/gBEmrOyhPNkzIuYr45Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729008386; c=relaxed/simple;
	bh=coV+CW89lf2xb2YOQ9WrDQ5/UFSIDkfrD6hBq941WwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVty/0zWaBjR7nRNLbrR/1k8FqlRw0stWYTXbxB0rSIm4Sfg0k3nLBTDceU0uUY5+S5R1gDD3+30oS/VerV6mFyJv/kRNKIWM1gR3yUCM3n5pBTfLZVrWrBY3gSdvDAsYdZivH9dShSZ2v64gLBiqFUJLG6K0Ww2eC4YyvDe6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VESkwxVe; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5743074bso13651891fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729008380; x=1729613180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
        b=VESkwxVeTMCzko1S8NYM6f6Fd41Tetr06nfRMi7hUArhTWs1kUE5g/gnHR3jRJ5lfk
         kxUVDwDarfFyu88vneMhDCbnbClocQwMFVStp0DadqIxe7jPa3ceecs3wHa/En0bZE3i
         6v3Hynw4A3Q5A4dOWjEWBJk0aMIc63gLVjJKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729008380; x=1729613180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
        b=tuNTdf3HIhZEMW/I0kY72D24HVlCAQBzHfRx8YUerqtxoJJddZq45Jc9nCPndnTCPr
         m11G3nUXYAVjMfBZQ5EuHqIZB4WvEOQyknApSplppUmH1Jua2A/3e0rPMYRwqz84ozNm
         7c6LeBz9bonYRxibc6MulHkMVprsv+jcMmze49SENme6Arc22EgPWYUSE0nEv6c1oDYS
         kBTyI0KjR3VwDVZReGqmHvrYSKQQuXdaBzeDcCkqUAF+EBV0hjXVN51aEgGcMC9L2M64
         ag9Eu404Oe6OhQCdd5fkRrMhph16lxpxvkXDyFeuXj2l5z7ZW3MXFTAysJxD6RdnkmlO
         vf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTNLltIEHd2wInfLJI5c5eoF5YpjVB/h9RsWnBR49bRlf878uM63MxxuqSp1AcnUxLU4Y2O+IdY3q0P5w9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9dNn9x5xd8aGo3jSHH29NYgYYt54QfW8cfSrWsZExSTmQkOOK
	IafPT1d+9WkLz0/6bvfNTyHE3hQtjBbpmGgyKc02oW2fuvnvVhlFjoygCJgo1j/bhftFpBpgB2o
	O6w==
X-Google-Smtp-Source: AGHT+IHovsWDNC5dw9w+ijWDCLfBpTKgcQPgQFRsnM/cK6h3auyFgL7HegqfZ3XbjOcL8xwqCixzYw==
X-Received: by 2002:a2e:702:0:b0:2fb:5034:e18d with SMTP id 38308e7fff4ca-2fb5034e3a8mr21598321fa.1.1729008380115;
        Tue, 15 Oct 2024 09:06:20 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d126341sm1906191fa.34.2024.10.15.09.06.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 09:06:19 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3312872e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 09:06:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWidrxPwEjqbYQv3s4nFFN/dOQ354R5Wo8GfOzd9+5BPbTQwvMvTb0JuuBG8miiI5Vbb5Gb59T3O0j7y1RN@vger.kernel.org
X-Received: by 2002:a05:6512:a95:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53a03cc8dedmr370366e87.20.1729008378263; Tue, 15 Oct 2024
 09:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015134606.5b87093e@endymion.delvare>
In-Reply-To: <20241015134606.5b87093e@endymion.delvare>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 09:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
To: Jean Delvare <jdelvare@suse.de>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	YueHaibing <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 15, 2024 at 4:46=E2=80=AFAM Jean Delvare <jdelvare@suse.de> wro=
te:
>
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>
> To avoid reintroducing the randconfig bug originally fixed by commit
> 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> on OF. This is consistent with what all other DRM drivers are doing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> For regular builds, this is a no-op, as OF is always enabled on
> ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> explained before, allowing test builds only when OF is enabled
> improves the quality of these test builds, as the result is then
> closer to how the code is built on its intended targets.
>
> Changes in v3:
> * Rebase on top of kernel v6.11.
> Changes in v2:
> * Let DRM_MSM depend on OF so that random test builds won't break.
>
>  drivers/gpu/drm/display/Kconfig |    2 +-
>  drivers/gpu/drm/msm/Kconfig     |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>  config DRM_DISPLAY_DP_AUX_BUS
>         tristate
>         depends on DRM
> -       depends on OF || COMPILE_TEST
> +       depends on OF
>
>  config DRM_DISPLAY_HELPER
>         tristate
> --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> @@ -6,6 +6,7 @@ config DRM_MSM
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> +       depends on OF

Perhaps nobody landed this because you're missing the msm maintainers
as specified by `./scripts/get_maintainer.pl -f
drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
we'd at least need an Ack by those guys since this modified the
msm/Kconfig...

FWIW I haven't spent massive time studying this, but what you have
here looks reasonable. I'm happy at least with this from a DP AUX bus
perspective:

Acked-by: Douglas Anderson <dianders@chromium.org>

Presumably landing this via drm-misc makes the most sense after MSM
guys give it an Ack.


-Doug

