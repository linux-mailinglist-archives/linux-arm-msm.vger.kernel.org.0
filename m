Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BC658E628
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 06:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiHJEU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 00:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiHJEU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 00:20:27 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28A64F6BB
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 21:20:26 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id f3-20020a9d0383000000b00636d99775a2so6193459otf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 21:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NJ4wYR8zqp67KyZb/vxWvGE2htfMdPrc0+SKyjTL/B8=;
        b=H41UTue3t5ek2dGF5AGZNV/7/59dNzBMFItqwT2SN29PsBBt3MaMIvU3h7/xU/KGl7
         4UWuu+HB83Z3sWkRe+FrMUDm8Ga+Yd4YTL+7zZhoCYq1nTeLugYG93N7tJpRN4JZT07S
         wEpVOH0cjidhprNeDulZYIrJg9HEtJwXLombBLlpgi5kUeCkmDg4dZupyLyvfeCJZbQw
         lZ3I8mUG5D1MmVSziYra9Z17pPCFdm3iWHa83m9aVbIbugVajemCa+MGjlS+urIGzorb
         L0Jji3l5tveiDlZRcpJ9K1v4EaapYo9zUVtYGGmlcqFRq7blFWvi+pTrVm8MJRFzAYr9
         LXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NJ4wYR8zqp67KyZb/vxWvGE2htfMdPrc0+SKyjTL/B8=;
        b=HP2b723sxhqCCWgkqeBQXEJE+5IK6YIPryN7hpW1uk1nGxokWxfzQgOl1w9WkT2tFz
         a89y3HUMFQC37CCadv9jKjmYNTnme8s8EQNxFxalrvKx3klRuXcsggNwT9TRLSvx6Hlr
         Nb8fm3YbAwo2iPU3yb0iPw35FA6389JtGR5mKuixDUmWUugdzsdVnIaUJtfaqETy84Km
         dhsajc5wvq8sfk/tJkirMMx9lGMHykGMaHhOB+lCOeiGUJjc7vp9gIyKZXhoMFBgND4a
         6/OI1YPTy2AhqTuvxA1aU84cQROE6G8EIwdrMEZ7OE/OyRPAg3nQWJPLHigIW1sWCz9u
         w3uw==
X-Gm-Message-State: ACgBeo2TAglwEDeCSsjn28PmzNrcqizt6mfcPmesnHRz+bZyQRj13dXq
        P3cXcGMMaDMP0M8GHNTwR7kCUK1nqcmRcA==
X-Google-Smtp-Source: AA6agR5BED3R3XYzgrBxDgGj6zErXv7+kkqjqui9kOVigQoSbEIPHmIlUXdELbhDtw+sZbcrQDoZNg==
X-Received: by 2002:a05:6830:4493:b0:636:ceb8:91b8 with SMTP id r19-20020a056830449300b00636ceb891b8mr6222330otv.335.1660105226337;
        Tue, 09 Aug 2022 21:20:26 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id ba41-20020a056870c5a900b00101c76f7831sm3622747oab.24.2022.08.09.21.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 21:20:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,qmp: Add compatible for SC8280XP USB phys
Date:   Tue,  9 Aug 2022 21:23:00 -0700
Message-Id: <20220810042303.3583194-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810042303.3583194-1-bjorn.andersson@linaro.org>
References: <20220810042303.3583194-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC8280XP platform has a pair of 5nm USB3 UNI phys and a pair of
5nm USB4/3/DP combo PHYs, add a compatible for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 2 ++
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 220788ce215f..d8a9c205f039 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sc8180x-qmp-ufs-phy
       - qcom,sc8180x-qmp-usb3-phy
       - qcom,sc8280xp-qmp-ufs-phy
+      - qcom,sc8280xp-qmp-usb3-uni-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
@@ -379,6 +380,7 @@ allOf:
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-uni-phy
               - qcom,sm8350-qmp-usb3-uni-phy
+              - qcom,sc8280xp-qmp-usb3-uni-phy
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index b078009ed509..ffc0c5b0f08a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -16,6 +16,7 @@ properties:
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
       - qcom,sc8180x-qmp-usb3-dp-phy
+      - qcom,sc8280xp-qmp-usb43dp-phy
       - qcom,sdm845-qmp-usb3-dp-phy
       - qcom,sm8250-qmp-usb3-dp-phy
   reg:
-- 
2.35.1

