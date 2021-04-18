Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B07F363534
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 14:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhDRMad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 08:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbhDRMa1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 08:30:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFDBC061344
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id sd23so40093121ejb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Povr2PCX17kPcIjpM7jFhMLFACkEG0pX0j9vA7ZmMlE=;
        b=N2sdCUsAj7x9gsqUHEMfL4w6zOyWfcNQQPzfaxKL7lIEBqHT3zYA0LjL2pZjtzkRVA
         7hLzpX+t5gKlt+I0dECXGu+/m/7c/qsqK6ctZxEnBqOzgH2Dpe60nb7c3mhuVcgPZ84T
         rd5fyjkkqDDOlwxwRVHg4pI/iyRz4WD4XWWN8c8c8xR2HuoIEa4BIbHPIbCdZ7wKdYA7
         U9iTCc/tEqZhTcnOq3ju8vgnXhZ4XbPHmgqbO/qAWzGvtsNifKAPHVb7TSk9JxkQmv0q
         BJdyFywYCS6rOm7HHNnD1pjhSzqzuSXGaY6Xx+0yvhRXVL0oVXzVXguG/iCLGRv5dCZ8
         qTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Povr2PCX17kPcIjpM7jFhMLFACkEG0pX0j9vA7ZmMlE=;
        b=GzIw/z+yu8WqVu6rF+H9SXYUl/GUtGtQ/70voUumDJ/znvtu8FWkLsaC5biHg7Lt30
         mUzccE1MZEl9oO5zInB2zy02Pt0kXd2lu24qYMIrVRkQjrOJxurAEsUgUcmO2UJEqDw7
         X6LyXN1yX23eWZUHi5PBqOznC5mRm0uFB5JiOJoFStLkZGys8FqjoFaBa3jI1Q2M3uxZ
         tghbI+Jb7MQwzFXaSQiPWQnZ0ODst8yUhQfOqzdndSHhaE1Mh1CgVQftEf4etMslE0L6
         H0TXrxsRSDzFP2RKnYMUltnOKTBrrJ0UzFjHgKsGf/ILfwKOTlkwxvZfNCpKSIyHmMxK
         jGvQ==
X-Gm-Message-State: AOAM533i/+U3QDXz+pdlkbZHSMP6926oA2vJPVk0x//VF/kJIDswlOAD
        lk4jaMt6oeizcl9YQE+xxIG3UA==
X-Google-Smtp-Source: ABdhPJwz0rE2CDn2fqqk0+tJA02XvNTkLZp+/wGQZHn1H/gImMIuGi56clWZflH0EgKxzeUsfVSCgA==
X-Received: by 2002:a17:906:8921:: with SMTP id fr33mr17141651ejc.151.1618748996975;
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id a27sm8213677ejk.80.2021.04.18.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 6b81955b;
        Sun, 18 Apr 2021 12:29:50 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 5/5] arm: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo phone
Date:   Sun, 18 Apr 2021 14:29:09 +0200
Message-Id: <20210418122909.71434-6-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DTS support for the Samsung Galaxy S III Neo (codenamed s3ve3g) phone.
Initial version have just a working serial console.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/qcom-msm8226-samsung-s3ve3g.dts  | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e7..080ff37fdb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -920,6 +920,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-msm8226-samsung-s3ve3g.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
new file mode 100644
index 0000000000..d159188c8b
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "qcom-msm8226.dtsi"
+
+/ {
+	model = "Samsung Galaxy S III Neo";
+	compatible = "samsung,s3ve3g", "qcom,msm8226";
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&soc {
+	serial@f991f000 {
+		status = "ok";
+	};
+};
-- 
2.25.1

