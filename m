Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32183435693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 01:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhJTXqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 19:46:51 -0400
Received: from ixit.cz ([94.230.151.217]:58426 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJTXqv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 19:46:51 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 6667320064;
        Thu, 21 Oct 2021 01:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634773473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CzIXnLlE/MvFuoaL99f/gSmxS8lmBfB1yjg8rOb/tsk=;
        b=z1Tmt6zCbGgfnXJyTQxYLfJdGxyKvNcCwqQO3gMVzGouTAdyD3+h2vYUKVNC6HjxbCB3x5
        avJniKJQyT/pr893ZU/zaUMX7/CM4L05oJb0tjCzhZu5hfp5Q76fdCPPjKneYGcZmOTce8
        p1jPmcQSEFhAO7oMoyxwjjlKQDr/l5Y=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: fix memory node for Sierra Wireless WP8548
Date:   Thu, 21 Oct 2021 01:44:29 +0200
Message-Id: <20211020234431.298310-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define memory node address inside the node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
index a725b73b5a2e..10ad929759ed 100644
--- a/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi
@@ -49,7 +49,7 @@ / {
 	model = "Sierra Wireless WP8548 Module";
 	compatible = "swir,wp8548", "qcom,mdm9615";
 
-	memory {
+	memory@48000000 {
 		device_type = "memory";
 		reg = <0x48000000 0x7F00000>;
 	};
-- 
2.33.0

