Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C67DE4F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfJUG42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35396 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 21C5260A0B; Mon, 21 Oct 2019 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640987;
        bh=lC81Sx2wC/chbLXxJxSgeaUfBoRSdYaw0jsgeIo0ty8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TKr9I8b99ckgZQ8QpHj9fwWhWb1iXDCkxPhYixg2KxFk2cssqbUVFK5aHKrJdkv0b
         /SOFMtXGAgr4w5J/K6sHPc7Y70RiCm2OYVW3bDovSLeJbKcovCfiJcia48GV1YHhDF
         g5VdsASd52ncTmDx1f2WHsvqJocQLC+qFqVRDJT8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C993560A0A;
        Mon, 21 Oct 2019 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640986;
        bh=lC81Sx2wC/chbLXxJxSgeaUfBoRSdYaw0jsgeIo0ty8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lp9cfQK1dZYYYZhrYoHG3U9tTUdilD2zgxzVEsBGCz/eqdzYagdUU5oXzKpK1pnPT
         ipzSWHr9AB0pa9bQIEeSqHTQhzrqmQRisihOykgPOTOMqmnKElofAhsW9GeUMwQ0rl
         QVY7Zswn4xIxxuqvGV1okAuGDCNPKqDVjmyoIr6M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C993560A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 07/13] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
Date:   Mon, 21 Oct 2019 12:25:16 +0530
Message-Id: <20191021065522.24511-8-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kiran Gunda <kgunda@codeaurora.org>

Add SPMI PMIC arbiter device to communicate with PMICs
attached to SPMI bus.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v2: No change

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6b3f08133eff..51b8004aa6a7 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -224,6 +224,25 @@
 			};
 		};
 
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0xc440000 0 0x1100>,
+			      <0 0xc600000 0 0x2000000>,
+			      <0 0xe600000 0 0x100000>,
+			      <0 0xe700000 0 0xa0000>,
+			      <0 0xc40a000 0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc7180-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

