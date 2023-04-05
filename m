Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544326D8298
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 17:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbjDEPvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 11:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239120AbjDEPvH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:51:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC406EAF
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 08:51:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q16so47230440lfe.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680709858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoZW/t2NItn4c5+IARY96OyebrrhmrilS2i/y95RELk=;
        b=S1xQ05RpN0xuL2zhRUG3HJrXGOw12SWrnx2XMG+rj9mmgum/mk+AXF8na+i9idRvzw
         x5faXylMxXxzKRsx8QbQUxmE3HqBb/Omi2TwQgJoXvJxxYrLO9qQiwYBoC87gG4VEKXg
         /Xxhakdq8A2BjmmScoMjvxvxYIm093kW+A9g2iyg+mCvP800DVvWyBYKXMs34ZS00uui
         WSryiWKIk8Am9+o0coX8SbtcjHc9m7Rx9Hqf330y7zZwUnVaqcTtUCBIi0QSH178e6Uh
         UNMuh5JxTKyAMgRmFFN+vG/3vA3Hjiap9TVpL7JbO3XE+q6lDjX0VceGJCl8SakAGJdZ
         ipTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoZW/t2NItn4c5+IARY96OyebrrhmrilS2i/y95RELk=;
        b=o6zWO/S4T1aospvMckudqTWwgOMPuSgeP8ThFN/R7WuAk6j+y2eB6mF+DFmf5Cqrp7
         07UPcPdrcq4XBj0ibQ80jR4FwW9WHNMrf3ZKxn5xREqI/gDsEJUg2bauJyTJYTG4c7zt
         bFpRnoVjcwBjHN9DclQLDcCN9pa69dmfDjHZhxCvaOG5Hc5GFtIgivB9wjsXXYOgsEzL
         AxnHEblV1YgXDT5xGkAtW2XLhGVO5yx0AA3J8nmEpFg9a7yA2qUCW0SC1pJk7JiGqFhU
         z/AdwI/5akCh0b84EQqLVLjGZ98FsLAbm+CxWeSq+E9wGpyOtfvQIZb3i5sP9Q4yO99H
         eCag==
X-Gm-Message-State: AAQBX9fSplEeu0dlQ1D5f2w7ghqvdDuD3sRDsI6S4hJZ9GOpnzqw+TxH
        xQEVDe8F9q6OaCWZbcWkwtERTyBgwrMr+eq0GeE=
X-Google-Smtp-Source: AKy350Y1Bw7EutpOHVvL5IBL1dJieZOl38J+eRPSAGtQCQ4OlkiZWaXHwu2RwepGMJ0EyA8eFdTwZQ==
X-Received: by 2002:ac2:5ed9:0:b0:4e0:fe29:9313 with SMTP id d25-20020ac25ed9000000b004e0fe299313mr1820725lfq.15.1680709857935;
        Wed, 05 Apr 2023 08:50:57 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id o28-20020ac2495c000000b004eb2db994e7sm2869344lfi.239.2023.04.05.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:50:57 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 05 Apr 2023 17:50:31 +0200
Subject: [PATCH v2 2/5] dt-bindings: arm: qcom: Add QRB2210/QCM2290 and RB1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v2-2-dae06f8830dc@linaro.org>
References: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680709854; l=1143;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=e/aVB5KX0++ON0sWAeEBxlEotAP8vaegj0zHbRUzB44=;
 b=GCaSsMsrKx9f3J6VX+j3xO8cxs2hMPCN0xXx9TKY4GezxSoDUXGB0cJdON4CPF2B63ClQaq8i+Cl
 F+Y/O6jrDVoDSKmjheRZI8HYNjKCrjRiv7TAMJIu5zCZGpMlrAal
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document QRB210, a QRB version of QCM2290.

Document QTI Robotics RB1 as a QRB2210 device.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 05badce5fedc..236ea55aee96 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -47,6 +47,8 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcm2290
+        qrb2210
         qdu1000
         qru1000
         sa8155p
@@ -353,6 +355,13 @@ properties:
           - const: swir,wp8548
           - const: qcom,mdm9615
 
+      - description: Qualcomm Technologies, Inc. Robotics RB1
+        items:
+          - enum:
+              - qcom,qrb2210-rb1
+          - const: qcom,qrb2210
+          - const: qcom,qcm2290
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:

-- 
2.40.0

