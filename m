Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6FF669E16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjAMQ2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjAMQ2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:28:07 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3697D9FF
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:21 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vm8so53466423ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qphHuiI3995fMsqnotERxhZjaBqWPqwflOdlSfg7u7A=;
        b=M0oeeTuTJxcCGIov8N7a9cwJEF4PjtMbQry9x4/Ou4MJXCTqdNMqWZr6QMBzxEvR3Q
         /o2AX3Wgl5g/LLXrR5xx1Eqqlnnnk0xz2r3wX1kagWU0kdGGXqJM5LLjToKoZ0RCg3YS
         p5Mx4oi8ib1cMAX2BoxdZifdW8Wtv+iAXKXUVhSMAFcbIMQ1bkBa12/uDXMOGZDtXUJs
         6bgrTY3h5uXShC9oOArHaau4Ps5tLxOhrV4kDx34vuq/zuMZEhFflJmn6IkLSDPR3YK7
         uoZFUrQs2ipkn6EgPcQCCJ5zTBEiCytplQS/Oi8PB/TWMKUvOo7EkFzetCxVDWC2aaba
         ooNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qphHuiI3995fMsqnotERxhZjaBqWPqwflOdlSfg7u7A=;
        b=1Q71FBlJXFvdRr4uSb2yYi0cPFlR8qM89p/GI1O6i5cPxutGBEAAlj8dCr86XWiGdp
         Tb8M1BYUeFIVDS6ygCOqia9C1ZGK8pTqtp2Z6hZxwjezB9NZnlsOy5mudATbxG3TiRx/
         Xg0FEhrjXfqcBlTEJOwHB5POMpioYqqsRlFZv4T5QoLZnpbRO57AOQVjcRI1HtFT2Aza
         PprD/YDiyKJ//E/7RF2842tRjdt9qMM7h9gB6yRieV3AEa8CqXlmk5YRyD/cHApjK8zj
         ZHANmoMHKCCmBFvEkvjESpGxgvZaTXp/YxM8GJLiA2ZfIWCBEDoxdgox8Cu78/JXof5r
         gNXg==
X-Gm-Message-State: AFqh2kq0iWzbz5fh2+vSqZHY8PWPSfIMSC4wnCdVPdH4xuA0hkvlt7Br
        CiYzSPbxk54K6eStrNJYdImMhQ==
X-Google-Smtp-Source: AMrXdXtz10DQ/GMKG5X8oHVUlAN1dqCKvaugAKT3DKU7zmqlYytG/RBEMle5ksnPhyux6qTtte0urw==
X-Received: by 2002:a17:906:eda2:b0:84d:4712:9c42 with SMTP id sa2-20020a170906eda200b0084d47129c42mr19114978ejb.56.1673626940618;
        Fri, 13 Jan 2023 08:22:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
Date:   Fri, 13 Jan 2023 17:22:13 +0100
Message-Id: <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
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

The "slim-ifc-dev" property should not be just "true", because it allows
any type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 184e8ccbdd13..39b27126cfc1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -28,7 +28,9 @@ properties:
     description: GPIO spec for reset line to use
     maxItems: 1
 
-  slim-ifc-dev: true
+  slim-ifc-dev:
+    description: IFC device interface
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   clocks:
     maxItems: 1
-- 
2.34.1

