Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241AC6E4964
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 15:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbjDQNIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 09:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjDQNH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 09:07:58 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554D0B75E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:06:03 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2fa2fc747easo504067f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681736725; x=1684328725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pN7CHTmhcpk+kvQFe2Qj4nSZeBGIjHXqqKasTb6lhk=;
        b=Bgg3k2q1I4LWyoS114Sz0KymTKA2sEwO4Aef31BG8tNohuz0BdZB2B6nEsGZrY1GEo
         wOL+m/NcuDjyrWBSVrXOiH+20/n5djMM3Dj1qAOIbHSAXzClWaMolmUBcuAsxBtLFHk4
         HfxfOH2gCCClo5PVsp5KjDQEOY9g6s6MYLKtYEtkXErOp5Hxzh7wj5jce0B1LY4YewB+
         eE2pEIyZuyiVlWF7hMpadTMqa+h7dYLiQ/adwFBbZdTwXXm+6wt4KdRNMGo4T8XyxzPG
         gk8CmhFlPuxt4gFWkzqSI0ID94xRb4AU70e6df5XjkEEnTizT1/rtIICx00xrshMzWfP
         0ySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681736725; x=1684328725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pN7CHTmhcpk+kvQFe2Qj4nSZeBGIjHXqqKasTb6lhk=;
        b=eE4dx/+Eq9f5c4MiOL1CUICTyjGIip3kewrY0ksHHQK1+J0jaXD7I6PpFtkuQXRA9g
         VyDhNgDvsyNIczpiKPJnRBPIazc6Z+bKnlho5vXT/7oyGMkhIxFyEpmihnUuS3IbeoWS
         LI4mTWFpbSbxBEEJ60OF4zWIY57Y219EKewU6gNEjB+hY26nWo5DdmUoCt9Q0P9xsvD3
         mQOW6CEBRg730CA+9NxoHhQgtd0KVIq8SObp78VJiMbXnDPvZWufxlnILGc4ve4wsyeb
         ImeUX+0IPs0vQm4XuJP3Q01UJaeodUAJxo7FJa6l46XZdtcJYRoNDXKiSCnRD3izx4g9
         ZPhA==
X-Gm-Message-State: AAQBX9cwn+fnu4PiT/YbdxCEawVXKLW+eg1H1AVUOk8rYsLdURZEtdjN
        H5awF5+8Ao5b64JX6I/GQGYbnA==
X-Google-Smtp-Source: AKy350Ya7/njYFXhgTJTc7VF5jmgWE3WlJqHe1HiKD8ysBAxGWWzpzzvX4+3LSjuaxGp4l/qwi72Uw==
X-Received: by 2002:a5d:4576:0:b0:2f2:501b:bca6 with SMTP id a22-20020a5d4576000000b002f2501bbca6mr6649069wrc.17.1681736725582;
        Mon, 17 Apr 2023 06:05:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002f0075ccf7bsm10509938wrx.71.2023.04.17.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:05:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] dt-bindings: phy: qmp-ufs: fix clock and clock-names for sa8775p
Date:   Mon, 17 Apr 2023 15:05:22 +0200
Message-Id: <20230417130522.401605-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We must set *minItems* to 3, not maxItems as this platform requires
exactly three clocks and maxItems is already set to 3 globally.

Fixes: e5796a9cdf73 ("dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 94c0fab065a8..a1897a7606df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -78,9 +78,9 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 3
+          minItems: 3
         clock-names:
-          maxItems: 3
+          minItems: 3
     else:
       properties:
         clocks:
-- 
2.37.2

