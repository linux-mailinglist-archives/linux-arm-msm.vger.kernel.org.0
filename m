Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBABD5B0E8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 22:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbiIGUuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 16:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiIGUty (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 16:49:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0847A2BB05
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 13:49:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id m3so5099363pjo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=B6Ko3OJsi3My3U394LKzG8EklGxMOFfBOJITDS0awiM=;
        b=Ze1KQOlEPe5reaj0Lf1bTPtHUU6TxiunzPeQO68W1hBBrmEpH4g2XDpQ3IB71q7BQT
         m61B2fWIFP3c0wecBvPmyR9ZJY9Si/4Tsa9bbIy3kZNSe7eaQahqPo42KVLiRpIJk8ds
         3xldO47w4gk1+0/X/lpwjJ/0eqRmZGjrr6RJ5JuUzUeZfuKbFIIYsmMjnTtRXKF4CLSO
         OCDubPZ9KK+xEfO0vL20Wwp5lqnf/k0rBD+sf1EdKp+hzN6EEmdIjfirosSNsPZn0HW3
         bsEN3F5L+sOPt+qkrmuwieiOc3pH7pH4nu4peCYxgrR/7SuC46W/rZ4FRhENStB6/B9U
         uiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=B6Ko3OJsi3My3U394LKzG8EklGxMOFfBOJITDS0awiM=;
        b=aPs6l2Zclz/tclHFI6ijTIc6pb1vBfLmJ1j6q4x5ekz44MyHj6BpjyiTgaZn/jHwIL
         92syBq8ngzK1MLpP8oXV6AxlgnNAMLBgb/Aw8xvM20N+cv+/t46LSk2Dy54fs4i6ALD2
         Jy4qWqZ9MTGH9C1sJ8mXlnBkvjJlOeeIBY4u+geRbjLgBX2oDNuKFeUSiA869ysirL/f
         /ftcJR5SQgHZHVKZuk7BKxvQsAYrpZf1vetJDIX2J3bjYhP4kxnzJWRWPSkSMVoS5633
         SOLWR1Juv5P1rL4MwfNw6UO1uTRJcVEWyCnSYVx0GuLEWcOdXaxzgzLyNHo10GdjBEDo
         DdQQ==
X-Gm-Message-State: ACgBeo1T+TGp0ASVPj8h6VZhJTdn2nDcaH72AwNsgxX/M+qizJwJG+bN
        Dn4V2Gh32GKtRi73WyZvFZ10OA==
X-Google-Smtp-Source: AA6agR6fZmpd7SsPnR7Tq4yoruwuUPK94V6y3bPbEVACKI8POKGjIhcHfPpg2pvJPBPD5GKN9aSDow==
X-Received: by 2002:a17:90b:4f81:b0:1fe:591a:3c04 with SMTP id qe1-20020a17090b4f8100b001fe591a3c04mr386150pjb.66.1662583791270;
        Wed, 07 Sep 2022 13:49:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090301c600b001712c008f99sm12795140plh.11.2022.09.07.13.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:49:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
Subject: [PATCH 3/4] dt-bindings: net: snps,dwmac: Update reg maxitems
Date:   Thu,  8 Sep 2022 02:19:23 +0530
Message-Id: <20220907204924.2040384-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
References: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the Qualcomm dwmac based ETHQOS ethernet block
supports 64-bit register addresses, update the
reg maxitems inside snps,dwmac YAML bindings.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: David Miller <davem@davemloft.net>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2b6023ce3ac1..f89ca308d55f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -94,7 +94,7 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   interrupts:
     minItems: 1
-- 
2.37.1

