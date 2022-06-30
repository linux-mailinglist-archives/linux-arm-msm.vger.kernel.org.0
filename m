Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4C15619E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbiF3MI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbiF3MIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87A027CD2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i1so22490324wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
        b=G9TYezs2BVyMSI5iP3ydVLzqZPN+MSs41E34dkS34YlbLY40cOmhgEeszCj+i5s/Vv
         Ct3MMeNKPasAn5Q6ohG3pIuybDlJn5utEkwzrqTLmU08HhfZ2wTpPpWPyuSsVMba6OLS
         WAMIO6Q2Nm/Yun1Rt5iwRbty5Z6oulBqYrii6CaFkl1WkiKDOF0TNrSAEhn9pVRLJWWn
         52WXp6meDdmUsvdu59zaQ/SMt3utJO1eneNe28RhGjCVfynxF9pcCCYQ86PkPrwviUcd
         j1/16OPK5QVMa6NV8z3f2gk7WAETInVw+QsGhjeN0PCcWmcM3iOoxb1zA/szPy8sfThU
         YSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
        b=zQLmpYLYoiXVy89WRaxgUKE8mujz+VhVHaBC1fdEqhJKBv1yc7IB/Dx4EYUsgJjmz8
         6PMJ06QNb3l3JvcXpKiYW20m/4S1m12hFVXkc2/yDhc7Xjfs6Vy5JJFnvVkJI5ZKFMQO
         c+zZoBpiqdjTnbMe5x4hrH2EpyFjlV1serV8Lf27a29ucRWDt0A6jtvfskieYImiYmdn
         2obZIgqeD6pnKZZsQjWx0IaasZQZM1v9pKVrqEy9hMmB/IG3Hemt6Pviw+1BsXmpADyx
         VVA5SiLTBC/xxEg6aMuxAkyVhKbvJJAmQjQO3avdJQAYH2ixRv8hru5D7NiKCcwxltzU
         p2Hw==
X-Gm-Message-State: AJIora+QknK3GwDasG8+uXLbw4yriLNnTHo0EbKp5eOWJt/7ic61M2zn
        m8JZf5p20InUEhk7Rj+uiwP4ng==
X-Google-Smtp-Source: AGRyM1upi8GqB4nIHDZxM1ikxXWYSY3gR29H2HW91/JD1Zxt6I1SnElAyoNb+x7ew2YWHXIKEGFiqA==
X-Received: by 2002:adf:f112:0:b0:21b:c01f:e6c8 with SMTP id r18-20020adff112000000b0021bc01fe6c8mr7784705wro.681.1656590929313;
        Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Date:   Thu, 30 Jun 2022 13:08:39 +0100
Message-Id: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
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

The driver doesn't care about the name of the phy in DTS. msm8916 has since
2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".

There's no reason to have a constraint on the name here, simply to have a
name. Remove the redundant const in favour of maxItems: 1.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 880bfe930830c..717a5d255ffe4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,7 +49,7 @@ properties:
     maxItems: 1
 
   phy-names:
-    const: dsi
+    maxItems: 1
 
   "#address-cells": true
 
-- 
2.36.1

