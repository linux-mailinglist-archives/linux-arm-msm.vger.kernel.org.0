Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54773A3B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFKFKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 01:10:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:59766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhFKFKW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 01:10:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FF44613B3;
        Fri, 11 Jun 2021 05:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623388104;
        bh=l6WNZY3BievJcWicCQfkYjiNB4cEDCs0qR/K20ZYNak=;
        h=From:To:Cc:Subject:Date:From;
        b=XzUS7mYM7ikMbgQFFC2NYK4c56Bh0rvd6wazCovCNF/7Ml+2C5+MCcE8kvN8GLqD7
         arHPZ+e/3Lc9bOdiMuf5yCDyPg+qZi5YiwnDGTfzVkbvdSxXPG91+WXEDWEnLBHIYd
         rWHo5xyrqlvXpFOLcC971BPQSQG7vzIZQ89HnKZTa/M1/IwJIcXe+WU8+tQHVij8wW
         pgC4OyUGlf7Bfcqo09KdAdg0FasoMcXJlQbb1sh4cMTqbRCczgiVLLRUw/wpladsc4
         eEx62YlFbCA+B4tLY4VbXxiYASEcSQAX3uSzhAMXUB6mwa8GiuUhb72SvRTx5zuA4S
         BOD08flVCuotA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350-mtp: Use mdt files for firmware
Date:   Fri, 11 Jun 2021 10:38:08 +0530
Message-Id: <20210611050808.2554431-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed in [1], it makes it easy for everyone to use mdt firmware file
name instead of mbn ones, so changes this for SM8350

[1]: http://lore.kernel.org/r/CALAqxLXn6wFBAxRkThxWg5RvTuFEX80kHPt8BVja1CpAB-qzGA@mail.gmail.com

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
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

