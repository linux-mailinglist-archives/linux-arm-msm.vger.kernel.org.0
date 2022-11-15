Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6522629777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 12:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiKOLbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 06:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiKOLbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 06:31:32 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6214117E2E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:31:31 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l14so23737188wrw.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v8FoH1On1F2wnSoCme92GBkJZmxbbw7MltkC0PFYms=;
        b=fV81m0WSB0Y0qWL64erh+PxRX/0jfKH6EuUYi1t5kjQz8PuFyAd/DioBHcf1HQT1db
         OddtrRrcbbaPvBsbdaXjpnNFSM8I5foNs2TU2VHwWYfJfWJMz3jJWdko60QZC1c9W2+K
         x04Jka6V9I2ds31GZRRI7ZwSHNYHKBUgVHXYO2ZuTlvGyZWXgbWMetK/aWK/O+eNT5SQ
         TTMkr5aMtu0YG3tnX6tWeNIoPYlgqieK07001dSLFGfH+0PoCe+hlvZEmNXP2oOLqKRd
         YYjhFulu7AC/oG076eU0IV4Xc3400GQwJ6NAYXFDu5aowI0gVPXvwjawC5ID9sLV9ZI5
         FcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8v8FoH1On1F2wnSoCme92GBkJZmxbbw7MltkC0PFYms=;
        b=V/Y4kj8/QcDbS+cCekKIWelkwQble13y9ss3oJqFkyvqaf40epva4F8BaByvHarQVO
         x8kLee5D7pmFdQ7mKtJ9Pl0U8CJ3YkuJxHCsGs9MBNG1AmBD4DjV9SBkjc58m38t7Xa+
         Rkdls1LQf5+IP307LmCdnor9UUui9RYR1VlE5aE0XzgBF0JT0PGwjXn2/nTMa2yQ57fo
         DXphR4PX44SazUEtpjRCcQ8p/CybCXYtVoTeGoGR1PKkq08f/h4mUt0eozwm0Mzcet+V
         iJFmGdiYN2r7TXnMkrSP8xLUOqRjUMrOWumwrAW/8xLpKRCXXBzYYSZ+99nF396729UP
         YDUg==
X-Gm-Message-State: ANoB5pnjPnKNIrbTgg5h8PRYZ1uuFm5iDbquTxCaNPFUCfXk82t+qfhY
        cSKuyOmam1fMJfOImQ+TGE18/A==
X-Google-Smtp-Source: AA0mqf4rBCbH8yVrbONUMZtbsOjGvs/+gFwoCFUHPTxOJOfNsDMlOXKvZ7JDtRGqVf/ZjSQQ60BhCg==
X-Received: by 2002:adf:ec8f:0:b0:236:ae0d:e833 with SMTP id z15-20020adfec8f000000b00236ae0de833mr10196617wrn.155.1668511890934;
        Tue, 15 Nov 2022 03:31:30 -0800 (PST)
Received: from zoltan.localdomain ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm12273091wrm.16.2022.11.15.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 03:31:29 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 4/5] dt-bindings: net: qcom,ipa: support skipping GSI firmware load
Date:   Tue, 15 Nov 2022 05:31:18 -0600
Message-Id: <20221115113119.249893-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115113119.249893-1-elder@linaro.org>
References: <20221115113119.249893-1-elder@linaro.org>
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
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index d0f34763b9383..9e81b9ec7cfdd 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -128,10 +128,12 @@ properties:
     enum:
       - self
       - modem
+      - skip
     description:
       Indicates how GSI firmware should be loaded.  If the AP loads
       and validates GSI firmware, this property has value "self".
       If the modem does this, this property has value "modem".
+      Otherwise, "skip" means GSI firmware loading is not required.
 
   modem-init:
     deprecated: true
-- 
2.34.1

