Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C82774C0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 23:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbjHHVCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 17:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjHHVCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 17:02:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2BC1B4
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 14:02:53 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9a2033978so94954481fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691528571; x=1692133371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfboBfiRFogaTpUuhly3NgfZjgGVKja/IsRvHexLQ30=;
        b=FWL/9588n+DzkqoNB8hffVQrNAMttYAEKN+YYxfTS9SFuaMVv0x1FDgWAbYpX1lpEn
         y+HgLcWjx/BPzB34iijB2ZhCbTIBeJV3cWPm2iKnk8sPzH0fMfDC2hPL8ElG1vk2b9Iv
         yf7Q++GsxTRpX34BXPKK3S7XWzE90oDZVVyqXUr8Hml4TJuAJiX0EoD9meI1pN0tsbPg
         g1fdxp3AwjtMfPY62SdVUxMmfXzdg0Gt4Dzn4Knl0qTIDFM4E/2FcphyjG1MSrBS3Dyg
         MUJ9PltjjE7Xt+Vb77M2S2xF5DUFudNblx+0ptKg8udZO0L9QpWsYcvxhCLBfxmULkjk
         XIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691528571; x=1692133371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfboBfiRFogaTpUuhly3NgfZjgGVKja/IsRvHexLQ30=;
        b=BAXwWtYPWQkyr+tHnzFygKR+6s0CuehnsGC9wR7h7EC0FVkI5rBLC3h9nQYd98ynzL
         PyJtL+A2YdfVDpeuOaEKqiCP8/2b8d60rRgEU6Z4kaRvI0uNDEHmVbhW4PA9zuion9X0
         yrtrZeWVrnJz2B7Bz1WNcRMZKfdczkJX2hgK+1tAseV5/ZxOIlId9Tpso3sRs5AJGpal
         mAZH0fgALhjuhO8Yv1nQS1YRVF6899I2017lPE9qxZvUnuvrhJh3X2OHWOfBTR8vlYRR
         nZxRegPch7wqiSBOhTssvV6gjmKzFzQP+w1PZHQ4KfRL+CkiX/Ug9qz6HMmJy3IAwSLw
         /v0w==
X-Gm-Message-State: AOJu0Yw8DV2qrnJEilW8lhlcdZyygZgIq1cxiziz6lu7mMxvsFErAdQc
        I/nflY3KBYnLEB93Z6Wgi6qosA==
X-Google-Smtp-Source: AGHT+IHmtQKh9Ne4fsCZMKO/0I3do4hlNgFoi5gsoycNE3Zw2qfKFIElCjB2RXnFAV2OS+qeIducrA==
X-Received: by 2002:a2e:6a04:0:b0:2b6:cff1:cd1c with SMTP id f4-20020a2e6a04000000b002b6cff1cd1cmr444440ljc.34.1691528571765;
        Tue, 08 Aug 2023 14:02:51 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 14:02:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 23:02:40 +0200
Subject: [PATCH v2 02/14] dt-bindings: display/msm/gmu: Allow passing QMP
 handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DmGlYwIEUEHn/wQtjBFLoVdCMMIvFa4G3MsWRsymdpo=;
 b=NsU1D9zX+SvHMM5tanczlcL+kW81jzbaObcsHCwoLQsp3YgUXDvomWL0uXIX/ygHDXQhieJdr
 SQ/Mr8eaZ4aAqjvuI/2lC0ahRXyGV8q84BrlIDCdKIwq62BnzEw5evp
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 20ddb89a4500..e132dbff3c4a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.41.0

