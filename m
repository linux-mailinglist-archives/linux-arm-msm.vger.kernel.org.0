Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B59C2648773
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 18:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiLIRNa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 12:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiLIRNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 12:13:23 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D49450A9
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 09:13:20 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso5619302pjh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXmK3nCiI+cY6qMJ9PawYnDke2Ff9u+237akMobAAqY=;
        b=IqgadLnjVNwyCp2QMMG0Nu8AsLBPgJgJ3n8Je131hOobY9YARQ0RMklSCn/mpKZ/DP
         Ro2PNmTYWvF/xo/40eE+NsHshil39bw/D+I2JWiRk3M1SRUzPSiTLu6MpVQlMSzjfcYl
         fZUOMiob21JBgRv01lTZvlInVn+OKcqRRPHgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXmK3nCiI+cY6qMJ9PawYnDke2Ff9u+237akMobAAqY=;
        b=U0cv0z5PvrN/+N/XGJ2rekcf0i//eVLe1+n6PBSZ/dGKrA4blj++x1c4CS1OjP/MRR
         QZiteAF3R5gtKT4rrirv5oy8DwGMxQFpRyoH5clZ6FWrODCQv17bNTiORulQMTQZ9ZFS
         /NfEYmnKHF0D7ow4SdKHZv0k1vI5Xq11RsG3lnzioCTU0KwPakI7VV8224M5gNK5Ccju
         iT8hrgOIvQ3gFhLv4T3VrKeNXyTHTXJJ7Fqvppwu4RnnQv52WcxZ/fSevQOcmR7khrsM
         wfKmnIZtAJG7t/WoKBRIHd/XW/Vv5nmLGoAoIiZ/Dx9E/5BC8zHXDCva1g6cYreQmkky
         vMSw==
X-Gm-Message-State: ANoB5pl/PnkS8/x4B9u4UomUhq4jUKsya7nYn1dkx3Ml54p3faGb7PWZ
        7efStpmDDU5lGsS69M+YMA7elA==
X-Google-Smtp-Source: AA0mqf4E+hKNzII74vjCTHWDSOlIGqI7LLSVAx/UJE8yG1YELb55UaxBwq/en6iLoY+Fp7tg31MhsA==
X-Received: by 2002:a17:903:4283:b0:189:7100:c50e with SMTP id ju3-20020a170903428300b001897100c50emr7136974plb.48.1670605999890;
        Fri, 09 Dec 2022 09:13:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9a82:7898:7bf4:b4f])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902da9000b00189c62eac37sm1597503plx.32.2022.12.09.09.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:13:19 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     swboyd@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        mka@chromium.org, Yunlong Jia <ecs.beijing2022@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add pazquel360 touschreen
Date:   Fri,  9 Dec 2022 09:12:40 -0800
Message-Id: <20221209091234.v3.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209171240.1614904-1-dianders@chromium.org>
References: <20221209171240.1614904-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The touchscreen was supposed to have been added when pazquel360 first
was added upstream but was missed. Add it now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v3:
- Removed hid-descr-addr

 .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
index 5702325d0c7b..ff9dd6857f8b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
@@ -14,6 +14,25 @@ &alc5682 {
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

