Return-Path: <linux-arm-msm+bounces-35184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 715589A5FAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F6FC1C21F27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC01E25E6;
	Mon, 21 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VWrjJtNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE41E22ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729501615; cv=none; b=oQItGihcf6Ne10HHFuGBCRQ2FLNSRGdjJffiFwPUfe9xWIRZhSUVQ3YYRGFxkPskvgyoro+rby5zlBzMGAKeXwrLRviJlch09ygvRsYWXSdj6rGarhPe56y9hc1swRoGg4iaa4g+m774aOyISMqqUoaz6wzgW2/qqZl4eaZ0d4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729501615; c=relaxed/simple;
	bh=nLN3F4nrPxdIk1EHSJ4sxKummFNcWIjt34YMFX7VnhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3niAi8AegdYDu1oQ9zQ/dLQNrDNv9kykGjXgN2xx3bCxE5Q9DFPFXdkaoE2tlWBlqTXpEutUILlt4hiHKK0nGAmSB0KBBxuf3AIzO/7U75YGL7S0Nu9uMypOgRgG2nS2juHstPC4PhqZZVdca2i8PWK/OKdxPgr4jLtr3M0a2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VWrjJtNH; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2bd258e521so1166166276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729501613; x=1730106413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
        b=VWrjJtNHmFBfnjx7xudtG+U0Chl6o80Ec84WdttLHaQSiVfCJBsU0Qr8yzynjESVNf
         sh+ueXmSYjVZmV6xT6GjxVpvjQyHJlVvxtuerwT/OMO7Un7AcM7+uOle9NKBq9ngRigv
         Z04NLt+YWR6z9wxmhwFOIlbXWGuI3mYwpW2uMNyxv1pz6kleUIhWHcKHzlOV1LqyAqtB
         rJwngSOkReITmfJ6rZQ/+na0xGmfgSZjrNhkb1KbDXhzS8u+IxYZnqn/UWBF/ifmMajE
         0Oqu+s5/7QQhtSbs15VvWTu0HIruBN19PftvaEaN7RNjB2f1BKT+I/liFVgjNpbdM54i
         OfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729501613; x=1730106413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
        b=mcV3GfQ6MqZvYZ9p2Cr/HHXI7x35Q+PhEaWQHKoC6NgyfWfvy+aws48z3iuiTePa5B
         X6mAf8ETUp7EWC9NGdlhzE+tY71yWcXm3JD7R47d3iGEgUcUnVgUKQfQzHwpN2qfshsu
         WAmHvcpR0ZqM3oqXHPCQUjg0pr2iRpL1VcXuJzuspytvVek5vg524Trj3Qw2Wdc1i3jc
         27uMzQLjsKnLnHBNG9WD9rZ5nOUWWuXuoMrAvSaRdXsXblXUk3zFTV6XYeeRHODfUtzh
         kYall8aWL4xSrotrHwyj2jtHcnxRNG1XRCwVEOHhrnfaQ6d39v7mmGWWMp0IdPRrh4Nd
         fGAA==
X-Forwarded-Encrypted: i=1; AJvYcCXD5zhsQYESBxS6xYt3BjCShGwfycxVNSmzwcLyxxKLyQUeaBWtrbuAlzRmmuXT78vm47P+rQB/FL9XECkp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmm80tAAXmB5dQ78CIozfVJRcC9mmFC/tE/YwyQsUY0PLYsh8O
	D2eWzNzKFpVYuzlLF8v0qeBBWnqVh6CpkA3bdqZIPdhudiphzSmoTafIEVkpGBR0ZrVdhmEDmw3
	fRxzk7ArFWPlIaItQzAKk/1x6MTnTxJKnterDpg==
X-Google-Smtp-Source: AGHT+IEaP9MJaux+Mvm9jAqxzMdqSn1f+GPVXkxv1I5i5R13Oo9mtvtrHTONlbQt6H8kuW3J8xABR0qDJyPjxkF3F48=
X-Received: by 2002:a05:690c:610a:b0:6e3:36fd:d985 with SMTP id
 00721157ae682-6e5bfc8926emr109528627b3.23.1729501612759; Mon, 21 Oct 2024
 02:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org> <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
In-Reply-To: <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 12:06:46 +0300
Message-ID: <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
> > bridges in the chain still might limit YCbCr 420 support on the
> > corresponding connector.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/display-connector.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> > index ab8e00baf3f1..aab9ce7be94c 100644
> > --- a/drivers/gpu/drm/bridge/display-connector.c
> > +++ b/drivers/gpu/drm/bridge/display-connector.c
> > @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
> >       /* All the supported connector types support interlaced modes. */
> >       conn->bridge.interlace_allowed = true;
> >
> > +     if (type == DRM_MODE_CONNECTOR_HDMIA ||
> > +         type == DRM_MODE_CONNECTOR_DisplayPort)
> > +             conn->bridge.ycbcr_420_allowed = true;
> > +
> >       /* Get the optional connector label. */
> >       of_property_read_string(pdev->dev.of_node, "label", &label);
> >
> >
>
> I think we should make sure all HDMI bridges can filter out 420 before
> landing this, no ?

No, it's the other way around: if one of the bridges in a chain
doesn't set 420_allowed, then 420_allowed won't be set for the
connector, disallowing YCbCr 420 modes.
Before this patchset the bridge / platform drivers had to manually set
the flag on the created connector (see dw-hdmi + meson-encoder-hdmi or
msm/dp).

-- 
With best wishes
Dmitry

