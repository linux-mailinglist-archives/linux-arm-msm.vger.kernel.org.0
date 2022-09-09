Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00035B3838
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 14:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiIIMyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 08:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiIIMyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 08:54:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67320102D74
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 05:54:10 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z25so2538561lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=75CorfCsd+9LhpjM0urxQbB572kQdfftYJf3yRFVugE=;
        b=EjrWFSixA3swGXmE4+agZjoTyXw2COYEhdoVGhqoZfFh6dAQUCjjHXNcBWt0Zo6W1Y
         eT3q+OVG/hB8DK7yLi78ryyo6qtzAxB3tBb9vt8779ECIqYgwjbYWYT1VE568HPDw/1v
         WV7e3KpRn2oPhVd2G8TnG0TpDrT+KedlUVu2quyo6IDjszOifo215dAanza1ubv2Efqv
         wLMEHGyDpZqr/r5jUDdaDnKJqx0zg7AD3O7fcO2HgNcg9LpgD+pH14nEuQFnARcFAk4M
         GJ822onSUnJRmYRVXUJa/Gi6WmJd25bxdyFjqDgjJl5ZtnbnfNfwv+snRkhNTnvMGEfa
         iydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=75CorfCsd+9LhpjM0urxQbB572kQdfftYJf3yRFVugE=;
        b=XC7AzftKgYDYnVsT2BgN7x3Nd6JsOHLKeaIATESCNeZoEQVwFLmELU2ws7O39AdP9B
         kxMFp099O1groUQWOiyo+iAH4AJA9az6YMprWWb5bdqoc/C2mbPRdmhv2K7lopEy+Dlx
         zqH1Hc3QclCrWEW5JSBZ7VB5+TFS9yVkBxcfkll2Zbooo6KxRFNlA7aPDKS4P9d/QmPG
         hiboxSFchYZJV3OYEXXhDSSI/i2Ea28LMMpaGcT7Rf2SoeTmcDAWc2gm5A4Q/ySTf/KU
         XIk4to2n3ijt02z0jUtHtXU9slloK/QbyK1KFGNxPnwi0tqZW1tgDuCKrjUAc6pDtD/E
         QfqQ==
X-Gm-Message-State: ACgBeo2xewLYaGp9/5fCs3JwnqYJJtRBKudhHeDLb780fe3omdsDn6ZM
        2zs6RBclO/JLGnVCTBhHdZkusA==
X-Google-Smtp-Source: AA6agR7jxXFuX+Pfxbc5tkTSedio5EIlH8nQEA9HXEU4XdW/wvX1DiiYZpDl7eO5TM4QL54V3hgNUw==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr3703150lfs.472.1662728048697;
        Fri, 09 Sep 2022 05:54:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a2eb0ca000000b00263630ab29dsm64750ljl.118.2022.09.09.05.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:54:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/7] dt-bindings: misc: qcom,fastrpc: correct qcom,nsessions name
Date:   Fri,  9 Sep 2022 14:53:57 +0200
Message-Id: <20220909125403.803158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
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

The property in old TXT bindings, in Linux driver and in DTS is
qcom,nsessions.

Fixes: ed18a9b140bc ("dt-bindings: misc: fastrpc convert bindings to yaml")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fixed commit in Rob's tree.
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index f25924d33fa9..4b4072b6be1c 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -70,7 +70,7 @@ patternProperties:
       reg:
         maxItems: 1
 
-      qcom,nsession:
+      qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
         description: >
-- 
2.34.1

