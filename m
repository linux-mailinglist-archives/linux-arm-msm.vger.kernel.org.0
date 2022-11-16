Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9496462B7FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbiKPK0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbiKPKZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:25:33 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4BBC6F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:25 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so1112420wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=x7py6mi0lPrXpoT/UEU3W14w7Ytzg8VNL85KSYeqwsg=;
        b=dNPG7gu2ThnWowq75sXV4e/n7es/K3g+mYFwCNLTGmIBXhFUDsiEZG5o3gMcFZMeht
         s6SOXozu4XZmye+jOXCckMpNH0sRk65GdYOPhvR1pxL67Cx6ndroRylLxW6e/CqpabPL
         cqMwmfW6VgXT7HTP4+vXNcRpIKsqNGdJ31aJew2D59gQRe4+ubykTqJOB8nhn5rFKn1s
         jLzpHgo/qN3MkYYllIQXYKUh2oPLqROGxnrJ0Hn0VWgpWe48YxXVeY9y8yWOM4WAtw4E
         G7Mi33qDPdxRz2P5BWfEi6hQUimw6EvxR4up/xjhkkvrm5U0ze9PfgN0YqhbMMjBxBAQ
         volg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7py6mi0lPrXpoT/UEU3W14w7Ytzg8VNL85KSYeqwsg=;
        b=T8rv0UNO1TIDyLfzwUNB8oLKYjA7kbshuJkib5qoO795DcKcoAiz+nZVBmKe/IP6WB
         DUvCGBchaXVGUNubhbVOlW12igzx+AQaftD5YQZ2kLMJxpq27r0AvTAbxsJynocvRn9I
         jSyku4rKDW438WvgIiKunqr+gSHDMfZAYO5qv04wXFbCVolWbRKj2TkCHmu4fGUeSmtM
         A18tEaHq98ZZ/U/9bXF996vhJqsw4uWUPBscuv6ZB7MsEliMr9d6ej3GGh6EDv052tC6
         kGA9gkTzGFao/YLTJZ5YcTTLOtHJR72udxTTXHP+sFzaJZuoVau3xuX6Ftow7/2LBYr5
         a8Ag==
X-Gm-Message-State: ANoB5plHM1OuNgePt1fyzyVFbQAhzfF1gEqUE8C5dMuftzF/rZtk4ryf
        1Drz3xtaQ0yjZFok/Pwyh8WbuQ==
X-Google-Smtp-Source: AA0mqf4xiwOJUkEoB007nGLeW9HqkdWpWH3suFDlQCL2ExHsuhb/57tfI6I3NQvc0I/uPHdWkZvlbg==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id x33-20020a05600c18a100b003cfa9d536c7mr1675397wmp.13.1668594189956;
        Wed, 16 Nov 2022 02:23:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i9-20020adfefc9000000b00228dbf15072sm14927047wrp.62.2022.11.16.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:23:09 -0800 (PST)
Subject: [PATCH 0/4] crypto: qcom-qce: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAAu6dGMC/w3MwQqDMAwA0F+RnBdoWgvDv6k1aMFGl8xdxH9fju/ybjDWxgbTcIPyr1k7xEGvAe
 pWZGVsixtiiJGIRpSi3b56yIrW3zkHvE43l46fyshLopRHSiFE8GQuxjhrkbp5I9e+P88fg5YubnUA AAA=
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:23:07 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the necessary bindings and driver changes to enable
the Qualcomm Crypto engine on the SM8550 SoC.

Dependencies:
- https://lore.kernel.org/all/20220920114051.1116441-1-bhupesh.sharma@linaro.org/

--
To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Abel Vesa (1):
      dt-bindings: dma: qcom,bam-dma: Add 'interconnects' and 'interconnect-names'

Neil Armstrong (3):
      dt-bindings: qcom-qce: document clocks and clock-names as optional
      dt-bindings: qcom-qce: document sm8550 compatible
      crypto: qce: core: Add new compatibles for SM8550

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml  | 3 +--
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 8 ++++++++
 drivers/crypto/qce/core.c                               | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 8931ecbe1f2017471608e262dd2914ce376155a4
change-id: 20221114-narmstrong-sm8550-upstream-qce-ed3135413002

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
