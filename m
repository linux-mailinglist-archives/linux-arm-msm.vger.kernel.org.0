Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111D84ADB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 00:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbfFRWKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 18:10:33 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44760 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729982AbfFRWKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 18:10:32 -0400
Received: by mail-qk1-f195.google.com with SMTP id p144so9620401qke.11;
        Tue, 18 Jun 2019 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RAVgDcgFBCOULo1eBKU4bXJqt/a804uhCnL1Ylg6ZU=;
        b=XjoG6E5ABG11p1wAc4l3vKqy1ahzwsGTS8GvfXWtEYROU7Vb0LV9zvVbOCM/tbW/kR
         whr1r9a4MkCHftg3E8umf61Ff/ZSXYlw+7Pq4sSfd4BMXalLNpr4EdhhKdmrvaNsy1nF
         gDAQJq3qIMpmtlNAC+/FNo9dxWbPZRPmqoe/EVaIRbyhE0Ll7xbY4TQSpfxU9q+XJakQ
         gc8TUNLk8iOpq/iCx8nbdEMjhP3NL3DOuYocX1W5QzPKKICBvnuqYYz17Twqwv7Hjoqf
         UGMVmORRcFbljojGKYfBU8gBkcv4C95JDS9G1M6lAkbM7btw8T9307XOOXl6anKUyQdG
         CAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RAVgDcgFBCOULo1eBKU4bXJqt/a804uhCnL1Ylg6ZU=;
        b=VQL/30KKxl2TySNYUK2WvO1HIB6qYQS9yklLMJssZ161qwZAGVStl+rcf7EFvNRouy
         1/PyD0ebF8rt34qlheL8AdKcd/g9Fa7uOALdryhHcD6lnCXvbNOrOgO3s+3BJbO1szzB
         jKudtVhOySJBNgIqZi1MpCRDUzbgQkufmgNpnQtMUASCxFv53Hdi9q7IJLwSsLUDnmyt
         /HQNIW/bzHc9fcTmyA9ionaxY2KlHiBs1/a7wSupQMqRkEeVaGZiaojYvtJtMbmBIccH
         r55ORASDKE2nI2IyJfhdePuTZ4K3pgiqaiIQ7eKzRbJoTYee3L/znyQIQ5fGdtA+1g0l
         Z/iQ==
X-Gm-Message-State: APjAAAW7uH3xtgdMjGjGJ3/sTk1x2rzWEAFGrw1POIsCk0XcCb4R5+Wz
        Xa8rdjbcnM+xDVr9gxCZxeo=
X-Google-Smtp-Source: APXvYqyCDEh4Q3JCswgjvUWukfpNkCCvuJc1tWTtbcEP6NJap4d/3h0I9CEtXbdFtErmXIhtMpUKzw==
X-Received: by 2002:ae9:e20c:: with SMTP id c12mr96068214qkc.210.1560895831749;
        Tue, 18 Jun 2019 15:10:31 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id i123sm9480280qkd.32.2019.06.18.15.10.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 15:10:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5 v3] drm/msm/mdp5: Use the interconnect API
Date:   Tue, 18 Jun 2019 15:10:16 -0700
Message-Id: <20190618221022.28749-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
References: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
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
v3: split out icc setup into it's own function, and rework logic
    slightly so no interconnect paths is not fatal.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 97179bec8902..1c55401956c4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -16,6 +16,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/interconnect.h>
 #include <linux/of_irq.h>
 
 #include "msm_drv.h"
@@ -1048,9 +1049,46 @@ static const struct component_ops mdp5_ops = {
 	.unbind = mdp5_unbind,
 };
 
+static int mdp5_setup_interconnect(struct platform_device *pdev)
+{
+	struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
+	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
+
+	if (IS_ERR(path0))
+		return PTR_ERR(path0);
+
+	if (!path0) {
+		/* no interconnect support is not necessarily a fatal
+		 * condition, the platform may simply not have an
+		 * interconnect driver yet.  But warn about it in case
+		 * bootloader didn't setup bus clocks high enough for
+		 * scanout.
+		 */
+		dev_warn(&pdev->dev, "No interconnect support may cause display underflows!\n");
+		return 0;
+	}
+
+	icc_set_bw(path0, 0, MBps_to_icc(6400));
+
+	if (!IS_ERR_OR_NULL(path1))
+		icc_set_bw(path1, 0, MBps_to_icc(6400));
+	if (!IS_ERR_OR_NULL(path_rot))
+		icc_set_bw(path_rot, 0, MBps_to_icc(6400));
+
+	return 0;
+}
+
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
+	int ret;
+
 	DBG("");
+
+	ret = mdp5_setup_interconnect(pdev);
+	if (ret)
+		return ret;
+
 	return component_add(&pdev->dev, &mdp5_ops);
 }
 
-- 
2.20.1

