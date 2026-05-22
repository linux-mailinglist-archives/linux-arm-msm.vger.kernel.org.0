Return-Path: <linux-arm-msm+bounces-109320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAAdGRNZEGpcWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB15B5192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4813A306CC61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E4039FCA6;
	Fri, 22 May 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iKhe7aJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1593A3803
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455760; cv=none; b=ejjT5vLAYC04e0cIglyhpvjQhlp8TwV7Hv6ITUEtBPU9AIU00MeAXBuwduB/RJs/bj1RU25qsIdnudzzS/ZW630ys774xI+X9AJvQ9Rwiyw3bswUSEBcXi6JjT8fnngC1GzIid5DYRn/y7pYZC6XgHHcqD3vDZ07DH4oT5UeEtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455760; c=relaxed/simple;
	bh=z7ChXNxbdbUiG8j3fTNDSWzyXBGJAKEVMjlzhEjqplM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=edbCHoOLHX1uCGXp+9kvSy6ABVSYIa5IDRtmgGO3LlITV2BUvUBsABn/ExBS6wZ0706TQ1OvdM6wqTzyql0Bn3DGHLI+UDTFt6VL639jcaEmoY/95NBc+MliOmrJMTFB/1vtGKHbSR/o/U3Z7pKHCy90yG27wVhhFcBlgNHN7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iKhe7aJU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso71324775e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779455757; x=1780060557; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkFpVOr+Lx0wVTzOoEfUN24ILFUSzE9dOgFug50AhJs=;
        b=iKhe7aJUOANS/aqmumMIlQ3ht+x+1YLak3/RWIwnFrcC4jMxoBcZ+351TNh5psko2L
         YbEoLfHfUDYuD9TwNbs0VqMeCbkkklK19iUBvOxLGko8egg4BIW2evIl3k2v6olyu3Qw
         WxnEIJdcfEi63wwIOUqMplWrKc8BhLowxjpK1vX2vPaZLM6G3c5MLKkxvqbEZHja3oYr
         Tj3gWnvtaaOoEbmYArB9ZzLfFrY8qk0AP6aPiVJEs0mar++GeqGS6kZzQwiQF6p0sADy
         oF/2xcjqZ9/yIkl3QKsBTniJwVF7A21yHM7TZZfsSLd0in4J1SFNhiWId0EjRxjuROU4
         H7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455757; x=1780060557;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkFpVOr+Lx0wVTzOoEfUN24ILFUSzE9dOgFug50AhJs=;
        b=ndiahihr33r9rZMvw1KRvmfsPQiF09fK995Me7mYXo6xxQX2HtrkDpnjUFQcCZatC+
         TqpmW/3T7vwOrl7P/Ww6CpxRNr3AmVimXzNUxcYR1OstgY4nH1EpO/ZdvEZ6OsizHMb1
         IFbYpjFc9g9rsqE1n/jQd/tFvnFub603jeOL6yEqgCOjXs/8UsDdz6n/i6qQQchxvf8K
         upWBv3WINC+cRKo1e3sQahZnQPb+ztlIXCgklHIFSdAuMFT9NXq1pkBXQBwvlJNk2XOF
         wLrfOwvOE0R4YzR2qA3n8FdZSLTg0zqhB0aMWG6umHHjU6GHtk7k+tIgm1ee58BqQDST
         0Mlw==
X-Gm-Message-State: AOJu0YwwFaRwYlgg2X8k6E5IT7QdEpisuM2q+OSUYM2SuV+Cyd8b88Ri
	K6Kdd0oITdd1wALiRCTo53Y/a0cnUn2IIssLYFKYzsTdJTmlznHSOgRHE7uaSaBUWYwoTfLhvJG
	AQblGqHQ=
X-Gm-Gg: Acq92OGGMZIKcZnEUS1kq/jRv+0KbDT1+31lvx9wYMFde2qN9cNnlI3Pbh/sI54HezK
	ziXUa2R0RFyAHOOZE6y1SaTvdQaW82phdGE4j/3wTRiZyMYhu87hb0O+vS42ufDrrllT33tPiZW
	mOWAF/dbvnrYi7BYdsRaubTh4wPsaxb3fF/FD8GgQqIbEFCa6S+gLOhXLUH2g0lCSaFPQPczDW2
	LbAEtsL9rK997gYqDBFafQ/HlZqAsYYu/XtTBWnCDDuPd49xIEl/88I2FanehaNPdkkZIZZRH5n
	/QTZd7aw62TAi2X5c/T9zTJRfNxJft2vwmKSwv4OgNRUDOqPzv9Mk/IU1EFRxoZXb+q39VyoJIa
	+YGnBYT9M3tzuvtNG2S97ajACypGGXTK0P+lr4syI8VSc2oH4sBK8cgEhyLc5XUaM8BDkNYSumx
	r3OyCUNl6sLY61snIJ+1NPGxNl8TM169dOvIq1OHeM5EU7pGfTYvEbnXpdnOwDu/OOpQ==
X-Received: by 2002:a05:600c:1c0b:b0:488:b187:3c with SMTP id 5b1f17b1804b1-490426aa7acmr55464915e9.14.1779455756776;
        Fri, 22 May 2026 06:15:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca50sm40087605e9.2.2026.05.22.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:15:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 May 2026 15:15:52 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAdXEGoC/52RwW7DIBBEfyXi3I0A22D7lP+ocsB4cWhj4wJBt
 SL/e7FTqT2mPY40ejO7cycBvcVA2sOdeEw2WDdlwV8ORF/UNCDYPmvCKRe05DVEN1sNYaxFRUE
 takIHs9PvGCFw6G2Yr2qBPkJVNF0nG+wkbUjGzR6N/dyjXs8PHW7dG+q48b8dHj9uuUN82H4q5
 EbPFQjDWNS0hFqK0uR8nvPbVJHf9zwPW6SsaihozRClYcirNpX/Y3lRlKwBlLwUEnnfUdMmsbE
 6FRC0G0cb20OSRwZeM7K96GJDdH7Zx0ls/8jfd0gMGBjDCq4p7akUp6udlHdH5wdyXtf1C0UUT
 t8EAgAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8361;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U/wNBp8Mig44h1T6c0HFacZPNVxWCZFNODSr/1lRsYY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqEFcLHbkULKeqkHv/Z6JJ3okQuiZ01rrMpBula/nX
 KGINwduJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBXCwAKCRB33NvayMhJ0Xw0D/
 9/4Xs0WQUBznxZVBdTpgJTWnWFxpFzvzIR7vg4v4l9BaRc42QWhcRRS14ebtCo0yboI/R4V8hjCJpr
 eCPW8/99jc9Mk0PQpMIdNTLMv7DywZvK7YCswDB1wteAp+CvGYJi8C5dQ020gTcYZNLpvhDzT+048C
 wYZBB+8fTHZrUsaiu9FUON3JbfBgpIKni4VFVlY9g5ZRcBs8czXCz9oUuJ+A9q6PqIfPL7XHpsp9rN
 k/M0ZGv35ExlmGSMeF/JFqPzsDXRveVmZsnf3+w6bHdzAc6doIqZMBoo8kACVYXHz3CRfc5Q+CAFEr
 seiJp5ZsAxtN1d+Ri/a3jfoVJkiCyvv7PZWZjckm7MZ2RnPNkMXZQtMiPHn95CKUsjZq/egPkbsmnf
 89tHPrQEWZOB7/6hBPI2NjD63owLCzWmRMUlnmPFE5s5IYodqE2PP+YY5mZV/kwfkIzqHX9uPT7gWW
 fYpY2qcKSj2DsJNJOrsqHJU4MUufOzb0nwsRDsKkUOu2QDC22ZsqZEA2VvEdDBP9Uap6+Gu6hqmSre
 l8iwjMAtyLVemF9wOvlZRxqH8gIs4Mc0OaDw103tDB65IVu+qAyq2pCvk3bAXPcVF8g839MIzMzPH1
 vr1WnlgHATZnCaLKLIPzdEbzUWw6LEq+Zyn4yYSbVmCZksPCDA74W3QZOmFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-109320-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 09AB15B5192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on follwing bindings, all reviewed:
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org/
- https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
---
Changes in v2:
- Update for bindings changes
- Remove empty line
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 241 +++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..af890e76813b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -220,6 +220,22 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 		pinctrl-names = "default";
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&sy7758_vdd33>;
+		pinctrl-names = "default";
+	};
+
 	sound {
 		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
 		model = "SM8650-APS2";
@@ -986,6 +1002,14 @@ gpu7_active: trip-active {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
+	};
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 
@@ -1016,6 +1040,30 @@ wcd_usbss_sbu_mux: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vreg_l14b_3p2>;
+		AVDD28-supply = <&vreg_l14b_3p2>;
+
+		touchscreen-size-x = <1440>;
+		touchscreen-size-y = <2560>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
+	};
+};
+
 &i2c6 {
 	clock-frequency = <100000>;
 
@@ -1053,6 +1101,49 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+
+	/* Screen power */
+	regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sgm3804_default>;
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Backlight */
+	sy7758_backlight: sy7758@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sy7758_default>;
+
+		vddio-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1065,6 +1156,93 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,master-dsi;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		status = "okay";
+		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
+		reg = <0>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&sy7758_backlight>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <90>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel0_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+				panel0_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in_0>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel0_in_1>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
 &mdss_dp0 {
 	status = "okay";
 };
@@ -1390,6 +1568,20 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	fan_pwr_pins: fan-pwr-state {
 		pins = "gpio125";
 		function = "gpio";
@@ -1411,6 +1603,20 @@ fan_int: fan-int-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	upd720201_avdd33: upd720201-avdd33-state {
 		pins = "gpio123";
 		function = "gpio";
@@ -1440,6 +1646,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
 		output-high;
 	};
 
+	sgm3804_default: sgm3804-default-state {
+		pins = "gpio58", "gpio59";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -1454,6 +1667,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		bias-disable;
 	};
 
+	sy7758_default: sy7758-default-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sy7758_vdd33: sy7758-vdd33-state {
+		pins = "gpio163";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_irq_default: ts-irq-active-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts_reset_default: ts-reset-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio107";
 		function = "gpio";

---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v5
prerequisite-patch-id: 901a0948e1afbb03ff78a063d4f66c17665588ef
prerequisite-patch-id: 5ca959a92d05c86ae7a77400d5c4c9bb8bb214f4
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v4
prerequisite-patch-id: eba24fd4013ddf353136a6b77cba84678e60edce
prerequisite-patch-id: 63b9ea68bb624685fae324bd8db9545f73658e23
prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v6
prerequisite-patch-id: 53130195c1df5886a953f3eb1ffea6e5b32257ec
prerequisite-patch-id: 268452dda581581e0126cfd331cf99537544fe65

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


