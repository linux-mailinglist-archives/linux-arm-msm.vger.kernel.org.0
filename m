Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984A43B54F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhF0TCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhF0TCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:02:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C93C061574;
        Sun, 27 Jun 2021 11:59:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u8so4618176wrq.8;
        Sun, 27 Jun 2021 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KnnXMNSnCQFUApM8UzwSAzj60/BQdxg5lHcpdV/aFz8=;
        b=kEg1z5gWa7pXTahuHHV5bjVvQly6SlLrWW2gyrB9+umJZPXleboR5PF8F49kn2p6qz
         PnWhrtUrMkms15RNOsrZOM3Yit5gsbqaOy7vE8L7DUGc2oQUTwFj856opxe7XtL+0grG
         pjS+9FUcJeV2Iurhz4xPSg9G2oQLeyxRo5hMnh0fIw5Cu4jJ7XHBDJIe+WBR3MkLiofd
         JnqZIGOKsDV4nD0qXGGzEer2vXZuJIoQ/4gFyYfwsUSG1J0eaNAJSi4uBxHcT2CAzEDj
         VW6gNA/2OIAamtm1RzQC0TeDT6ubCUMK7fDhEu4HhPVjHLlw6RQ4a2NbRdv5woD7YhWI
         M8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KnnXMNSnCQFUApM8UzwSAzj60/BQdxg5lHcpdV/aFz8=;
        b=m4qAJEvCdp2xZRZEDVwtcHAzJTnv9hk4kWkXu9c8EV1wffNxZzPWbPq1pkcU3hO8b/
         8QcePSHzy67oyopMLTeUQi7qp9OcR5sDMBMaKhNPrN+AyRonqcyxe6FMrmaVamtKRmZo
         MwM+xAUjjZSZbtnMMwz5axDD7AVkaWRJkmFR8JzFWJZkHbBPvoNbJZ33+TKGT3RwcYWF
         LZZ0eea1Ph7aPo3VLZxLLC8eWsO8NByUgC5JLeG5sym4RJTwt9Sa1jJxTfukGS+WBJ4A
         QJBuqwKq37oL/5/49hrSEq1Nv9d3E9tN6P8v4v3FHpERR0EQwWXWMaGbQ0N83n2ciQMy
         ljMg==
X-Gm-Message-State: AOAM530QH7FCOOunj6qJPFwRCjMec8fUcZ0/PFPHdcNvgB0+qpCGEHsW
        IebDSaO0jns081Kq8Ez80us=
X-Google-Smtp-Source: ABdhPJwnCX+kkMYiigu3NyEa2TjiBgYjLk+R4TNWEa1tjyLI+2QJezS549G5rHAMl9xz4lLgnp2iaA==
X-Received: by 2002:a05:6000:10c8:: with SMTP id b8mr22416445wrx.383.1624820380781;
        Sun, 27 Jun 2021 11:59:40 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id t9sm4629168wrq.92.2021.06.27.11.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:40 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 5/5] drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains
Date:   Sun, 27 Jun 2021 21:59:27 +0300
Message-Id: <20210627185927.695411-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185927.695411-1-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM4250/6115 have 4 rpm power domains, ported from downstream DT.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/soc/qcom/rpmpd.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 0b532a892d60..dbf494e92574 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -346,6 +346,33 @@ static const struct rpmpd_desc sdm660_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO,
 };
 
+/* sm4250/6115 RPM Power domains */
+DEFINE_RPMPD_PAIR(sm6115, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sm6115, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(sm6115, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sm6115, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(sm6115, vdd_lpi_cx, RWLC, 0);
+DEFINE_RPMPD_LEVEL(sm6115, vdd_lpi_mx, RWLM, 0);
+
+static struct rpmpd *sm6115_rpmpds[] = {
+	[SM6115_VDDCX] =		&sm6115_vddcx,
+	[SM6115_VDDCX_AO] =		&sm6115_vddcx_ao,
+	[SM6115_VDDCX_VFL] =		&sm6115_vddcx_vfl,
+	[SM6115_VDDMX] =		&sm6115_vddmx,
+	[SM6115_VDDMX_AO] =		&sm6115_vddmx_ao,
+	[SM6115_VDDMX_VFL] =		&sm6115_vddmx_vfl,
+	[SM6115_VDD_LPI_CX] =		&sm6115_vdd_lpi_cx,
+	[SM6115_VDD_LPI_MX] =		&sm6115_vdd_lpi_mx,
+};
+
+static const struct rpmpd_desc sm6115_desc = {
+	.rpmpds = sm6115_rpmpds,
+	.num_pds = ARRAY_SIZE(sm6115_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
@@ -356,6 +383,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmpd_match_table);
-- 
2.32.0

