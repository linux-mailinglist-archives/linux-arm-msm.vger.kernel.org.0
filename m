Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80820445E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhKEDH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhKEDH7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:07:59 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9FCC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:05:20 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id j9so6581697qvm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p29jzjn+HciZTKz27UBXeqRtt6jrYIq3wM4tpoc5cfM=;
        b=W3ZFF4OzpqXBx7l8s8Hp21cuwa2rPHqlccIfRMgsKQC+qqylzTSs/hsK4F2Npg1VIt
         2842O751JM4bJ9qTmPqpV4GUNnyF13Gekwl+rtPUvk5UQqc99nFnAlm3bg4hn9DoTD8t
         EEIQwJrTs3KHwK27wdfw5qmcNxNiYHyxLS5Afh+tYLjRMg4co/hsnJmPjugdVwy3Esl1
         MrtINU1i/tOHKAMtBWuulTJfaodNBdTQdfSxGsONUIIE36s10MBM4EELYo5rXKfjQg3B
         atwQFhGqGpsjcuij335zJpLoodi2ZmbrW81FOYf1t+TRbgUOz3BWp408+c59pQq164n8
         Njmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p29jzjn+HciZTKz27UBXeqRtt6jrYIq3wM4tpoc5cfM=;
        b=yf6dsfERO7dpv6Mkb+f7kXdVVMXlsK9PAQEuxhew3yUebjuo5inSaOfN1FBF08n7DS
         mUqoJuAhdu5sHqAmamTNusEyCCDtXZ3y801hQID3ew4cgSOS2nkXXf3H1uTBF/YZ+3f9
         9r01IupvuKZr6Ecp3dkK0UpP7VYCqZXTcy5/hgYyxDM0WXn+yvHMSNb0Ea6M2ZZlAPzc
         kKAinInpQaBcYYnTHFXFEHvO57MSBvHRh3EFXCr5FmjOhMgQd2jHKdRX/ryawW3OHORi
         lZNfyIbxgeI5JiRtGf10KFSWjSVpKanVHxgYjssR408UHWcaQ8GVQdIntwTuLcYW11ya
         STkA==
X-Gm-Message-State: AOAM530Wx21qpdMgL76MhHX0r9dK1FQd4nDc6kmyGq3SzCYERxsY/y+r
        Gme33wqhmv0eVmAe4yUZAt/9jg==
X-Google-Smtp-Source: ABdhPJxjpqaOuejmdoVnBRmMROAdccqiWmk/TA4c8Co84JjNZbbGXmcOjN0wLslqkbGBCU5dnpp3gw==
X-Received: by 2002:a05:6214:f09:: with SMTP id gw9mr21017353qvb.36.1636081519728;
        Thu, 04 Nov 2021 20:05:19 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id s18sm5475605qtw.33.2021.11.04.20.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:05:19 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        jani.nikula@intel.com, abhinavk@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 08/14] drm/msm/dpu_kms: Re-order dpu includes
Date:   Thu,  4 Nov 2021 23:04:25 -0400
Message-Id: <20211105030434.2828845-9-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-9-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..66b7df7daa6a 100644
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

