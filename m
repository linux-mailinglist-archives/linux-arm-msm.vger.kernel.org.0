Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1891216F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfLPSc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:32:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfLPScz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:32:55 -0500
Received: from localhost.localdomain (unknown [122.182.192.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1058B21835;
        Mon, 16 Dec 2019 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576521174;
        bh=3tE9VgX0PlQp/RfUUXS8IU04W0aYzDGAQGslLTTAyVU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C0iGQ2ixYzFmDaqZNqHqnDKmFspPklMfqVaOQrE1FiwbT5qYqMc13VczctAlqx+IR
         am07LeI5/ZP2enYXkvTe5DRQhnPXz2b+GvlPRqZ3tBIlDY3hqgEYHJxeZXJdkAvem1
         GQUQ1D1lX6g5vRX0Ax6KFmU9kErYpGcuyQnW/FY0=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150-mtp: Add reset line for UFS
Date:   Tue, 17 Dec 2019 00:02:32 +0530
Message-Id: <20191216183232.1570675-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191216183232.1570675-1-vkoul@kernel.org>
References: <20191216183232.1570675-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the reset line for the UFS node.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 1eb93a768a85..9cab51759d2f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "sm8150.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -389,6 +390,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l10a_2p5>;
 	vcc-max-microamp = <750000>;
 	vccq-supply = <&vreg_l9a_1p2>;
-- 
2.23.0

