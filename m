Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAB9419A29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 19:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhI0RHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 13:07:07 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57225 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236049AbhI0RGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 13:06:35 -0400
X-Greylist: delayed 1616 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Sep 2021 13:06:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=wpiFa5EUEpg7BKdvDP7vV5kR0o6xo7UxIS+xt5j9R/o=;
        b=srommUDR0KJHtZPZrUF1/BWomUcMI6Tk8mmp34kowa/KfFa1EKGyUIENol4+KCHjF59L1OwnaWn3QnoU8uXKCQVPamUlpX2inmQaQo7EMUdrTdymfzGBWpSu+H7QiocFK6OUC5z8vjJy7We6bUgl5yPIZsw0f3HHKmTUg4ikXnEqTNo5QfU90G8fsRZnqaYWjlva9kHtn7r9UfYwC4hmZFMeh43IoHdhZy4zm0CVFj4NPTHFp0Msni3dklR0WI1EHhLXV6xCIA1sRcnv4Y8IXa3Wmnct8lWNAGQzuVUor70i2gV0G9Wow6NWY27kMdbYsNPcxTwm0xc/wjmd8zRyKQ==;
Received: from [177.95.15.66] (helo=localhost)
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
        id 1mUtdd-0005iq-H3; Mon, 27 Sep 2021 18:37:58 +0200
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, gpiccoli@igalia.com,
        kernel@gpiccoli.net
Subject: [PATCH] arm64: dts: qcom: db820c: Improve regulator voltage range and mark it as always-on
Date:   Mon, 27 Sep 2021 13:37:45 -0300
Message-Id: <20210927163745.2066610-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
introduced this voltage regulator which seems to be essential for the GPU,
according to the board schematics [0]. The problem is that such commit sets
the regulator min/max voltage range to a static value, which is a bit lower than
the range supported to such regulator [1]. With that, the GPU is not stable
as per my experiments (in a Dragonboard 820c-based board) - I've observed
sudden reboots into a FW bad state.

More than that, my experiment showed that this regulator must be set to
always-on - this idea came from a commit in Linaro's tree, from Rajendra [2].
With the voltage range updated plus set as always-on, the GPU is working
correctly, in a stable fashion.

[0] See page 9 (VDD_GFX), at
https://www.96boards.org/documentation/consumer/dragonboard/dragonboard820c/hardware-docs/files/db820c-schematics.pdf

[1] See section 3.5.3 (FT-SMPS) in the "PMI8994/PMI8996 Power Management IC",
at https://developer.qualcomm.com/download/sd820e/pmi8994pmi8996-power-management-ic-device-specification.pdf

[2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=release/qcomlt-4.14&id=75fb43f3a62

Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Vinod Koul <vkoul@kernel.org>
Fixes: 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

Hi Andy/Bjorn/all, this patch was tested in 5.14, but I've tested it
in the linux-next tree as well and was able to apply there cleanly.
I'm new in the DTS world, so my apologies in advance for any rookie
mistake - suggestions are appreciated! Thanks in advance for the review,


Guilherme


 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 51e17094d7b1..977842068619 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -699,8 +699,11 @@ &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
 		regulator-name = "VDD_GFX";
-		regulator-min-microvolt = <980000>;
-		regulator-max-microvolt = <980000>;
+		regulator-min-microvolt = <350000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		status = "okay";
+
 	};
 };
 
-- 
2.33.0

