Return-Path: <linux-arm-msm+bounces-36155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E457D9B2F31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 12:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CA56B20BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DD01D5CD3;
	Mon, 28 Oct 2024 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="saFsdTtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1A4AEE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116163; cv=none; b=I1PjIUxoeQIopFSJBOZq7k6U03kB05tEPTbZEqUoVP50coVO7XNyMxFzs88pFJmKxfHVuuiMI0WowrzgDFvzkwf5ZTCc9aC/LnLyYjjon3Lt6/wA/zcXnCcpLT7ON4A72GU5QW0C/sU3pudMLYB1PKToTXwAZaGXP621fNlOSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116163; c=relaxed/simple;
	bh=Co+0E9YaF8rU9Lu8dKrUnSBVVrsUQunT/qB+81qDOac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZmRYE9Q/mxvCTh33D2u3x7jPintMTtlgNgDLgeyPKLuu+/1pzrYfD7Q/ifw/blJH9ZzvQ9Kq03mcSp9/bbZtIiKQavS4mWeBEEPUD9iyA9BRt45g+nZYgis9Uyo4dG0xs6N0C72ugmcTo5goH5dVeRFhp3twwRiFFn21FHcqfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=saFsdTtm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fbbadf83so5301785e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730116159; x=1730720959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mb9zRgHMvMC//b1yhfiL4OPzd+wPu7HZpSZkxfRgNjA=;
        b=saFsdTtm96fobxU9dSaLUgGxdEWXLH4pBh8w/cIU5to7YQEqCbI6JxtehOjB+ndPKj
         FhPmaJccYJwqTzxdAp/wO8IiJrqkomxUfyKNysYfPzYtyDu9rYBDxgX4hDpr2c0C80P7
         xMaSMKWsi0qT3J5xUJtx5kkNMG3pmbNotGbORomXKc/tZTBEigivdURrxAC/Jf43mbEP
         9JCpfL66tyr3aPtee5Lwg18AGrp9CSua/kLKpqxJ+7lDEGOANGpAeiJq6D+HWEP1yWYa
         OslVbFwCLC5bjfVv1wW8JwVBuNSCuDZHVIRi+qcqNSUtyuoHd6bStrYAa5FrNL3EVsmS
         UY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116159; x=1730720959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mb9zRgHMvMC//b1yhfiL4OPzd+wPu7HZpSZkxfRgNjA=;
        b=w8iBJwkRFdL2Cx2H9E4fkXxSc57Gl3lpLvsfuQWTKXFFPlU9Yoh95AfzuXHS5Hhhky
         lV+0u5UpeTNWbcaem5knrdz7Ivi3Mim3+Ed5bv6L2RRdYZZ+iwUhy2bebBBmZuJJYBpx
         zoiB0U0XVOrvui5IZa56W9CjpbupNednQ4Vz4Tqa2V0HbWNtsTnRpElSDk+qrLK8qN+J
         7qvnJpFPPeW5f2iisaM5s9onFP05jVgSD3jqRJt7OOdT3qRKRjnukelxbAMST3AeU3uf
         dSnKdD41N0pmNtFsNEIoEZr3ePtnLwPRb3qutlMFWLit539H3XM0TOBJIlraOLfT1viX
         UDXQ==
X-Gm-Message-State: AOJu0Yy7NvFdA1vfRjy5/60sGmJdjPXdqTM3A5Tk255Xl9nUT2a1NWIB
	u6Hc9MuqnfgZlmgl3xt41XfhRGhfymmeFw63EjzcEd0+4U/4Zv/rUTc/Zi/SptI=
X-Google-Smtp-Source: AGHT+IEXr0XfiZcxDUh4Ya/xhi7vFzeN0peBhYX1m8G09G4UCXSdXYHWqD8Jl8qKxIXMmJy7ffIoxQ==
X-Received: by 2002:a05:6512:10d1:b0:539:89f7:3187 with SMTP id 2adb3069b0e04-53b3490eef0mr3514599e87.47.1730116159070;
        Mon, 28 Oct 2024 04:49:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dp: mass-rename symbols
Date: Mon, 28 Oct 2024 13:49:13 +0200
Message-Id: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl6H2cC/x3MQQqAIBBG4avErBvQyYV0lWgR+Vuz0EIhgujuS
 ctv8d5DFUVRaeweKri06pEbbN/Rui95A2toJjHirBHPqSYOJxfkJYGjAYJ3HjJYas1ZEPX+f9P
 8vh/QXxqbXwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Co+0E9YaF8rU9Lu8dKrUnSBVVrsUQunT/qB+81qDOac=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o8ciOKjsiOAq7UqyEELQvVVIibSVOFsy8AV
 vA8UGDvQnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PAAKCRCLPIo+Aiko
 1UyHB/4vtNQGsmYkJ8efgL4QqmJSOaWdlUjtPu7p/+hvN4kqK4CH5fnnTNh0R7yl+YqUaRw0ibl
 W5lNJs1zLmuAYc3odDWsVFjC/eRTNN9AOAbntyCS7BLMhm0aBtU3nKq4TVlPIijq/CtzM2puyvd
 LQrziQ0aIuzpjScflkArCejxnTIUNdxalWXyyuiOgwIwDofYdSg7Vlt0+R6IlFkqefTltrSqDGs
 JKpmj7HDB4UnLLYhcfu+Eu6Xl1Rd7qMoOEPVfQlBQbLdUgQ5u2Jz0SPg13z1l8XrJtFmLmz4IEY
 yf3OqZzOGXmHQUWl1JkVeYSQN+4mKskfUrIwo4ozW6iiDO9X
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LKP reported [1] a symbol clash between the drm/msm/dp and the HIMBC
driver being sumbitted, because both of them use a generic dp_ prefix
for a lot of symbols. It's a hight time we made msm/dp driver use
something less generic, like msm_dp.

[1] https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


