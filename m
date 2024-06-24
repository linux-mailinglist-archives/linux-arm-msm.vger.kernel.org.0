Return-Path: <linux-arm-msm+bounces-24029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38F91587F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C3EF1C21D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80951A08D3;
	Mon, 24 Jun 2024 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xcyu5aVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1519AD93
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263631; cv=none; b=VQc1IGEuFtTOcz5Ozx74BoLo4RcImnN/IfOs3J9bg82A22MXc+r87YG70eAvS1NiOHXveqEBvmBCGGS88lb/Rm+vlyesUL9JAmp3641kZrL9qxbwXJFAMpUnKMbs1DhwhFRRHPV8RzyASfQkPvTgGTfOUhEiz/6Rvk1NGAJsoaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263631; c=relaxed/simple;
	bh=UZZ7KSs7CWwTZIZFzb5yNp2b/so4xjaqpHcSLMMe4Mk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cor4CNaNkQ+KEGN1eB5r/uHm06NvHqPIIETx6HzGlnGkiNj70yVUVrXukFnYcETKgfONl6bOdkAL9hxitt0wQFVwui5GI4KiYnsVGWawZouSgQ7Q/p37xK9dgMf06KoMkbqRYBXXyZqJ+uZlVKH0acUjURgYEGk+xUk/CCV04Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xcyu5aVL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ce655ff5bso1450756e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263626; x=1719868426; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urZQV+y3QNxwreYOcv1wFUORMtdQQg7g7j8r664owVY=;
        b=Xcyu5aVLe9nmC/+AQ42E9go6ctRYuZ8EXrlx1vZV6Zh5nTykIzRM/jwHJ0KQXEAw+3
         I0jUT2OtHTzHeU2+pYc/HDizQDvGbuvQgEmZxEnfQRGsQuDF3rjOTOmMRksvbpq2sGKv
         NajplOVVXY9PJHrA4QoMUwRkVM0A4DPEpPck4I2jlCVrSjM6+IWZJyJrSfQRbirxCTnW
         0vsfn8SPUIog//ZOUgJU3WmVCyYkMEPF/CVhBOqTJYsti3GrcQq906wdn1utklKWZBVG
         Ni8Q6pggGhP1r1ZsCznarvxY8QXPm7dx9Gq3zhHFtqknz06dTnrmpU+0oCgTR+1GVhXh
         MLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263626; x=1719868426;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urZQV+y3QNxwreYOcv1wFUORMtdQQg7g7j8r664owVY=;
        b=FqBEzAxHt7Sk8lWz4q7NY2LwSYN8sWzBhhh0Q8LvnpiuzDLpT8sTHYeYv0A8hEFTVp
         HSadAtyiHpCBRLYrvKSAWDtPyclCXU6usXL18hxx15ci5MwVzuZf3n/32szTU8yuNkMf
         tDIfossHDhPRYLQVJSLnDc3yDMHMfH7NPcHeAnLcBIBxew84QteWbMaVjeyuzNkoMiCg
         K9LWB2SCKr3ywB7UUp3HGz8doC6Ip8NG4j9LXFpRH2dBvsdn21baSCTpizK+Uj6G1F+6
         mMYcF7wgycNF96WTup918QW5PkH8dHtAVuurBJLMSKGLORtItF4BD+pCls/V5gyD0cCA
         8W/A==
X-Forwarded-Encrypted: i=1; AJvYcCVk7oEveeA5wINCdBmo0N3Mniv37R6MD4xnaxNu87ETUU8sGXYFVWE8+p7Osdx3X2fo/AB/7qZDyoyvj1VuHKLbc+fwhrQjI9hrk4rxfQ==
X-Gm-Message-State: AOJu0YxLnWVBEnn7Th0AzksnmaLIoyPWNJy8r4oDqLplIDbFk3GLRCWU
	12k631eRUBnI0Zdsme6aNpbQsnnv6VhRhFVQv01SXpGaU7opcdEjUbYALtMwXVVcrZwPgU+yOCK
	LPss=
X-Google-Smtp-Source: AGHT+IHEDQNwz07UQQxJde+XyM3nCFYemupYzmdTTNO3MLuVFsO+9LInnRA1VbjWSUeWS6C4YYunpQ==
X-Received: by 2002:a05:6512:3e1c:b0:52c:e084:bb1e with SMTP id 2adb3069b0e04-52ce084bc12mr5970691e87.13.1719263626404;
        Mon, 24 Jun 2024 14:13:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/16] drm/msm/dpu: be more friendly to X.org
Date: Tue, 25 Jun 2024 00:13:40 +0300
Message-Id: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITheWYC/3XOTQrCMBAF4KtI1kaSSRMbV95DXKT5aQe0kVSrU
 np304KoSJdvmPfNDKTzCX1HdquBJN9jh7HNQa5XxDamrT1FlzMBBgUTvKTucqPn6Dy1sQ1Y0zu
 6a0MVKCfs1jgJhuTuJfmAj9k9HHNusLvG9JzP9HyavkW9IPacMupY8KoKJa8C35+wNSluYqrJR
 PbwYRQTSwxkhisTJDC5lUb9MeKL4cUSIzID2tu8pK3W1R9TfDGwyBTTN0yUlgtnhJE/zDiOLw1
 YQB6QAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3580;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UZZ7KSs7CWwTZIZFzb5yNp2b/so4xjaqpHcSLMMe4Mk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGGwgmYMknmUybrPk3kTGNITMSptLTS/oH3R
 y6LQ76WZESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhgAKCRCLPIo+Aiko
 1anUB/47qdUTX+IoDyXInMRwcX5RkVGqrniKcYZra1SYJUayxAtb6CkwnO6JTo2PKi91i0Cd8Kh
 iwWOoV3EwIcNvrYm1ahhB1Ss9NJy6R+PqlwFoRf3Stuj8sw31Iwm7jvzzQLkr1hz9DHaCDUv9ES
 3a5+W2uSeiwbn2xoUstoDB2x5PuVn9v+VdDgEZVvGwSm1GGakDLTY17R1LFtTKYAGq4o2XahHPx
 NXjDuHQfXhWYt4D0JpQYq/BkhzJ7X/KrM0wlWsmmvMr2KrUlLUz8N02jShK/Z8NSlcFO/2HOGJZ
 YABLYnQeNnFtUlmSMAaQRJ/UXa+N8t6d0DYwNmtZEivYc50V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Fix crash in the writeback code.
- Link to v4: https://lore.kernel.org/r/20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org

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
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++--
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
 14 files changed, 200 insertions(+), 288 deletions(-)
---
base-commit: 5c522ecead93987bcb0459f0160d8625e46d78d2
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


