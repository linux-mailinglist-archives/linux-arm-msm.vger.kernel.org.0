Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABF855EED7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 08:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbiI2GEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 02:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiI2GEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 02:04:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A6C55A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 23:04:46 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id r8-20020a17090a560800b00205eaaba073so406190pjf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 23:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4d2FbV2v+k8pkkOyvtgQ8O4kNkdXMcAqx/3MgfrD8No=;
        b=btezKBdf8/W9oqSuUOvsWZWJg4mLPONhhGyBfg8+p1Nuiy1nm0FGUrXQenOxPcJDVs
         tZxrO4ow3Hel0xmXte5n1CdjKqTbg3sPxoGpi8iTwZ8HrQSF9Ue1L2+ggDm6et5H7DCA
         xAl7Ysz85tuay4aoUG1plTicSqnSSdrgWawBUXCd/jL+BFSkB2WHg5+RQdgEGg7fDyrx
         b/o1yT7aCSBy4oQ8CP1Pk6qR+LEV3TXu8Gs465OG1tGf+nG3O62TeIt7B+zU0q9ueri2
         0RajYwKAFm3AHo+SrIOr2L4NeI/iT7FG38FCmdROmZ3CzgTTWo8mxBRbPquzl0umrV/3
         04Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4d2FbV2v+k8pkkOyvtgQ8O4kNkdXMcAqx/3MgfrD8No=;
        b=u0y8W/bVJ6cPj1mVEDpW9CDYdIM3jr8hhOwNtXtRTHvdu8ecdKTs9dUEvQpe2Rm/Jb
         uGXxyTyCq0/9kUlNy1Jt3aSAL73MC2LmDw3BxK3smYyyAaJ63f2OxYBD2gzEUKuj9lj8
         Tcy1+jSybToHo4fIAj8aBj9nMjHgazFDS++v52qbvLJtLcH7dlqDDaZPCBMZ+0uVSr66
         1BSC5hl895spMDfIn6GGBu/KrLXItBxl6Ct57CQND+bpi3Nv3ulLX6q++vbp02+ZhXge
         jY/8KYAZLQ8553nkCKZWqmlJQTN9vKKrDaukRk1yl1vCZ9xXHiPnA6JxhG1ynVAzpEJP
         ioJQ==
X-Gm-Message-State: ACrzQf0/Zdl2+uykTrA1dWcqXrx1OMqFhx/19Zs6Mk7XxLSJU0H2YAup
        73uoCb9ZgKfOdIuKvxxgVnvUWw==
X-Google-Smtp-Source: AMsMyM6IwRwptOgN2C+rQqfLSP4Q05e2doSfdZ4qZusOH8V1l03+nsrvQjeWl5D/i0ERNwKw+4vdvg==
X-Received: by 2002:a17:90b:3c87:b0:205:ff7a:9d49 with SMTP id pv7-20020a17090b3c8700b00205ff7a9d49mr3865875pjb.94.1664431485401;
        Wed, 28 Sep 2022 23:04:45 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:3adb:24f8:ac24:2282:1dc7])
        by smtp.gmail.com with ESMTPSA id i1-20020aa796e1000000b00540c3b6f32fsm5037681pfq.49.2022.09.28.23.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 23:04:44 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
Subject: [PATCH v2 0/4] dt-bindings: net: Convert qcom,ethqos bindings to YAML (and related fixes)
Date:   Thu, 29 Sep 2022 11:34:01 +0530
Message-Id: <20220929060405.2445745-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
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

Changes since v1:
------------------
- v1 can be viewed here: https://lore.kernel.org/lkml/20220907204924.2040384-3-bhupesh.sharma@linaro.org/
- Addressed review comments from Krzysztof:
  ~ Updated MAINTAINERS file to point to yaml version of 'qcom,ethqos' dt-bindings.
  ~ Fix yaml bindings related review comments.

This patchset converts the qcom,ethqos bindings to YAML. It also
contains a few related fixes in the snps,dwmac bindings to support
Qualcomm ethqos ethernet controller for qcs404 (based) and sa8155p-adp
boards.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: David Miller <davem@davemloft.net>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Bhupesh Sharma (4):
  dt-bindings: net: snps,dwmac: Update interrupt-names
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml
  MAINTAINERS: Point to the yaml version of 'qcom,ethqos' dt-bindings

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 --------
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 145 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   8 +-
 MAINTAINERS                                   |   2 +-
 4 files changed, 152 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.37.1

