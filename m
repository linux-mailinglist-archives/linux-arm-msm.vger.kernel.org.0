Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0ACDF1166
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 09:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731527AbfKFIrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 03:47:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:51092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730178AbfKFIrV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 03:47:21 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCAD1217F4;
        Wed,  6 Nov 2019 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573030040;
        bh=uf5TG+Wknq5QFhY1vd52nLhyqhyPLL2HLPrmiOwNrQU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fyrHYJxMwZjz/plAbEBGPqQwt2xxQmSMkNqoYXbuQDqvMGdqXk6nUcjXelIvql9iQ
         DY0CQS1wqCxiP64X2mQDLqMTniFa9WknjsAguHXl5KkaGMftEQn7jPx+v7nVOoMwt8
         9k20EoHnCZERZ3XarYwKxw67a7geiRfUAZGaJoU4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150-mtp:  Enable UFS nodes
Date:   Wed,  6 Nov 2019 14:16:56 +0530
Message-Id: <20191106084656.1749954-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106084656.1749954-1-vkoul@kernel.org>
References: <20191106084656.1749954-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the UFS HC and phy nodes and add regulators used by these.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index d4c240a56d2e..1eb93a768a85 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -385,3 +385,23 @@
 &uart2 {
 	status = "okay";
 };
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l10a_2p5>;
+	vcc-max-microamp = <750000>;
+	vccq-supply = <&vreg_l9a_1p2>;
+	vccq-max-microamp = <700000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs_2ln_core_1>;
+	vdda-max-microamp = <90200>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+	vdda-pll-max-microamp = <19000>;
+};
-- 
2.23.0

