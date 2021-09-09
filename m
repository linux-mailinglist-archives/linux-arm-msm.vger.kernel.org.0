Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408EF40455C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 08:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350954AbhIIGGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 02:06:08 -0400
Received: from ixit.cz ([94.230.151.217]:35404 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232012AbhIIGGI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 02:06:08 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id F191B23B26;
        Thu,  9 Sep 2021 08:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631167497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WtfIKgMT2yvTfh8OH8LJzFcSBPX2PKJLeB664fc42eY=;
        b=JlhtXDNjywuUF9ZjLMf0bDZjTF6+5Zj16eSGNhfMYpEZ8i1Y+A0qbX3I74mRFWDERa598v
        X1SluGkJwUfHSrSLSZDg5HPBc84zYENlaboGk7hEgDWifTHao3BV0ojkG3G27/eF3aoUoB
        MB4Wj3HX5y0MGqylG0rgOl20q8+Ofss=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] ARM: dts: qcom: fill secondary compatible for multiple boards
Date:   Thu,  9 Sep 2021 08:03:43 +0200
Message-Id: <20210909060343.9665-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To comply with device-tree definition.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
index b0f476ff017f..a7b1201dd614 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C1";
-	compatible = "qcom,ipq4019-dk04.1-c1";
+	compatible = "qcom,ipq4019-dk04.1-c1", "qcom,ipq4019";
 
 	soc {
 		dma@7984000 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
index 2d1c4c6e42f1..7765247125e4 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
@@ -5,5 +5,5 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C3";
-	compatible = "qcom,ipq4019-ap-dk04.1-c3";
+	compatible = "qcom,ipq4019-ap-dk04.1-c3", "qcom,ipq4019";
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index f343a2244386..06f9f2cb2fe9 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK07.1-C1";
-	compatible = "qcom,ipq4019-ap-dk07.1-c1";
+	compatible = "qcom,ipq4019-ap-dk07.1-c1", "qcom,ipq4019";
 
 	soc {
 		pci@40000000 {
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
index 582acb681a98..bd3553dd2070 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK07.1-C2";
-	compatible = "qcom,ipq4019-ap-dk07.1-c2";
+	compatible = "qcom,ipq4019-ap-dk07.1-c2", "qcom,ipq4019";
 
 	soc {
 		pinctrl@1000000 {
diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index e5b9b9cf6097..b63d01d10189 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -3,7 +3,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ8064/AP-148";
-	compatible = "qcom,ipq8064-ap148";
+	compatible = "qcom,ipq8064-ap148", "qcom,ipq8064";
 
 	soc {
 		pinmux@800000 {
-- 
2.33.0

