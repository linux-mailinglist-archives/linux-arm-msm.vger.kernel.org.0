Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB3C602FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 17:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiJRP3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 11:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiJRP3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 11:29:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A98D2581
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:28:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s20so23116290lfi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/dijha3PtsBLc1oCRl1z/7+SdFNWj+DBXw7ruAqJvs=;
        b=rSikYmYm+8u2z+yR9sPDioiSvgcn6vlTeUZ7O6VuQRte7vTuBGlzmfUcgMMTyUb26B
         m+PAAjrbsIm3GQcm4PyUAsH+fn9xVCLeHI2QKkwFE921vgKbKi1W4NG30l20x3Sminab
         nuZ9nH5Q3WJJBGy25ClaFIzeG8J17DmgpUVib5MX+EdDLolgDdz4zXGRQVwkMFuqkBIg
         7+yCazZ7paoEsPgTg0SlsH7SofOvqyj4F92uRLsTnQytTIjMamIeI3sggTHCwKscuD6u
         /zkgnewkF+slZZGIG7dGLv1zU8EdTLdJpbZyGzk6g/DPvt85nr3qj7pMF5ThIu5TJN8y
         /WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/dijha3PtsBLc1oCRl1z/7+SdFNWj+DBXw7ruAqJvs=;
        b=3WrmKR2WdJwtOWmoe+2t/tzXkWtIrWQ/dmXe6iLczmQm16VD7SPN96/WXcSMeWZPnb
         SDXSgWVHIgb6YtTryeqr6IJj0QFjgbk6j4wOTacWiaF4Evh9zYIvVodHy7PiN7K3Zoj9
         krKC2fJ8/kOg5DojqGXPsZR2Hb9I0e/E3EAgzUcHNNiY/rVeRcIUGq10OQEct/cXsynP
         E56YYEl7HgHiOSvUFX9+yWRvcSNLRWGUZv4XwbUHwspiU3nH4HRckw0UAjKFBdSD/b3U
         L4BgBVrot4cb7Q4FVXG6dMG24X/Sz9HQ1uk54Tn+uItlP7LmBOaf/sV+/EI8wUbdVUcB
         c8PA==
X-Gm-Message-State: ACrzQf3QJC9AMGGqJntoYLqFrgiIGs4KpnRzxw9kSRyp5P+sQCw4r5Jw
        HJ+u3pzw3fz/e9gWmJEbTrfzlA==
X-Google-Smtp-Source: AMsMyM6likl0/k8cq/AgEcGb2n5alzS6kgOoUdlHeWJuGEX/0ngukQzy6UudE5WjO+wdyB+Fw1hzHw==
X-Received: by 2002:ac2:520b:0:b0:4a2:26d2:be31 with SMTP id a11-20020ac2520b000000b004a226d2be31mr1283316lfl.473.1666106935831;
        Tue, 18 Oct 2022 08:28:55 -0700 (PDT)
Received: from uffe-XPS13.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id a9-20020a05651c030900b0026ddd41aecasm1998617ljp.135.2022.10.18.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:28:55 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: soc: qcom: Update devicetree binding document for rpmh-rsc
Date:   Tue, 18 Oct 2022 17:28:32 +0200
Message-Id: <20221018152837.619426-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018152837.619426-1-ulf.hansson@linaro.org>
References: <20221018152837.619426-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <quic_mkshah@quicinc.com>

The change documents power-domains property for RSC device.
This optional property points to corresponding PM domain node.

Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8450
---
 .../devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
index 4a50f1d27724..b246500d3d5d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
@@ -99,6 +99,9 @@ properties:
       - const: drv-2
       - const: drv-3
 
+  power-domains:
+    maxItems: 1
+
   bcm-voter:
     $ref: /schemas/interconnect/qcom,bcm-voter.yaml#
 
@@ -151,6 +154,7 @@ examples:
                           <SLEEP_TCS   3>,
                           <WAKE_TCS    3>,
                           <CONTROL_TCS 1>;
+        power-domains = <&CLUSTER_PD>;
       };
 
   - |
@@ -197,6 +201,7 @@ examples:
                           <SLEEP_TCS   3>,
                           <WAKE_TCS    3>,
                           <CONTROL_TCS 0>;
+        power-domains = <&CLUSTER_PD>;
 
         clock-controller {
             compatible = "qcom,sm8350-rpmh-clk";
-- 
2.34.1

