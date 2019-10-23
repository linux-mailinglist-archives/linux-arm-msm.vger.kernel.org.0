Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD73E152F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390812AbfJWJD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 05:03:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42920 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390807AbfJWJD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 05:03:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1A93A60DCD; Wed, 23 Oct 2019 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821405;
        bh=bSOkFQeqO8LEVBJ2HnZt1qFBxSpvVtIOF1peJoYkpYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jrBdFji+bPxo95zpOdRT4dV0NDboJdYVu9goD6YeWPles+fkWpgygBL/FU8J60afI
         6bwhelTWX7hlrhfjsYe+fdyZTuLY0WBS2MqIQ5iwiwMLO21gBQyqn6PG3siRPPkO6k
         wTAZLTQKpi5l6zgtuug/fnKDPDZLUQuDqaQW7mfE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E3CB60DD1;
        Wed, 23 Oct 2019 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821402;
        bh=bSOkFQeqO8LEVBJ2HnZt1qFBxSpvVtIOF1peJoYkpYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lag+2ZpOrOdWTNdOgNlhR5uqv+ASWkJdriOxa8E19P4K92+MJ1b7MihYq/cCErnt6
         I00X/mKMufLL/nvnEskcda1R9zEJ9t8AGgroRQPCrfKbWC6d/c4r4v94cdFf0o7laQ
         bAqk1ZC4tvKtA0mzXlHWZ5EfCpN+/oPfm58PodR4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E3CB60DD1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt controller
Date:   Wed, 23 Oct 2019 14:32:19 +0530
Message-Id: <20191023090219.15603-12-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191023090219.15603-1-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

Add pdc interrupt controller for sc7180

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v3:
Used the qcom,sdm845-pdc compatible for pdc node

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f2981ada578f..07ea393c2b5f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -184,6 +184,16 @@
 			#power-domain-cells = <1>;
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc";
+			reg = <0 0xb220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
+					  <119 634 4>, <124 639 1>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

