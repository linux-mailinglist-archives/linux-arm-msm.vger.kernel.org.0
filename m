Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5911BD06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 20:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfLKTa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 14:30:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:32647 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLKTa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 14:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576092624;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=5RQDqOdQgPLbxOS9f72dxcG6QE/zOy/OAhZhNoF+uBw=;
        b=HuirdDTm/QIBd5Sly2GQi0RLdiNLOWqL4aO4lf7vN6CftmRecPm35mtW48r4CFK4pV
        qhu5V2QL3o0dY8F2Rhv257wNBgaoUCS9nuqBV8Z3w0QyB7zP/XId+wN9bb1/uWwMznlm
        JqyEz6qzMbXWnfKVKSrVYyDpeHVXhLW6akHGfBVJQbFnp5wC/AYJS88CMFXBGlrAoMEM
        u+lw1D/3lGv9Mnsgnxcr8Jda7F8fRx/ulDlxRxvMrMhYb2c3NI2uLaxHMzFpEV0WA+br
        w7DhDmS3enrCx7NBKZte4goqHACkBBiCcJywuk7cxROulY7H34FViy418XMtShKKhyam
        v9SA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXtc/vtBNY3Q=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.0.2 AUTH)
        with ESMTPSA id R01a59vBBJUMopK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 11 Dec 2019 20:30:22 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Damien Riegel <damien.riegel@savoirfairelinux.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: pm8916: Add vibration motor node
Date:   Wed, 11 Dec 2019 20:29:06 +0100
Message-Id: <20191211192906.56638-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8916 has one vibration motor driver that is already supported
by the pm8xxx-vibrator driver.

Add a node describing it to pm8916.dtsi.
Keep it disabled by default since not all devices make use of it.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 9dd2df1cbf47..0bcdf0471107 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -111,6 +111,12 @@ pm8916_1: pm8916@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8916_vib: vibrator@c000 {
+			compatible = "qcom,pm8916-vib";
+			reg = <0xc000>;
+			status = "disabled";
+		};
+
 		wcd_codec: codec@f000 {
 			compatible = "qcom,pm8916-wcd-analog-codec";
 			reg = <0xf000 0x200>;
-- 
2.24.0

