Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462E0BF983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 20:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbfIZSov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 14:44:51 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:41798 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728401AbfIZSov (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 14:44:51 -0400
Received: from localhost.localdomain (80-110-106-143.cgn.dynamic.surfer.at [80.110.106.143])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 929ECC7C64;
        Thu, 26 Sep 2019 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1569523489; bh=AoXWJW0M0VHHUrSvYjJWO5GAhgxeWFY8urNczKG8hIQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=G1FK7UwYjqUCNteHqMgkFpfFmRtmURJ1bBEuqmPZJB4qdsI8Po9pkEcJx8gVzB3Uw
         jQrUJ+g4Xy6qWyLfgYZphet+/lSUgtF4i867nTy9OdZi7vXLX/HAO585x5sop9KGnS
         Nf4EhV76OpDWfQtO4fn3fqTaNAnsKKXtF0aaoDBU=
From:   Luca Weiss <luca@z3ntu.xyz>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: msm8974-FP2: Increase load on l20 for sdhci
Date:   Thu, 26 Sep 2019 20:44:35 +0200
Message-Id: <20190926184436.1078314-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926184436.1078314-1-luca@z3ntu.xyz>
References: <20190926184436.1078314-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Before this change, trying to boot from the internal storage would
result in a lot of errors like:

[   11.224046] mmc0: cache flush error -110
[   11.224180] blk_update_request: I/O error, dev mmcblk0, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0

or:

[  137.544673] mmc0: tuning execution failed: -5
[  137.569832] mmcblk0: error -110 requesting status
[  137.593558] mmcblk0: recovery failed!

With this patch, there are no more sdhci errors and booting works fine.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 2869be16bc6e..dfab2518df60 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -221,6 +221,8 @@
 						regulator-max-microvolt = <2950000>;
 
 						regulator-boot-on;
+						regulator-system-load = <200000>;
+						regulator-allow-set-load;
 					};
 
 					l21 {
-- 
2.23.0

