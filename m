Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4359A645C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 13:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfGJL3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 07:29:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39682 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfGJL3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 07:29:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 347276016D; Wed, 10 Jul 2019 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562758179;
        bh=m2qwZf7JvuOLOVYBKh/GH/DshrBUucultC3DII2Hmqg=;
        h=From:To:Cc:Subject:Date:From;
        b=N0GNZJvGjN7Bv5B8bfskoqQXzGgySYdIe00+XdCgQF84aIkkNublIQ63nSE4aYm+r
         E8mxH4P+olwr7QwwPoEngLfD0JYebXnfy2dozS4UYx4ZvlhFcpwvMwgbAmggt2RG3q
         KvNEbyiZ81+AGIzTSuNpGnoj7/cBPX3BF+ijp2Wk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D2016055C;
        Wed, 10 Jul 2019 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562758178;
        bh=m2qwZf7JvuOLOVYBKh/GH/DshrBUucultC3DII2Hmqg=;
        h=From:To:Cc:Subject:Date:From;
        b=Ve8RE78B9hyprIRWeUxbWQXZ5QrWGZZCwyYQtev2aLsz4wQuxXkX5OKHmd20EQaS+
         zvlkD9B+IGhh9B9AwD6c3PEkcO0vhzmQ68CLtgHWBxm5pRT/LPUKc5WNr650OKz0Qm
         elZf5k9eZjcCSbC/MimVt3qdrkOJoRBO6GxbuTpE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D2016055C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: sdm845: Add device node for Last level cache controller
Date:   Wed, 10 Jul 2019 16:59:24 +0530
Message-Id: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Last level cache (aka. system cache) controller provides control
over the last level cache present on SDM845. This cache lies after
the memory noc, right before the DDR.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5f19b5..314241a99290 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1275,6 +1275,13 @@
 			};
 		};
 
+		cache-controller@1100000 {
+			compatible = "qcom,sdm845-llcc";
+			reg = <0 0x1100000 0 0x200000>, <0 0x1300000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

