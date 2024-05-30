Return-Path: <linux-arm-msm+bounces-21176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927A8D5636
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0A19B237C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436B417C7B7;
	Thu, 30 May 2024 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGdt9yUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1C4D8C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717111530; cv=none; b=c00M6Tj6HYiT3TSynm294N43JhVWQlYQpOrFQ22uNo+8BvfYGI1ba4FN3PiaEhJRAck2XLpQNwMlgDaBqAedmdc3LOZBGPY0klMRZNf7PcM7Q58cQMeXWJjlO+z1GC1/71EoPCtjbHUCrOFYGkTtCNo2Ws6FMrXxZH9oXWGjBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717111530; c=relaxed/simple;
	bh=feYC2kNhO5aHxM9/y5JZlPsiraWW8c9ppZqqjtLSkvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxwg9aVFxijl6QUgUPWM4L9RWJGGltNLdZz/eq+Q4v7/lEHRbYdRvZNTbSyBz00X6vMf49UPuYZIgrHco/xvI3zjF+hokYqp1ZOvG8HfRC0MTewr2REP9C6vuFmR2LtG6GCHbrRPc3QjCZfZNKZLY2kIRQtsQhrvQmFPIwMWJS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGdt9yUF; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4dda88ce9so1188337276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717111527; x=1717716327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv0LecyVOWd5yytKjjDHRWsA6Vnu0bk1m9ADGMShsuo=;
        b=BGdt9yUFtrie5qQj2DathHHjZKBK0mB8DCDtagqMCJJmoFxuq67hXgeIBBYcJ2QCGM
         78dJ7kBJk9A+UpacH+A+WMvu7TkCyJ3pXLi58jKRBhUwCXqoTXDw9trVtOkpaWM5gw1M
         4vN6ScBlXbwXq5NutRgt5pCsiC/PS5pRaFX4gqPTYtTvYFU0XMIAeTU7qWiP+Lu8VQkF
         /GBneTfGSnLA0HyYL5nTPX9Jvnwcwpiex+IjnTd1TOvV3CJJl+kSHdkilED1Un8n3AsJ
         pzBvwPGxi/vzgz6Ql/OuCLzWwac8qr4U9IiKTjZ76zNRntkT/BN/ukieV0w9X1HkuOn7
         wyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717111527; x=1717716327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sv0LecyVOWd5yytKjjDHRWsA6Vnu0bk1m9ADGMShsuo=;
        b=CTFS8qWtOciMHwQ0tvHM9wx0pr8p+oN/B1h01MAKDug5es7iTHliAuKteyyXOpFYg7
         ri7+0R+cUYNwEVHIFVNtpVH+9jHgkzyrgzSZy8Y0p8+95E30pe1Ch5/P9efocJhN1kEL
         tT3pmti2on3mRSdUE5Dz7t2A0CgVTJKl6QSkXm6x/Zh0QAgTcueWe2/YTfWWDEWYVhpy
         zum1g8Cs/W/sGID9wLHDEX28S8/Y9ZqEeNSGDdu7eTvhLOPDpu534OWMDg7kRn9m+jFE
         tpy6QK9bWSFuGaKJvtIYDY+MMXhLOnhwp8HBfqPjq/g3DdiJybhQaaD0ukmXEzNRKOSN
         OTeg==
X-Forwarded-Encrypted: i=1; AJvYcCVT3COWFbMpIOqgbMukEH3iIWV26+O/eTSI9PmR+99VaHfWUBwY93TKRbINkzJVjJ52j+cY1//cwxNYjN4LZRaMC9aj/h8h2OYIJQ00xQ==
X-Gm-Message-State: AOJu0YxythKPr0yiXvxn3qFNfsDzGITqx9cr0bcGbz2saN6Gyuub2a3L
	KTLAq5F9nB5BEisczou5xdKnM5UUNnxiq07wO6bZ+RAhdh0UjoQKkOwwI2HfAGj4zheF9ToWsry
	TnvL2bHFEwVvkespyVF2RaA5m9gXuWG1szqjf6w==
X-Google-Smtp-Source: AGHT+IGoT2aZ50ey6PYkXo4gk0t6FYv3SWVRLhfFVMNTxxcjrabn1SF849fjcmILla0ETMZvmc8wUcRAZ6PmWQmcsDw=
X-Received: by 2002:a25:a2c6:0:b0:de5:852f:6afe with SMTP id
 3f1490d57ef6-dfa73c23234mr310487276.30.1717111527524; Thu, 30 May 2024
 16:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org> <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
In-Reply-To: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:25:16 +0300
Message-ID: <CAA8EJpoy4vTGGFqoCXUKshWhLVUL8ME1i2Z_X5B+yRG45vx6+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 31 May 2024 at 02:24, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 30, 2024 at 4:13=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > There are two ways to describe an eDP panel in device tree. The
> > recommended way is to add a device on the AUX bus, ideally using the
> > edp-panel compatible. The legacy way is to define a top-level platform
> > device for the panel.
> >
> > Document that adding support for eDP panels in a legacy way is strongly
> > discouraged (if not forbidden at all).
> >
> > While we are at it, also drop legacy compatible strings and bindings fo=
r
> > five panels. These compatible strings were never used by a DT file
> > present in Linux kernel and most likely were never used with the
> > upstream Linux kernel.
> >
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> >
> > - lg,lp097qx1-spa1
> > - samsung,lsn122dl01-c01
> > - sharp,ld-d5116z01b
> >
> > I'm considering dropping them later, unless there is a good reason not
> > to do so.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Rephrased the warning comment, following some of Doug's suggestions.
> > - Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fc=
fc457fc8dd@linaro.org
> >
> > Changes in v2:
> > - Actually drop support for five panels acked by Doug Andersson
> > - Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-04=
5d62511d09@linaro.org
> >
> > ---
> > Dmitry Baryshkov (3):
> >       drm/panel-edp: add fat warning against adding new panel compatibl=
es
> >       dt-bindings: display: panel-simple: drop several eDP panels
> >       drm/panel-edp: drop several legacy panels
> >
> >  .../bindings/display/panel/panel-simple.yaml       |  10 --
> >  drivers/gpu/drm/panel/panel-edp.c                  | 192 +++----------=
--------
> >  2 files changed, 25 insertions(+), 177 deletions(-)
>
> Thanks! I'm happy to apply this series or also happy if some other
> drm-misc committer member wants to apply it. Probably we should wait
> for a DT person to make sure that they don't have any problems with
> the bindings change.

Yes, I'm waiting for an ack from DT maintainers.

--=20
With best wishes
Dmitry

