Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA259636335
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 16:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238683AbiKWPU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 10:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238758AbiKWPUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 10:20:11 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51089209B
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:20:09 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id n7so2264128wrr.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evuJlb91MkWi9mnyqw5ELAWZLMaKtxVjaqYPITVH8m8=;
        b=q8lWSQRaAkozvuYkm96lamfPHBmDM7kE59BXXqFuaduhEpfhX4YPutlDqeRl29xF+a
         maLX9RQ3e3o/CAeTK7ZshSnry9c/wELL5fIaEeHpnaZ7ymKs5Zr16qW/p3h55CpyWS/h
         OQX4uIHv34bUTgcV4S9Mi3LO6jTcXBOiJCQ3MXLk16MIs3YNCAfZpYx98fbpLWhXeXwA
         FNl912II7NdQwai2dpCGNcvURngSlTgeKXB144SEBypxbvEc4nQbuEcRTNxfCIS5Po/R
         z/MRYuiL1nLqTUx0S3P0CGJbACTT3M1vJFj6TT1TlKvJb/UzyFsFWhhzQWwdZfrWa1rC
         5hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evuJlb91MkWi9mnyqw5ELAWZLMaKtxVjaqYPITVH8m8=;
        b=m5hSMe6DN/MVIBFTGZMy8JX6REFeRlU72PwAottYRW26NeRp+SZiJV+4wD5Mh9KiC+
         4Ts4AQ167dHBD+27ZH2YjfGqCt8iZ0rRRi1wDsYe8upEBlDdux1R/ka3w8jZ9SZ7F414
         AiOvmi7SjmSsKGZz72+K3ifMkFG1svvWZG9MKGF0QnSc97+1UDxfpuK3ZjN5ExO9PRfB
         pFFQAldHeUr1+nxYheHOl+4HYJTnn3ID8wJu1kJd9KHU6ptBLD4b0elBctQFSnMLZg+W
         f3iaOq1qDJQGpEFO7n6mfUMfQXtC5xARCWrG1/0rtnFZjBo8BZYCoB8YyGGMr79MVxm3
         8ptw==
X-Gm-Message-State: ANoB5pnydxyuPoDNvz/CJ0+F7CyWJAPIllTEoxFx7WGOt5xsozYXZE2G
        xkpbJNS0OtiKvYBIDdboeJqLcA==
X-Google-Smtp-Source: AA0mqf6eOr7P8xwGslYFfqwXuifH2Q5zdA3imuWD8LhzpgXEbTaypERebOGUOHwbXAEBUVWYokkKNA==
X-Received: by 2002:a5d:48c3:0:b0:241:784b:1b7f with SMTP id p3-20020a5d48c3000000b00241784b1b7fmr18076241wrs.38.1669216808260;
        Wed, 23 Nov 2022 07:20:08 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b002366ded5864sm16764914wro.116.2022.11.23.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:20:07 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document i2c pull property
Date:   Wed, 23 Nov 2022 17:19:59 +0200
Message-Id: <20221123152001.694546-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123152001.694546-1-abel.vesa@linaro.org>
References: <20221123152001.694546-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Document the new i2c_pull property introduced for SM8550 setting
an I2C specific pull mode on I2C able pins.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * Added my missing Signed-off-by tag
 * chaged i2c to I2C in qcom,i2c-pull description

 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index e1354f0c64f8..9a809a69bd23 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -77,6 +77,9 @@ $defs:
       input-enable: true
       output-high: true
       output-low: true
+      qcom,i2c-pull:
+        type: boolean
+        description: enable bias pull feature designed for I2C on pin
 
     allOf:
       - $ref: pincfg-node.yaml#
-- 
2.34.1

