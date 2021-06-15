Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3899F3A78CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 10:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhFOINm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 04:13:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230455AbhFOINl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 04:13:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AD4A6115C;
        Tue, 15 Jun 2021 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623744697;
        bh=wACaGLtj/6SSwIcMHapX5+E6FVJndfKV+xnX/hVV5yU=;
        h=From:To:Cc:Subject:Date:From;
        b=mqLx0LMxmPN3w4ZKpBdCOFZMSeMnw3fH+CC9ddy+5JDCfO342CPzDPFQyhIICXuu/
         TZFU2UHIajARimhSYGzgDZWQVKqZirc+aMJ5kewqfFKYG+K65rO29Mj8p6X1bg7ZIZ
         OVmmzmqRV+3bSnYhISqnIVAEVivzRox2/cRxdDcVdDvAB7WajY1lKubI5kOH4cw0a1
         0R778k9ffjWWB2JVOAK3MKl0CLRm+7vsolVayl+FM3PkJ3APr88+CH1Tgt1LJBPBV3
         0jxOWff6tSQ6Y2ex6ai6qIE7itrKNLukK03m3y1oFFsV2z5BMZa1OY1CPfOthW7fFX
         LfAa57/YBEbmA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sm8350-mtp: Use mdt files for firmware
Date:   Tue, 15 Jun 2021 13:41:24 +0530
Message-Id: <20210615081124.3209637-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed in [1], we should keep one of the file formats for firmware
and not change.

So to simplify we chose to use mdt for firmware file. This would enable
folks to work with upstream linux-firmware as well as downstream
firmwares.

So switch it for SM8350 which is a new platform, so switch can be done
safely.

[1]: http://lore.kernel.org/r/CALAqxLXn6wFBAxRkThxWg5RvTuFEX80kHPt8BVja1CpAB-qzGA@mail.gmail.com

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

Changes in v2:
 - Add more details about the switch in changelog

 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 93740444dd1e..d859305f1f75 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -40,7 +40,7 @@ vph_pwr: vph-pwr-regulator {
 
 &adsp {
 	status = "okay";
-	firmware-name = "qcom/sm8350/adsp.mbn";
+	irmware-name = "qcom/sm8350/adsp.mdt";
 };
 
 &apps_rsc {
@@ -278,12 +278,12 @@ vreg_l13c_3p0: ldo13 {
 
 &cdsp {
 	status = "okay";
-	firmware-name = "qcom/sm8350/cdsp.mbn";
+	firmware-name = "qcom/sm8350/cdsp.mdt";
 };
 
 &mpss {
 	status = "okay";
-	firmware-name = "qcom/sm8350/modem.mbn";
+	firmware-name = "qcom/sm8350/modem.mdt";
 };
 
 &qupv3_id_1 {
@@ -292,7 +292,7 @@ &qupv3_id_1 {
 
 &slpi {
 	status = "okay";
-	firmware-name = "qcom/sm8350/slpi.mbn";
+	firmware-name = "qcom/sm8350/slpi.mdt";
 };
 
 &tlmm {
-- 
2.31.1

