Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD574564B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 22:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbhKRVF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:05:56 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36964 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233319AbhKRVFz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:55 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 6427BCADFE;
        Thu, 18 Nov 2021 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269373; bh=hVhf8M1vf/Y7SjzoLmES1H4b9X86FBqukDCU7O27VBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sNAnKr46DkWHRcjSZ88Z0LG2AXaerQPLd7LkLWjypugwTiOUZ0aSG/3v0yk7Sskcz
         JKX7CoeMzhUo1TAElTagDyYbm1fIcMcozA17/HL2S52HPC7kQLfkpZQgONGEPvrX1F
         kc+PETY67XiMrQ/RDqnETj6qjvnCJw0c1Gom7M3s=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: phy: qcom,usb-hs-phy: add MSM8226 compatible
Date:   Thu, 18 Nov 2021 22:02:08 +0100
Message-Id: <20211118210210.160895-5-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for MSM8226 which also uses the USB HS PHY.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
index b3b75c1e6285..6814dccb390c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
@@ -9,6 +9,7 @@ PROPERTIES
                 following:
 
                         "qcom,usb-hs-phy-apq8064"
+                        "qcom,usb-hs-phy-msm8226"
                         "qcom,usb-hs-phy-msm8916"
                         "qcom,usb-hs-phy-msm8974"
 
-- 
2.34.0

