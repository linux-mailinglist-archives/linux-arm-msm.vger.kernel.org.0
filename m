Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2132E4354AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 22:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhJTUju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 16:39:50 -0400
Received: from ixit.cz ([94.230.151.217]:57950 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231248AbhJTUjn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 16:39:43 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id A2C1220064;
        Wed, 20 Oct 2021 22:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634762246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nH52ka17/DOBl6HuGZZxeL9Rkw80m2p0oC4AG4B1sTo=;
        b=AxBmRWEf/HHpyk8cITHJ9Mvsuw4SRF3gtA3rqzo30/lWbHqzcd9Vipc2zCVd8ipoXh15Ig
        bIFWrNci3aBiOSAxqDiEW0AxsrcRZFSg2H8TTTlb9jvdhlMdKaOtDbJj7foLIyDky8Elh0
        mM5RvHuTeFCHxExvJkF1BUfaQD++9P0=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node
Date:   Wed, 20 Oct 2021 22:37:22 +0200
Message-Id: <20211020203723.233578-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I added the missing dash inside the thermal-sensor-cells.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 7f67b282da10..11481313bdb6 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -751,7 +751,7 @@ tsens: thermal-sensor@900000 {
 				interrupt-names = "uplow";
 
 				#qcom,sensors = <11>;
-				#thermal-sensorcells = <1>;
+				#thermal-sensor-cells = <1>;
 			};
 		};
 
-- 
2.33.0

