Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101F45619E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiF3MJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbiF3MI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:59 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE9C286E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l68so6171595wml.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
        b=eUHz07M69XsX41EIdlsP6DW5+h2PJQ2QMgl5OYcPczLU1myyKBoOauaFSW69ZaUJj+
         JDgUCIX+LiWCnbSDRl75ZFRuIDJVvU9FixAE+DFAujVKv4VABC34QWxqJ83yNQL3BSIv
         5gDC8JILomeiFpSG0xQOuGjPLQ/xgVf/UfojGmgq4su8DKjreyYBBycLqUjS5EDXupv8
         0RzAQhSoCMQi4ERVQnsAXb3xSiHqiRVc5BKs9EH/MBNobf74DZjQZdwKDkgAfBYPQS6Z
         8EU1VM7T1UI1ENvPyeRwQ4M9OThqD1MzsDcnXWWLfZholLuz6ET16UGgOdDWRvNYL3ny
         DX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
        b=I+zcNCw+tOgQ2viyxem3ZdmBDyg5BtmaynVlJvwusx3AAgZwpPmqmKbTqKw7CbU+z3
         qQ/4fkNAIj5balv8iqF9u0xa/RoUjnNQxlSvRcOoyIcN0IXnHfi8MunZ5YsGrIL+XEv0
         n4udjrpqa2WlGnxpftvQcsKX1CqBmrZN9chMN9b6BvmjQ2ZaIRbAHIKZOg9FMjTPLXAG
         o7Ny1A1D4a7dMoyPIPOF2+KnLtMmHMd905QT++aAv/pVKV8MkFkqf19j1CmpSdzqgbxj
         u965Heb9Af8wBL4vV77POEyXRx1q6ZOmdcA3GebTvA6rF8s0pmLSNfWAzkTtg3QHe1Sj
         fSPQ==
X-Gm-Message-State: AJIora93hFscHmG1tBaVKPpVwCDjB4w12jyhcywVndztKLvvtwl9FAoV
        K24VP8lWATi5HwrGNRgyFA1ceA==
X-Google-Smtp-Source: AGRyM1s/BaoaFvloTFuVhjoHqSnlJ1Tb0W1qU2Sw/rXvQG/8eapTt6yLmWXi4C2u/YWzGCf4fHt6DQ==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id z2-20020a05600c0a0200b0039dbdf8a4f4mr9528858wmp.201.1656590932987;
        Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Date:   Thu, 30 Jun 2022 13:08:42 +0100
Message-Id: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 91324f0828448..fd9d472437853 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -125,6 +125,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vddio-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vdda-supply:
+    description:
+      Phandle to vdd regulator device node
+
 required:
   - compatible
   - reg
-- 
2.36.1

