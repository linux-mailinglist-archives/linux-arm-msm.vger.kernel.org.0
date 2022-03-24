Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746D84E62C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 12:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343982AbiCXL5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 07:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346172AbiCXL5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 07:57:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547C927169
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 04:55:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w27so7616943lfa.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32M7oTSyOKeaf1CysC1hida7B7hRSXqH2Qo2sPYMO9o=;
        b=GervhNkGgzo6q0SIVF78plM2Y7tJnDrD3UWvo6IdGmFUwiFJozGw27EoNeRo/f3+HI
         n/4DJ3MPpIcPbkvQW+C0OV3DCLB8M85KPtXukjgZ6HJ8fXGgdTnD9J6iS5kGWxORuR23
         gIkDlRjOOEK1JqYiu2fcBfzvH8EQPElPO7AT5SHLZNmktok0QtRjAp7gW1fPlQ2kio/7
         7zbazcfXqyNqHA/BIt3qUupCcfrxrtMSeNNG2Bv2klt06enaexI2WbZKnbmOZj+1Rz6d
         f8x3tUnp21vVvurAjGkZrAy+47V6dfKf4IXKGK7Y3p9e3yGXTkGD0G4fJUCJE+xtpMpL
         XXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32M7oTSyOKeaf1CysC1hida7B7hRSXqH2Qo2sPYMO9o=;
        b=41s0BSBEDzJjqN+AnzVNAwEGUiB0G6JSPG2RM4lk+DT/YIaYuMHLvAOjdDzlcVk7GP
         0cyWSqZnwbsjskkQ7l04CqBcfbrOW6h/jSsz3sjwHGfmuLNCDm5Cc0AIJQGmUqTQ83lk
         9MfMxDfSxTuskTGllrEbyAPZW0TdQN3rl4koPjOXpdrjkm4NC+poBeM14Tebdj+jR8C5
         OiNeLs+UL5HwKDef0irx9lwz5fcqUfhe38Xu12D4yo5H/24JOR5xHIqzHCUROl8TSk7i
         N3qI7QlyTXEvsSJ2MCw+ZbrlR7EzXpLLtV8q9A4NBsR9H52CxbxwTIHEgeaRJtlOQTYa
         DxsQ==
X-Gm-Message-State: AOAM530PDK+CUCHNP7emA8x7rvXob23Hiz9pzrwnUT9Sz7orcAyj5znQ
        9G5rY7c7JjBBlUhrkygcbO3cmw==
X-Google-Smtp-Source: ABdhPJz4VOkKb9/awzSsxxP+26JXp48DHN5W+2ym/3IF32yD4FWcqh/X7ZVJA/dp3KMDu07/RRytVQ==
X-Received: by 2002:a05:6512:38ca:b0:448:28c4:88c8 with SMTP id p10-20020a05651238ca00b0044828c488c8mr3365486lft.327.1648122939611;
        Thu, 24 Mar 2022 04:55:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p8-20020a2ea408000000b00247e5087157sm305327ljn.101.2022.03.24.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 04:55:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: another fix for the dpu-qcm2290 example
Date:   Thu, 24 Mar 2022 14:55:36 +0300
Message-Id: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dpu-qcm2290 example really follow the defined schema:
- Drop qcom,mdss compatible. It's only used for MDP5 devices.
- Change display controller name to display-controller as specified in
  the yaml

Reported-by: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index d31483a78eab..6fb7e321f011 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -160,7 +160,7 @@ examples:
     mdss: mdss@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
-        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
+        compatible = "qcom,qcm2290-mdss";
         reg = <0x05e00000 0x1000>;
         reg-names = "mdss";
         power-domains = <&dispcc MDSS_GDSC>;
@@ -180,7 +180,7 @@ examples:
                  <&apps_smmu 0x421 0x0>;
         ranges;
 
-        mdss_mdp: mdp@5e01000 {
+        mdss_mdp: display-controller@5e01000 {
                 compatible = "qcom,qcm2290-dpu";
                 reg = <0x05e01000 0x8f000>,
                       <0x05eb0000 0x2008>;
-- 
2.35.1

