Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E006C64D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjCWKZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjCWKZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:25:34 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EB5193CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:28 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r29so19837779wra.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679567127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aARTCK4sQSdJ4cxE9VmvCb0XymPAsWngkLF26icVX2A=;
        b=K5oYRdOH+ug+Y9Mle5NMbmdYFlcG9wrZ/cIy5NwxV9Ikqv47ML+A/yPw8BRlq+/930
         Zb6g6AYQUNZM9kux/uRsCXvCzyX6FiYlgJApTCcVRUf1IXktNfoDg1OG0s/jTivurvBS
         2vY/unzjPUm/mi5yjtTs8+l1SMJPNQAKI8+MvEnVCkOtRkxHj3pqWNYUD/hFYP+Z160E
         OHaTH/mK4MnJH6sgQe7Kgiu8Uz6YfnuDGs426pmdu2QltWmZOw1htb6+GxlHU4RsDBXl
         0qSp9F3OFEZ/AyGFbcNsQoFyl1EYh+XxNO1VutRdA39Ihw1WBhYxqLlyHRqooQtjaDik
         PGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679567127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aARTCK4sQSdJ4cxE9VmvCb0XymPAsWngkLF26icVX2A=;
        b=XPE/NhZxMJDihlerMb7TNwFx9inQGsh4TShUJhJbUkDVJu1HOCgyVl8BYeTOEtpZZY
         /xXrFN/P2tG0veet4ZtAQJ3MBf6xUyuLTU45N9ERSBjR1KOT6Xu45Su21ZazSyWXvWfK
         6xuMvJIchWHCcvWFRtwc+8Vw/7g9q/StjpfRVBnjwkbzSRt+OqPYYaR4lVPcRrJGyerk
         RoqxDFUJxKTjE5W1jiUPVn+T0T6W3Lou8ue+sGknTVtCkb6G6Z+Mthbeb2GAeJu7Rw/z
         iAgm7Sk3a5KVKBqoSPsu0OZ4nsMX9HYZhCLNkOPfPEAyBcSHnwohswOVwWraU9XZV7DO
         mgIg==
X-Gm-Message-State: AAQBX9eV/fBx0XscBQHHqoSVMHgt46etig/glraXDK+n7KjwMI6j7FVQ
        Jir1fxvN1C86i/qqkC2P9EVFFg==
X-Google-Smtp-Source: AKy350aBOd8afsAojbQ8LGe3Im4DfBL+7ds0nVt2O90BTkM9NRCljd+tnLDX7YXFFONFZvdCNkXl/A==
X-Received: by 2002:a5d:6a50:0:b0:2d0:d739:e37e with SMTP id t16-20020a5d6a50000000b002d0d739e37emr2097210wrw.40.1679567126944;
        Thu, 23 Mar 2023 03:25:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 03:25:26 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 23 Mar 2023 11:25:16 +0100
Subject: [PATCH 1/8] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 4c6929e2534c..48781cc56434 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -54,7 +54,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8450
+        const: qcom,sm8450-dsi-phy-5nm
 
 required:
   - compatible

-- 
2.34.1

