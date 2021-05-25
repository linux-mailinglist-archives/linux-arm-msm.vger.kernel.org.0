Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A303B38FFF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhEYLai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 07:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhEYLah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 07:30:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE6DC061574;
        Tue, 25 May 2021 04:29:07 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so28230552otc.12;
        Tue, 25 May 2021 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoShwNufQbQ2PZjqsVFrN16U7busUrI6QbgoEQ1ik9U=;
        b=UlUxDSew9qGjS82r1rZpuGLDADXC/09HyxIu97KYoTOIhv1pbPIn0xyx/MbrNGxBoy
         LGfIQeCGjSA9PESwug5um/Fzper9UjbhOUBKUc+aDp7sjNrE9QRBTod2hyOtzPsfrp9K
         6oJykwLnNQmoTdInTlFpu90Svej0cJrTYVOxl+kw9HBpLJGSXb/amOcx1MLHSXLIXiUL
         gIvwbZqRLZNzKdDDngeuMjDarusaqSRk5x1HlmHOcryL+qyDwtuJ2ZGO9JRiJAoHEsKz
         CO2Xz2bbbgI2tas6F2L9E/iEDlElVsADLALlG1P/R6z7AMxcVV95rfo/tKPUPmjSuar4
         UG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=OoShwNufQbQ2PZjqsVFrN16U7busUrI6QbgoEQ1ik9U=;
        b=STH4ALOWNWonQaVdU3OOSUfcF+lQvR3PRwq4ri7Ix4KLOB8Z74xWQ8uEVFuGcqcAhw
         LXyaGbh28aw3/REs8utMB5EroSASfkPIoy0TMkoEKS6aKbwXjUFzDXRMgFSrzdPi94y/
         3DvyTBA+aejKGBTOTyAyjKIZG1gt8/6l3ILIzvBQr3ZbNCaoPubzhfoLZWat0kk7TiPx
         le2na+rG4khX2+946k+vVj+ZwnjUI24PsKeYPugf8Lswnlvm7VxqM1BZzrQaEZt5wcue
         PQGxOUA6UE9W8Xb/sh/ZABbC95dCsb4fTDrORS6GRqsDUmSpyd5UxBIi7R4xDrAR6j1l
         28dQ==
X-Gm-Message-State: AOAM531K+kTdZI9CdHsNFtugrk91Hw8EN61AOQ41SZykEdqYKoKqQAYM
        kwxUoJt5ZB5yDVSqyvhEU/4=
X-Google-Smtp-Source: ABdhPJweJNrVeu6J02faHo9+lC6+Mm+P38lD8sy+b/xV4p1EN+w+OJfUdWVoLf2jWnnWsFzeqIuA4Q==
X-Received: by 2002:a05:6830:31a1:: with SMTP id q1mr19611535ots.106.1621942146883;
        Tue, 25 May 2021 04:29:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l20sm3395069oop.3.2021.05.25.04.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 04:29:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] drm/msm/disp/dpu1/dpu_encoder: Drop unnecessary NULL checks after container_of
Date:   Tue, 25 May 2021 04:29:04 -0700
Message-Id: <20210525112904.1747066-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The result of container_of() operations is never NULL unless the embedded
element is the first element of the structure. This is not the case here.
The NULL checks on the result of container_of() are therefore unnecessary
and misleading. Remove them.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d942052db8a..a573fe211375 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1453,11 +1453,6 @@ static void dpu_encoder_off_work(struct work_struct *work)
 	struct dpu_encoder_virt *dpu_enc = container_of(work,
 			struct dpu_encoder_virt, delayed_off_work.work);
 
-	if (!dpu_enc) {
-		DPU_ERROR("invalid dpu encoder\n");
-		return;
-	}
-
 	dpu_encoder_resource_control(&dpu_enc->base,
 						DPU_ENC_RC_EVENT_ENTER_IDLE);
 
@@ -1797,11 +1792,6 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			struct dpu_encoder_virt, vsync_event_work);
 	ktime_t wakeup_time;
 
-	if (!dpu_enc) {
-		DPU_ERROR("invalid dpu encoder\n");
-		return;
-	}
-
 	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
 		return;
 
-- 
2.25.1

