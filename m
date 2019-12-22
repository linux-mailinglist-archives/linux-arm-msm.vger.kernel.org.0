Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE25912904D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 00:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfLVXh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Dec 2019 18:37:26 -0500
Received: from titan.ufpe.br ([150.161.6.80]:38354 "EHLO canit.ufpe.br"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfLVXhZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Dec 2019 18:37:25 -0500
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by canit.ufpe.br (8.14.4/8.14.4/Debian-4) with ESMTP id xBMNb5k1130510
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 22 Dec 2019 20:37:06 -0300
Received: from localhost (localhost [127.0.0.1])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 0E503C7A3948;
        Sun, 22 Dec 2019 20:37:04 -0300 (-03)
X-Virus-Scanned: amavisd-new at ufpe.br
Received: from zimbraufpe.ufpe.br ([127.0.0.1])
        by localhost (zimbraufpe.ufpe.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0X7v5IwT_RGt; Sun, 22 Dec 2019 20:37:03 -0300 (-03)
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id B719D6B7FCAC;
        Sun, 22 Dec 2019 20:37:03 -0300 (-03)
Date:   Sun, 22 Dec 2019 20:37:03 -0300 (BRT)
From:   Victhor Foster <victhor.foster@ufpe.br>
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     agross <agross@kernel.org>, robh+dt <robh+dt@kernel.org>,
        mark rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>
Message-ID: <108381142.9510389.1577057823350.JavaMail.zimbra@ufpe.br>
Subject: [PATCH] arm: dts: apq8084: Change tsens definition to new style
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [179.235.209.15]
X-Mailer: Zimbra 8.8.7_GA_1964 (ZimbraWebClient - GC78 (Linux)/8.8.7_GA_1964)
Thread-Index: /aPAUEAnqdHVSSwgzgG/IXT197l2aA==
Thread-Topic: apq8084: Change tsens definition to new style
X-Bayes-Prob: 0.5 (Score 0: No Bayes scoring rules defined, tokens from: SAIDA)
X-Spam-Score: 0.00 () [Hold at 10.00] 
X-CanIt-Incident-Id: 011FbB6Pz
X-CanIt-Geo: ip=150.161.6.73; country=BR; region=Pernambuco; city=Recife; latitude=-8.05; longitude=-34.9000; http://maps.google.com/maps?q=-8.05,-34.9000&z=6
X-CanItPRO-Stream: SAIDA
X-Canit-Stats-ID: 011FbB6Pz - d77f4841f649 - 20191222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ufpe.br; h=date:from:to
        :cc:message-id:subject:mime-version:content-type
        :content-transfer-encoding; s=ufpe201801; bh=0euJECY7iR6dg4GlbOo
        CvBVpwi9Hb5UrQY0uzUfBPTY=; b=dHog3oudUN97pg/72qtBc6odhww7BaStsG1
        bRXOkmQittW4zobegTcdCGyQ4C2XDeZ3pt3vUxq+m+qDtBFM0AeM1wVXQBLaMrxG
        cZcAdC1imngXLNAmrrInyNXZ8s6JJf9wrMqbZsjH9LZtOyAQCCROgVq/K6IoZNkI
        3nTacZA2rpZfnwb/EUZhmOxRppxFYlZqXrieSomYap1zUx5jrRVpmxho4Bd59Nkv
        gfzIjitxCkSYlDRbTg4J4YZsAWGdWSJjoWwoM+4g9zadlzGcAXvHXqd3YJBog7iz
        qGqLvTELjDhSG3Xt98mnzAX4sA6AGja+DtMBC0L43wuQmtlJr8w==
X-Scanned-By: CanIt (www . roaringpenguin . com) on 150.161.6.80
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch changes the tsens peripheral definition to the new style, which fixes a kernel panic caused by a change in the tsens driver, introduced by commit 37624b58542fb9f2d9a70e6ea006ef8a5f66c30b.
There was a patch submitted recently to this list that should fix this problem with old device trees and the new driver, so it may be redundant at this point, in terms of fixing the kernel panic, but this should align the APQ8084 device tree with the others.

Signed-off by: Victhor Foster <victhor.foster@ufpe.br>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 0a0fb147ebb9..26d79ff2af22 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -253,9 +253,11 @@ tsens_backup: backup@440 {
 
 		tsens: thermal-sensor@fc4a8000 {
 			compatible = "qcom,msm8974-tsens";
-			reg = <0xfc4a8000 0x2000>;
+			reg = <0xfc4a9000 0x1000>, /* TM */
+			      <0xfc4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
+			#qcom,sensors = <11>;
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.24.0
