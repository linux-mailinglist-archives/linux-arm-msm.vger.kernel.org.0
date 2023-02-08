Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7DB68F723
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjBHSix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjBHSiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:38:25 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B2C23D83
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:38:20 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v13so21672490eda.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3yGyy6DT/FeiWv3N7O4FaG2s+u8+Q44HOcXWeexoAk=;
        b=xfRxNZKeHqAq1oU4BJxHwtGoudZ6HuAE9yC5MOpJx9KztcjIGoMs+WfcPvAKYNoyX5
         8/7xj+WhEgBtA+DI5pfyFEZERS3xGpSu/ZP7QEzbBLC7Rzcy2gGtQBAX1rk35sflYqUW
         cOWBJHUZNch8RRrPjez/QVcVGPLtSQ2gb4mvsYz1vUBU+mI29NjwJKUuDT+uQv0sdRJy
         3B/yrYhkFklwRy9uNvBN5hQyDZEF0g+JMPGvp6uFIihTH/9ek/bIVpjW+LM7LkyUNFGV
         IE/gDa4G45MOflgy/ECdDIiF/Obw9PmXrYgpbX78EDoi9Dy/glUCvD1C0r26vSfmM3fL
         9tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3yGyy6DT/FeiWv3N7O4FaG2s+u8+Q44HOcXWeexoAk=;
        b=bTxOKtHQv9zoNjuWhpbWnyGFPuPLlAPZ5uGMu85y0jXtHaRL5bKJawvOtPgTBSc3eR
         jEIdkf93yk1ZuBPj62PfXk0SzZHusGkpSKFYQ4yWj9yaK7K9qkciRLGuG3L8nomihbuT
         +3lpQjQ6dvxPY/DC6zz1Am/fC5A7U2kyVE4GT+PstltA17Clxrf+Nlf+IML3v6aTbPIP
         SASDovJsHWvqUeEQE8UHgDun/i+utro4uBVdsoKr3b+WaXM8gkksQ8Bxp874I0O+2ZdE
         2ptPOpZITfy6ZDEerXtFRTAog+KB4fcK8czhPYkX8TtnMFJmsR9grjNqcg++cc1Tv3CQ
         9XCQ==
X-Gm-Message-State: AO0yUKUgibPblwxlIEMJdVqAF3SNOUj9g/FDNXldKEmNEdUP2spoMU2P
        Gd47XsWgoYILDp6uvj+MJXJ2ng==
X-Google-Smtp-Source: AK7set+mt/xEx6HRtJbQVOPA+mpkt0iDASqZdbQ5zXXYmROAGaAnkAVky7plisq5gyQaCUW0doMyNw==
X-Received: by 2002:a05:6402:1d49:b0:4aa:b0e9:84dd with SMTP id dz9-20020a0564021d4900b004aab0e984ddmr10707225edb.3.1675881498827;
        Wed, 08 Feb 2023 10:38:18 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b004aaa8e65d0esm5179663edj.84.2023.02.08.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:38:18 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v9 06/14] dt-bindings: qcom-qce: document optional clocks and clock-names properties
Date:   Wed,  8 Feb 2023 20:37:47 +0200
Message-Id: <20230208183755.2907771-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
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

On newer Qualcomm SoCs the crypto engine clocks are enabled by default
by security firmware. To drop clocks and clock-names from the list of
required properties use 'qcom,sm8150-qce' compatible name.

The change is based on Neil Armstrong's observation and an original change.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml      | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index f6f1759a2f6e..d0f6b830a5dd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -79,11 +79,22 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,crypto-v5.1
+          - qcom,crypto-v5.4
+          - qcom,ipq4019-qce
+then:
+  required:
+    - clocks
+    - clock-names
+
 additionalProperties: false
 
 examples:
-- 
2.33.0

