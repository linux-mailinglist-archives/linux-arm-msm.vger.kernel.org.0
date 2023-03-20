Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77946C1715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjCTPLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjCTPLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:11:20 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A7B2BF21
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:06:29 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id i5so1073149eda.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679324784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTaRac2KuzXOfFSAle5BbPdkfj484jnycW56D0T/zoQ=;
        b=r2b5tl1OVPdmCMM0CfCwwrKTT8cPxL7MJDzDXxMgGt4gTPSiR+5cUFz3F4RbnypK25
         oSdfFsHyPbgyMOdLe3q6OkP8uqoHeTu1M0L4rqStxMConPJgQWhXCFihWkc3VXFfhTBH
         +YsiIYt+eTxCFFUulW6jKPQ6JO/kdzFJcTnTa/Rtfu7+3lyE1aFGE1Uyt5KOEx81TJld
         GuVPBRGK1L8PtPU1IcFgLjAM5ZWvx1eJV0hNTvVcLAt0Qxta7f4hBs6I55Fj+3bCK+lQ
         UktsGrafgLKRsyEL1fz+5cVPeNhxCjULtRH5XMk714aUQBrkgatEJ5BC/LTCSiB89rJG
         Nv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679324784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTaRac2KuzXOfFSAle5BbPdkfj484jnycW56D0T/zoQ=;
        b=Iwou2B6cxpKzeGVav2qhh98tao1r91+9ShsX+HiqjE4zkfgwJ7OVDNY8Apchr7T//i
         bQUeEaoKSgGUN4MkWpxMDwnW5d81PeLujnVQK2dwIbiNDYJWrIejSXE1bKxBFgztLSuR
         tnYH5lQA7iipk9M0kW4bkFkAKlYwovbdD/lifbOJH07NQX5w6TfXqTQczIObvDR2osfC
         k6I9JBDj8hdCR5e3X/fa5f+G8w5z6O5g15zANPep06XDe7vXtgCoABw537uhKHMdvVNV
         aiijvJWS76JxHfi9Nr83OH+rH5Z9Aw/lcppFj3Gh3aVowPBHI6RJVkzWovvWFfDpNLGU
         A6wQ==
X-Gm-Message-State: AO0yUKVSbo+pQuKoRXHRnwohfe+2js6pM20r0KA38F1skuoOjzZeobK2
        9J8Dg/BxGKtxVwNSGKRMJFNOkL9A5Fb6U3RfE7k=
X-Google-Smtp-Source: AK7set/p8hBsFhTjeh+z9Qpbdk6f6BDsx4o5/JTnxkMUBW7GVqu1TullPkQd/8LbrvpBQ7n6E/GE+Q==
X-Received: by 2002:a17:906:ca55:b0:92f:48f0:736d with SMTP id jx21-20020a170906ca5500b0092f48f0736dmr10886595ejb.62.1679324783869;
        Mon, 20 Mar 2023 08:06:23 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u27-20020a170906069b00b00923bb9f0c36sm4532795ejb.127.2023.03.20.08.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:06:23 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v5] dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
Date:   Mon, 20 Mar 2023 17:06:17 +0200
Message-Id: <20230320150617.1824465-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The phy pattern property will be used for providing eUSB2 repeater
functionality. This will be modelled as a Qualcomm PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---

Resend of:
https://lore.kernel.org/all/20230208190200.2966723-3-abel.vesa@linaro.org/

Added Krzysztof's R-b tag and Lee's A-b tag.

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 975c30aad23c..f59f1f8cd52f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,6 +137,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#
+
   "pon@[0-9a-f]+$":
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
-- 
2.34.1

