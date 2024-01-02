Return-Path: <linux-arm-msm+bounces-6239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0C821CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B02CB1C220DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A0214AAB;
	Tue,  2 Jan 2024 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBF+D835"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746714AB1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e81761e43so6912856e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202465; x=1704807265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97jPHG+cR3581Xl+GMf1JKp2vtRKFSusYrcakFXqK5U=;
        b=gBF+D835JIqOQUb6hmLpu38muSEzGolVQV/pAtrkTJNkCOaIX2bWrb3olo2wa6tvZT
         m9LNh7auJfrql8SUFC9gLy6sV4mtqPk3+gLgkiG9ewk3AnRr5sT6Q1FLJtPXUdNXmLkl
         awQbAd0APv1pz6xC6ong/hAHgP0w/LbM335ebRIH363OCX9hG+D0r9fIQSv2l93PSmzz
         zGUMQnS58ZpLBQ/XTfHoeyOlwI9dn9asP71IzIaDpD6AsxoLI59J3TlykLb15WhgB/4x
         +Jgy1nmxo00y6yAPFG9SxACVs3AfOpVewmwVkNKc5vIO1qDHrqdxuUmB4myEXe+arHdN
         AAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202465; x=1704807265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97jPHG+cR3581Xl+GMf1JKp2vtRKFSusYrcakFXqK5U=;
        b=FgetTNQ+bDOHV4/lgF1CEqg7qhBA1lM/0jf81tpcUPL6DnqXxhN5Do4ha14l16+kuM
         I9QHnqluEOfa4zO3c2OOy7gPsqil+DR+hAK6Q4XtvRdpPpV4jk3zNyuzlDb9C6Nx6xBR
         bDrMBqSCJWzC8ZFf4IZMjn5anTMbXA9oteFu5UUVKr8utnyubdl5h/OJcbj3/Bv5KBjZ
         Vun1KXAmH4LSuOddjya3pmnDx137OsiplUDwa94XtCBBI65+y5B4RW3CjyG7URTzfYLt
         bJV2CLKKkenKNLGABXkMTuOniIgB46Z5WysEgFGW/hdxnmBKe1vigB/ejGLobpjDBWkz
         UGpg==
X-Gm-Message-State: AOJu0YyeWK+4wWMMJMUmYduFjh1gAYcQhDKJ1XbpX0fewP1ijWe1tM5+
	TiODf82SV3JIPgmD/juIaDeXI4SjL5y3McoMank6DgBSvCs=
X-Google-Smtp-Source: AGHT+IGyfOYRUZ4spVxFrdlr4EEKGyzsq18TddAdsSRofijeK06vcV97EvlAemjebKghcn+gqknShw==
X-Received: by 2002:a19:2d12:0:b0:50e:5082:a868 with SMTP id k18-20020a192d12000000b0050e5082a868mr6834514lfj.104.1704202465322;
        Tue, 02 Jan 2024 05:34:25 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:09 +0100
Subject: [PATCH 05/12] arm64: dts: qcom: sm6115: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-5-fda30c57e353@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1343;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MM0iaMoLU2hpNJK6qncAaunE1g9CP/uf4D/oMinm+8w=;
 b=zTibY+b97qc8gu1fNWYkZYWhalWuxLR7XgDDgGbbUAe0ayzdhoelFoE+j5dBzbUv8wmXC+5vo
 y464dOCNMysBBefVK4VwibRSy4+uhQqCNiR2ymnUCwTiJiiEGanktF1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..a8c819d53104 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1646,6 +1647,7 @@ gpu: gpu@5900000 {
 
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -3294,8 +3296,15 @@ gpu-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens0 15>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpu_alert0: trip-point0 {
 					temperature = <115000>;
 					hysteresis = <5000>;
 					type = "passive";

-- 
2.43.0


