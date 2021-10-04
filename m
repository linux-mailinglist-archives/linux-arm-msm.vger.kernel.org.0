Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D304218C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237106AbhJDUxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:19 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:27120 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbhJDUxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380681;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=v4jygF8NX0ev6vbMx1CVuV4BnDtX87jnrtXgnUiPKuY=;
    b=sb2Eg3Ayl1vRqkgEWrZeURMKdWaQQV5vFdqbo+hvLmEc63oORGzgEBQCzHCsaj6h1H
    Yutk2X5Iy00vIuenN45AFktzosMAoVGPtuGyGx+7kx6rayVvepkyCT+mNbRKG4/r/iB/
    ddO3SYq/JLwGosV9wS3jZxjIVMsSy+DhjLYVbe1PR43ASDfQZszb9wgYUZe779/lQoVJ
    mVDVVSTU9SxPFZOBpe11Hs7tQoI6kBM7yF8zykH/IKwzWA9+SNj2gf7uLI1gz+hP8AFU
    QAX3w1j7/VGHJJEqzREZxF/CqVxRfdafiED2umF6rmQhFa3fjQhUpUdbeFjuHdMZw16g
    +fxA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KpLKSr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:21 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 14/15] ARM: dts: qcom: msm8916: Add include for SMP without PSCI on ARM32
Date:   Mon,  4 Oct 2021 22:49:54 +0200
Message-Id: <20211004204955.21077-14-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a special device tree include for MSM8916 on ARM32 that sets up
SMP and cpuidle without PSCI. This is meant for devices with signed
firmware that does not support PSCI and only allows booting ARM32 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Clarify commit message very slightly
---
 arch/arm/boot/dts/qcom-msm8916-smp.dtsi | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi

diff --git a/arch/arm/boot/dts/qcom-msm8916-smp.dtsi b/arch/arm/boot/dts/qcom-msm8916-smp.dtsi
new file mode 100644
index 000000000000..36328dbe4212
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8916-smp.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	cpus {
+		cpu@0 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@1 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@2 {
+			enable-method = "qcom,msm8916-smp";
+		};
+		cpu@3 {
+			enable-method = "qcom,msm8916-smp";
+		};
+
+		idle-states {
+			/delete-property/ entry-method;
+		};
+	};
+
+	psci {
+		status = "disabled";
+	};
+};
+
+&CPU_SLEEP_0 {
+	compatible = "qcom,idle-state-spc";
+};
+
+&cpu0_acc {
+	status = "okay";
+};
+
+&cpu0_saw {
+	status = "okay";
+};
+
+&cpu1_acc {
+	status = "okay";
+};
+
+&cpu1_saw {
+	status = "okay";
+};
+
+&cpu2_acc {
+	status = "okay";
+};
+
+&cpu2_saw {
+	status = "okay";
+};
+
+&cpu3_acc {
+	status = "okay";
+};
+
+&cpu3_saw {
+	status = "okay";
+};
-- 
2.33.0

