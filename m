Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F67472B89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 12:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbhLMLet (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 06:34:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:18534 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbhLMLet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 06:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639395281;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=SxcCTrNtjzCKwAcZga1F6tHkCXqerDXPqqI4x3rRDKw=;
    b=Mdr8LXg+a4Cvd2YZPfr2YqU/gtw0O6rkEE8Bg5RRPnPCnwP/eyDJvoqXV9sWVxo4gn
    iMCgCMv8FnxWzLls62IyTEck4+ptaSBra+uZg/KGdsxSjsMpN7uI7cOmA0+CKSyrTd3U
    ImvkwIrme7EK1If3sBForPuHn4AdWkKGYj93YOCI/ISSJnvH2+oFzXQk/bdRoWPBZziE
    U9G0Or9V8ai6UDPJPR946IfwSEdeTGaZLQmrpl8Mvuj8keJnV29wneW3aZDDkBAr/Zlj
    iBIq/j0ENH/4RAVgKbN3o9a9WMudTvX4n8FSwXJQlWyPVns1ir13sQzTOVDF42HSBPUP
    q94w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 SBL|AUTH)
    with ESMTPSA id j080d2xBDBYeJK9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 13 Dec 2021 12:34:40 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32
Date:   Mon, 13 Dec 2021 12:32:49 +0100
Message-Id: <20211213113250.4249-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DragonBoard 410c is a convenient device for testing and debugging.
Since there is support for using ARM32 kernels on MSM8916 now, also
build the DB410c DTB on ARM32 so it can be used for testing. ARM64
is still the main supported architecture for DB410c but it actually
works great on ARM32 as well.

The "apq8016-sbc.dts" is simply included as-is from ARM64 similar
to the approach used for Raspberry Pi (e.g. bcm2711-rpi-4-b.dts).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/boot/dts/Makefile             | 1 +
 arch/arm/boot/dts/qcom-apq8016-sbc.dts | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8016-sbc.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0de64f237cd8..bba17ee51e29 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -954,6 +954,7 @@ dtb-$(CONFIG_ARCH_OXNAS) += \
 	ox810se-wd-mbwe.dtb \
 	ox820-cloudengines-pogoplug-series-3.dtb
 dtb-$(CONFIG_ARCH_QCOM) += \
+	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-lg-lenok.dtb \
 	qcom-apq8060-dragonboard.dtb \
 	qcom-apq8064-cm-qs600.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8016-sbc.dts b/arch/arm/boot/dts/qcom-apq8016-sbc.dts
new file mode 100644
index 000000000000..4ccd2dca74a2
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8016-sbc.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "arm64/qcom/apq8016-sbc.dts"
-- 
2.34.1

