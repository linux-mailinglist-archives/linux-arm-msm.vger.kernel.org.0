Return-Path: <linux-arm-msm+bounces-53940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52853A8548B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF077B1028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 06:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7232927D76F;
	Fri, 11 Apr 2025 06:44:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF327CB2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353874; cv=none; b=B4wx9nAgYnyI6Qag/KMKQIfLaZFqHyLQMxjVzOD0lDPaj0HpIYVo65eZBJ5R6ZFrWa66nSkKAoaQZYculNNGiEqOUs6E4yNGyLV1qZEDxLhw4bSrKNJWQc1MKr8A6V2KYe+mosbVvLICLHQGpkTkedVoU8VWwcgvqhG9oIszhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353874; c=relaxed/simple;
	bh=TmRsfdrl+SkxHKqFCnuLtJKoWjb6p8iTBz1i+VJGK5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9C2VXgZ75GxURkFyg5kbGfKS1Lm+op3JFwXVctb9lpSlEUwDvpk0hfu5gP8CAN8uzbBQYpNhF/Y5FhtI2rcFens3YpscPxT0w311qq5cCoD2SADgoQQ3XNC5FP/sDa99+29sDo+cYoN5r8SrcH7lAuvixBNzKO+cdxvSKa4dXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso14283735ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 23:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353871; x=1744958671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YaWTI7DWsK4VeI0QvD2ZFS0NMVC1Fl7xtwp7U/95NA=;
        b=RInrIeSAY0BjETMSbZ5UZ6oKaK4RTbqtldT5cH7Q9vssBZElNAvfUY9B14R/8zaqxU
         6rWNsrLfdCAtMpn/dxZOlw3gW9mhqrCHmtgGOzSTZqnNcNFMM9Ja3hf0ZOhyMmWG6h39
         EewHTMAhDmEu8QgijyxcUvxqlu245bWRmrkbkS8Gzf7G1JcZKo6w24RyJTgCcxvabun4
         5AiWhOTiBzK0/R6O7NjJvVUt/arqzdK3uIu31moM7YAplGFATLeFxCCLF1cjASoEPeBM
         C4Glz+aaAlhBMF72+A4Dw8RmT2BPSqboBoJJ6hhiDCnT6ARe2Fvi1+sVmD2EeesOzKLn
         SesQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIJ3MMrGXGx+rKmdRELEr/wt9BHlJ7p6HvoGCtvcFWBnLotWvmtN0Hb96ygf/vKsbz8sLqdNblTrDOUdt@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBuWuoQFeldyRclMvgWW48WeGjKFELl37IscHvqYDTpeRKkyu
	drJ3NCt1lQFWm5YPR63eN2kLfmfQ3IWkpJhO47dMaT1sde63MpPNXT3A99/+hNE=
X-Gm-Gg: ASbGncvuHQ8tayrqys4UvaBrJfylDTCAcT7Y3MHop/lpI9mXgZC3+oT1TjfCNZ6GerO
	i3hQ/Ti2s8hodM0C3lBcZ6i86cHwaMSVb5+21zasxXBrwdZmVT2NjcdrZSGdEV6MKjgMcmGbENF
	dH2NFCkjSnFASuRBxL6LoqPt9FjShfO7k+OuyLuoc6sUQzzVWwf0YfRrOnJCef1aB3GnGKc9P94
	XKzFNh2lbhfbW262AIadsi+ydoRFFFrxXLKKWJz2+X5P1cNXBSdVYVDSyLax4rZFIBdEvXMJ4H+
	SttZAKvk4hileiCfRKL66JSj5s6DTnPz7TmREw1dhs0rbCEbza50VaJxJODcvlfoZhRsbW0Js8r
	tIsE=
X-Google-Smtp-Source: AGHT+IHS7LI1sCEZ3TAdrINlm/HTv+/FuoT+YUY8PdSAwHHlzPc6+0urEBx+M2JXfqUCGj4fEanlWg==
X-Received: by 2002:a05:6e02:349c:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3d7ec26b69fmr21971955ab.18.1744353871269;
        Thu, 10 Apr 2025 23:44:31 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2f3b3sm1120806173.117.2025.04.10.23.44.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:44:31 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-861525e9b0aso131473239f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 23:44:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4IhxZ7yULFPgBFMaFwm/0KEjxM3O6BcFQp1Xh3LTqMy3R2chBvkSMIc19uGeqL74ubClUFWjJWZQG5B81@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:4c1:924e:1a2a with SMTP id
 ada2fe7eead31-4c9e504c3aemr736947137.25.1744353386128; Thu, 10 Apr 2025
 23:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com> <20250410163218.15130-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20250410163218.15130-5-ville.syrjala@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:36:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt4UkiTqe6T1QPxAwJdLnQfaDjw7_cKYtTx9WVed9Z0w@mail.gmail.com>
X-Gm-Features: ATxdqUGG68dHUm49IQV8G2NJ_HEDfXWabJxNBHJkOpQT2upH4xlbmyKOguLtNHo
Message-ID: <CAMuHMdUt4UkiTqe6T1QPxAwJdLnQfaDjw7_cKYtTx9WVed9Z0w@mail.gmail.com>
Subject: Re: [PATCH 04/19] drm: Pass the format info to .fb_create()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maxime Ripard <mripard@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Apr 2025 at 18:33, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pass long the format information from the top to .fb_create()

s/long/along/

> so that we can avoid redundant (and somewhat expensive) lookups
> in the drivers.

[...]

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

>  drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c       |  3 ++-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

