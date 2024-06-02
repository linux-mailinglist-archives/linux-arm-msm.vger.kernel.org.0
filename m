Return-Path: <linux-arm-msm+bounces-21425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FE8D7858
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83DE1B21012
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A6178C8D;
	Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akV0LqHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9C058AC4
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364398; cv=none; b=YpI2cfGTCju125seFOYyqfDMorJtCRRgfS/fhXViBOaA8uAiqX6hizipFmkg2ZHUlCCAK89eiA9g7MqEIEyywOt8d1eIKf9+d+rQRd2jM4HqciJKIpKkuu2UcLnegvwbeI8GMp69PqRZ5eaMyBmm+6fbMqAKK76JoBsKRW00f8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364398; c=relaxed/simple;
	bh=WEVChdsx0M8x1VVrf3QhTk25LV/lyu70yiuZR8IbK/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4kTKdvGdo7AJKP/AE5WrZcAmgQkyvHJofzAVzeDbD0H/97Dsn/tE+RxC2pbkAoknR8OneEyiSFxIFw1J7Pqp1GIBMm2pYLunBexQPRzbzG8fRJCTOZ/7EbgkddWzuukIaq4aLz6TlLzuhTk1RD39UXIzHqb64RVx+O26ur6+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akV0LqHf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b8d483a08so2307142e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364391; x=1717969191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+CSTFeFF/RYWmPtLQtrltO96VyPF0tQ5leDleoWaL8=;
        b=akV0LqHf+wE5rKYwTcBzKYuCLNSqFD42JpIKxhLcTCGY2ocDWupAdgt5Crsu3vDdhE
         0dgBi853v7B3c7EXqePo/TkousFBCwW2YIWiEaCtobuJaM7quUtk7pRGpoobLDrQibsM
         DjKXeKerDdZgBeW3IiCgsTdZ0z0GixvqRCm1MnLH6zpJWqas3gVCmpgwz7AKdsnGaCHs
         uiDEVrNBwMgwqLSfknmf7hWqi26K/mHn0DpS5wmb5jG6w+NMBK3ocYPSCs2Xvc8NkLaQ
         7qRcqEoZwMua8ec4cmWnmlEqPj8pA/TqomqeOLAbMfZuJJ8ni8AZy7jlHxGrqZG6BlHa
         /1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364391; x=1717969191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+CSTFeFF/RYWmPtLQtrltO96VyPF0tQ5leDleoWaL8=;
        b=g87hSfLn+akaDh4TsCFAxE1N0SmmFiXJiLdHlnhWtKJBqUTpPnn2OGPX6mHMLQ8lhE
         xVqJYxOeQDcLyw5JztzoGudF4F2WPqE+AglB5NKaTOrZVMpoLjqNuH7THyOBQG3ACp04
         uqk3FowGluM/aaWNbXunU+lzJoE1e7qjL9Agu7VK194+NdOo3S5miw3IQRfApLZsI32X
         UBEkIQezsbPEO4jTTIk82KDzmL61CvBIu65cMt7kptJyCr2V6pcmozMIVKiUtooS9rE3
         sh/cF6v5oQ2nUxyHJ85cmzD6IdoZKaSoCdvp1p5m8S9/hTOU3m0G0RdfKiAP3lghCmcN
         i2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWaSRTLIHWd5z2uf1Y7m0vcX3l3/89rE69kSszVXaLKIgc0nw8GYPsO5MeHIUDM0VjXLgX1Zy/10G4dRObKRDk3zWW8jEqsjifY9TVqYg==
X-Gm-Message-State: AOJu0YyyhxTA3+fbZfX1Mb4ktTmPRBhNFAOIhfkMdzwnKS0B1RFgFV+t
	FoLDiltRrEUtG9ihqp9sRusIcJkQOJwaGfIhFQoCKFJDl/RDh1AtFiT86ZIKSGoPO/Knop7U7Kl
	P
X-Google-Smtp-Source: AGHT+IEIf1Gyh7kZtA0eFs/RqWCpH7rFfKeyYj6pdc8wjwMA7tsgiZAtWlBpM2/xtamBSNHgxtEI0A==
X-Received: by 2002:a05:6512:3599:b0:521:b2b5:60ea with SMTP id 2adb3069b0e04-52b895712e7mr4357562e87.23.1717364391170;
        Sun, 02 Jun 2024 14:39:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/9] drm/msm/dpu: be more friendly to X.org
Date: Mon, 03 Jun 2024 00:39:46 +0300
Message-Id: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLmXGYC/3WNQQ6CMBBFr2Jm7Zi2KKIr72FYFGYKk2hLWkQN4
 e5WEpcu30v++zMkjsIJzpsZIk+SJPgMZruBtre+YxTKDEaZvSp0hTQ88B6IsQ3eSYdPobHH0pR
 UtEdLB2Mhb4fITl5r91pn7iWNIb7Xm0l/7a94+lOcNCok5bhsXKUbpy838TaGXYgd1MuyfAC8e
 qLbuwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WEVChdsx0M8x1VVrf3QhTk25LV/lyu70yiuZR8IbK/c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakedc1HivhrHyR0T0lkDlID8aNU11qnsuAR
 TeAg9oyuLeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1XQ6B/93sWx/NvOkP8tOlfD1+1vvos3MwSQEc7r4+++zOnXhaM2B4ZL+zK5F5GfKL475LvZb2wc
 vJ/9pPFK83Oxw5xQ1lUfvPKJLqM2WlhAahew5O9Y1LsqlSnpj48TJzIk3WqtgNYImy1nNYhdyCh
 TjjnaGIco4s7gL+NNqYny9N3PviHNGXUpfuuLiDxdrEbtYMoFfQSi78/4tfeTk2xp4iEBf7/XGs
 BInUBqo1dHe2dx4c/5OCTlqptI4ofaJZ1QzuFGdHpdbGZUvTX85SyKya2+wEofoNDiCIRnQuwgd
 9Oip6edVYOvDnBGzGSeT30/PpfPHv7s9kmmb1eE94atPiLFH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds from atomic_begin
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 32 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 91 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 24 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  6 --
 10 files changed, 91 insertions(+), 126 deletions(-)
---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


