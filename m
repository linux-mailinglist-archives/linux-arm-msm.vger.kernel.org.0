Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E77C427D22
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 21:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhJITeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 15:34:46 -0400
Received: from ixit.cz ([94.230.151.217]:47592 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhJITep (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 15:34:45 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id F41CC20064;
        Sat,  9 Oct 2021 21:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633807967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TU55JJBJNlpFlwMFuR6PiH0LHDk/RiQywEsQxmtcgPQ=;
        b=J+MOw3s0Ro9HUsgKS27nJUJiLXQW6iPD4TDqxxQ2lCeT/LMSlKogLvTsqvCbwxLc80Z9qx
        NaBLPmrmKKh4IE8h+AVrXnx9xA0XND5ks0Wc6rfVPzsp6TfFAn6AcztIAHwb52ow/XWicI
        cXAXVnOwRLSIMtuczPxEQsYObt+cYFI=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH 2/2] ARM: dts: ipq4019-ap.dk01.1-c1: add device compatible in the dts
Date:   Sat,  9 Oct 2021 21:31:02 +0200
Message-Id: <20211009193102.76852-2-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009193102.76852-1-david@ixit.cz>
References: <20211009193102.76852-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Version dk01.1-c1 didn't have compatible specified, which was
causing dt-schema validation warnings.

Remove duplicated and useless board compatible from dtsi between board and device.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts
index 0d92f1bc3a13..ddaa273f72ca 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts
@@ -18,5 +18,5 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ40xx/AP-DK01.1-C1";
-
+	compatible = "qcom,ipq4019-ap-dk01.1-c1", "qcom,ipq4019";
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index c93b2164db44..0c10d9e096db 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -18,7 +18,6 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
-	compatible = "qcom,ipq4019";
 
 	aliases {
 		serial0 = &blsp1_uart1;
-- 
2.33.0

