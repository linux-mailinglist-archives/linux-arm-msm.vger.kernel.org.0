Return-Path: <linux-arm-msm+bounces-51811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AAA67C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A03B7189085C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079271DD88D;
	Tue, 18 Mar 2025 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4iupIiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98620F065;
	Tue, 18 Mar 2025 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324027; cv=none; b=bn1ZsOZAGhSIl1mf5GK4xDgX6QU9nOXEqMl5gwAOhKZIpOLeUMnzV6Y1ds0wbN9B1dg8tQ8qBs/Xi24bY0Ecp9GgYTvFXWRPOAIBCUUMaVFjxk8mm14NUwr6iquMXZlO/8VLyYX5P887GAMXklE11aG8Y5fG2r73UapImpRbz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324027; c=relaxed/simple;
	bh=K8NrPJvJ8M1iVaaSo49zqyhxNu5E57OgZm4oAvKQ80A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcYoiVIYExIevqHMCd1fDwKabp9jgxsp9DZb14Utr2AcB4geOHzpnEvJqfKnFEeLNPJS33FTVbaKY6YX2Ktt7UiUHGnWZGshq/z+zGiEvv0DUbq08KcaUeUnWeQHrEI6qdA5AiBoa7bjTZzExS7R+ERkmpT9g8SCCbzPwgHDW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4iupIiT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so1725070a12.1;
        Tue, 18 Mar 2025 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742324020; x=1742928820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSmaS9SiczKcQtf09ulZT+5WIK4YMWt6OMaokGfRCsg=;
        b=U4iupIiTyDZSTUr8Qg/VEuigPm5szO0HlMgRgpeq1V2DpkFz5dq1skMePcUUY1wBEV
         xa2fCoddlafiz2I7Rq+KFT+hHEw9AMYbrhtMWEh3xkCOvD8nO0jch/7j6haNOFv55l7w
         KEsgf4+qDyPH3RfwagOmbD8Hf2gifWuRjgwCRR3tDALoQe0Y+GnpKkLZua7Ml9eO5IL5
         DywzfWkR05GDnAmKR4p4kAOE2x1WmUKqKcbCGvV9P5D9pk99Zcp0FoB0clwqAad+gDpN
         cbWIRSKEq1M73OT1F5/fIzhaPvE7K9FAkb7Y4cUdeSe83bMt1njPMQEOCmVdPp/F8cZs
         V3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324020; x=1742928820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSmaS9SiczKcQtf09ulZT+5WIK4YMWt6OMaokGfRCsg=;
        b=R4ojV+rrrgn6a2jsqk9bme0rnb99FzKDrzPt9Z5VkFw9PwJSyMNX+4FvQKqNc2uAWy
         cwdSYu6K/CfLoyDMfn+e0/F5lOntwE2+rHeJKHrQrhibzkfyB6dDeIPTAUp5MhcwyYfh
         SVLT3/DXP6cNivO1YVUUOCGDZ+1lr6mGUW2Zen9G3bpc3MAh9APkjBhdpk4UimWECXHP
         FtwHDjcicR/hclgGbic5+CtxDI768ZAGzgGgnn5O4tJRxaN0sh1uBxqZfG09Ah9Xx24E
         wG3p+XUrtiRk5XSPoUfhE/euNa2LwRPCHWk7i6cayPazj7cfEnWO2hUv0p70mHeqAIQp
         cszQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM/6sWxY6laTlQBCCiwMSexLTOeyqwnX+w84UY20FKUgsRSTv5+rlmmWGpiDJTdOMrpnb22YKwcxHdIpDq@vger.kernel.org, AJvYcCWTqrZF7ZyVTrDKe5K4dBdIuQdXUm1oqPXxUhvpC0nrQKPDNbg6WgTBF/Q8V9kQKrH7jaiLMq/rCsGQYjY4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzik+8t4h04p4dDW72JFGpnu0QSD4yKOSJv+9v0IDZRkDzw69oq
	Ev8ZT7eU/ZJDg3rspjBRMV9eaONL55WRIwVxk/Uw+INGCjjY7Aumt76OUcXKoLzNuH/MlPBXcuX
	GC8S4ywOsSQej+wyOOG6npCKrfGQ=
X-Gm-Gg: ASbGncuDCqbj7R6snWIGsCKRW5AchBHmaKngk6b+rF4+4I+UNUgqiSK763pPKe/1p+m
	2pkT/5n+N935dnu4YZTSsyBym/Gdm8iOR1g9MBSYlfRu/jrdLdHluo2Mn0f2ViIZe5zm2xGgFwA
	t+Gg7rkWA3or6mATa558S6t9wn6rw=
X-Google-Smtp-Source: AGHT+IHy0byJnCuVMXrI6AJh5ocZ8SngCGKvQOgZlVqfox+lUeg50TwL+nwFYQw3i7wWPHJ8oVgwl+RCo/bDzBfxPsI=
X-Received: by 2002:a17:907:6093:b0:ac3:17b6:737 with SMTP id
 a640c23a62f3a-ac330489663mr2006657366b.45.1742324019491; Tue, 18 Mar 2025
 11:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com> <20250314085858.39328-4-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-4-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Tue, 18 Mar 2025 15:53:27 -0300
X-Gm-Features: AQ5f1Jqexkq1v060b1nOUslkHnhYmXG2PP3WoUMn-4HQvHnlhFu6oru5qnG3QTk
Message-ID: <CAPW4XYb6zci74=maL8bCPDXMV=WZG=M9sFnpNxMX3auELvzUSQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/ci: arm64.config: mediatek: enable PHY drivers
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
	simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
>
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=3Dy for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=3Dy for DSI display
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks,
Helen

> ---
>  drivers/gpu/drm/ci/arm64.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.c=
onfig
> index a8fca079921b..fddfbd4d2493 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -193,6 +193,8 @@ CONFIG_PWM_MTK_DISP=3Dy
>  CONFIG_MTK_CMDQ=3Dy
>  CONFIG_REGULATOR_DA9211=3Dy
>  CONFIG_DRM_ANALOGIX_ANX7625=3Dy
> +CONFIG_PHY_MTK_HDMI=3Dy
> +CONFIG_PHY_MTK_MIPI_DSI=3Dy
>
>  # For nouveau.  Note that DRM must be a module so that it's loaded after=
 NFS is up to provide the firmware.
>  CONFIG_ARCH_TEGRA=3Dy
> --
> 2.47.2
>


--=20
Helen Koike

