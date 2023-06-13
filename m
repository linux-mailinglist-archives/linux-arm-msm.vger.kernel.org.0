Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102A172DBA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 09:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237868AbjFMH4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 03:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbjFMH4U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 03:56:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B5A10EA
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 00:56:09 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f7368126a6so37993125e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686642967; x=1689234967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFkrWIS5bTgKzqSbTWsL+LQ4FdpiC/6RkXvEbzD8M9A=;
        b=FOPC8kiSlLh+y857Db+MTFNEIH5gexzBwZIgbkhs1QQMN3ZmI84hdzx3vTTs5TI8/C
         pUx9mLGrR2YfIgwSO0XAb0HU1IQjYIrKu1xol3ALq3pvQHTB9GeW4AFKcV7DGhYWODTi
         jZ/W/qky3fVfZNfPYw/F5NB2BExwGzTY1ag06PmgI/ABvB0tTobuDNUL2Gglff/WPeTU
         inL9zHZWMoyt5NL9jtj6wlIUZakgKPGb4UEBZInKZ0k4QFrEXKceoXUPaZcKz8RR3Gi/
         ykG+OH+GtrfTOPmVZlLoQTsZkjB/Xfx5iBVP04nafPGBXxkE9YP3gdqrtyEpIPwPQ6Rd
         lmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642967; x=1689234967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFkrWIS5bTgKzqSbTWsL+LQ4FdpiC/6RkXvEbzD8M9A=;
        b=YeOSi2ZBdU/6TrWlp/RUJwPHw3N72r56DRAW5hKN5ACk7dH57WjzgUV3QsM1Lg4rxq
         GgPqQP1aOv4vGp9Aqf3VmFoy0SlpXeDvp9g2feQIGTpBsEwO6iAkMjuL5vBy0vOUNBfN
         GPpYg12fwnfzPCyxvwiNH/RvJN4pH9CwM5z0JCTKSCmvkgWcmAdxlVLgELD0rlPcAHtf
         mEeStz/9QAEkXT/RDYC2yLMIaNsF7Mpf8DATOhubk9u46diA8QzAHXST4XtUEASITW6T
         0kP+ZC6cFZM9n+h2JUv/fFKFEGHu+cqAJ45t8gOH2I7jg2fYi49v6HRDzODpNskdAepP
         riKA==
X-Gm-Message-State: AC+VfDwdLecApl3XuBrlXu85s7v9QCzQhc2OZUxj2FVjNcGKFbnOQgsr
        aBlO4ZVuPzG/o4GZgxzUMWdttA==
X-Google-Smtp-Source: ACHHUZ4xLB1h2fdCc2fi9RMGZfwhSTAntDX/guJbaSrJZRWdPFElZNFVDVCahRfFLVS+ga/mQLrYhA==
X-Received: by 2002:a7b:ce16:0:b0:3f8:10b2:c758 with SMTP id m22-20020a7bce16000000b003f810b2c758mr5572235wmc.29.1686642967548;
        Tue, 13 Jun 2023 00:56:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c0b5400b003f4266965fbsm13662316wmr.5.2023.06.13.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 00:56:07 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 13 Jun 2023 09:55:54 +0200
Subject: [PATCH v3 1/8] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-type-c-v3-1-22c9973012b6@linaro.org>
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2BYsv45cOvI4rMBwObrYr2vtUKgDMNXxdkhZSI9+W3I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiCERslqlmYTKcm2zhP2O1KPaO3rkmaS+7+l1QDi9
 ViKJcIGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIghEQAKCRB33NvayMhJ0TiMD/
 9m8G/R4Ga9H/Umr4xI0N4kBRmaT0Unmh/JjogJsUKEDByYxTDiikQ6TPyFsamfSEvmQHuzUFid6QMu
 1Lk2vF8DiDgNhARk542FV2JJy7y2cTHHf/Ced9Nv6RGVcdUC1FLGegwx4p/ddld9M/PS1Fbv5BX1L9
 RWCupTQbejZxWq6OHQoE7tJma6G8pUWGmb/O4Fi6rWZq/LrPEaMLJnR/d8MQQ6CSbqHiuEQvUf7QfN
 ryNCo66udfcZ2g3sp09FyNuOtCLvmMGvY3p0NurC2NZzPsnu31/SGbVdu3hnBZy6cqHwxS+XpcvI3V
 J9yxDL2ePF6+ST3BrGti6pS/MxWoWF5PgL/TBVhnKMMeliw7zHevLh3N4b4OOzILZtR7gHnd41UFDd
 N/Byk2IrdN6sWP+cayQzcKFeDFZ9sTlMkdfYAdWUlTVVTeBC+PERMZHQot9Mu1FhaLeLyuN10DAwpe
 5nkJrAtQwKZUCgRbtKgID/vsv224Y5QBkju0tGNsoq0bVo9DMrnzf6wVsbACL/gGcgYsE94Gl5K3ex
 lS/AhxFBzI/6XV5rOvmpnKrdv4P4HVT6NkEY2netY27bfFAI4wQR443TTYWjZqtM6PmfeIe2Se/17g
 epCZ+IHTKK/tvi0l7K69Y66J+zjzHVE7abTeq1GpeBSHRTmCWAfbarAj/bbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some platforms, the Type-C plug orientation is given on a GPIO line.

Document this optional Type-C connector property, and take the
assumption an active level represents an inverted/flipped orientation.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/connector/usb-connector.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index ae515651fc6b..c3884eed6ba4 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -114,6 +114,11 @@ properties:
     description: Set this property if the Type-C connector has no power delivery support.
     type: boolean
 
+  orientation-gpios:
+    description: An input gpio for Type-C connector orientation, used to detect orientation
+      of the Type-C connector. GPIO active level means "CC2" or Reversed/Flipped orientation.
+    maxItems: 1
+
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:

-- 
2.34.1

