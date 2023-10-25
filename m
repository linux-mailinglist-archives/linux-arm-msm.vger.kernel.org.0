Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB827D64EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbjJYIYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbjJYIYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:24:53 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCB0134
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:24:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40853c639abso39302185e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698222290; x=1698827090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGKLjx3luJGU+DnwzUn3Qi9imxdPkVHML+rqCOmAtck=;
        b=zjEFCpjPjiMWFj5NMiAynlyMlLKIRvst0iDmOzg9EgPLXh4EV04coOih15lqoBQrEK
         ttQvKxYiQYcJKa+lTfAkCY//dcFHhpIVAFcuqduQgt2tI/XWRdTWhBeeOvBWSLfgeE40
         UjCPCRdFJHV7g+5VAgJQiKU2RdQvdzvdxNy9HP6LeixN+bSU8pFeRw23l7SMC8pBt1nC
         7dugkK4sTGA43bpWR2VrzElpRxet6C184ViEcTq5twzasKsPUd1ZCaZ3jiO28ErMaXYV
         SzgokaHLFCYwm0tG3fBa4sJKCA0glMyFzg+KVIjAiBC0K+vBIYPVHODTBgheTXizpHRC
         f5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222290; x=1698827090;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGKLjx3luJGU+DnwzUn3Qi9imxdPkVHML+rqCOmAtck=;
        b=KfS+QdvEZnp7Tk8nkDtNJN9XXSvGiwLBZFSA1bhgDiymJ35VvzNNRot+qd04vw2R0R
         QLrMOCLUyaUx8uDyFqNvT2Pe+xeHzy6WAj1bpP5twAhsxBunwqv9VjQhHleR9nBcZXrN
         TMQYZEinrMwigizaXVLuHj0EvRT3y7GzDLsfykT7XYvu9RjTMZaCvxeuoBiZSIAUf8Fr
         SFKGwVLmgBQAZoo5EghHKxTbTQX7y7OfhN99aBafzfl98R+80ZWGS+nKpcc4NVDSpLKJ
         Th0DuRkNSOkbW8lspeSlZxt1ybN4IIogb8k3H10J9nnze4hgrqAeWZHnlgjd3eSyieVZ
         wEgg==
X-Gm-Message-State: AOJu0YyPyWoEywCo1A4yq9S6Kt6UQUAaFlHm5ZuSiM62B7zJX1Dk+32f
        sub6mshRuTjqEIe5VLZwuJ4LFw==
X-Google-Smtp-Source: AGHT+IF1fnDU4K0NmB//9MEY/ePELmj+DoS0CnDFVDtZz+q/j1bGR7szThAcmbH8mcjSuYmmk78RQg==
X-Received: by 2002:a05:600c:4f12:b0:408:3696:3d51 with SMTP id l18-20020a05600c4f1200b0040836963d51mr11470050wmq.4.1698222289593;
        Wed, 25 Oct 2023 01:24:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id g38-20020a05600c4ca600b004078d71be9csm18470126wmp.13.2023.10.25.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 01:24:49 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 10:24:46 +0200
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: document the SM8650
 Temperature Sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-tsens-v2-1-5add2ac04943@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM3QOGUC/43NTQ6CMBCG4auYrh3DFCjgynsYFvwMMIm0pFOJh
 nB3K/EALt9v8T2bEvJMoq6nTXlaWdjZGPp8Ut3U2JGA+9hKJzrFBA0Et3AHMpcmT+C5SPDUzNC
 y7dmOAkHICmRUZGWVpibTpOLV4mng18Hc69gTS3D+fagrftcfoPP/gBUBIamGvseiRURze7Btv
 Ls4P6p63/cPJRmIatkAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9N+6dBAkFtncfZi6ZHXGSHcpyq1NPV2HQpTLMM/rMdA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlONDQP/i/tc8pCSEDocvWnLw9xNMOPGrYNntZc3ud
 igAfrM+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjQ0AAKCRB33NvayMhJ0acLD/
 9QT27PstMbXQR2gObwx92Dj1/gj3KwZYmClibXzQzQQzgUdgXCp9m/p0QEfHlqW3hhb946wdWWDQw4
 D03iQqBfbultCVlXI0gYt+JSujdCZ55c52+Kwgx/TrmeeGGArTnMqr3PHxyEcho9E2gm3MFQPn6s59
 5ySiCZI3Hst6Bkp1CckuVNibguCtX6W6mN+zuk/MjKXRpHtJSFkIAvpU1hCZ2iBXM9mGqKbHMQ2B3G
 zZhVqXQhCngh/Vmn0lF1qcp7AFCyLiJcSAurukoA98hKDpJxc8HCdel1VzjfElibduwzJVJVpmel0p
 0+118yjMbl7IuH6rw32E6nFGBodjMsz7Q2NCWDy9PKYbwmoPfx67ugxWiNuAoYvhlGL/BsKL7mwX0i
 S3O4Etlf49mcPkruOA/QbhRxlrBDD9sF2USk2/W72THsSkVDa4oQSrPbmaoOjCBqIECTbSubbwPceO
 iVYtRRF5+U56mjD4T9B+ONbvNLAGU8qGuBbMjQ+xvQXZtlnaHzuad3ByZ1ocX9vBsxdIrkQdl8BYtP
 VFC5lz6rG0s6riqRlHKqjwR7WPYCeb2bxemmq3cPXLuEOiHVe1SrB4vxYSkkpo6YGTn496yOJ41x1D
 ucMbdX+tXb0ZCipKRHOj5/ti31oJDJ7nVmI/U9xgDCN58PV5sCAzu5vcC8cA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Temperature Sensor (TSENS) on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
Changes in v2:
- Fixed typo in subject
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-bindings-tsens-v1-1-09fdd17b1116@linaro.org
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 437b74732886..99d9c526c0b6 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -66,6 +66,7 @@ properties:
               - qcom,sm8350-tsens
               - qcom,sm8450-tsens
               - qcom,sm8550-tsens
+              - qcom,sm8650-tsens
           - const: qcom,tsens-v2
 
       - description: v2 of TSENS with combined interrupt

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-tsens-4e748933642e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

