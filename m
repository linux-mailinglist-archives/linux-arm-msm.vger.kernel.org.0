Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E258518FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 23:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbiECVVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 17:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242719AbiECVVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 17:21:16 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEB640929
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 14:17:42 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e93bbb54f9so18438229fac.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWbhsf8P98l/EiH5gI2ubgolPhW/0b1/YN7RGLxWPF4=;
        b=vgurpuY/jnW3VAquoYo68gT2IDasRteb+8B5Ot20rlH7g1qC0K73nKWhGCaACAtKrL
         UC5J14kj4pnvxrI/VU0uCB8iz6lBfGs5bOf9fcv87+N3NJL0hUQcIF+dG4xQuexcend7
         JnkzWfUqUz1qjsreJfztWVjVqVBpG3uPBsUWEF6FCWrUwX0pPXrqY1BYQ7c42mOcrcmf
         Qc7mgFrfAs1H3cx4n4whLgpAPxz4Af4YvVBTOdeEBAJqPiAgsNw5ofkMMOH/m4E2pKQx
         gwSOc1NbnHhxDGeupZlyyo6UnlbfvVYZySpmUtu+NmFfJqf8OXZagMFfkcQqBl9HXpSs
         /4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWbhsf8P98l/EiH5gI2ubgolPhW/0b1/YN7RGLxWPF4=;
        b=SxEsaOIwXTAO1BYcUDHBCEWjPMdf8Wl0E9tkGjK4DMbYMmKPNGTSP5j1alYPu2jQNh
         dimZLtGtrX94FiD25SEdZguO+zmuh0/7s5qVCl0UMb0DABb5yXhpxeC0zD06G836G0tZ
         vFFHetmRAqxvppZyyy7Db4fWn9rDJx/FeuBvMdDdLwiPznwn63lG7IULzqc9/AdG+H7j
         UgtW1g22GDSH3wCXutNpwBba77v4YVGhg+21QTQdh2dR+5Ksa+/Fuz0eii+G9Gy5K69k
         xD9zNdI8EFFPFoP/SOhF5Rhfq7+BWelp3JtU1aMzqfnSymT/DUgLJaPuaeSEf8u9mkEJ
         iCUw==
X-Gm-Message-State: AOAM532Bm7/0BiSP15vHdxjnvvWILlgEWQCAXZ61dk6zP3GJ5BzEgwS5
        RK8ZvNBKfOetXpY7MnxXQak13A==
X-Google-Smtp-Source: ABdhPJzQFCROhKyiY4KKxw7AbEgDdlqk3c4Fy++A5wNWSRcnQUbUeP/RfPtsAFmlttK4wQomi2QTvw==
X-Received: by 2002:a05:6870:304c:b0:e9:8c5c:3c34 with SMTP id u12-20020a056870304c00b000e98c5c3c34mr2540190oau.169.1651612661997;
        Tue, 03 May 2022 14:17:41 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b3-20020a056830104300b0060603221263sm4305906otp.51.2022.05.03.14.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:17:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: interconnect: Add SC8180X QUP0 virt provider
Date:   Tue,  3 May 2022 14:19:22 -0700
Message-Id: <20220503211925.1022169-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503211925.1022169-1-bjorn.andersson@linaro.org>
References: <20220503211925.1022169-1-bjorn.andersson@linaro.org>
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

Add compatible for the QUP0 BCM provider found in SC8180X.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index fae3363fed02..cf684640fe6d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -59,6 +59,7 @@ properties:
       - qcom,sc8180x-ipa-virt
       - qcom,sc8180x-mc-virt
       - qcom,sc8180x-mmss-noc
+      - qcom,sc8180x-qup-virt
       - qcom,sc8180x-system-noc
       - qcom,sc8280xp-aggre1-noc
       - qcom,sc8280xp-aggre2-noc
-- 
2.35.1

