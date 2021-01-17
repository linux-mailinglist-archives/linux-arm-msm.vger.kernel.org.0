Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326FF2F9584
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 22:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbhAQV3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 16:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729744AbhAQV3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 16:29:35 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBFBC061573;
        Sun, 17 Jan 2021 13:28:55 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id m13so16164966ljo.11;
        Sun, 17 Jan 2021 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1wUaf9lrdnf3y/o85VysxjiWKzQk/1dFwHGTwfk7M+s=;
        b=tX0M5CaMFaJxBYIeOdNfJd8R9RawSr/4pdBNMoHNKL6TVUxcY+FxU+lXEUfsZFbrl2
         VmunUJsvt6KZhYd2XlO4eAXBsGFh9Sp3aYTlEKpcqdnE7jbBY/grtHkvIE+lD9KLx5X0
         VN+wZlG56K3cTRq2Gkyq3Pa8YhcP5vdfbnZBSHJ2L1/ZmBn9jxzj+UduZyO6GgYzqhqj
         6qX3Slj7DWr9SFBhQfsXyHHEllm2hwQKCckAMTBKkSbpjFQ+i3tC7esfnGy/ylzdL7Br
         5JJrucvbDKBswMxR1mSjMfesOpWv4xq1T7Tpvd7wTfPcBD7mxYjsANdQcHVmKtpIp3lV
         QRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wUaf9lrdnf3y/o85VysxjiWKzQk/1dFwHGTwfk7M+s=;
        b=NTQzkSKz88b1g0NZkjywiAsdKWhqlDDBc4tIV5g/iKGsNzVEAnnnzS9BguFeaptPFI
         HMMba9Ghf9rXeD0+ZhpKQDICMwOKn9Q0uETC5I6CcKG3vDKTUDtW+dka53NTBZNhLqWU
         remNhxOS40MF7rK5pe1lIynvkC/FmBpF/9TTxJJtxa1oSud1FEkM9mXdh3MaFMPvQUmh
         oGND+H76pekKpbW2GNdnYunit71AKPj9PQ7+FNf20TDGuiVHq7DSbhld9zuGMmewLhX3
         Zdlw0EhTcizrUYyIDDgi7IIP/3nIhCMbBTlcf8cpQuoZo9gTJnOaEDSAd52Gcb0zrgXL
         fL8A==
X-Gm-Message-State: AOAM533fpjoBFDdSyPWcj0TEuR5JmcEvIJj+7AJJHaPn/36uDrqH+Gbg
        QC4Xpyri39pI5hPgMQbDcuGjSaUdI+IUuA==
X-Google-Smtp-Source: ABdhPJzGfExcyEzBTqT2c1yhn2GYKZeDXriQpNhaE68D/XaNMVMP3oOM31h06oE1yCn4oOGwXB7rVg==
X-Received: by 2002:a05:651c:491:: with SMTP id s17mr9015050ljc.300.1610918933681;
        Sun, 17 Jan 2021 13:28:53 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id s19sm1678858lfc.41.2021.01.17.13.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 13:28:53 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 3/4] perf: hisi: Constify static struct attribute_group
Date:   Sun, 17 Jan 2021 22:28:46 +0100
Message-Id: <20210117212847.21319-4-rikard.falkeborn@gmail.com>
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
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 2 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 2 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 5ac6c9113767..ac1a8c120a00 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -319,7 +319,7 @@ static struct attribute *hisi_ddrc_pmu_identifier_attrs[] = {
 	NULL
 };
 
-static struct attribute_group hisi_ddrc_pmu_identifier_group = {
+static const struct attribute_group hisi_ddrc_pmu_identifier_group = {
 	.attrs = hisi_ddrc_pmu_identifier_attrs,
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 41b2dceb5f26..3402f1a395a8 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -331,7 +331,7 @@ static struct attribute *hisi_hha_pmu_identifier_attrs[] = {
 	NULL
 };
 
-static struct attribute_group hisi_hha_pmu_identifier_group = {
+static const struct attribute_group hisi_hha_pmu_identifier_group = {
 	.attrs = hisi_hha_pmu_identifier_attrs,
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 705501d18d03..7d792435c2aa 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -321,7 +321,7 @@ static struct attribute *hisi_l3c_pmu_identifier_attrs[] = {
 	NULL
 };
 
-static struct attribute_group hisi_l3c_pmu_identifier_group = {
+static const struct attribute_group hisi_l3c_pmu_identifier_group = {
 	.attrs = hisi_l3c_pmu_identifier_attrs,
 };
 
-- 
2.30.0

