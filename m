Return-Path: <linux-arm-msm+bounces-43244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E708C9FBC64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D241882A12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDAC1DED6A;
	Tue, 24 Dec 2024 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUmCXd4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15E1DED55
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035485; cv=none; b=F+hzj8vQU8QgQ0UeoIjH+4p5uBeGhQPouz/xcg2orecQdcwfLllEf9Dy56qT4B3jfciGsta+UZcrqEJX66PSbC3LdzHXX1m0cTrJ/qaoqdBBMhMkBEFutEWwu0l9x/1MXCS8fXPQGeNyDhtTf3sY0JIqXZVo12xrbPmIJ3kUqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035485; c=relaxed/simple;
	bh=x2bm9LjU8gDnzSnTK9zY7r1UhakQ0COQvQ8bOcHGsI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtUldgE04EPKetSAPL1GAYgNd8o51B1Jn9sThrslCyd+3FpN2PCQztdZf1DaoskL7Wb3Vvs7kRp3MbWjnpqmSd+c/EYa8zKGbwEPCXLuQkLOk5ID/Qh+adYKlJhLppl1kVi2gJFoHcl2pW7LTicMBbGehBNROxyII354fvkyKhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUmCXd4o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e384e3481so4630153e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035482; x=1735640282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VV7cJg54Wosh+nhK6rc7uL5eYZ7PTz0Z5q2l7WfMjeM=;
        b=KUmCXd4oZc9w2HwaTK3rMgmbQHi/rndzEfwx5Jkzo1l+GCitnyEI8o+SMuMptgIe2v
         RPTjTWCKcUZK+MPIT/OnpLAPafGdkCPJMwBJepakdmo/BEX3OkD2cwazCsP4dC1zKkAy
         tybcb/XBiPUGcctfJo8gH7Ez7Uid6+BCX3HKaweJnUMHHCfpYZ8rTUnZhvmM1GKqPedT
         ARdDp2aNNEbYjAz56CNx/4yO5TL0jcICjvHmMtXc2yTUi6ZXnQGo253k0Ro0WICJMm1p
         +Wn6f3Sir2KYT+un8x30QSWneCQPdkUkon6Yyswm/eMq+QOtYvPgQAbszNGFs5HsyqCp
         jcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035482; x=1735640282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV7cJg54Wosh+nhK6rc7uL5eYZ7PTz0Z5q2l7WfMjeM=;
        b=suOmh1c/aCZZQwff04lac1asY51gS4LqXGo0CdJET8P8o8FRfF+CtNCriSltz8Qz8Z
         qi6ZNsi7KVhdf86rdwrpAYXQN5GU+2CX8xYFx46PwhBcn6Hz7X1RTLbmq/DPgq4na6SO
         cHZqkrDI024ux43JOBJaFMR+LGtL5/tSeLtSsnKr2fS9cC/hB6hBlU3am/zZYxG2KiXw
         EH+p8kpkfQdyYoeu4G6/7rzMQad9vdwjAc1meHkBHRPN3GmXSy8G7ryrf1CAkz4UZnhG
         TcPpUNnjdJvNGyD1qYMAab+Y96KSO6RsyOeb3Upq4Pn+1TNIXk2GkhaKE8hqjc6W0Jgr
         LQYg==
X-Forwarded-Encrypted: i=1; AJvYcCVskSacGhRhp3jtuqb4BaphmzuMZilTedT0VwjwX4fi8PQAaTtaeTdGc7Rime0kIWHkRtJ4DQdLIfvUDZqs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdpfbfo5EavWn2l1ejCngi92IWEPLen7V5Qo5xDLs9sdCMqZDI
	aPU8ppStch8fgifxGnJ9ZnpMlgJ/TZ5tDu8jok2O+gRCje4MW/N57mYF67KtSHM=
X-Gm-Gg: ASbGncsQ2FeKflZ/HaU0TmEncqSXiMo7i4bYAKwnI8Sr6l7u/INXRBup9gu0XDpZ8V0
	YrQkVNQdlXiIa3ZtPoxncoHp4KWyFV+QN3poxeGOgf2N5EDssaRD7JBzuzHOwvOlfFJdRJywx2m
	bKlOQDIjtkHDxpYwLIP/QAZ+IHjfTBr7G8NRcmwniknzTyB1TGCPg2JkBVgnE+z81Li6p4dZ4fN
	ndLKyIBm0a5e3TkZwAc4ZsEDSDx3NyNIlhN/PmBvIObJf8XI6I4//pFU6kE5YxC
X-Google-Smtp-Source: AGHT+IGlNcgzvUW59ZQazvkQf8MOzqeKaMh2K8dXZPiTAEG27e8HyuuOJSHTPkh2Wf+t9QgoXrL/Mw==
X-Received: by 2002:a05:6512:1281:b0:540:2ff1:3f27 with SMTP id 2adb3069b0e04-54229561ac5mr5328432e87.42.1735035481972;
        Tue, 24 Dec 2024 02:18:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:18:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:20 +0200
Subject: [PATCH v3 21/21] arm64: dts: qcom: q[dr]u1000: move board clocks
 to qdu1000.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-21-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=x2bm9LjU8gDnzSnTK9zY7r1UhakQ0COQvQ8bOcHGsI4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pWl/KXh5Oz0rvu69ybk3Bv5tWTTcLs5/z+v7zC+qfU7
 3/A1tXPOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkdjr7P+Tavjfu7oWmrR/
 /MQvKhJ9aUO3V0WNv7GggGUp1zoxo2JBnrVx90IW/DnuEOfzdWfps3COlGoXId1N4nYxR1j7Kxb
 seKb2TTMxLyd7cnYZp6DCZJFXpbkSNWmzhDT48laa7H/zO7dnrZ7BkYd+32e28h3P75EwfcKk+v
 xB0X2ZsytrGyqOe1sLm4Z9/1FWcffg3fkbZRyEe7J7nI9K7Fd84d9h/GFqspLEb56QnLrzx/7O/
 13oq10+6f1VP7eQK5aXu3l3yKTUbKj9o7rjwjVxXi053+kWis0mXgwtX3cX3vl8+uub7k9JS39W
 hknKFywqquJi+654LThl7YeIDxECt+XvxGvl/XhoVfoNAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QDU1000 and QRU1000 devices define XO and clocks completely in the
board files, despite qdu1000.dtsi file referencing them directly. Follow
the example of other platforms and move clock definitions to the
qdu1000.dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 14 --------------
 arch/arm64/boot/dts/qcom/qdu1000.dtsi    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qru1000-idp.dts | 14 --------------
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index c73eda75faf8206181764df4d1ea32f96c9cfcd0..a36a56f03c2d112c6afdae1272b81edff890fca1 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
@@ -22,20 +22,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	clocks {
-		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <19200000>;
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <32764>;
-			#clock-cells = <0>;
-		};
-	};
-
 	ppvar_sys: ppvar-sys-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ppvar_sys";
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 47c0dd31aaf2e42d6d85411956207b2509a605b0..30fa8f5f992ff5b440db9871a254b60acddbac94 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -21,6 +21,20 @@ / {
 
 	chosen: chosen { };
 
+	clocks {
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <19200000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
index 52ce51e56e2fdc51c05fb637ed4b1922801ff94b..f35e3111f516ca1ab59011f8a4145d3e21e0a221 100644
--- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
@@ -22,20 +22,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	clocks {
-		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <19200000>;
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <32764>;
-			#clock-cells = <0>;
-		};
-	};
-
 	ppvar_sys: ppvar-sys-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ppvar_sys";

-- 
2.39.5


