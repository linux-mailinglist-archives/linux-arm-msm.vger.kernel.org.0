Return-Path: <linux-arm-msm+bounces-23978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AFC9150D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF86FB2151D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516F41A00C8;
	Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUGeOaL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA619D063
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240439; cv=none; b=FN9RivGLYcsymDMk7sRunpztsDCV6rdqJnwmAeZi6AaDqu3wCQ+YX7w15f8RGMwkS6bREqRV99PNj6oh7FPg8uJUaVy0sHpJArFb/gkxCRzv6fQyNu5M5ooxNOfyJMXCf3cs3T4jpbZgoTn8GtP8Vypiw5ZCDix3fiV7cEVVtMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240439; c=relaxed/simple;
	bh=5G5xU+usyXKQEWWHSzwZ8U+Pk+eOVAYEhr0QinbHG0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gv1nOQzfrivapa2MdO2WTC7I3JOWTVGo8ye3KqTrWflEImbnXzVqFZ487jdq/EmwQcA07yw0htJ0CVi0ZrH4JyZQtDVHG29+I092OyGfjzYT7ownDVzIVrHBblXCiyI+zQ2j/empZ+6CFv+RZGwvZbkw2L+20H7D7EMaLhC3ww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUGeOaL4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ce01403f6so1802886e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240434; x=1719845234; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfVsBcar0ui8s1zj3On5ua6XlFc0ySN4BYtQ0MvdceY=;
        b=TUGeOaL4uNnWWstOANE+hLJtkZpBr5pYGVPt4GZ+1JONWYO0EMw8xVSVSvF7BhvXrv
         vMppDzUn+bA9xFWLbnUzhwyUrH3GhBsYvz8lZUEqsn2qI2zGfeySbaUd5mumlIWoBJS7
         SxofkFSfsPCUGHAI/BeFRRyYJm3uivmOxbbfhIO4TwLTeWc54gPb1EstHqo+q1dBgY1s
         uI4KOloYkwgGT3mBwhh+m8A1EeU10YVvRSJnzLmvXoYorcG6zE8/BveKMGza52WOMJV6
         mkTurTjKG7G+6/398MEwO7AtIq4jyHb1z2tIINH7tBBbRgbzAuGosLVvOP6EUUC7TzTV
         N2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240434; x=1719845234;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfVsBcar0ui8s1zj3On5ua6XlFc0ySN4BYtQ0MvdceY=;
        b=nYbbim2g9LqY59RZyyj7CtZZcDFJ5i2hFzyKI7yCVFOWntPE+esLciutuXEo3fPfku
         fdgzgixU7hjuhVMn5eUUhmA42gvdrLHy1nym0p1k4nd083MUJQbEfZjxzQd0Jm8N1xWG
         mINWDh7Fs9FoBaY191dqA+v/LFS3dj8zlVF8fRPj40VFY5wzfjUwJPLjGwoZfLUA933v
         v0qfl3/N+d8HtgyLEGE8B92QqJc2IiYt8q8l+zBgS1tp6JLI24L72w9i4dTvClPJjMn/
         Q9tz4INfnVTvIJN+X38hci7N5ED9RiztMZOi6sjYyNUO3UWyOeraoaNIyC6/ClWJtD6U
         +LVw==
X-Forwarded-Encrypted: i=1; AJvYcCU8PJ63KZ56KPFLDFz3UhroP/0ibLCFw+OpgHUg0NAayV0qJbpNi7+/n6f5JAJf+8ONFZXBPYLNBG6lLiXzeRgebSQfXY5osI62LeJTJQ==
X-Gm-Message-State: AOJu0YweNatOCaw5CwKVdoDF+GvM9KGNLFDUokLhvxpVqmfaNBsj3TLo
	9lKadC5Zgjb6H1KZ+YuXm9VoagjlGvEjTWgFzEyHT44vlMz1Rs0TBaG+1dLLBIw=
X-Google-Smtp-Source: AGHT+IGmp/rHeO28Mlk8vpwsjhoJ0XTX60eguxj0boTEKdnqlgu0JH7zROQRNlRQuOV3f1r7M3hIjQ==
X-Received: by 2002:a05:6512:1282:b0:52c:e0fb:92c0 with SMTP id 2adb3069b0e04-52ce183b75bmr3255575e87.34.1719240434013;
        Mon, 24 Jun 2024 07:47:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/dpu: be more friendly to X.org
Date: Mon, 24 Jun 2024 17:47:06 +0300
Message-Id: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqGeWYC/3XNSw6CMBCA4auQrq3pAwp15T2Mi9IHTKKUtIgaw
 t0tJEaNYflPZr6ZULQBbESHbELBjhDBdynyXYZ0q7rGYjCpESMsJ5xW2PQ3fPXGYu07Bw2+gxl
 aLJgwXJfKFEyhdNsH6+Cxuqdz6hbi4MNzfTPSZfoW5YY4UkywIc6K2lW0dvR4gU4Fv/ehQQs5s
 g8jCN9iWGKoUK5gpCgLJf4Y/sXQfIvhiWHS6rQktZT1DzPP8wsUkhBuSQEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5G5xU+usyXKQEWWHSzwZ8U+Pk+eOVAYEhr0QinbHG0A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbua5W08waM8u4q9QigIOgudWK/EEVnzTBUY
 kyo0l2ZaM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7gAKCRCLPIo+Aiko
 1XNfB/wPIjWsRsQJ5aCndD84N32E/7XP4jop0ObPO/W2yT02ZDasGg+0xqb7GCaVctwxYEWqdY0
 rTppRcHkFpdPfPqdVls884eB2zAuxk26PPWtc9SlvIoHhEX6NFKaMyzeHBarqiLz72wzgER0y3s
 9ry7voE1a7VyqAwOdtStocpP4nY7zhPDv59IlbK0JixLr7t7e/eSK0xuMt6joKrBPc+o/fukOHA
 YeHTdsSDAs5wnehiNlc13+qAxRUoO20sre9miQcaJf5rbmufjreXykN4UkYkeQ4l4kYW5cm7cqH
 Oo0uyY1B2v6UkAa22nmq1PmZGhCYX6ucFVsBCTMV5xsYdRQ4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fix handling of the not visible planes with the FB being set, as
  detected via the kms_cursor_edge_walk test.
- Link to v3: https://lore.kernel.org/r/20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org

Changes in v3:
- Reoder the functions to pull up a fix to the start of the patchset
  (Abhinav)
- Rename the _dpu_crtc_setup_lm_bounds() to
  _dpu_crtc_check_and_setup_lm_bounds() (Abhinav)
- Make dpu_crtc_mode_valid() static.
- Link to v2: https://lore.kernel.org/r/20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org

Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (16):
      drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
      drm/msm/dpu: fix error condition in dpu_encoder_virt_atomic_mode_set
      drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_mode_set
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: drop extra aspace checks in dpu_formats
      drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
      drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
      drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: make dpu_format_populate_addrs return void
      drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  35 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  62 ++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 243 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  30 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  47 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/msm_kms.h                      |   6 -
 14 files changed, 196 insertions(+), 279 deletions(-)
---
base-commit: 5c522ecead93987bcb0459f0160d8625e46d78d2
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


