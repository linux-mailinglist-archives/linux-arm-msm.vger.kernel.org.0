Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1AC12E76F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 15:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgABOyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 09:54:45 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39250 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbgABOyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 09:54:45 -0500
Received: by mail-pj1-f66.google.com with SMTP id t101so3437955pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oi1EZVs7PMYW3ENjMtAVgWjqAjOWibzgib65seKOwXo=;
        b=tFow0Sn7YTiwe2D73xLlEkZ9oIpD8IHksnf4/mF5jN7q6oUqO9/ojjPtotq0cKziKp
         9bwYhbpm/VP7wxPBXWnjanl2/rb2g+wMSoECmUBGonNtDV6KCOo5b2R561AzhFieCE3q
         CJ0kIELidP5ZwgRPZmfscrCXZyurPxioCB2G8C9kJtCquIiJgt+PqJkKEe19IRMuiOoJ
         9sLJvowmoasu4f80Ghf+zhqjORwJVCQgOaj+HnjRfDlBzz5mCwIwyt9BDY81n5nbsVXI
         tlgwdGCGVMKtiU81UzyknIMR3HTgYus+XuSX4JX9ovKDdN/kJxGgR0HQ0pKICt+b5TH2
         gnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oi1EZVs7PMYW3ENjMtAVgWjqAjOWibzgib65seKOwXo=;
        b=O/FVNIqT5QPJiiUbiYcqNksmIGOCM94BwbM57dF83dws6GExnpxMr2l22sNZRXO6/l
         w1H1TyxIBfxhGjmULjNLamgcaJ+zoQ/JawxK6zaiZpvlkzrAzUPxdQwlcKc/UQg+qe6P
         ph3CF5cTYlnoDQ1SiaZa6Jwws2dNZ+hRpEPUI9Gl8h1bITZAM2CBr89bUJBzSb+hzWYC
         ef1PkFf9WAGzfjXjmLYx2PPT3oHGRsIb3EF3mkpd8e3hNdrwn10Pwhxr3F81VJ/tfDOC
         0RR6+U/onxJq2WVJ4mNnnmCQBRd2Ydesd39Utx6dbLbDOg/mzqZrnxLmeza5dFQRzKKA
         qmOQ==
X-Gm-Message-State: APjAAAWUU/iHYBboigxezPhjSRnKZEFWdvgLiHWoTilJsqQT5Dcwc94B
        g+bV6KmwTDRAsxOpXwazFMxBSg==
X-Google-Smtp-Source: APXvYqy8ZGu+KM0WH5cNzQStEA9QGuI2scj5BCjLtHSS6FnxWlE27OWukvSdYX4iGOT/Vd5TZxuv0Q==
X-Received: by 2002:a17:90a:2486:: with SMTP id i6mr21090473pje.9.1577976884202;
        Thu, 02 Jan 2020 06:54:44 -0800 (PST)
Received: from localhost ([103.195.202.148])
        by smtp.gmail.com with ESMTPSA id c22sm41824155pfo.50.2020.01.02.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 06:54:43 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v3 1/9] drivers: thermal: tsens: De-constify struct tsens_features
Date:   Thu,  2 Jan 2020 20:24:26 +0530
Message-Id: <77dd80eb58f0db29a03097cb442d606f810a849a.1577976221.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577976221.git.amit.kucheria@linaro.org>
References: <cover.1577976221.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

struct tsens_features is currently initialized as part of platform data
at compile-time and not modifiable. We now have some usecases in feature
detection across IP versions where it is more flexible to update the
features after probing registers.

Remove const qualifier from tsens_features and the encapsulating
tsens_plat_data.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens-8960.c |  2 +-
 drivers/thermal/qcom/tsens-v0_1.c |  6 +++---
 drivers/thermal/qcom/tsens-v1.c   |  6 +++---
 drivers/thermal/qcom/tsens-v2.c   |  6 +++---
 drivers/thermal/qcom/tsens.h      | 12 ++++++------
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-8960.c b/drivers/thermal/qcom/tsens-8960.c
index fb77acb8d13b..a383a57cfbbc 100644
--- a/drivers/thermal/qcom/tsens-8960.c
+++ b/drivers/thermal/qcom/tsens-8960.c
@@ -279,7 +279,7 @@ static const struct tsens_ops ops_8960 = {
 	.resume		= resume_8960,
 };
 
-const struct tsens_plat_data data_8960 = {
+struct tsens_plat_data data_8960 = {
 	.num_sensors	= 11,
 	.ops		= &ops_8960,
 };
diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 4b8dd6de02ce..959a9371d205 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -327,7 +327,7 @@ static int calibrate_8974(struct tsens_priv *priv)
 
 /* v0.1: 8916, 8974 */
 
-static const struct tsens_features tsens_v0_1_feat = {
+static struct tsens_features tsens_v0_1_feat = {
 	.ver_major	= VER_0_1,
 	.crit_int	= 0,
 	.adc		= 1,
@@ -377,7 +377,7 @@ static const struct tsens_ops ops_8916 = {
 	.get_temp	= get_temp_common,
 };
 
-const struct tsens_plat_data data_8916 = {
+struct tsens_plat_data data_8916 = {
 	.num_sensors	= 5,
 	.ops		= &ops_8916,
 	.hw_ids		= (unsigned int []){0, 1, 2, 4, 5 },
@@ -392,7 +392,7 @@ static const struct tsens_ops ops_8974 = {
 	.get_temp	= get_temp_common,
 };
 
-const struct tsens_plat_data data_8974 = {
+struct tsens_plat_data data_8974 = {
 	.num_sensors	= 11,
 	.ops		= &ops_8974,
 	.feat		= &tsens_v0_1_feat,
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index bd2ddb684a45..b682a4df0081 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -299,7 +299,7 @@ static int calibrate_8976(struct tsens_priv *priv)
 
 /* v1.x: msm8956,8976,qcs404,405 */
 
-static const struct tsens_features tsens_v1_feat = {
+static struct tsens_features tsens_v1_feat = {
 	.ver_major	= VER_1_X,
 	.crit_int	= 0,
 	.adc		= 1,
@@ -368,7 +368,7 @@ static const struct tsens_ops ops_generic_v1 = {
 	.get_temp	= get_temp_tsens_valid,
 };
 
-const struct tsens_plat_data data_tsens_v1 = {
+struct tsens_plat_data data_tsens_v1 = {
 	.ops		= &ops_generic_v1,
 	.feat		= &tsens_v1_feat,
 	.fields	= tsens_v1_regfields,
@@ -381,7 +381,7 @@ static const struct tsens_ops ops_8976 = {
 };
 
 /* Valid for both MSM8956 and MSM8976. Sensor ID 3 is unused. */
-const struct tsens_plat_data data_8976 = {
+struct tsens_plat_data data_8976 = {
 	.num_sensors	= 11,
 	.ops		= &ops_8976,
 	.hw_ids		= (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},
diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index a4d15e1abfdd..f1c8ec62e69f 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -27,7 +27,7 @@
 
 /* v2.x: 8996, 8998, sdm845 */
 
-static const struct tsens_features tsens_v2_feat = {
+static struct tsens_features tsens_v2_feat = {
 	.ver_major	= VER_2_X,
 	.crit_int	= 1,
 	.adc		= 0,
@@ -81,14 +81,14 @@ static const struct tsens_ops ops_generic_v2 = {
 	.get_temp	= get_temp_tsens_valid,
 };
 
-const struct tsens_plat_data data_tsens_v2 = {
+struct tsens_plat_data data_tsens_v2 = {
 	.ops		= &ops_generic_v2,
 	.feat		= &tsens_v2_feat,
 	.fields	= tsens_v2_regfields,
 };
 
 /* Kept around for backward compatibility with old msm8996.dtsi */
-const struct tsens_plat_data data_8996 = {
+struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
 	.ops		= &ops_generic_v2,
 	.feat		= &tsens_v2_feat,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index e24a865fbc34..be364bf1d5a6 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -440,7 +440,7 @@ struct tsens_plat_data {
 	const u32		num_sensors;
 	const struct tsens_ops	*ops;
 	unsigned int		*hw_ids;
-	const struct tsens_features	*feat;
+	struct tsens_features	*feat;
 	const struct reg_field		*fields;
 };
 
@@ -481,7 +481,7 @@ struct tsens_priv {
 
 	struct regmap_field		*rf[MAX_REGFIELDS];
 	struct tsens_context		ctx;
-	const struct tsens_features	*feat;
+	struct tsens_features		*feat;
 	const struct reg_field		*fields;
 	const struct tsens_ops		*ops;
 
@@ -502,15 +502,15 @@ int tsens_set_trips(void *_sensor, int low, int high);
 irqreturn_t tsens_irq_thread(int irq, void *data);
 
 /* TSENS target */
-extern const struct tsens_plat_data data_8960;
+extern struct tsens_plat_data data_8960;
 
 /* TSENS v0.1 targets */
-extern const struct tsens_plat_data data_8916, data_8974;
+extern struct tsens_plat_data data_8916, data_8974;
 
 /* TSENS v1 targets */
-extern const struct tsens_plat_data data_tsens_v1, data_8976;
+extern struct tsens_plat_data data_tsens_v1, data_8976;
 
 /* TSENS v2 targets */
-extern const struct tsens_plat_data data_8996, data_tsens_v2;
+extern struct tsens_plat_data data_8996, data_tsens_v2;
 
 #endif /* __QCOM_TSENS_H__ */
-- 
2.20.1

