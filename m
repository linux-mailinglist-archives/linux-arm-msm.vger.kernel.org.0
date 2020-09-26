Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581DD279934
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgIZM4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbgIZM4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58E9C0613D6;
        Sat, 26 Sep 2020 05:56:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so1927091wmh.4;
        Sat, 26 Sep 2020 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvZBg3ipUy4ABklhhKI3ATuqzWFQwwNIlmKansc3mGI=;
        b=Zkeeku3ePKNDAzqLMzR/3PGVfrVPQYKRrRKoJpGqwDT3yaFlOFUkrPae92jt35qr9Y
         7L6O6JadtMLcnju2EzookJM6/LxDgtMvu2M08dSd2TAMljN1Pu0R+038eMJbXkI35kkt
         5Ycv7xIXIjTvHS59uwXW0ifdmLXE8Iy5dMdNzszjIM8aO/F1T+3MDbPKq5s07MvcbZTD
         NHKEFSBLMDpXlsKZrBuUJq3EyJMdt9VU0EdAuGb1mJ+HIDTa0tZyGVSDwgYzbj3+Aaw+
         w/Xcm4IcO4tX3+J+WEkqcoTbZ6P98gdhsvqP5lAZboIczJB75RMjBOvjMnGuq8/kfoYL
         WKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvZBg3ipUy4ABklhhKI3ATuqzWFQwwNIlmKansc3mGI=;
        b=WX2AqWkC7Kyy8c+gg0ayyQCOVDi7C7AzTcfhWcLPu8lv64EDtliW4su28eSmvQWRdA
         o8wS0j0BgrtnxowgIhIdRAvs8MIQehYzfA8PcNtQhH6881rFalVxzhjdKAkuoQx94s1s
         XM91vybKqIeV7m3GHdNBFBielZ2CfWuy+7qVF7HGKhPIXMUtV4nYTy5Tv/NIkcDNSu8N
         IWs+Cu68CyQG++eDbatXIdB7MzQCqULrrPYaeCcPZG9EXEteqLw+4c0qHaS9LvfX1E/q
         eM5qbd9LuRQHaM8uzLbVJweLVOC8DZ6TJslBNxfJ/CRbi6psJEiEV11W5ZPHkCJlCvoF
         x1sQ==
X-Gm-Message-State: AOAM531++YbAE6ETHSqD/xoC3hTR6QfGCxQ7QaJ3dOijxO16Zjx2PNqd
        jH9TfLdcehXvgbC0SjjZcLDWS0ROWLbwdw==
X-Google-Smtp-Source: ABdhPJwZmyYBNOP5HKNHUFKKeoHuZurbaCxaNyjQsUz42JF3qAOtoRk7lUhit7nD/fAaxmBVm6T77A==
X-Received: by 2002:a05:600c:21c4:: with SMTP id x4mr2559603wmj.107.1601124973382;
        Sat, 26 Sep 2020 05:56:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] mfd: qcom-spmi-pmic: Add support for PM660/PM660L
Date:   Sat, 26 Sep 2020 14:55:48 +0200
Message-Id: <20200926125549.13191-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the subtype and compatible strings for PM660 and PM660L,
found in various SoCs, including SDM630, SDM636, SDM660 and
SDA variants.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/mfd/qcom-spmi-pmic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 1df1a2711328..a35d5cf16faa 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -36,6 +36,8 @@
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
+#define PM660L_SUBTYPE		0x1A
+#define PM660_SUBTYPE		0x1B
 
 static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
@@ -57,6 +59,8 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },
 	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
 	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
+	{ .compatible = "qcom,pm660l",    .data = (void *)PM660L_SUBTYPE },
+	{ .compatible = "qcom,pm660",     .data = (void *)PM660_SUBTYPE },
 	{ }
 };
 
-- 
2.28.0

