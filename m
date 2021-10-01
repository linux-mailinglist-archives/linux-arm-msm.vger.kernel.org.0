Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A0941F0CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354820AbhJAPOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhJAPOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:14:11 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4701AC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 08:12:27 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id cv2so5747288qvb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rz5gCzVDNV62cuv4vyK+T5ukQ7N8zj3vMSyr7EWxfPQ=;
        b=S7nyWdGn5iqG2gUb+u/f2G7vtcP08aG/rEHaXicD7Lh6GBWOnbGHLk2zM5y/90c1fZ
         nd30Dob5lUGRzMJ8VACsYqHDnKBOuPVRejGVKk15fZ0k8OnYSbJb5/nKDcbBSUS2IlDA
         r/Aja9AKgI8BDZQ6diJAWNeiC8QOM0CqTJorzMiIZCY5DXp//YyzcU3yrlG1W3aOiX6k
         HUL6dHEvUPID0gKIcvh+9YxERfSMmZauBkOgpedJY43x2UmJEfbw2cmVWm+S2byH5XLH
         rOwizyFuqxkUPfxQTCrLFR7lThZeeTjZ+23FToKXcHB6M7et2REhbLP6pRlTIOT+ymlS
         Efaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rz5gCzVDNV62cuv4vyK+T5ukQ7N8zj3vMSyr7EWxfPQ=;
        b=ZdKE37sdWdLZcveErSqnxtZPXMY9vHXPA+V9lQoUoJTPMis3YjjIjSD92CqBWkiWnR
         i15TXb0L7JgurGfVZWGKJrdTOjxvpN1zYUjm+bCrmfg0iigGcnlrTgU53+Xv90ikvJaW
         kJyYkDD8ByOabqEI69K4OkVLCpZ5K2khLUShqyCL+Nq6kuKzXP/T8vuxzgp6z3WAr+VQ
         8AxTY6QZA7ln90vFs3/rEjl3VfSct09KeRa/YV/q99U79SJUcOLpekDpiwfK6qQIqrtx
         NkZgC0GrxmHUrHjTy3eMbOzM0A/quX3wTmK74aqmI0jTdQbmfXQAJ9fiKvNdzOzcXZm7
         maFw==
X-Gm-Message-State: AOAM532zl+3nAoeunr7eg3U5lFtz4MJIthg1NwBoL68yWdJFMJGH2Leq
        hAkcZOIzMnw+9EeoZI33Z6owOg==
X-Google-Smtp-Source: ABdhPJwBtXAxIHHmKlEd+vw6XuF/oHF6qtgC7vJFS4QGvfBf/twt1YKz0iQR7Ix/Be5gkY5Yuf7Cbw==
X-Received: by 2002:a0c:8123:: with SMTP id 32mr11009090qvc.26.1633101145767;
        Fri, 01 Oct 2021 08:12:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id l19sm3111643qkk.12.2021.10.01.08.12.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:12:25 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, jani.nikula@linux.intel.com,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date:   Fri,  1 Oct 2021 11:11:37 -0400
Message-Id: <20211001151145.55916-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211001151145.55916-1-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
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

