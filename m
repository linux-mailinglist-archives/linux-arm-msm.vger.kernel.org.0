Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9755C01D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 17:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbiIUPlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 11:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbiIUPkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 11:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88881F75
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663774743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7+IfXo3QneUTvZNphDXYsfYPPsR08u+bVDwtrNeIpao=;
        b=ETuq8bGKqbkiMH+XXQKPeUt2oUUbOhSww6uJSoD+kr7lRZ0yzUc9tCfePM2M3vw3alT56q
        AUTe5wIAxrRYHreUgQC1Bq0xf20LsCx7oiiLKP7rTkr+/3tujwJJNAVQksNDJQbbyqOy+Q
        5NdQSiweq86iWfTrFo3axic7S9/2AaA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-vTMYLkulNfCzeUY7E-TXiw-1; Wed, 21 Sep 2022 11:33:00 -0400
X-MC-Unique: vTMYLkulNfCzeUY7E-TXiw-1
Received: by mail-qv1-f70.google.com with SMTP id q5-20020a056214194500b004a03466c568so4519417qvk.19
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 08:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7+IfXo3QneUTvZNphDXYsfYPPsR08u+bVDwtrNeIpao=;
        b=k/fqg3R479k90afUNx2jkr6jYG/N2s0uHqlW6RuvCpujZL7ezVE4HyBQSHUN7MFRIQ
         bl6P8GO6GFobp1eNPcX9Ul60op0ct1+l/2LugKnBe2+nvxR8av+5jNp/zLE0Gd0kxvDw
         2uiQH9aHg4dy0JkfGSx2PKzbLziGTyEdEhJH6Jd+Y+dECz1Tkm0Nn9Vq7ALqtdYhmPBn
         XFJFYwk4QtHJrNKtHk2MMgpiC1+OFz6MT80JCO4fR3m2unaCnP/r11yGlfCDZ69oR+Qz
         ezy5rMwGjwUkbmiWuNw0tn0vut7QtwF5TMrQReThtXFvpwC5K5jYmIVwOkDvnK4KCzKj
         kqWw==
X-Gm-Message-State: ACrzQf2o+0S4r7f/olMkTh7RDJm20z6WTxWmO7Tj6/skE45DyH0ed7Vc
        UtRIABKwuV6rlCORHEIjClyI5d6F+f0/+Me4vCaPgEMwFAPYmy5QW8Bmw0sZ/PZPAbM6jrohE2W
        QrEUDqe1SuwsGl1jLgboq/U5D1w==
X-Received: by 2002:ac8:5895:0:b0:35c:bd1e:aed2 with SMTP id t21-20020ac85895000000b0035cbd1eaed2mr24073983qta.618.1663774380020;
        Wed, 21 Sep 2022 08:33:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5x+IR5tky7En11b9XPJIO6r4GWLMl+xjgqJY4mIPE+hIi/vN1wx8EqtfecainIssiPt2yGDw==
X-Received: by 2002:ac8:5895:0:b0:35c:bd1e:aed2 with SMTP id t21-20020ac85895000000b0035cbd1eaed2mr24073961qta.618.1663774379812;
        Wed, 21 Sep 2022 08:32:59 -0700 (PDT)
Received: from halaneylaptop.redhat.com ([2600:1700:1ff0:d0e0::46])
        by smtp.gmail.com with ESMTPSA id u15-20020a05620a0c4f00b006cf19068261sm2100324qki.116.2022.09.21.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:32:59 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH] dt-bindings: clocks: qcom,gcc-sc8280xp: Fix typos
Date:   Wed, 21 Sep 2022 10:31:56 -0500
Message-Id: <20220921153155.279182-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pipegmux and SuperSpeed are the proper spelling for those terms.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index e33dea86fb9e..b1bf768530a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -33,7 +33,7 @@ properties:
       - description: Primary USB SuperSpeed pipe clock
       - description: USB4 PHY pipegmux clock source
       - description: USB4 PHY DP gmux clock source
-      - description: USB4 PHY sys piegmux clock source
+      - description: USB4 PHY sys pipegmux clock source
       - description: USB4 PHY PCIe pipe clock
       - description: USB4 PHY router max pipe clock
       - description: Primary USB4 RX0 clock
@@ -46,7 +46,7 @@ properties:
       - description: Second USB4 PHY router max pipe clock
       - description: Secondary USB4 RX0 clock
       - description: Secondary USB4 RX1 clock
-      - description: Multiport USB first SupserSpeed pipe clock
+      - description: Multiport USB first SuperSpeed pipe clock
       - description: Multiport USB second SuperSpeed pipe clock
       - description: PCIe 2a pipe clock
       - description: PCIe 2b pipe clock
-- 
2.37.3

