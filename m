Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799C720D95B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732797AbgF2Tqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388109AbgF2Tqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:46:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3DBC061755;
        Mon, 29 Jun 2020 12:46:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so19610509ljv.5;
        Mon, 29 Jun 2020 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SQrH6OLRIdCV3u3TyexljDPzLXrQVLpJKvgZnIkG2I=;
        b=TPiSvFkt5xeFRoD4jV5BSfmCJLioRZm4cmEdxFI6njLQbVzDrVig6fViStyGvz66Zn
         SRrGJ8xANuTdnjPccP3mNJp8gal/qrmE9mzodm4tR6RuE2xiVqVvtIYd7yi78n+z4yVx
         uzAAb7iXG3knfwBLem39r/c85al/Io52C1Yqee+X9yBa5YOaHMoSffMqFSqhyrcvX1kO
         U1JrvWcppxo0clHBpkSYKdDc5ViM+3LCenG9x2CIwUjF30I3dWKx4ZKv1u50oGhhDbpq
         nVt/psQOI9jsElpPmS/xoseOaGAUO9QSXc6nTPR0OZs4vIFYiv7fKpeFTYMT1iNn+nJ0
         IwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SQrH6OLRIdCV3u3TyexljDPzLXrQVLpJKvgZnIkG2I=;
        b=BGvLAfUC1nW5JkMo2mggDgxWWe79Rlsf09L2ZoBdETaaClNxEXm9u3JkL7ImKh3dDt
         R+h5xu8CSJ3zHWag7B8IAsy+YQJUZDFRxZl0kIhLf+xezosT17vo9UBiurMkCGQmkqJF
         RiyYa8kZiYOakprhsP6Uzzv+N5hkK4Be+wolAKRbzsb0xuubAnYuqqtwoaYZazCIeXOI
         mevl/Xto/jWrzavP5cCdqeKDB2fDB5gvi7fCcs347vxKARwPjcexwI/hgfIrZDnyrQwi
         VkmFgkUSP+qCsdPa+oE77E/2K2k0kNZ32cD6ca9knEt1FFxVWPoERNQPtqoiK3Fc9XJe
         k75g==
X-Gm-Message-State: AOAM531OSN3iNYkdAO/wyMa4JBA6glwKaGM8QRz7Dn5WUjoNk3cjy5Cr
        DpRFqdkbb1xnTFmDTNAAChQ=
X-Google-Smtp-Source: ABdhPJzlWbnH4NSBzQDgB9bNAkZOHiN0uxEO0aXOOgf52q7yAs7Tis6PI5ZVN84mzIWIjBC/SlD4Aw==
X-Received: by 2002:a2e:547:: with SMTP id 68mr8045494ljf.115.1593460006259;
        Mon, 29 Jun 2020 12:46:46 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id q128sm154750ljb.140.2020.06.29.12.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:46:45 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/2] regulator: qcom_spmi: Constify struct regulator_ops
Date:   Mon, 29 Jun 2020 21:46:32 +0200
Message-Id: <20200629194632.8147-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
References: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are never modified, so make them const to allow the compiler to
put them in read-only memory.

Before:
   text    data     bss     dec     hex filename
  20362    2592     152   23106    5a42 drivers/regulator/qcom_spmi-regulator.o

After:
   text    data     bss     dec     hex filename
  21814    1140     152   23106    5a42 drivers/regulator/qcom_spmi-regulator.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 95737e4dd6bb..5ee7c5305d95 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -380,7 +380,7 @@ struct spmi_regulator_mapping {
 	enum spmi_regulator_logical_type	logical_type;
 	u32					revision_min;
 	u32					revision_max;
-	struct regulator_ops			*ops;
+	const struct regulator_ops		*ops;
 	struct spmi_voltage_set_points		*set_points;
 	int					hpm_min_load;
 };
@@ -1261,7 +1261,7 @@ spmi_regulator_saw_set_voltage(struct regulator_dev *rdev, unsigned selector)
 
 static struct regulator_ops spmi_saw_ops = {};
 
-static struct regulator_ops spmi_smps_ops = {
+static const struct regulator_ops spmi_smps_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1276,7 +1276,7 @@ static struct regulator_ops spmi_smps_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
-static struct regulator_ops spmi_ldo_ops = {
+static const struct regulator_ops spmi_ldo_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1293,7 +1293,7 @@ static struct regulator_ops spmi_ldo_ops = {
 	.set_soft_start		= spmi_regulator_common_set_soft_start,
 };
 
-static struct regulator_ops spmi_ln_ldo_ops = {
+static const struct regulator_ops spmi_ln_ldo_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1305,7 +1305,7 @@ static struct regulator_ops spmi_ln_ldo_ops = {
 	.get_bypass		= spmi_regulator_common_get_bypass,
 };
 
-static struct regulator_ops spmi_vs_ops = {
+static const struct regulator_ops spmi_vs_ops = {
 	.enable			= spmi_regulator_vs_enable,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1316,7 +1316,7 @@ static struct regulator_ops spmi_vs_ops = {
 	.get_mode		= spmi_regulator_common_get_mode,
 };
 
-static struct regulator_ops spmi_boost_ops = {
+static const struct regulator_ops spmi_boost_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1327,7 +1327,7 @@ static struct regulator_ops spmi_boost_ops = {
 	.set_input_current_limit = spmi_regulator_set_ilim,
 };
 
-static struct regulator_ops spmi_ftsmps_ops = {
+static const struct regulator_ops spmi_ftsmps_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1342,7 +1342,7 @@ static struct regulator_ops spmi_ftsmps_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
-static struct regulator_ops spmi_ult_lo_smps_ops = {
+static const struct regulator_ops spmi_ult_lo_smps_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1356,7 +1356,7 @@ static struct regulator_ops spmi_ult_lo_smps_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
-static struct regulator_ops spmi_ult_ho_smps_ops = {
+static const struct regulator_ops spmi_ult_ho_smps_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1371,7 +1371,7 @@ static struct regulator_ops spmi_ult_ho_smps_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
-static struct regulator_ops spmi_ult_ldo_ops = {
+static const struct regulator_ops spmi_ult_ldo_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1388,7 +1388,7 @@ static struct regulator_ops spmi_ult_ldo_ops = {
 	.set_soft_start		= spmi_regulator_common_set_soft_start,
 };
 
-static struct regulator_ops spmi_ftsmps426_ops = {
+static const struct regulator_ops spmi_ftsmps426_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -1403,7 +1403,7 @@ static struct regulator_ops spmi_ftsmps426_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
-static struct regulator_ops spmi_hfs430_ops = {
+static const struct regulator_ops spmi_hfs430_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
-- 
2.27.0

