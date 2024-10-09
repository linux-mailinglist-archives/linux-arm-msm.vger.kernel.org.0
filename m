Return-Path: <linux-arm-msm+bounces-33638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB339963E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD22288062
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2436118DF7D;
	Wed,  9 Oct 2024 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkKyFXdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBCD18CBE7
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463829; cv=none; b=hp34aU3b359AMC+axYp99AKd7nde41FnQXcHJmqAdSc2t4+EOvHDlmJxew7WA6eYQ9NLwIffV0k7WL3BPBju9JI5SDPPSLiFG4GaiwbyOrLMhXQXvMfj/qM4CZ+LChEpucMzn1EzfOMj5H9ZA745UmsZHZ8A3L6WNS6wOQCdHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463829; c=relaxed/simple;
	bh=ogiCJCZuk6UCulrrNj6IiPVgq9KKz3uKFmixSequ9dc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LxSwjCY4ow2xuPLPoThxOIEk+Qliic6z8gnUc4c8e3KZ9aOwTdYNDUrxyUzFplvl9mINC08HS3ffO10QUOsZ7a7BYLO9QRJGIi7ULCV8naXkLMr2BU2Gvoxm5iYyc2qdUmOEthGwRASxOIpfCaxp79OTB0jmbPhYFHkWTP+iQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkKyFXdK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e221a7e7baso2519952a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463825; x=1729068625; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OyEUM3ayYo8115Z625s6QVnBUkxirDaFIlKShu8dWI=;
        b=BkKyFXdKnzTwSODVnrUZ9KZs5PV2yjy1U+YghK1tXiqdomwke9sG7Rz010392Phqy5
         rhj+KgThMfc+yCb8X6zFjGhYnP+F11XKGqbmutPYVAoBQjEp1b0X/GNBD/0Iw86tjhZk
         ROSmne5QdJqqKx+rzO9SQjkjYb/8OADJpE1+1WXjY+Nbd+0p/vlIfoS7bWwGq3UU3ljp
         3sq7bPOk8Ytyclf1wicG1EILMiZ8wvZ9iX/H3n49xTicvS2nUXJQtPt37w/56Xes1hli
         a+CX4h51OtOwnaL+a4Q7RuwXg2dn7WHOxjSDCNdeVkCLtLexNIIgM3U0sjpd8k9g4jc3
         705w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463825; x=1729068625;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OyEUM3ayYo8115Z625s6QVnBUkxirDaFIlKShu8dWI=;
        b=YbQJLnr6LILgF7YE4Rd3xtu4ux/IXfMH1KT8QC+rlizSf6w3la+PFN8ENQpJJjZvF4
         AuwnU7mF/DbK/ws3Mu45u7+DqT5NK8JRcmDbPN+xkwc4ELGz1WEiLpDkAB6DnShLcn6L
         11qYDUOFhWiMYmpI5N5b84CqGU+nKXWSbyrN+ZW3gYBDMi2lgsow9Ry9RKmjpX/qFrkK
         2fL7iVS8quj/gHC4KfAM1bfjwRHGzKI7J58+WWgLD9EAEl+o16O+3AK2ITMaSO9Lz6yf
         TcsDYwTj9ouiQYRuRQHhN7Weh0Jhnt7M+6vOUyu3X2Rl1FzFdFt4uvhF8zMXcmRqtnNO
         gxLg==
X-Gm-Message-State: AOJu0YxuTs4gRqaQgNbR39uJlyvfn8GPnOLh2+bac/skrEGViPMjjk7M
	ggTvo8lrrP1niF9xe+MtDulHbLbjNZSO7R2KxhygjVxQBp0xPT6/mPW6jAIi/14=
X-Google-Smtp-Source: AGHT+IEi7ccLOgI20JoLj/kcBWBw13/ExjkVwWKywTKVTU9eWF12FpV2TM3Gltp794cZr9uzgadrLg==
X-Received: by 2002:a17:90a:8a04:b0:2e2:bd4b:ac2c with SMTP id 98e67ed59e1d1-2e2bd4bacdfmr3881a91.31.1728463825310;
        Wed, 09 Oct 2024 01:50:25 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:50:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Wed, 09 Oct 2024 16:50:13 +0800
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVDBmcC/x2NQQqDMBAAvyJ77sJm0bT2K6WH1Kx1D9E0q1IQ/
 97Q48Awc4BJUTG4NwcU2dV0mSvwpYFhCvNbUGNlYOLWEfVo6eY7wt2jcziliHkZRkzRDD9biLh
 lW4uEhOyq0XJHV9/zK0At5iKjfv+3x/M8f677qxR9AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=3537;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=XuK8SW++hJbjdzuyT7G+3SNIautCdVNCl8sCs8qP274=;
 b=ypkLgaejJJBfn8jsdKs5HuLSGpjaaUfbXDqk4/kz6wm2nHJj7vcUY3P8taEhMblC4agtxfgWQ
 Azg2zfY8HxMATfMLlvCfmkvT4cBepPS1zuDt+iWQaLiu/jHWkCI5hpA
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=


---
2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are prefered for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

This patch set depends on virtual plane patch set v5 and flexible
number of DSC patch set:
https://patchwork.freedesktop.org/series/135456/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>

---
Jun Nie (14):
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: update mixer number info earlier
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: Share SSPP info for multi-rect case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  74 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  69 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 +++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 210 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 15 files changed, 478 insertions(+), 364 deletions(-)
---
base-commit: eac5b436019c2eeb005f7bdf3ca29d5e8f443d67
change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-1142507692ba

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


