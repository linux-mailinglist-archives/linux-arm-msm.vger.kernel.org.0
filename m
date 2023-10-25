Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6B77D6275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjJYH0M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbjJYH0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:26:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C179E1B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:00 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4084095722aso43328095e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218759; x=1698823559; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpJg+hQCE/A7ZI9wI9318MKzsF/xQZI2I1QIsfHxaXA=;
        b=ZfYy7WI/na8cADvnKZoRxi9piDZu8aYYehyCdh9D6L7GZtdjDZ4aR2E79nSvybiRAd
         +560SFcp00CdSP5aJfbqsovo2XkLwiG/L9VHsG3f8eFTK3JGrk+WstFk56bkJ2GYMjVQ
         sy0OmaIntLPtl3DSkW6twK8bPaFwziemPPv6TLHKCUbaR5bow+4KeTdyTwXMoYjvYetA
         Lv5iNzFg90Rw9gshX+4/lL0qugWOCQLT5633WJELdHsoSE2llCJxcvulzXHoR6QqCCfx
         Dg3jpyWCUVBYVeTug3rJxkJK5zllawItrj6AV3FHoCXnefJ25q8j6tSK9VbUrpBgjnsK
         2f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218759; x=1698823559;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpJg+hQCE/A7ZI9wI9318MKzsF/xQZI2I1QIsfHxaXA=;
        b=gm2eEDgG+dAiH6Ked50cB7A33spI9xVl2Sps8XzdSJ5SDZiM+iso1BPrY3eA6VDGFC
         f+WocieoMRsIW4s37xkB3GlSUzZNFZJFoAP4OzrAogGFJmtxK/9DqEOpbLEsmR1f7Ri0
         1/G9KHI6NAiptwa74zFCzaBXGuTPd8+3nU8U2CjV64rNgZumK7jdX8niNKbt4TfPaauQ
         PuJz5OcCjSL/LLVIAVzTwcju+gch80Ci7HOas0L4FFn3JaGCHClrY8IHQE6CEOnVsQfc
         ArOoLVfsIBRhgoVuvVpudxK3+HnznIN5bx5hUHLiLN7VOhztFhlXM/K0ANgFYs49JX3u
         /uxQ==
X-Gm-Message-State: AOJu0Yy4WrEiUORvbNKGyaOC2/kOJl6dB6a573pY2hifbbD6Eacx7/r7
        y4bWtTtIBFp+iYU7IXBtEzLEzDTtnZabxYIH3UJ+Y5ru
X-Google-Smtp-Source: AGHT+IG87Y6Dli8mPszFYD/QVAxAnU1cNlbTQR6OMn4oOXFzpU6RfgSzwCKM11cxxree46B45QH55Q==
X-Received: by 2002:a05:600c:9a5:b0:406:599f:f934 with SMTP id w37-20020a05600c09a500b00406599ff934mr12462934wmp.12.1698218759059;
        Wed, 25 Oct 2023 00:25:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m10-20020adffe4a000000b0032ddc3b88e9sm11513635wrs.0.2023.10.25.00.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:25:58 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:25:55 +0200
Subject: [PATCH] dt-bindings: dma: qcom,gpi: document the SM8560 GPI DMA
 Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-gpi-v1-1-3e8824ae480c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAALDOGUC/x3NQQ6CMBBG4auQWTtJO4YGvYpxUWGo/4LSdMCYE
 O5u4/LbvHeQaYUa3buDqn5gWHODv3Q0vmNOypiaSZxcvfOBt7VgZFuG0Dvei21V48Iv5Ak5Gac
 ClluUPvgwqMzUQqXqjO9/8nie5w9niHjbdAAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=aBNGQVPKxDPbahttPcll6nFTDMrpCcTvmYZ/X1fpajs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMMFj4oH5jxVCYV9uYYhSOIymM9kv6mz5tmyCJdN
 00pA4BaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjDBQAKCRB33NvayMhJ0Y4oD/
 95pAkWaXIzFYBoe4GOlsvccBmL5VRiS/ntXqshARy0Eh97h66O4O1H7pulxzijVwbxfz5j89LCEhdp
 UJAzvyxXvnQXRVj7bowHd1s3YJDK6X9hggUFOoQsvds2sPLOiNpiEjOD1fM5325T4Z5Hyj98mdjOpL
 HWcn0ypXRuSDMLWfQh1DVwdYovglOvlBnmJ3Hkuh1AtnDfKDOJdxUXThxFzxuIZASEfd0wfGcjTCyk
 LqRxcuXxMfmpt8Xn07iS+tqjqjGnjTaCKWpMMsHZQaO/x+vfOXYaoaz3ZprOTLAN1MfJ9rzLuGr/Ve
 ja3z+qN0II0fVtwPipbpFDIGfvTugltEnMDmNDzxTZKv40MlGA8h0zcPDazRkrbW66bX6AMLNBL61X
 zLAhZ5Y4I02ZDw7eR5s+q2UjSR93V9JL1Vjc6zAs9aHqHH+1R4eg+pjunjEPv6KUnv7J2N5VblyVeq
 tDM46ImtHw+148EtlCEZY9Zgl1p12f/AgqGDIvz+PEEOmzdV73oofCeAqUNHMwpaSdTAqErHvRO9zK
 dJZb/Hgh0iGjlUZSCJiO664MVDAjxQe9fwEGcczuhVDhXEf18uESkoUucdCvruv41RfyQGg0AhnPTb
 LMsbNGP7zPCvtFy3ttYeR5FgT8XCHgo2g6jVuI/gcLzYtRjkOLzlSjj3Jjlg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the GPI DMA Engine on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 88d0de3d1b46..0985b039e6d5 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,sm8350-gpi-dma
               - qcom,sm8450-gpi-dma
               - qcom,sm8550-gpi-dma
+              - qcom,sm8650-gpi-dma
           - const: qcom,sm6350-gpi-dma
       - items:
           - enum:

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-gpi-29a256168e2f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

