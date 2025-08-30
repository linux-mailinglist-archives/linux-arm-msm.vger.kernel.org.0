Return-Path: <linux-arm-msm+bounces-71279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DAB3C8BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 331CB7B2ABA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6968C230D14;
	Sat, 30 Aug 2025 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="L0h1himm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7E19CC39
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539048; cv=none; b=PeAgwDSoJpyGYE6kPEI+rqZgdM8ad6tKpvGxVj48u60R0MoyHDm+5nK6JDbA5XGKkHMzG7ywt5+mbVWrrLZKEhd05Mh2w8FzTjx1yS1yXm0NTjnwMSnlLx/i7zmfv0iK2hFhtGwxvppuI6IQnbxvk6iFcBWIeUHhHz5XxvLoJAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539048; c=relaxed/simple;
	bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HN0KGOkkSckZZIECK/3L16l7MYq/L4RP8aTc0fPEwkT4gVteQldq2LOTW93ErgqoImko1ITw6T6HRc1VFu0LtqGlzfuCKfZYI1l8GFGrpJoHGoIrvKfBHyZxB9VgUUNElfn+EWkX45T3AFp3oFlroL/zi1IZT/ST7plMxsuAZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=L0h1himm; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b30d09da9dso15440691cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539044; x=1757143844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=L0h1himmD7qmCHCr3OY9F/cKeLGrCafLNsg/4CuhWVVaSTkboR5MkSxXEdrNvrIIah
         R7X4Ep3A/PkBhR/nIULkJptstsm+2ARKj7r3xDjeoR7s571MSdm8oNlb7kQOmEvww0//
         d6uQaRHE3/osmHcucktClk7h/Wp6zvCdmTpKlIs+pMeRlPGpLF86Po+45dmUjqN84wN4
         jDw58sc5VAMnNP8hjLx0nSjZr93Yp6zzr6EbIfbQu+FXXPJgp/6FFqSthXPjq2EYnzm/
         MYbHP2+nVJDDE7jU6Fd2+ylqqT3dS9QJJFnyLqn/GTHjMIxgfnk+ym8Fbgmman31rsJH
         m2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539044; x=1757143844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=p6mQtRTmwO5OIPDCi3ijDuF/fyGIWipHGmpjzEDk0mCAFStLiiDkSTOeGIh/BCiFZL
         /Md48HcLB5ZInymaTe18ynmz/yhZbIpoXbnl7/arXYlNWXqdNvJDFQF6+mvWKc7xYAqM
         jUyvqn/uyDGIH6llOND4Q7NC+Yp4UJeIpODukwqvKI/mXvd90Lj7Ia/FO1KIlt26jjBI
         evWMrHr7TfKwIwLV1UxBY09PBDDh3CE52Rt/dDMFHY0Bim3wJ5OmisgzzBN5I3Mg5mhH
         iM8CNtlHpyUZNfhuIdzN20kETIfoS8jstZb+MzoQV4QBq0DfNR4JSRnhzzc0bFNTjlbX
         IqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsilw7cbItH3g+VkyYi/oNAHsMaOBHR7nPi2wVcsTkjCE2ystym8cG9ou5fT7LR88h05s3byx5ZvlSqAo0@vger.kernel.org
X-Gm-Message-State: AOJu0YyBc+iTcpX/abUb22lhAZA7rHhIHzyBWgOebElVHUhFca8Jh+s7
	q79Xa5WJ/wfSavS/b9UrHBOn66rM1ppKr53wzrDsNuJbw2SZDzM8S2Vju5yPPyc5mM1KQL0cHEK
	q5FmoI0dXWdYUagU79qpXBpMYFpGXYfXDRg+bGtKcWQ==
X-Gm-Gg: ASbGncsgB/08yB3ZS7G485T5ow/3QuHNpG+CDH6elAfPvXhkpIZ1dC7Rjh0Oq9c5Ke9
	T/qEZJWXWQl3bDHJsJznqilsbd32rxaBOBNahAszG+iGPK+x787btAqaBf9BaCzoCnLLskbS5Ns
	q38bZIJ5fHGgb2h/sQR3R9HXYb20j/+ZEVp85UQrLZQIvOgX+LmdVegVIsnTrIjsht8SJO397U8
	Y4mcg==
X-Google-Smtp-Source: AGHT+IGOnM65THr0nrJ2LPLTiMMlk+HvsXaVUyczPlRtZjJ7WLdbodWtVaS7JfPnD9Na2PcQiHxYrYNu+VnO9BqbaFo=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr22814681cf.32.1756539044617; Sat, 30 Aug 2025
 00:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:33 +0200
X-Gm-Features: Ac12FXzpE91ILUTwZS_ZwZMq6UoPhvxeYv_akLo7dKmrA-yDSe19rsUZejc4hcM
Message-ID: <CAPj87rPSqJoJnUoP11qzWXuqvYPb_=vP-5-p7SEVA6JCfcYCuA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.

Reviewed-by: Daniel Stone <daniels@collabora.com>

