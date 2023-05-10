Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E856A6FD94A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 10:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbjEJI2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 04:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236574AbjEJI2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 04:28:02 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D37772A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 01:27:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3063433fa66so4457393f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683707253; x=1686299253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPBd46P80xS+1BUZgM17eMA1eHmm2ZyT8Ja38yzUEik=;
        b=pzYAdw/RJTLKmnRzX4+7lubU3LWDAxa5+l44vDwNA9SGIoyXLTfnVwSV4LSwaae0+9
         kephxKkSQCqAjknrIauxsfpdE8fNj+09d4ls8Nis2z/gHHzmPpvFCRVQ74h5X2Mt+gPs
         +HdgABSH3VXmuKmygyYSXNKKCG0SbVBqLT5z4MQcEjUKaIHfIYO39ekkqXWQ9auBIB5r
         wSVoNwHytJt5BUpzAOTGdmpRmZdQn5X6xNdkG/alLLU3EuS+qwkPPXyo1WP6EJ3OElNL
         zoeihS5rH3VQvGk+QPappaabMCuZSj7M8+sUD1V5WqBZGaQ9twgzEkEu1UHDA+pZsjvs
         zFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707253; x=1686299253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPBd46P80xS+1BUZgM17eMA1eHmm2ZyT8Ja38yzUEik=;
        b=NjBkzjQozq+FrF1wLcLEEUTBVXMnj652koUtK/PdF9sfBpi2kHenP50AlJ50uLu8YB
         fEeR9rWbaVSKge8RxwxxuLZolJ/tPyTOt64Qi9GAHXcyAWQm3NZ+/JpduSSRL4aMcJcu
         sF6TE8HiPLS6o408NYHbv5tuNXAhmWLy/IaVplcCJvVArZXzF6XhE8PMbDBOYP19Cg4U
         LQi3SbZSisLOXHijwstXlcr+Rv+TdfiN+GIWhn/NVyBCnExXf4vPK6nvLEND2Q1aLy82
         qr273wHUK1X51KcOruewuPKGAUfnSc1wJVTmp8SK+QVd0UTUOQWUb78EW4+JLj2xVRlB
         o0og==
X-Gm-Message-State: AC+VfDwexMLpXj/Fz6FZluxoVe/sI2qujOEPuVFv99OQDqMhundqQJRO
        9/YF7/3H/eGVUpc+wxMu08/KJQ==
X-Google-Smtp-Source: ACHHUZ6KS7DW60kwwwP8RWl3e+ZKtGLcOSPzzkgaLvkfNOp++qhotSxxpgH6E/NbtWeAWkYn9cyzwQ==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id g12-20020a5d46cc000000b003071bbaea61mr11535704wrs.44.1683707253154;
        Wed, 10 May 2023 01:27:33 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d400a000000b00307a3045d65sm4593939wrp.46.2023.05.10.01.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:27:32 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        ob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6] dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
Date:   Wed, 10 May 2023 11:27:25 +0300
Message-Id: <20230510082725.3612903-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phy pattern property will be used for providing eUSB2 repeater
functionality. This will be modelled as a Qualcomm PHY driver.

Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v5 (resend) is here:
https://lore.kernel.org/all/20230320150617.1824465-1-abel.vesa@linaro.org/

All other patches have been merged already. This is the only one left.

Changes since v5:
 * rebased on top of -next
 * added Krzysztof's R-b tag
 * added Lee's A-b tag

Changes since v4:
 * none

Changes since v3:
 * made this the second patch rather than the first in the series

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 36de335a33aa..abcdc0dd4aba 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -146,6 +146,10 @@ patternProperties:
     type: object
     $ref: /schemas/nvmem/qcom,spmi-sdam.yaml#
 
+  "phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#
+
   "pon@[0-9a-f]+$":
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
-- 
2.34.1

