Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0B064761F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 20:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiLHTVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 14:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiLHTUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 14:20:39 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FB299F2A
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 11:20:37 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id g10so2458333plo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 11:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SghZa+kW7wIj2RUcdePRPR1tV1IHuHFiC2Ew9exQVO0=;
        b=ak7msN6Am+PYdy9SBwDyO8HiaGzwCdF79wcoo7pb8KdOw8kNKiwvT04KD8UeG3l4yf
         GHh80N84AQqX/dKIQiW+9jBDoDh48Vvk/EYWPaYl9SreZxA583cg2J/RuMvZaT2uBUXF
         DerpsC3NQVtxvjdcQP0Sp8sv2U5KgcCeb+5A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SghZa+kW7wIj2RUcdePRPR1tV1IHuHFiC2Ew9exQVO0=;
        b=tHaJ38EOXpH1Qr/duGh6ixGn1CLu1XWhs1pYHi2EzBhh3igEZK+RjsAKQ4uee1ZbTz
         X8ew2Ls0pbtzf8tm1zjYuaXuIzp3UxCEwmFFAnHnQ9YOE54iyv29Vr/kqmrmvN5KeBBe
         r7pSl18lrxzhJ9H6053o0lChu7+f/d715X6uo15xetuPfJcwtGqPQGNVKKBLqknwxMMe
         Y56UkxepqUPJYLPaU4SCyako2ZrCiJhELLhhmW/M7z9lcFNd5pWXr5awP1vU9uR7oAjR
         mQAXDG+yIOGJIKsck43jjOuvI1fA95y/QgHFtSUKliuADeKSeSyy6w3L6j9fnijnCIU4
         +PPw==
X-Gm-Message-State: ANoB5pnpCS5z2Pu3H/D4+aYSneuiu8v0KyV4DA5xBrw7mJC+42BNexGv
        FGq+EByYhQ+7qJzv9AxFMquqew==
X-Google-Smtp-Source: AA0mqf4m92QMQvWjvOsl2lEdbxbWHxT+FcSa9B07bLEQjj7z+eqgTBCjsv8IKmgo4AM2FSVhzN8t3w==
X-Received: by 2002:a17:902:f7ca:b0:189:b203:9e2f with SMTP id h10-20020a170902f7ca00b00189b2039e2fmr2971988plw.56.1670527236814;
        Thu, 08 Dec 2022 11:20:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3aa1:2c62:9ac:4468])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b00186a2274382sm17112019plf.76.2022.12.08.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:20:36 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     mka@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: sc7180: Add pazquel360 touschreen
Date:   Thu,  8 Dec 2022 11:20:05 -0800
Message-Id: <20221208111910.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221208192006.1070898-1-dianders@chromium.org>
References: <20221208192006.1070898-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The touchscreen was supposed to have been added when pazquel360 first
was added upstream but was missed. Add it now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
index 5702325d0c7b..54b89def8402 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
@@ -14,6 +14,27 @@ &alc5682 {
 	realtek,dmic-clk-rate-hz = <2048000>;
 };
 
+ap_ts_pen_1v8: &i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@10 {
+		compatible = "elan,ekth3915", "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		hid-descr-addr = <0x0001>;
+
+		vcc33-supply = <&pp3300_ts>;
+		vccio-supply = <&pp1800_l10a>;
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &keyboard_controller {
 	function-row-physmap = <
 		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

