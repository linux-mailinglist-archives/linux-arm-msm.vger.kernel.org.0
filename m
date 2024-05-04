Return-Path: <linux-arm-msm+bounces-19199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27C8BB896
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 02:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500C71C231D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 00:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788817E9;
	Sat,  4 May 2024 00:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKav6bia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954336D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 May 2024 00:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714780968; cv=none; b=ZWqfkmXn9o877/Dr/McMW/oFGvMk9UVafKmYCKZl08BxMQQXHnf02pYRKM+HGpwMGHl6DAVIP5icrdQws4qpnJpyGBSIT9T78UYToRdrwv3Z8AfvmDclv4QtWn5nStDox8M4MCo43Es37GxWl8POXA086ZwH80XdGKdaH6oo8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714780968; c=relaxed/simple;
	bh=4sg/lBQu8VG3Cr09wLGU0B8qR+LX6xNYsDshh5/gdu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgCB39dBL/XqLfjTa/2m7Oqs8ucVd98KN8tigxtzHU93UYrRMc8Cuq6X0diwp+JWcL1qH2V7r2CBkmFOEoFU9ATN57dt517klFmuXkbQtZ1bowdZkDPeEf1iJ1N+7tVc/3+/TF/IO6k9pTNH83MPKcVGWq/ttjqRBsosU+IBLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKav6bia; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61e0c2b5cd2so18252247b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714780964; x=1715385764; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
        b=kKav6biaPFSA50efpdYKhsRCAAjrDYxAf3/RCUNDQu049c3V256gM4rOrZMmSe7MAQ
         YIwaZnbX9hqSyJOsiw+POToqUSoCYx67ASoTnh0DK7m1fxKYHcctbKOPGrkW0Nh7T9Z6
         TNdAIUx8YqWF1Uhyu7McrvVXlz/VrE10UvVlvHpOl7/pVMEh+UL5w+FfIVfb3yFVDk43
         oyxbXQo+XsMVmm9AnhcUV3AQZbsCHi76eABVgMnW0/T0nNFi4b3z11YYxA91q9OZmVk0
         wY4A8ssCqZdEFTGdnaGWkRcXoXjOooJw5ysOgab9n1XEjWIs+9iVakKApfOO5tGhIgf+
         lrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714780964; x=1715385764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
        b=QH/X7fLopyWEusq6Xp0/EiQ5ohzTuPArSlTwyjaVFP+wQjon+tV/9QbJP2liHlKdpO
         n4Nb1FWPccptjmfdUzoGCcsvB215mczM9IlV9AA3v/D+vlct/NT8q9boBzQYfZFMQ9RR
         cJtIt/A01PCKQbBzGlk2kfXUjOGKR59F4FyrNGcoBSWNXPZOvl3PrPgIyHKuqKI/RMI/
         VgRR7akaazEy2kGi6QyPaaUz8XyaBoqs5DcVbnRf+Sn5IZnIVOhLkSZxorPSClV/7yas
         Z82hL8W15oFHnQVIvUQmnMt4Y1knqLO8s70Ha3IQhwvansnNXwgnCzkO3vES/n+kWB0w
         k33w==
X-Forwarded-Encrypted: i=1; AJvYcCW8MVaPobUS/6Z2e8+RW3JmpEJtlkX83wE/NOB/V90ODZcTroYVisvLwaTMG5MXhWRt017pqNRO8CHYf2kAewd5fJzdtHSc7g74Cf9QFg==
X-Gm-Message-State: AOJu0YxYAFS8Y8cZLv43Xfe0hKx9b7XPSEFGy/yCuwtARkwA0KuTbXDf
	XOnOw2QomPMslRJzNVZPHBs+yrXxvTPPExCe0qt+u4G8G/E5JX/j2ctDR5DsVp3sLX5q5QRhyIH
	WsQcZqlR5+ZwMsMwrZYf24VsBlMJe2qxz4C3qcu3YP6XuIJwYnhw=
X-Google-Smtp-Source: AGHT+IEymS5X5ig3FJMTRZ56tRBGiOhi2tDbas/Tb524ePf/hM4/Xj702HYCnq1FuYFayU9Ud8U1yzDouq4Mi2oXsKk=
X-Received: by 2002:a0d:ea54:0:b0:618:5c6e:9291 with SMTP id
 t81-20020a0dea54000000b006185c6e9291mr3221458ywe.17.1714780963901; Fri, 03
 May 2024 17:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org> <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com> <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
In-Reply-To: <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 May 2024 03:02:32 +0300
Message-ID: <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 May 2024 at 01:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
> > On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> >>> In order to validate drm/msm register definition files against schema,
> >>> reuse the nodebugfs build step. The validation entry is guarded by
> >>> the EXPERT Kconfig option and we don't want to enable that option for
> >>> all the builds.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/ci/build.sh  | 3 +++
> >>>    drivers/gpu/drm/ci/build.yml | 1 +
> >>>    2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> >>> index 106f2d40d222..28a495c0c39c 100644
> >>> --- a/drivers/gpu/drm/ci/build.sh
> >>> +++ b/drivers/gpu/drm/ci/build.sh
> >>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >>>    apt-get update
> >>>    apt-get install -y libssl-dev
> >>>
> >>> +# for msm header validation
> >>> +apt-get install -y python3-lxml
> >>> +
> >>>    if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >>>        GCC_ARCH="aarch64-linux-gnu"
> >>>        DEBIAN_ARCH="arm64"
> >>> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> >>> index 17ab38304885..9c198239033d 100644
> >>> --- a/drivers/gpu/drm/ci/build.yml
> >>> +++ b/drivers/gpu/drm/ci/build.yml
> >>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >>>      extends: .build:arm64
> >>>      variables:
> >>>        DISABLE_KCONFIGS: "DEBUG_FS"
> >>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >>>
> >>
> >> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
> >>
> >> Cant we make this build rule msm specific?
> >
> > No need to. We just need to validate the files at least once during
> > the whole pipeline build.
> >
>
> ah okay, today the arm64 config anyway sets all arm64 vendor drm configs
> to y.
>
> A couple of more questions:
>
> 1) Why is this enabled only for no-debugfs option?
> 2) Will there be any concerns from other vendors to enable CONFIG_EXPERT
> in their CI runs as the arm64 config is shared across all arm64 vendors.

I don't get the second question. This option is only enabled for
no-debugfs, which isn't used for execution.

I didn't want to add an extra build stage, just for the sake of
validating regs against the schema, nor did I want EXPERT to find its
way into the actual running kernels.

-- 
With best wishes
Dmitry

