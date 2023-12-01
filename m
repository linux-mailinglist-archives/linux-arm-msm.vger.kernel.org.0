Return-Path: <linux-arm-msm+bounces-2951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216BB801510
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C68C1C20905
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B116358AD5;
	Fri,  1 Dec 2023 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vvLid1Qh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFD410D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:48 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9ef682264so74801fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465527; x=1702070327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20zjbppwrtzRWByvdBLmKkSD4EbfKKz8iGPt9sPg16s=;
        b=vvLid1QhPFvAZA3zj6EoGDRbincR1QWir5GcPMjjdVXZFmCz3NRkoljfqbkNsb1Dd0
         XnlEwvU1sRzDbej8ZSNTDpEI/buBzRW1V1+7LiMAa5yVUqEQBza7DsDM547VVGemzzd2
         ZQVkoa9Wo8ZFsWzj8gKgExa3XOKxZk2Thf0AaQtRWYQKA0UcxfIpmLjTtAqckSivnSqm
         Ws1LHg+h6yHliaUV8iSEbbWu7jcBcSgibYA6VgGwa/5gRWPebimuz73gCf8b2Qe+/CEu
         uoKhxp+zkeRt6FjE/ZELA7Mru3zv2zHqoadOXSlV3PqqJWaGw4+/ypzSFEP4D4rlQ+Pl
         zN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465527; x=1702070327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20zjbppwrtzRWByvdBLmKkSD4EbfKKz8iGPt9sPg16s=;
        b=kflWkxa2Dty0LgC6YiiNIc7FBWJP6dk9xsX1Vls9U/VeA+GNnxIB3XnnU5I6m2xGHJ
         UxRp71xp3USr2axtYIg2WGUkgqtvw5pP3r7iNn83/ANiokqyjXagpHseERt6ug/sKnPO
         woogBgjkRwsxh3JZE1o7qj+pbs5Fnw+HCCvqehKWMzGSC58mD4NxKbbnmYM6HWoOct2e
         gUTj2beFWpengGSTRFkYjGxVEOinvnv8W0cXjeIYfNxxcIvWrIMH2+xdva4AnpzFiMVd
         u+yRLEGnAIyA1djJy47Q0IBpaCXzZb/OT64/vBMQdZwUt+WweLSoagrGuAjcXP77nRAj
         KfBg==
X-Gm-Message-State: AOJu0YxfO+H3foNxuZacGWdXR/D6UH7ogV4S/Ix8j6lGvHEiWzGTYc48
	kG6sKawKHAhESrsQvz6rdtRI7fR5qf97Fl4ZSfE=
X-Google-Smtp-Source: AGHT+IEcEcNgkjsjd+9AsovIHFHtqWCkCcFtHXmf+FS5o5F7e3mtMZVAaZwHAGCPafb/VTyIBKwtkA==
X-Received: by 2002:a2e:b24d:0:b0:2c8:39fc:acf5 with SMTP id n13-20020a2eb24d000000b002c839fcacf5mr1149901ljm.2.1701465526822;
        Fri, 01 Dec 2023 13:18:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 00/13] drm/msm/dpu: use managed memory allocations
Date: Sat,  2 Dec 2023 00:18:32 +0300
Message-Id: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Changes since v3:
- Rebased on top of msm-next

Changes since v2:
- Added missing dependencies to the cover letter (Jessica)
- Fixed commit message for patch 4 (Jessica)

Changes since v1:
- Fix error handling for some of drmm_foo_alloc() functions, which
  return error pointer in case of an error rather than typical NULL.

Dmitry Baryshkov (13):
  drm/msm/dpu: cleanup dpu_kms_hw_init error path
  drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error
    handling
  drm/msm/dpu: use devres-managed allocation for interrupts data
  drm/msm/dpu: use devres-managed allocation for VBIF data
  drm/msm/dpu: use devres-managed allocation for MDP TOP
  drm/msm/dpu: use devres-managed allocation for HW blocks
  drm/msm/dpu: drop unused dpu_plane::lock
  drm/msm/dpu: remove QoS teardown on plane destruction
  drm/msm/dpu: use drmm-managed allocation for dpu_plane
  drm/msm/dpu: use drmm-managed allocation for dpu_crtc
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
  drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 25 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 77 ++++------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 10 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 15 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 55 ++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 59 +++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 36 files changed, 226 insertions(+), 487 deletions(-)

-- 
2.39.2


