Return-Path: <linux-arm-msm+bounces-6244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E860821CC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 14:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0D1B203DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC9815AE3;
	Tue,  2 Jan 2024 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJ1vpSlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF4156DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5553f251e3cso3938345a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 05:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704202472; x=1704807272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn6ZcGR++MLyZKYtulEm7pL4y4QPEqxKkTxTEz9NJCo=;
        b=xJ1vpSlvQ4WpjA2eLh54Rd6f5XGamBZyMGETp3sWTWZO+/lsjvKUXu4EbOP7OwLcvq
         gtHqfxDmhvgFwUFigFwCviJ2D3xHpALz5N8NehYzR7OFuDv85BC+mKzGg176DnBExaDr
         Z/2jhHTz/m+7/DPsfMULF5Dnw66+2kljjBe1oXB1n5UU146NOAF8QksRKFBAuz+sCfE4
         Ts6HsdQ+mpdp59uJr+8GUAapjIy7/oKUV2/cNsWm6cI8+p1YDBKGpybw0lKe2Ao97jGe
         D1dErzf5A50h8xaIOiVcTfI9/0osHJT/9hdQYm0KHpoCye4EcaZM/BtOpmeYHtQBfasn
         8a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704202472; x=1704807272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn6ZcGR++MLyZKYtulEm7pL4y4QPEqxKkTxTEz9NJCo=;
        b=iLON7EyD4NpV3nTYlxLz8EO+84wmE7Bw/qq/E/OBbFIQMFqBLEaqPdT8zoi4j7pIow
         THzecwR8QACOAepqw9vWNOJiZbuchvaWQtBCa4T7zzn2iIA1eiWW705XBj28P3bhdVJG
         t+DFX7R05+PeiaoN/R4g68d+enZof1LdMD7NSFL/FMpbFNtu/sLkl5oSoOAntt1V4tie
         sABAGYinjWcCKAS2CO/hMqDdemBubg42CNJeegV9q/qEtHS0mhWj666DdGbJrrThha6c
         ejT0WlnJjjlACUmQ4ChDJKOC6XGk01lR1rgWp+ZZ2wxRVjiP74D4/QQ8G14YdJnJ0Mno
         m25A==
X-Gm-Message-State: AOJu0YzwyidzhKcUCwKE60gSinCZ1TZv+/gQnytcFTEsRCyYO7AOdg5U
	UPKdFl9mToBmcEJ7h4uKCDQhtyRjI007Qw==
X-Google-Smtp-Source: AGHT+IF8V3w4eO8tAGhtwTO7CeHY5MfrrduezFfd/hCSv78bIIbXrbW5bgSlswiqDeONC6lUwdP1vA==
X-Received: by 2002:a17:906:1988:b0:a27:e0e2:e641 with SMTP id g8-20020a170906198800b00a27e0e2e641mr1874730ejd.19.1704202472564;
        Tue, 02 Jan 2024 05:34:32 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906109700b00a26af5717e9sm10950923eju.42.2024.01.02.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:34:32 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 14:34:14 +0100
Subject: [PATCH 10/12] arm64: dts: qcom: sm8450: Hook up GPU cooling device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-gpu_cooling-v1-10-fda30c57e353@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704202458; l=1883;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lgxbgRXfXDX4Jn2UaC0FqFuodM62KE9jmIfHnDAxRyI=;
 b=r1N0BwVrwMRyHsSl/wlgYiyjpYzDxjqQwnnvJPf2fYSr+T2RY6ZNExH/zeL+RLmYR8wlycfOx
 XoRmgKlx0klDyyJtSzKp6+wyUdh00TiOkXRaPzCXYHLdD+XOmuIDwb6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

In order to allow for throttling the GPU, hook up the cooling device
to the respective thermal zones. Also, update the trip point label
to be more telling, while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 01e4dfc4babd..8f5a093c8828 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2038,6 +2038,7 @@ gpu: gpu@3d00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
 
 			status = "disabled";
 
@@ -4890,6 +4891,13 @@ gpu-top-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens0 14>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_top_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -4909,7 +4917,7 @@ reset-mon-cfg {
 					type = "passive";
 				};
 
-				gpu0_tj_cfg: tj-cfg {
+				gpu_top_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -4922,6 +4930,13 @@ gpu-bottom-thermal {
 			polling-delay = <0>;
 			thermal-sensors = <&tsens0 15>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_bottom_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
 				thermal-engine-config {
 					temperature = <125000>;
@@ -4941,7 +4956,7 @@ reset-mon-cfg {
 					type = "passive";
 				};
 
-				gpu1_tj_cfg: tj-cfg {
+				gpu_bottom_alert0: trip-point0 {
 					temperature = <95000>;
 					hysteresis = <5000>;
 					type = "passive";

-- 
2.43.0


