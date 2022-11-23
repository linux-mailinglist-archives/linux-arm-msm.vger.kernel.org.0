Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5F3636C1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbiKWVID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239007AbiKWVHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:07:24 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C453F9CF45
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:23 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d6so29926223lfs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
        b=Kf4SprGXwmWQD1w1Eg+ZWR96Y2yqFyXQOmFqvsW8zgQDUtORvrH2Wj77QW91QTlmdd
         fnFyMpHRvDQ03vg3G00KtRkwx5GN04XcCyCP9tZAS2nipIJvNq8z7lOPacpYo2HehudD
         XTsLEnZdCvdaSVv/dsJdwpH11pf4yWnT2uGy6qogQEItoS7gad17or56seop77pSus/D
         0dmMCE38pY4nXsGvx0+N8BcDdRQe8rWNTL0CKrL221dqziJ9NSSNo9AaFJS81nRu3OGY
         quoZLkAlP4+lpufIqLSGaOCrj+r1UJj1h7aHc9nW8D8GIC7COyKghh7z9Vgjp5FFiCo9
         97Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
        b=7XF5qfpj6N5NhdepcpHBQ1seoORiCBUclcOjN7xxOwcOuxJ//S2W8lA+E7i1O2Atmf
         Z64OXyRuahuRpS8N7jFOTU9/TkFHYWr3gVbMcr4xxg2Bm3EH/A9dIXfGjYqy9tzngcgy
         mwdMczP0lPH+EhTC4QOeydH/bPsXSzWsbPrsP2XL0y/bCriqLJUoxlDXisGqpds3WwHh
         piK18147rsGTnL6iDCZ5crsXfU2xqROW66NUzeHgPTz+4dXMSvVCT7TJvdQf/r5ZNnPz
         7ANfa0tgNer+qvBBo++9wKFQqkPLpv+cw4TXhll3zZ8BWARCJkYx3skMD2vMriYxOUrd
         Ru8A==
X-Gm-Message-State: ANoB5plcc8Caw2GjsyAK9iCg+dHR0G6OKAbNWzBKsg0QSgIjJRogDyO4
        St1tj480pEZ5de0tK9afCMfBFQ==
X-Google-Smtp-Source: AA0mqf54YeJAPmU2NPId1oEv6/iBF0eu/nKkdOKIV00Cfq9e1D9bzNS5SuegPBHGrocsj8XfGm9XEg==
X-Received: by 2002:a05:6512:3ca0:b0:4a2:2c4b:8138 with SMTP id h32-20020a0565123ca000b004a22c4b8138mr4390614lfv.14.1669237642180;
        Wed, 23 Nov 2022 13:07:22 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:07:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/5] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date:   Wed, 23 Nov 2022 23:07:16 +0200
Message-Id: <20221123210720.3593671-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add another power saving state used on SM8450. Unfortunately adding it
in proper place causes renumbering of all the opp states in sm8450.dtsi

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index f20db5456765..8cc9f62f7645 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3211,35 +3211,39 @@ rpmhpd_opp_min_svs: opp2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_low_svs: opp3 {
+					rpmhpd_opp_low_svs_d1: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					};
+
+					rpmhpd_opp_low_svs: opp4 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp4 {
+					rpmhpd_opp_svs: opp5 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-					rpmhpd_opp_svs_l1: opp5 {
+					rpmhpd_opp_svs_l1: opp6 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					rpmhpd_opp_nom: opp6 {
+					rpmhpd_opp_nom: opp7 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					rpmhpd_opp_nom_l1: opp7 {
+					rpmhpd_opp_nom_l1: opp8 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
 
-					rpmhpd_opp_nom_l2: opp8 {
+					rpmhpd_opp_nom_l2: opp9 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
 					};
 
-					rpmhpd_opp_turbo: opp9 {
+					rpmhpd_opp_turbo: opp10 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					rpmhpd_opp_turbo_l1: opp10 {
+					rpmhpd_opp_turbo_l1: opp11 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7b2e4b66419a..701401c8b945 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -174,6 +174,7 @@
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
-- 
2.35.1

