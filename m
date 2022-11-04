Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566B9619F25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 18:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbiKDRrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 13:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbiKDRrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 13:47:07 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEF165C4
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 10:47:04 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id hh9so3442530qtb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 10:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiDABW7bEARi31X3gQUcFxKWv/mXed0xt7dumJ6D68A=;
        b=rA8hX/JYvwaJS7qnEIt+I4WNmOnKgrxfcICXuoRSTE2ywZCZaqywRYtfB9BbD/wXrx
         yhAe97A3NerR2T0tnWZB0RyJ4jDSfOszfiU+G5su0UxsBd9IJ0qzCVxOdQOIIE9aBOtV
         7DPu2Bfx84jkVdCbrHEMFZfj3wDkrINj2UG0R86GQ5PRX69ZBSwa4TvrY9QpzUAod0c+
         RsZaLbb4VETj0GGddUfSqQfwFcK7d7N59AiR0CkKanyOQssRhH+4AZ0XPL8HSTSHVaV/
         SyhevXHEjbxsGomPcRcRhNumZaOgmuFZEz+Efs0B4l0wIbFvqWqrHRHNOVGPum4R+ld7
         dsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiDABW7bEARi31X3gQUcFxKWv/mXed0xt7dumJ6D68A=;
        b=5t6AJJmPGrxzCr6D+nTJwSPToKKx1LYOy17glkUK2rHR9i/n5QV3J8tAbRm+pRTWKD
         gigeBkGyLiw1OKf5GwPjAeZR3+odP/Ou63Q9arvkkzsDF/TmEYNzcWlUYnScBQqvW5KQ
         psXQgK8f3/IuvlQOtVdIgzpeHaQy/zr/JACUPu+rRwPcb03N6+HQ6mQQ2xKZ1aOK24yt
         zNd+LcFRSvnfNuwV7QIqIZqDg4EohiGo11JDlmPKRTbBJUJk4xoKgQ/cEjTUauHrUtxw
         n+5godirwdsZ67MkkG1acagHmjhWCONL6JqdFtD+Y1SUOsx8aH9/4hnLC0nvT39RiHYf
         H4tg==
X-Gm-Message-State: ACrzQf1kDtdJQG8PA/FkAKFioz0mofe/hYPb5T80Qgi5R3Rxue5dtCSl
        onwxIYrb8Ozga4JDq5WP+14pqw==
X-Google-Smtp-Source: AMsMyM6R8rsHmHQotwudwVXib4QC2wkEzeKAsiRITg8iPH55/0hA0UTXed7JK0ZAR8FQ4W3ZHHVBvg==
X-Received: by 2002:a05:622a:986:b0:3a5:1eca:a7e1 with SMTP id bw6-20020a05622a098600b003a51ecaa7e1mr25382110qtb.350.1667584023477;
        Fri, 04 Nov 2022 10:47:03 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006f84ee3a4f3sm3432908qkp.48.2022.11.04.10.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 10:47:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: clock: qcom,aoncc-sm8250: add missing audio clock
Date:   Fri,  4 Nov 2022 13:46:55 -0400
Message-Id: <20221104174656.123979-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
References: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
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

The SM8250 DTS uses three clocks as input to LPASS AON Clock Controller
(althopugh Linux driver seems not needing it), so document the missing
audio voting clock.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,aoncc-sm8250.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
index 59b0d3f571ef..7f24f640d102 100644
--- a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
@@ -28,11 +28,13 @@ properties:
   clocks:
     items:
       - description: LPASS Core voting clock
+      - description: LPASS Audio codec voting clock
       - description: Glitch Free Mux register clock
 
   clock-names:
     items:
       - const: core
+      - const: audio
       - const: bus
 
 required:
@@ -53,6 +55,7 @@ examples:
       compatible = "qcom,sm8250-lpass-aoncc";
       reg = <0x03380000 0x40000>;
       clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-      clock-names = "core", "bus";
+      clock-names = "core", "audio", "bus";
     };
-- 
2.34.1

