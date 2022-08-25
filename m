Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB10E5A16FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 18:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242563AbiHYQnT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 12:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243106AbiHYQm5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 12:42:57 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95577BB90B
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:33 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u22so18983068plq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ijJ2pkBNHuBjJLx62XRRrMsVukQZ0pijiSuWRTmAOcg=;
        b=FpUumiYM8PyUzChNl+dISlDVe7Ai2xqr2SdiKrR7DU58rUk32wTu1pmwoOOTmreBFa
         T0ew/JfVd1fq4tsP+C1diInxwaM4HSRNiRoHIMWkVrQ3/2C4HwULW7jDpKbMJIuEclk9
         Z9beSIC5CFYLM911N+vPTLGPsJD/K/tX79q1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ijJ2pkBNHuBjJLx62XRRrMsVukQZ0pijiSuWRTmAOcg=;
        b=q9N0cqygm9NreYwMyrp25SymDYjqOMXUvRjX1Q2o7NQQr2nmbUW+N2tnLwT74TBN1Y
         hTfS1z+bMH+lodB9WpCjRrJWpyknvHjLv9TLcE+HwS5JAzTeYNqxSAxg2Q85BptcM2pV
         /YtKw146x8uWHzXLsakfU9SXVUYxi8mSdar94MxkgyOXOeN33yLdP9/D/etwFRw/My5Y
         UEC0VuHWlt2608D0mUTEDmFdcvsgcHM10u5/3ADtAfbU0p87eV7/B1gbrXXYtKp2BbXS
         RtktPDO9ctDafmYMbqLUOL93shbF8NQ0/X35oWuw1a7r/lJtMcgTgCdwoEwqDYYblKpD
         bpxQ==
X-Gm-Message-State: ACgBeo1T0AK2Q7FrZrzkSx6XnuVEJJawiR3lkTGLZL/wXsEfVlYqjRGN
        BYSzOpEw88dRkG/NahiD6Ko7LQ==
X-Google-Smtp-Source: AA6agR5qJDtbVVpWXZGCSxH+GzWXDOfrZz/xVX1OL4NkcvTQOPMSawsKsdQDaPTw7mTSVKdhn7tFZg==
X-Received: by 2002:a17:902:ea0e:b0:16f:11bf:efe5 with SMTP id s14-20020a170902ea0e00b0016f11bfefe5mr4648992plg.57.1661445752765;
        Thu, 25 Aug 2022 09:42:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b7f2:d739:e847:6e53])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a154d00b001f2ef3c7956sm3775799pja.25.2022.08.25.09.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
Date:   Thu, 25 Aug 2022 09:41:59 -0700
Message-Id: <20220825094155.1.Id59c32b560c4662d8b3697de2bd494d08d654806@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220825164205.4060647-1-dianders@chromium.org>
References: <20220825164205.4060647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This board uses RPMH, specifies "regulator-allow-set-load" for LDOs,
but doesn't specify any modes with "regulator-allowed-modes".

Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
get_optimum_mode(), not set_load()") the above meant that we were able
to set either LPM or HPM mode. After that commit (and fixes [1]) we'll
be stuck at the initial mode. Discussion of this has resulted in the
decision that the old dts files were wrong and should be fixed to
fully restore old functionality.

Let's re-enable the old functionality by fixing the dts.

[1] https://lore.kernel.org/r/20220824142229.RFT.v2.2.I6f77860e5cd98bf5c67208fa9edda4a08847c304@changeid

Fixes: 5b85e8f2225c ("arm64: dts: qcom: sa8155p-adp: Add base dts file")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index ba547ca9fc6b..ddb9cb182152 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -43,7 +43,6 @@ vreg_s4a_1p8: smps4 {
 
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-allow-set-load;
 
 		vin-supply = <&vreg_3p3>;
 	};
@@ -137,6 +136,9 @@ vreg_l5a_0p88: ldo5 {
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7a_1p8: ldo7 {
@@ -152,6 +154,9 @@ vreg_l10a_2p96: ldo10 {
 			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l11a_0p8: ldo11 {
@@ -258,6 +263,9 @@ vreg_l5c_1p2: ldo5 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c_1p8: ldo7 {
@@ -273,6 +281,9 @@ vreg_l8c_1p2: ldo8 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10c_3p3: ldo10 {
-- 
2.37.2.672.g94769d06f0-goog

