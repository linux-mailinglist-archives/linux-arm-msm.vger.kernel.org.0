Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92F55AFD6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 15:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3NPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 09:15:04 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40584 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3NPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 09:15:04 -0400
Received: by mail-qt1-f193.google.com with SMTP id a15so11716046qtn.7;
        Sun, 30 Jun 2019 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=riq7pIWvMTDPqVqjETndidX913621E7xFA3bRlBlSUg=;
        b=h4XpgKT8JcW4J5Duus56KZ5uReiYiL1HWSxE0n6TomvnmrzHCCC1U96N8RS5AiiIZm
         i3Xt11sdsQ05Lv1j0YGULZjOBm6LHhO30TmZgXf5CaAHZ7pszm4mAfSmtza8NdlAp84s
         aifK1YPoxJrAGFbpE1dt9oGmXdeDbzzHLwIQCN57/FBhpYtZ6O12asZ6yzHllSIuXKHA
         DV5wDIcRiqTjfObes56x/qf2wpi5YFWEMDWQ23klhbgFiYAeD12K0u7M65vyGaISzcUM
         f0gNYP5XhltyyUeZJs3Rc2ma3Daupjh+VRpu4MW3iItnz++kDUE69CfJvpCeBFAOQAxh
         a6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=riq7pIWvMTDPqVqjETndidX913621E7xFA3bRlBlSUg=;
        b=GlQ03BFB+HIwDZ3WJEV+K7609QSB4EdN98ol/LEHjFWEfM6GC8XfsxAsd7M0OmVRtM
         bXh0vWwO7GWB6TsJOrJp9AQmpZZzAUQEqqHnBrgnMe/wQ8eaD6fXlAGCgQroRfxt/AZX
         A3tqS/CQACethkiik93Fgv1pppvW2PVC/J4PvsZ3hnprGOXtDW0SH4WbHMXDchoU20g4
         2fr3x/TT121NTniMjhvFGBPUWE0z+WGKXYEY0hEN1pX1U5Ohjlq/unel/YFT7zOBKDMl
         MDSkjoBYY8dy9E9ahpx28y1ZptbXmG6oudwD7j+f4IfcEq67XRzGiZYgL03zV7E3B7Zc
         EpxA==
X-Gm-Message-State: APjAAAVcCbYgSZstz4JMVudrYMgNRbv5PQp5PuGhvgChxGzZ+eD8eGCi
        cu226RSHg4iPA2ruFOtlxz0=
X-Google-Smtp-Source: APXvYqx7b5A+sDjJlT5l1rlIsq1Vay1GNZmKba43BBQIDhD4gh2+LZZcRKttP5biv/PTNpxePVeh1w==
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr16784207qvh.238.1561900503111;
        Sun, 30 Jun 2019 06:15:03 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id s130sm3656117qke.104.2019.06.30.06.15.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 06:15:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: don't open-code governor name
Date:   Sun, 30 Jun 2019 06:14:41 -0700
Message-Id: <20190630131445.25712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630131445.25712-1-robdclark@gmail.com>
References: <20190630131445.25712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a4c77fb3d94..e323259a16d3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -106,7 +106,7 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	 */
 
 	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
-			&msm_devfreq_profile, "simple_ondemand", NULL);
+			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 
 	if (IS_ERR(gpu->devfreq.devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
-- 
2.20.1

