Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A154A9F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 20:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730414AbfFRSdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 14:33:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47498 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730322AbfFRSdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 14:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=JH15I45wvSjOkRsZsNSoHidVfHhOQ5pap5NUnb96BRA=; b=ptr2Ld+M/DIU
        wW1cV+GUiKBVXRdZEY4uBQJkZIqUwHtnLk5zbmcngmgn8IkghlZ3RjD8Rg5DGpGcWdJhPi2XSruI5
        SGU/oE3FCttngpCKNQWQjsG1fLDhweGBYeagAW+khLn9NU1+3M5OVL1ajOnubDsVBp7FXedI4SsQJ
        iWmsg=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdIv2-0005Ku-Ks; Tue, 18 Jun 2019 18:33:20 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 210B8440046; Tue, 18 Jun 2019 19:33:20 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mark.rutland@arm.com,
        robh+dt@kernel.org
Subject: Applied "arm64: dts: msm8998-mtp: Add pm8005_s1 regulator" to the regulator tree
In-Reply-To: <20190617183759.13605-1-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190618183320.210B8440046@finisterre.sirena.org.uk>
Date:   Tue, 18 Jun 2019 19:33:20 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1c3f37d11023ff5b57135bc2bbacf4816baa67df Mon Sep 17 00:00:00 2001
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 17 Jun 2019 11:37:58 -0700
Subject: [PATCH] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

The pm8005_s1 is VDD_GFX, and needs to be on to enable the GPU.
This should be hooked up to the GPU CPR, but we don't have support for that
yet, so until then, just turn on the regulator and keep it on so that we
can focus on basic GPU bringup.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..108667ce4f31 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,23 @@
 	status = "okay";
 };
 
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
-- 
2.20.1

