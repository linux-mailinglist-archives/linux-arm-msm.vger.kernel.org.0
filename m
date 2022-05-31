Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694745398EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244149AbiEaVo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 17:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235317AbiEaVo0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 17:44:26 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1998E8D689;
        Tue, 31 May 2022 14:44:24 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id jx22so29093795ejb.12;
        Tue, 31 May 2022 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0m6WEw+bFPACv7T57ooopwUSIR8iANFIi5UgtU6c/Xo=;
        b=XqbVPl5EyJ6FYukO7Ijtp3ZpXeWxM4xnvPjaOGMuMbYj1GYxCOB016bnvYPo6dTdw7
         po0HnEkfAiccyeGwIElxM+8wounSFq6/dA1PkvrOQQZgMkIrJAqzXoreIQ611PwZixKu
         ByzRaETX/MIgz7Z6WxokiMEo/KOBEtfEeb3k9gt9hiumW85cVBncov2it0nBinlA3AFQ
         putcVIaK2ipuvs6pA8FhNfp7b8pP3OnEQZUmZ5LGBEUN4zWRfyY2NUSUuLAMJVxMJMRY
         UiMCzriCiGERI4rAKsHNNaM4aqwwpxlIMmOAMEFL83x214uxH24ityXn9j1DHcfxTnsh
         AkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0m6WEw+bFPACv7T57ooopwUSIR8iANFIi5UgtU6c/Xo=;
        b=JHGYBnW/OReBLW4RNChXPKP6ZDqRDksYEx9ev3n9g8Xh/IvhikUUmKpHxHw8DEB3zb
         sc2ULu+D9zo0w8rv1ABRdZpWsT6TI8wkEh/3hauBDffkuKKnsSYFZ0rWFId0Cc1syVu1
         a6YcdmFD3L1dgNLlCO5vTLyZOS0K82Ztjjr7wPiurKFHcMI87hrBxBeoC+553kto7zSz
         RChJV6HF+Is/JRSu066iOeuWxweHBpwPjg4nHcCMRiVW7pjJY3he/NtlVm0UhRG0E6mm
         LxY0TxaOw1jjGM85RyqFduOtWfoaCg4GEOjz2cwJDgpOJF7QRupP7BrqSOHfNCvv1Gv9
         iPZg==
X-Gm-Message-State: AOAM531sH1oUef0pWS7rvAfpX8rnGEEKqLRUIbw+fXF/+KnGZzkdcbn1
        Yag29+dTs9tUc6py8OzhdKQ=
X-Google-Smtp-Source: ABdhPJxGBZ0Lk87bORJ5oVR/ehNQ3uIWy8lkK7cwBBvT1D2tE9X1BpLJRI2kYZ6kSXl1VgK+CU0jwg==
X-Received: by 2002:a17:907:9688:b0:6fe:a0e9:ca6f with SMTP id hd8-20020a170907968800b006fea0e9ca6fmr54117127ejc.553.1654033463254;
        Tue, 31 May 2022 14:44:23 -0700 (PDT)
Received: from fedora.robimarko.hr (cpezg-94-253-144-149-cbl.xnet.hr. [94.253.144.149])
        by smtp.googlemail.com with ESMTPSA id u28-20020a50c05c000000b0042dc882c823sm4256319edd.70.2022.05.31.14.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 14:44:22 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: add IPQ8074 PCIe Gen3 PHY binding
Date:   Tue, 31 May 2022 23:44:19 +0200
Message-Id: <20220531214420.916278-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 has 2 different single lane PCIe PHY-s, one Gen2 and one Gen3.
Gen2 one is already supported, document the bindings for the Gen3 one.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e20d9b087bb8..2e33eb527019 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,ipq6018-qmp-pcie-phy
       - qcom,ipq6018-qmp-usb3-phy
+      - qcom,ipq8074-qmp-gen3-pcie-phy
       - qcom,ipq8074-qmp-pcie-phy
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-pcie-phy
@@ -308,6 +309,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq6018-qmp-pcie-phy
+              - qcom,ipq8074-qmp-gen3-pcie-phy
               - qcom,ipq8074-qmp-pcie-phy
     then:
       properties:
-- 
2.36.1

