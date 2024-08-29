Return-Path: <linux-arm-msm+bounces-29960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D32964180
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D611283BF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EA018EFDD;
	Thu, 29 Aug 2024 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8yEnc41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255ED19067A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926748; cv=none; b=Ji5KW5uTo0TKnj9NO+MitDmei1JXSGY2AQs+yvabt0iEYS4vHHML8bHWpmD/p2OIjnFkh8kp0tgckfTzv/fG2q4PBPQSxHQNmugUoMafAg4nMHFj3a3k3va8RnCw9f9m+sLn3E+RblglUP0RUtwRvWpvAypxKo0PGZgd0RoNhxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926748; c=relaxed/simple;
	bh=Iuc0O1yLGF/gyUtcBEXqUDSMK4I5nIldsvZ6bLqKzZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dV5Nvn3M14P/t6uPFNdenZZk0ax+kZl/afs9CKin8Y9ChYaesMDgvb9e+teahNZP4QISWBg87KJam4EcWf0r7AJeHb3Yg/2NaCCPu517Gf9SF3o+BSkf+A9uw9qreCc9Hzyu0C+Iglwk1xeF6kpPAaytKmDapfeeLiOTd0FuiG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H8yEnc41; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714186ce2f2so424570b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926746; x=1725531546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
        b=H8yEnc41QsON8cXKN/pKXSlgPZrjWtJhkqLym67c4eXeF8WPnrzYdX+Nob7HQYbB/s
         4ildrpZjaIBp55aWkcHOiqP/TUcbCF4u0S/ajJEvOFKzlCDHUZk238rSpFOOL9nfOYZU
         qOrkownnEBT166iecUT23v65zlFBQTVAOY/802lmvTwPH2rUx2jWNgyVft9PDGOQxkEU
         HHAwMb2j2H9c5By4ojtN/ouK6DJQCFZ5YWiZgiaxfzlU0NjN5rQKhtG8AylwXGHWQi21
         BMNBa2HOVipkHfbkUMHGUvYOcEFuUOZK8kfAkzV8zD/6s0/SUHG3QJbSxariUxLR3KgG
         LARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926746; x=1725531546;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
        b=VlFJk56l3rOUOIeAp481CLbLHPfY8jUMXgxNp3jF3KQUFL6Ie8UxOKdpw/YZ0dTuxA
         b+0xfshpKxOsqtJoaJb72C7sEw6NpALCAeAMVzrEFzZU+b5IC19ZgLswEYSe3RsCNJnV
         Ur6W0dS0PYXXM8iWbul5vayrbtZDQzPA+v6m/b1MyrSCqvrj+EVLPylS4Ah8Fhe0WXHT
         ArJ/DcWZutFHhZ09okgUukytugQzfU8ptba1zlZ3i4VSlARlEkGT/o4RXWHY0AYxIatP
         JZiZb2iDpxc9q57xRTMMkEzRSKU+Q4Z7e4wHQ12WB8X9WaatQP5mWfK2N1fkotk5kCtx
         +d5w==
X-Gm-Message-State: AOJu0YxEjxOoQGWoiZ43wgXECqXSVEQyy2rhOLiOUBFrUqrHoVgEH1Pi
	L5/ac9gCPONXMl6clWZiHnz/XfQasLmaO6IjEPrM+p0EZtjkcEjargrtah38YCPYgKQi04HhAB8
	7EiBU4g==
X-Google-Smtp-Source: AGHT+IHE4Do/N3GkCtLaAyB3B6mwF3f2W+Yg9mp1g0ej7usEm9UI8mQxD+BXOiKkv6+kMYM4hnVftw==
X-Received: by 2002:a05:6a20:e196:b0:1c3:ff33:277e with SMTP id adf61e73a8af0-1cce1016e8emr2628682637.32.1724926746319;
        Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 00/21] drm/msm: Support quad pipe with dual-DSI
Date: Thu, 29 Aug 2024 18:17:29 +0800
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlK0GYC/x3NQQ6CMBBG4auQWfsnbZVavYpxAcwgXRRqR4gJ4
 e42Lr/NezuplChK92anIlvUuMwV9tTQMHXzSxC5mpxxFxPcDZqCbw02D2sxJUZehhGJVfFeO8a
 a9VOkSwhgx74/S2+5vVIN5iJj/P5nj+dx/ACmY+0hfAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2929;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Iuc0O1yLGF/gyUtcBEXqUDSMK4I5nIldsvZ6bLqKzZQ=;
 b=/XAz7k9LePyEc9Awj75B8UirKvpOKm55t65AeMenHcISQ/oiIJItRucdOO9puyB2zmAPw9AGJ
 hz6VuF0WZetBqwEXHRoMioS3dxbrjgu9ikDjdhx3xAFdSAWcWcnFNfc
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

2 SSPP and dual-DSI interface are need for super wide DSI panel.
This patch set make changes to DSI driver and extend pipes
and related mixer blending logic to support quad pipe.

This patch set is based on virtual plane patch set:
https://patchwork.freedesktop.org/series/131109/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (3):
      drm/msm/dsi: add support to DSI CTRL v2.8.0
      drm/msm/dsi: fix DSC width for the bonded DSI case
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Jun Nie (18):
      drm/msm/dsi: pass the right width to dsc
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: Add utility to get mixer number
      drm/msm/dpu: Support dynamic DSC number
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: request more mixer for 4K+ DSC case
      drm/msm/dpu: fix lm number counter for quad-pipe
      drm/msm/dpu: Support 4 mixers at most
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: Support quad pipe in header files
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: setup pipes with 2 set of stage config
      drm/msm/dpu: blend pipes by left and right
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: support quad pipe in general operations
      drm/msm/dpu: revise debug info to support quad pipe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 119 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  73 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 385 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 209 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
 drivers/gpu/drm/msm/dsi/dsi.h                    |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c               |  54 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c            |   2 +-
 include/drm/drm_mipi_dsi.h                       |   2 +
 18 files changed, 566 insertions(+), 393 deletions(-)
---
base-commit: 9651fbfb684e7a1288dbae3bf1f15cd484c0217a
change-id: 20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-d2d6b3eb1d57

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


