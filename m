Return-Path: <linux-arm-msm+bounces-45664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519BA179EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF2A3A5EEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9E31BD018;
	Tue, 21 Jan 2025 09:13:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF832CAB;
	Tue, 21 Jan 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450833; cv=none; b=j3+X2KTeW2NLA5T9z8sPo3ZNLpbo90MtJvCkPw/tfklEc2lqhy0WAtfBwcDaT+uAX2TliQEOxoYs9eCyDXGE5c47C0BGUyTP0GKMeqQaBXOk8SQNbtrVw74d33D27nkS2flvwuUHdq+O+1Xzf9PNzEq/KjldzBMuSnd0TKTv09E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450833; c=relaxed/simple;
	bh=379PWCV/7+kIrmP1pA3alid5iJDIvrSFYacRmagLkUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9opk0Hn5nL9YW9iPo3rOArVgHMwxFIuUWQbI21rkdjbKTaqRmtu3Obs/YliOLN7NcgfBY8P/CRInPKTcHx69Et5f2UbqKiAqA+u8F4B1rqRlbpqoTTiKdOxjppZP6OXjiCn5wItad2aaMK1oKFqbMbpf8eZvdX8xQisW9iMKPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6ed0de64aso491599885a.0;
        Tue, 21 Jan 2025 01:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737450830; x=1738055630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0F66BpcncnDZq8+yac2PqIUMY5KsLdGVzSelKc0x5s=;
        b=VQ13uKQiXxzctBx8dzUWSYp9V8AA2JHM6RS47NZdm5HQbvU37C+HjtGhOd18BdkUhV
         JWrHqgzXQ11I4G7RQEz+GgSDLz7Enkv6Kgoe9x9HVKqEyi/2MWA2LDxuPzxEEsip5abZ
         SpkLZnnyMGJ3nj6i9UNYWExRTstIwwo5cssx2cwWj47GMM7D2cc8GluReuYYJBuzvc90
         xKrxYbe9GhEPwecJh8emWDeZyl7P5oMftIGIfwQ45We2YAp7m5xPi2pom+sDjncc7Hwa
         RjE58s0XyUvXoi24t9xm9WpX7z8Y2JdgSKFPUaxPbvqD4nObY/abpCl9IAjci4QQS7Mr
         o4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU6HIx7HgaPpA3OfeOMrWfLUbHFMbWfevOwzzbQYbXJym0W6s+siNLb2cN24wMRWdQLu6YkQ4GMSF85kaEH@vger.kernel.org, AJvYcCVYyhpAwtIXbZ6wmgYlEVmghJglBVg2PZHi+64LEVilyqV0GzOoNLFl7YDKb0ytadaI7LAbHYzi6P/44LwnBG/KJPM=@vger.kernel.org, AJvYcCVpdrcT9Nv/TDRHJzPrPGxvMhfge50nBRmomEn3IX8XsZbr8PNsgVIcZ2BRa1A6K2nRgL1O7GI1s3fDjYU=@vger.kernel.org, AJvYcCVxXUw1tQOkj6K25kc5Zpxk8RLi3S5KA7lJA3d0e/w7VC3MyIb3iW26pTpfr3ggZT+gf2vcavPeRq1jeGzx@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaw+aZCcO58YnjQT9uzkr6tsx7GfOEMT5hCK8aEEvOa5UKdLe
	tjiu6J4e9lCDR8mHW2pIGQIp3UcBwb+0laK+VMDPJuew1iZzIVTJAp5xaJfM
X-Gm-Gg: ASbGncv+brHyPxTWO0RKeyAMb9AzrGAXAti7gHa+BA5p5E+l0ndSphglznFxEqlxLlv
	8acOEiU/5V0QrmrTmlFCuC1E8SMAzi4FQ0DMeBz3BkAYRUriXdMpRoU+FBVi5AoLZDKfGipaLNw
	vKMBd9oMQZUpp5VzdNUigr5H5ESVvpnmE+Rx23LO22cNHl7XpmRImuqja2YX+yk9W1UcHs/kLY5
	xLV2/BfSiDAXu6pyxlCrZ0fSb4UU688TPOGfPW/F59r6icgE3egRVtBNupL2baTPcHuw6yDpOmi
	ldONVKKX35wD1xIQXj/0kPRWM+OzJ2xdOx8I
X-Google-Smtp-Source: AGHT+IGsEIDFm0b3zj8GAtqWvg6Y2dj7R4OruDN7tdXXTh7qhSzuw9z+v0mqr7aRO7hYzPs7RcfYQg==
X-Received: by 2002:a05:620a:406:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7be73f6a0a1mr1067351385a.20.1737450830131;
        Tue, 21 Jan 2025 01:13:50 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61481543sm535071785a.48.2025.01.21.01.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:13:49 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6ed0de64aso491598385a.0;
        Tue, 21 Jan 2025 01:13:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiY7l2qJjLLylGaifPY6hIsQRI3WJzTfMqaXFuIo0l/WRBYBPMbBGG9BdI2o9LPGVa/lH39gT3GU2Gs4k=@vger.kernel.org, AJvYcCUmtySTPDUGHNqDIqBqEbUbz9Pqu1wkZPDkmgy/g6vUBv1Wl/CBFPNbawKtY+cWJhwZ18CanqxFbriM6Iovc6t3JKM=@vger.kernel.org, AJvYcCXXVTneqtqk1kmBYnGwcrYkh37/R3pixc9f6WEKijePSQ6XR37N4fMMCAevF+FrL7h0gyNyC6ua/Hcl/JS7@vger.kernel.org, AJvYcCXsIFxoerkLIimgi3dxidOW07ywyytLDfFKQCKAnRbI12hjghhN5p3Pbu4gAD3mnB0QisKfHVoELsgmPC3J@vger.kernel.org
X-Received: by 2002:a05:6122:1783:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-51cd983d39emr19246646e0c.5.1737450357663; Tue, 21 Jan 2025
 01:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
In-Reply-To: <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 10:05:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
X-Gm-Features: AbW1kvaysGolt62WeN4DkS2DNKlSt5oN-0lBeK1j4PwxsWLIrFBPjsQ9bnC7ZcA
Message-ID: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > While working on the generic mode_valid() implementation for the HDMI
> > Connector framework I noticed that unlike other DRM objects
> > drm_connector accepts non-const pointer to struct drm_display_mode,
> > while obviously mode_valid() isn't expected to modify the argument.
> >
> > Mass-change the DRM framework code to pass const argument to that
> > callback.
> >
> > [...]
>
> Applied to drm-misc-next, thanks!
>
> [1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_=
mode
>       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
>       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_i=
dx()
>       commit: 5f011b442006ccb29044263df10843de80fc0b14
> [4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_=
mode
>       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> [5/5] drm/connector: make mode_valid take a const struct drm_display_mode
>       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a

I cannot find these in drm-misc or drm-next, but they are in drm-tip?
The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
branch 'drm-misc/drm-misc-next' into drm-tip").

What am I missing?
Thanks!

P.S. Sima: noticed while resolving a merge conflict using drm-tip. Thx!

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

