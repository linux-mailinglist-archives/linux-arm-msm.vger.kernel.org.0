Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D855778D905
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjH3ScI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245455AbjH3PQ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AFD1A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 08:16:26 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5093250f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408585; x=1694013385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzP+WDXpCIJ83eyS1sSUoyFyWkuTu4SeftUI6Gv33l8=;
        b=Vi13Ttb0L7ICF5ISHNhzYs/bx9t6jbj44sziLlVWdQp0hMHEfN3lfpdRM1bT0+wHqp
         E9ZZhe61rTIR4/tS0hAn0TlBtP0Z1NFC8lfgnQmVgn1YnWltsWgxxrkisxFvuZWuxI8Y
         +zdgNSTthJC++1FyrkBlvC1LNq/ZN3I2MlWgkIx102zY+zeGoMFtQe3/1rG+CoH1d3cA
         VAoCjYjBXjG2x2XtkduZ8spjbO9z0piK13dnzn06JtSCYaBEe5wRFDnRn5Og0wBnmHMB
         xQt/jq7HgUmQ0WVv/D1RkBaHvBa3BOr3BHX4yZnCGvkbc/PyWIOEf7zz9/eV21WlpSY6
         mbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408585; x=1694013385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzP+WDXpCIJ83eyS1sSUoyFyWkuTu4SeftUI6Gv33l8=;
        b=CkwWGIVE0lhrcUEKCSqf+Pt6rYzgRA1tyuRF0MnRtGfD+k/s10Bc4HQl+/Rbf1yvzV
         R7RALPlKm6a3SgpR4c5xtSSRycc+mSAdKdf8kcenshJNjjtFLera89RM2Glr4jTO5pLL
         H9t9udsTpEjOmv7PDa53Us5MaRWcVo0aXqqWW6R8mQ+iZw/KzFGeC8wBmv+DXEedJFwS
         9bdQgEA4WiQ1sZsE3vEck89QOiWWp1GkaxrbDGv1f7+5p7UUVZTJn/X3k9/jaI2Jyb5Z
         QAoYX/Ir98/shvL1Jbc+Yf4pyP5mROelqdSS7becz+KA0Qm5cW9vt7FFTS5W4223fD8+
         lydA==
X-Gm-Message-State: AOJu0Yxi0KgY1OzUJHavuH4fmXU+SvGE7j8LYAbWvz7frLRQlPcKo5LD
        8ivW2GdRA6Dshn2h2UHqLin26w==
X-Google-Smtp-Source: AGHT+IFrZu13fmhwTc0pvYgDSEZOXex55onoo1vQnHjff3TfyW31VMf/MtTIv1dLEto4FIyjgsJX8A==
X-Received: by 2002:adf:fbc6:0:b0:31c:71fc:7bd6 with SMTP id d6-20020adffbc6000000b0031c71fc7bd6mr1915704wrs.46.1693408585372;
        Wed, 30 Aug 2023 08:16:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 06/10] media: qcom: camss: Fix VFE-480 vfe_disable_output()
Date:   Wed, 30 Aug 2023 16:16:11 +0100
Message-ID: <20230830151615.3012325-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe-480 is copied from vfe-17x and has the same racy idle timeout bug as in
17x.

Fix the vfe_disable_output() logic to no longer be racy and to conform
to the 17x way of quiescing and then resetting the VFE.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-480.c | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index f70aad2e8c237..8ddb8016434ae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2021 Jonathan Marek
  */
 
-#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -328,35 +327,20 @@ static int vfe_enable_output(struct vfe_line *line)
 	return 0;
 }
 
-static int vfe_disable_output(struct vfe_line *line)
+static void vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
 	unsigned long flags;
 	unsigned int i;
-	bool done;
-	int timeout = 0;
-
-	do {
-		spin_lock_irqsave(&vfe->output_lock, flags);
-		done = !output->gen2.active_num;
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		usleep_range(10000, 20000);
-
-		if (timeout++ == 100) {
-			dev_err(vfe->camss->dev, "VFE idle timeout - resetting\n");
-			vfe_reset(vfe);
-			output->gen2.active_num = 0;
-			return 0;
-		}
-	} while (!done);
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
 		vfe_wm_stop(vfe, output->wm_idx[i]);
+	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
-	return 0;
+	vfe_reset(vfe);
 }
 
 /*
-- 
2.41.0

