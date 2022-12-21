Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9C0652D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 08:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiLUHRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 02:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLUHRn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 02:17:43 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5AC2DA
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 23:17:41 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id x3so515968pjv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 23:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipcTfQuvJXJtZzjg5HEFRy455uYCxwrL5LhsX06QbCs=;
        b=HjzgYbE302j8IJKIV8jpFotxChaSSuyWKlm08ccT2awBmPgN0agV+gDzFkBvyDCEEG
         avs3VtPA0gtH9xS/GzIVvSMymrPRZs6R22Z2n3EqI8TPRDqelIrjuwwaVYlMvv4s8L4R
         SCbU2WIzvxRCLuCB59Bjdi1acwb00KcPZlxes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipcTfQuvJXJtZzjg5HEFRy455uYCxwrL5LhsX06QbCs=;
        b=K/3VFhkYK/9x0da2lgYqGxryDMlqMubNhz1X6acNJ32ZirumijGyFAdsph2Y7jdGn1
         ZFthnoEq4+zNgwEGwd80y3tuRZAm17xvYoR4B3IIcW/WMVrztiTsO3fPTyLrskxHcNdP
         h2E/LZVre9FmbKOXCDuRdV++FI40YUNZqlsHo0aY7nvo2gmh9RATShe421syNUFaDZDo
         E31P9uJER5kgrdwoszLBhflxEJBeAn750DUGdO1OWhCgPONi8RU7tUq2RBJSWJpnHit7
         gU1HsrIF+Wu5UDcvwjZ43YUXuKQtkaLqlzHl6Qvh83sjLY9Xf/3zlIfViPXAJm9w04+x
         Mbsw==
X-Gm-Message-State: AFqh2kojlXm2y8aHghK2tHj09Kek+mPBKTy9NkAKzG9gx4IEXLfhrJuz
        MgA60rzw59tYeDXeClgI8FWOmw==
X-Google-Smtp-Source: AMrXdXsgGVsBTCFNfUcp1pMwbR8YFko6/N5owHwbPkj4GpYFcjLkKkivaUkKNL0p3JZXLKM1M9yXeQ==
X-Received: by 2002:a05:6a20:7b28:b0:ac:184:d297 with SMTP id s40-20020a056a207b2800b000ac0184d297mr1165642pzh.38.1671607061354;
        Tue, 20 Dec 2022 23:17:41 -0800 (PST)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id y33-20020a634b21000000b0048f10379b46sm2754243pga.68.2022.12.20.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 23:17:40 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: add display port audio
Date:   Wed, 21 Dec 2022 07:17:34 +0000
Message-Id: <20221221071734.2887901-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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

Add DisplayPort sound node and lpass_cpu node
in sc7280-herobrine-audio-rt5682.dtsi.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

--
---

 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
index af685bc35e10..69e7aa7b2f6c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -33,9 +33,22 @@ codec {
 		};
 
 		dai-link@1 {
-			link-name = "ALC5682";
+			link-name = "DisplayPort";
 			reg = <1>;
 
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_DP_RX>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp>;
+			};
+		};
+
+		dai-link@2 {
+			link-name = "ALC5682";
+			reg = <2>;
+
 			cpu {
 				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
 			};
@@ -92,6 +105,10 @@ dai-link@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
+
+	dai-link@5 {
+		reg = <LPASS_DP_RX>;
+	};
 };
 
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
-- 
2.39.0.314.g84b9a713c41-goog

