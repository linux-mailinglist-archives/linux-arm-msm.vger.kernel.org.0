Return-Path: <linux-arm-msm+bounces-5953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9881E0BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 14:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEC31F21182
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103F951C47;
	Mon, 25 Dec 2023 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/qkxfGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493BA51C3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cc6d9b4c6aso37736331fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 05:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703509734; x=1704114534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrAR/dFA4g96DilCitrwfpxd2eb5zoEPG4NTNguHbJU=;
        b=p/qkxfGoP+iMOahvXe5J59pDkVpF2gyGxno0GFul3B/W0NnVWTTsbq6YI11EHFP1op
         qbJXqdzW/4Ketu+NalTDVQ5Ovaju2ecdIPBXchP8R2Vh8TmBgBX1GKE5obXlH7S4n/RM
         DcF3Yd2lUfGGl98M19zEkmooeO5KOLHBpMQWMMwmDTzyjCCbzn0YXM4veIPIl+lfp4LW
         GN/3/7ac/V69ipnJ1/S06Vumz1icLRylmTOG4KQio0R0pcSzsyms+z52on27YiPYFnUl
         uQ0/B8dvZFYLMZvqxxBksALfRKiPmeEet+KyXswcDabrabtqDNSqZTEQ3112cQG946J8
         TUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703509734; x=1704114534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrAR/dFA4g96DilCitrwfpxd2eb5zoEPG4NTNguHbJU=;
        b=VQV1tzmYidSvrtI5PyP+49IXSHMymMX4vrSYNMsGo/Uk0HK1bjmg/1zJVK22LF+29d
         xBBFjjaiFyQdbncD615tVoFV1CeCLtkpRKNDZ+A+ovk7+thSMsdUEXN2Jy1AGhdLax1E
         g3JU3eDQ+a4SD78tWqjZcZU1+yMpeewKfyteEmLchctzo/PYop8x3h1SLIjJCW1dWKNx
         pjpMYtV0mEjEh9+xnVU3xHi6hPkCctw4bTM5wEnXrz7MsL17N5jbiC+c1CGgtVFuSFpi
         6SB9PNARHIiY7ckrD3Xkvg5fGdG4dL/Z7xIhHDig1OmsGOl4/VVXw1oRqFncxjCB3azY
         lFrg==
X-Gm-Message-State: AOJu0Yx/kw9JVkIAwG+0vu8Oc+Izucq+OiPJCjgbTOGXphzGlMBDYgbi
	m2xUnqP9Zf53R+Kg8qge7zTBrT9wlaNH2Q==
X-Google-Smtp-Source: AGHT+IE0tj28bje8aWKNl3TYJJNRjyVn6TReeqskiSHh8g/35ShrubXo76hswGkCfAefmRCLy/LLQA==
X-Received: by 2002:a2e:b754:0:b0:2cc:9d5d:7182 with SMTP id k20-20020a2eb754000000b002cc9d5d7182mr2108643ljo.2.1703509734243;
        Mon, 25 Dec 2023 05:08:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:08:53 -0800 (PST)
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
Subject: [PATCH v3 0/5] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_mode_set callback
Date: Mon, 25 Dec 2023 15:08:48 +0200
Message-Id: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Changes since v2:
- Rebase on top of linux-next
- Also incorporate the dpu_encoder_phys::atomic_check series

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (5):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 94 ++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 15 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 95 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 59 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 88 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 9 files changed, 270 insertions(+), 224 deletions(-)

-- 
2.39.2


