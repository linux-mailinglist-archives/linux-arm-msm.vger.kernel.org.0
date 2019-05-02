Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38195118C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 14:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfEBMN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 08:13:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbfEBMN4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 08:13:56 -0400
Received: from localhost.localdomain (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 174F920B7C;
        Thu,  2 May 2019 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556799235;
        bh=Po9aWhrhF8+W5QReF1J9FZhfqwWCvr4V2vgw29ulq6o=;
        h=From:To:Cc:Subject:Date:From;
        b=F8nVrFEzL9jsS/nsrDGMmDfvBoA6zNx6ZScxHw8Ks/Vx8y0xfIofuMig2fGpRW+5H
         Zoi9TCvDopG9S+hcJpuYKzmkHZ1qwMECjFWBh5IJZWDizkoEwWo+Gdi2j9tLuuH0af
         H5sybsgvvwbAgwUX+Whc31B/8xEgsHk2lrKSovzQ=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Fix typo
Date:   Thu,  2 May 2019 17:43:06 +0530
Message-Id: <20190502121306.3374-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the typo "dreive-strength" and use correct property drive-strength

Fixes: 7241ab944da3 ("arm64: dts: qcom: qcs404: Add sdcc1 node")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..7cc0b7842ac2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@
 		data {
 			pins = "sdc1_data";
 			bias-pull-up;
-			dreive-strength = <10>;
+			drive-strength = <10>;
 		};
 
 		rclk {
@@ -225,7 +225,7 @@
 		data {
 			pins = "sdc1_data";
 			bias-pull-up;
-			dreive-strength = <2>;
+			drive-strength = <2>;
 		};
 
 		rclk {
-- 
2.20.1

