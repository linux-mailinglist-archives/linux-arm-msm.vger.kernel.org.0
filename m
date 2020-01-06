Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A93D130DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 08:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgAFHIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 02:08:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:42124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgAFHIn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 02:08:43 -0500
Received: from localhost.localdomain (unknown [117.99.94.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7C4F24650;
        Mon,  6 Jan 2020 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578294522;
        bh=3tYh2r+1H9Dq6clvHkSmF1+dK9OcVPfrp3TqTHT4UQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bx8XvQR8KPea4KEhS3y2bOTtPNwpL0IpwK/Bz7VefFmGhUcNIdCiS4cuKuTObEJlj
         YTISr4Okx+jFWoVea+ffLwgCbvsNzHhHGd5lzR//p5Qq1P9Kfko1qz4Ko6xNfO+1xR
         J7X05tUWiBqhQs2UaygoLv600L8foBRszqTiX9qQ=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Can Guo <cang@codeaurora.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8150-mtp: Add UFS gpio reset
Date:   Mon,  6 Jan 2020 12:38:24 +0530
Message-Id: <20200106070826.147064-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106070826.147064-1-vkoul@kernel.org>
References: <20200106070826.147064-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the reset-gpio for UFS for sm8150-mtp.

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
@@ -389,6 +390,8 @@ &uart2 {
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l10a_2p5>;
 	vcc-max-microamp = <750000>;
 	vccq-supply = <&vreg_l9a_1p2>;
-- 
2.24.1

