Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAF0225A74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGTIyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:18870 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgGTIyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235260;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=T84ghuEz6J/5C+4vZE0bofBVQYxx+1or/tXstHLKLNg=;
        b=Ea2bTO9C5LotocsHssV/bA/NmJ98S6G4CPurI/XFnFcO3Cge22HXNnkuIaBN5yyl16
        ot6ingLzlid5BMq1WZs1HLjzSPYgrxbKCnMDFJQzriFw0WT6qiTCTbMyPC7e7I0zFl60
        Sk71dSn/6bDHxDJFGrEMEKWwGLvm7jlJFnf96+O1yr7ZlZvkhcgcPl8hY9dGUg0bJsm7
        8kriAR+cnLSwwedDTYpubR3xq+t6xeWG1fjOnATvLV+Ic4gRsDthQYLYxyVFYy5vhvUt
        QgxJQEBLfdINK8gxTilcZMRKGD1A7YIQ97Rq+vZhdZOVlkGd7GqZwxeSLmscFI43driG
        MXVA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sIdgE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:18 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 02/10] arm64: dts: qcom: msm8916: Declare sound node in msm8916.dtsi
Date:   Mon, 20 Jul 2020 10:53:58 +0200
Message-Id: <20200720085406.6716-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "sound" node in apq8016-sbc.dtsi references memory regions
provided by the SoC and should be therefore declared in msm8916.dtsi.

Additionally, the machine driver used for the "qcom,apq8016-sbc-sndcard"
compatible also works on other MSM8916 devices (provided that audio
routing is set up properly). It is not really specific to apq8016-sbc.

Simplify setting up sound on other boards by moving the common part
to msm8916.dtsi. This also allows referencing the node by the label,
so that we can eventually drop the "soc" node entirely from the
board-specific device tree part and use labels exclusively.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 +-----
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 7 +++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 0bec6dac17ad..1155e51c4e4f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -438,11 +438,7 @@ capture - Quat MI2S
 
 		*/
 
-		sound: sound {
-			compatible = "qcom,apq8016-sbc-sndcard";
-			reg = <0x07702000 0x4>, <0x07702004 0x4>;
-			reg-names = "mic-iomux", "spkr-iomux";
-
+		sound: sound@7702000 {
 			status = "okay";
 			pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
 			pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 67cae5f9e47e..8b12961f3269 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -704,6 +704,13 @@ blsp_i2c6: i2c@78ba000 {
 			status = "disabled";
 		};
 
+		sound: sound@7702000 {
+			status = "disabled";
+			compatible = "qcom,apq8016-sbc-sndcard";
+			reg = <0x07702000 0x4>, <0x07702004 0x4>;
+			reg-names = "mic-iomux", "spkr-iomux";
+		};
+
 		lpass: lpass@7708000 {
 			status = "disabled";
 			compatible = "qcom,lpass-cpu-apq8016";
-- 
2.27.0

