Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CBA353388
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 13:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbhDCLHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Apr 2021 07:07:32 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:57492 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236403AbhDCLHc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Apr 2021 07:07:32 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Sat, 03 Apr 2021 07:07:31 EDT
Received: from localhost.localdomain (188-23-235-195.adsl.highway.telekom.at [188.23.235.195])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 70052C10FF;
        Sat,  3 Apr 2021 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1617447581; bh=NYExlTW5SgOo6dsgI/PkcmDTrX5l/pORZlPpR5ODgZc=;
        h=From:To:Cc:Subject:Date;
        b=FFn3C4zbq0Dr8HlUdJCfCqXdsMLhTmXiqDpxqc4l8If20ygS/uwag3zQDM6uX8gI8
         kK+x/I5O+5pjyC251xE5+RRxwT65lMLGsV07jGypgzm+5lAtbkkTP04JWtcVcK40h4
         EFCZPjwLPfaTQCs9wPNsWXp8r8EKzDn3h2tJ8POM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU
Date:   Sat,  3 Apr 2021 12:59:03 +0200
Message-Id: <20210403105902.1867344-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the mount matrix to account for the sensor placement on the
board.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index e344007cf93f..924b0bd744b9 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -567,6 +567,10 @@ mpu6515@68 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&mpu6515_pin>;
 
+			mount-matrix = "0", "-1", "0",
+				       "-1", "0", "0",
+				       "0", "0", "1";
+
 			i2c-gate {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.31.1

