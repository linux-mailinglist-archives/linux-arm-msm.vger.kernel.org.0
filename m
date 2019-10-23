Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F845E151B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390733AbfJWJDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 05:03:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42192 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390578AbfJWJDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 05:03:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0FD8460D80; Wed, 23 Oct 2019 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821381;
        bh=phfS9FhlsQb3RonpGhGkEqAm23lRcKIgdbFcLLixLXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=feKKXUTu0nLtmW45FEVLeZaWGC21AWfOTZwDJyhXXZ44jDXbsSiJnnOwlBMWbnR4l
         QYFCgTBrOKAHa25LZxqdIeIDLYclbe1OwLsO/ERGYz/GhRPCnleCNb14amGzKE1p9T
         TDrRyfwD71xDuCVkRpfg1w2Q12MNLjAp4R+o6LJ8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B825960D83;
        Wed, 23 Oct 2019 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821378;
        bh=phfS9FhlsQb3RonpGhGkEqAm23lRcKIgdbFcLLixLXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UA560UTm3TdxUYm2cs6kehRhAimdIn8kKUK6OdSTxavJN2EksnwmEsDDTCv+Zx5KW
         kIwB/JwA1A5pBj0zHx1YX4VvVCE7LRp7MXa7TwYlzhhlnALw1gCjZWgMElLqhUSJAf
         NxLJrCuDUdG8FyrjayjikuNJoQDzCyl1Xozfcyb0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B825960D83
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 05/11] arm64: dts: qcom: sc7180: Add cmd_db reserved area
Date:   Wed, 23 Oct 2019 14:32:13 +0530
Message-Id: <20191023090219.15603-6-rnayak@codeaurora.org>
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

Command_db provides mapping for resource key and address managed
by remote processor. Add cmd_db reserved memory area.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f17684148595..dfa49ef2bce0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -32,6 +32,18 @@
 		};
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cmd_db: reserved-memory@80820000 {
+			reg = <0x0 0x80820000 0x0 0x20000>;
+			compatible = "qcom,cmd-db";
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

