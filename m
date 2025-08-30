Return-Path: <linux-arm-msm+bounces-71278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6AB3C8B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5B7C7B1E09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DCA14F9FB;
	Sat, 30 Aug 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="QGGws7/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF77D1E32B9
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539015; cv=none; b=hFaoOlWWV4QWS9G3zNSXuUeQq3MsViii5jXrvtYwjhPpXDvmcfn7zX/ii/gL4dQvPbzplIfMMpaQ0EzKkjolBp7sqDiOfpV7+e87KWXVXTmYpO1o1AKy4PvhS3QXg6BpBgOn7zGakQTtx2F48/tFGCwWCdshBM39XBYwjP+Z8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539015; c=relaxed/simple;
	bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXMiuSE3pTRjAzoXXym22/NvyO7AVlNG0BAUjKqYnaybU3ZKYZjiLrqWp0djuIOSti5VkvxoM+HX8ognJCmqIr45DcD+fmZZf/wX7WjEEoo77yBe4VXvIexmNjR706c6HdHMob5R+G4ihzk/X0qf/hQTSdfE163K55zUrTFsG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=QGGws7/k; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b2f4ac4786so20839851cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539012; x=1757143812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=QGGws7/kVJIDY9xywVYu8fbrNRTUMjOQSM/pT2afQ0C38mEXJPIVH9MVUEZ5hM91q4
         693RRQZzI4IubXohHtAMtXsiTRz04RdT6NMUCkxgtmg771Oe6eMKG+u7dusrAIQXuQ93
         oCvT62Lv+RR+uUDgFoVzoOIU5Y53sYz8T+D0b5FN7qKEiyglH5wggSTZ4Ws0g6pDCOhR
         G5q9fE1JrXdWPdkM0ruh5+OGGhzkFl9jNJGRDz/AmYMNtLPJRJWzu4TZvXavKM63Ll9H
         rve/jnabEs2dAkyaU64hFIK3QPOyQMDjLVek/ES/hwb1Rb97nc+xbL22GEP/VG3uYCAE
         yKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539012; x=1757143812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=JATUX660hQ5vADnsTyPogSCkLmaTCmOQFCAS44SxSV6TG+1iSvG8EMwqkLC/GmWtND
         926CbW0bdLoE55X+k7Ujz+YuOJbso3AJrelkiag9PyT6qourH64wcb6C6F/H5i+Oc3KH
         aF0Koz38oNcZteqEiO3DP1JwDnVYAhizQKXJ7wcqkgwg4/LlbOvDNTFWvv7MJwEpd9dw
         hB27YNI7XyEfZTp9uCUXBcUJVlRsB9M8nu/cBn5fhgAmWfQkqTDmFrz2jq6mwCJcfyRo
         0URSoNC8ArHS5v+vunPgX8bZ8ILcFoQm8i3MqDEvWmo9cR3P1YmVKKi8u4qk159QPBOb
         5RVA==
X-Forwarded-Encrypted: i=1; AJvYcCVDqSYODJ56wtl2IJHY4HOUtFpAnCb7nF6s8BKGuuOc2nUx94AXlkxu3StvD4TJ5jt2JUc6FbDkGv7JMFqn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1GIbjnpc7/X+OOQmOb2nddY+UygU76SDJpCT6vOKshCVGA79
	HC1VzZ5RNW+uTtdvjO/pS3bRA6iHuHy53V8J+Dp8T0yIuPCAVRE/iyFXSOctQP4gSZdGoSZ+XkJ
	/dZpWZ1CuQksBj0W0LayLtRVOH58tVIUCcyIAuuJl3A==
X-Gm-Gg: ASbGncvwYFMYjknw8TXOSck4UGnKCW1ATsdMidj/F0W/X9WJSmFdUV//6g5KBdoTXla
	Is3B3sJca/g9rVxywOXhWTyfZeOCletxXBi0WChLRvLykboHpYufPkvP7UoUdqWMnhDL2eCe8Dq
	AFV+CHxcpp1MJEgXkEpCgqwvfqE2AYaePobx0yKxJhefr7QeVsc0GjsC+Lto2LYORTv+RU/Ldhh
	JUNWmwiOXJ8Z+Bx
X-Google-Smtp-Source: AGHT+IEoXuFZJwCV9cwGNvRYz37SGk7fTBsYXDUKkjm0VNio3cHCVlLucdjG7nkDJhE227CIqVsjn4jhHmK64RhHXes=
X-Received: by 2002:ac8:5a12:0:b0:4b2:d607:16cb with SMTP id
 d75a77b69052e-4b31d855a89mr14707801cf.22.1756539012519; Sat, 30 Aug 2025
 00:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:01 +0200
X-Gm-Features: Ac12FXwherP7pCCw1eIolUuD4CaoGI8lRnTYIDVTJZ8XE8BvqysFq5xqSgK9g3A
Message-ID: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver capabilities
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

Hi Dmitry,

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> a model of ignoring the unsupported Infoframes, but it's a bigger
> problem for the userspace: we end up having files in debugfs which do
> mot match what is being sent on the wire.
>
> Sort that out, making sure that all interfaces are consistent.

Thanks for the series, it's a really good cleanup.

I know that dw-hdmi-qp can support _any_ infoframe, by manually
packing it into the two GHDMI banks. So the supported set there is
'all of the currently well-known ones, plus any two others, but only
two and not more'. I wonder if that has any effect on the interface
you were thinking about for userspace?

Cheers,
Daniel

