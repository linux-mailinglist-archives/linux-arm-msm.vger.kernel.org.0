Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC694ABC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbfFRUZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:25:49 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37592 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfFRUZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:25:49 -0400
Received: by mail-qt1-f193.google.com with SMTP id y57so17122531qtk.4;
        Tue, 18 Jun 2019 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/mPcWOq6bvI/Rz9hbv+lJlmkKRg/e135jxE2BAg50pM=;
        b=A2+Re1WBNBOftakVI6RS8tTdogZIEpHTmvSLUhBTnj7jSO/1JQdBvuHU/GTYpThg0v
         cNvGiwlhpFX0Rz2L8uikLorkH5Z/VMo1TnBSwP42FrbPhRvGpVGF7e39yOIA6ZKNiGoZ
         +2SGJOttWeg/zmqDYPVPw+6CyZAVzyXYcF5HGKf+sMEhPyYOsgvTm/Q6iiV1SDd+yz3L
         CjiqL5/kToemOxQnH4GQmfNFh8XpH2atSaXIUBwZmBZvMeT3k0qW83KjwBANJ+Sg1/Qj
         LIrPeFDjUPu95ncOTwy6lieNtH+gTWDuHPnAwp4p3Rb3UDe/rkQYIq5ayV+7UmMU5Rb5
         XFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mPcWOq6bvI/Rz9hbv+lJlmkKRg/e135jxE2BAg50pM=;
        b=JZKVCzFPtclhgsAqLF3q1DAEUUdUmbSu70rlD5at2foECv7xANz6wAuX6LTTyMg1Dx
         FZwZuLBQrLNuAtYuJRQsb5mwQkczhqyaOryagLVEPBdA2B8L3lFMUnzXERvZnLQ7AXJX
         r+SXwnpZ1fBF7nwBxnTU1BnayR+aUgsNID1PzTcPj09s3JnmWfNL31FlZ8nhb9ui7Onk
         aCajpFldcUCwxh2l6ZD04c66Fwllz4ib6FBPyieTicSUkYX9rIy8uBnuDIl4oIcCDteF
         hb67fpGRtCbQ86leVvl718msle3a+dbzDjq4HNWRCWSPCTJ5n76jYqnqv5pu3Q5YqDIJ
         RI+w==
X-Gm-Message-State: APjAAAVvibroXaRyJMPT/0B7M76AaZo0wmsSOy69dJ9SxGT1RHdUoUZY
        OlXYFsd8uFcND3y8whx1zsC0K39ON+Y=
X-Google-Smtp-Source: APXvYqzyUL3X9E0qats7YR3PmXv//sVXhdaUp8xpUF8LRBxNUszW3/xqagPXh7quc7KRYLUMfm2cWw==
X-Received: by 2002:ac8:38a8:: with SMTP id f37mr101708974qtc.150.1560889547868;
        Tue, 18 Jun 2019 13:25:47 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id c16sm4004494qke.43.2019.06.18.13.25.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:25:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Date:   Tue, 18 Jun 2019 13:24:13 -0700
Message-Id: <20190618202425.15259-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Georgi Djakov <georgi.djakov@linaro.org>

The interconnect API provides an interface for consumer drivers to
express their bandwidth needs in the SoC. This data is aggregated
and the on-chip interconnect hardware is configured to the most
appropriate power/performance profile.

Use the API to configure the interconnects and request bandwidth
between DDR and the display hardware (MDP port(s) and rotator
downscaler).

v2: update the path names to be consistent with dpu, handle the NULL
    path case, updated commit msg from Georgi.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 97179bec8902..eeac429acf40 100644
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
+	struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
+	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
+
+	if (IS_ERR_OR_NULL(path0))
+		return PTR_ERR_OR_ZERO(path0);
+	icc_set_bw(path0, 0, MBps_to_icc(6400));
+
+	if (!IS_ERR_OR_NULL(path1))
+		icc_set_bw(path1, 0, MBps_to_icc(6400));
+	if (!IS_ERR_OR_NULL(path_rot))
+		icc_set_bw(path_rot, 0, MBps_to_icc(6400));
+
 	DBG("");
 	return component_add(&pdev->dev, &mdp5_ops);
 }
-- 
2.20.1

