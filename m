Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8938634B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbiKVXhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbiKVXhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:37:03 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA02C605E
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:02 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a15so19624687ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
        b=EDlgWkp3OlyaDWrNvJsNIWgLIYVuQZIYzKiJIOC1ZLqFg/lgJQ0T1TxJE2J51RzJfR
         geYDbHJUMW0VhJfaDjuFsghMtTK14+bGSGWu2ncdiUXNP2BzirW7lHmIv8haxnjveQYF
         x/TVfz4Kb12T8w0sjBB5YnzBZgUjw87roqtF6pTwHE+TSL7cy3szvmtlnFnD0usB5J5b
         qOLm5hoeO/FkV63rEu1iyk1v6UXfjwJp9met0fRRyepSnpltnTyEm5oQ2eo2uHREZSBy
         idobRjUHn+WIItkKaQz3YqLZWPoQY5HYGCrdLYJPV54YEoJGOAyjbB1eK1CmQDc83Zu9
         T9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZRg2hYUZ55Yzoq4hDxZaql963EtJYTAOZ+zJGgmhWA=;
        b=2fD/fKyaWoEBod5LlAT1143uue+i7+XDW2Gakss8GlIt63cCYmmZgqdSPIaNa94TU8
         Zjr3saI+SziJIkefVSReXKJNNWXyiiy+RwsxQuAwe8A+1FAXWPBsBtu2deqNjjv8aACt
         SP75SpavcN6OR1bC/8s7T7Hl62ICf55cCb322PkoB1wB5yBYw+8xAYUE56TUinmm0Xwq
         2GQTvnZqbGVpgGEpYHgJ6xh6tysZh9JgKVoeHBQQ3r/IXT6cCzYA/6h0KecEOzExAkvt
         QgBdyYc7GtTMduQ8T57kM08lRa93rZMovo7NmsQ5ZZvrszOyna0Qe58OJFXId9Nnro6o
         KWTw==
X-Gm-Message-State: ANoB5pnw9Y+/g4+dpKEeQUJUIozyPwDS62eSnL2s4/TLDnBmRuM0B4iz
        /ee0iq5C29elo6xHbYSpF1oMbg==
X-Google-Smtp-Source: AA0mqf5zwUBczXkxLKMF+E+AAp+kHqmVWugsTI1eD54EFn4ZfqP56jOYdGU8gSo8Mhz/sWcMrXpI/g==
X-Received: by 2002:a05:651c:2123:b0:277:328:affb with SMTP id a35-20020a05651c212300b002770328affbmr3487255ljq.376.1669160220986;
        Tue, 22 Nov 2022 15:37:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:37:00 -0800 (PST)
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
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date:   Wed, 23 Nov 2022 01:36:55 +0200
Message-Id: <20221122233659.3308175-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

