Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B67626B73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 21:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbiKLUHp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 15:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbiKLUH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 15:07:28 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA7E140E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:28 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id r2so4017338ilg.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQMtM7EzKXE7g7Q8ii/1nYLdfGgJeyG5qgm6GFG0MaY=;
        b=Su3MklfMJY8596qFSlI2fMYVrgpgXSRkl7MDteWVnD97GFCt9qVLEfOqMen13UD9F6
         3L5IXY1n9+ZbSmUwWZUSk20mvOdXvMdNkUsH+w22RUejchFD+p2Yhxi8TimgOVA9uTDV
         qphlkjc96DUqQwpTxOeRh5qQb+1zmiE7wusxwDojYsckuyZSfCVemRpzqMc5T3DHrvdy
         6FrbtLcoYBK1D3QVSGn326jqrzllaj9i/U7hZZWlP2ShmXfSa+v3c4mHsknmpTTOc8hG
         NnmrR64LB48M3a4yu7Q5oNiLMFLjqv6cW3bSTFIvXrTlD7nUpjbr6VjwstJVQ/QDIZCT
         2LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQMtM7EzKXE7g7Q8ii/1nYLdfGgJeyG5qgm6GFG0MaY=;
        b=rNgVXbHpDaGNOlAtjA12dIZk7sYKXDXGQqEr8/AF86SKkKBsd3rUZmkUr2GpWn8cAn
         g88bSdS0JYlQvjqPQurd8KEK8ZNqSW64/MhvZkpjFUydD09AGrFAApQI8KiuQw73++SD
         PFH7k7qrlicWlnKrtcfJqX1lhSb1nWgJNMQPjvPbodbPcjpQS/AgbWrFR/Urf0LoaknE
         QQ+EGwCslDf45sZ8ixXCwLwj9SYRbJJdcBXYIkc2yv166oxMhBjjukXaT90TE8mo0lBT
         pDjXzFhYiEXMpfct9xbZPcDIGc6YA7ljRyTDd/Xi7cWxZY2W6Xx4HvGC6wGfs5wRl9pc
         Jwyw==
X-Gm-Message-State: ANoB5plbZibuxwJ/vr+UH2auGqdhbw0ixlqRoMP7NJ69u2wjetK/bRIE
        OkiIXcq4W4QoPMG4ih0SsfKauA==
X-Google-Smtp-Source: AA0mqf6ag5/+UcMBWUwQ6saOw2KQ7ElLnsfR2uCygQZV2sMNJ+qCQmER+pkWO0tak9fKQRJva0CKXg==
X-Received: by 2002:a92:cd0d:0:b0:300:c497:d6a0 with SMTP id z13-20020a92cd0d000000b00300c497d6a0mr3594798iln.27.1668283647907;
        Sat, 12 Nov 2022 12:07:27 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id j28-20020a02cb1c000000b00363dee286edsm2036870jap.60.2022.11.12.12.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 12:07:27 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] dt-bindings: net: qcom,ipa: support skipping GSI firmware load
Date:   Sat, 12 Nov 2022 14:07:16 -0600
Message-Id: <20221112200717.1533622-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112200717.1533622-1-elder@linaro.org>
References: <20221112200717.1533622-1-elder@linaro.org>
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

Add a new enumerated value to those defined for the qcom,gsi-loader
property.  If the qcom,gsi-loader is "skip", the GSI firmware will
already be loaded, so neither the AP nor modem is required to load
GSI firmware.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 0dfd6c721e045..3d63505d1b802 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -128,10 +128,12 @@ properties:
     enum:
       - self
       - modem
+      - skip
     description:
       This indicates how GSI firmware should be loaded.  If the AP loads
       and validates GSI firmware, this property has value "self".  If the
-      modem does this, this property has value "modem".
+      modem does this, this property has value "modem".  Otherwise, "skip"
+      means GSI firmware loading is not required.
 
   modem-init:
     deprecated: true
-- 
2.34.1

