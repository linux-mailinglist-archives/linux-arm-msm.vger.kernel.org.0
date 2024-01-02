Return-Path: <linux-arm-msm+bounces-6242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAB821CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E29AB21CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F80156DF;
	Tue,  2 Jan 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lITZMO+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382E154A0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26fa294e56so588039666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202469; x=1704807269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkfALVEFrCG1/CmRPVW4W3XftugRTQcsk6w6+JqNKcA=;
        b=lITZMO+8hC4nmHJYEvADQqW5uQyHr6iHDdEntzr8m1Ydvp7Dm+uPaLxNLk5NqjcwjD
         ceR8ECmQmu4zV+xuVfu7g1TXMc2RiqquPihdyuE/ZiBSsbS+2lRWxyJfk5kZxL1qeJZu
         KDSQkq6TRCNjCGyjoSohDm0xdtfmBdP6VxfY1Y5JC6V31Ou3cEMdQW2U5Mxb6iOz1fUA
         nJPi/u9eEFh9CzAXXwgM7h7p1oke6Yvp8ariB/0DWcieUb38QcZ6aJ+ZWhoDjzECWGXG
         CWxi2P06KN2WhhkDmfmpj1nrXLgqACvlc4rkV2P01VRmtiVTfOzlGFZhey/2chsX9EZJ
         88nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202469; x=1704807269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkfALVEFrCG1/CmRPVW4W3XftugRTQcsk6w6+JqNKcA=;
        b=NQs21hWjk3D7szYB3kzvt7KGmIypPfW6g8E6poUUglNHEqUyE4cMB9t19VfeEPBC8P
         uFO6rJI6V0xdQjNbLTvjlReXZhczL2/Si+Yvfm1JsEW1UuwKQdtqU5MY66hJZh/n7JIr
         A+E+bf56d/GtANrgtlphCh3UAu7c0saoWIPVbs9/Cselyw842fNeY7jVXs9uDtKQv2lb
         TcfAXkRHdBbxL0/LdzasRHatRSn2nl/R937uvzv/A9F2F1SKlD5nTfHlOmQDoJFJ0zkp
         hjbZLE4ML7CpXLzDEQzfXFWyZpdteewNsp4FE+mnlcQsIQrLlo6nKaHPIfvEcsWK63Dp
         lTJg==
X-Gm-Message-State: AOJu0YzF1DKz7ggxgOIOYc6Ris8ZU+KKgtjC+OID5gKGm9uM4pjKWpdB
	gEBIwTUfyYXWtYe1HfRs0Jx2JYdVnbBp3A==
X-Google-Smtp-Source: AGHT+IFL0AsmS3IC0Nfst0eE3adsL9lyo5NQeFZdZuY9nVjY852z2XgcdxG6B1eT7yb0CrLWAYJ6Sg==
X-Received: by 2002:a17:906:1c4f:b0:a28:78b7:78a8 with SMTP id l15-20020a1709061c4f00b00a2878b778a8mr27376ejg.62.1704202468829;
        Tue, 02 Jan 2024 05:34:28 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:12 +0100
Subject: [PATCH 08/12] arm64: dts: qcom: sm8250: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-8-fda30c57e353@linaro.org>
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1569;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iFnGHk+ZK2tVmuhe34jg6IepMU+CLbbATUG+enVgvts=;
 b=pAn29b2XQnVV1b4D94YHc0qXd0xXVEEoWngkk1UMaRiQGmjsCYHxzUP61qoM3yKEVqFuOBXbz
 /z9Of7ZRwJUBkzC/yXRWQHd4eRFxBRIiXTrc3f7bUxdGuU39/4/XYjF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones. Also, update the trip point label
to be more telling, while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..03bf49818798 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2888,6 +2888,7 @@ gpu: gpu@3d00000 {
 
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -6791,8 +6792,15 @@ gpu-top-thermal {
 
 			thermal-sensors = <&tsens0 15>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_top_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				gpu1_alert0: trip-point0 {
+				gpu_top_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";
@@ -6926,8 +6934,15 @@ gpu-bottom-thermal {
 
 			thermal-sensors = <&tsens1 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_bottom_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				gpu2_alert0: trip-point0 {
+				gpu_bottom_alert0: trip-point0 {
 					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "hot";

-- 
2.43.0


