Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1DB2F9585
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 22:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbhAQV3y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 16:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730243AbhAQV3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 16:29:36 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C55C0613C1;
        Sun, 17 Jan 2021 13:28:56 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o17so21234542lfg.4;
        Sun, 17 Jan 2021 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h6Tqi57B6RKHeZ0yWkHDNRYTp7U/zAAwGfhZbemk/DI=;
        b=HS1x5paSr5K+/dQlSjCDkild4v2Sv9ob8aFZ/hjMJqgUNnQJso5WedHR+RseaV44mi
         QbLOIW7jLei2KjOcAN6C1hYft0GsmrtigDzywXTePeFEjnpjDJk7VEafIpq3ygOlH4lz
         gLzJy1jxHf0X2AUC8rDzyTpPSfwkclsAOnjKxfdkmJ1o8LP0iPl/JTUOd79P8vBbZfoV
         95ABuLvtPvKodB9JtRvJCFTg+Dogi+zJPrA+DoJynGYJNABKyy/ZnUC5ZWH2VNaM9iBj
         2hr+j0gPk0PDpLdF7GtR07xSldK/vdwCplrVLdm02C7+LIurF48Xx36Lki13/sr9fHAQ
         hA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6Tqi57B6RKHeZ0yWkHDNRYTp7U/zAAwGfhZbemk/DI=;
        b=SmIwGAimxIeFAtZ47EKVz+Yv4qr5Su5/4SNYkORIpwzjbrcPTQwEPm7h5MJrtQ6GAz
         vs6i/fQO386o99IprNif6ZOazsNFRNK/4pBiBbDfprQVP84att97eufLQHH8TtccM1lj
         vYmybTIJGaK7xYql6KJF00Exa4ESDXK+njPMzsx2ucg/AKKx8De1kcXzHvmU/4cu2+sI
         NSonYA7H7M5QBTTTG67fjLCEX7CJARJKS7QJ9uvwDpzuCyf9RZH20oAl1c0mpdGb4RBn
         APx90pJadjGgFpkcxkSZ8wxq668fM1OlO0i8O+f3Zs/NuzmFDs9xxaoZgoVDEx2JpIFt
         vq3w==
X-Gm-Message-State: AOAM530jzkYuAIKgU2DpNTx6+8VEWbO+6PDllVhwN11BtqcbBn2mrDR+
        XV2U5ShH6EYjRgchn9Z1OuQ=
X-Google-Smtp-Source: ABdhPJw49HItQhOm8x60XeJ/atvSx2qDxh85kxU2yV8mCQsKvCMxJMq8uFF8X78TVOHEG8t9ODBYxg==
X-Received: by 2002:a19:4841:: with SMTP id v62mr9236467lfa.607.1610918934685;
        Sun, 17 Jan 2021 13:28:54 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id s19sm1678858lfc.41.2021.01.17.13.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 13:28:54 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc:     Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 4/4] perf: Constify static struct attribute_group
Date:   Sun, 17 Jan 2021 22:28:47 +0100
Message-Id: <20210117212847.21319-5-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
References: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage is to put their addresses in an array of pointers to
const struct attribute group. Make them const to allow the compiler
to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/perf/arm-cci.c        | 2 +-
 drivers/perf/arm-cmn.c        | 2 +-
 drivers/perf/arm_dmc620_pmu.c | 4 ++--
 drivers/perf/arm_pmu.c        | 2 +-
 drivers/perf/arm_smmuv3_pmu.c | 8 ++++----
 drivers/perf/arm_spe_pmu.c    | 6 +++---
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 87c4be9dd412..a75cf77c4de4 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1376,7 +1376,7 @@ static struct attribute *pmu_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group pmu_attr_group = {
+static const struct attribute_group pmu_attr_group = {
 	.attrs = pmu_attrs,
 };
 
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index a76ff594f3ca..f30fcd330899 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -616,7 +616,7 @@ static struct attribute *arm_cmn_cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group arm_cmn_cpumask_attr_group = {
+static const struct attribute_group arm_cmn_cpumask_attr_group = {
 	.attrs = arm_cmn_cpumask_attrs,
 };
 
diff --git a/drivers/perf/arm_dmc620_pmu.c b/drivers/perf/arm_dmc620_pmu.c
index 004930eb4bbb..27f54c0afc3b 100644
--- a/drivers/perf/arm_dmc620_pmu.c
+++ b/drivers/perf/arm_dmc620_pmu.c
@@ -159,7 +159,7 @@ static struct attribute *dmc620_pmu_events_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group dmc620_pmu_events_attr_group = {
+static const struct attribute_group dmc620_pmu_events_attr_group = {
 	.name = "events",
 	.attrs = dmc620_pmu_events_attrs,
 };
@@ -222,7 +222,7 @@ static struct attribute *dmc620_pmu_formats_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group dmc620_pmu_format_attr_group = {
+static const struct attribute_group dmc620_pmu_format_attr_group = {
 	.name	= "format",
 	.attrs	= dmc620_pmu_formats_attrs,
 };
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index cb2f55f450e4..2d10d84fb79c 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -577,7 +577,7 @@ static struct attribute *armpmu_common_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group armpmu_common_attr_group = {
+static const struct attribute_group armpmu_common_attr_group = {
 	.attrs = armpmu_common_attrs,
 };
 
diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 74474bb322c3..8ff7a67f691c 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -493,7 +493,7 @@ static struct attribute *smmu_pmu_cpumask_attrs[] = {
 	NULL
 };
 
-static struct attribute_group smmu_pmu_cpumask_group = {
+static const struct attribute_group smmu_pmu_cpumask_group = {
 	.attrs = smmu_pmu_cpumask_attrs,
 };
 
@@ -548,7 +548,7 @@ static umode_t smmu_pmu_event_is_visible(struct kobject *kobj,
 	return 0;
 }
 
-static struct attribute_group smmu_pmu_events_group = {
+static const struct attribute_group smmu_pmu_events_group = {
 	.name = "events",
 	.attrs = smmu_pmu_events,
 	.is_visible = smmu_pmu_event_is_visible,
@@ -583,7 +583,7 @@ static struct attribute *smmu_pmu_identifier_attrs[] = {
 	NULL
 };
 
-static struct attribute_group smmu_pmu_identifier_group = {
+static const struct attribute_group smmu_pmu_identifier_group = {
 	.attrs = smmu_pmu_identifier_attrs,
 	.is_visible = smmu_pmu_identifier_attr_visible,
 };
@@ -602,7 +602,7 @@ static struct attribute *smmu_pmu_formats[] = {
 	NULL
 };
 
-static struct attribute_group smmu_pmu_format_group = {
+static const struct attribute_group smmu_pmu_format_group = {
 	.name = "format",
 	.attrs = smmu_pmu_formats,
 };
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index cc00915ad6d1..7593caf12555 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -146,7 +146,7 @@ static struct attribute *arm_spe_pmu_cap_attr[] = {
 	NULL,
 };
 
-static struct attribute_group arm_spe_pmu_cap_group = {
+static const struct attribute_group arm_spe_pmu_cap_group = {
 	.name	= "caps",
 	.attrs	= arm_spe_pmu_cap_attr,
 };
@@ -227,7 +227,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	NULL,
 };
 
-static struct attribute_group arm_spe_pmu_format_group = {
+static const struct attribute_group arm_spe_pmu_format_group = {
 	.name	= "format",
 	.attrs	= arm_spe_pmu_formats_attr,
 };
@@ -247,7 +247,7 @@ static struct attribute *arm_spe_pmu_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group arm_spe_pmu_group = {
+static const struct attribute_group arm_spe_pmu_group = {
 	.attrs	= arm_spe_pmu_attrs,
 };
 
-- 
2.30.0

