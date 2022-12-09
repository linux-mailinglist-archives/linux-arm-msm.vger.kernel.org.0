Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CB5647BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 03:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiLICGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 21:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiLICGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 21:06:33 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDFE7D09F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 18:06:31 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so3493203pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0omoS8MV63r00CQ4nuB53paFZYXNiG9HsPf+U2WQ9E=;
        b=O4yy6UsxnWqGe50OUXK/YusUbzxacCc+N5R9BOXPdal/QmHY1KoPpyZctKQLKDv0ak
         MptSgrP4NdoW4dHXcnnvPBYuym7kvA3eWaJ4mYZRA2SJpD6izPHnjseMkvsn/kEZ04Hz
         cfhvD39RtRENpEb5HAg0O0mLSi/ZUKvxYYYMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0omoS8MV63r00CQ4nuB53paFZYXNiG9HsPf+U2WQ9E=;
        b=jwFe+EV5gMMDtrkQbk6UQ3fQsbBQ7jrBiUbit0MVuTysO6ftvQ0FgOlYdl7U5DFD4w
         uWhfX8Mjg3VgtZ+dz0p8Qh14me2mnp4Lc3LtWiNQvJSQVP/5HseCfsmKBDfqHBA42As0
         Eh2JdrzLLPAkYm98UIaMOqjxxut2Gq66flzNnVNW26OBd3Mq04P4hcS4Vc30+biveOU1
         Y3g8AyuLLO+lScdzprQekdyBYTyhWQOzvAXNyYkRSYRX+tpu8xWo5gqKWCn/nujY9wAY
         TwanzJ+KN4POIoGUNGiqSY1gfXV3XbOHX8B3QAFP6WjlJ0SymuqK/qi6itBMHf0Kxmp+
         /0Wg==
X-Gm-Message-State: ANoB5pnENVjX22ftBisFjNnVMkhlGm6NuuJUv8ouhQrCo72EeL2PgEpN
        rcCJV+BqHqeEWJZenlgcWAlT9w==
X-Google-Smtp-Source: AA0mqf64PcrLWIDFYeS/Kz+OWZHuGTsz4ytUjwNxhf1DM0bLkNvNuYQBcOrll7VfVp2FVwLXX3/ZHg==
X-Received: by 2002:a05:6a20:d903:b0:a3:9dd1:6d38 with SMTP id jd3-20020a056a20d90300b000a39dd16d38mr5453853pzb.25.1670551591279;
        Thu, 08 Dec 2022 18:06:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9a82:7898:7bf4:b4f])
        by smtp.gmail.com with ESMTPSA id h3-20020a17090a648300b00218ddc8048bsm233473pjj.34.2022.12.08.18.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:06:30 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, mka@chromium.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc7180: Start the trogdor eDP/touchscreen regulator on
Date:   Thu,  8 Dec 2022 18:06:10 -0800
Message-Id: <20221208180603.v2.3.I7050a61ba3a48e44b86053f265265b5e3c0cee31@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209020612.1303267-1-dianders@chromium.org>
References: <20221209020612.1303267-1-dianders@chromium.org>
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

Now that we've added the `off-on-delay-us` for the touchpanel
regulator, we can see that we're actually hitting that delay at
bootup. I saw about 200 ms of delay.

Let's avoid that delay by starting the regulator on. We'll only do
this for eDP devices for the time being.

NOTE: we _won't_ do this for homestar. Homestar's panel really likes
to be power cycled. It's why the Linux driver for this panel has a
pm_runtime_put_sync_suspend() when the panel is being unprepared but
the normal panel-edp driver doesn't. It's also why this hardware has a
separate power rail for eDP vs. touchscreen, unlike all the other
trogdor boards. We won't start homestar's regulator on. While this
could mean a slight delay on homestar, it is probably a _correct_
delay. The bootloader might have left the regulator on (it does so in
dev and recovery modes), so if we turned the regulator off at probe
time and we actually hit the delay then we were probably violating T12
in the panel spec.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 18 ++++++++++++++++++
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi |  8 ++++++++
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi  |  8 ++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index d3cf64c16dcd..b3ba23a88a0b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -85,6 +85,24 @@ map1 {
 	};
 };
 
+/*
+ * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
+ *
+ * Sort order matches the order in the parent files (parents before children).
+ */
+
+&pp3300_dx_edp {
+	/*
+	 * The atna33xc20 really likes to be power cycled to keep it from
+	 * getting in a bad state. This is the reason that the touchscreen
+	 * rail and eDP rails are separate from each other on homestar (but
+	 * not other trogdor devices) Make sure it starts "off" at bootup.
+	 */
+	/delete-property/ regulator-boot-on;
+};
+
+/* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
+
 ap_ts_pen_1v8: &i2c4 {
 	status = "okay";
 	clock-frequency = <400000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
index e27a769f8cd4..5aa7949b5328 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -34,6 +34,14 @@ pp3300_brij_ps8640: pp3300-brij-ps8640-regulator {
 
 &pp3300_dx_edp {
 	off-on-delay-us = <500000>;
+
+	/*
+	 * It's nicer to start with this regulator enabled. The
+	 * bootloader may have left it on and it's nice not to cause an
+	 * extra power cycle of the touchscreen and eDP panel at bootup.
+	 * This should help speed bootup because we have off-on-delay-us.
+	 */
+	regulator-boot-on;
 };
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index 3188788306d0..e52b8776755d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -15,6 +15,14 @@
 
 &pp3300_dx_edp {
 	off-on-delay-us = <500000>;
+
+	/*
+	 * It's nicer to start with this regulator enabled. The
+	 * bootloader may have left it on and it's nice not to cause an
+	 * extra power cycle of the touchscreen and eDP panel at bootup.
+	 * This should help speed bootup because we have off-on-delay-us.
+	 */
+	regulator-boot-on;
 };
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

