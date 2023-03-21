Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF336C3CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 22:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCUVgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 17:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCUVgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 17:36:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851C03E1ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 14:36:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so20906025lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679434567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
        b=HygJVWLJQYQZzv5qKjvJmDNkHdctvMuXyb5WW+Szi1sbR0fCUv2Tb5kL2qWEFlLjxq
         Onl2baFYfm7n857a0DVCwVyr6TpeVkmg9s8vk14GaL394coBZtbSqRSutIFUdqKGrzuw
         P5YcVMeYFIG5D66Z77S1qRV8busNsX1apl7Gq0Edpdf15NbtTtDNC5um4zP97/fRi1Ct
         2Qr/3UJ9qLRgha30++4X7M/1HO2ApQ3CEsykXpAy+DuJ6gJr6iO5n3R/LNn25nhqi4m6
         Qm1bUbW81MHQUToYOdQ/2zg9UjrMwyCX9MOXxwvh/ygj3MCPSWedvtxaIlE2uA76wpRY
         MD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679434567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
        b=GKM4xCgtK9SumIlEs5o8ehQatiPFqiI1obsL973FCjBOqIlPz2IPr3PqwIYdEtrsdI
         oa+FaAlF8EQGsB8Zj9Q+8pYXoM/lHioPKJ663gD2GX/DqQm9BjrFVEmRhvE5DydYCLDW
         XrfN3MCul9YM9HZGEtZeL2SczSjmPhwALFJOZGs4uynA0oyPrGp4itqbJRTwP/1ZTK+n
         ciK6cNh5W3thzxpIkSYXTL8Lk6jNpra6mL3ZaPWiNGhaDwracN8Lh6Kkngn5gC1IpQhK
         b1gYriVQuJ6veAa59gaVgqj1nbk8kZ4SvWJoLfsSG5w9f+quKEEdDmU9LcaUIntja6Hh
         pTtQ==
X-Gm-Message-State: AO0yUKXJsjlp5FuTvrrUrLDlruVvv99C8kcoYy4vHqyoobk0YnAXHEnS
        JLJaZDTQtgp4tbP/Pp+kAWaiH5LnUeVIIDVj0oE=
X-Google-Smtp-Source: AK7set/KwCx7+18m5if4fSBoPJCV6gjU21k1/n3wZtbtG6AVFjcu/qxY4/gwTtP4iZ9QQAPQ+znOBw==
X-Received: by 2002:ac2:5544:0:b0:4e8:3fc7:9483 with SMTP id l4-20020ac25544000000b004e83fc79483mr1339983lfk.23.1679434567543;
        Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
Received: from localhost.localdomain (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id j12-20020a19f50c000000b004b40c1f1c70sm2324628lfb.212.2023.03.21.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix DSI compatible
Date:   Tue, 21 Mar 2023 22:35:56 +0100
Message-Id: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 4d94dbff3054..79a226e4cc6a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -64,7 +64,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8350
+        const: qcom,sm8350-dsi-phy-5nm
 
 unevaluatedProperties: false
 
-- 
2.40.0

