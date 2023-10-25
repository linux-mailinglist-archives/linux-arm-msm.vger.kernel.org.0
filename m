Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17957D6278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjJYH0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjJYH0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:26:33 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2133185
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:29 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32d81864e3fso3570306f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218788; x=1698823588; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFZGMkXUg4RTKKDxNnBfB5PKNPaqSYkfEF3TgYKEoFE=;
        b=PxR5KsL5G6sQqeZs/iXOJFgyShru7+b9idlmaBNMMMJNFze37Rcu7CnK5ohBGcmPvH
         cWBvr9aLTBZCpqE0gHEaxdG/IlLhd1aJzpKdckikDOjd/jM4bJNc+kfmFlkiSR4hG6Iz
         srdNSSSf4g6hHUfg+PyXwv0dUwfUygfpQpRUhlFUTN593VwpWiSHDJEb+ZRmpxymgH0J
         6vfRZzWKP3/9TnlJRvmzmdh0wQF5XG8PGHv9LGSqeyG8vZ+Bd3ueLf+aUcvl+tA7upFu
         GznmadL0WCsJ8CKLS0PXvFqnK07QhM/kY38B1zAE/YFokQbdL7W7VB30z9DwqwulrGP7
         NjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218788; x=1698823588;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFZGMkXUg4RTKKDxNnBfB5PKNPaqSYkfEF3TgYKEoFE=;
        b=vc4Rm06EMSlqdPuA+WSGjnGTPvx3TQvnztroOOls0kQoag5EYXY8rPc0jyc1u1lePu
         fzYi2y5AmpzTXv7AeN/Jkpe8rcZomzJFQ7OLjQ9dU9MRm08E9VZlFc+3Yklg3nmc9Wva
         zIYpet6Yivf+SKaioxeQ1iQGkyAzRW63faizVyhVF34yV3ZlE6aAiGCLs7YECSt89oBy
         BsTFmStjU5slkb/esy8VpIdciSN5qv5u5aCru/SJJKpIxupsKD0UCkCLDsBbE8+98A7x
         wpPhVfsB/QfYQtQSxqRmL581riYWA58BnupeL+kDNS/1DnzcUYWo8840ZGg9xOnznqcL
         CdWQ==
X-Gm-Message-State: AOJu0YzuuGr6IiJJ8jmFx6QlDeGD3kRXJiDPxQ7LQ4tUI9KhygkvvhXG
        J+Oabdhvqn0IuUNyKp1cMcwl4w==
X-Google-Smtp-Source: AGHT+IHRO7nOAEgsVsc+r3HSZhiKCm6mKMemwUFkJ3Wjf1yZADR53GIsH6Je5vQup/knzzVMXTQ6ew==
X-Received: by 2002:adf:f711:0:b0:32c:eeee:d438 with SMTP id r17-20020adff711000000b0032ceeeed438mr10859100wrp.54.1698218788026;
        Wed, 25 Oct 2023 00:26:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b003232d122dbfsm11387445wrx.66.2023.10.25.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:26:27 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:26:26 +0200
Subject: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: document
 the SM8650 ICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-ice-v1-1-6b2bc14e71db@linaro.org>
X-B4-Tracking: v=1; b=H4sIACHDOGUC/x3NQQ6CMBBG4auQWTtJSy2IVyEusEzxX1CaDhoTw
 t1tXH6b9w5SKRCle3NQkQ8UW6qwl4bCa0qLMOZqak3rrLEd71tGYF1vnTf8zroXmVZ+Is1IizK
 CcPR9HHrnrt4NVEO5SMT3Pxkf5/kDJ0uqSXQAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TfbZhtTr6JCUE3rn7VVswLJ81woB8n7GnmkkjwpPq38=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBlOMMi2B1aswsPGCUOxirWk8lM3fVELV8H80Qpdy74
 26hgTHCJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjDIgAKCRB33NvayMhJ0ZqvD/
 jr8mzxxVZY0DZIeJ55L1ONGiHuVDZlK41w46fiq5TtOw2kLtEpArHHRBp3iLg4qTC0BVxM2+2bDVjt
 FYRUuGJLLfIBirxrzbAgxjjBucsNZGbWwpoU3qBUwDizKPkOoXAH15Ys29g9FnLfqx09CTjpzjbKhH
 krkG6Ptn1zwjovWLRVJwqG5w5TWoHCE86480oudQqAh5mR9WZiuC1V1tb5xgbn9VkyoS0RNlzg+xSf
 4UJoVismpHV5Gub+GAjDv/lgNgJvf0r9n5u6V146sn0V3BS2u1RoFrcmjv2+sARt9W/Q89uyP1lHfk
 2Ne597Ne/UXJE7T2AIzi2vtq0dBjTFhEcE8awvX6By1gPhshliu1FW8jLC/kIw+QjppRNk+w9minU9
 fRu2gu9fBXE8jIcqJVl1egN+Z8SQjr/LzuQH3dElhAUJCQk0FhfvRXx/3itc+b775MrLUCKZV1rYrp
 z06PvgENLGUn2IsoUC5avwco5Lq6k+dG0Z/wWKfc42mNxxKf1zzOzotA6Vbf5XtHEpQv0xABP3+Lc9
 bgYyVI4hcB9o+EIUsdNj28VncgAyhPb1yg+/EVL6sRJ1FIAhmWzgCXukwLnLMfAaj8hyErj5Eqdpmd
 AMMfkcxyvYfS3N+tiUbJQbEQFVVQBMWfNhvyjJrRMYb8nGKghMTtFyDyPX
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Inline Crypto Engine (ICE) on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ca4f7d1cefaa..09e43157cc71 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
+          - qcom,sm8650-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-ice-f57f97334539

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

