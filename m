Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968F977BB14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 16:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjHNOKn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 10:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjHNOKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 10:10:23 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9BB10F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:19 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so9892235e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692022218; x=1692627018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ2VKKNJcWBxsnE8fA4GSZFE3NOH8fxJi08OtAhPrEw=;
        b=Mn22HERcpXlroDs+/FCJiePaeXEKHCWXSFLGmImAWK4EQdFb957K1GNW7MJC9a5AcK
         tnC/erJ33wphzNwgqQ8EoY2aXND8VWPXJxN61GTG2d3OrxCGtyjqKq4TZLqQjBnR879l
         gkKBTcCzDpH80lFnBn49hEWD0gGlEQIBB2/dVetvx6eVzrEFZ3vRjNCh9k3VDkxUq5HV
         M/3DmfgxPF4gCkeWRpkJV4f4Y1dxfBB0l8fuayEpXsdTpI6vOzd52iP3Fdjd/8TpdHJn
         XRlhmqUx4hSVdbIi6YFSq1KlyII8OL1J8BJYLclSvyKTzLAjPPR6sLUryM4r1AwkfSwI
         +wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692022218; x=1692627018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJ2VKKNJcWBxsnE8fA4GSZFE3NOH8fxJi08OtAhPrEw=;
        b=ALJHSkT+7P7LASfsBDCUNAW+xRzyA0deBQcLDHS7/5hA2eg72q34HUPQm7slMU49jP
         efQ/cztrPni36wJYIky5cr50DmPFv8EG6thSf80r5NiPxuZxREnRw1VMI0y35nlNPwvK
         FdIIImKY3DRYSwlishG+RJgYhII/Un7ZOnlJsGMf9lnLEn5yUtE6/e/Hn0rVsYvzSy+8
         dcilCrpslmMXRQrI3EawMtWof3sO+WCptq2ge4RCsLy68/trkQV06QPa9kztJzc/SQ/q
         LE3ujg4H3heerScKvoOb54KLt9R4arokTJz3IH3CqSkPUUW3CoQ7t+jVijjhj6DPbBgf
         ynRA==
X-Gm-Message-State: AOJu0Yw2JJfXwJTTEIvgI1DG9dc1q2RfOIVdV1vcuBnMrmeEVoRGnAOV
        k9Hj4bn+ssH2eVLAkqMq8oy7rQ==
X-Google-Smtp-Source: AGHT+IFBODyBcaHpUIUBsRveoyGgE4rZK//R7LLNqO2VFTzPcHJ89A56sccojLran65gr6mgI+prhA==
X-Received: by 2002:a7b:ca59:0:b0:3fe:6640:f536 with SMTP id m25-20020a7bca59000000b003fe6640f536mr6619428wml.40.1692022218483;
        Mon, 14 Aug 2023 07:10:18 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003fe1630a8f0sm17232749wmc.24.2023.08.14.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:10:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v0 5/9] media: qcom: camss: Fix VFE-480 vfe_disable_output()
Date:   Mon, 14 Aug 2023 15:10:03 +0100
Message-ID: <20230814141007.3721197-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
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
 .../media/platform/qcom/camss/camss-vfe-480.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index f70aad2e8c237..a64d660abc538 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -334,28 +334,15 @@ static int vfe_disable_output(struct vfe_line *line)
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
 
+	vfe_reset(vfe);
+
 	return 0;
 }
 
-- 
2.41.0

