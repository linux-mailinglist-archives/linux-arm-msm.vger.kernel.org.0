Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905FD18146
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 22:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfEHUn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 16:43:59 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38619 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfEHUn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 16:43:58 -0400
Received: by mail-qk1-f196.google.com with SMTP id a64so144398qkg.5;
        Wed, 08 May 2019 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D+5a7yIWfQM2RvqyQS12Uu7fVHTzOqx14y8Bsmfizjw=;
        b=PXEIRHCYBAhc/MI+OVHSqQ/OUK0FRyA6cewJp/JxCuqKhxrD8xflX/xYjakuSRlV+j
         bzHoRlNx4GFNyr08V2kvI/4lM6I7pR2Prx/hnUbwntSECCYxbZtLDy5nqKGHoxA2jJnR
         OBqMmCSgzw1FD8ho4L/G/2RpClWH07txtknw+rLfb91XD5WBEYAv34JlkjZ4Ump9shRK
         xtukBuq3opyrXSjbhg3OQIhlFWAVxGl0wfEYTXiqJ6ZxAQT7zxm8xXNhpRuOVUTuwb6S
         7849sMDcPeGt911RbZvMqWtBmgDUHKEYvR9I2ajWYjeDjvjt8pT6uV77orYWlkIvPQM5
         WxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+5a7yIWfQM2RvqyQS12Uu7fVHTzOqx14y8Bsmfizjw=;
        b=fyX6gBHpauc7lPQJxrx3Wb5LLtxUWh59dh9KtGuXNn9xlDON5sbJMabts/N4zUWloL
         N+x4bLO3XHABsxgp/5a4U6s8Sqi31V8D/nNCGDgEbR4qTGw3/O6auy6We/rKn88o8an/
         tDeuRyBB1HO6jnnwRUmzLh0z0pvK6xr7/feiGggNbf9Ia3OmCmedFS2d+VyiHWPGrIxf
         iUbMkWg0KCrr825CrNI46xC1OOwL9EHmKDUHGznEFegFuWNyWV2uHgQq3C1P3HXzouWP
         Vrwp7qjJ7aILk3Xgf9U74za9zHIXlZI64RwON9u1LW5e0NG8Xcr1TLhPk6azjLJMrkGA
         tG7g==
X-Gm-Message-State: APjAAAUHiHQobMP2miY9SHnzEiAL3m99Rr90KKx+6fIq8QU+estUVWLN
        yYNkepz2rHecJRfkYzjV8AI=
X-Google-Smtp-Source: APXvYqxuSaA7O0Kfvow7bS6+66Q1kCm9xtHIqoJya9G35v6+67pZVluGYmgVIgRVikVrU1R2Ow08rw==
X-Received: by 2002:a37:b4c6:: with SMTP id d189mr7925772qkf.173.1557348237279;
        Wed, 08 May 2019 13:43:57 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id u2sm14131qkb.37.2019.05.08.13.43.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:43:56 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Date:   Wed,  8 May 2019 13:42:15 -0700
Message-Id: <20190508204219.31687-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Georgi Djakov <georgi.djakov@linaro.org>

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 97179bec8902..54d2b4c2b09f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -16,6 +16,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/interconnect.h>
 #include <linux/of_irq.h>
 
 #include "msm_drv.h"
@@ -1050,6 +1051,19 @@ static const struct component_ops mdp5_ops = {
 
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
+	struct icc_path *path0 = of_icc_get(&pdev->dev, "port0");
+	struct icc_path *path1 = of_icc_get(&pdev->dev, "port1");
+	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator");
+
+	if (IS_ERR(path0))
+		return PTR_ERR(path0);
+	icc_set_bw(path0, 0, MBps_to_icc(6400));
+
+	if (!IS_ERR(path1))
+		icc_set_bw(path1, 0, MBps_to_icc(6400));
+	if (!IS_ERR(path_rot))
+		icc_set_bw(path_rot, 0, MBps_to_icc(6400));
+
 	DBG("");
 	return component_add(&pdev->dev, &mdp5_ops);
 }
-- 
2.20.1

