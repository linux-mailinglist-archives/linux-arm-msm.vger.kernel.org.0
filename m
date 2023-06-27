Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05DB673F72E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 10:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjF0I2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 04:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjF0I2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 04:28:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561532697
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 01:28:10 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-988a076a7d3so627680466b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687854488; x=1690446488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e68mLZVtnTJQrnAirC4XJAQKjHLzmQfv7r7QLDCXj30=;
        b=1vILM9GRpovAD8dYLESV9CWkwiH+8uo1Pou7xVOyT5XOFN+mRdPGH0/8rvIqFGsdpF
         XUT/Y5ub9mfmqag7qrwKQ3KRdY7NOPWkMXh8k8R5A06ATLySs/MAsgA81PwFBC20NYuQ
         rwlYHfaseUmZaVoK6f67FFNTxABT5019oDEVx+rFJnLiWe52nYMMlH3HxFOtKaAUfiO8
         nh3F/RxJ11jz1T54vrAquVC3V5tATbWyRetC8pRE9CcOgw9MWGNmKbk1oL3gWaRkItei
         0h2ycXdQDwjp46xYKACJxVMBDDvw7viO0+5y1j6XcbcoOFb2fNKpHT3Gi7oGNs/lgJUg
         KHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854488; x=1690446488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e68mLZVtnTJQrnAirC4XJAQKjHLzmQfv7r7QLDCXj30=;
        b=UzycLQRBncE7NiJ+mkN+GEP10DLwZ8xC9bZGXbQHfS9xPJuh5d04ePlbpothHByBQZ
         JkmLtWihG8yl3IDdRZR/hagYZmddgRoY+j/qtI29t2eXJpdO6qkYgKipcy3uvUHbZ4HL
         9SYewtjMg4aGnLShV6tcTJwk3jG1BDUOi62OjFmfSgqv9T9X+8BascMmLrAER8kEt0he
         Gcb436HklDhIlyueQxMIc76dW+ar9sxJ6T67woZHsv2ySi7J1yQ1w3rBFM/XslysQNOM
         QXB8d0r0nZxuTp/KRjaFrOmr+08OZsk0N6/I9bPbNJS2OFlvXBbzmLn3mCPkhSTTPWjD
         50Gw==
X-Gm-Message-State: AC+VfDyBtYLy+K0zXJJOayxoMPR64fi+KrxBFZFeQ721u/oReGF6+zxK
        //YO3HAIWZCu44OJXOEGe1eZ9g==
X-Google-Smtp-Source: ACHHUZ5kpx1oG1MMd3I8ttPTZYgcrZqpBLoAuNLyKlQ9Z9T4RYvBJqarex0cG0DSVtmq2MTtDqOhEw==
X-Received: by 2002:a17:906:da84:b0:988:f307:aea7 with SMTP id xh4-20020a170906da8400b00988f307aea7mr21687857ejb.7.1687854488417;
        Tue, 27 Jun 2023 01:28:08 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b009894b476310sm4253038ejb.163.2023.06.27.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:28:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 27 Jun 2023 10:28:04 +0200
Subject: [PATCH v5 4/5] dt-bindings: crypto: ice: Document sm8450 inline
 crypto engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v5-4-c9a58c0a53f5@fairphone.com>
References: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible used for the inline crypto engine found on
SM8450.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92e1d76e29ee..7da9aa82d837 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 

-- 
2.41.0

