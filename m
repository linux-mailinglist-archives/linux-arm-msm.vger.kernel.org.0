Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F969AA1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 12:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjBQLQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 06:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjBQLQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 06:16:39 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F7566663
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:16:23 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id f3so556035ljn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGCuw3uwe0V6oqscB9N0Rq3Z525nB3A+PwU4IC7WMx8=;
        b=IRqdspaKxxru2mS25VhwBIjb6l4JPODitns9Jy7FcnIrhN3BeHKthhoUWS0rKxwvMU
         casSoMMTIoSwB9aZZhwh1pQDSIomHRPkMRtJ1XXy3R0Lh6dYKwcxKkRPs13GDMOXE9ZA
         4LeHOMung7XIrxs7xr9vz/BW5Kw3n4ONqKd6u0WS+ajn1ioQ8516b0LU/HuVwEqEy4IM
         Uhpp7a7pFwFSoMfYgTHLBqibbxrzomg9LopG4dlFSNXQNuWF9Yl/T0sJ5zGfF2/d9d5n
         lluJExUdu92I5JcOZVUPk6uUneZUtfy+bLUoq4sOPFqOUhFcQqlk3W8W6QHrJBlq9Yju
         1sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGCuw3uwe0V6oqscB9N0Rq3Z525nB3A+PwU4IC7WMx8=;
        b=zop8dGnv65a1kfMLALdFg0cHYPv0vgl5AEvK2/BJ/L0+xBgtXv6jzs11hw+4O6lc/R
         OrMvjKpbz9w+CZ3IhtvcqUT8qh6oco27TtyWCFYjlFFZ4G4Y//u+7XcbSmQifqzZ4W5r
         IFITlRXSF5srvQknP3G+ie3WHoAivLAghRkNPHb1Scd4NkPez1Cz4AY8qRrH+K+AgF+T
         HlABQSnoWiQbDywjvxBxLvig/yia4ExbTlfXF8z3nJHOcLZ8YcXOmEQVtxxshBUeW05i
         /8kTjxFlShounjoD9hwqdrIDPqO7hXnu9VBqC5IJp0qmLe0KkJJ5H3zGJZ3HE2FRTHhX
         yMkg==
X-Gm-Message-State: AO0yUKX46OuAGaJ/NiqRiHtx9dssK9Mn1RWvBIBqJOhor5H9KhzA7J7l
        U9UlfP7kDpVYHgtgdoXmDwmrpKUJg+yreGES
X-Google-Smtp-Source: AK7set/4jLuiEe/dkxwX7Ld3pEHmvAPK2jaXOucN5kzuSE5zPUVFQ0gOwCvIaSp3lBaHr2blcgohMQ==
X-Received: by 2002:a2e:8250:0:b0:294:6ef3:f53d with SMTP id j16-20020a2e8250000000b002946ef3f53dmr1061603ljh.23.1676632581934;
        Fri, 17 Feb 2023 03:16:21 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e9b15000000b002935899fe3fsm554818lji.116.2023.02.17.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 03:16:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: arm-smmu: Add SM8350 Adreno SMMU
Date:   Fri, 17 Feb 2023 12:16:09 +0100
Message-Id: <20230217111613.306978-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217111613.306978-1-konrad.dybcio@linaro.org>
References: <20230217111613.306978-1-konrad.dybcio@linaro.org>
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

Document the Adreno SMMU present on SM8350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Drop Krzysztof's ack, as the patch was out of context..

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 4d7f61700cae..d89aa5b5c963 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -81,6 +81,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500
-- 
2.39.1

