Return-Path: <linux-arm-msm+bounces-8461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCAD83E13E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 109C7B24276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0215B20325;
	Fri, 26 Jan 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeizHlEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117E1DFD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293590; cv=none; b=p33p2dPqhHdQcfjTzvkKiAySd1Cq9CqyorO2yZIKs2OSsrzTwMTu0BdbeGObd+HU48cBRs5S2Grnc84g8lgeFmYVDlcqVp2ByH/z+MwIGhSp+Qkth97EPr0LQKUOg+FFmvjiL90tHffwK/LKdJrbJ21Jqel8CBuJmGI4UCWIGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293590; c=relaxed/simple;
	bh=O8mpqaR8HXjJgB3eXyOdLmL7m98OK8uSbhLioXRWhf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YMPkYhxx/xPqRhareVILvk4TXCkZYpcAuo7CyBLUZ+aJ9nsw18zdl1A+uTkeWrClcoNp7RpAX2xoR6q9Vu9Mt11Y5iLhPcdZEqkFROvxAp8uzSgSuoUbq2QlMehaG1eZ0MLwfcsbkUaDQ0aAa6V+zKd894yYVM0KYU+z+4WoXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeizHlEg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50edf4f478eso915651e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293587; x=1706898387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
        b=TeizHlEgkbf8/F1m8omGWoamRqWBQBfyJPcy7wQ/q6fD57fLh+Taiw7PTaFBHxZIPj
         okOohDc/E/pItZSbXi5T2J0R/NCehv76BPl3AkXvgIaKPnaJ4FOI1ZAXDqqC0ADgebY5
         WVS1TCJIIXufVtpnjBA51emrOd8ZdkE/66M5Tdd727F3yadEQBTP6bL42+J5dfSgI7FY
         ireEAArp5ORvXFeZ5cSPDsjgPBOYEGIeQnmNkGBZrDV9mty2c68IRKWwPQoVFJAHrWRw
         ndUL6UrAt7gqIUcS2YfYklBW5tRCF95KZOEeh82+fV/7JS+CQGM8LR3FNJTrTCWuSL1z
         kWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293587; x=1706898387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
        b=PR0pVCjbtRIC8IoA1P52eNQxlYlHJrVoLNjxIXO0rbeEkH9PLWrQpMOWd7GBsgki72
         UUgep19IlczqjfP/BYqPaYV2PfJKt3d3eG4iskjK7Mjk9hKXhX9ydC4/cgfxwIt/vzwv
         Vqy94CTeUYTaexBedUUd2APVvkhlWZDRN/BVigZub9c9Ll/uTcPcywsandQwTkx+W9km
         UJErowXqOPRNQ/4JtIn1aPudlPM3irbiDvyvsIMxRM+Xbfct62g0HML6wdQ3TMKj3efQ
         ehsVAvlitDcGJJJQb/ubswZjIOn8zkwFLmvj7BBiQDwhgXteIzYKhBu7zjXf6d/8X7AZ
         FGeg==
X-Gm-Message-State: AOJu0YziQ2O4qLV2L+Rdo0+etlFtqhAjbzxFpWeWKUiKqQmz2f+sFS/D
	plNUxDuCidpsYnHOxVoMKeX+cemDRSbSQYUPVx2gBQZiLOjPPo13jB+oxVNdWpE=
X-Google-Smtp-Source: AGHT+IGaW8gWxmWZ0T7kgixxqervfpwlBJ40/w8GxSEe9gixUP0JvYejpmlB3AR9ZGPddSvkp/C+Uw==
X-Received: by 2002:a2e:9b9a:0:b0:2ce:e49:5b38 with SMTP id z26-20020a2e9b9a000000b002ce0e495b38mr142607lji.29.1706293586770;
        Fri, 26 Jan 2024 10:26:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
Date: Fri, 26 Jan 2024 20:26:19 +0200
Message-Id: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=O8mpqaR8HXjJgB3eXyOdLmL7m98OK8uSbhLioXRWhf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPHsYJLRUKxYf/7pbJxS9Mgri7FPORZPncT
 2wxrr5OmQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1ViWCACcrta6QUtcFHnUJxeO3FEeg1rptIvp1EfCOwrsR1kCTzuSzCuQvJOk4mm6+HEVaMzxoou
 CaOu5vICYrZsFUVYvYgg/t7K3ggB8HGaapRaDyKbkjWA+TxG1/EaLe4op7KPoHJH70YoYKVPTcg
 sV8EE28Co2nDGc7l+nv9slcXcyXjuL8cXxDMgJYUS3TL5G+6b8m0vkTyVgPr1fLfoSt6VW+qk47
 +OK/9uPBgWgHlvVNEz9QuccmP59baIo7R3NSOJuqCMSehQzrxUQ2F8NWBMZpO9/p4ZtYDmCH5kc
 uNvNHFYeOmO+/xGAj0yIgL9lQVSLy6EKt1DbPvZX9SImZBWP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
dropping the dp_power and dp_parser submodules.

Initially I started by looking onto stream_pixel clock handling only to
find several wrapping layers around a single clocks. After inlining
and/or dropping them (and thus dp_power submodule), it was more or less
natural to continue cleaning up the dp_parser until it got removed
completely.

---
Changes in v3:
- Fixed crash in the DP when there is no next bridge (Kuogee)
- Removed excess documentation for the removed dp_parser::io field
- Link to v2: https://lore.kernel.org/r/20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org

Changes in v2:
- Fixed unrelated power->ctrl change in comment (Konrad)
- Made sure that all functions use reverse-Christmas-tree flow (Konrad)
- Fixed indents in several moved functions
- Added a patch splitting dp_ctlr_clk_enable
- Link to v1: https://lore.kernel.org/r/20231229225650.912751-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (15):
      drm/msm/dp: drop unused parser definitions
      drm/msm/dp: drop unused fields from dp_power_private
      drm/msm/dp: parse DT from dp_parser_get
      drm/msm/dp: inline dp_power_(de)init
      drm/msm/dp: fold dp_power into dp_ctrl module
      drm/msm/dp: simplify stream clocks handling
      drm/msm/dp: stop parsing clock names from DT
      drm/msm/dp: split dp_ctrl_clk_enable into four functuions
      drm/msm/dp: move phy_configure_opts to dp_ctrl
      drm/msm/dp: remove PHY handling from dp_catalog.c
      drm/msm/dp: handle PHY directly in dp_ctrl
      drm/msm/dp: move all IO handling to dp_catalog
      drm/msm/dp: move link property handling to dp_panel
      drm/msm/dp: move next_bridge handling to dp_display
      drm/msm/dp: drop dp_parser

 drivers/gpu/drm/msm/Makefile        |   2 -
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 358 ++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  17 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 102 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  66 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 327 --------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 155 ----------------
 drivers/gpu/drm/msm/dp/dp_power.c   | 183 ------------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  95 ----------
 15 files changed, 465 insertions(+), 1017 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231231-dp-power-parser-cleanup-9e3a5f9a6821

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


