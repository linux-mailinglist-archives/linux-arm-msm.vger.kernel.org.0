Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA43641B507
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242038AbhI1RXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:32 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:9000 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242040AbhI1RXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849695;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=S9w5GiKQ2oy3NSyTEw/qOS43AM2R39Tjvw3qTBO3Zj4=;
    b=be9uUQxmVeU8gYqHprkIP23lqdRMsBKz0LStw88fX1W5jg5bI+r5xvDsxMYHtuDmwj
    D08hnopCwRGwFzJyOGGfb8JXT7yKkjp18c1OlZo3UECID/nc3263q6H6iLxrN6u3Mzab
    KGLmrLTirnzlQjAep27OsaLl9Pl7FxHRE2a2fOOLxr+hsCxomhlGQux32IYEi+/VuuB9
    6IKfsmdvXf7RMgYcRZ1uOiEcFpNwaeG//FQd8JxywLLkCYQb2J+L3nhdXjsxM5CP4LyK
    tmH6DYJZTvPSB5kbt+9kjNcKHm1vhPpUH2nwvFonxJ4xR2eH4oU5LFLWsOC8Bb21Pr0S
    QsOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLYoBV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:34 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 15/15] ARM: dts: qcom: msm8916-samsung-serranove: Include dts from arm64
Date:   Tue, 28 Sep 2021 19:12:31 +0200
Message-Id: <20210928171231.12766-16-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After adding all necessary support for MSM8916 SMP/cpuidle without PSCI
on ARM32, build the Samsung Galaxy S4 Mini VE device tree from the arm64
tree together with the ARM32 include to allow booting this device on ARM32.

The approach to include device tree files from other architectures is
inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
used to build the device tree for both ARM32 and ARM64.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I'm not sure what's the best way to apply this patch...
It might be easiest to apply the two ARM32 dts patches to the arm64 branch.
(It does not seem to cause any conflicts at the moment...)
---
 arch/arm/boot/dts/Makefile                           | 1 +
 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8cb859728bd9..0a53bbd9d7b1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq8064-rb3011.dtb \
 	qcom-msm8226-samsung-s3ve3g.dtb \
 	qcom-msm8660-surf.dtb \
+	qcom-msm8916-samsung-serranove.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts b/arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
new file mode 100644
index 000000000000..dee2c20af355
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "arm64/qcom/msm8916-samsung-serranove.dts"
+#include "qcom-msm8916-smp.dtsi"
-- 
2.33.0

