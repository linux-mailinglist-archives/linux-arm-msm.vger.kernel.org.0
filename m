Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E716CA64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbjC0Nr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbjC0Nr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:47:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B65B468E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:47:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eg48so36364280edb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679924869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvM3Xo7kWQeMts4fqfXfCBu6rrobV0+vnp4Z7+CdlkQ=;
        b=B4naxOaDhWktG/khO/taOqV9o/7QvJdyksa6qhRytXzBrkIy6MSOfL8Oa+/v9a9Hz8
         7KM+PUs0NosvFFWxIs0lEDcVuiZ+AwykkATXNzAW1PC1VKHjVAF/Cp2orXN3S/gky8tR
         PRyjaAbME4oUHvt9New8vbw0g7GEOMBu52RTqbL12LeO++1wegpdENywpf8hn+L9YNSC
         yu5/yoJTKGTCEo8SaQzH05RFM9gXF+PWxrHPFHh2Nx/awsy7BHzBwukzGeF0grC95IvW
         SSb7crrTw8PDl3ExNpneU4Fc5Qrf50/z3thQ3667/cINWCFw6M8ljLXj30BNeMWk0Hf/
         jyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679924869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvM3Xo7kWQeMts4fqfXfCBu6rrobV0+vnp4Z7+CdlkQ=;
        b=fIa+jghxCPiu+HnPi2KmYwbt+i6rGVBylCvWMC1o+zZ1ml8MaDvtikAcSw9+wz3FTv
         8MVlRf07R+hg5bzro9S47mzUFOwJBRKty+Iu9ukbHa5aTWH3wvYkkZKv8BsVp+RDI4Ij
         kmG8xVicB4buZHyJv24tVI+vqlp6+ElYyMpzx5UtSGbR+mZc6jLuVfRGYT5k+PuWKDhH
         KmD7+TDvvsqKsX8BRkfPlVvcaAUoKB77mbiTGv139jU80Aedv8kAoq4KB0ellpMZv6al
         IJmcZFZKurl2c0DQAHpiiLRYKpmHOEPluMW76m4vo6Ze3+WgQiT8Rp9muItS3DcR09La
         vG3g==
X-Gm-Message-State: AAQBX9dCKFc33iZXr9djmQkM3xQyuUgwy6tLpU5Cp6qZuvwFHe3P9708
        rLqbH08CGZ2sPZFjnz+51wdXIQ==
X-Google-Smtp-Source: AKy350ZpwGYP2PtxPrEZJIqCM1Ph8zc1++uh/cIq0hw9GToR37FTmvA5FdYGMLCu+1FMH8iGQTKULg==
X-Received: by 2002:a17:906:caa:b0:8b1:3821:1406 with SMTP id k10-20020a1709060caa00b008b138211406mr13012331ejh.45.1679924869430;
        Mon, 27 Mar 2023 06:47:49 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b005023ddb37eesm2394303eda.8.2023.03.27.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:47:48 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: ufs: qcom: Add ICE phandle
Date:   Mon, 27 Mar 2023 16:47:30 +0300
Message-Id: <20230327134734.3256974-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327134734.3256974-1-abel.vesa@linaro.org>
References: <20230327134734.3256974-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starting with SM8550, the ICE will have its own devicetree node
so add the qcom,ice property to reference it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 (RFC) is here:
https://lore.kernel.org/all/20230313115202.3960700-4-abel.vesa@linaro.org/

Changes since v3:
 * dropped the "and drop core clock" part from subject line

Changes since v2:
 * dropped all changes except the qcom,ice property

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index c5a06c048389..7384300c421d 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -70,6 +70,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Inline Crypto Engine node
+
   reg:
     minItems: 1
     maxItems: 2
-- 
2.34.1

