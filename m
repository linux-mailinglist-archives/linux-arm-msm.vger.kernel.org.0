Return-Path: <linux-arm-msm+bounces-10074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D884C6B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 09:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91ACC1F22F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 08:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE8F208D6;
	Wed,  7 Feb 2024 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EgIN1qOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58558208C0
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707296182; cv=none; b=UikGYk3ILV6M1PlehVhHUioqhiRt59G28rEYbAXBRlAT+83Jj2sM3hlsIvdYr2mc5qBpyV4geAbKrFtrgKSC1L073Rrz49H5Zg0HVFW96ltXTjMyOpwqD7JspfTCWCbZ2SoznzMLViDaJyIWeuV6EzBA4GdZlX7pKpMvkljvJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707296182; c=relaxed/simple;
	bh=rdI7GKfCdnOTmpOBilN9O3JEYPXprn3uJX3z0L0jrNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KF1pC6DycGNlGV6aLioOkgCMQcUu6rYnH72hAK0CxW9+ctOJXYdrhXaDASgfHxPgPgyKxSllzNikCOI9cIhCKsjNPr5zQ3NM28B1bTaykLrlRvyBcMLm97bnvF2n06m4ynsxAozT8IjC2vwhfcOCKJykWghyrQdbDZbiY00UJyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EgIN1qOX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b18099411so275440f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707296178; x=1707900978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liXIACRKvjoHSHWwJp66EaeDBptoHrPZ41e1VyEQRh4=;
        b=EgIN1qOXN0/7H2tP6fnNpYNv3aGk0+R148CPJ2udvrkRXCEW/om7hI6jr5MG1P4clT
         yoZgPsExfOZm/RydhIUbl/R1WVHgVI7xHvsQAZyU+r75FxBeoebkNc8YqUuz6DZEf04d
         y626juUUkgLu/MaZqV2Uuj/Q2JBLV/+kEKlE7wNyxAjurCAcg7RGgxZTFfMHF/keVRcG
         FNq6f9BrmdoYTv3TVCGbAnaWsEuIw5tLN3aJG2l/WdTiy6sIQPnNI3nmT1m6dJdNyD+k
         18ZYMQ36Pvof3nB1xhZNk6fk0kuH6XNR4LMBrqpXyR6MFUNk0DRBuMJIIvoOuwNk8Z73
         nNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707296178; x=1707900978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liXIACRKvjoHSHWwJp66EaeDBptoHrPZ41e1VyEQRh4=;
        b=c1MpmbxhrGqP2j2xFC4wItJdEvXwSe1eILn2FffWBYmLcitZqqfOefuUI4Kr/bVi9g
         mUDl8va1JotuVf7QSrnRMlPHF+ryn337lI8Ga95qGKm3BrXTJiMieurlPs4kTNU1sN8t
         /pY6PboELZ3ZKU/d1zOKaK4MWUhtqVLScUZBFQQ4P4l+HoIYPI5F9MMf0CcmsUxQuK12
         nMK3MM91DXVkTID4M37ND4ZfZLVKBXZyUID+ekIwz4MIrrnYQCxT7AzKcYVK7DZZP+74
         FZ+2nXrQPFenCnvjaubWJdKTEGAxr0EpInCWl2TQLJ+WMXORU1vWevuVNkypnCzB1/jp
         jOGw==
X-Gm-Message-State: AOJu0YzWu/o4xrjayObh666/H0DO5zaaU4R+z3psaoX0+CrS3r1jx0bv
	WJsySrlBy+9bK6pzB7F9wXFG/nw9P6LtnPJb6UlBBSmuzSvmQqaNxZmIu4jtL2Y=
X-Google-Smtp-Source: AGHT+IGG4lgfUy7JblzBNmRU3galTvfd8NG+BPtV/bukRFe8CGhSGAjN0T6v7Gd/gCz3yHRSlji40Q==
X-Received: by 2002:a5d:4450:0:b0:33b:3dcb:9564 with SMTP id x16-20020a5d4450000000b0033b3dcb9564mr3179404wrr.2.1707296178423;
        Wed, 07 Feb 2024 00:56:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVN2mmboPNrx4QSdEpEN0shWCb1v/FLThDbfLxSbrbu80KgzR3it+oW+lvniE39OxwScqTjuZc93thwx1od88Zt2LFp6h7UrQKjOJs3ETFF20ZZaHqi4j6X5YgWttGXHfRXocWSBLT3+1BmrXVPlRtMEPCKOrJ+wxbne7A3VqM6QCnvBpvWGbQxjdMEaKqcDixHVpsRnm9gx8LwaX2Qx8b9gej1xa7ObrZT8OWMzwGsWqjz4gdaqM5cqo6NroJPlFvNXrp94Ctp
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b0033ae54cdd97sm940204wrt.100.2024.02.07.00.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 00:56:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100-crd: add sound card
Date: Wed,  7 Feb 2024 09:56:15 +0100
Message-Id: <20240207085615.27187-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sound card to X1E80100-CRD board and update DMIC supply.
Full schematics are not available and the limited available parts
suggest that DMIC0-1 use BIAS3 and DMIC2-3 use BIAS1.  The DMIC supply
is unknown except one remark for VREG_L1B that it is "used for DMIC if
no WCD".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No dependencies: everything was merged.
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 94 ++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 12abc9287a75..72b787ce4b20 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -18,7 +18,7 @@ aliases {
 		serial0 = &uart21;
 	};
 
-	audio-codec {
+	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
 		pinctrl-names = "default";
@@ -48,6 +48,94 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TwitterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
+				"TwitterRight IN", "WSA2 WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
+				"VA DMIC2", "MIC BIAS1",
+				"VA DMIC3", "MIC BIAS1",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"VA DMIC2", "VA MIC BIAS1",
+				"VA DMIC3", "VA MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -494,6 +582,10 @@ spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 	};
 };
 
+&lpass_vamacro {
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1


