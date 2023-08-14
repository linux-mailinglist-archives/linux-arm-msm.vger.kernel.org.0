Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7735977B652
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbjHNKOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236621AbjHNKOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:14:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00D710D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:14:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so566357366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1692008060; x=1692612860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkXTYbxi8WsuAx3brFiN3d9aFfnzOfLnWqXE8pepV8E=;
        b=SW3PgpkMGdRLpwTKiD2cGqxzUT4MRFRGhPbqlmmV1bg9hpAqQ4GiQUFDoj8Ipv2XSA
         U2xu2X4WEY/spbe5GWKQ5tpSOawfizR9yldqvPWA0ZqihXwA6jAP2CF6kukIgDabu6nr
         DJgc6y4Bg05Giv+k3zOOUTbWDQofSs07j181Tykuy8fW/R79mQPdWMoMi9+EjYntMwJz
         /pnRimwEp2P1W4xq3Dp53k/nw9tN24SL2oJ1q/0rZEO/RZWQCW/8KtKsgEzUYiHTTmv7
         T5f8x8+ouQrK1r74zKdFQrVqTWitMrq1tL0x6bzxVtPfDthWyMQMURnmaQqYbQX1szHM
         POqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008060; x=1692612860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkXTYbxi8WsuAx3brFiN3d9aFfnzOfLnWqXE8pepV8E=;
        b=fhIFRWspcx2CknCpcJOn1vE5OiJ7jpRGuYh40f/nofDRT8MRrKlrVrbKvn9mflLW9L
         RboIpA9b8rzKw+JFGmec47oDGogp/BiMWcCJFCdizTp6bfM/pwBUgjt7SSpABP6fUiih
         jl9do+eNspJj4g7wcYmu9NRbrDtwajG9w7e1oMejxO5463aryvflLRpChBZxPohxUBjM
         X5DVFfR6fH4OlBwFiZSr7Glqitiu4A68wqNSvch0CrTnI7aOQNtCW+R8fqsual5uJ4zQ
         kQG1fpn43JQqAI6HFtkebXI6aFbqFMrmdJFcMURfdhvz25RXXiO46YL3EjvQdRKY3Ynd
         WOSQ==
X-Gm-Message-State: AOJu0Yxz/n3x+0ViepGbagv4aSBUag8mijO7KnguU2MQg0ITju35wq4i
        1QjGTEnpmTJZ9NPD9vyUcENDN2etEVCzGj0HJUC8AQ==
X-Google-Smtp-Source: AGHT+IFoHxMBCJ6ihiQY7oKhpRGwHadxLpkZDfkgnb07niT0v85Ddz8JnmeAUkKxzzzYDvSl1egqGA==
X-Received: by 2002:a17:906:30cf:b0:99c:bb4d:f59e with SMTP id b15-20020a17090630cf00b0099cbb4df59emr7476010ejb.63.1692008060084;
        Mon, 14 Aug 2023 03:14:20 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (212095005216.public.telering.at. [212.95.5.216])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b00993a37aebc5sm5472870ejb.50.2023.08.14.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:14:19 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 14 Aug 2023 12:14:13 +0200
Subject: [PATCH v6 1/4] dt-bindings: ufs: qcom: Add reg-names property for
 ICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-dt-binding-ufs-v6-1-fd94845adeda@fairphone.com>
References: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
In-Reply-To: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The code in ufs-qcom-ice.c needs the ICE reg to be named "ice". Add this
in the bindings so the existing dts can validate successfully.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index bdfa86a0cc98..4cc3f8f03b33 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -79,6 +79,11 @@ properties:
     minItems: 1
     maxItems: 2
 
+  reg-names:
+    items:
+      - const: std
+      - const: ice
+
   required-opps:
     maxItems: 1
 
@@ -134,6 +139,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
   - if:
       properties:
@@ -162,6 +169,10 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - reg-names
 
   - if:
       properties:
@@ -190,6 +201,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
     # TODO: define clock bindings for qcom,msm8994-ufshc
 

-- 
2.41.0

