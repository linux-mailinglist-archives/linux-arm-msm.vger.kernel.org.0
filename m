Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3762911A379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 05:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfLKEar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 23:30:47 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:38500
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfLKEar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 23:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576038646;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=VzQ0Nj/0COrAF1q1mSv/Pudo7J2ONwrkXWd4kCg3SqY=;
        b=ePtvctoZVsvDbdEvVTOA5dyFICFOGgIJ4+qkJ3wCJPP1ZRYbUqQn5CfZOgdTIB2V
        /gOS9FUhExo/cU/bxojGzj6TyLLvt9MKrtPvifW9Kk/55k5VBADbMjz3YrCnyVoUvbE
        g9WajZ9l4eUtCAWg6H4JJRlrVVNcSdpUan8Lsqzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576038646;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=VzQ0Nj/0COrAF1q1mSv/Pudo7J2ONwrkXWd4kCg3SqY=;
        b=M/U0RMQQ79vR+Aw3FvLdBgdtADC/xjK6Pd0vKmJC5ezdtefpygqFCRZbzA9PP98Z
        G2Gzz3myF/kPDrGT7kD+XRn72a2duXSM6XGAMoW7l/yHJA0q4eWZPXNoTeVs9IZskZ7
        Ew0gCD/ucyy0w+SgmYjvmJAGvpdU/KPbLZsNb/kU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25E65C48B02
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7180: Add Last level cache controller node
Date:   Wed, 11 Dec 2019 04:30:46 +0000
Message-ID: <0101016ef3394291-2290a8be-91c9-4d46-b5ca-acd5277eb6e2-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1576037078.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1576037078.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.12.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for LLCC aka system cache controller for
SC7180 SoC.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a6773ad3738b..e1567109adc4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -911,6 +911,13 @@
 			status = "disabled";
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sc7180-llcc";
+			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
---

This patch depends on the llcc binding change already reviewed at:
 - https://patchwork.kernel.org/patch/11246055/

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

