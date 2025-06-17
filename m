Return-Path: <linux-arm-msm+bounces-61625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B346ADDBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 20:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD4E1785D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 18:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C7B2E2667;
	Tue, 17 Jun 2025 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="etzspGAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E092EF9D4;
	Tue, 17 Jun 2025 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186574; cv=none; b=Et2u5pIDlpQ8ZNuHCJHoxRQ3qLR/Dp6irnK4v0pIXsHQ8ASr2HdGBWlHNhrO8dNGI5y3ch6IM4uOtS4aNtI5NDtDAfFKK7LCr2CkGJLaiSTV/yBlVCEqN4C8sYbA1M2PqruFp8o77GUA1Mn1tOuULnyX5qFaG83RVEajpHR7GvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186574; c=relaxed/simple;
	bh=I9zZeruq9Ljo+K9wZVMBqsvyT2j+dsgFXhEppnxCSe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WaVg9sHHcTDUxNv+czY2xxJVhfbqTXgeqgQP0BdW8PQz3SPhVDn8Pau7Kkh76Sfy43rp13O6chROPq4bOSZwAqjXiOUyGEKOjjdfYNaju/q7QvS4yoBynBmtEWvuhw3akFgrBgDq6ipz5PKZ7rh1vq1aqrtsZOulH5aUjbtaCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=etzspGAz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tIw2w8u4nYMztG5MgyDq77ZNr77yNCVZF5PqgMqfT/c=; b=etzspGAzIiggD7N2nPSW091Txt
	eqVQG4e+2T5J7zHhK1idKeV0F5EKOLticNKRWy0d1wWROjKnDxDnKzoUkHeVqLf1dy0bJ+sguMRly
	ymsUlyNvShhkqLAy5cwoupL6tjObWUN3AT+X1IvuuKHaF1NpCNdm1oH361Is1lK/EHU7xaIc30Map
	7tlGJoMaQ9588y2i588Hom9elOLhVz7Kf4TMXK+xTL5UN6yCulacptSAKYRpzfLIpCGJQw+yDmSrD
	AJhAO8T4OlOGviKqeUteKcDB9bSLRHkRehqhmW/8BaROjIKGmJyqlzZeSx24YxA+30codY8weqy2d
	rUTIdSaA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbTg-00000008Bua-1yAx;
	Tue, 17 Jun 2025 18:56:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Date: Tue, 17 Jun 2025 11:56:11 -0700
Message-ID: <20250617185611.2965223-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add <linux/io.h> header to pull in readl/writel and friends.
This eliminates the following build errors:

drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
   33 |         return readl_relaxed(panel->link_base + offset);
drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
   43 |         writel(data, panel->link_base + offset);

Fixes: d7e3bee925bd ("drm/msm/dp: drop the msm_dp_catalog module")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/dp/dp_panel.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20250617.orig/drivers/gpu/drm/msm/dp/dp_panel.c
+++ linux-next-20250617/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -12,6 +12,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#include <linux/io.h>
+
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
 #define DP_MAX_NUM_DP_LANES	4

