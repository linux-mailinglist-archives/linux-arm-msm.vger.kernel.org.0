Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69841F0F39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731219AbfKFGvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:51:11 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45346 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFGvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:51:10 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 934BC612C6; Wed,  6 Nov 2019 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023069;
        bh=8TrfbzvdTMTOXM8JtTXLbiJ5IU1FPuFISjYqS0WsRC4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y+WqKEDA2/ao5q1lsZytJZZiDRDl6aNLtKAwzx7E7wv0XVhSQ08VfDZNIq0O60Cwn
         YK3x95AU5QE9Sw8iQHfxXSY3Lq2tjS9twlXezB10ORdkWIRrxTpiyxMQZ3KKipKOzU
         FG57P5yPBqDurvOLiXqcG2lYCSzvrzeFOaAGSoPI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB188612C3;
        Wed,  6 Nov 2019 06:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023069;
        bh=8TrfbzvdTMTOXM8JtTXLbiJ5IU1FPuFISjYqS0WsRC4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y+WqKEDA2/ao5q1lsZytJZZiDRDl6aNLtKAwzx7E7wv0XVhSQ08VfDZNIq0O60Cwn
         YK3x95AU5QE9Sw8iQHfxXSY3Lq2tjS9twlXezB10ORdkWIRrxTpiyxMQZ3KKipKOzU
         FG57P5yPBqDurvOLiXqcG2lYCSzvrzeFOaAGSoPI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB188612C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 05/14] arm64: dts: qcom: sc7180: Add cmd_db reserved area
Date:   Wed,  6 Nov 2019 12:20:08 +0530
Message-Id: <20191106065017.22144-6-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
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
v4: updated label to aop_cmd_db_mem

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ef52cd7efc88..61250560c7ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -31,6 +31,18 @@
 		};
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aop_cmd_db_mem: memory@80820000 {
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

