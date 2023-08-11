Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EF8779B90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbjHKXrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236565AbjHKXrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:47:45 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95FA171D
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:44 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe2fb9b4d7so21775065e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691797663; x=1692402463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJlZ6gRhW+2E/URYOSdJpnSxOArltFmd1RupCFnL0BY=;
        b=bhnYlNy/4OA5+aG0yHg7cjs+rbg4TwUSEdYMZCCfxpAinj+50gOEei4RQydGhOqWUp
         5/+Z3DTnZDLnUYjxmrMWxaAOrASpZA4Q1AIr8FknviEsvqpsP8h/koyC3ZVIBoDU5Yrc
         1GT8i7ttIuRgKP+hmVZgSixN9Yjn5L0AwEzPsraqcbTqB+FrXWNWSR26QxF2zLz/2VX0
         MPOQvPU/DOwYCww0JFHUtHY3BYgxXCCV+BHSLe/VnBHcnIX7yGWeh5Le3KQTcAEyGa5j
         GZukDf92Z7ebHDb7UvcCqzjMbYEo3X7uGLILfcAJdWLu76kljMcblqXknUg+qHMjEGRw
         ivrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691797663; x=1692402463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJlZ6gRhW+2E/URYOSdJpnSxOArltFmd1RupCFnL0BY=;
        b=cSqw2ZIr3EXrHX/jXrWmSnwXZXdG1kZXycwCeWSqjLE7ZK5k0uKTtyMLP56KjaXfnt
         JL3iaIJNxxCgLj7Gbe/4eiUxLvXj5Kf1OrHLBA0WDCPU8BaAZVLdHIfggKV2d3WkUn2Y
         wwUe63T8d5tvWHPwVRVDG2evby4T7ohIik8Ht+anKtRAktVuaaAuCLgQiRI2E/fJSytT
         aS7Wuo9xGvQJvJTAuiT++v1PI2MwrQeGBzXyQ+2L7WsE2jrMypl94JPAP6C3vJdUfj1c
         XquHtYvCzikRauf2LxikBzPzL+ny9XLbEdDjT3cnWBFKaBkIszkGYHF7Gr+zxFLjoZ3u
         6AkQ==
X-Gm-Message-State: AOJu0YwO67qnXvnseXxJKIgmqllmk8xGo73vMcT//MJUWTv9rNiTTLuL
        e0ZB2Tqr3RmAn4t+g9FhtxCCZA==
X-Google-Smtp-Source: AGHT+IH8CuBm+1SoUr8hbJhGNuWEetgkLkF6n2axqCsGSmtlshV4kJZBepSHLR+Tda5dzQWoeb0mgQ==
X-Received: by 2002:a05:600c:1c13:b0:3fb:b1af:a455 with SMTP id j19-20020a05600c1c1300b003fbb1afa455mr2742860wms.5.1691797663267;
        Fri, 11 Aug 2023 16:47:43 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c025400b003fa98908014sm9599051wmj.8.2023.08.11.16.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:47:42 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/7] arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
Date:   Sat, 12 Aug 2023 00:47:33 +0100
Message-ID: <20230811234738.2859417-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
References: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ov5640 driver expects DOVDD, AVDD and DVDD as regulator supply names.

The ov5640 has depended on these names since the driver was committed
upstream in 2017. Similarly apq8016-sbc.dtsi has had completely different
regulator names since its own initial commit in 2020.

Perhaps the regulators were left on in previous 410c bootloaders. In any
case today on 6.5 we won't switch on the ov5640 without correctly naming
the regulators.

Fixes: 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f6eeb25988465..75b4e5ff7c95c 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -282,9 +282,9 @@ camera_rear@3b {
 		clock-names = "xclk";
 		clock-frequency = <23880000>;
 
-		vdddo-supply = <&camera_vdddo_1v8>;
-		vdda-supply = <&camera_vdda_2v8>;
-		vddd-supply = <&camera_vddd_1v5>;
+		DOVDD-supply = <&camera_vdddo_1v8>;
+		AVDD-supply = <&camera_vdda_2v8>;
+		DVDD-supply = <&camera_vddd_1v5>;
 
 		/* No camera mezzanine by default */
 		status = "disabled";
-- 
2.41.0

