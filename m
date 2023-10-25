Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730407D6371
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbjJYHhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbjJYHgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:36:42 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094A730DA
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:34:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so3707796f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219273; x=1698824073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1uFHDOXASZ5BH047ZzhsjZxg7GSsbR+WOPLJZ6Hp9E=;
        b=UIFW7fQjFrWvorYa6pkiq3xCg3NI3BkCqVC4D1RrHbrsGaJhfh8+c8BlSjexdAWk8i
         bhNbEp+2/R+rQ0CPu4vc/QDEmOY0fJlKA0GerxMeDZIqwNvLmSzhxTLrlodl4tZJdN0g
         RMIhswjrNfgSA6Nip3PRrHWLP69qQcrZKrzfNg6sosaYm9ojUOcLqqB7WvnWcAMewgVn
         6YG0ykT4HIFZKlQ05TKHUymd+f7WGgMtV4dqCCNf8qLGgIVS3AkW1iQPCpHA2nB9N4Mm
         rXFnJk6zcuqAQ4Qu/kuxzTY3BpPFgkiM8di3nv9q54uDBNDI/841AUc/BHlIPg5I6uRE
         9RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219273; x=1698824073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1uFHDOXASZ5BH047ZzhsjZxg7GSsbR+WOPLJZ6Hp9E=;
        b=MXLpPrWJqcMCWJgaecrRXcPSAjBo36wwYFIDo+u3OtRyR3q+f+4TFhDyBHaSB1WsSI
         lKQuP6KfU89fAk4fYDRlFLJymzGQ5SBTjsdLWkm3ad0AZm7e88lvKqKjOIJ7PMA3EyEZ
         ciIy36Wmf/8dtJpKpRjfovalWCYJlCaLWVwKx2B2rZdsSbVGLibeM4VhD5ZEYtNrFO9i
         q4ZUCxiTqE81O+DApFSTgbDWmV+MKfLROEzWHQeilaSX26+rP+wv4T3UtILuS9nYXN1X
         AmNkWmj5JneDMffKaGduD7ttGiTgIBgC1ZoDD2wWOfjTRpsVxTjdVxZUA9YNdWxmZiL5
         w25Q==
X-Gm-Message-State: AOJu0YxWG3+5d+hc1st0CPyLWBYrn1NITtJXzl5v2f3UYpY7VzNYJtlN
        eaSv6+NdRkEx805LUgfGPR/5iA==
X-Google-Smtp-Source: AGHT+IGJnIErfrQCVfiSkmXIczIEjoeTOW46/Ip+i3/h4jKFjegCr2NzuU21K8KRzPu52K3Pt85S0Q==
X-Received: by 2002:adf:fd0b:0:b0:32d:d756:2cc7 with SMTP id e11-20020adffd0b000000b0032dd7562cc7mr10529309wrr.58.1698219273685;
        Wed, 25 Oct 2023 00:34:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d4ac7000000b0032dde679398sm11431392wrs.8.2023.10.25.00.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:34:33 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:34:26 +0200
Subject: [PATCH 4/7] dt-bindings: phy: qcom,snps-eusb2: document the SM8650
 Synopsys eUSB2 PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-phy-v1-4-6137101520c4@linaro.org>
References: <20231025-topic-sm8650-upstream-phy-v1-0-6137101520c4@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-phy-v1-0-6137101520c4@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8xmswTD2ELDmxMqIqnHD3lBOLsWcHOrJVpLKjghNNJU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUCZ4bwlw5KtKD4yj4JPbB3O8CUhPn6Rd+hvv09
 59F2Xy+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFAgAKCRB33NvayMhJ0ZeIEA
 DIE8pSKteDYwap9zVfyGM9gWhGOQ6owg+5EWGZ04w9Zn9jH5ssQ22uwMKNVxWKzFH4ROqf0MZs0p6/
 Km6aG+YiT0VjsKyLXARUyaEB8o9xN3R7bNVGLhiah6pkHObEc8nfU/gvxo+n/2nncRJoW6BGN5WpPq
 xvH21Q1pUHpS/oGLIG5ETE/HlE3IYAh2UHlmm1AZUJtSL6vzmGpflot3puheg6KuGRc3PIJ5IPkrD/
 JC+KvfxtIj/ls/IXY37rPc+snze4AXMqIRaexIOur15z30EmzRhlT4h3+9/s/X90QRWJ5KSrtF+ig3
 0UTyVQJvu5pnGvyp+rownBSKQVas//MM0qa4UkEOqflm4Bx1ifZXcGdv7EYjMXo2basT7TdcCzyAIX
 r+X4LrNTiNTp0MFEeGqq4SZIbyME4lJlFE7eykPZXi5R7evISN1zyP+DUoSYKCQcnk5EW7aSjJ84Sh
 GMcAOHJoJ0DRhBL/x4YfRVpS4OyaEORzhqUwL5eiHoX1G6n8FlWn+uGOjfYlxDVmAfvCknXLOIFbEy
 Cxxi4ULZYtWPBkLapwWC+wmwVjYNpSsFBzf5vsMQEylulruTcvXbQXhaEjlTu7gLiMKxQn7H3rBuyp
 QBHyUkFIrk1e0+qNY0T7fhFPtwLiKolTu2/nEXflxsrLEScRD3zyHM+5yOtA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Synopsys eUSB2 PHY on the SM8650 Platform by using
the SM8550 as fallback.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index c95828607ab6..8f5d7362046c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm8650-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
 

-- 
2.34.1

