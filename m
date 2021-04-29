Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D2536E2AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 02:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbhD2Aie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 20:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhD2Aie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 20:38:34 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83715C06138D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 17:37:47 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id z25-20020a9d65d90000b02902a560806ca7so1310135oth.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 17:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzVBAT7fLNBdUBZLJQxVK1ZVpLgca3IdfSpNyGEzsn0=;
        b=K0KwdJty6MIrAKG+FegIYHm0zfWgr1uKyaUrSLhlh/tDnJMEA2u06pRNJxSe3nflmF
         3/BIhzdwil+l1pDc4/cpnFAoFXp1JbkJBXVXLvAD5s43u0wHo6jbveH5OyeilDC2Y384
         XJbDU6s93q1BtIg7pVuTrew4U1I8Jrwdp13+8ioBhE4CNDKd6fX34brZ5KCSWndJ5y8h
         n8Gy/rJT2Q58MN3032BjCoVissGrJFh9ZxjTh0R4z1E+cI/SGC8eqqBfVMf37WkL0EBk
         /WHIioDg2u9HjdDLbchAe5LuQaWXl2hGyCVQEx9MU9wcVBlbcRUChI/gjJThvugLwLK9
         0YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzVBAT7fLNBdUBZLJQxVK1ZVpLgca3IdfSpNyGEzsn0=;
        b=XqwPccc4JAhYf9Gsc6h7wI985wKRNznx4mNaH6PUcbdD+j+HVGqnL+vL8Z0VnzWwrZ
         R0sTFC041XJ3p1sdT5rGdpSPe6VrImoMsF917H3BABI77et0LHx1MCjJul4swYHnRr/n
         tNU5EWMEH0RsbktPq7mkSfIVT9I/MJbClvX9N+Jggck0tEgB+oID6kXoiytaUiNaG593
         hdGc6bqrOfXsYGo42gKyC0uvmOrnHuXNys7E9zi1BM8WnVG6JmphNBN8v3oubCiSwF0G
         ODvh5bQKxRnszShQ/qNhKsjQ5yOw3qdZMfNnYZRIN7MZqtD20dJ+N393iNxiVqm+OjW/
         z18g==
X-Gm-Message-State: AOAM532xmvG89wJ+2xpLAFwRz4fV9wg2VdS4pArrJlDY7dRatx3a8AvR
        Hb6cLv7Bkhlh3CTB/4QJBTk6MQ==
X-Google-Smtp-Source: ABdhPJyqMG44KHGTxh7hXcyD116UD+IX6SFca2bhJAL4JzBdZXEePILZGpGFFp8CFrGMcVVTJOqMaw==
X-Received: by 2002:a9d:bc3:: with SMTP id 61mr25494742oth.7.1619656666762;
        Wed, 28 Apr 2021 17:37:46 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o64sm314893oif.50.2021.04.28.17.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 17:37:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: spmi-mpp: Add compatible for pmi8994
Date:   Wed, 28 Apr 2021 17:37:51 -0700
Message-Id: <20210429003751.224232-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMI8994 has 4 multi-purpose-pins, add a compatible for this hardware
block to the MPP driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

PS. I see that while the related gpio driver was converted to hierarchical IRQ
chips the mpp driver didn't get the same treatment. We should fix this at some
point...

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index 0ba07bc96c55..5363d44cbb74 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -21,6 +21,7 @@ of PMIC's from Qualcomm.
 		    "qcom,pmi8950-mpp",
 		    "qcom,pm8994-mpp",
 		    "qcom,pma8084-mpp",
+		    "qcom,pmi8994-mpp",
 
 		    And must contain either "qcom,spmi-mpp" or "qcom,ssbi-mpp"
 		    if the device is on an spmi bus or an ssbi bus respectively.
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 3c213f799feb..2da9b5f68f3f 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -920,6 +920,7 @@ static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pmi8950-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8994-mpp" },	/* 8 MPP's */
 	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
+	{ .compatible = "qcom,pmi8994-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,spmi-mpp" },	/* Generic */
 	{ },
 };
-- 
2.29.2

