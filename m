Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8184076106B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 12:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbjGYKQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 06:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjGYKQl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 06:16:41 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04D41718
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 03:16:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so944198a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280176; x=1690884976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgjzM14QEiL69p/YLX8lqgzuetXlnguUNrcPLd50K6I=;
        b=C4czm/+Xz2UutJXlca3VkY/5VlywrDLHuMNp4CGjo7VZ0TpqzJjydvmrSDzTVSgAEt
         +K3IZtgfB7epGyj4hbxX3wdBDlHFLyGYF8k87sMiH+G1gcqAMx40aZLy7MF9s5xeQP5x
         fhnbmSwYWkAVdLsXKHBG7KQami1/9ue4beRYmJdyrSe/ka3umBmFTIAsEMhYhkmED0+n
         h/tD+XzOhnhPcv7zRtsI2fsZdxpvyQNcwnEGlJZJJczCbDOtfM40WLASHHbA4aiLIfjA
         D/rEU4Og78VLM9QbuzZ0XS+STA60ygyZjzHaQn79vehoGSKmUMX5h5wYMfmhLuvrMwXR
         vuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280176; x=1690884976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgjzM14QEiL69p/YLX8lqgzuetXlnguUNrcPLd50K6I=;
        b=KBZXHDnJ2B1IPCujyEKVa40NGEZcp2vGUsWycO+tsh0vYoS05kDgETaaiptd8s6dzO
         3LfSXrdTQvp4rKQj9YcJjMYfdfs8qHsxru43EIyBoFq22zn5B0L94Pwvw2h73xQW+XqX
         N1lPEyFDvOaoFDe2KFqFV0q0ueUT4924Ymxf2rbwsqjjxfy201T10/J3X8WYeZETQfzv
         mhfgiwczxA1YCEJah2udlVRskBY1938KdurjnfSAxgwX6hm8pi5Gop78OAB66/obMqw7
         qtJkmOnmG7RNS+MCxqhVQ/sabgU0Zlo+7aciyJmBNRv38NAD2EsFmKtv4tYAkRzt6ok+
         d8Ow==
X-Gm-Message-State: ABy/qLYSLB5PPQf+1DDsRVfmSycx+HSgDShppAs4qxV4qBsOiQinrdH7
        OPyoKg86SCxfWAEtoxscxaLRng==
X-Google-Smtp-Source: APBJJlGBMU5DGuFGwk0qtfh0c2aQo1t0zRXQTiXXDi0POVtlnNNbgD2TyBllza9yPhuzHMFnWRx1Kg==
X-Received: by 2002:aa7:d410:0:b0:522:3a0d:38c2 with SMTP id z16-20020aa7d410000000b005223a0d38c2mr3214909edq.9.1690280176127;
        Tue, 25 Jul 2023 03:16:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f23-20020a05640214d700b005224ec27dd7sm544171edx.66.2023.07.25.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:16:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded status from examples
Date:   Tue, 25 Jul 2023 12:16:10 +0200
Message-Id: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Example DTS should not have 'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 2525482424cb..479c82e6a0d8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -95,8 +95,6 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        status = "disabled";
-
         display-controller@5e01000 {
             compatible = "qcom,sm6125-dpu";
             reg = <0x05e01000 0x83208>,
@@ -170,8 +168,6 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            status = "disabled";
-
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
@@ -210,8 +206,6 @@ examples:
 
             required-opps = <&rpmpd_opp_svs>;
             power-domains = <&rpmpd SM6125_VDDMX>;
-
-            status = "disabled";
         };
     };
 ...
-- 
2.34.1

