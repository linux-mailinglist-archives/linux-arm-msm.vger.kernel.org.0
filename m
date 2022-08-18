Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D6B598FE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345563AbiHRWCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbiHRWCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:02:55 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA8CD11FD;
        Thu, 18 Aug 2022 15:02:53 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k26so5669652ejx.5;
        Thu, 18 Aug 2022 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=e0oArCFti+c9Ju8n5D2Og2mM4ImeBw8RC17bD4GTrEg=;
        b=bqoFL8qaX5NBlZruH2qYbQAE+95PMlEi5j8e8wTxM0oIVUyF1lVoy2IXfquYZgaWML
         KE0QSrWzyQPdj/9wag5K6prG62rMzUa+JHty/3HVDB3icbc5fdqc6Ssbx3zmjQxZV54z
         EKA87ZmK/C5PhtiJCt2losV8wpxyRQyHCYhyNUrzAv8p6rtoGhktzhUSEMpQyeDjV9z/
         EIo/OZWzquoq7C3PrpEEoDF53fg4V4ZPGoX0eLyBUhpk4F7EeKzLbMpXQd87EPgYVeii
         Ey/98pb1R6DAiWbYDYYIw/ecpY1TyvzZbWrbhlftVj+taNqp7gUd3+egetEgRqIciYQf
         KEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=e0oArCFti+c9Ju8n5D2Og2mM4ImeBw8RC17bD4GTrEg=;
        b=YZDopFmG8YpTT2Tekk57AqW2eSN7fmcNGItwG3f77Qe2vvO91VT9QaIvfP4Nk+toWu
         +p8MiTk6HdNqRW0lHnFKctVWvCFpZWl3zviSrwffTcHolNTdB5NGTjKmVTv/EWd621Gd
         uUim1gCNo3AfMYO0Hq6uRqrVJg8VhX2/fRte6vZzFjAhNBYInxrSy/hrtWT1ns2jrcSW
         yyYFmexRthdvNHtzWQyOcF6hb5UmPRvzcToOUbmyI3CEABVJiBPWGS50gJGaFyZ6Ky/G
         xUU3qGZgFockFgCnPM/IPXv1NzmvgvEKmQEVG8FDzrcxxNgmCoIQxrQlzXcyoFC9dTx+
         nNRw==
X-Gm-Message-State: ACgBeo04wgGTRkd0bgMaoUclUVMJEeauo3ewLXNb02U6Ih3OJf5zQ1/5
        ocE8u9paOb0keesws+TziSk=
X-Google-Smtp-Source: AA6agR7QAImoNfo+N8GLBQhv06w6GRPe1v8RvP4h47bM0i7iWgr5Nwvm6FCUgs7q4k4vjd64S8rkSg==
X-Received: by 2002:a17:906:b2d4:b0:731:4594:8ba1 with SMTP id cf20-20020a170906b2d400b0073145948ba1mr3080507ejb.288.1660860171868;
        Thu, 18 Aug 2022 15:02:51 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-74.zg.cable.xnet.hr. [94.253.165.74])
        by smtp.googlemail.com with ESMTPSA id l7-20020a170906230700b0072fa1571c99sm1379297eja.137.2022.08.18.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 15:02:51 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     amitk@kernel.org, thara.gopinath@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH v7 3/5] drivers: thermal: tsens: allow configuring min and max trips
Date:   Fri, 19 Aug 2022 00:02:43 +0200
Message-Id: <20220818220245.338396-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818220245.338396-1-robimarko@gmail.com>
References: <20220818220245.338396-1-robimarko@gmail.com>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
index 816769af8813..6dc8feb5c142 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -573,8 +573,8 @@ static int tsens_set_trips(struct thermal_zone_device *tz, int low, int high)
 	dev_dbg(dev, "[%u] %s: proposed thresholds: (%d:%d)\n",
 		hw_id, __func__, low, high);
 
-	cl_high = clamp_val(high, -40000, 120000);
-	cl_low  = clamp_val(low, -40000, 120000);
+	cl_high = clamp_val(high, priv->feat->trip_min_temp, priv->feat->trip_max_temp);
+	cl_low  = clamp_val(low, priv->feat->trip_min_temp, priv->feat->trip_max_temp);
 
 	high_val = tsens_mC_to_hw(s, cl_high);
 	low_val  = tsens_mC_to_hw(s, cl_low);
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 1678c5e9e60b..8dc21ca0f2a3 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -499,6 +499,8 @@ enum regfield_ids {
  *              with SROT only being available to secure boot firmware?
  * @has_watchdog: does this IP support watchdog functionality?
  * @max_sensors: maximum sensors supported by this version of the IP
+ * @trip_min_temp: minimum trip temperature supported by this version of the IP
+ * @trip_max_temp: maximum trip temperature supported by this version of the IP
  */
 struct tsens_features {
 	unsigned int ver_major;
@@ -508,6 +510,8 @@ struct tsens_features {
 	unsigned int srot_split:1;
 	unsigned int has_watchdog:1;
 	unsigned int max_sensors;
+	int trip_min_temp;
+	int trip_max_temp;
 };
 
 /**
-- 
2.37.2

