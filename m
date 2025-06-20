Return-Path: <linux-arm-msm+bounces-61885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E088AE1B29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2493BCF15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C470128368A;
	Fri, 20 Jun 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYQCReGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD221C17D;
	Fri, 20 Jun 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423673; cv=none; b=pWql/43phXz6ww727aqIcrHA+4VKmqpniwEr06irPo9ESWabF9hu8eXmoU1NuRpduF93/8vVc3RXoTCcSE9Z92HzdOdYIHR5ALrqmxywC4t1Ol1kK9kNb+oDyu1Htl3EhLjurUCBDekJx/C/Foh8S3+NyqHAeWSoNsRn6ZT5LDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423673; c=relaxed/simple;
	bh=PohVpKV1EcWKh5h1vwR17he9CFGObdq89GBQaGriu4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ewXq3UdSzFR+nUF44NhaIpmB5Yq4odV3+Np2cBitdDcUtsGBvCMK5mohrQheWynsI99rvIzHhHZciKnNKWggLTgeN5iyBPwLVFZrjbiMFY0WVfVjERLpLRcuknYhghiK1UggaJOOIhBktduPwBnZzTbmq6gsXFJYCqvLl6xlzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYQCReGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5991C4CEE3;
	Fri, 20 Jun 2025 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750423673;
	bh=PohVpKV1EcWKh5h1vwR17he9CFGObdq89GBQaGriu4M=;
	h=From:To:Cc:Subject:Date:From;
	b=YYQCReGRiY4bge2iScXEUhsyAwUA9zO30x+YLAZPrOw5ZXaXBYK7YdgNyiK7I7YMQ
	 3lm/LWDFqRwcJ5U5Nb6uZcwYxghT3T+K7UkaUq7zVKw3XmQc/ngnzoSaMtqdJsqhjE
	 TZb2O2acTpYm80M6MEaGtebmYBqavX9lYPPdU7p+D5z+SL5dc8jQI4eKf/m5LFeJxI
	 3+KfojPvF2NP/q3rVmjlJaYcuNk41lp6TCCl+qKNHRSqXL0lUGNLZ+XtnRbt9ffU56
	 UVWnbFFldiVaUUkqP+/nVqRQSisNR0qtfcft5qdPBi60WHAXGHW9AUSbIHZhH1+uC5
	 IGv6JYbx9zZZg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <swboyd@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: include linux/io.h
Date: Fri, 20 Jun 2025 14:47:43 +0200
Message-Id: <20250620124747.1928114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The driver started using readl/writel, which are defined in linux/io.h,
so this needs to be included here:

drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   33 |         return readl_relaxed(panel->link_base + offset);

Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 489e39f6c0ac..ecd5d3665541 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
  */
+#include <linux/io.h>
 
 #include "dp_panel.h"
 #include "dp_reg.h"
-- 
2.39.5


