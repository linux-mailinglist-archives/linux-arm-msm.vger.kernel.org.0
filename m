Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A626156AD98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbiGGVcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236679AbiGGVcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4560233360
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id bn33so2422990ljb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
        b=vD8jwtSVMM/mdnUH1BdycUkk5hOIjujpy8d5BecrgwAj+8TPU9rVVtHkMAmkRTxhxx
         0KqlOsuqqhWUYhkoKxhkwbJg6L5YA9nF93IvRKRiPaBzGdrNxs/H+OJuum727PQl97NK
         AvhzA+f2+8ZoihCqKTDRs7undVxbsfEpLgXgCDIyGaT3qEhUvjflrF6A1aU9C30FSrJ7
         z8agQE8yY7LObd9J9ssWbFVI71FsDzXGd970M6i0kRrNCRAROna+fpvo0aJWSFiC7cm2
         OP/qeHqs1oCd9eWUGkemU0fcd0BCGQkf+mci2HFZz8jmFDfHAVfdlCNj7LVYQRaUkJCw
         XeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
        b=mS/yKyu5Lj9fVU7X3xxS0x6rI9notgJ46ZdOSHZAm8xtW2L2Yntz0S/2AwCNQX7p0c
         VBoRXcSRwHxhobR7BMsWEOM2w4bTGUTrqv0phBYIs6yH386xvcvX5QADtwCpdA+tO9Ze
         6ekZ3D6eMWsbS2Jx2jgujL8qmszbr+muMFykbd/GT1lP1qzCg4+DPw+4Ab3EDAbBnfmD
         QtRNYebiwqZ4KQOdzdQI8iz80FIl69JqUpq/KH1f5JqaEX0cZGzFUrw+zwrFr8wbcnCz
         GxrMH3jzrBUtz2IC5WbNqUNY1rL2iyfwq+DLjCucYb6Bpg9hnFOcTnIqOEkniPzTrKqj
         8O5Q==
X-Gm-Message-State: AJIora9dEn5rl+YYR8kZXn+ByA6DyDN5KFtSCDn3wG/9TL8N0ctGDypT
        4Jg3ypelUFjg+mdfH25nNUWMiQ==
X-Google-Smtp-Source: AGRyM1tPOhQoRZlBs5GK3iTsOL1N01Bqd8BlBXjJFeIqnAoL/BBF8qFhZsLjhmLbeD8bH2pdElo8mw==
X-Received: by 2002:a2e:3015:0:b0:25d:51a1:25ea with SMTP id w21-20020a2e3015000000b0025d51a125eamr24534ljw.320.1657229527614;
        Thu, 07 Jul 2022 14:32:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP reg property
Date:   Fri,  8 Jul 2022 00:31:57 +0300
Message-Id: <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
changed reg property to list separate register blocks, which broke
validation of DT files using single register block. Restore
compatibility with older (single register block) DT files by declaring
it as a deprecated alternative.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index d6bbe58ef9e8..dde82d5f6610 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,11 +24,15 @@ properties:
       - qcom,sm8350-dp
 
   reg:
-    items:
-      - description: ahb register block
-      - description: aux register block
-      - description: link register block
-      - description: p0 register block
+    oneOf:
+      - items:
+          - description: ahb register block
+          - description: aux register block
+          - description: link register block
+          - description: p0 register block
+      - items:
+          - description: DP register block
+            deprecated: true
 
   interrupts:
     maxItems: 1
-- 
2.35.1

