Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2563A518DC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 22:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbiECUJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 16:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238111AbiECUJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 16:09:12 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF0D17A9C;
        Tue,  3 May 2022 13:05:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g20so21064447edw.6;
        Tue, 03 May 2022 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LFkwqeNMXvWSRmicZbw5B/Ot0aDTRBEW7BnChVj7xEc=;
        b=S7mbVu6+3bbSuyR9MBMSh10cZl+yedOVDmkIw2pNMHgBBw1iblztjezZ0R7KkCa/Z+
         bDvzGlXeUzzQ9EpmVOfyp61y9NY+jm6ROSi+EQkGPfv5ylgvVSLqe16kXmSPHCaGvdyQ
         I4+zIBIRS4QdtoClkqkIYeuXq1MvrWi2BzzFbuITPDdxbxNBDWpnWjz9M3w9POvpmxkB
         lojzM/Z8xicb/X4DZOVsPleus9oNkfn+VHlP//XYSmGxtGazkzGgW1XUZzw7sBqsFaTC
         lViGiz0/Srh+gxW3ImGx8sqGNk7xwXsMT2hx5pnJhUjMq5+Tj0CUDv5gwsZACjo56pqS
         eImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LFkwqeNMXvWSRmicZbw5B/Ot0aDTRBEW7BnChVj7xEc=;
        b=5BK0KP3Ub5dow+vouxIBDQXOcyWBpSxpGcdzTtOBPzba/pofeNfKSnXxzGRh1/c5SP
         B+4hMKGu2kWaeu/R1V7O6JcwWxIv9smKg0a+ql6ansZEbFPAKBbrmlr8R24mHGzOccAh
         EruuWR8sTsN5RGLLVLifsGYSAsKDtpvQhdc5J3/ucXCrbhFRF+RHEJ2Wve7Sy8Q0WzoB
         n6OICJMSHaThouEXwoEXSP4E7q4J7dS+TsUj9ll9mfoE1+W+9eMZFEwyaLsNLNSq2rm8
         qAeat7ORWEPv0JR1Y8idTVg+zTROniT7/FknrcCgolNqYLy/6Wm348KH8FxVc6MXAwtx
         nfYw==
X-Gm-Message-State: AOAM530jvqTSBRkeG42tS9vOBc7SJNmRot/o6On9fK9PPzee4e1C8MKm
        XRFKRYuKBLAWK+fX4SVsGO4=
X-Google-Smtp-Source: ABdhPJw0E3FIvglNgN66EYv5teb9pu7TDi7cQ2ljqDL5wBNZ+kedyY2qYnnpA1CKfQihjG1Lp/e/wg==
X-Received: by 2002:a05:6402:1a42:b0:424:20bb:3e37 with SMTP id bf2-20020a0564021a4200b0042420bb3e37mr20164328edb.29.1651608337002;
        Tue, 03 May 2022 13:05:37 -0700 (PDT)
Received: from fedora.robimarko.hr (dh207-96-149.xnet.hr. [88.207.96.149])
        by smtp.googlemail.com with ESMTPSA id ee47-20020a056402292f00b0041d893ed437sm8688450edb.2.2022.05.03.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:05:36 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH v3 3/5] drivers: thermal: tsens: allow configuring min and max trips
Date:   Tue,  3 May 2022 22:05:28 +0200
Message-Id: <20220503200530.4019673-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503200530.4019673-1-robimarko@gmail.com>
References: <20220503200530.4019673-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 and IPQ6018 dont support negative trip temperatures and support
up to 204 degrees C as the max trip temperature.

So, instead of always setting the -40 as min and 120 degrees C as max
allow it to be configured as part of the features.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/thermal/qcom/tsens-8960.c | 2 ++
 drivers/thermal/qcom/tsens-v0_1.c | 2 ++
 drivers/thermal/qcom/tsens-v1.c   | 2 ++
 drivers/thermal/qcom/tsens-v2.c   | 2 ++
 drivers/thermal/qcom/tsens.c      | 4 ++--
 drivers/thermal/qcom/tsens.h      | 4 ++++
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-8960.c b/drivers/thermal/qcom/tsens-8960.c
index ee584e5b07e5..4585904fb380 100644
--- a/drivers/thermal/qcom/tsens-8960.c
+++ b/drivers/thermal/qcom/tsens-8960.c
@@ -273,6 +273,8 @@ static struct tsens_features tsens_8960_feat = {
 	.adc		= 1,
 	.srot_split	= 0,
 	.max_sensors	= 11,
+	.trip_min_temp	= -40000,
+	.trip_max_temp	= 120000,
 };
 
 struct tsens_plat_data data_8960 = {
diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 6effb822bf3c..2c203ff374e6 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -543,6 +543,8 @@ static struct tsens_features tsens_v0_1_feat = {
 	.adc		= 1,
 	.srot_split	= 1,
 	.max_sensors	= 11,
+	.trip_min_temp	= -40000,
+	.trip_max_temp	= 120000,
 };
 
 static const struct reg_field tsens_v0_1_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index a4f561a6e582..1d7f8a80bd13 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -306,6 +306,8 @@ static struct tsens_features tsens_v1_feat = {
 	.adc		= 1,
 	.srot_split	= 1,
 	.max_sensors	= 11,
+	.trip_min_temp	= -40000,
+	.trip_max_temp	= 120000,
 };
 
 static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 129cdb247381..9babc69bfd22 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -35,6 +35,8 @@ static struct tsens_features tsens_v2_feat = {
 	.adc		= 0,
 	.srot_split	= 1,
 	.max_sensors	= 16,
+	.trip_min_temp	= -40000,
+	.trip_max_temp	= 120000,
 };
 
 static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 69b6f7b97e9e..b7701d5efdfc 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -572,8 +572,8 @@ static int tsens_set_trips(void *_sensor, int low, int high)
 	dev_dbg(dev, "[%u] %s: proposed thresholds: (%d:%d)\n",
 		hw_id, __func__, low, high);
 
-	cl_high = clamp_val(high, -40000, 120000);
-	cl_low  = clamp_val(low, -40000, 120000);
+	cl_high = clamp_val(high, priv->feat->trip_min_temp, priv->feat->trip_max_temp);
+	cl_low  = clamp_val(low, priv->feat->trip_min_temp, priv->feat->trip_max_temp);
 
 	high_val = tsens_mC_to_hw(s, cl_high);
 	low_val  = tsens_mC_to_hw(s, cl_low);
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 4614177944d6..747004476347 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -501,6 +501,8 @@ enum regfield_ids {
  *              with SROT only being available to secure boot firmware?
  * @has_watchdog: does this IP support watchdog functionality?
  * @max_sensors: maximum sensors supported by this version of the IP
+ * @trip_min_temp: minimum trip temperature supported by this version of the IP
+ * @trip_max_temp: maximum trip temperature supported by this version of the IP
  */
 struct tsens_features {
 	unsigned int ver_major;
@@ -510,6 +512,8 @@ struct tsens_features {
 	unsigned int srot_split:1;
 	unsigned int has_watchdog:1;
 	unsigned int max_sensors;
+	int trip_min_temp;
+	int trip_max_temp;
 };
 
 /**
-- 
2.35.1

