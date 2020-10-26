Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE6E298D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 13:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1775448AbgJZMsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 08:48:42 -0400
Received: from foss.arm.com ([217.140.110.172]:37960 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1775447AbgJZMsm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 08:48:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98B611477;
        Mon, 26 Oct 2020 05:48:41 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B47273F68F;
        Mon, 26 Oct 2020 05:48:40 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add missing stub definition
Date:   Mon, 26 Oct 2020 12:48:37 +0000
Message-Id: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DRM_MSM fails to build with DRM_MSM_DP=n; add the missing stub.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/msm/msm_drv.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b9dd8f8f4887..0b2686b060c7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -423,6 +423,11 @@ static inline int msm_dp_display_disable(struct msm_dp *dp,
 {
 	return -EINVAL;
 }
+static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
+					struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
 static inline void msm_dp_display_mode_set(struct msm_dp *dp,
 				struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
-- 
2.28.0.dirty

