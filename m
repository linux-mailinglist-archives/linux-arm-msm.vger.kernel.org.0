Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AE62F9589
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 22:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbhAQVay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 16:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730236AbhAQV3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 16:29:34 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8FEC061757;
        Sun, 17 Jan 2021 13:28:54 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o17so21234476lfg.4;
        Sun, 17 Jan 2021 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ljz4BUV9MpBVMsBYNiPFW/cj+siA+YfamJ4GwS7oSFE=;
        b=HNjRteTmpz5BC7QY1vC4w4qSAZrS38U4dVo5qMshU1PCdGaRfHlPTiOT0RoHeYstDO
         A4Az1VvxkOyQjO0iA6/GYXPNf+YbytZJ57TqK9Wiv8cQYjRjR2uGBHGPVAF4i9u0DxNJ
         8rotkKUpLQV+Xuu2n4UoObMRu+6mFvy+5vBePMHZDsICR+Q1F6Blu/xkP8OWWoFMTiyw
         XrJB4CbWvjFIyi/CoxZ0q46/FGr3zTbhMIkr29bIybD/lGDnIXeE8INGdsB7OaaNEldi
         auSRw9lhAcBz4/PGpwYweyg1M9cYylBqfszo6WIvEbhofcnpvlQSymFjfj3u/K0oO9k1
         vYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ljz4BUV9MpBVMsBYNiPFW/cj+siA+YfamJ4GwS7oSFE=;
        b=ACehOH4rQOrzfzBfTADJ3E26+o5h81rJfpkNDVaZlqJUyOQuHBgMyCdLEDdHVaMLXE
         BJTsxmXrKMI2C3WGXXnO8Qkrv0HGzU9aboytknZJ3hUREFUojrsL9nfu85eYzpFIJsae
         0pRHPJjgAgM750WQPoCee85m8HQc74zlXKzOd/UhkD062J8PJWpzS5+YrImRqP4DXFVu
         QVtJqIwRxU59BVZitdiYTPizuseGyW2uJHopXHbRyOW8h1xZoFwMuf1wwJY4yjWuEAek
         uZXAqED2dCI46JFy3qNc3/hmNXQbUWXq94e9DP2UyJWepjAUVXAI4cM2p01JSPGiAGBb
         nrpw==
X-Gm-Message-State: AOAM531WBpb6i0NN77cSHuKTLsPSPD6FcjTrefl1+xSy1ylIr1jyMdhR
        qvg5TpmeAH2OAxYQFt6MARs=
X-Google-Smtp-Source: ABdhPJwEoloNtvy0ID9gRrHbfLZEscWOeO28Gijfq4kL+9DJPFKPsMrBpaKReeN9OTQ/u5VY5CQNDQ==
X-Received: by 2002:a05:6512:312b:: with SMTP id p11mr9944645lfd.446.1610918932717;
        Sun, 17 Jan 2021 13:28:52 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id s19sm1678858lfc.41.2021.01.17.13.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 13:28:52 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/4] perf/imx_ddr: Constify static struct attribute_group
Date:   Sun, 17 Jan 2021 22:28:45 +0100
Message-Id: <20210117212847.21319-3-rikard.falkeborn@gmail.com>
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
 drivers/perf/fsl_imx8_ddr_perf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index a11bfd8a0823..be1f26b62ddb 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -133,7 +133,7 @@ static struct attribute *ddr_perf_identifier_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group ddr_perf_identifier_attr_group = {
+static const struct attribute_group ddr_perf_identifier_attr_group = {
 	.attrs = ddr_perf_identifier_attrs,
 	.is_visible = ddr_perf_identifier_attr_visible,
 };
@@ -188,7 +188,7 @@ static struct attribute *ddr_perf_filter_cap_attr[] = {
 	NULL,
 };
 
-static struct attribute_group ddr_perf_filter_cap_attr_group = {
+static const struct attribute_group ddr_perf_filter_cap_attr_group = {
 	.name = "caps",
 	.attrs = ddr_perf_filter_cap_attr,
 };
@@ -209,7 +209,7 @@ static struct attribute *ddr_perf_cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group ddr_perf_cpumask_attr_group = {
+static const struct attribute_group ddr_perf_cpumask_attr_group = {
 	.attrs = ddr_perf_cpumask_attrs,
 };
 
@@ -265,7 +265,7 @@ static struct attribute *ddr_perf_events_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group ddr_perf_events_attr_group = {
+static const struct attribute_group ddr_perf_events_attr_group = {
 	.name = "events",
 	.attrs = ddr_perf_events_attrs,
 };
@@ -281,7 +281,7 @@ static struct attribute *ddr_perf_format_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group ddr_perf_format_attr_group = {
+static const struct attribute_group ddr_perf_format_attr_group = {
 	.name = "format",
 	.attrs = ddr_perf_format_attrs,
 };
-- 
2.30.0

