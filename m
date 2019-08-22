Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FBE99881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 17:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbfHVPs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 11:48:57 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46235 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfHVPs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 11:48:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id m3so3878306pgv.13;
        Thu, 22 Aug 2019 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gibvD/PE/0k2/MgxLtnC9v6hycHeC3vvECK4dop/Xo=;
        b=sF3NPfIhqt3Hzc9KufbzNsaUbbCQVjOI0o8UDhRvQtYR6/vH4PpZ/wkdh5TWxLkeKj
         mYde/YuazOc7nnSd8AxHozSoOH7LNUG36AuVSRCxuqqR4vLq89D4Nx3G4d9wbbqMCKyv
         sNqskZoKRu0j6XgfoLa/t2g9/VruzpdsSCZdPFcMUMdYtbVL5xgYtz5X1SrxIeajHRWC
         kLnexInTNp9iOEi9RBQoksUAmmznkbgNBXhYWHm1bttktZ0CHdI2PQW/PQESCCDkniES
         m8iyUQRftUUQF4+y63MkpSC4J65mZgfABsePvyUm0wMae9ctxYXnF8FEgm1kfGX4Dqp/
         1UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gibvD/PE/0k2/MgxLtnC9v6hycHeC3vvECK4dop/Xo=;
        b=KKcL7djQSNRXdS/QWIR4w2HSOmv1vX6x9NXoS2WlQGxWKZUiXs+xEP81ZbOQkAbxfO
         dmkZ23JSPNVqO0fhBJJ81exblUSUp0mC/SUm+XjTgKhfXhlVgY2IOv2+fNvAYiClixqN
         MZ0lYgyOWWN4oD3aY2BbMictXpjHMBIRaunvKb1sr9Lesf0bqMzCNjcxBEIJuDQUL9Jh
         0rIWRtODGrhl9U99HFS/QnBKdkuKOCCm8Lh9jY0zyhH60Ee6/deTfGy9micyZoVJUqzF
         lo0W1dT0TX6pd1NMuRgZbk3/+CsJvkS5v3+FouiYXUlRcT+hMneadnI/hDwpIh+bYXsG
         xQmQ==
X-Gm-Message-State: APjAAAXrvv9gX+lskIo+dqfHUHoR/9HY3kqivvHO1AJiVDgsn7tw8qxC
        t4PWdNatvratXyCDL6SI2zE=
X-Google-Smtp-Source: APXvYqxoI/708laf6gtdOu/5W9IHi68WsTOyfXTApi1AbF+GqRB6Sp57tyWIM4vuUW9q1QIysQIBrg==
X-Received: by 2002:a63:e148:: with SMTP id h8mr3032468pgk.275.1566488936083;
        Thu, 22 Aug 2019 08:48:56 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id ay7sm3717pjb.4.2019.08.22.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 08:48:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: add rotation property
Date:   Thu, 22 Aug 2019 08:46:21 -0700
Message-Id: <20190822154644.11723-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 45bfac9e3af7..970194958257 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1040,8 +1040,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_mode);
 
 	if (pdpu->pipe_hw->ops.setup_format) {
+		unsigned int rotation;
+
 		src_flags = 0x0;
 
+		rotation = drm_rotation_simplify(state->rotation,
+						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_REFLECT_X |
+						 DRM_MODE_REFLECT_Y);
+
+		if (rotation & DRM_MODE_REFLECT_X)
+			src_flags |= DPU_SSPP_FLIP_LR;
+
+		if (rotation & DRM_MODE_REFLECT_Y)
+			src_flags |= DPU_SSPP_FLIP_UD;
+
 		/* update format */
 		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
 				pstate->multirect_index);
@@ -1522,6 +1535,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
+	drm_plane_create_rotation_property(plane,
+			DRM_MODE_ROTATE_0,
+			DRM_MODE_ROTATE_0 |
+			DRM_MODE_ROTATE_180 |
+			DRM_MODE_REFLECT_X |
+			DRM_MODE_REFLECT_Y);
+
 	drm_plane_enable_fb_damage_clips(plane);
 
 	/* success! finalize initialization */
-- 
2.21.0

