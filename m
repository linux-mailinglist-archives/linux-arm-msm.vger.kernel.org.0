Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910D164A6FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 19:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiLLSYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 13:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbiLLSYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 13:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7BEFCD8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 10:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670869406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=59XhlXC9Hqnb96mVLMejnqpQvDSEyia1t81oDMf3rF4=;
        b=JTqEjX9u/lH16XVhEiV+/9XndK9++qBr2U7akzfLigLMjIFyqq2QoJYqEf+YKcRbqUqaMJ
        g6o9PJ6h5gAgFga90c8IkZYlLW9rnVr9M7ueI28uv2NYzk/f11XJLXB8yFswLvfmbthg0a
        sQWOv+lazotG30ZWtsT1DlowO3vjXTI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-QfuBte7OM9-2iS6emawzsw-1; Mon, 12 Dec 2022 13:23:24 -0500
X-MC-Unique: QfuBte7OM9-2iS6emawzsw-1
Received: by mail-qt1-f198.google.com with SMTP id ew11-20020a05622a514b00b003a524196d31so12131305qtb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 10:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59XhlXC9Hqnb96mVLMejnqpQvDSEyia1t81oDMf3rF4=;
        b=wDFMumoWlqv6/QKk9Es45R3EDogdN+vuXIOpZkqGewUvbqURNTg3Ssv+LSJMhi/wI1
         TIT5eD4IqDGFoxVZ9yjwvMRir6ltm0KxiWbYlETPPhAcTdYw2Ohy7TTEAUXY2VWBNY+z
         SWxpBReVoLr8y+bX51Ttv690ft5+2WaucovOGBOombi40UlI8NfPuCm6CGdlDga6F3PP
         PjjHJZCtzs23RFRLjb1uw34NCL61O1OigeyWIKjiJ8IM19TbHzgLCO2Uzidn3TzInNKB
         QWd73fgMXGxPCaiq7tMf2QSeujRqIKbHD0DH2mX+bLTftVGEJM7nMhSvzlfGuewdvgN5
         uOuQ==
X-Gm-Message-State: ANoB5pkM4/YmY47McPPBRgSQudz0ZQf8YctCfot7OKr1m/4nVweYkXIs
        Edz7n6Ju6P3MmKe0De+plH/67862+cLOPK19l3Zy92juPF8hH6gSNymBmqF5rdFgv4GV0OqB9mY
        /SVOukptNmIvREl4hk1EGeWq4hg==
X-Received: by 2002:ac8:708b:0:b0:3a8:1ba:b8ab with SMTP id y11-20020ac8708b000000b003a801bab8abmr21142503qto.6.1670869404411;
        Mon, 12 Dec 2022 10:23:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5UXhj3fdLVAh/KYD8/5J50NlN2rNT2F471pyVk9QirermmRj3iIa+JnNhXUrQjNjJcqJkxFA==
X-Received: by 2002:ac8:708b:0:b0:3a8:1ba:b8ab with SMTP id y11-20020ac8708b000000b003a801bab8abmr21142482qto.6.1670869404215;
        Mon, 12 Dec 2022 10:23:24 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id 3-20020ac85643000000b003a816011d51sm1998185qtt.38.2022.12.12.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:23:23 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com, quic_shazhuss@quicinc.com
Subject: [PATCH 1/4] arm64: dts: qcom: sc8280xp: rename i2c5 to i2c21
Date:   Mon, 12 Dec 2022 13:23:11 -0500
Message-Id: <20221212182314.1902632-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182314.1902632-1-bmasney@redhat.com>
References: <20221212182314.1902632-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the downstream 5.4 kernel sources for the sa8540p,
i2c@894000 is labeled i2c bus 21, not 5. The interrupts and clocks
also match. Let's go ahead and correct the name that's used in the
three files where this is listed.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Fixes: 152d1faf1e2f3 ("arm64: dts: qcom: add SC8280XP platform")
Fixes: ccd3517faf183 ("arm64: dts: qcom: sc8280xp: Add reference device")
Fixes: 32c231385ed43 ("arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree")
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 551768f97729..1ab76724144d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -326,11 +326,11 @@ &qup2 {
 	status = "okay";
 };
 
-&qup2_i2c5 {
+&qup2_i2c21 {
 	clock-frequency = <400000>;
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&qup2_i2c5_default>;
+	pinctrl-0 = <&qup2_i2c21_default>;
 
 	status = "okay";
 
@@ -598,7 +598,7 @@ qup0_i2c4_default: qup0-i2c4-default-state {
 		drive-strength = <16>;
 	};
 
-	qup2_i2c5_default: qup2-i2c5-default-state {
+	qup2_i2c21_default: qup2-i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 568c6be1ceaa..284adf60386a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -531,11 +531,11 @@ &qup2 {
 	status = "okay";
 };
 
-&qup2_i2c5 {
+&qup2_i2c21 {
 	clock-frequency = <400000>;
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&qup2_i2c5_default>;
+	pinctrl-0 = <&qup2_i2c21_default>;
 
 	status = "okay";
 
@@ -801,7 +801,7 @@ qup0_i2c4_default: qup0-i2c4-default-state {
 		drive-strength = <16>;
 	};
 
-	qup2_i2c5_default: qup2-i2c5-default-state {
+	qup2_i2c21_default: qup2-i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
 		bias-disable;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..875cc91324ce 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -827,7 +827,7 @@ qup2_uart17: serial@884000 {
 				status = "disabled";
 			};
 
-			qup2_i2c5: i2c@894000 {
+			qup2_i2c21: i2c@894000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00894000 0 0x4000>;
 				clock-names = "se";
-- 
2.38.1

