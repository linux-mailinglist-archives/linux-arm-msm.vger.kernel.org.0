Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717F96F8291
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 14:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjEEMIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 08:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjEEMIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 08:08:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778C31163D
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 05:08:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so2656708a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683288498; x=1685880498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4MyBlhMRNEJ76ND8FNJlKsIqlx5Berxx/rM+PzkENI=;
        b=ImUMzA/W01t8yRDSNaBWijx/h7BS8hCq09w4pFTehFHgg63MhRUdJ1eRUEX5KTXcau
         TdKCOIxuL8P5dWppjNMg9qvbUWcNwtd4ZfG3bDUFbYbYO9ZBd6pCmkjiFTwx3RoFL/Ko
         SxM9qZQN4uhopLERejzvdhXxE4f1utHNZKYeuEVz7qoE3GXcydyj/mlpVvO3v+3rd9As
         hr4eBVhU/LEsPp7X1jOoqiaZpjgC80cgqDtNdS4w5Ty9PVClF/0I8NYDXbpKrOnl2yj/
         JKA2aCWF9A4Ib3/gfoib3u41Qmk96k/fBsTMcuMunG7E3+ML/qsd27G1ypUJz5Wb+Eps
         mnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683288498; x=1685880498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4MyBlhMRNEJ76ND8FNJlKsIqlx5Berxx/rM+PzkENI=;
        b=VPuoPFoNP799mRccjXkcHmA5lvY1dP1E8eUir8H4rLGRGRR2pokjWdWsmz1i7yVq42
         TDd/1h51qcsmSqpkVVTTKKjp0zDWfMOiRfPvMJ47P3HNA5cNmTKJa+zryGG+fs61P4E0
         6l3u7yLHzWZpNSQIgmI37YC+8Ffs2WyxaQNP79nbeD8W7hyqBhXKZdE5YX78QU3Dqxjp
         0mq0M0SfjLVlBQMMNKRUbI3v4toyakA/p8bwlAGcxbsXwpe/kwMmYifoMyqEnT3lzKuR
         zfergfDhFbg8cbRT/ISDSz1xywfhEexsoGLyyAaPYQqApl5FLFZEGCWBykt7Dqjv3bqv
         yyZQ==
X-Gm-Message-State: AC+VfDxef9AdNokgot8ImtlfACd+dOwXJamt/UgWTj8zz6wo/UK4xNuY
        Rt6sLPRN2pb4mK9ZDeZw0RBNMA==
X-Google-Smtp-Source: ACHHUZ7oRezOiA0q3tP14l/JvlAbvxNmEOu/Na6EEdCWy+5j3ZvmDfOZW2tI7OBXv5uBm0JTno5SJw==
X-Received: by 2002:a17:907:7285:b0:953:7e12:838a with SMTP id dt5-20020a170907728500b009537e12838amr964097ejc.67.1683288497933;
        Fri, 05 May 2023 05:08:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id ze16-20020a170906ef9000b00965ec1faf27sm457551ejb.74.2023.05.05.05.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 05:08:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Vincent Shih <vincent.sunplus@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Kumar Thella <sthella@codeaurora.org>,
        Keiji Hayashibara <hayashibara.keiji@socionext.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Peng Fan <peng.fan@oss.nxp.com>
Subject: [PATCH 1/5] dt-bindings: nvmem: mxs-ocotp: drop unneeded address/size-cells
Date:   Fri,  5 May 2023 14:08:10 +0200
Message-Id: <20230505120814.1057152-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Referenced nvmem.yaml schema already defines address/size-cells, so
remove redundant entries and use unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Peng Fan (OSS) <peng.fan@oss.nxp.com>
---
 Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
index 8938eec22b52..a9b822aeaa7e 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
@@ -18,12 +18,6 @@ properties:
       - fsl,imx23-ocotp
       - fsl,imx28-ocotp
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 1
-
   reg:
     maxItems: 1
 
@@ -35,7 +29,7 @@ required:
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

