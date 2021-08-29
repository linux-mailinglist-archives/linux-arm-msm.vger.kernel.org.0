Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDD23FAC00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 15:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbhH2Nln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 09:41:43 -0400
Received: from ixit.cz ([94.230.151.217]:44254 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhH2Nlm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 09:41:42 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 3012C24A25;
        Sun, 29 Aug 2021 15:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1630244449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3F/jt1c6ucoq6YusXZ0whkjOXbkGivRlgMJrOePcLHQ=;
        b=mcTFX+gSQHEKnz+d8ZX+afRIS8xs5k2iIy/Da7YR4lR5xVVNsMdNkvBB/PUlpcgmgdMNlh
        zy2XUmX6YYWdq/q1BAJ32Wg0a18JphyXK1jy6IgrM/OzwddmRaj7vFVdNzwoVi6g7EVdpN
        wt0SEmKelkIHRZvTlxm/Sds81CPTzxs=
From:   David Heidelberg <david@ixit.cz>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH 3/3] ARM: dts: qcom-apq8064: adreno: convert from legacy gpu-pwrlevels to opp-v2
Date:   Sun, 29 Aug 2021 15:39:18 +0200
Message-Id: <20210829133918.57780-3-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829133918.57780-1-david@ixit.cz>
References: <20210829133918.57780-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

APQ8064 was last user of gpu-pwrlevels inside mainline tree, so convert
it now.

Tested on Nexus 7 2013, no functional changes.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 429dd96ade6f..1237ded42615 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1229,13 +1229,17 @@ &gfx3d1 29
 				  &gfx3d1 30
 				  &gfx3d1 31>;
 
-			qcom,gpu-pwrlevels {
-				compatible = "qcom,gpu-pwrlevels";
-				qcom,gpu-pwrlevel@0 {
-					qcom,gpu-freq = <450000000>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <450000000>;
 				};
-				qcom,gpu-pwrlevel@1 {
-					qcom,gpu-freq = <27000000>;
+
+				opp-27000000 {
+					opp-hz = /bits/ 64 <27000000>;
 				};
 			};
 		};
-- 
2.33.0

