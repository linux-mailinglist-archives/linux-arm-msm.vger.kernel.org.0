Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F440620713
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 03:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbiKHC7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 21:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiKHC7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 21:59:10 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD668291;
        Mon,  7 Nov 2022 18:59:09 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id 63so10496907iov.8;
        Mon, 07 Nov 2022 18:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQmrxV8UAMx8aTkAdlv23yBJFQlgUNmii3sTAapLgyI=;
        b=T7fKMlBHsf/SjC3hRWE+bmKrYjO5qAYLR6+c4ucn2jrIpPSWUyqBCLQm3NPTJcea1B
         IrOcGjMB8nJlqkwX8cqPGFV8j+WP+dfcpuaBnLyCZrK+HI+3tW/8pdV8jI5Ba1kYSGUq
         QLz/rciyMiNfUAz3//JrlufbwRPtyjJKxT9XKK4Cjp2hI4Pd6/LTMjqZlhxNNHjHqGfC
         BOmSItRWg4clR0YhMq99MezWQfwb/k/eOGCSP2HkVWRJsizyW3YW6qwO0x+crdUSsLNW
         838wmRGtG3c+qBEZnNAtoWvvQlY4dCOz+zSr7YOz9cCwGo7MLwi0+b3n8RDhVcoy4CWx
         dhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQmrxV8UAMx8aTkAdlv23yBJFQlgUNmii3sTAapLgyI=;
        b=mzV2+IyKJDSoCeFpo0eQKDmz/wU+IRvcvhIAhOql6ekHh5KMtXmwHxB7nO7jSYn/JF
         ErJ7x5bPlcektbzFfX+ByRZBXE2DagFBODhPUf53oDSYbEZSoyNdtdKQ2qv7Ym+VL2Sr
         AMzJLx9PpTmoKxNAGP/nV6eFqPMuTWKSB5U3TtSDuj6XL6ZC8tVgG/pDa40DXxGqXnbf
         AfQrvntyKdd/JhyHHE14fCXGgiQYsPnZ1WmPDONA/lQGLDrzlx6icFln+yH9n0WU5pem
         u9ipePQ+R5J37VVYQ7KrYIrbTKgNAfKIhavH0NgRcdVW2OqGKE7qd6D1x4kEYYst7Cep
         qqAQ==
X-Gm-Message-State: ACrzQf0jaBl6sChJ4s96PLHBAYArCNFLGJ0ae0tO4RRJV2dMvyMDdHpz
        bu8F0/h4RVgEnOelBCVcEdc=
X-Google-Smtp-Source: AMsMyM7UeuJikzj7LIRlLxdJ3APD3Gi+t7E5Kh7yKxpgk7/fdMVy+3SOTwb4Qa8hPi400V+KW0I/Gg==
X-Received: by 2002:a05:6638:d84:b0:373:2ad5:232d with SMTP id l4-20020a0566380d8400b003732ad5232dmr31641007jaj.251.1667876349206;
        Mon, 07 Nov 2022 18:59:09 -0800 (PST)
Received: from localhost ([2607:fea8:a2e2:2d00::61cc])
        by smtp.gmail.com with ESMTPSA id z20-20020a05663822b400b00363ec4dcaacsm3365438jas.22.2022.11.07.18.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:59:08 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/1] dt-bindings: iommu: arm-smmu: add sdm670 compatible
Date:   Mon,  7 Nov 2022 21:58:49 -0500
Message-Id: <20221108025847.58352-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108025847.58352-1-mailingradian@gmail.com>
References: <20221108025847.58352-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string in
the documentation to represent its support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 796dc7d4dbdd..f77597e8ed39 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-- 
2.38.1

