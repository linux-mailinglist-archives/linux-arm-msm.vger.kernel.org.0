Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B54F7ADA82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 16:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbjIYOvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 10:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjIYOu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 10:50:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D921B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:40 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4050bd2e33aso69265635e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695653439; x=1696258239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqDQqT2DLj9ftb1a+cS59Q82hjk6LlDusCS/om2BnIQ=;
        b=ScfjfFpLK1xKnUr2VTavZyRt4HjBbISxkcUP+bN45bJ/CUucDAkbXOZr6j7kVnrefI
         0T/HzAnC+miNdrwfnhy+4yXMh4gLqtjj5YJrz2rM1Ilq9i0G+5NQGUfVL8crWkTwqZdy
         NApkvONJ1A55PbFPOc+47aKYuXK0zxkk+NejuvMSLF9Gdzgg0FOAlcnaClYYTIVtL4uY
         4YZsy6BAhvjIKA47TG550j+T6Gx+naqjyl1Q7VvSyhsBdR4z0D2CVcYJDubGWt+WNKX+
         XJl9ERrO1PabQrL1Bx0cWXSDSK9a2vdIWGrQWJiKSlq0poPFWXQDOeV6Wuvl7wkjGloL
         JVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653439; x=1696258239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqDQqT2DLj9ftb1a+cS59Q82hjk6LlDusCS/om2BnIQ=;
        b=brKProzwLSjBRfGY4C1O1asuDgYa5QUE2K8py5HyiKK8pOl5TubgE8WC0rphn13haj
         IbQfIyzSvxlMr6b4t63P9FKBEVfJqpSPjtw/jGSQI2Hljo9jk/RTrzsuNCugej7flU8s
         7EvoHC3qHm9xjt/wh818UdifyLokv9JIZMxepuDOPbd8qyZ1yNXabWl8cgedS8faVN0a
         BJs8qTo/zjuSr+C0eDqClAVDGV1J+EqvQWQ/VILPZP2dDpV3zmcmoNVUPL64MkkwLlOc
         IVnBgXNrKf2as7hIyNURnpF6MSvQU2tCPSg8AeJnVRamsTJwL0DYG3UUap8c2tAhuETm
         A7mg==
X-Gm-Message-State: AOJu0YwD3ZPYbugl5gZjUur4rEiQ0yFt38oPolOR/5wKCowhrfxC4iHL
        rlz8CNcI1sJKPh9FnOgQgSDMwA==
X-Google-Smtp-Source: AGHT+IGb3673GOOtKMB73cB0OpDzVMreybHEgPR0HZphki/E0Du6EKRHegiTKTBna0+j64IS3Gi2kg==
X-Received: by 2002:adf:eb84:0:b0:314:dc0:2fca with SMTP id t4-20020adfeb84000000b003140dc02fcamr5633684wrn.29.1695653439086;
        Mon, 25 Sep 2023 07:50:39 -0700 (PDT)
Received: from [10.167.154.1] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:50:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 25 Sep 2023 16:50:31 +0200
Subject: [PATCH v5 02/10] dt-bindings: display/msm/gmu: Allow passing QMP
 handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-2-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3t6V8wanxGXA/i0mTDCvRvjHggKHs3OjhBjkt6x7rlo=;
 b=GoJwpk3Vnxi78DXqBVEHwcY7i3nunpLwnIlz6jJr9Ti3ctmzI5ms3Pb95nenYzkdUPJL4B0HD
 FzG0v1hhsYSCC5QdQyBqa/CbKk4AQMNbfRbzIsJD+5+s0LuZx6TuW9g
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 428eb138881a..4e1c25b42908 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.42.0

