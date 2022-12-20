Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F384652070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbiLTMgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbiLTMgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:36:41 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F2212613
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y16so11617703wrm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
        b=s9TvukM0HHt40g/oUshz08pAm1Q1CZk37Hc7ZgrtA3pTX4P91kpKacGCvFtDDOoiaq
         Urn5YBNn4KxB1wJO1kdfafpEsrPXw36E4c7WENt6I6mQPmIrZsMnGJTy/rEE7aW8dO0g
         cKHpiKtUnWfHzu9GWeGowNCRfFmI3odBfpK6TsDi8arGXgPQTwpRpnH2DC3V63DAcdtS
         E5s93nHUYDlGSl+M21R13xcFyCdZDMABI+KcM5itdy4YP++wWYgApDgatkGwdHDXIlhZ
         5Q2tGXAd0iZm6sTDHhEURgfRmWR2CPCdQ969Vz/CsMDlyV3YdyehIIx/DY/AaPxk5lnN
         hkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
        b=z/vEzUfxQLl1lEAX5i13DO1nHtFIjdKZQVL3slK+mKAPxgvqMBulox2HeTRMQ9G4GJ
         LmNylBuXKSIwZ3ytbg4exPsVkWbL0IYMejJY1V1z0jmztkUAAJxAaFscyKAIxxdwG/rk
         8LbmOk7DEwVWZHeUR5sL2aFSN0TjluvxWyH181rPJ6i2GAv0mhqdglfvMjMj14lPoTMh
         ehHy4KK9FI0Ws59DTGBuYqL187UqgOnkl5GX3wvg41pOik6nvGYxVLf8qiTQTNuDjQGR
         lrfTD2bHHo+nILm5g/ebTkcFHo1spYMIX2EKrMbSVL3U27rntmQPpVrqN++QVcVN1r4U
         9aEA==
X-Gm-Message-State: ANoB5pnWxqZ+uqQNLAP4HqIUD+fcfhCbyk4KuNoT/138PaVsaOVq1Xe6
        UNPb6Oxj4v4s5bxgpTPOpn2/Gs3t81IfaKEr2EM=
X-Google-Smtp-Source: AA0mqf5FEsKG8y0jl+VlJ7xAJlAbyC8Axb0e+cF5OkY4VbTKZbsDhwKFiVS4XiDLWAZv0WxJaHGpiQ==
X-Received: by 2002:adf:f205:0:b0:242:1809:7e17 with SMTP id p5-20020adff205000000b0024218097e17mr28988045wro.6.1671539798229;
        Tue, 20 Dec 2022 04:36:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/21] dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
Date:   Tue, 20 Dec 2022 12:36:14 +0000
Message-Id: <20221220123634.382970-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f2c143730a551..55bfe1101d6f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -138,7 +138,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

