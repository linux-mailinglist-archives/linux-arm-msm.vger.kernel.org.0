Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAE466BD35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 12:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjAPLvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 06:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjAPLvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 06:51:40 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B761BAED
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 03:51:38 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id br9so7072390lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
        b=oj/FU/HJqnk/jAgYBwvaJ2+W69VNOMizNLyF/0WaPTch3jGdAdQJxHpz+PLiNNsFE6
         hcMy2Wn1i62w4NG7coXQ6TeQnQXtN8I7PmK81HVjbKDH4ZakqWGUzdYpQJTcVOx5t8+v
         0l5IVByuyubRTEicnaoAt9MXVfcy/8XQnCp+r897cCt2mZnHD1WIa0Yoq5OwJlH3cf/c
         0xfKYVZqHVzNH79YWByHxL+JVuBC3SWCtQw+X01Tr8FY+g3gU1Dfoofk2V4rCiPBnAbX
         7BSuG6PIm+iucEyr2cR/cvc15NJPr1996rMAKakeZ7pxWcp8r6srcH6YcjvwL0hmoT1p
         2VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
        b=exz0bGPZxW2oEs9yS4gU0EiB/uYWvmfAXPoPjRsc+niy8c4wfD0wsdNlLYGYn7t9wZ
         +mxTcMsVNu4olqKlps/xd1oSL4KnnhtRK0mC5QXDasDlQqEB2fOEAKUeKxFDAkGpzIk8
         w0kYBVXws31qpdmhGY6aZBSeUgk3kRSESUncxIt7fAsmDvpLO2o1R6+Y+ZhqPnA4Fjkz
         HojUEy622K5dLIHKPsGN5J8QDAKTV4THUDbwYeuHF8cGryPh2g6k64R0qdbJwsWBNOcb
         YByYpa6BCLO3o9GdfPipU+4DP7dNFJb8NJ3IHtpdHn799a9dWanht0PWMySqzfrKGr27
         i1Dg==
X-Gm-Message-State: AFqh2kor2+g+ZHrgNnXRcm1Xxl+kNL4mAsP6XCeHX/kfgHIRq8JTRoPv
        NHiSLPqHIZ2y2QTJIOkH5mji+oI4zx4QAwkw
X-Google-Smtp-Source: AMrXdXtfD/BYz/Lr+CotvpV3dJ85ETbEToRFRwov7vQEvMathl0BuERxXo3qGpZjVM3TQU9GgwPizg==
X-Received: by 2002:a05:6512:31d0:b0:4cb:430b:c6c with SMTP id j16-20020a05651231d000b004cb430b0c6cmr16706339lfe.51.1673869896665;
        Mon, 16 Jan 2023 03:51:36 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id m10-20020a056512358a00b004d57d1c6ee7sm162433lfr.248.2023.01.16.03.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:51:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Date:   Mon, 16 Jan 2023 12:51:32 +0100
Message-Id: <20230116115132.348961-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
which is voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9c9184f94c44..8e9031bbde73 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -48,7 +48,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vdds-supply
 
 unevaluatedProperties: false
 
-- 
2.39.0

