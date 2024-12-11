Return-Path: <linux-arm-msm+bounces-41592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED459EDC00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351181889910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B1A1F2C55;
	Wed, 11 Dec 2024 23:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBpv7INF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34C1F37A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960511; cv=none; b=sYFFoK3S3rceg9uIpIfG+plwY6yxrysBmJc1CQK4iuEhKqa77NDMnkppL3nvqn/bnY/6K+t+DKhoAoYKmamg/5zbmfq6QE2I4hQ1bzWlIiUDLcBdaMIvxx3PuIDwutZHC7LqnSQcTMH2Eq4cksUN0w4fwdRqEJEl2VLSSZh9Puw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960511; c=relaxed/simple;
	bh=KGpHz/yVl3CbQj7xD8t+dTMh1TmykDPag97EgsAA3HM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nH+OE7pFra4ftATVy0MIXytv7Thjep1LmsYeJZSnIwc/m/aX3HJQ4KeQIa21jSW+sqV2FPnUH43tUauFD7lEjYg4V8l9MsIX16mQOq55GNyPjSXFlg3WHf/U+BIyUBpnU7H5fL+uyQf5WIN56aJj7MXipGi4X2V8ybaQpzvsDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBpv7INF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3778bffdso15867e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960508; x=1734565308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lN1fc9K0FpLqHlKV+XpgE4JzXHUl4GikScenFQbQRU4=;
        b=HBpv7INFURLFtaiI/rEhXa4f4Y6cVShB84eIRZZQx6OEirmVZv5L91hwNHA28qD/gg
         ikFFF4qctPmzHI2K6O69tKpHOuORwpSD1UUmv8IXbyfu2RbH2jYxEX0wsuMepkFxTJYG
         RnQ1Sda4b+FGR84Tp4drTu5iv5yMfdPnvnIguG+6rTP3VyqCvH3yKYn/8OsX/LtwyITc
         Y1BxjSqlveiUzmvo6AdbYtW7Ewoa0FydflDQgNflRti1fLdbVi0ra9a1FykaIVmf36ns
         rTbLmmVpoRYwIhn4JmarBjZc2BDa7dnuoBhUGxuWGFTlRHs+IAOYRWIFouvpYeBPLPCF
         jZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960508; x=1734565308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN1fc9K0FpLqHlKV+XpgE4JzXHUl4GikScenFQbQRU4=;
        b=D/1AnK0gNtDCKKOKhCwtED8fkKpjNW/y3rPXqwHpgPJTwWcu2zvMuK04kckL3ejKOK
         Xg0sdG1XUc4MtRWUkQA12in5nMDib9M3OtnoitPu2kLIVFpeafJG6gtfcPIw6YX19jZ1
         mimGyiyovsL8nf0cpB2eBXmmw3CIOZd2uBU8HJZ+bB37t0xbER+KoGEL1fygipDUsFwO
         zYExi6AnqaoTTALB5CYvjgTgTV5fmYupVKn4rv+2XnfLhJ4xCU1bh6madt26kZoFLa5Q
         Fqa+RcBVGN6P4HTH6efpxXXV86VcHkeRMEApuPaH/5uc1tPRt+KIbl4UUoYKDCRBwzU1
         w+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU5PM6+tB4hAZqohoWjDorMPbofjk00LFDWHILze4/3LqjBN1G9I0sym63Ixe3CpbTN2l4S7ApE/WR1XgK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtntnd4k2zckXssXL8MHGqeDSP4gJ7U33YFQ17NCkdrECKc9rO
	jWVjIsFtuWX5XEQz3jvRNFHA3q9GeGV+1gDHNOkVDB+VWOBXeV1Z2zOtGmIhcG0=
X-Gm-Gg: ASbGnctsMG0/vQBUbZz2ZPjrxHjWTVhghe8XyQB+yyplH4m51BoWnBBGmsx/Zpf57CF
	W9raAFEkcFoasqDs+fwwGe4A7OL1mKok4MsCTi40D9+po03xdJ/sfNqxqua8tNYMfX+ibjYoXe4
	qJVmEy3mhU0XytWuZDJ1BRQjcY1ZXN0QPR+lOmyZgRGdnxLo6zi2CQmDi9C0F2ZAAdSaaiGXkm9
	isjsCtq40D1shpeFr7OF7hVQ59fd8oxhH/v6UHBykdR8zmiL07hEnejK2ppjA==
X-Google-Smtp-Source: AGHT+IGTn3GgnuI9/MoHb5/ZUsgP9T68WNc7965a9w8Yk11jW98pdcRfsD6JTboUFrk8UJT7i5OstQ==
X-Received: by 2002:a05:6512:2387:b0:53e:39ba:fb4b with SMTP id 2adb3069b0e04-5402a5e7e34mr1380282e87.26.1733960508073;
        Wed, 11 Dec 2024 15:41:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:41:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/14] drm/msm/dp: perform misc cleanups
Date: Thu, 12 Dec 2024 01:41:35 +0200
Message-Id: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8jWmcC/23OzQqDMAwH8FeRnpfR1o9VT3uPsUNnowaGlXaWD
 fHdF72MgZeSf0J+6SIiBsIommwRARNF8iOH/JSJdrBjj0COs9BSF7JSJXQO3AR2duSho/fMda2
 NydHWWEjBe1NAHuzm7c55oPjy4bOfSGrr7ppS0hxoSYGEQrYG8VHJtiuvTxpt8GcferFxSf8If
 o4IzYSrlbnwpypn3R+xrusX5UO7y/YAAAA=
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KGpHz/yVl3CbQj7xD8t+dTMh1TmykDPag97EgsAA3HM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3KIw0z9QnsmiF/tVpqgwgf08SFhCmC5aEW
 WO7NOCvMPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1eLhB/9JCmsCJXfuQAZdrBhGBhqrySjydU3KsLNzC+KaHOBwfPybAbcpBrwue54ah8ya54yf93x
 qVCZkyqDL/Ys3HOChHdPBb4FTMr1Y6GtXeOs1QySycB5cfb4soAPoQvoLszC49DKlqAZupe4iS2
 BwxGTHQt2zNOM05XmfRB5Q0AupaJvuYXw4YtE5655L+n4BO9RJnrAuSOFTkP6MqZ10nkpnBN4v5
 Xm3tGseQxmdfPkNx8RgOPieYfKjXHl700IRF0cQe4q1VlpTnwxHovNYFwbhVcEjNThykfgnVAlv
 GaELU51wzjcX1QAtIpMy1ahNFzKloyK9EtHS3RMJEuCXPWcX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
Dmitry Baryshkov (14):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: move interrupt handling to dp_ctrl

 drivers/gpu/drm/msm/dp/dp_audio.c   |  362 ++++------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  199 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1271 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  173 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  234 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   14 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1180 insertions(+), 1727 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


