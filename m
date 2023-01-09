Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8CDE6622D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 11:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235213AbjAIKQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 05:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjAIKPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 05:15:49 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995AE183B1
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 02:15:22 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso1863554wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlhGmizCHZNPVGwfruBY+PeERtpdL8MSQYu3IWaB+cA=;
        b=j5PWfI7hsNtLqGEvCNPY5JQApEL9P/X1UTjpCN88sltlumSHiIXHyKOBSeLnxieBWx
         AC9XpMdFy2Iv14XmQ4NmW++g6X531fnFHTSLbTcsI2FfwbKZ3+WkCJ/iOVr27BuNFpWg
         7xreIrL7KJf/JKaBkiC1jspPo6o+rcX5MyHfn+2wOcRkoNgko/en+SV1z6/qI9AFI3cU
         joOhqZTK/qzhKFh1hJwWfh19buHL5V0PbC5/+5YENh+EZ9iMETY7Y7acXynhWlmThmzZ
         48TTlRw5xHRHTxUzcywXLKUHpqnAeZmrv3ijT4eBTxHP0ZRjLOhiJKG0rrdskieeGN6A
         WL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlhGmizCHZNPVGwfruBY+PeERtpdL8MSQYu3IWaB+cA=;
        b=fumu696o3ImCY9MTe4hwBW5PFqT2QPOYDKRXIZDoiZTLakL3Q0DAjZuIBTig3l7vtR
         RqifDpC3O6br5PFqfTtIdT+eK6VdXndHA8uOb6pqn3MMy36UldZFgWJU591qgxx2S4s0
         S/rr9en6Y7vPT+agGSeXKCO9Lz/RpGm0PJAEp13FVw9h10CPfIHuVCkBfaA7Hd1Msvus
         qwr3b89upwO3Uvg7d1W8ywywL75BXFU+bOuLWMxljO1z+JXjsj2O2oEpgaACCghjcUsy
         y+s0G/hXj2uzKo3jh2AqrMzsfhlLLoWuEe/xFcFmmSbVduZf7GDGI+kLr3RVT0DttEeS
         y0+w==
X-Gm-Message-State: AFqh2krs0/ll5fvRVYMTwBi3yx+OxY9zCp0mnCrnz3IybHLxGWDh1lTe
        6U7Swtr+4stuyIeB0E7ji6T3gA==
X-Google-Smtp-Source: AMrXdXtDoONLJwlEgCJ4mzpaWkhPvOuI1P7RAAoqCz2lzMDj3a4D3B8uK5HPlPweG/T18A5/NqGCDw==
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id n34-20020a05600c502200b003c6e61eae8cmr55951404wmr.28.1673259321222;
        Mon, 09 Jan 2023 02:15:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:15:20 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 11:15:17 +0100
Subject: [PATCH v3 1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-1-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8550 DSI PHY which is very close from the 7nm
and 5nm DSI PHYs found in earlier platforms.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 299751a9caea..78ab8c410ccd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
+      - qcom,sm8550-dsi-phy-4nm
 
   reg:
     items:

-- 
2.34.1
