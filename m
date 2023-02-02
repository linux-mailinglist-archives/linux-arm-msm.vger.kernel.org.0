Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4893E687E94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbjBBNZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjBBNZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:25:25 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B528F248
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:25:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l8so1380103wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8m91VYv/puejzL5MHZVbxMAIVE7uLqM3nM5Mvkt490=;
        b=hrS+NVJcmJxEOfn3RPLq2dveF8YHZO8VaeMxSgRVyFtndX+Ew87vIZAIxSlXjyS2ee
         r4MNN81WsibhyqQI7ETHy0f+Chms1gyi+uK16nV78C5WdW+QsRvgTWJ3w4S0piunTCS8
         sYckFqhaBr2sUaPRFWItOfaTcb+e39GviWZ2q3ZETOLd9PGq7pX68pbEtOWZfsAVO+bB
         4+Z/wkqX3mCJixPz0Lz+qnAJMFG6c795ckK2dKtrtX6rwZa9jL+9xxxH7nME+niMKwN2
         Fc+O/XzCj+dm5i5m0QphwyeTx9eXQWxxHer2iZydXk3Dk+EYjo9KK23Vrm+mxFOW4eJg
         B+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8m91VYv/puejzL5MHZVbxMAIVE7uLqM3nM5Mvkt490=;
        b=puBSAW+rNMiYljceNzwX8JF0zGJReEM/SizPdrsbK3/4x0Mb4ylZx+8OXkxHbyEVPQ
         3C8DnhkkpolioXWgI/ZvuwzRIlkwFL7ieilwQkXCNN/mqH+g0qBnfuSzCqh+n19ySAY+
         T7WQ5LYeUaFI0HMR82EvGvz9AfcrZ47yuzhKjv2C+upo/Tg+traz/tEXYPCe5CfSQezf
         KGJVzrRCG28KOP5yBd9WmDfM2nVEdeuvnPek4FSE6XDb3irG5vHDvlV0QFKMXOENOR/S
         JIUxaKvVceACBKvajv9J0b83paD8Be9XEVK8YPuIMtqXB1jdpp8jq5BYp0HWiMGPehF/
         FIEw==
X-Gm-Message-State: AO0yUKWwZhFk92+Q3C26T01/1snuASJTLy+xxnA4mC27g+6t9KZZIoux
        wmKLK+AzpfljBLFF1I7AgQ3h8A==
X-Google-Smtp-Source: AK7set+G+wQtSO3rtMGGB8DGu8P4Ka1TkKTHl23T4DSx+skrnYCpDBIePlmEigCVQOtMISpTLbgyGQ==
X-Received: by 2002:a05:600c:4fc3:b0:3db:2252:e50e with SMTP id o3-20020a05600c4fc300b003db2252e50emr5590843wmq.24.1675344318117;
        Thu, 02 Feb 2023 05:25:18 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e22-20020a05600c449600b003db06224953sm4690943wmo.41.2023.02.02.05.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:25:17 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/8] dt-bindings: phy: qcom,qmp-usb: Document SM8550 compatible
Date:   Thu,  2 Feb 2023 15:25:06 +0200
Message-Id: <20230202132511.3983095-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202132511.3983095-1-abel.vesa@linaro.org>
References: <20230202132511.3983095-1-abel.vesa@linaro.org>
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

Add the SM8550 compatible to the list.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---

The v3 version of this patch was here:
https://lore.kernel.org/all/20230126131415.1453741-4-abel.vesa@linaro.org/

Changes since v3:
 * added Rob's A-b tag

Changes since v2:
 * none

Changes since v1:
 * moved to sc8280xp bindings

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 6f31693d9868..ec00fbc06abe 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sm8550-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

