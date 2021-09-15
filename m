Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC9640CE35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 22:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhIOUkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 16:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhIOUkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 16:40:40 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFFCC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:21 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id a12so2761783qvz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KxmkAJV9ZiXz1VZdO5RDAtoOnhIZgkvlq9IMhYeBvCI=;
        b=VJyq0dLF/hIukXRkiDYuN1USKHBDNJJRvqQz/YqQ/52q3fKBVx+ATDY+KWNBxaN1tJ
         AMrdwzvzeryTANiyfxKXDNq0nxCzDD+X7IysTKAOWljDT9uQA38v5lBLAYnum3kCppv3
         6yIXCGpDkzqtQLKL90J4bEa8sZTXtS776viOPZxqUBto75jnLvZm3zcFinO0cA148ocY
         mHCc6ErzdPiqjGDZ4Uf9yILcXglEoETzc/GRAXLIqQG/G50PidjiwqBIU0Y7bIdUTykK
         jB12yk3Bc16zH2tIvk7AiSUAI8dOOBK4LK5AS+KSrU7aTA54laZXtLpM5mOCHC4FmMkT
         W4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxmkAJV9ZiXz1VZdO5RDAtoOnhIZgkvlq9IMhYeBvCI=;
        b=r77dSQrwz+yHl9C5IQRbApD0yxDXLKv1+qvkVZMDPZ6Fc7UCF8eMXJJ+5ahOXeYjP/
         IaYAhPxEvxpF5ZOPxklu8J7r8oskUHe9hXBOJbyHQXwPKD8cJKy5AqgUd7APphQlOIlG
         DuNa6ssP+ho0tFb6JGJd4Qr1mTTaG1IJikpWbbav1p/bwCZ0ACvsUl26Bfz+HyNc2Orv
         IFxfDFynA2MYrJfB1+zhgG6ozN/tXhh2DK9o6ERlzvsSQua2yEBtX6uEgwNkpRWtZAZi
         f8H7lrnCnp/CIEbxcE+b+Pn9vmODy8IywV4WhdTfZm7ATDJzX4N3Nu61XuI/go6+tvhU
         eybA==
X-Gm-Message-State: AOAM530G6eWdymd2siP8GPJH91HGWYOzYztNzFmI6xxSd4urgTS8XL6h
        Xmy2530977GEwnh5M+Mjq1YoRBuhhR3fMA==
X-Google-Smtp-Source: ABdhPJxSKhnrhOf3Y3kLRjW3BfWFtWjOwSoFk1lnfWF7C34Zq9UO645CASu+Vc7YqbfL43cag+DaBg==
X-Received: by 2002:a0c:80ce:: with SMTP id 72mr1859211qvb.39.1631738360201;
        Wed, 15 Sep 2021 13:39:20 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id 90sm696629qte.89.2021.09.15.13.39.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 13:39:19 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu includes
Date:   Wed, 15 Sep 2021 16:38:27 -0400
Message-Id: <20210915203834.1439-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..fb0d9f781c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -21,14 +21,14 @@
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
-#include "dpu_kms.h"
 #include "dpu_core_irq.h"
+#include "dpu_crtc.h"
+#include "dpu_encoder.h"
 #include "dpu_formats.h"
 #include "dpu_hw_vbif.h"
-#include "dpu_vbif.h"
-#include "dpu_encoder.h"
+#include "dpu_kms.h"
 #include "dpu_plane.h"
-#include "dpu_crtc.h"
+#include "dpu_vbif.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
-- 
Sean Paul, Software Engineer, Google / Chromium OS

