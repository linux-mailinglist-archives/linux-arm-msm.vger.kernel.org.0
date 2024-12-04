Return-Path: <linux-arm-msm+bounces-40265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAB9E3C17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6318B337A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E661F9EB3;
	Wed,  4 Dec 2024 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcfXigTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A461F756F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320835; cv=none; b=g7Vd4ZPnPH/TG4dBBscPTC+4BOQAzJcpBhA7Jq4bSZdgRqLpjQRjAemNTN7yv3KgDyJq3bfnShZQ4JnsQ2kc13He3Nj2RiQaHtxXiwqXnRedvUIxxr6TWQnLAlimJF0S2S0U6V6S48DugKb/UhSWqIRjgifv8CCWdWzgPZ+clis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320835; c=relaxed/simple;
	bh=Y88dxKTEB84Sy5sor9WVb8Lb3Eunx49GPWiCvst3MDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETfkJZGCTs9L3ffamkpEldjmTLRN3ejSQrEZ7iLW1bbqPAoicwqBgwfq1feSh6xQRxOQ7CCxdxQjL7IA4sO6KH2DqCeEh7boAhtPdAc+6rNhEMoHQAR4zmYkH1vrFmoa3sLAAHHQFsmqKW74ko2VWjpUi0dVYjTxVyyyGdGLsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcfXigTa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso59395255e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 06:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320832; x=1733925632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=kcfXigTaF7oxPyx4Rc7gJrhQwjn3jdDhjoHlUUMFN0jEg6sC7dSB6hMK0hsddmI+ka
         AoYiOrD1nTjYFbZJ+gQSLm1cUsnsYm3kt0Ek9SgxIp9VQLaA3ukVo3gE49lJPtSxUAr4
         uGiUFrkS/BbSchbichWZQ2XyjjmMtAxVQM4A2nKzv11aERfrMfFly/8ilF4mNBN3QyYw
         nU4M3lmqioTt/NBpAGHUHVMNZtRodAw6gdFnT20LUTvH1oNgVdwNfg+FNHZGFh9+QRV+
         APe6zbXofKxs80WTqXT8e+k8D/Ul55y4B1+l2hYtBzuk0vQoZIUW9ZHmVh+1df99Ri1K
         w1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320832; x=1733925632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=lfvGiaB5W+BovVJXf6GWr01uST6jdUNDwhMgXVbSyztcZzKi+bxBngzVJhbN6yskff
         UzVaH2znxIkTAH0HBDaxXKfdyH/RxvO3f6EG7xv9ZbIw52Br7qjCLLqgsb8yVOlx8xvK
         yoI8/VvY7GHN2DmsxXnL19dH+vWXik4+lce20/IBpj3ArgsXhsdawTzE8EojfoSRP+Oy
         Pprt7sTxlpgS5TGms75wY37isnparofPbGhujsft25nWnTCBRQLuaMN6mn1BXaK0+WG6
         lRkK1ChiTLz9Irbdyq3IjnPpFxcDUPByfhavnHgKxxDgGml75eZUlr970zmY8595VByJ
         lGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUzZv7x0Jsp7YAv0aCztihBKLCyj75oOSotJcMN8knd9CpuxYXiq9FFNMZRsElj6bIESLxXgdfzH2OufIk3@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnJi3fmzRQ1FdEP/EB1vBxqDkp8tmExiQBgWUiPZf/SPyHcPl
	li6MGrf++kKwu+c0gWr25nIVUJ4XXq7EewvHKRjkNtPNAGiDFdyIVnutKmtZ/C4=
X-Gm-Gg: ASbGnctTcmqSevRpArUgHpsEQ+/3uG1vWKmbY0x8lcuLpCif/+GrSoJw6VPysCs02FU
	h8xz4m9K3JBKXESSy5ZnSFSkyYZaEFSniqSFk+TU2icyEYShSPBRyzVCFR621l+Bxkj5I5Ee2IX
	JKUOcT0NfyqXA/RZP/6fr9905yVNIyfc7k3X3em+HgIq7KYGb/kTEL0tnN3cmLiOEvzk9VjprHg
	nkXklUgZXLUK9Tnhp0rJ3NfaImMZPplQmMUAO+Tzekoj++VBAWzi+Fzyi1bp9P39XYPFQw=
X-Google-Smtp-Source: AGHT+IFLm3mAtpQU8RqFuHUpb0/Y6Czk2iuRyOThmoKrp6zlYXL4Adntsv9jCROsNU0P1ZXKV67r/w==
X-Received: by 2002:a05:6000:2aa:b0:385:f349:fffb with SMTP id ffacd0b85a97d-385fd42a35fmr5359588f8f.45.1733320830981;
        Wed, 04 Dec 2024 06:00:30 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:30 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] arm64: dts: qcom: sm6115: add apr and its services
Date: Wed,  4 Dec 2024 14:00:24 +0000
Message-ID: <20241204140027.2198763-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 9b23534c456b..816b8331933d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2701,6 +2703,76 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.45.2


