Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6EA2E42BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Dec 2020 16:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406812AbgL1N5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 08:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406798AbgL1N5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 08:57:18 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2671C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 05:56:37 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id e2so7381578pgi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 05:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=0WLcNu+hxTOa3b5SWnh4NOUu0iEPtxtOIks4RijNX0I=;
        b=o6w2Q9cd7GXLn/9m1R6ebQN3GTikz7mLVLbfqx7KYUqEWU9XUkXb3Wv9kxOX10gBIQ
         MJfNC/i6aPFtev4EUEaWqyKQVXHAQmP6xCtROrOfAkQ+SVsirRNLWzy9vgoZ56MZ8HqQ
         fLdL/mBBGUvqbVfSAk2ZuVUSzeqXDnW0V099l9Huphz0gik+YGYDdfDRMYwUS9Ln3Oku
         JeQGz1ULfTHVB134LsVPewtkG7RR9uEP0ioFkySD7DUyezvjXmT644uZQsTUuofYY5Aj
         IH48Rkg/zQMM1hF62dGnQnP0xGNT4D0WhZ/3UCnDgmqTuadoC5Jniqm8HbQuu7XW/K0H
         +V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0WLcNu+hxTOa3b5SWnh4NOUu0iEPtxtOIks4RijNX0I=;
        b=eiPs/2U82wmbhjKmjTl3EgZZzr7ksggdKoXCi+caGHpvZ3OsVKFLtn7fhjYewotVUp
         5qOdbPCMXlgko/+HrEsJQ0d55P0kTY6gR8qjTQg5Qte7FqrNWaGjYLKjP57U0MIG8K+V
         7wex5dxVqcnmUwHUWKCLU7+hzE1aoW+xTBmIY7KeCz+H+3ZI3ifmzLdf0qEJdosIhzXK
         /YSLCaEDN73TC45tHsxIdEbkj/rNrTXM1vshDbfThDHA9g/1tP1PEEPfWjWjioEOOaqL
         EEzgEgqqa+/TaIcI0TEpX44qboDMolkKcG8d7ftPfmWqz1vF2VwiPhFJoX6XWMlZl51D
         rayw==
X-Gm-Message-State: AOAM530KcfvJClCLKd/lCZMqT3bdH1GahlFZYFy7rcoumtFYPwId1V05
        GyYCuoexljZUgT7bClaB4rBJNc49pTRCSkTo
X-Google-Smtp-Source: ABdhPJyRt+uOaiAJvdLg5Z7L3HX4UFThnsjLM74iZ4WkjFW2UuO+xSYzvnrZZZUvnh/txWIpC2G0Ug==
X-Received: by 2002:aa7:843a:0:b029:19d:b279:73c9 with SMTP id q26-20020aa7843a0000b029019db27973c9mr22277846pfn.3.1609163797492;
        Mon, 28 Dec 2020 05:56:37 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 197sm39461234pgg.43.2020.12.28.05.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 05:56:36 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] soc: qcom: geni: shield ICC calls for ACPI boot
Date:   Mon, 28 Dec 2020 21:56:25 +0800
Message-Id: <20201228135625.4971-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
if interconnect support is enabled.  That's because interconnect driver
only supports DT right now.  As interconnect is not necessarily required
for basic function of GENI devices, let's shield those ICC calls to get
GENI devices probe for ACPI boot.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f42954e2c98e..9feb1d78a5df 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 	int i, err;
 	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
 		if (!icc_names[i])
 			continue;
@@ -785,6 +788,9 @@ int geni_icc_set_bw(struct geni_se *se)
 {
 	int i, ret;
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
 		ret = icc_set_bw(se->icc_paths[i].path,
 			se->icc_paths[i].avg_bw, se->icc_paths[i].avg_bw);
@@ -803,6 +809,9 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag)
 {
 	int i;
 
+	if (has_acpi_companion(se->dev))
+		return;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++)
 		icc_set_tag(se->icc_paths[i].path, tag);
 }
@@ -813,6 +822,9 @@ int geni_icc_enable(struct geni_se *se)
 {
 	int i, ret;
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
 		ret = icc_enable(se->icc_paths[i].path);
 		if (ret) {
@@ -830,6 +842,9 @@ int geni_icc_disable(struct geni_se *se)
 {
 	int i, ret;
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
 		ret = icc_disable(se->icc_paths[i].path);
 		if (ret) {
-- 
2.17.1

