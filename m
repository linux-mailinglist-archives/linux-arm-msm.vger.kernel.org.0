Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5F73EE1BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 02:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbhHQA4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 20:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236566AbhHQA4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 20:56:06 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775F2C0612A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h11so30061672ljo.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQt/DuSx0bT+fggEeQl7bKu3DF9WLrIbpvPtKTp1n3Q=;
        b=VDg7sgLR5PvBlQfeFtYC652lbHyUalwcdJFv+rouf/RrFSyuQcjGXyE9RXHErNdVHS
         qYGPxJMlLyv3bB2tVrucSjwatYAWM33+Ey7Ag6Mja6333jByHyjvAysGFQm0eLpXTKY1
         j7onx9jAPSxJPFAWf7O19mkHQD7hHKG7LfJ54Awmii3BXn8dCKMtmqxqbbsW1Vw92h4w
         DCnVwPdgnxImZ/OghvlON0r0uaI126uxDcGek3Qi4Ok8/vHc+eUuIyehPiLU2S8Gmp72
         uzNeiSTkrDgWP1xt4Tuj/8HB5wFcRubflkt8itoTdK/D+V1rV+ha9O3hS2Lf2ZwwE4pf
         vhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQt/DuSx0bT+fggEeQl7bKu3DF9WLrIbpvPtKTp1n3Q=;
        b=SFrvKnL5/Sneb5DboTMwPLRcsOtp54arSNtO9RheHX1Kln0gOMTKHCBl2p8VLWTauz
         vqtcrWnwNQN7Op11qMvQFtIzhfOIKbRfYy51Lj7c/e67mMucq3fsRKk6mpAZurbywlu0
         cGCOXJs5rQLyse4+ufHrmtDzVya1x1aNi2DNJzu9H6WCZUElLchsJEpydetpzKd5gMZQ
         1tN7ujhSas0I6TzXZFwl0naGR1EX8BnXNgIlcTKr4oNnEE25W0tI/1/yKr5THzo5oqYr
         VrlZ5udwHvd8WMq5bkPs5V0Yy9TxWLdHRHpWpmicLSsAPEhaAM6z5qbrOtm8e+SEPSFp
         Ze4g==
X-Gm-Message-State: AOAM533gfIBsl7hnIg45aUdch1W5u8yEkIhTag8RD56giyx/tNyhK1eh
        XyD9n5lt45aCigm71X6wcIOWhw==
X-Google-Smtp-Source: ABdhPJyNLUS2dwSRaqJ5H76SvBhAQ9S/S789/Y5Oq9VF9A4kizqCDRIBv075Pxe7Gma8nrJ/Cpt1Eg==
X-Received: by 2002:a05:651c:985:: with SMTP id b5mr797712ljq.78.1629161722852;
        Mon, 16 Aug 2021 17:55:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 17:55:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [RFC PATCH 12/15] arm64: dts: qcom: qrb5165-rb5: add bluetooth support
Date:   Tue, 17 Aug 2021 03:55:04 +0300
Message-Id: <20210817005507.1507580-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the bluetooth part of the QCA6391 BT+WiFi chip present
on the RB5 board. WiFi is not supported yet, as it requires separate
handling of the PCIe device power.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8ac96f8e79d4..326330f528fc 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart12;
+		serial1 = &uart6;
 		sdhc2 = &sdhc_2;
 	};
 
@@ -98,6 +99,25 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-always-on;
 	};
 
+	qca_pwrseq: qca-pwrseq {
+		compatible = "qcom,qca6390-pwrseq";
+
+		#pwrseq-cells = <1>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+	};
+
 	thermal-zones {
 		conn-thermal {
 			polling-delay-passive = <0>;
@@ -804,6 +824,26 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&qup_uart6_default {
+	ctsrx {
+		pins = "gpio16", "gpio19";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rts {
+		pins = "gpio17";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tx {
+		pins = "gpio18";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -1193,6 +1233,16 @@ sdc2_card_det_n: sd-card-det-n {
 	};
 };
 
+&uart6 {
+	status = "okay";
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+		clocks = <&sleep_clk>;
+
+		bt-pwrseq = <&qca_pwrseq 1>;
+	};
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.30.2

