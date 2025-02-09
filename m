Return-Path: <linux-arm-msm+bounces-47263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A7A2DA77
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D15165BFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4E34683;
	Sun,  9 Feb 2025 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmnQit1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D42243365
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071288; cv=none; b=bj30sywrrjp1d/OL/i3M9uF1GnMWulkUPF6VJzSreWTuHPMgNIx1EQ8C7XOCWX62vg3h6dZzw3Scglu/FU0wL3rhiMb89MqCKJoHZOMyJX0Pp819anjl7niMqzwpD60SeBTk6L/6UCKF0QsBPMrGgEhi2s0qS7mVLuTKIN/9QiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071288; c=relaxed/simple;
	bh=NTr02ouTwM6BMx0LotwmedBZCP4G07mywT7v8bHyyGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XafGJzBnanV4ib76fMFfM3HRynORQ6dDV/FzqQUBweidmqzUY0xiXzgwBVMyXy3pwK+I3xrO9FPHnrkrhtpexJLZpZLeaJbTbDnVzkvuVFyuahnsD0LaolXyJ19zCGLVanrJmCA+3iVgNuLN5UKhSbgc7qhp4sCDFsEXqxGPEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmnQit1U; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54505a75445so893734e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071284; x=1739676084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAjNA953tZUPp6VSyuChrIP+Zsr/R1tQauJo2e/D/xs=;
        b=MmnQit1UJFPiCz6r6QcW4UZHiT7Z8CH9INz3DTvLKNy68ylHk1/4GackPrZaSR98x4
         bLQPOgFxBKRnrBH7ObppOHL7SQtipYz+yNCO9LlFClKEGked/A30ZHtgvpZbOptznSD1
         DD+IqQ2OVGTyZccgwwbnxOR0vFR6/Zfs8rsn87E8oecYbQV3AK9quhPEab4XTkVTdgOf
         LpOJ9A7Hj+YQfBvlR4FUL9FqppPLVzRwRSc1VbGhHYmj42dhrU7xgx++3fikIX1zXGTv
         QrrJHycvrjGGTtb39sf4QUtNDTZTanp5NRwm/1sQ7DQgVHBW+YJG8lRxzDFJq5HH/djh
         MO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071284; x=1739676084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAjNA953tZUPp6VSyuChrIP+Zsr/R1tQauJo2e/D/xs=;
        b=KfBT+8w8PooG6ZznS3nA34I+64EFgOuGUv+G+Y/aZ0YWMY/+6Cb2zDKI9RKzMOfknM
         ZA1JsG7CtV13umJfmcdvwEcRivMa/7rpkE24+LOA3RkH/hj/esrH1LQ6S+FJxTHwPo5N
         BaMCV5nB0lxrI3319YVFJ+q3+Ef7Kk2iz4YBHp5qYdodD5lzHEdaCibO3ZAmmk3q0t+n
         WmcgO1pbL2k8o+S8tXEfUAIRzRw4ZvJanDP1/BM1aTtTH/0Yb8Xq6qjpiM3fJ92iQEQN
         4zYwuap6zQjHhugoEmIBeXKeBSZX/FWttNXtKtwEQVpf6aSnG7d4xuUlzTaUUC1ypHpB
         /s3A==
X-Gm-Message-State: AOJu0YzwbpDumGb4cdGE1IK5/93FLws4bkRIRAD7NF08Jtyh95d5daip
	b0kLWMjqEoauYVlylMd/w4yabq7iAcU6I/TmMwle0bXclpUVhkKnKkXuTzvYRtM=
X-Gm-Gg: ASbGncuUN5cNd3Zd/pqvsYcoDq6mg4JyPOfG9IiFb3mKCCCsYawNwEbptHzaV0RLXIX
	yH1X/ZSWeT1WiFYNpDGUieRjASw9EaO7rJ2tuKFPeg1lXud07toKoPGHLkx58e2sQfI1xjoE80b
	ekHkTTEARBfxmhz9AeZ/A51OeJ5OVeZAFo+xW7POzlGKBKPG/aJ6HR78LkX6tsmC20ghixB6Z3j
	fMaVVyRAS6GD1ARSceNxLbZ+/jACBZmswizFW3tZhguEJqSqYaCPWdV99g1r8BBfuvYvKpshcPZ
	G71Z8JELVTOzRwC7UT3vii4=
X-Google-Smtp-Source: AGHT+IHsxeWqnTeAqZtBc5A1b7LgJNE/n6mSsdvXC0Wcuj5manHlA1woFEwXNs89JFvUrGGGlgGgUQ==
X-Received: by 2002:a05:6512:a8f:b0:544:12df:8726 with SMTP id 2adb3069b0e04-54414ab6a8bmr2765026e87.22.1739071284173;
        Sat, 08 Feb 2025 19:21:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/8] drm/msm/dpu: rework debugfs interface of
 dpu_core_perf
Date: Sun, 09 Feb 2025 05:21:10 +0200
Message-Id: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcfqGcC/3XNQQ6CMBCF4auQrq2pdFqsK+9hXBSYQqOhZKpVQ
 7i7hcSFMS7/l8w3E4tIHiM7FBMjTD76MORQm4I1vR065L7NzUpRgpA74O145yOS44SPQBduKtd
 YYwzWoFm+Ggmdf67i6Zy79/EW6LU+SHJZ/1tJcsEr4yyg0EpVcLz6wVLYBurYgiX4AErshP4FI
 ANC1CXsJRio9Bcwz/MbwcFNXvAAAAA=
X-Change-ID: 20240314-dpu-perf-rework-97fca999eb46
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NTr02ouTwM6BMx0LotwmedBZCP4G07mywT7v8bHyyGg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wAtAgwlyeiUFSx8giTZ7sPZ7ZnTosJodpk
 W90Fh9WtTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TeoCACDRUjHxkfP08uFblALxS6ihEF8m5IAQ4guKr2xl6aVUXmVEDt50W7PeiH5BQy7SC2DROX
 GWFIxTr3UcsxfAFKV+VqBkPrjTdrq2Vh4G72xZj7D6LQ74L6ng3luyMFHRTo22yqCU8yfee4Jv3
 vH6wTg2owfwtaYXHZ60SWvqwl02Id+RuR23wjlHc+ngEdzx/fapKf7WQfQ5/sGj7w2nWe2OIsLU
 Yagr4kOyq0IpTSqv7ePqkPDVxLHbGc+WUa2xhnpyKymZkS6QJLk84r1Nn3m9DnM/zNznZFkZfNb
 OHk1+jHccN0Gbn1PeI/iH0gktjGjvdWX1HX9hk6n3EgIyKWI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Fixed bps -> KBps in the comments (Abhinav)
- Split the core_clk_rate changes into a separate commit (Abhinav)
- Expanded commit message to note that debugfs bandwidth settings are
  not a subject to catalog thresholds (Abhinav)
- Temporarily dropped the patches actually reworking the debugfs modes,
  they will be reposted separately.
- Link to v4: https://lore.kernel.org/r/20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org

Changes in v4:
- Dropped core_perf: from patch subject (Abhinav)
- Fixed indentation of _dpu_core_perf_crtc_update_bus() (Abhinav)
- Expanded commit messages to reflect different questions (Abhinav)
- Reworked existing files to specify max allowed average bandwidth
  (Abhinav)
- Fixed u32 vs u64 and KBps vs Bps values in debugfs interface
- Link to v3: https://lore.kernel.org/r/20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_crtc
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 140 ++++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   5 +-
 3 files changed, 71 insertions(+), 84 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


