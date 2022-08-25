Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A875A171A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243082AbiHYQns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 12:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243229AbiHYQnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 12:43:15 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18321BB037
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 142so1221342pfu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0TbBYS0Nqh3bgSdnakQbiIorETtqlVR3C7+nG6SfSzA=;
        b=A1CPNa0ANiPIdOyEFNl/pcWWHZNCIdrC1EKRfKXZhZ3NFYRg1PtX1Htujhmy2fze4Z
         /sL7i/WiChF1ZA4G4yrV3SHo/peV+S3COXHuyBg9SJMbLojnHVFCdT51DvjJWG2SbJWJ
         VCq61CHAOGfIFj/j+Bbdp4F9a0Ndbywt3RpXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0TbBYS0Nqh3bgSdnakQbiIorETtqlVR3C7+nG6SfSzA=;
        b=u8PRbAHZy4oEoT5aPu0qtX6szQynpZHQGp8vQ5nZHz88hnWAZEoP3ErwDoskTb93sV
         SHmU1iN4T9lb69y0IIBz5M6I+ZRha9Kd8jLEI0a9/uslds7RKfg4zLlukaBFcCohT16X
         vHlZCt+7qOYVMUbIG2SI8iK7TgPUAurh2R+T+0rdWjpHaSb+LKAephO3r2MVdyJok1Ua
         iB/b/ea+gmuIzWgbMsQ3GbyZDbih7cvP8i85y/XJqiQ58TSCxu0tUROgoxvEcbjRjDWE
         jKJP+R+Vn0JwaXE0lnb1maL+Sg8HOkNSdaKW1lPf+WCwigShbKWR1nNbQxb/dzWel6+o
         l9Qg==
X-Gm-Message-State: ACgBeo13pHA4S4CT/twhoQb9V7EI/Un8y85/WoD8bKNJKpoPGghsJbom
        0hvC0yHGMpo4wSa0HStRirrVBA==
X-Google-Smtp-Source: AA6agR5MmHBCUIcOi+TPd/VfpEsc9JppoQPMwYiyP0TdPFlQEA0rngeqizMGLf0HZoAfvsUcrLLL8Q==
X-Received: by 2002:a63:e102:0:b0:41b:3901:990e with SMTP id z2-20020a63e102000000b0041b3901990emr3893320pgh.107.1661445764637;
        Thu, 25 Aug 2022 09:42:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b7f2:d739:e847:6e53])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a154d00b001f2ef3c7956sm3775799pja.25.2022.08.25.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:43 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed
Date:   Thu, 25 Aug 2022 09:42:05 -0700
Message-Id: <20220825094155.7.I6799be85cf36d3b494f803cba767a569080624f5@changeid>
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

Fixes: 9208c19f2124 ("arm64: dts: qcom: Introduce SM8350 HDK")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0fcf5bd88fc7..69ae6503c2f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -107,6 +107,9 @@ vreg_l5b_0p88: ldo5 {
 			regulator-max-microvolt = <888000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6b_1p2: ldo6 {
@@ -115,6 +118,9 @@ vreg_l6b_1p2: ldo6 {
 			regulator-max-microvolt = <1208000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7b_2p96: ldo7 {
@@ -123,6 +129,9 @@ vreg_l7b_2p96: ldo7 {
 			regulator-max-microvolt = <2504000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l9b_1p2: ldo9 {
@@ -131,6 +140,9 @@ vreg_l9b_1p2: ldo9 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes =
+			    <RPMH_REGULATOR_MODE_LPM
+			     RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
 
-- 
2.37.2.672.g94769d06f0-goog

