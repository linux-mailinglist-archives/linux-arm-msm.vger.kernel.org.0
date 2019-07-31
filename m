Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405257C3CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 15:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388329AbfGaNkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 09:40:25 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:42898 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387612AbfGaNkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 09:40:25 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id jRgP2000205gfCL01RgPaZ; Wed, 31 Jul 2019 15:40:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoq7-0001FF-02; Wed, 31 Jul 2019 15:40:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoq6-0004m2-UQ; Wed, 31 Jul 2019 15:40:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: qcom: sdm845-cheza: Spelling s/conenctors/connectors/
Date:   Wed, 31 Jul 2019 15:40:20 +0200
Message-Id: <20190731134020.18309-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 1ebbd568dfd72cab..cfc8c83802086682 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -745,7 +745,7 @@ ap_ts_i2c: &i2c14 {
 	 * All the hardware muxes would allow us to hook things up in different
 	 * ways to some potential benefit for static configurations (you could
 	 * achieve extra USB2 bandwidth by using two different ports for the
-	 * two conenctors or possibly even get USB3 peripheral mode), but in
+	 * two connectors or possibly even get USB3 peripheral mode), but in
 	 * each case you end up forcing to disconnect/reconnect an in-use
 	 * USB session in some cases depending on what you hotplug into the
 	 * other connector.  Thus hardcoding this as peripheral makes sense.
-- 
2.17.1

