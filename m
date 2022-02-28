Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94DF4C6C94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236444AbiB1Mbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236481AbiB1Mbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:31:43 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0307523F
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:31:04 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id q11so10568123pln.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8taBKoMDwuBXrBHwHiH7IQw4Wx0rjuJwsRFaSAfes0=;
        b=iVU4B5hQQnLbfh9uaJsINNioVJeu9qJ9TcEDyayPMkGYfnHQsnj5TjNPWq7zcW9mQj
         wkTqI0uRilZ9g2W3bL+R8dmi1FTZgiidlhfSYCIrNjCRU37WcAW2pFK8JHhBuKbRDWfq
         XyN2ws/FAXwbFzpBXFwQ4ESMs9aFxZIDFPXak7w3h4UUfIAwAYi4egcSB4JYMfjx4YC0
         o1IIBPZRgOUG/h157XJ5hdhnYsksLGRHAYb3PRK1EvnRaW8ZFETX8lmzPQ6dkBkP9w7O
         GfIIuR38Bue4XsVtJwtwZhztz4U7xVIbJTuwkRfFQ29DzHfi91DGBzgKAnECnrd2TJcI
         d5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8taBKoMDwuBXrBHwHiH7IQw4Wx0rjuJwsRFaSAfes0=;
        b=DtVndmWwZgEigPUAVtfsTzAEB2NeDAtayscnyBmX0AMfkqpx3GmJ+gFbubJG32IM85
         GJRm+15hcg7lzx6+1/FN2yK9z1os+lHg24pWAWjmbz8OPYFjTN7KgcUIg7r1+fvve+jg
         uXDAw9xeE/MQHyPe0H6XnoGH5ReEsy3divTEbYPoPpHcYB6ZicXG6RJaPbe1lq+Sj72s
         1vjXJ3ZkurxbrAijWMcWWvnXsG06XPN3tNAu14jc9G/Lv/jPT8NW3lzaWwcS+Fs6HDH1
         OswXFRfMXY/MEnUHTRy3VQl8sOwRerynRoROPEsIiEP1StWj3NypQDTfafJZyLk7MUkl
         6unQ==
X-Gm-Message-State: AOAM532rj8O7O77ducjn8Ymt4XXGV1qw9tacRVOtljc7PkmgKI0QcN7V
        ax6VcyJPfEj9HlpeGbqn0mlCMJEvF7i4rQ==
X-Google-Smtp-Source: ABdhPJx7BT+ANOYcgay4P2hv5BH5yYL/PknXIb6f7/pAMVDqdQ6KA+zofh9k3Ds+a74/GA3PCbHtEw==
X-Received: by 2002:a17:902:ce8a:b0:14f:fd0e:e4a4 with SMTP id f10-20020a170902ce8a00b0014ffd0ee4a4mr20601951plg.47.1646051463982;
        Mon, 28 Feb 2022 04:31:03 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id f7-20020a056a0022c700b004f0e9d686dcsm13790001pfj.137.2022.02.28.04.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:31:03 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/8] dt-bindings: phy: qcom,qmp: Describe phy@ subnode properly
Date:   Mon, 28 Feb 2022 18:00:18 +0530
Message-Id: <20220228123019.382037-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the qcom,qmp-phy dt-binding doesn't describe
the 'reg' and '#phy-cells' properties for the phy@ subnode.

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 70e7cd75e173..f8a43acd229a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -115,6 +115,13 @@ patternProperties:
       Each device node of QMP phy is required to have as many child nodes as
       the number of lanes the PHY has.
     properties:
+      reg:
+        minItems: 1
+        maxItems: 6
+
+      "#phy-cells":
+        const: 0
+
       "#clock-cells":
         enum: [ 0, 1, 2 ]
 
-- 
2.35.1

