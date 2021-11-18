Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29B145649B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 21:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhKRVCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:02:20 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36736 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230422AbhKRVCT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:02:19 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4BF5FCAD7C;
        Thu, 18 Nov 2021 20:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269157; bh=fWzhaXZCPMrIWvJQQkqfEQIjMey2OLEi4hm1dx5umxo=;
        h=From:To:Cc:Subject:Date;
        b=vtItq401CwvXF2QlBHl6JqqoQ9XPmIYcfS6Rdxh3ZThOeU8407DOayhXX7lNXIF1j
         HN0nyE+hJzO32qYz135dq6sQTrMergrqJjictu/EGc67K6QmSKFbIjGt+BWGoPV5eH
         Bk/euax/4A4Se5GAUGWofXRp7jwHVnFXT1nI9hxg=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: apq8026-lg-lenok: add fuel gauge
Date:   Thu, 18 Nov 2021 21:58:33 +0100
Message-Id: <20211118205834.160308-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The device uses a BQ27421 as fuel gauge, so add a node describing it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index f350c4e8c194..b19522ad91a0 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -23,6 +23,15 @@ chosen {
 	};
 };
 
+&blsp1_i2c1 {
+	status = "okay";
+
+	fuel-gauge@55 {
+		compatible = "ti,bq27421";
+		reg = <0x55>;
+	};
+};
+
 &blsp1_i2c5 {
 	status = "okay";
 	clock-frequency = <384000>;
-- 
2.34.0

