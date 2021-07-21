Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3D93D1A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhGUWRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 18:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhGUWRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 18:17:37 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0424C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:58:13 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id b18-20020a0568303112b02904cf73f54f4bso619156ots.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVx4Y6jK7u4gxHBBBHFBP67+nRk3zXomiOraC96Tyvs=;
        b=Qt/l/1rkp7SS9H0h/4QZzmgSue+hfJumtgSAUDA8V/QViLEumTazojk2NQZ3e2MzwI
         ccKlnnATH1Yk6gnwUSsyx3XBpUnszE6/4bNGq+XtCQRsj6/HZl4Uzj+eu34s91oqrmlc
         LqWxBt6ceJN4IYRcwC6dMJ2UYJt2wnTQC4zTNHIOMLxTnd0kpWLQjdOJwZykkuGaxWZd
         wbOwzNa6Mr2MdKQ6Z79hQYnEpoY0IwhxH/ixEFRQ5VtHK8BmhmwMHmTpNbjg5fsXpWIA
         J5pb/q3iBl4jeb/rG8KvLskMVvuUKfllOB0voC7oTEUxMJvCbJ88Lw+JmGt9cw9KmgYC
         xpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVx4Y6jK7u4gxHBBBHFBP67+nRk3zXomiOraC96Tyvs=;
        b=a2qPIvsKcMbNQXJPHHQU0mTldVsvqyws7ZZbfIEYX8yBAEvZiCW7dZ2xljKVcm+Mn/
         KkkbULtzhGiyNArWiyO6LCbnvu5dcrJOeFMR623ABEyP1JeHkWfsahEz4DHhRoeW8bSf
         LBmzrAWTLRYH52cTmtj+5t3QelSjjcJyjyfwwXYt/xQC6mqbHF+j/jyFaeARem1V5oYv
         ep6o1lOPeLl6BptYwB/Y1M834SeuTPsSjuHd++4mV0EjLzzogRuxBfN4O7Skakx2c3y5
         CYsQJXz2aBcdRlrZIcZ1AeX56xlDKLzONTc7+5si33ssbx3WoaS9nqGNY3PG7iqTVVQe
         Eeow==
X-Gm-Message-State: AOAM531AK0iM5S/5itzgqSqxF4Rjk4AH17RmIaJmIrSuk3N1dG8LAIIF
        6Qz+uYX7Nysh8w3LP0ParP+BLg==
X-Google-Smtp-Source: ABdhPJztGtSXle/txkOInBta7s9iPfgmNMwmeGcMh31LEFu/WZhvG+ecNlUxR7cpqKndhlt0YxF1kg==
X-Received: by 2002:a9d:4ea:: with SMTP id 97mr28057608otm.324.1626908292956;
        Wed, 21 Jul 2021 15:58:12 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h24sm5035388otl.41.2021.07.21.15.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 15:58:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp-usb3-dp: Add support for sc8180x
Date:   Wed, 21 Jul 2021 15:56:29 -0700
Message-Id: <20210721225630.3035861-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC8180x has two instances of the QMP USB/DP combo PHYs, add a
compatible for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 217aa6c91893..1d49cc3d4eae 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-qmp-usb3-dp-phy
+      - qcom,sc8180x-qmp-usb3-dp-phy
       - qcom,sdm845-qmp-usb3-dp-phy
       - qcom,sm8250-qmp-usb3-dp-phy
   reg:
-- 
2.29.2

