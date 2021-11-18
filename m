Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E384564B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 22:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbhKRVGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:06:06 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36954 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233364AbhKRVF4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:56 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A7DE4CADFF;
        Thu, 18 Nov 2021 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269375; bh=//NLGnbvC246qJGsO6ju7lPD/sC++Pv0JTa54viAtSE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kUswCj6csKemSJ8by6sKFzsv/JnHyPoD9KE/4AXBLlkK2ZtUi1OZxyXj7J0wiDTh1
         +d/aZ/cTP3UFecpALOcrlrET4BX6Q9V8+G7QneMNJG/D8qBzgxY4+3swO0AkNj7bDe
         2bAQMrOJ/dDVqkR6PcgBGDFukg3FgCBKS3vDNcnA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: qcom: apq8026-lg-lenok: enable USB
Date:   Thu, 18 Nov 2021 22:02:10 +0100
Message-Id: <20211118210210.160895-7-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the USB nodes so it becomes usable on the device.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index 4e7a596d6101..1519544029e7 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -253,3 +253,15 @@ reset {
 		};
 	};
 };
+
+&usb {
+	status = "okay";
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};
-- 
2.34.0

