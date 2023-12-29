Return-Path: <linux-arm-msm+bounces-6094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E4820252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F41E283CC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52EA14F63;
	Fri, 29 Dec 2023 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fn42ghoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927C14AA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e4e3323a6so7908342e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890612; x=1704495412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRcyBHrlzE99VWMlLh6k7iUhBndwKxnf4JL9l9A4LA8=;
        b=Fn42ghoiU4Y0QfYFpUOEvAlgRAurDamrVpLuien/A8yERO6WP2R2OAGaf3fUR7wN9t
         jlCxfcpFd52nLZAzxOZO9IA+m3ACtiG7ipC8NgTiKIYEZpS9itlwffCQBamU+8+OfqX/
         c/Ze6eNW2VAqzN5NfFj4hgmCqIpAhlHxSKNQYbQ6C2cIamiYFWfAGqDUiEjYJNTT5s3P
         q4GkEV/Ykx5QPvOBzb5w238Gwk9pSKBC/ARliPlbdDJzsIeUrs2o96Vu6HBc6posTG5Y
         N0JWuEDoDT62CX521ayfCT7Fj0If+EpqNk/CSe1jhP/hjrnfN9HuYQroU6N2i21TSkzp
         Fc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890612; x=1704495412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRcyBHrlzE99VWMlLh6k7iUhBndwKxnf4JL9l9A4LA8=;
        b=qIRkMfsIWQRMyU+LDI1oyJ+mibyQvuwgEedBu/M7dyWrbnee17ORUnZbitvuDsc5wL
         E9ixyQNv9FH6rWYjn/KKXvQ5yvoM61544IWwHO88iXM0S2iTAuquyAVlpEgJXVTZMbLs
         rcLTv3VnClMhQM2/zwxgmQyLLncajS3gCKIrbXXrcs5HgEDn7y8x7fGJu/YkWmgbynSk
         8W+5ZQvtCPlB7Dt7PQuwW3ilhlVm4EMf9VXuCqCkAvYcXutIAeMgQ1EJETyWxZ2PHzDf
         UFnS39/lXFAoIhq1g7vj0wBVxx1ahiMHulHUhQALeofjqtBC5neRVKzemE5E/d4cXivc
         UJVQ==
X-Gm-Message-State: AOJu0Yw/1PWSUPrnRYzfOHjw+5bqYP5UspcWfX1mbqydORFIH071u5nd
	k6QACFtGV9ljV3IO/9a4YK5uBOzKD+jiYy/+m4W7V7XkEs8Uiw==
X-Google-Smtp-Source: AGHT+IE9F/wnuDMCjrAAp9h/hllAKH6e69+4qUx/Tl3C7H6RKkHc0hwikgHy32cSHlQkgL6n23JE0w==
X-Received: by 2002:a05:6512:23a2:b0:50b:f231:d444 with SMTP id c34-20020a05651223a200b0050bf231d444mr9132601lfv.7.1703890611714;
        Fri, 29 Dec 2023 14:56:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 00/14] drm/msm/dp: clear power and parser submodules away
Date: Sat, 30 Dec 2023 00:56:36 +0200
Message-Id: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
dropping the dp_power and dp_parser submodules.

Initially I started by looking onto stream_pixel clock handling only to
find several wrapping layers around a single clocks. After inlining
and/or dropping them (and thus dp_power submodule), it was more or less
natural to continue cleaning up the dp_parser until it got removed
completely.

Dmitry Baryshkov (14):
  drm/msm/dp: drop unused parser definitions
  drm/msm/dp: drop unused fields from dp_power_private
  drm/msm/dp: parse DT from dp_parser_get
  drm/msm/dp: inline dp_power_(de)init
  drm/msm/dp: fold dp_power into dp_ctrl module
  drm/msm/dp: simplify stream clocks handling
  drm/msm/dp: stop parsing clock names from DT
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
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 ++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 317 +++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 ++-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 101 +++------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  63 ++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 327 ----------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 155 -------------
 drivers/gpu/drm/msm/dp/dp_power.c   | 183 ----------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  95 --------
 15 files changed, 463 insertions(+), 985 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.h

-- 
2.39.2


