Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA32687F2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjBBNvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:51:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjBBNvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:51:00 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DA98AC2C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:50 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id m2so6084923ejb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuFiTTM6JEhHJzLRQ/j1mXJ8nHJb7It1hei8p86wkig=;
        b=IDl3F/0c3cBy9P1lwXlE2TEeOR1WFlgPz52kdt2loNZLMDzdMWGJB5gt89dxD2bL/G
         pePR7iJjZ6aCuzKyIxP49MRM6NnJirPG2ZbNbEIKci9Vct5VAX9KDihBL2E+VBjaJZVo
         FKDRpex8qMtM4A/XrFBt4NO7CMdO88iA8Nccw+xWZYN0AfXY8GZFY6Q7HJBJ1xiku6kB
         9EkgnnS8AvR14nWZL4sxzGj+3RTgXsSDsNXqg9r0VK4j2o398dLIu8dyP6PyPLxhLYgd
         bsRq7wDKoruGxO3wnaoeLkgH1qfe2r+UI2qsXjeRIxXwf9CHM0n+rM2hxo5Z686OyQ8q
         tJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuFiTTM6JEhHJzLRQ/j1mXJ8nHJb7It1hei8p86wkig=;
        b=w8vDXA6rbfMWy9f+1LQ0rrSuTsocipDmzSVyEg+ZANqsRkchT/ykefztTqukl5CQe+
         khHSxYxqNRob932pvFS6D42RX3jtwGCHUCtkLhhYC5Klni8NWSxkePXTusNSQIvwkN9j
         FwwrN6r9t6/7/ktPFs+VuP0DYUjRfqKbNAEe85OGBadGdJwKchFebn1OFaFwgpWLwhEP
         nRo3IEIAy7VLjvJexbJRosCHlhsdQ/3uiaYT8NzEWhI0MxSJtru+AdUvRJKEUuO1WjTd
         +e3l6xRXLnr4oMH9zJQDn50ORYJBgLFWI80u/dmC6/NsCgRnSct7I501Hb/stIvXte9G
         OXYQ==
X-Gm-Message-State: AO0yUKX4lIWCxiP90l7QoN9GEIRn1tq8sq12uyIy1iGc6jM10/zew0tD
        YcMn5wtGFqQlIRUgv3/3tQRkN/wZobvmLRppq+mBGA==
X-Google-Smtp-Source: AK7set8gPQbo9ZbJBkSzUeLY+AdrtbASn+bQuTN2nc9XWMgBDr9nl0PkFXXO9V6dmfItr4QAPPUT7A==
X-Received: by 2002:a17:906:106:b0:878:51a6:ff3d with SMTP id 6-20020a170906010600b0087851a6ff3dmr6944454eje.4.1675345849108;
        Thu, 02 Feb 2023 05:50:49 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:48 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and clock-names as optional
Date:   Thu,  2 Feb 2023 15:50:32 +0200
Message-Id: <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
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

On certain Snapdragon processors, the crypto engine clocks are enabled by
default by security firmware.

Drop clocks and clock-names from the required properties list.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 4e00e7925fed..a159089e8a6a 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -59,8 +59,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
-- 
2.33.0

