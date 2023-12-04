Return-Path: <linux-arm-msm+bounces-3268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4B803426
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF4B209D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11E624B2E;
	Mon,  4 Dec 2023 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0OduAbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF27D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:14:58 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bdec453c8so3069196e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695696; x=1702300496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FXfNmjk0/FPoln77FIQlKYMoeFsew2x/wYq+84u+hg=;
        b=K0OduAbiizr31I+8G2isn+BmSsbPL+3BeO4N7bm1MmdwpyYfPULBqg3jMfFqOQotub
         Ux5vRrQXDboWj7BBuLcJhDSHhV8AyqWzCMhj9mlmeMGS7fbqQTtgM4A41sQBgeiSx5zM
         c0WmZdVmmQCKYLVkbLBI71bbJJhMaGvguI2CuvwDRvHhRnv5h01v6mDS9014fcOk1rSz
         HJbnH3si/k9UbDnSlUASnInIz5Z6Gv67TUC3ggPKgeHVbn2Hl2/M1lFWN+O/ba8DGw1A
         NBpX3BaK3r7XVkTSl5OWe/PP1ccUOYDHM4zYp2PfhrqIIoySpUYwx13WMpDz4+nylfAY
         SgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695696; x=1702300496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FXfNmjk0/FPoln77FIQlKYMoeFsew2x/wYq+84u+hg=;
        b=K0XvJZ3tJQzkLIcI5PhdOTKILe5631qBdXVA2LBCi9IKTmX06WkGtZWzVXn1BHgvN8
         qNrX3AwMMim5rxwvF6U0YXZ+ENEIuELy39iAybGLJB+2x+ZMqhyP7yvHl6Qv4f0lsTUQ
         W+6ypgCBhCdYHp2THLIMYoTXWZYFxYLsPPnlVgX2sOvzSR6fSN+kUjUPoV0MkoBPS0ax
         Tgw6/hoD2Q44solWUHB2iwiEjO7dZOhE0KAxzwycaoJdOuAwgTl+UZeJ+hiv7mfxQ26/
         pj8VaPnV1ww0hwcHH4DAENdBBnm74khXxG5T7GiLvC/YXTRppYlRrObc0WPtSVTEp8JP
         Qi0g==
X-Gm-Message-State: AOJu0YxPL9HznC3jxm1VAutkAniWwdUWWA4LJ6f4/0YZkr61iMfCmYin
	TXR5p3Z/ku/Da/tVGdlHYBwviQ==
X-Google-Smtp-Source: AGHT+IGD0A8642jBm/8iajKiw6EkrNIqrKxuiUZkj2SDjATgXK7NJGhtxWQa5GEz/hYoM63L/w1G1g==
X-Received: by 2002:ac2:5f5a:0:b0:50b:f792:3265 with SMTP id 26-20020ac25f5a000000b0050bf7923265mr732882lfz.123.1701695696448;
        Mon, 04 Dec 2023 05:14:56 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:14:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/7] drm: revert solid fill support
Date: Mon,  4 Dec 2023 15:13:47 +0200
Message-ID: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI.
Merging it was a fault of mine.

It has neither corresponding open-source userspace implementation nor
the IGT tests coverage. Revert this patchset until userspace obligations
are fulfilled.

Dmitry Baryshkov (7):
  Revert "drm/atomic: Loosen FB atomic checks"
  Revert "drm/atomic: Move framebuffer checks to helper"
  Revert "drm/atomic: Add solid fill data to plane state dump"
  Revert "drm/atomic: Add pixel source to plane state dump"
  Revert "drm: Add solid fill pixel source"
  Revert "drm: Introduce solid fill DRM plane property"
  Revert "drm: Introduce pixel_source DRM plane property"

 drivers/gpu/drm/drm_atomic.c              | 148 +++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c       |  39 +++---
 drivers/gpu/drm/drm_atomic_state_helper.c |  10 --
 drivers/gpu/drm/drm_atomic_uapi.c         |  30 -----
 drivers/gpu/drm/drm_blend.c               | 133 -------------------
 drivers/gpu/drm/drm_crtc_internal.h       |   1 -
 drivers/gpu/drm/drm_plane.c               |  27 +---
 include/drm/drm_atomic_helper.h           |   4 +-
 include/drm/drm_blend.h                   |   3 -
 include/drm/drm_plane.h                   |  90 -------------
 include/uapi/drm/drm_mode.h               |  24 ----
 11 files changed, 86 insertions(+), 423 deletions(-)

-- 
2.42.0


