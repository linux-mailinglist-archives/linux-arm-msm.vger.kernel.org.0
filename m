Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CD02E14EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 03:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgLWCpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 21:45:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:33207 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729720AbgLWCpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 21:45:24 -0500
X-UUID: 5c9360ec3d7c4b47bc2005e4f9732697-20201223
X-UUID: 5c9360ec3d7c4b47bc2005e4f9732697-20201223
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2109401598; Wed, 23 Dec 2020 10:44:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 10:44:29 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 10:44:34 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 1/4] dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
Date:   Wed, 23 Dec 2020 10:44:26 +0800
Message-ID: <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The constraint of 'maxItem: 1' might be larger than 1, so we modify it
to 'minItem: 0'.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
index 173940930719..f1a26391ffde 100644
--- a/Documentation/devicetree/bindings/spmi/spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
@@ -25,7 +25,7 @@ properties:
     pattern: "^spmi@.*"
 
   reg:
-    maxItems: 1
+    minItems: 0
 
   "#address-cells":
     const: 2
-- 
2.18.0

