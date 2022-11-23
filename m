Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B8A635AC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236792AbiKWKyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236484AbiKWKyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:54:11 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4AE8FFAE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:18 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u2so20925417ljl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym3WGL/W4jQ1ZP3qhjFNZAcb10WDhi6X47RzwxkW1DQ=;
        b=VlWo9828Mw6MM7KAPhjdx029aBwearctftUAOKcl8BTvg+aN61gOiLAZABvU/lxBsd
         WWf2brV1g5TSvW4SMYP1PLTe5vIOVFQyfq62G/UAKW1e85mxEP8dPm1vpe8dwX1h0qIB
         OsZb/5otYvPucR62nagX5sYDinezaHaDcm3CUcvfMwQxX4eDBmJMIZKwsAhgnuCERDvs
         wtvgK8DZnnIYvu3Bly+1aBmnUpQ7AwA7U+Mdhjexs/EFC1peXrqVUzh/y60zmkD+tiQ5
         BZjn/d3abtaJ4x+kn7Xq+8QGP7FnhNSGAAyN7dEJQDpnZgD7d+8zrY99HbGTg0e5WPm1
         jaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym3WGL/W4jQ1ZP3qhjFNZAcb10WDhi6X47RzwxkW1DQ=;
        b=h0n9EEmXPR8q0ObHZHSEZjJ7IVQJGEcm/AcPSlrrbR0oQAjDzeTgyurrWoqd3mCkmV
         iDWwgZZ35XOBTxh4VfvtmeqWMeFuFYT4/aFMD5sEG8S4DzXPxG897ZbF2Q+oJ47XVNPl
         zsU4qfK+64aX+uEZZV2JTl5zvJoNDUMfy+Kee/QZUcpoWJrXjeWKNZAWNzZxODx3hBYy
         MPz1AWXJKfFPfIiNiaAEtQp97RrNcucgl0wPnfLNSZ9a0JNVsBR5hGc9a+r/VdUTdkXf
         WkPUb989iA1tkpuhoSgySATtGR+1DTtUJthP6rgtjfdqY7sBiXClLHydu8AoMN9osez5
         E1fg==
X-Gm-Message-State: ANoB5pkSAv0+98Y7NY4K8dr0GXGjx+UARkDOMDvvKznt1KRCduLuwtmQ
        keT4SdGioZBUE0DVnW0L+lHLdg==
X-Google-Smtp-Source: AA0mqf7MalKVPbWr/GAFKGm1OeafPE84/vfCuu14OKHdg5q/nlpN4FlnuEUEAN0L4Ibcs5YxB63xvQ==
X-Received: by 2002:a2e:9d4f:0:b0:277:5928:f2fd with SMTP id y15-20020a2e9d4f000000b002775928f2fdmr4488007ljj.239.1669200136856;
        Wed, 23 Nov 2022 02:42:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id n5-20020a05651203e500b00498f570aef2sm2862908lfq.209.2022.11.23.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:42:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/4] dt-bindings: phy: renesas: Document Renesas Ethernet SERDES
Date:   Wed, 23 Nov 2022 12:42:12 +0200
Message-Id: <20221123104215.3414528-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
References: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
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

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Document Renesas Etherent SERDES for R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20221108005500.3011449-2-yoshihiro.shimoda.uh@renesas.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../phy/renesas,r8a779f0-ether-serdes.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml

diff --git a/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
new file mode 100644
index 000000000000..93ab72874228
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,r8a779f0-ether-serdes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Ethernet SERDES
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r8a779f0-ether-serdes
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#phy-cells':
+    description: Port number of SERDES.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779f0-sysc.h>
+
+    phy@e6444000 {
+        compatible = "renesas,r8a779f0-ether-serdes";
+        reg = <0xe6444000 0xc00>;
+        clocks = <&cpg CPG_MOD 1506>;
+        power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+        resets = <&cpg 1506>;
+        #phy-cells = <1>;
+    };
-- 
2.35.1

