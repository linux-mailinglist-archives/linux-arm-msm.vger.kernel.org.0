Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFF1620419
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbiKGX5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbiKGX5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B5D26AF0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:01 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id t1so7812929wmi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6+k+VnBlUqDvk2kkm8jof+dC2sdOCi6gT/1zjBraSs=;
        b=i8bcjlRLWz2eVfBMXkZ+YP2GXHL+oICNaqk7chAMX1OPwEKT+r2xr+BagAoqefWCle
         Cp57t5oK7tzFmSGPg5BujBFd5C2xazKjfVDVREUg29hAUAuP/Of9NOIiET104ftzW/k6
         9qa78qJG3L4iry45JEQYBRN0iC3WjqCvTVKD617TmcrYi85srsf2Z5U+z+aXcko4Zj4o
         unXqjgpxrbk7JVk3AMaITpUL/CMpI0n9NsylkUSj3PljH+eRTtL/Fc/82xqvreHIz3bS
         8BoXVZW/wUEgyr7ryKuVtRvuvIFIMRdCI302mst4RICl3FXerToMirc2M5rMq9bfh6Az
         bXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6+k+VnBlUqDvk2kkm8jof+dC2sdOCi6gT/1zjBraSs=;
        b=c5siieA8ocSPZ3t30O1CSioQZaQRsm1Uq0Xi46fg2E3HDZdbBmRsRHNpJsTbElJ287
         Mt93iobvKRT7EySXGG4q8TpzY1YdcDNR4cfZHIr8XgIgJW2hRCRqKMdpWBplFwvD/dh6
         v8yeB92U7uZcp5PLAQ0AdoyO7mcqf+v+lu8Izq6ChPd1b1VFt74L1pBe0rJxmd/jb32y
         cOEeHcMnQWtBJGlJPEKN1RQlNg0MkaYYwn/hcF/7FYq/OSqdblZq9CfAOsAxmp/NGsBt
         Tbysgq9a09dZYw/WmoT7C1gvhri2VeMWuW5qHM8wTyqPHKHr9nIJcZ5U8SDXewl2qWGb
         pCiA==
X-Gm-Message-State: ACrzQf2OZAkjVD3H1X7QElBn/AZ9s+LPlOamGOLOSerAOdSgyYyeHdSq
        Y/YFXhZwUM1WNh7+/TTwXN1jxA==
X-Google-Smtp-Source: AMsMyM4BjviatZxI4AXfbI//77GZJxjhD+ZNpWnd4ktfs4CcSRgEUb++H9AvtkRJj7nhqNoH3JXbQA==
X-Received: by 2002:a05:600c:4d86:b0:3cf:7257:ba15 with SMTP id v6-20020a05600c4d8600b003cf7257ba15mr29852243wmp.22.1667865419855;
        Mon, 07 Nov 2022 15:56:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:56:59 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
Date:   Mon,  7 Nov 2022 23:56:39 +0000
Message-Id: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. Mark the supplies as required as was previously the case in the
.txt implementation.

Warnings about missing regulators can be resolved by updating the relevant
dtsi files to point to fixed always-on regulators where appropriate.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..0f7747e55b9be 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -124,6 +124,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vddio-supply:
+    description:
+      Phandle to vdd-io regulator device node
+
+  vdda-supply:
+    description:
+      Phandle to vdda regulator device node
+
 required:
   - compatible
   - reg
@@ -135,6 +147,9 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - ports
+  - vdd-supply
+  - vddio-supply
+  - vdda-supply
 
 additionalProperties: false
 
-- 
2.38.1

