Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABD82FE15A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 06:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbhAUDvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 22:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbhAUBob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 20:44:31 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AE3C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:43:31 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id n127so114449ooa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSX1n2LmGUnSPUCHanCJBTkB2czCRGcfIPAiinWQJgE=;
        b=tREtoCdx9NsYJuGx9+Z2lyj3kNpCg8ZrHWx1tOf6kPnCKXzlf+H+QhejDbPr1SZ/KG
         ZIRg5qHVvtL7S3uY2FhF4tl7Wfg5TfihzUxqSuvKZQ77cb9zo3C3EiUVn6aFcsuvmkdW
         p4f9K8UPlEDG990TSW+Vcro1sbOWj9jzdz+dMJoxQIJ/s+Jbciwfi9WcOprmvVlDA0aQ
         bJpBB9RhJoSy3BVcyMHK3p69KBd9/cuFtxLz6VRpa/qLDzL5856vv5ZQyQRTS4X45UTP
         WLnEQN51mxohQSOpU7TWKi0Ny6aK7bIDZaPgW/RWElC6yNXP7aQLmqMqdd165d3YQlMy
         VFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSX1n2LmGUnSPUCHanCJBTkB2czCRGcfIPAiinWQJgE=;
        b=C72Hne53Ve3jx+MwB1rcc/AI1CCb8qOsvsp2ahijwrfO5wNRKGf8tw7tmraJOuyydG
         mwGvDOF+pIWlDvcYBB7OGWTtqDOdHcCdwsTNARa7cGxITTutW5OptjVlkPiLPmZ6ZnBM
         XkaSNh0YW6HM8n6LU9m/QF4rXuUl0idbc/be8LIDX8F59Pm1u/BkokHryOC+8oUWAYcp
         7chhjObr0Tl0odngsGNO0mkp8u/wtKtKVCT0PW50Ac7KjTg2V0YfUTIvv5rHe0VUzmMh
         8AoBtMovEMpnCWVx5RJE5y1SJAoWPGDTYPSNQ+UsAnCptWgAyphdSBQOdiC8X5a6/NKb
         LkHw==
X-Gm-Message-State: AOAM531IjOoR/Kr5riDP19byswE/8Ws4GtEPUuO+2xmRR/yIvAqyp5z3
        CyuNb0wNZkYWdi5Slj4aw9L24Q==
X-Google-Smtp-Source: ABdhPJw2jQUNQiDxA/8xjcg+n41uv7J4DO06g+40CIAeN+QvRB64nFQlAxDzb1veFs1Kol9wtULawQ==
X-Received: by 2002:a4a:e81d:: with SMTP id b29mr8110782oob.22.1611193411431;
        Wed, 20 Jan 2021 17:43:31 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s69sm779032oih.38.2021.01.20.17.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 17:43:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X USB phy
Date:   Wed, 20 Jan 2021 17:43:38 -0800
Message-Id: <20210121014339.1612525-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for the Qualcomm QMP PHY binding for the SuperSpeed USB
phys found in the SC8180x platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e272a1077150..bce85f37a32a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -26,6 +26,7 @@ properties:
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
       - qcom,sc8180x-qmp-ufs-phy
+      - qcom,sc8180x-qmp-usb3-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
-- 
2.29.2

