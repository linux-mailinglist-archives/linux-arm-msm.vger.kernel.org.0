Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46D5A522E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 18:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiH2Quy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 12:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiH2Quq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 12:50:46 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099FE7B28A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:50:26 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 76so8764536pfy.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=woneQpwMOMgIO7e0hCdrCZoj4JrbV7vkhMtZpv1/ep8=;
        b=kmSDFY9nq5Z5Qb5YraZhZdKCocvVR+dWWSurViHAeY24Ijr3xQyq61FPn2WNDBleHT
         iiG4iERxcptn2BsoT3XiLjGtMjivx/5G9UueB3ywrsSXZxfv5ftP1eSjabPgj4NKMXrh
         qt8vfKX4rym2utpsMZdYtSymG8SUSMgUAjjAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=woneQpwMOMgIO7e0hCdrCZoj4JrbV7vkhMtZpv1/ep8=;
        b=kAZ9+4ynuM0feuucJeIG+D0GLHWDqD/Y/GpK7xK669/iGiTF6u5p17ba5Z5K5y1myh
         nFP/FyRIMsvTM+4lx0F7sndjdxTLt1w9pySiWLu1dS58sFZajzjsy3OYEg2Be3YvwfyQ
         91lFNHRb0zi9Hp0FnBagg/+aYHEoo1H8QFicoafz6Au4x/Q41dO03S0DjQXtNJ3Y50uj
         d8gAKAg+14xBI/pjA0958ExIpnzX2s7SWc6UOpzVF1a7f7pYyd5iMj7jRytk4yzWME8F
         V79dxNwiL535jg82dn86TyhSfiSoV2OQwPnuuRLBLY6YUaYbUBDclRoL3++wJ2dwTI3I
         AhZA==
X-Gm-Message-State: ACgBeo3I/Cnm1hRhvXJaFPOV66ui0ob7m0CZMV4CVQp9mI7nNeUtw/bW
        0Bll8rqqWBFbF+ffkdlmSahOxA==
X-Google-Smtp-Source: AA6agR4VOEmzb8h688Hlh10n5OC2JGl7tx4FZ9QIiaFqDYhrKJQYQ0M7KGv2bhGU1bVC3w2/4zclgw==
X-Received: by 2002:a63:6a46:0:b0:41a:3e67:67cd with SMTP id f67-20020a636a46000000b0041a3e6767cdmr14844814pgc.94.1661791825380;
        Mon, 29 Aug 2022 09:50:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3a97:5017:7e33:8964])
        by smtp.gmail.com with ESMTPSA id l1-20020a170902f68100b001729db603bcsm7864238plg.126.2022.08.29.09.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 09:50:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed
Date:   Mon, 29 Aug 2022 09:49:52 -0700
Message-Id: <20220829094903.v2.6.I6799be85cf36d3b494f803cba767a569080624f5@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220829164952.2672848-1-dianders@chromium.org>
References: <20220829164952.2672848-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---

(no changes since v1)

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

