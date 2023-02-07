Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857C768D23A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 10:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjBGJJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 04:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjBGJJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 04:09:13 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D226A3800D
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:09:02 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d14so12807598wrr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdXmjFBd+X/kaLcO30rTkOZVMoICj5BRdipiUuVXnAU=;
        b=jnlC6v2dfupPC/SJL7x5vzuVp7piZhPcGzXho47cSg3fWxHCLpPn6g7BZd6uLeSK67
         2AJafGlRqT9ak1aN2YmKLxYBK93gin0wcbxVe16Zf4bhlye9sTwbXutAM6jqXBdi2wVH
         0sOxgvoKras6bBjvStmG8tHk/4Rpk6mWA9JrX3dOsG6uQPjOEc4yG9SJH3FwdB6kpF55
         mEmEDGlBkxAl+i8KWVdO95UM8As745h2RlrvcYRfTlP86AFrN4/PMxYeNYS43vYF+ATf
         DiMT3MqpiFzY2CEydZ+fjwY7HyWUPPJBAsTir9U+ii4FYWr7BqPxS6i+3V+iPGkyNPQD
         /gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdXmjFBd+X/kaLcO30rTkOZVMoICj5BRdipiUuVXnAU=;
        b=C6Dn73Gdrtq7UUyx5T9UYpXlLgXCRlsJCZyQXUsw+8WgIYa1SB9r/KSFDVXqYTG4UI
         Pp6X7yVi0Lucmb5+7EJ4Pnj78/0OTWi/UCO/pPBhRSVJTLdLgizgZvbvHBZpMv/XJo4B
         QG7ltzYySS8Yi2K500wFbWRR7KGz61Hi+BPdRUFRWuN7LBNyA5FKfTbhXl7lvs26b2et
         W8jSzNYivBpVbgjeW59ZkDrtPwbYcMTeX9BynZLZXGVCIwmkBOX0FRbNqv6Gy3Iqxx8e
         DtWjoRks7iYYGvbTt4YPU110t8vvvFQ8GhzaPyqi8wvXJvuy6tPixsnUBBedtK8JkdGy
         pTTg==
X-Gm-Message-State: AO0yUKU0+e047Ws2aQJ2VgGub3/79ipbrbdN3HjobMYOWrWjpFpCmdjZ
        yF0ok7O+PhV38gRHVkuwblRV+w==
X-Google-Smtp-Source: AK7set8/W5KJaFEkz1RDDa+zwsnOV544Xcf8A2EUlXRFsKuAyZ13x0n0EkNmN471HkJxysliaMCEpg==
X-Received: by 2002:a5d:5046:0:b0:2bf:ad61:6023 with SMTP id h6-20020a5d5046000000b002bfad616023mr1714314wrt.71.1675760941310;
        Tue, 07 Feb 2023 01:09:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h3-20020a056000000300b002c3e5652744sm5081955wrx.46.2023.02.07.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:09:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] dt-bindings: remoteproc: qcom,glink-edge: correct label description
Date:   Tue,  7 Feb 2023 10:08:52 +0100
Message-Id: <20230207090852.28421-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
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

Correct the description of 'label' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,glink-edge.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 8e133ab55ff3..15e6851e1ff8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -42,7 +42,9 @@ properties:
     maxItems: 1
 
   label:
-    description: The names of the state bits used for SMP2P output
+    description:
+      Name of the edge, used for debugging and identification purposes. The
+      node name will be used if this is not present.
 
   mboxes:
     maxItems: 1
-- 
2.34.1

