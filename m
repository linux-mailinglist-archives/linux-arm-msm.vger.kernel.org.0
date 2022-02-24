Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654B84C2BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 13:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbiBXMdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 07:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234398AbiBXMdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 07:33:42 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BFD192F06
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 04:33:12 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v4so1866562pjh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 04:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ndo93wIjxvP8kHvXABnHYUiq6F07JiSbtJBf2BQ08oo=;
        b=BZYuyaV4jmz2dR1NyMZzPD4ZhoiPdfWB/5CClaaUzQhwZw5M9ufL/dcF+OSHfN9XJY
         RKYvoovcWx6cpD3AlhbbuVtZuhNbUTyZhq07db/1IzRc9cD/z0jZJ6xYKQOe9zEBGwh1
         Yo9nW0v1PFDweGcEAna9EOkTPhCqtY/9hyxJvjonbISFD2KLQjNQiazEW+9JlvbBwGYH
         /bY3MLIh2Gueb7RHuQH7k7nSf1OmiRJfiQuKWHg3zTIrns7Ko3UZrxeRsjGxHIDeFvYH
         SQdfE19sEozOwunVDfo1gHFgR1hJ0TYRPkuJqx/zbnfmOai9I9VYjO0f1jzfFszSnhBt
         FIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndo93wIjxvP8kHvXABnHYUiq6F07JiSbtJBf2BQ08oo=;
        b=alhMJoeU06kiawuaUkP8AwjuBimcNUj1fLIS0IaVDhR44LeLLHshkDsnGRyt/XEaZY
         hnzO8ZQqITZjYdmscBejt6OQPWlLAquRoSYbr5g8aF3h+jBLXjXT/onSzsEh8p0H+Ue0
         4Arnu/OlU+dwCjGyMZ3xjb1s6YGQMZwNUjU/2tdyOvtIkIwl9wPpNlk/50BWjgo42kev
         q1Z7E2V/QXE/fzMmLzSCZsuSvJkfcynrQ0xNGcuDc1T2flEc+rCd5E3InhMqGrD/Y5gk
         P6sUIQ1Oy6UPGU/047K8rnd9FZzMsaq0qlBLkeMzZZ4m/fSlNgprpgOUJbx0JSqFX7Y5
         Ww1w==
X-Gm-Message-State: AOAM531xy1+RDTyXZK2WW3M3pRPigFwtdW05ytb7cjtpbzvAfD/JJNMh
        5C5TZDvPx3wwTscDiRbQZrHXU2OFnoCbwQ==
X-Google-Smtp-Source: ABdhPJx3F0jqYy8AAvIIkDv1/khHxroXYxJdxMJUxEBDrXj1JojYslfhxmsN58K8sPwmvtaZBZNJkg==
X-Received: by 2002:a17:902:f647:b0:14f:c37d:34ec with SMTP id m7-20020a170902f64700b0014fc37d34ecmr2350409plg.6.1645705991469;
        Thu, 24 Feb 2022 04:33:11 -0800 (PST)
Received: from localhost.localdomain ([223.179.129.209])
        by smtp.gmail.com with ESMTPSA id ep5-20020a17090ae64500b001bc56af507dsm6237567pjb.47.2022.02.24.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:33:11 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/2] dt-bindings: phy: qcom,qmp: Describe 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
Date:   Thu, 24 Feb 2022 18:02:48 +0530
Message-Id: <20220224123248.67073-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224123248.67073-1-bhupesh.sharma@linaro.org>
References: <20220224123248.67073-1-bhupesh.sharma@linaro.org>
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

Since a few boards based on QCoM qmp phy use the
'vdda-max-microamp' & 'vdda-pll-max-microamp' properties to
describe the ufs phy nodes, add them to the dt-bindings doc as well.

This fixes the following '$ make dtbs_check' warning(s):

sm8350-microsoft-surface-duo2.dt.yaml: phy@1d87000:
  'vdda-max-microamp', 'vdda-pll-max-microamp' do not match any of
   the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 746a929c63bb..a481442c897a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -92,6 +92,14 @@ properties:
     minItems: 1
     maxItems: 3
 
+  vdda-max-microamp:
+    description:
+      Specifies max. load that can be drawn from phy supply.
+
+  vdda-pll-max-microamp:
+    description:
+      Specifies max. load that can be drawn from pll supply.
+
   vdda-phy-supply:
     description:
       Phandle to a regulator supply to PHY core block.
-- 
2.35.1

