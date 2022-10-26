Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE7C60E9BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 22:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiJZUEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 16:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234747AbiJZUEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 16:04:08 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FB910CF8F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 13:04:07 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id mi9so3364937qvb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I69Zy+eBkLEpLnPbCVtCr+lW3hmKUksCslyxamftAo=;
        b=g1+d1Kw0pvIFhB+RjVtdnJXxuNZVtmjd4lpFq0YQkzmXp9NSoHt6sgqNHf8KFBAc4I
         /+sDTgDP40Uyr76x6FgGrFQSQ6ebbaEvKhivMaqLvVyPpOvLA0HvUa51b595dE3YRLqa
         UGuQz2L5AYWzIQXIy0KgfiERC0C2b5RuV2/4lsce2QkWS/qflExs3KTiWFqBIh4Yg8Kp
         54ra0AwK51pYRWHg/kSpKbUSlm/w5wRICMfSZoA3gyaRrHKHHhzrYjL3IXdqGR2vvGLB
         /4IYLFxDqBbkSwv7AHwsvL4e3l0piWrCjJFgg0KGf+E3QC5OspsSZlWCGIpvLkueyzd8
         j5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I69Zy+eBkLEpLnPbCVtCr+lW3hmKUksCslyxamftAo=;
        b=wOMP06HVUDJ9tDHX6jBP27cDOIH2LS9qUjGtWM68PFD6RDZvNI3B1z5mXc4OpsbVPX
         DEqxshQ9eGzNW0IYrUZEwM+EviorT8MWjNJPHWho8Y+8jds4YQfn0SWM0HDnDeYhU6NN
         b2f2QJmk3/rFNkbQacRZc7i/3qNP2O42UffFJJmhzbV3UDBhb9C78QQ2UMpsv/6OgQU7
         xhqRPnG9AnQZuSWOdt5U1bWPWtbX+VAkVZLnu0FaA6sS1XhVm8/FxG3moKyfw7QTXQn7
         AqCvWlyQ3r4wArW8PgLJ/WA/dVL88LDLTq6VyRmAuIFuLsKPsHN9GU89vGDq2bjdfiVS
         gaEw==
X-Gm-Message-State: ACrzQf1EPucRj4nB/QBeclKa3BTMoLrscXaXMh0nMZi4QeY9tGL7KAVs
        Qwz1sil8ixtW9LoMtKpBIznFsg==
X-Google-Smtp-Source: AMsMyM73a1oynvfy1v4YrEeqUwACBe7tyz2zuBTsaDQy1tHN6OiYSIj+H50fKDKBHlBVaGY8Xl8o9w==
X-Received: by 2002:a05:6214:2346:b0:496:ba45:bdb0 with SMTP id hu6-20020a056214234600b00496ba45bdb0mr39010792qvb.47.1666814646760;
        Wed, 26 Oct 2022 13:04:06 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id de30-20020a05620a371e00b006e99290e83fsm2942089qkb.107.2022.10.26.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 13:04:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sm8450-hdk: add SDHCI for microSD
Date:   Wed, 26 Oct 2022 16:03:56 -0400
Message-Id: <20221026200357.391635-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026200357.391635-1-krzysztof.kozlowski@linaro.org>
References: <20221026200357.391635-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDK8450 has microSD card slot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 3ccbdd2ed734..f4a5f1a8e573 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -426,6 +426,18 @@ &remoteproc_slpi {
 	firmware-name = "qcom/sm8450/slpi.mbn";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_1p8>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 
@@ -461,6 +473,13 @@ pinconf {
 			bias-pull-down;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart7 {
-- 
2.34.1

