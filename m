Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B861F61EF79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbiKGJqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbiKGJqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:46:31 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5795B18374
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:46:28 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso9761989pjc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roGc4+qz6FYoa6IVuyPxJOvm0gSmGM4+cpEPDr2Izhk=;
        b=QgiK9dLeRRmJfnLqrlHoI83I4QQexT5FQvf85mP8tTluXwWT3nllG8dMRpqN5OWnU8
         b6sb9ZU+nPJOBO09F4beDhq2KRxgIKPh0LlCyXxzXr3dE/99y5cV26y/s6cstjdBqPL6
         OigpcHHQDcAVpB0HtAtL9FhJ9ZF6GpPnBjynuXi9CX3JXPlpe8LlI8DP9IdupHoFrAhW
         BZWnue4a7T7OVQDmUj7szd4fAts9pmfjJgHlgblr1Je8SPmBqoykjqxhJ3o8ACCOxT3v
         M2aY6gwQowpHV0N0V2XBO2b7c2cbRwFbFBIUeJgcdF2KXZUG/S/SSSWdpnzne683H7ib
         uQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roGc4+qz6FYoa6IVuyPxJOvm0gSmGM4+cpEPDr2Izhk=;
        b=UzRTDQNQe5InoVl8vNgkhxZTaCsbqr0tGuDeLv3Bf0vVJ/jGP2H+SiukPVGc+9wUU8
         XlbvEE9Blk5M4nP3T4MEgEsuaLDa4Hkdat0pBXmDtx6k+ZEtGosXediYg79SA71fRkMk
         oTGH5zdA4yaK4hZp9DOftU0iHuy3uxXo6vAprJNUJIZZ3wsKXwkgxgxGsjvLkguLcoTR
         08j+X4N6xrO+gMDRAVLKn0c8nbHJx2+POOWcgBLjRtf8/M1q1Xc93rSiCcwFiA8o3KWL
         +lad2LUIGUEatVAB4Q/qtW8dFRLkVCIqvWqeUds+WZW2sloPBJgSG/TljIoFlXhI/U8W
         6eyw==
X-Gm-Message-State: ANoB5pliGVRzDPgBV/qOjoD08Z/nLeHPAYP6+L6++pA4uQP23GokPGtV
        KP3emIeT3uWDLALrSE6mPgOjFw==
X-Google-Smtp-Source: AA0mqf7D+7PfKldkBkiX1jwGwvnkkBhb0OkyzgetNWSKblW2yySKx/z7s+SMT6aF+IT0XEUou5OicA==
X-Received: by 2002:a17:902:cf07:b0:188:7e83:c5f1 with SMTP id i7-20020a170902cf0700b001887e83c5f1mr5593993plg.58.1667814387820;
        Mon, 07 Nov 2022 01:46:27 -0800 (PST)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902c94200b00186dcc37e17sm4564936pla.210.2022.11.07.01.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:46:27 -0800 (PST)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v11 5/5] arm64: dts: qcom: sc7280: sort out the "Status" to last property with sc7280-herobrine-audio-rt5682.dtsi
Date:   Mon,  7 Nov 2022 17:43:45 +0800
Message-Id: <20221107173954.v11.5.I4c6d97e6f3cf8cdc691d2d4519883c3018dd4372@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To keep diffs clean, sort out "Status" to last property.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v11:
- sort out the "Status" property with sc7280-herobrine-audio-rt5682.dtsi

 .../dts/qcom/sc7280-herobrine-audio-rt5682.dtsi    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
index 2dbdeeb29ecec..fc7a659dfe4ae 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -13,14 +13,14 @@ sound: sound {
 		compatible = "google,sc7280-herobrine";
 		model = "sc7280-rt5682-max98360a-1mic";
 
-		status = "okay";
-		audio-routing =
-			"Headphone Jack", "HPOL",
-			"Headphone Jack", "HPOR";
+		audio-routing = "Headphone Jack", "HPOL",
+				"Headphone Jack", "HPOR";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "okay";
+
 		dai-link@0 {
 			link-name = "MAX98360";
 			reg = <0>;
@@ -50,8 +50,8 @@ codec {
 };
 
 hp_i2c: &i2c2 {
-	status = "okay";
 	clock-frequency = <400000>;
+	status = "okay";
 
 	alc5682: codec@1a {
 		compatible = "realtek,rt5682s";
@@ -75,8 +75,6 @@ alc5682: codec@1a {
 };
 
 &lpass_cpu {
-	status = "okay";
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>, <&mi2s0_sclk>, <&mi2s0_ws>,
 			<&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
@@ -84,6 +82,8 @@ &lpass_cpu {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	status = "okay";
+
 	dai-link@0 {
 		reg = <MI2S_PRIMARY>;
 		qcom,playback-sd-lines = <1>;
-- 
2.34.1

