Return-Path: <linux-arm-msm+bounces-43079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D059E9FA7F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010E51886739
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBFE192B62;
	Sun, 22 Dec 2024 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJ9Rzg+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A7418F2CF
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898454; cv=none; b=u1SG7c1Amnemb38vdlHdwhkr2ulc54QJDs2bwGMO3Z2Ph6e/C1NKiPsUUY2QKSpolHfcfu7SzhHT0F0TPBuJR83vRPFOSbZ2y1axsIpctS1wfL9staw1mmxPeklzv1xE8DWp/g58okuqUvuPdNpRxtDFHaDKMsFcz/9xIWXe2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898454; c=relaxed/simple;
	bh=nltqBJNSym88t0xwGnPmhRirL/N2i25MU95l0p1iW20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GDDV3CLzFgOGjqmjgXjvSGKTACgeGCDSzzKn/+CXljfBeAmdKE6Cd/jr90K4nPFDxoZyc4D39CDkKaFLFnNz1K9GEPbxy/kPmGBxKDUJV3wVv3xy9sKrRIZMMdmFqcm1GqfCfAigwXCtUNrvxroOlT3OdJpIu2rqsKdSrczABgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJ9Rzg+T; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so3695181e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898450; x=1735503250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxprhQ4J3lQhku7F3H5lnA88gGNPLgwQxX0RIJtyMRs=;
        b=LJ9Rzg+TOggKk4e71D3aPuAv7gNTPcMAQPLI2f+40bMwRCVJNxun7ZMkhQsPd8HuRQ
         zn+A+uD0LAL0Fcp1X8UtAHdQcMx5BiXhsfXUAocjnj2DD2juDNeWsJqzLICrPIHZgdqL
         el7z9RRHhQVgyh6uxr014D5HZdbzcs15Ktpkkd08iCqxqiHY/yuPBIwlL6UWaJ6QPQhD
         OiRw7jW2f690lSxMvQ0ZbniW4ANfsC5ix3c3l5wtb8/LTrkVz48J6N2lY7xt5DDUSRlg
         gck40gz26LnRyBO6v3YaklTmm/PgqFadX9BuiEScI0QABiKGySddkJFUzdNlUpGH0i8y
         Ue6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898450; x=1735503250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxprhQ4J3lQhku7F3H5lnA88gGNPLgwQxX0RIJtyMRs=;
        b=BRfB5hdlqdGchc29MiAqr6BHgntvUqnEWobYiQk4CZEIy+wJQgmQbEYwMAGdJ22z0I
         5mJFn3U81meNAaDsD4vLf+5vE6DN/QdgudRH/gV22F17pM5QBgsfm8hjfbWE3TzHBaci
         +5+PJi4D4VadjQmXpi+tH7zcIXgl+hoRJnEI+X9EraAzvVZEmR1/9iudC8bdbGJL2dYY
         pqOQXX6TZelkrGN42G8VxSJp2B9d+CoFqV5TEjFvP+TB0BMFTb8gR7Trammf6RrUMhcb
         jC4Rcz9enxeVwZgn+vYBhevZg1iyxgj4GAszLTw/i0XwsXWFK0DAqCM42CUyKLXIAqm4
         /FOg==
X-Forwarded-Encrypted: i=1; AJvYcCV16cgc5U2Opk6uJctoxgu3tfpVRIr7QZsCYx10a8NMqkv6/T9Bf9WQ+Nljh5hZHswgbiztClIR2ycmdRWK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79KZiAWQJWllKpZarFl+3ME+UI+fcsD2778gLvadLTbQzRysi
	zyQjoaUbXJJBK2CtBNuQc2X7yfmDpqI6vjU7W7B9kSlKz93KFAelIHhCimqhuYjI2UXgY0OBe7S
	c
X-Gm-Gg: ASbGncviLFZfvZD2yAFeBxWMcguS1oHkWJGm/X4Qlb36wbuiY3KFzqENJw1EXa807OL
	/f776cLtRLpHsUmC1VtQTmiB7jZLGsbQvD5RmRUM0TTkEJdZWw+pBBMYxgJVholxXoiZ+FI2nwZ
	iW81v83oNBQa5HRwUyEMrQNxzUX/DRwy2XhBSxFRzG6XHK00NB/vNGZ2m9LCBNwcbNiKUc+Vlkc
	9E0I4qUY4g4pKkQsSwc6zheCltr4NMJJneRvKa7xNjTqZ7F1ntkTK6Pq+Hee7yP
X-Google-Smtp-Source: AGHT+IHuJKl0EsUunMGN5Ubn6CwgCiRILGyED81vP+KryR9UlYeYvtqF6+jk2ruBXuO9Ts6rda9Jwg==
X-Received: by 2002:a05:6512:2394:b0:541:21f9:45b6 with SMTP id 2adb3069b0e04-54229562a7bmr3656179e87.37.1734898450076;
        Sun, 22 Dec 2024 12:14:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/11] drm/msm/dp: perform misc cleanups
Date: Sun, 22 Dec 2024 22:14:03 +0200
Message-Id: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtzaGcC/23OwQ7CIAwG4FcxnMVQxpB58j2MB0aLkpixMF00Z
 u9u3UWNu5D+bfqVpxioJBrEbvUUhcY0pNxxqNcrEc6+O5FMyFlopY2yUMuIEnvpb5iyjOl+47r
 RzlXkGzJK8F5fiAezeThyPqfhmstjPjHCuztrAMotaCNIJY0Kjqi1KsR6f0mdL3mTy0m8uVF/C
 H6WCM0ENuC2/CmLHv+I6ouARaJiQrUQbE1bbH31R5hvwi4RhonoEBoLIWodf4hpml4HX8FNfAE
 AAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nltqBJNSym88t0xwGnPmhRirL/N2i25MU95l0p1iW20=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMNNB4WdPK3Tw2Vu/f6YwHbW/BeP1HUlHfG4
 LjP8+7MpXCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDQAKCRCLPIo+Aiko
 1WBbB/wKv0fU2PHu9ZtrvZoEFNMBVuzH2QjvNYtiLZBEn1FKCGulwoUvAUMW/3TLKgdKLvmcvQ9
 Y/Fm6E/bS/FbdQZG89e/0cVEIuBiqaUY1RFWKcpS/bM0rw5A6gfhRkk/w8ommpLkcgCQH2mm/Jb
 5bxpFIWpIQeg7gif2DcYGAdQQfiwQxmUn46nEdJ6Bg59512iekuv8wrWyfpKfOh8s7Sbpzca9t0
 Sk6c6ESbAeCk5OHU4jN9J/Mfjkh5Nmtxyi71LcXenSiBXtAh1sbpe9uq/3J7/k1uoZxEKXlQlBK
 lHR6A1f3lJbA7PQXsy8UPEpuuJs3hhtWhlIHD75wDqPU3kZl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rework most of the register programming functions to be local to the
calling module rather than accessing everything through huge dp_catalog
monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Dropped applied patches.
- Removed MMSS_DP_DSC_DTO programming from msm_dp_catalog_ctrl_config_msa() (Abhinav)
- Pulled the hw_revision patch closer to the top of the series (Abhinav)
- Link to v4: https://lore.kernel.org/r/20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org

Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (11):
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: read hw revision only once
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  130 +++-
 drivers/gpu/drm/msm/dp/dp_audio.h   |    5 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1298 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  113 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  150 +++-
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  256 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   13 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1242 insertions(+), 1602 deletions(-)
---
base-commit: c9261bcc1546a564407513e148c35a79a58bc2b9
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


