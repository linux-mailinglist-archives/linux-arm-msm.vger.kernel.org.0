Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85139435657
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 01:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhJTXTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 19:19:06 -0400
Received: from ixit.cz ([94.230.151.217]:58346 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230331AbhJTXTE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 19:19:04 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id BC22920064;
        Thu, 21 Oct 2021 01:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634771808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ndlHt9/bfNPkwzkrzBQxciwkyqLu306evA1T84tH/zU=;
        b=PHA9z1lXxYmGfWGVJJnmj7Pn+sevK9RjhdwqjWSYh0PrbdsJYcwpk2LvF+DonTdP2xZjnz
        0K+fy8xEj/5ap//QF+CTaS9d4k8s5avBLhanF5sXCFck5Rx6Rba0rbf3TOXwLMzsGBSL66
        tPv3QlPZt9jtMyv6+OSElNdRMbCobMQ=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom: pm8xxx: add pm8018 compatible
Date:   Thu, 21 Oct 2021 01:16:45 +0200
Message-Id: <20211020231646.278706-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing compatible for the PM8018 model.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index 9065ec53e643..2568736701be 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,pm8018
       - qcom,pm8058
       - qcom,pm8821
       - qcom,pm8921
-- 
2.33.0

