Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00413407AD6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Sep 2021 01:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbhIKX3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 19:29:22 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56444 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhIKX3T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 19:29:19 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 2FB0BCB101;
        Sat, 11 Sep 2021 23:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631402885; bh=xc2aI/Mo8Jh+ukvpd+RhhL1/Pz2izYi7zRfKbpzIg5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=l4imMINpyIyl9sg3FaG5yr2vagCMRLGn7JsspAjh2PqYNtDubsRwsmcVlRuMRe0wV
         TDOxEx+PXrmw4zppjtknDr5mmHPpm7RHoPBfdfy+PXO5PRguJgXEnaTVeN0Vpbj88Z
         5GK7gH3o3mm2NfUu1oujyZt3BbWJXV5euT0Ry+9A=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] dt-bindings: firmware: scm: Add compatible for msm8226
Date:   Sun, 12 Sep 2021 01:26:57 +0200
Message-Id: <20210911232707.259615-4-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree compatible for SCM present in msm8226 platform.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index a7333ad938d2..5a90e84b8dcf 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -13,6 +13,7 @@ Required properties:
  * "qcom,scm-ipq806x"
  * "qcom,scm-ipq8074"
  * "qcom,scm-mdm9607"
+ * "qcom,scm-msm8226"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
-- 
2.33.0

