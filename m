Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90FFA79B724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242329AbjIKVKn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242420AbjIKPcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 11:32:53 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19E6E5;
        Mon, 11 Sep 2023 08:32:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [171.76.82.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: vignesh)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E30B5660730D;
        Mon, 11 Sep 2023 16:32:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694446367;
        bh=ze+691gluuYjd9QZFnsV1mOxXtAD9BcYbDEUMd5HdqA=;
        h=From:To:Cc:Subject:Date:From;
        b=Go/l6aDGOQkKpARZwjWk2usHhgxQSImSmkBUSDbeTc2QYESdITINPNHNGRCp5g8vp
         MPzoQK2rr4PiFAf0ZQp2c6RnMBSgmqnHmgYMmln85mvfMN0m4QUKjfreWIEg0fZPRW
         89JTOBAbmJLK9wTE1Sf7PDpqezAxXdgxudpaqsqxZYFLpKkDFT+DCWDa/FqjkgpjWl
         HkL5cLjRFvzfMBUCxyLrYDpf/2FBptJvL0jizAxCaax+vDE+40X6tQLwdnPN4MNaCQ
         al8R36zWdS47fmPuKb11FPv+B2GR9fUhJr4h/kM5ZznBFvdpZAj86f7Gji3Fv1/jPv
         KjmfKAirg1BUg==
From:   Vignesh Raman <vignesh.raman@collabora.com>
To:     devicetree@vger.kernel.org
Cc:     helen.koike@collabora.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        daniels@collabora.com, emma@anholt.net, robdclark@gmail.com,
        mripard@kernel.org, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: Add overlay for usb host mode
Date:   Mon, 11 Sep 2023 21:02:07 +0530
Message-Id: <20230911153207.646160-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to the presence of the fastboot micro cable in the CI farm,
it causes the hardware to remain in gadget mode instead of host mode.
So it doesn't find the network, which results in failure to mount root
fs via NFS.

Add an overlay dtso file that sets the dr_mode to host, allowing the
USB controllers to work in host mode. With commit 15d16d6dadf6
("kbuild: Add generic rule to apply fdtoverlay"), overlay target can
be used to simplify the build of DTB overlays. It uses fdtoverlay to
merge base device tree with the overlay dtso. apq8016-sbc-usb-host.dtb
file can be used by drm-ci, mesa-ci.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  | 4 ++++
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2cca20563a1d..99190a6ba6ff 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
+
+apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
new file mode 100644
index 000000000000..a82c26b7eae8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&usb {
+         dr_mode = "host";
+};
-- 
2.40.1

