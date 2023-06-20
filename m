Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93044736A46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbjFTLFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjFTLFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:05:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C0E101
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:05:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b45e6e1b73so55830241fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687259138; x=1689851138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GKvZ616V2FdbMtm5spz/6erBtMA2Hst579nyomUNLg=;
        b=yBccGiTRR4lEKp1+KYswDniK+5Hxy2l2y74eSoPb3CWHPw1GSHDVzTNLAc283tPjMc
         YL/cfHBno+CXTT6IG1NtuRczYaYtbM1gf/bMzPkxpKl6q1qlS9bRLLpQdJeHyfRg8Yj5
         WRgrux6SQ2jZre54QLUVCAlAUn1gw0QSMAkNTEnHQCb4vKC/0SkimLWvTb1WRpE3grkf
         ejI4KmKkyq1EIxn3/ug/ViqlR9kpO0qY9fjbeaoRQjpG5veeOYFP+kM6Rhl/qwVnHR/X
         /peMJgOfX0jrgA0GuQStggcsbTxF/rC9HxhyaFa5GC8laiobqLeEM1tP52TdpKEe49Dd
         mn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687259138; x=1689851138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GKvZ616V2FdbMtm5spz/6erBtMA2Hst579nyomUNLg=;
        b=G/SsUkED3unjb55nIYWmFH7JZvnVCcQ0Q0cqUB6UF4ukU3Q0Pv4WeQFkn6K8Pgl8AX
         LEn4K+S+lSheKnG7MOi5W52XjV+/qZ50kEzkVUUoUXiqfkr7XEoUUeHqOBQqvOp6aDdY
         tLdi+KUWnD6tygZ8rYs5xk+sv3sEw5k0OMJOBR4Om/Zvv/Occ/+K4ZTWratmue1IWivH
         ZTVuZkyDZBRT3DanXdD9KaRemanS/oZc4QZejyiIoBKNTDgW2oVTay0LH1Pv+86xnnIs
         wdhKtaj75Lhl+v0/TfVQoNUS3eiFhrFDj6sTOFZsO74fDFBhOM0rqirvqwtj/CP8BrIF
         l7Ow==
X-Gm-Message-State: AC+VfDxcPOBJs4U73WwD1FyuPz9G4eLIj6b1L1fcexRbz0iuDZUEquNO
        r/k8MIMcGfQHIZnmWAFlN6yIZA==
X-Google-Smtp-Source: ACHHUZ49AlK3pHJZ4kMbZVdSMohKbXJ1bBkuIzj1NP2HhtyWhnXfvDsVQn0blDlbQIFspveF1zUhZQ==
X-Received: by 2002:a2e:80c9:0:b0:2b1:c039:e977 with SMTP id r9-20020a2e80c9000000b002b1c039e977mr7228915ljg.16.1687259138478;
        Tue, 20 Jun 2023 04:05:38 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm369047ljq.38.2023.06.20.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:05:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 13:05:35 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8250-edo: Add GPIO line names
 for PMIC GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230614-topic-edo_pinsgpiopmic-v2-2-6f90bba54c53@linaro.org>
References: <20230614-topic-edo_pinsgpiopmic-v2-0-6f90bba54c53@linaro.org>
In-Reply-To: <20230614-topic-edo_pinsgpiopmic-v2-0-6f90bba54c53@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259134; l=3755;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=NNKUHsnSrdS4vf/kgCib1So5nPpERojtp2HUS+mt0M8=;
 b=VF7AdfTa283XVSrfTDqN6ZmLAcTISR3/ZP4TLCQwFV8IHYg0+6TxFfeFd2A98bmuyBeU3wZde
 wZc59fQ+AqXAHS8AADnudXyUK0+jdmZ5XcH7AybIkyKVGbx7UPoYEz2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sony ever so graciously provides GPIO line names in their downstream
kernel (though sometimes they are not 100% accurate and you can judge
that by simply looking at them and with what drivers they are used).

Add these to the PDX203&206 DTSIs to better document the hardware.

Diff between 203 and 206:
pm8009_gpios
<                         "CAM_PWR_LD_EN",
>                         "NC",

pm8150_gpios
<                         "NC",
>                         "G_ASSIST_N",
<                         "WLC_EN_N", /* GPIO_10 */
>                         "NC", /* GPIO_10 */
Which is due to 5 II having an additional Google Assistant hardware
button and 1 II having a wireless charger & different camera wiring
to accommodate the additional 3D iToF sensor.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     | 50 ++++++++++++++++++++++
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     | 50 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
index 84104d2b2010..62590c6bd306 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
@@ -15,6 +15,56 @@ / {
 
 /delete-node/ &vreg_l7f_1p8;
 
+&pm8009_gpios {
+	gpio-line-names = "NC", /* GPIO_1 */
+			  "CAM_PWR_LD_EN",
+			  "WIDEC_PWR_EN",
+			  "NC";
+};
+
+&pm8150_gpios {
+	gpio-line-names = "VOL_DOWN_N", /* GPIO_1 */
+			  "OPTION_2",
+			  "NC",
+			  "PM_SLP_CLK_IN",
+			  "OPTION_1",
+			  "NC",
+			  "NC",
+			  "SP_ARI_PWR_ALARM",
+			  "NC",
+			  "NC"; /* GPIO_10 */
+};
+
+&pm8150b_gpios {
+	gpio-line-names = "SNAPSHOT_N", /* GPIO_1 */
+			  "FOCUS_N",
+			  "NC",
+			  "NC",
+			  "RF_LCD_ID_EN",
+			  "NC",
+			  "NC",
+			  "LCD_ID",
+			  "NC",
+			  "WLC_EN_N", /* GPIO_10 */
+			  "NC",
+			  "RF_ID";
+};
+
+&pm8150l_gpios {
+	gpio-line-names = "NC", /* GPIO_1 */
+			  "PM3003A_EN",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "AUX2_THERM",
+			  "BB_HP_EN",
+			  "FP_LDO_EN",
+			  "PMX_RESET_N",
+			  "AUX3_THERM", /* GPIO_10 */
+			  "DTV_PWR_EN",
+			  "PM3003A_MODE";
+};
+
 &tlmm {
 	gpio-line-names = "AP_CTI_IN", /* GPIO_0 */
 			  "MDM2AP_ERR_FATAL",
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
index fae6568cb79e..ea4571bf4fbf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
@@ -30,6 +30,56 @@ g-assist-key {
 	};
 };
 
+&pm8009_gpios {
+	gpio-line-names = "NC", /* GPIO_1 */
+			  "NC",
+			  "WIDEC_PWR_EN",
+			  "NC";
+};
+
+&pm8150_gpios {
+	gpio-line-names = "VOL_DOWN_N", /* GPIO_1 */
+			  "OPTION_2",
+			  "NC",
+			  "PM_SLP_CLK_IN",
+			  "OPTION_1",
+			  "G_ASSIST_N",
+			  "NC",
+			  "SP_ARI_PWR_ALARM",
+			  "NC",
+			  "NC"; /* GPIO_10 */
+};
+
+&pm8150b_gpios {
+	gpio-line-names = "SNAPSHOT_N", /* GPIO_1 */
+			  "FOCUS_N",
+			  "NC",
+			  "NC",
+			  "RF_LCD_ID_EN",
+			  "NC",
+			  "NC",
+			  "LCD_ID",
+			  "NC",
+			  "NC", /* GPIO_10 */
+			  "NC",
+			  "RF_ID";
+};
+
+&pm8150l_gpios {
+	gpio-line-names = "NC", /* GPIO_1 */
+			  "PM3003A_EN",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "AUX2_THERM",
+			  "BB_HP_EN",
+			  "FP_LDO_EN",
+			  "PMX_RESET_N",
+			  "NC", /* GPIO_10 */
+			  "NC",
+			  "PM3003A_MODE";
+};
+
 &tlmm {
 	gpio-line-names = "AP_CTI_IN", /* GPIO_0 */
 			  "MDM2AP_ERR_FATAL",

-- 
2.41.0

