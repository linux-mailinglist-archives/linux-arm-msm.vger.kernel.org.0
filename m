Return-Path: <linux-arm-msm+bounces-14306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8287DF19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Mar 2024 19:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61DA281775
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Mar 2024 18:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC201CF90;
	Sun, 17 Mar 2024 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSwKOwES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141111CD3D;
	Sun, 17 Mar 2024 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710698534; cv=none; b=hT0Nw2MgnBUFkioXuTzQDnHXsmAHLo18YnDUnP/NjEGqoMcHbmyLLqh4LQxAXjr117RLI3Ds8qYLP/QXSgvE44ErrEwA7QKDthR7szL63yYv/Iq89x5Jlje0B52IAR2ZH6BZXRDul1Sr2P5tukYolXkzOYEtYNQdNaQqq2M7jYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710698534; c=relaxed/simple;
	bh=ZzKswZcQKX2b6O/p8Hpk2aTFlZRCVGrgKVnNZ2758gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VUBoTyTQgc5zKr5Gv44QpuB4Y7+M7DyApqvEpqYRLN/UKUkgBtvcdyauLj8ye+6SVFdMbJsnif4cgp7p1Akr0Y2CeS+I3tc1RKAoSXkGrqsjKlBwXNffYXCRCUJ0C0q3ucVNc1oRfLx6ET8E33zpLbc9fWW24yF7tpeCGVXLAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSwKOwES; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513e14b2bd9so1313041e87.2;
        Sun, 17 Mar 2024 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710698531; x=1711303331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzKqTULejlRdhOCK57EtCsKlcFoP0JMCOwXzk5JnzwA=;
        b=fSwKOwESMOgVLeHzDPAMnzhTPnPn29BlvxP9/AMhV00hyysEziN5C6MVPShnCMhmk/
         0RZMIy02rUiI+/3QS+2Use8SLsz99QUYH7Q3CL0F6jBJzPTpTyTQ1FCEx0aj2aZlXWmJ
         Baesaf5DHHWI2MXyBDWafGSFzyhSk8a8Zhq9reC/OVx4tdI+yiZP1DRgRd5Vi3FzIW0C
         RLSlT9F3GT/sx/zgdOQLXFelUHJCuoUXuNps/NKuv2fOKSmV22kTGi67MMXNYJW1xLFQ
         2e/T1igHzjqFjQ6tppG1j/6YbpTVaIKpMK6NeO/Zyh7AldzZ/cOznabwuP/8sB534Q8y
         cDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710698531; x=1711303331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzKqTULejlRdhOCK57EtCsKlcFoP0JMCOwXzk5JnzwA=;
        b=iFBpdmSoGYu43x/zYx2xl/QtFw2nibY1Ie0dvrHC/2DlQZJvQNRSl9mjlXzZaso/Qc
         U2tU3MSrEoOyu3Ul43ulhTX1KZ0X0FuLLy92jP/SJBtlNbDF1Ra3N9wF3cUljjB5q5T5
         TDnkhgqQRuMO81/6nrV/biOqHQ0rw1s/KHBPS1ZPkz5WxnOfd8k2ZKZbBONojJHkjOqO
         LVyl7dNWAFK20j/oIzdVcwq2UF8UReLETfBavQB+jHw5Zt3B/eR7BCPjjOgyF4r8+/gn
         HT3jMa8gJoEaBP3KdhkhokQckrNKdFOmm2n0hFYN2+X+Ia9WmY1bEoKBvQPygxk70PXT
         PgCw==
X-Forwarded-Encrypted: i=1; AJvYcCXgQDmpvgipljXIm/+zeTIJKRFEN2wSQ9cK/2ZLXlLwgXCZRTDhzalValcc/LtxeQC6vRinqDt6IV3MNdVw1aeELHlmIeXOr1SIC4IzlRtOa+qxWhKs/LWdF4zRNfOuIoYv1yYF5eEvyBn6ezcyl1vrQoJk/iCCslQHWc14OuYx1WS0IkJpfmB4iwI7tF9e9koY7cgwS5gPthbrWeTxZ/TxZWGIucw=
X-Gm-Message-State: AOJu0Yxpq7aWKfuXFRGLGnA06AYGX4jL7wUzxfo91JIuDLWPDtqM9+w0
	bWyXxi4BreXU5rOV700Oxwmm9tNy8QotWOTtvpQj1+XP8B3KdFtj
X-Google-Smtp-Source: AGHT+IFCus1zUTDDRuMKlHSuX7mZxcmUN2oBoDJZChg/lN8tzdLoS7uVD3wjUYqAFNQG1yYzEapq8A==
X-Received: by 2002:a05:6512:3294:b0:513:c95c:4dc4 with SMTP id p20-20020a056512329400b00513c95c4dc4mr7747510lfe.7.1710698530912;
        Sun, 17 Mar 2024 11:02:10 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com. [213.67.237.183])
        by smtp.gmail.com with ESMTPSA id g21-20020ac24d95000000b00513cdde18efsm1318346lfe.75.2024.03.17.11.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:02:10 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
	by betty.fdsoft.se with esmtp (Exim 4.97.1)
	(envelope-from <frej.drejhammar@gmail.com>)
	id 1rlupl-000000005e0-3xex;
	Sun, 17 Mar 2024 19:02:10 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	amd-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sean Paul <sean@poorly.run>,
	stable@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 00/11] drm: Only try to set formats supported by the hardware
Date: Sun, 17 Mar 2024 19:01:25 +0100
Message-ID: <cover.1710698386.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When userland uses DRM_IOCTL_MODE_ADDFB to add a framebuffer, the DRM
subsystem tries to find a pixel format from the supplied depth and
bpp-values. It does this by calling drm_driver_legacy_fb_format().
Unfortunately drm_driver_legacy_fb_format() can return formats not
supported by the underlying hardware. This series of patches remedies
this problem in patch 1.

In order to use the same logic for determining the pixel format, when
a fbdev adds a framebuffer as userland does, patches 2 to 11 migrates
fbdev users of drm_mode_legacy_fb_format() to
drm_driver_legacy_fb_format().

This series has been tested with the nouveau and modesetting drivers
on a NVIDIA NV96, the modesetting driver on Beagleboard Black, and
with the Intel and modesetting drivers on an Intel HD Graphics 4000
chipset.

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sean Paul <sean@poorly.run>
Cc: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/

Frej Drejhammar (11):
  drm: Only return supported formats from drm_driver_legacy_fb_format
  drm/fbdev_generic: Use drm_driver_legacy_fb_format() for fbdev
  drm/armada: Use drm_driver_legacy_fb_format() for fbdev
  drm/exynos: Use drm_driver_legacy_fb_format() for fbdev
  drm/gma500: Use drm_driver_legacy_fb_format() for fbdev
  drm/i915: Use drm_driver_legacy_fb_format() for fbdev
  drm/msm: Use drm_driver_legacy_fb_format() for fbdev
  drm/omapdrm: Use drm_driver_legacy_fb_format() for fbdev
  drm/radeon: Use drm_driver_legacy_fb_format() for fbdev
  drm/tegra: Use drm_driver_legacy_fb_format() for fbdev
  drm/xe: Use drm_driver_legacy_fb_format() for fbdev

 drivers/gpu/drm/armada/armada_fbdev.c         |  5 +-
 drivers/gpu/drm/drm_fb_helper.c               |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c               |  4 +-
 drivers/gpu/drm/drm_fbdev_generic.c           |  4 +-
 drivers/gpu/drm/drm_fourcc.c                  | 83 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  6 +-
 drivers/gpu/drm/gma500/fbdev.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  6 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  6 +-
 drivers/gpu/drm/tegra/fbdev.c                 |  5 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  5 +-
 13 files changed, 119 insertions(+), 19 deletions(-)


base-commit: 119b225f01e4d3ce974cd3b4d982c76a380c796d
-- 
2.44.0


