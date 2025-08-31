Return-Path: <linux-arm-msm+bounces-71321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D6FB3D3BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 15:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03630189A3C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6062C257820;
	Sun, 31 Aug 2025 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="SxQv0gk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2008242D7B
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756647999; cv=none; b=tpjemedFVqkl85U4TKNe9pnBiQ9BWOyqhhVrxPhT8P3KE4Lnnc7q1BsS90AKOFu5XUFSngaRkWgSYj+0A/DGCV25joaCfbjx0RvyPci9f39LtGCH+9tRFWrUvY5HiS99n/m6mvCAPRa8/TF8OHi6XfvZTgI+9UPbufSK1wvxs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756647999; c=relaxed/simple;
	bh=0d5wm8C4Q5yjpa9NOEPusF9Ma+0IGpCMou/z5myvIx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOpTn5TdHZJlNJPj0yQC34+hEJ8poGJUxSQRdL6PXjEjrz689cIjZeByrV1JOf+mESQoVm75zhZODZIowqdi+yHNmwkwVBDci70IOyWfDqV+PRT8bzTpXfBgyZSr5xwF8JdRjB1ndrLViIc3mqZ7oNziNKsI09xM1fJFq9WzXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=SxQv0gk+; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e8704e9687so344628085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756647996; x=1757252796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=SxQv0gk+gVRSkfvPkkfLfl7PHO+1eabhvWdBzNey1YHeu1Ir3/twY5tWUG/jAlCmDH
         ZOELCk5K7wkvThoACMveqwcYZVjN1uKmZcVXozZZrt7VMx8gNUy/cFkBFPu9TW+IN+r2
         R5g4kGTKS6d4YFsB6AVlcUKdjK/x6YtN+7/mxo6ciNGqbIhTaGi6neGZab9CBBMB/M83
         8o3ED/hiBlzXmL7A19TMoy0QBHXLl9DsApb80+1pn9+yoU3V/DUG+WIsXXzYpTLbAe1K
         rX9Ry2gfUAy3Nc+h6PJ0U4a+iap+AmxaQAWvNB1aa1ibgQ5eD+62V/VXGCrHmX+Sn9me
         Depw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756647996; x=1757252796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=nOJIe6na8ahsk27/OKhokz8R5yCHp1OPozgKkoP9l2nQ1GWpkRlpI1KA1NA+tDperj
         bcsRXCRJ4sMM5ftEbUZMSqxD4vhNaOK6A4Ey5xfqS/1VESbgdxK+jhsNcMSOAQX/RQ2s
         OYOQxi3Dpu9x2SOAievNY9O8i+2oOLLpAJnbvnh2KDIDD+TC4SHkdx/IkJHQEd0XPQ1i
         clWHmc32P1SHISEDpJJgOHNQJyMBmaVGw4n5ilkJ7m2Vi7QiFJVUQRpNhQyKB0zmbku/
         dBENoFjWqvccwew5qepA/98+fPxpNrqRGFabDONx48llS1SUkbBrU5A5UwHTge1oyur/
         7wmw==
X-Forwarded-Encrypted: i=1; AJvYcCXSn8IZZDunqT1R6bcfKdEAiKYrG2RtrH37KnNXp9JQNxMHXn5lq6Ce5Z/U+W2FLeXVUVfPi21oOmdzIQc5@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQ7nWzJjYzTxm3OyqPdKlxKuYOWJSIme/Xy/v2uW+uVubnjG9
	WWA/F1fxgTmb+EJ2IUy9Ah+dgpfLrOIP2m9CJGEvgVGrbOqL6ArD4DEXF/FPXNUteEd676xu+C1
	66aLk70vtCPbbC7gi7nNu2bly7+aUsCvDMZJAWPnH9g==
X-Gm-Gg: ASbGncvdQ8aO0HSu5Yoq/hzF9GYOAjqzDj2XD1BcRbRUiji/1/8FXMzT9aT+LaaMMTd
	rZIG9831aqRVxuQO9x2ZCnQAUN44Ucklb7pe2ZzeHmAj0RQa4x995k9VFEqOvsxUshke5kiZiix
	NU4sejTfWiDL7aVu+2rTj60lJtCJ1R6RKvLsCrKhCMc/kJ7PwxzyiRKpTZanTMhbidSUjJh29fA
	SFupQ==
X-Google-Smtp-Source: AGHT+IF0dh6mtaD+ci0SXGWWOl3LWwfmYnKKOgfGlK7FZ7iXiuG8d9Mqq2iCDHrHKRWGSRl6Gppx/kRr2i15hBvQ/kA=
X-Received: by 2002:a05:620a:c43:b0:7f7:c2a3:eaa5 with SMTP id
 af79cd13be357-7ff2b9817c6mr503403385a.68.1756647996439; Sun, 31 Aug 2025
 06:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com> <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 31 Aug 2025 15:46:25 +0200
X-Gm-Features: Ac12FXyJd7t7ZABF85TqQwXSEhwFfQP0deD84tmrq8IHkkpEGuVOeuzNQcUs-Sw
Message-ID: <CAPj87rOSb90S_TeA8Cu5kd-M8bbfiE0fvPzgr9Gr4e9_rfZeFQ@mail.gmail.com>
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

On Sun, 31 Aug 2025 at 00:29, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

Oh right, that's really interesting.

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Yeah, that sounds good! I wonder if we want to surface that from the
debugfs interface: maybe just files named 0..$numslots with the
content of the infoframes, one named 'slots' with the integer index,
which infoframe type it's currently carrying, and which types it's
capable of carrying. Then to preserve the current interface, symlinks
from the infoframe type name to the slot index.

Cheers,
Daniel

