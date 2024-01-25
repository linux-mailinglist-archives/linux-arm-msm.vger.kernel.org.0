Return-Path: <linux-arm-msm+bounces-8354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D783D029
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97C48B28FD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B707B125C2;
	Thu, 25 Jan 2024 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvbrgxxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D5125BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223758; cv=none; b=qQZORDzTXncqEgn1HOxv93SBKYjhxel7RstQU1HS8nyTzHT9hZTAb1dzYVrTh+fIaAH6U4y4yYU3oWRklBpxeUJONUeG+AYz3gm5kWGX2oaqKx9pg8R+rQismkdxsxWwsv90bs4qsshE4j+2Dsdm77Ruuz+V3+BO+gPT+IqMUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223758; c=relaxed/simple;
	bh=O8mpqaR8HXjJgB3eXyOdLmL7m98OK8uSbhLioXRWhf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=renGqF8SOhmdfLb6eyTlPaEDD6eQ0k5YUgohEE09DbuDV6rn/E7aEo34dKC/DyugVfj/h3XKEZ2P6t6RlYEMD7o92FPI0fbFjvKCRv0a0edQJeIlOSqR80rdQQGyeSwwNVZY9LeUPZqZWsOyAJASDKTwPPxpbbbISU/feA0X4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvbrgxxC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so24254481fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223755; x=1706828555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
        b=IvbrgxxCJU7kPQX/gzdeLFefriETtgUxO1mGAg5/Ywn/KR4eR0I++X3tpeMzzXqFli
         msqo6UhYn1IaTlmFuQiWkAMOiIt5s39YXvaIzCopoG9eEadm0l9ErRvdp15FkWW8Phco
         kh1nWQU55IMe/vFnXT02KSHLYZgP5BKBN9Oj+fQsisIGslQykMclO+8M+FLvByt2SW8M
         +NqPoxvUBMw51HpNmOfox1Yop2Nw7+I7Q+ikgLUbHD+PZrH9SdltpLAqQlmu3NI2ouPc
         PFv/3lZRF+BsGUfe+3mD2uUesOfUIlqUUZFJaqBAwqFhcq2igJbQgFvrmAD0/dzZTdak
         MebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223755; x=1706828555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYGDfQbY/xCYYNsqD+fm8Yc+HDSRw2uFMdxVRxyadQY=;
        b=hFjAr+0W5XthlLIIqUEqcznD22OcsfVh1uuibnY9+CxJH32feC+zD4oJBO+ME/DL1Y
         ji4CjQo/bdgQHM8SSdbGi2u2tG3pF2jf9m1qzOzaweAfkZ/JHRD08mZLzlY6DIgRcyrY
         9TzSU+XQmO+NeLA6LmnOINbsotG5HajP3wiVsvlSkW237RRhwR71cC8NLK+eljzJRnKP
         Lx6nOCfQfrO7Gd0NgvPmgcKznvWE0S61beyc5jzyodrfB2Aj3abJMkrCfVX0TFhmVwUD
         vcHLm85LYQHntlhCMWJXvKAMj9+q8Feo4Ro+BvzEPpvCmMCOpWOsoEkEBImkMyPzooWf
         W/rw==
X-Gm-Message-State: AOJu0Yxdu9iWdhiy7xgWQHS4OyVJ7l5lqpKBet7JduLuUxOwb8lq8Isi
	+cap4z+qW1sDzZn+4MXQBVFu/UYw38jnpFoPtz7lITT8QmmjgT0PBTCkG8P+uoU=
X-Google-Smtp-Source: AGHT+IH+M3Xf2nCYP/B0lMAMqNOjMEpdZtiGzowCmtg/W0S4hn2lrNviimtzYXFCJ3IJMWv/tyUY+A==
X-Received: by 2002:a2e:b60f:0:b0:2cf:13c1:6a4 with SMTP id r15-20020a2eb60f000000b002cf13c106a4mr120265ljn.75.1706223754508;
        Thu, 25 Jan 2024 15:02:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/15] drm/msm/dp: clear power and parser submodules
 away
Date: Fri, 26 Jan 2024 01:02:29 +0200
Message-Id: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXosmUC/53PMW7DMAwF0KsEmkPDoiGnypR7FBkYh4qFOpZAu
 UqNwHevnMldOgTg8of/8PlUicVzUsfdUwlnn3wYS2j2O9X1NN4Y/LVkhTU2uhxcI8TwYIFIUrr
 QDUzjdwTLDRlnqf1ArUo7Cjv/85I/zyU7CXeYemHaeGgRTWvqymo8GA2Fv/tJ5upCMqf+K+TT4
 EeSUAW5rWrv0xRkfs3NerXfktZBGTf1fx7LCDW4rmFbI7XOXP5Ay7L8AhotHmREAQAA
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGDQpLcmTmiCe/6wXmlwkZtq2iba+FUsfX7
 EB6skPk1j2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1RrWB/0eHcko7OQB/iGbQZuNv5Uh51UC9Tna1aeJSLOXn0wEwC8w898v4kW/qZbf56zs2FGQwkF
 R7jBC38N8uFXIXuBQ/Te7BdxaB3VYTk5x3LKaNVcD9Nq1Br5CavDkC0BNf8627jjh9TSc0vsvKS
 XVxcOaE7cMdF253Pk+Au3Xa+bpCKz97GxjvCwEFulF/Sbl7DWFuqkeq2SPWvbIV68CbzoZNviy0
 5v6WjEwS82s1xUTwz6tsEmpCOyJZEBhuR8fyiZ0jZITQk+3+tLAjBV5UnuXh4ebHw8ARn5NrJjp
 lMajfEftow2UwTrsWVUcyrHzb9IDYdVktot4KoNCGb2Vljtt
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


