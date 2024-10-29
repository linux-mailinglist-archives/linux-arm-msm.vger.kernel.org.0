Return-Path: <linux-arm-msm+bounces-36339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360C9B53AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5C3F1F218AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F6A208997;
	Tue, 29 Oct 2024 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km5O9+s9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C0209667
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233714; cv=none; b=Q593ln27boCxLfMmYV8GGd3sMz3vFv5m8jD7KeS0xt6zYy2gF3QyDAokIN/9kKic9kK7L9sSaZMWvG1BwxwRZXKWSfBPdM0nrhVg+7FvsVK3Yu3anzd3TYT61SFG4d8FeUPFQf2JNhKyEjA10qYwao6Ue3V8ChN0jrmV6L8qoxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233714; c=relaxed/simple;
	bh=kvQzJElbe+ynGoXeXpUz2x/KF+CNJfCzGkI/dVHOFY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CXvb+haVzs5vM1DFKjJtlrhafzi3dZbZdjfaYXyskhWfI54m4LI0BGt17UjGIvP29u1xdMEyV+sY26ekB7ddMUpST8XBL1xqjE6z3A92NAtlv+iH+WdJegH/PaUf8R8eGAHwEue8/ka7ktALTe6wj1YldpDyqhkT2z9L190hMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km5O9+s9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso6084757e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730233710; x=1730838510; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7385hpeo89X9ew/hCv15C/61laTi50vSo+Xw6/hX5JA=;
        b=km5O9+s9moafPnwm7pX/Rs8GNWe3XNeSMGoWvJWT8aU8HHbfyYjPGgt1dqO5isyv/S
         WY7a8a+zYl40U/evNlSxCb80dRZUJYxlPMNXHe/uMMgrnryyPfs9Dr04KxrnDJmYD/9m
         ASzEsoHQYM8JIgVbjWGnRk+KaqmKqgKcc/W94Ds1TKZkiDo4Bd3Blv3WPxIqJqG4rMgp
         PcWMX5Aq8KRNcq+oBquqtBYBU5KjoE7w2l4MNc36UvGhsHM4jWGVGboHU8VIOFI8OjjQ
         7KH0eKXqlxYP9rQjbIgT8R6FefgMUr5D1m4aR3KI58hsDUmO5Ag0MI6aTKP0ZiD1ltPN
         kWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233710; x=1730838510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7385hpeo89X9ew/hCv15C/61laTi50vSo+Xw6/hX5JA=;
        b=putEtyptTem1BQGrVEc34ntsx4Uyn6DA2wvXl9cSq89rC8QsV4xImYu4f7I2ObptkA
         qIIqh+kM6HZDCXihNPENG3ocdR96vabbDVybI3BkNFBiWEqkVrnOxv44DnATtGRTAFRe
         Sk165eVYPLX8D3M0/ijxsolzvKTeOyDO8UR/zTRi4axUC5fXErvoJF/yQSIDpO5nTE3V
         n2aBfg4vA2PYy8TzFYZSLVN5jD+C8atDfxKZpoHAiqY81WZm4qIzlyU6G25B6iSv8gAz
         lSYtx4dZzEok636DNCsQ8wGeFpmPRM9lsbxa13bq4m8oUOvi0F+Xmt63Dbl5pQmJ0ST6
         nRiA==
X-Gm-Message-State: AOJu0Yxuwi5m6CxImAZxZnY9RXjuITnSTcdY3WUeJJeaF64Djjxa8lC1
	xXLtdk1mB8Us0TJMbdV205F5Mf0Rgoj9TSW64UvWqZnLi+GImmvVPZr5NjUEdSI=
X-Google-Smtp-Source: AGHT+IGxYVqLBalsIlLHL75QltlpTg+bmQq1Djk/EOYqWUlWrFeBMWnPNF7n8D+SWoCHl6QRM/cxlw==
X-Received: by 2002:a05:6512:1087:b0:539:964c:16d4 with SMTP id 2adb3069b0e04-53b348ed318mr7294239e87.36.1730233709699;
        Tue, 29 Oct 2024 13:28:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:28:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/dp: mass-rename symbols
Date: Tue, 29 Oct 2024 22:28:23 +0200
Message-Id: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhFIWcC/3XMQQrCMBCF4auUWTuSxFSrK+8hXUQzbQdMUiYSl
 NK7G7t3+T943wKZhCnDpVlAqHDmFGuYXQOPycWRkH1tMMpYrUyHIQf0MwpFFwgHReQ725E5aKi
 fWWjg9+bd+toT51eSz8YX/Vv/SUWjQmfao6WzbU93dX1ydJL2SUbo13X9At3+F6urAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kvQzJElbe+ynGoXeXpUz2x/KF+CNJfCzGkI/dVHOFY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVsgO/76rY0YbT9zf5rWIbo/VYvWm5fza/Sb
 6B0BHdk/buJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1cvRB/4iymgjmgBRxqDWAGVuvl/Pq17yID+rUfa/G7K/ki9TI+aZ3byhYzxrMk4/sYdVHpVwxXD
 bU5oPV/OnRyiw1Z6V1sOeH8XRoMpd/+kolwRYsxk8up6hbuciuxnk4SZ5AwZleYjYo6qbWAEGLh
 nC2QcPti5/hH5THeDCY3WJREoQ63ACp1mqmoDoK39reIKjE/FWu41SmgYx4KcwK7s1iUpCBIR1I
 +Hce+hynDL70Xl1Lan/CyPU9/LpHNrXHt/kUOPdBBjOGmCUn8eTOzNF67JDWLHspJIcpzhAjBsi
 SSI0QmLh53/VEcLDtQVE3fuB9SO7uFXp24BCdhk1DTo+PeZZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LKP reported [1] a symbol clash between the drm/msm/dp and the HIMBC
driver being sumbitted, because both of them use a generic dp_ prefix
for a lot of symbols. It's a hight time we made msm/dp driver use
something less generic, like msm_dp.

[1] https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched eDP symbols from msm_dp_foo_edp to msm_edp_foo (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names

 drivers/gpu/drm/msm/dp/dp_audio.c   | 294 ++++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 148 +++---
 drivers/gpu/drm/msm/dp/dp_aux.h     |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 734 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 118 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 482 +++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  68 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 904 ++++++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 142 +++---
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c    | 432 ++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h    |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 254 +++++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c   |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |   8 +-
 20 files changed, 1918 insertions(+), 1918 deletions(-)
---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241028-msm-dp-rename-f0eed848e231

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


