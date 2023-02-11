Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151AD6930AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 12:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjBKLw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 06:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjBKLwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 06:52:36 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6925311FA
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:52:13 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id c1so3525401edt.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
        b=Ws9TMQBBjwg4Bf+XyEsFTANdDjnR52eVQqWllfm/eL6AswidbXnlQJFDHH4YLmfETD
         U3OxqDa/TZbXDxlHMmsZi40sD+HCNDSN34F3xv8sTzXEdmPfYuwUdiWzAWnb61rVQ0xf
         j8B+2w5F3dKIm3fGRFDOHXMjEtM6O+TU1dpWFBhRoB9K2Nv6uCaSb/rotnGu6iYPUOvA
         FuF2RJQaRu2z1CVEicVn07dV6HUMckQrZ67f3T8p84wIYZWVvYQ0Z+IO3oLs3J1l8Jk9
         6ZTftQ2i8DJ9seg2/lTq/0tRRfa1/PJlP2CkPgmbRZ8d5rL8G1g6yB1W82v84ptd3yGh
         gc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
        b=GJ7DgjK+TkunKrF/Pk70vUcx2areYxIf/gI7k0QFZopgqoJDdBsn2OIcGAPMlK3k2T
         7hhprhBivFJY5xACvJnUh4tKU+DV4mT2EKpXZ+14eayiYeI/7l5AEbaEb5SxiiYSqU/j
         UhMj4IjIVqxmnzY6YtKkCQce1nQf/NKebCmk63izFlb01I3GGfdeRuMm1wjC2CfFqgu5
         ELrzBJSg7FGxJJ3UwnalRWwd2wz/7Kt+/BEcsiowuMDvbPUs+xKek0d0O0hwMDap5ubS
         SJQQumfxtm44FO4SvbJVIg2or8u2ZYxvpeRKc1l6HKvKWaNdUTcWu392DTT7QwHsOOIm
         lH7g==
X-Gm-Message-State: AO0yUKV2tLow4ucRWiC4CJEaS7XNMtgzOF0I04Hj8YMH3GSi4ByaOCGv
        4zXeN1/v5UFVFTx1tDCMeqTqiGgXdbFhwtYp
X-Google-Smtp-Source: AK7set8nFD70BQHFMI+e62J+GhDF/grxODnHtEHEYhGYWTRQeWxm2mDUL3KfNlThoD0Bp0JBR/zXtQ==
X-Received: by 2002:a50:9e6e:0:b0:4aa:a709:8aaa with SMTP id z101-20020a509e6e000000b004aaa7098aaamr19205386ede.26.1676116331919;
        Sat, 11 Feb 2023 03:52:11 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 03:52:11 -0800 (PST)
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] dt-bindings: display/msm: dsi-controller-main: Add SM6115
Date:   Sat, 11 Feb 2023 12:51:09 +0100
Message-Id: <20230211115110.1462920-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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

Add a compatible for the DSI on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..f195530ae964 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

