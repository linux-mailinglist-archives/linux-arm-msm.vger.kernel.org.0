Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D376AA423
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjCCWVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbjCCWVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:21:20 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91402768C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 14:13:27 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f13so15954456edz.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 14:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677881550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhGUt/9ikay0wTYED+3dM9XZOHe6xmGcq8vv+hJG3wQ=;
        b=lprcTkYqSCWopAZhbYg/YjVGq1XyURU5qvtkZmaeyUwx2bhybmbBWIGDyX6HCFWyfk
         QXzrhehFr45ewtjkhlUDx5IkZDIjCwdBPd1QYyv9mo9VN22UXy7STP4GKlIPB0J4eCob
         4oc56PsuMlwzMbngpsGiABw3X8JfJ5m+WQBSPJ1PIvP1VHX+1iQnro3YLQQ1MZ5yod7o
         F+v4GriFxikQU5lnGV6cfI738CJCK0mTuid4DCP8sxg2AFDKkmScyWTGPjEhKgfDd7Jj
         qyYHCVXVj3upig4ZMyssz50KsnSWmCXU34QTZpaZ2wRoZaO/QHHqBQXGKFGB5lgGruKj
         7KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677881550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhGUt/9ikay0wTYED+3dM9XZOHe6xmGcq8vv+hJG3wQ=;
        b=2Xr4vhjQxJ1bO8ls5fYg28No50s6FBJAaxSJdqcfkMxzPsC8SXSvKYaz22eTuw7aSZ
         sEx+pxcZwCu/PSPQA1Epf1ZkXqwj2nBiA8HIv5X6OuSN2O9kfwjMr8tFHeKTLskzeD/N
         9ZYKgpTDa06SggezeChZyB3gd/2kkVpDE0EkE9mFnDkFRK3HryH7Lw/TkShZuck12Qv8
         Pxfl/rKOl+E2UbEY+2JVv0BJbUsdyxZHhNaMbiTYz4sNJ7Ce2aENV5QKSCMdM/k6TPAd
         ACH7vQ2EiBCUjMfV4Ytsc+uAIrgX1pdPnl23/mX3Js75zxBH1fnltYeXCp8XoX+2FsA8
         2UyQ==
X-Gm-Message-State: AO0yUKUY3dYqZKfp22Z4endGUDCd6TbLm/a/EY/cEIBpNT5QRfwHyk6s
        qjqs3fYHZQ35IalmvCixW/tHsrQVsl3q1uHD3jo=
X-Google-Smtp-Source: AK7set8pPjvldoS8xXTKdDcigJ9ekZ/v6oJanh8BYj0ZKLtRmyIkKc1mwDwannJBT4gGPqDdYCaXpw==
X-Received: by 2002:ac2:5582:0:b0:4db:2876:f9aa with SMTP id v2-20020ac25582000000b004db2876f9aamr1003092lfg.68.1677880694430;
        Fri, 03 Mar 2023 13:58:14 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:14 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:02 +0100
Subject: [PATCH 02/15] dt-bindings: interconnect: OSM L3: Add SM6375 CPUCP
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-2-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=926;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3kDftpNu/Ozls1NqMhqLW9oX8DcWVaXf4fhj5FEZN3g=;
 b=X36jcdTP0r3fGsHBtrklmVLjJUipWiwhCrV1ouBP4WX74fvOr6l46fLr0hR9NdVHr1Z0tc8K9pEO
 iPI5qPGDB1C/WTTNfpN/J94euo176d2KctXe7SL56uAW+gk9GQd2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6375 has a CPUCP block (which for all Linux can tell is really rebadged
EPSS) responsible for scaling L3. Add a compatible for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 576992a6dc5a..9d0a98d77ae9 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - qcom,sc7280-epss-l3
               - qcom,sc8280xp-epss-l3
+              - qcom,sm6375-cpucp-l3
               - qcom,sm8250-epss-l3
               - qcom,sm8350-epss-l3
           - const: qcom,epss-l3

-- 
2.39.2

