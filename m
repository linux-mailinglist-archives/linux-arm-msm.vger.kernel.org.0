Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E72041B870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 22:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242725AbhI1UkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 16:40:09 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:52012 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242604AbhI1UkJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 16:40:09 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id EE2C5C8FF3;
        Tue, 28 Sep 2021 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1632861508; bh=CiNsP3adcwuzakR+x22r6mqUJpYSqHKJwX//BvpNn8Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nniINJnXsWVKOUK5D8dbOk2nO7fBY9fySeqU+cOL52VS6akL+eU5DxKZ6PlcInPnI
         2Bvk6IyB6Vc8hG5QgodK+NStTx0ZjZGb2pPopzICM2WLNsGKnGUfVRVMqFguVZ+OBF
         skrK9NFpQVoKVVvY5Z5ZQFbD5clXAmnnxKCWaVyk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: apq8026-lg-lenok: rename board vendor
Date:   Tue, 28 Sep 2021 22:38:15 +0200
Message-Id: <20210928203815.77175-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928203815.77175-1-luca@z3ntu.xyz>
References: <20210928203815.77175-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to avoid having prefixes for multiple internal divisions of LG
use the "lg" prefix instead of "lge".

Fixes: ad3f04b7bef6 ("ARM: dts: qcom: Add support for LG G Watch R")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/Makefile                                      | 2 +-
 .../{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5ffab0486665..ff8f5ed5dd65 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -942,7 +942,7 @@ dtb-$(CONFIG_ARCH_OXNAS) += \
 	ox810se-wd-mbwe.dtb \
 	ox820-cloudengines-pogoplug-series-3.dtb
 dtb-$(CONFIG_ARCH_QCOM) += \
-	qcom-apq8026-lge-lenok.dtb \
+	qcom-apq8026-lg-lenok.dtb \
 	qcom-apq8060-dragonboard.dtb \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
similarity index 99%
rename from arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
rename to arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index ada4e94ade66..52a848e1b4d0 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "LG G Watch R";
-	compatible = "lge,lenok", "qcom,apq8026";
+	compatible = "lg,lenok", "qcom,apq8026";
 	qcom,board-id = <132 0x0a>;
 	qcom,msm-id = <199 0x20000>;
 
-- 
2.33.0

