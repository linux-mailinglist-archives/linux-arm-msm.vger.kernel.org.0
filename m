Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDF430FC8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238255AbhBDTXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:23:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:56746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238339AbhBDRKX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:10:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8317864F65;
        Thu,  4 Feb 2021 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458565;
        bh=35QGcWRXrFZZKLLrP8CbNn95b1JWwB0ykltG6Pu99j0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c99jDqMx9VGky9p5LbB87lAzjRfq0NmAeChii4YBlgoO+poQrAxqMv0KN8Z0+ycn2
         zQYqfEscDgreKoiaxrDsrD27tiFfGIWaAFp4rd6bVEgRUUc+gCEKXiWOp6TrBMGeeA
         eIxWQA7wcPPIHl+yG3SlSPb10lllGz5fI61Pg5PTEeiYZO8EIjl46Q5hwEakbxGi6g
         r+nZSiFutbq6f7A7ImRxCeivzHj7kF0NgJgtVA+Yaj8kbB9HcSKPqAlVF8ZwdvfWMj
         cVOBHm4T/BcJ2xb/LwluApe/BB8Lbx7cNJaMLEv2f9q/EUpIAqICT9eAVkawKC4gSg
         DiLv3YWxB2+3w==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8350-mtp: enable USB nodes
Date:   Thu,  4 Feb 2021 22:39:04 +0530
Message-Id: <20210204170907.63545-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
References: <20210204170907.63545-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

Enable both USB controllers and associated hsphy and qmp phy nodes
on sm8350 MTP. Designate the usb_1 instance as peripheral-mode only
until proper PMIC based Type-C dual-role handling is supported.

TODO: the second USB controller is exposed to a microAB port. Dual-
role can be supported for this by adding the "usb-role-switch"
property as well as defining a USB connector node with a
"gpio-usb-b-connector" compatible. However, this requires GPIO
support from PM8350 which is still missing.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
Message-Id: <20210116013802.1609-3-jackp@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 8923657579fb..a2baa1ad3752 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -248,3 +248,45 @@ &tlmm {
 &uart2 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p07>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p88>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p07>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l5b_0p88>;
+};
-- 
2.26.2

