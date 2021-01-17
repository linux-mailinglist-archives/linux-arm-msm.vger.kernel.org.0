Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F962F958B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 22:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbhAQVaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 16:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbhAQV3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 16:29:33 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE7EC061575;
        Sun, 17 Jan 2021 13:28:53 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u21so16247407lja.0;
        Sun, 17 Jan 2021 13:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pGnYP5b1bDIsYHya/pAq0V9WLLrl1QJY4UrDAmDKPYg=;
        b=nx0SYB/NbD9w9zFZz3U1CvgF3CDr1YdMqMlKZwWnsNpILFdt3vJxJaG1r0q4ezBiTD
         frNFmGge87M8DY87lZTm8VudMB22VrCoMExUgem4OZAg/4SRrtZBN0VyoSNe+8eZrpxb
         ROhUvtuAGnPUO5isMD8LJQ/2sNP6MtMpgrmU2IaTFr3T1tYQAQKw8dBvHb6b3iQkFVR/
         rqEYyPChZuckA7n4LqVIy3AP9J5kCtMzvT3GIRAaxrJVrs4qQCWq+36vC4fBsFeL8Eh/
         ik1JHjrcHolpqNcnvQl8o2EQMiPLTFHH3QKyOMEiCebAkL4i9PKdgLJR/s9pox3svinh
         7D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGnYP5b1bDIsYHya/pAq0V9WLLrl1QJY4UrDAmDKPYg=;
        b=gw+8iGuWGnXuiVVpw3JfObsiCcK1/Oez+THqlqoZ0Mr9DcmBilo+UFxwyUw2rlay3x
         cRBHhkGH0kJ3pxrEZbdMToJaC/2L9nLlf1TlXUwLBQvn4aLajAMIX4QoXp0rHOYYdJTa
         hnaHDS23BYmGZMCQuAVMfKNNuvrVqj9Nf0NI5VNtiBJ9oUx+u+DIZ77/yWXjeFFwyKBh
         6Eq727wAFmcs4gwQH5Ec+xfb6fh8q9tr+I5eBmEvkdOiGi7vpIf4oN/lXPnClTjuYGsL
         vNc+CQqEdvPZVEn8tL9zPcLBiSbz1qjrzQFm2mkuNYi+yJv8/3Ynkef3cMlA4DpXQP4e
         t94A==
X-Gm-Message-State: AOAM531JG4Dj60kLOPVlELH2ytrTTvPXL7/hoyTSfjCPIRCCOT9IZH3z
        zdn9D6pA4tsIlxEZPBsSuwk=
X-Google-Smtp-Source: ABdhPJyk/IlGV1zlFVOkeqim8MjcwEqd6MBGP3CyNxLvQv4Xmyzv22A20JbND8Mok2BDSpnqWWJ34g==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr9029676ljv.198.1610918931755;
        Sun, 17 Jan 2021 13:28:51 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id s19sm1678858lfc.41.2021.01.17.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 13:28:51 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/4] perf: qcom: Constify static struct attribute_group
Date:   Sun, 17 Jan 2021 22:28:44 +0100
Message-Id: <20210117212847.21319-2-rikard.falkeborn@gmail.com>
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
 drivers/perf/qcom_l2_pmu.c | 6 +++---
 drivers/perf/qcom_l3_pmu.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 23a0e008dafa..8883af955a2a 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -649,7 +649,7 @@ static struct attribute *l2_cache_pmu_cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group l2_cache_pmu_cpumask_group = {
+static const struct attribute_group l2_cache_pmu_cpumask_group = {
 	.attrs = l2_cache_pmu_cpumask_attrs,
 };
 
@@ -665,7 +665,7 @@ static struct attribute *l2_cache_pmu_formats[] = {
 	NULL,
 };
 
-static struct attribute_group l2_cache_pmu_format_group = {
+static const struct attribute_group l2_cache_pmu_format_group = {
 	.name = "format",
 	.attrs = l2_cache_pmu_formats,
 };
@@ -700,7 +700,7 @@ static struct attribute *l2_cache_pmu_events[] = {
 	NULL
 };
 
-static struct attribute_group l2_cache_pmu_events_group = {
+static const struct attribute_group l2_cache_pmu_events_group = {
 	.name = "events",
 	.attrs = l2_cache_pmu_events,
 };
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 9ddb577c542b..fb34b87b9471 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -630,7 +630,7 @@ static struct attribute *qcom_l3_cache_pmu_formats[] = {
 	NULL,
 };
 
-static struct attribute_group qcom_l3_cache_pmu_format_group = {
+static const struct attribute_group qcom_l3_cache_pmu_format_group = {
 	.name = "format",
 	.attrs = qcom_l3_cache_pmu_formats,
 };
@@ -663,7 +663,7 @@ static struct attribute *qcom_l3_cache_pmu_events[] = {
 	NULL
 };
 
-static struct attribute_group qcom_l3_cache_pmu_events_group = {
+static const struct attribute_group qcom_l3_cache_pmu_events_group = {
 	.name = "events",
 	.attrs = qcom_l3_cache_pmu_events,
 };
@@ -685,7 +685,7 @@ static struct attribute *qcom_l3_cache_pmu_cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group qcom_l3_cache_pmu_cpumask_attr_group = {
+static const struct attribute_group qcom_l3_cache_pmu_cpumask_attr_group = {
 	.attrs = qcom_l3_cache_pmu_cpumask_attrs,
 };
 
-- 
2.30.0

