Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0723379ED2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 17:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjIMPfo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 11:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjIMPfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 11:35:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DC5E5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 08:35:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31f615afa52so7383738f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694619336; x=1695224136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqhDGN0q1K8XUZqE/r9ClfBnQGg9OFu7r8WfZswLLwk=;
        b=Nd/ji+w6Uejw67NqZe1tD+fMWa/1Fke6CRX5J0j01X0fAKZO0MT188A3QvSWlYAoiN
         Bcms5g/W4xnYinPUZs246Gb4qPt8c1ybmmen90fQF/ojCJ2T+m67OfqCFUfy6/BHWFXM
         Iqc02xiQHMYQ+nXYxKM3p2DOA+dGx3OfsJzXmbhtR1hEl+muEuXwy+azHqj4UNjtegVl
         /ECKbs1GNQ2pN8YkG6agczIqwtAhWHnTL1pQBrmVGiteskyNUjy93Y5JgAn4fimfm5Ro
         NzHPCJXhFxLmnXho2xilvDchj/nJaZQl5WhwExrV58kzemWfrYscn4Ub1Fk4kXVxZN0h
         HWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694619336; x=1695224136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqhDGN0q1K8XUZqE/r9ClfBnQGg9OFu7r8WfZswLLwk=;
        b=HzAvlOO/9NOnoaw5ntvK+sVplQ2WRmzi4i7txxtvS7fOdNHHXT0PEiGY+3M6JWhau+
         qZtI7XeUIow7Z2pfnv/tCzW7e1QpNv5866IEoIjhqZGpA2bM3wDlKHXs9mUh3KyvT1Kq
         /i5SDBo8Er56OFOqvKbdrFOah5ezIddOjOIKx/jjyuDWlZONC7nlMs+wVuJQpgLzAYDv
         pi+wm97mTdVldu+n5CXRXpdLuQrEZsRYMY9oNG9ewibhTA1YtMPCkEnnNHa2Vv9co4OL
         53/AGEQy5pP0S6MuQZ4YNxYB5LfldLB0fZ1Wp7Q4OMQ0gDUWQ7ohHfshTicp7PWmjuEy
         L+kQ==
X-Gm-Message-State: AOJu0YxuAXrYZlDGlL7u+0kFZuGzsbL6SyTdFmJydWE4Hw01qiVUYBc6
        Jr9yF8o8HGMbOkwwfhrJoTpO6lIi35IQNV1rIDo=
X-Google-Smtp-Source: AGHT+IEcxLrH+tnCBz0k0JsdV60yzkYS5v2M+TY2eCeNR9XmfWCK8lMQcqp+jXnOF22JfEoEY3riwA==
X-Received: by 2002:adf:f8cb:0:b0:314:3b1f:8ea2 with SMTP id f11-20020adff8cb000000b003143b1f8ea2mr2526999wrq.6.1694619336162;
        Wed, 13 Sep 2023 08:35:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id e11-20020adffc4b000000b0031f65cdd271sm15750315wrs.100.2023.09.13.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 08:35:35 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: crypto: ice: document the sa8775p inline crypto engine
Date:   Wed, 13 Sep 2023 17:35:28 +0200
Message-Id: <20230913153529.32777-1-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for QCom ICE on sa8775p SoCs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 7da9aa82d837..ca4f7d1cefaa 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sa8775p-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
       - const: qcom,inline-crypto-engine
-- 
2.39.2

