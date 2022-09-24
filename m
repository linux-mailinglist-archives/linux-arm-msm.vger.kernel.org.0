Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099885E8AC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiIXJ3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbiIXJ3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:29:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D26513A3B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:29:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d42so3785397lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=e0x+n06hV5mMu68CdHdoiGvRmngz5GOt9vNpZJY16Rg=;
        b=A4Ia+iMkg7q1KZc0e5t3tnHCjWwXPP19hIwQGyKINHOThQuOY04Y9oEupgiP1kjfCx
         Lddaxj+ftBazMurQtdWEgQaY/PoEn1vO4J4TYD6/feGhpQaT1zkkMPpwxdTNohmLfqcE
         goCUQYKDO3phBJjEFQgSlvJyPT+f42EQIkNvpaZ8L4ydYQ5jgUSNhmPBCxPAIVdCiVcA
         U6DknBtakaukK5Vqg/dZUE9eANznmUB2xjoq8WS+H5m3zLu1fWvK9kmo3HOQaD89iY1z
         1qu0AVoAOcik6buhmWR+YbN4xqTm4mgEZgN7xvgPdxrOm4f4xgmltTR74mzzuEBCWaZg
         BEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=e0x+n06hV5mMu68CdHdoiGvRmngz5GOt9vNpZJY16Rg=;
        b=cmxDGgvW1VJN30oX23Hxa4QVZoq19Mfr66iC5NxIMFHaW/zOeDf4BxvMB6HnmQj039
         0g/d0MY/5r2KfMTRtFSFbSD/F1SJIWIenbANWNJevjm5oOmFukZi5DrlqrYqC0zzPplL
         eXcFKbhx2Z1R6ULlXmTBgFcxaQONU38uhsG/4zXyJ8tjAP8XY+J+lvFjbK00eL4b5gga
         u2vbDP317Boxk5bcms8lBYo4xi3NN6lOlxoYBXKGxVysJ39dgO3x4P1wastt7K/Y/CkI
         arfQv3SBLvuVc3bDhhW1TCIoaJ0oq3nN1drWALY9v2t1gDa1Fxyvj9frJi3PXV2Or1dG
         otzg==
X-Gm-Message-State: ACrzQf3B8KbwkcEu90XwwlYJgzqyq94DOtnmVxlAxJCQlaN237VACR1h
        upSyYcb7F7dTGDnFosK+4Ujy7A==
X-Google-Smtp-Source: AMsMyM6u2fZyvcRB2sCwnQ38Ns95A5PFsTtukBYF2ddfLMppMdFmN6x0MPy+enNFQEE81mQAGyULkg==
X-Received: by 2002:a05:6512:c12:b0:49b:755d:fde9 with SMTP id z18-20020a0565120c1200b0049b755dfde9mr4656911lfu.181.1664011750727;
        Sat, 24 Sep 2022 02:29:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c24-20020a196558000000b0049472efaf7asm1828118lfj.244.2022.09.24.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:29:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH] arm64: dts: qcom: sc7280: assign DSI clocks
Date:   Sat, 24 Sep 2022 12:29:09 +0300
Message-Id: <20220924092909.175418-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The driver (and the DT schema) requires us to assign DSI clocks in the
DT node, so that the clock tree is setup propertly.

Fixes: 43137272f0bc ("arm64: dts: qcom: sc7280: Add DSI display nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 13d7f267b289..d5c01ee1d2fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3636,6 +3636,10 @@ mdss_dsi: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi_phy 0>, <&mdss_dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-- 
2.35.1

