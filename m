Return-Path: <linux-arm-msm+bounces-106565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI55A/xL/WmUaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3D4F0DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBF6302835E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 02:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F64280CC1;
	Fri,  8 May 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRvQyng4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A87262FFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207418; cv=none; b=rTnyImRTAdRkxepnBOgfcfS3FygkyHtdVKwLLEWOooV+11bzWXzS6r2H9iYaN0dToxCV1ZoU1r1mpPpp7aMHIv5OHtw/3oJqaNtEtFDFt6ef3FYLYa+3MPq0+Fw2UjI7/0y9XfZZrlc9BrQZoEoxXsfA2XI1O5oPL0sISFy34wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207418; c=relaxed/simple;
	bh=Bi5rTiz6sS6VYbktgkLsGAorKRiZb8L2whtZyNLeSHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q6NVP8Oo1YPBTTRxA2BpGxJlAexvDSfPSXL/0uAaMIFmX/2aR5Ox8BWqUcm8oc7BiKc61h/RVtlGe9YO8v5/3KYhlUOZFlQamwdenMoFwqGDx44cjlF9et+MKxQywSk9h9IpBVmYr3Kd7wzPp/3SMseqyo8cFKXlqVVpB4vpPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRvQyng4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso18202585e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778207415; x=1778812215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWFAHdWdNfgetWCnV9jGKJb1CsJQxtNeKq4Xom3RGVw=;
        b=QRvQyng4+lfb3j0beMhNA8ju//5xED5bBV1b7bepD60Bs6cFJgfHzLRLgPwk0FdEbt
         BfSxevnoR75m+xOqeqNKySbdEb6C5ewD8JcTIWEyT5nKB0tvpDoG97FSBLFB3GXCH2YR
         IhOV3x4UgMx1EEXJJchsswYGez0a5wbLTIb+S4wD2evq1M8vgnNeeR6JIfQH10PqDs8Z
         qH9xftIF9deddOkwramq30d076PeoSKtBR49K2LZsQoLAqPuLhGZfDr5JDl282jiG1GQ
         yHx5dd9ZjAawfvz1Oy/NoEYtRXSohwBmbEorO4Qj6bF2ed3Q0csrmpBwlEki1qtPfY3t
         GWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207415; x=1778812215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWFAHdWdNfgetWCnV9jGKJb1CsJQxtNeKq4Xom3RGVw=;
        b=PlllNV6mafc0ywsJLloCmse17OqHn6islkEmFfLi4E5kNqladRbAfQS9kta3WSQiLu
         k1o+elnrussw26LpeDlkqqnmoPDmNWhHEJdXMBPay6ttTRoXUUVl4X3UYu7O2xxSi8zR
         A1w/6r6y5fwki93buoSd0Nq8CjdWpgXDUzo7/C5TIUNQgo8FPcoKiLZsnRQWFvcXQ2WP
         Mt3R+P6qSzAhpgA7FPPfIacx+f+oJ1qeRpN71ZFBBXguNe5Qhd5VCiYtHBXnj5TT4aNP
         XqbSjoybqTZJo1Rx5Q2N6Q9u3B9SSZq/7UPnSG+enuGi47zSHqUuvQsrRwCuQdNLlqVs
         AwbA==
X-Gm-Message-State: AOJu0Yzdd4EntVg6v0x1gjVsDnB59dB8fpZtLWY0/IYr01aI0RTGi6z4
	oP/sJYVjl+ngcn2u8j/LGy+UtcI4PrrBSm5EXXM/wJtFyv2sINbdFGzxq0V6M2ye2e0=
X-Gm-Gg: AeBDietJDmIgCnBE7s0TpK/EXB0OWesoUnWwbKBHmuQ0ID8mvPvLQ49Wl/OOyhlxyIO
	6sYixneSiLHRiicckN0JsbLpJRDdL5TAc5eiTcywfZFyee58UtFKE5joFDgm2/5C2ktDOoPJ+6w
	C1CV9ju0111MjW2wA6uT1YjooILCftvUvuVwbSYSY/58DPE9Td+G5DciEnrm8gEdatR2ivAihvQ
	fQkSVZXiDKajZqpOHo/uA9gSGCABSPVMVNeCEhhsnWF6zLE71o4ggWZ7UgFudclnEiJ1fjaH/jr
	oryA/Rc+xpxVxRnXOcz89pOXTzVPPa4qQjeZQysU0lzjroB4LD9uO0yf+f3I9N9fDywpjVmPHs3
	RWjX7C7JOCnRbanEj5TdgFy/RJaRI6x1bfoUbOB3F0LBV6cFf7vIZdo3+aT3Nf41rqzbxC1CrdT
	YmE0RYfQLGkLXohpsU2USc5pn20A1m610KbqbTp0pn7vDZzJ/EUeCaQfR74N1zQsMctl+ju01yb
	/KTYjTboDLD1w2hXekK0/4=
X-Received: by 2002:a05:600d:d:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-48e51e08240mr141109125e9.6.1778207415092;
        Thu, 07 May 2026 19:30:15 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eb85d7sm1697905e9.7.2026.05.07.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:30:14 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 08 May 2026 03:30:06 +0100
Subject: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK1K/WkC/42NQQ6CMBAAv0J6dk1ZWqCe/IchBkqFTYA2W4Maw
 t+tvMDjzGFmE9ExuSgu2SbYrRTJLwnwlAk7tsvggPrEAiWWskADLwrgu67l3sIc59qYEropBrz
 HQAqq2qDSymqprEiRwO5B72NwaxKPFJ+eP8dvzX/27/SaQw66N1hJLLQzeJ1oadmfPQ+i2ff9C
 /FpWvvNAAAA
X-Change-ID: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Bi5rTiz6sS6VYbktgkLsGAorKRiZb8L2whtZyNLeSHI=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp/UqxRkhiTxIL3jEZY15xAb3u7oMG5ixnQ3GsP
 O5Uub+PQV+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaf1KsQAKCRBjTcTwaHBG
 +HPED/93hEUzRULqU1+Ec/TAwuuKM29vq4ZXYqPGssodSvkHg4MFNR1IDhie9nIzzYKfMnwJuBU
 J+aXiTB/XkhoiJYxAelyF+4iMBFqwoY5j/aikJ7C03zmQ1xlHivB4BcnBc864plfzfGn3XcFluz
 cp9y59L5ED9MtbyRJWJr7YHHoUBTse++GuO3HtqqAvDtg4kXLWPEBeV4/mnGsL+isYXVKwH3fMn
 Hv1Cz/jmPB/bvWHIRK+HFddcmMdyRfQYmCNk69dju6T9oBGKbuKP3sd11rQ+l5e9FXY02jB35Wc
 Y/8QCmbmtEI3X5pYvg4YV5LEqa37YUa22s4WpEErPp1+WFnVBuq18/uDcVYJ5fE8LWeZykdeDVn
 tplq39HHdNSjfJVmnq0RdBkoiUvB5B9MUslVCUtZlgI9rlnOEgyB14p8NWoNhKakoq4C4FJguEv
 ylqae8cTVIYXS9vAKtlIzpML/KBfdAZ8ByuGWQc9Y6O69jKDD7MnuEu+wRpDKSeXooaDG3AiXhn
 PORrVCmpYMz8HxIPLNrc+vVdCZAS2GpO/fwnUrl9bcRMaFVhYEVj8Uv1TDr8v08It92XTnchMFP
 UqL7vr4Vdo7+juudgPrWxPdAQOmnH9z9lgFNOJjtNy9sXhyFreYXFiAIoaRkFxkU4Kye8Y6LYWx
 VzVWSFm6Hu5Vwrg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Rspamd-Queue-Id: 5DB3D4F0DBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-106565-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[75b9000:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,75ba000:email]
X-Rspamd-Action: no action

Add the blsp2_spi5 SPI controller node together with its default and sleep
pinctrl states.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v2:
- Rebase onto qcom/for-next.
- Rename node to blsp2_spi5 (Dmitry).
- Move blsp2_spi5 node in alphabetical order after blsp2_i2c5 (Dmitry).
- Rename pinctrl nodes for blsp2_spi5.
- Move pinctrl nodes in alphabetical order after blsp2_i2c5_default.
- Remove superfluous register property from blsp2_spi5.
- Remove superfluous interrupt property from blsp2_spi5.
- Add dmas & dma-names properties to blsp2_spi5.
- Change blsp2_spi5_default cs-pins function to blsp_spi11.
- Link to v1: https://lore.kernel.org/r/20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2f67e665996f..818e5660df91 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1632,6 +1632,30 @@ blsp2_i2c5_default: blsp2-i2c5-state {
 
 			/* Sleep state for BLSP2_I2C5 is missing.. */
 
+			blsp2_spi5_default: blsp2-spi5-default-state {
+				spi-pins {
+					pins = "gpio58", "gpio59", "gpio61";
+					function = "blsp_spi11";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio60";
+					function = "blsp_spi11";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp2_spi5_sleep: blsp2-spi5-sleep-state {
+				pins = "gpio58", "gpio59", "gpio60", "gpio61";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cdc_reset_active: cdc-reset-active-state {
 				pins = "gpio64";
 				function = "gpio";
@@ -3433,6 +3457,23 @@ blsp2_i2c5: i2c@75b9000 {
 			status = "disabled";
 		};
 
+		blsp2_spi5: spi@75b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x75b9000 0x600>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi5_default>;
+			pinctrl-1 = <&blsp2_spi5_sleep>;
+			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_i2c6: i2c@75ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75ba000 0x1000>;

---
base-commit: ef5930fa9d5d5a1734e9e065d3e29bf1a064cbc3
change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


