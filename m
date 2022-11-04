Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E7B619739
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiKDNOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbiKDNOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:14:04 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113762E9EA
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:14:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u2so6302385ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z653ZyragP85l79izzTl+UNCeX6ImVJawc3srCeRWhs=;
        b=Li2D0pkmDvWiyUO4KNKPJ65HCQ84aC2EXJLc9HL1kPMQTdNt3pt7+bqYQpYCjKlwWm
         cuBwzuYt3dLxI26nWoMISRVOu2q7oauia2fM1atoY7T3qhx6e6Au42tz06BJ8lVxoNhu
         XjshHE3+953F1S58gjXJUhfQE/4vwULhkth8ZjOCvQWD+Hxem+ycsqAPz3mc9MzZquNs
         iib3zdhgVx1ipDZcOJUtRtqcsLHB51DEuDFh2KLG7eXpBWQl9q7enyEskcCSSeU4k2tc
         eIzDN5FmeqmJpycx/SWbf3BW8P3uC/MLtcfzlS0G4uGpPkSfwNPwRmnmHPkBbpA6pTt5
         RMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z653ZyragP85l79izzTl+UNCeX6ImVJawc3srCeRWhs=;
        b=66jktkn/zdKjaDXfmOyJeX4HBLHu4d0mRpgYN8Z8dCUl/4ebCysZstgM1Cnoc7fyJg
         +9a7X5O/q3f6cNTBPMvJUrf2+r96v/mXjczeMYUJf+8VLmG4xCVoa9cQmkTcIcY4eD/F
         Z7BsXasi/73duvwU2zle40QKKtCi+stHYMPbUiLeWeakZDJgqAnguqNwPEe3BzpRCpw9
         KnTqUAzR9qwTblD49OmNgYMu0kN4kJ0i3SF8nAp//mRV7M8S0ROs+VQOt25zNW8jDbMU
         Jke/EOlmFOOIHBhhrRuDduybE92bDY9mICZ3QLMrfARjng8KAczFmnTNlznw/wxfjgu6
         ZWSg==
X-Gm-Message-State: ACrzQf3OV7hVV1X+0sql+XWMoipqagqSI+rrUdf93KmOBzEe3x6JI/aG
        bwV2xOJ8LPD7SY+PW+AurDbiew==
X-Google-Smtp-Source: AMsMyM6Xa1uzq8VNmdLCLapSeOr9U4p+WMZ6ZNJTJBHzgLaYNzYJhlIE+5w/qH62yG+5tbokTXJpQw==
X-Received: by 2002:a05:651c:1034:b0:276:e452:1184 with SMTP id w20-20020a05651c103400b00276e4521184mr2145285ljm.240.1667567641449;
        Fri, 04 Nov 2022 06:14:01 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:14:01 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 1/5] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
Date:   Fri,  4 Nov 2022 16:13:54 +0300
Message-Id: <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index eeff62d0954b..250e6b883ca3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3197,35 +3197,39 @@ rpmhpd_opp_min_svs: opp2 {
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
index 578e060890dd..69aef395d85b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -168,6 +168,7 @@
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
-- 
2.35.1

