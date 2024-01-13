Return-Path: <linux-arm-msm+bounces-7226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466182CE9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE97A1F22320
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CF618C3F;
	Sat, 13 Jan 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srGAbfMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD218658
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so9148342e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179363; x=1705784163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnYyAOmdP1ndhCl+b/EqGIg63FmPiEn40CVrBRSgTdk=;
        b=srGAbfMl0q3wvVisa2TwN6Q7BBwKrwvESmBJ7HBTed6BIN6Mw3twxgje4N1NmFEcAg
         LIfn4kluryRTdsFrb/r3/D7Z77r2ygo3AfvuPkXsiSTm9B39vExmDCvlbiRAKwxMKXdl
         KRtYO+O/V6PR0W7vbGKRpMw1d79wSUgNIia7Bw2Gz/trbZTSHmxo8+BGc0Fvg+YG2v4Y
         3RI/Sa0cqayPdLzfPC8gUdVeeD6QK1nGR4DiYD2IsonvQPCHaIqBO7zP55ZJ9SMPSy7I
         vHTgY1wJgOc+GSwAxuQbWgXSC9HPuNRSo1fym3zoUcJDK7KcGlJtVrvbftZF+XqFracQ
         mc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179363; x=1705784163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnYyAOmdP1ndhCl+b/EqGIg63FmPiEn40CVrBRSgTdk=;
        b=EXYxYGDVV8DaVhfapQPaVcYArCVoz/HUePFl6hQeTIuz5VQ+x7SIzM9hLcVVVhLeJH
         DeRCf2IHjw1T/V85yzzkSro3CdSe6Csmrt9r6MmgdbwWYbCaSNctwXvRMVnnOf9FYUYV
         TCghyw8b4aQeBgm1NVeZu8nGdWh/HhTVfQpeegXNskMMQZeuF7NV1Loi4dEAU8WiDZhY
         tTzCy2UTLbmSoqh5g8hcaJO7gaOkg55mVj5FKeWJDg9X7LGXEKWpx9JlylS9nWTOekBU
         BNM6kUxq1hh2rvjsm8NcmCYFvUXr5t1TUP68xKr/BNa9LtYcAx3fG5RKWAxC9LlP2Th7
         GGGg==
X-Gm-Message-State: AOJu0YxjpD5B2SFXldkdufNaWYlM0hlovH2KVjSdK/a41tJzBiRzg4jf
	ggPRoMef5tLyeRSgNGuJ4gqGP0sKNfwxig==
X-Google-Smtp-Source: AGHT+IG5cA1EWA4duY+uo+be/bwS8pQStVj9RTEXXvd/KyWNa3i9lFiJk88dQD6iVwGTSegqTeoQ1g==
X-Received: by 2002:ac2:4f8f:0:b0:50e:3726:7036 with SMTP id z15-20020ac24f8f000000b0050e37267036mr769883lfs.170.1705179363803;
        Sat, 13 Jan 2024 12:56:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:56:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:56 +0200
Subject: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l+v+wiM85c32Me3NGIWIsOe/VuV8zcqdzBSKd+lcjDA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjYwMtAuVPhsCwgdLMK4SZ050X5Jk/5KkauN
 kRhVcjPV16JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL42AAKCRCLPIo+Aiko
 1VENCACq77+FZpxwKdW2oUH5ndplo6jw9WZjdhlTrypIe1qsCwYXUacPFtA+PfAvkxvhdsmGzea
 Wl23qcZ6EqXQV+CfcKueNse7s/lxJIl4ZSb/KwZKuYst1jNBjW/fFfuaV544A6GAYxsiaIYU/Lh
 lzfJhTCke6JG3/snHmvmiU9KBluALPyoW2LcI1aOzjhNxYRGjUCjAXNBTlLffpDWBzqhz4Bfhr3
 wUDE5ugjoWR5ebu+MxbjTEByZ5M1BkXQ95SVtLoHVPaiUimq7zFS9sI+s4h+V0auvkQKXZOIHqf
 D0MHm1NZojJt5LkwQKyr1tbXalGT12anWUIAKedwpGTnHiWg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define VBUS regulator and the Type-C handling block as present on the
Quacomm PMI632 PMIC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 4eb79e0ce40a..d6832f0b7b80 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -45,6 +45,36 @@ pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi632_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
+			reg = <0x1100>;
+			status = "disabled";
+		};
+
+		pmi632_typec: typec@1500 {
+			compatible = "qcom,pmi632-typec";
+			reg = <0x1500>;
+			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect";
+			vdd-vbus-supply = <&pmi632_vbus>;
+
+			status = "disabled";
+		};
+
 		pmi632_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.39.2


