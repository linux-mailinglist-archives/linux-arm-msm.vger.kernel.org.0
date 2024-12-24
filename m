Return-Path: <linux-arm-msm+bounces-43243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EB9FBC61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C5D81881DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C9B1DED43;
	Tue, 24 Dec 2024 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diD3qOFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DC41DE8AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035483; cv=none; b=fsXPU42mTaRmI+ZPaK7/DsjRHJQTpGo6JZhPW8ecE+DiadYpNCGUwF+iZO18CP2FOyUcDwNjXzYxjRA6tsnYB4YTomZZ6wk5ySgLOgygSxaiI5MJefUhwCaSSL5n2cgSkkqbmFfDo+MwSxrWCpJt2boMn/lYJRh5K0vYTQhVCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035483; c=relaxed/simple;
	bh=LwSpKOq1GqZouqzSTW+vvDI2/fjTuTTRV2CIEe3lHrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lii+JBJjHNkg5XPaO9wzqxDhraUV9VUPBzI5LBiJRCIegx326Ih5PTVUPisoxIcviKNPww7BvsSpCUmJkG3iVmi+TZHLPJIHs3ZK8iYHpjpSlIjUm1pK3kao/uxAooER4F3fTGdpYFAiRYHkxxC3GFlYf+aO4S/SQ7Ay3sL2Xv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diD3qOFB; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3047818ac17so25556351fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035480; x=1735640280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVuVXOPYsKpuOKWxVV75YfQI6Bwi53UfnzrCPKYgu4o=;
        b=diD3qOFBG4mhonhqB6skAcDtZYbnQHKXmTfqMmC58Me91+Gs766Yw30oFgr4mvvBzC
         hdLwPW3uhc83povmWiN3w7DFW+KVn2eITp4PnyvhYlQSKPJzt659K4OYVOE2tE6/FjOU
         DnQQnNYhmaSlSpvmYWSFRwY5/1NWnH8tzF8AdG8sB1882g6yR/GtFvJzBeFaSlqQmMTB
         JebZNQ69dQcaLJsvwbLB+Z/SrBV7PGhOeoU0MlZHOwc+8D3dKRYkhUFeNxgdrCv3JFEF
         IEq03rUaAyijJwzP6/bwOikuBoxM7SBD2J/ZDEg1+UB1bKma8vfqM1cTvPPM5VXzokkb
         1OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035480; x=1735640280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVuVXOPYsKpuOKWxVV75YfQI6Bwi53UfnzrCPKYgu4o=;
        b=lh4ICagYH5tVelVY03PzuKjosKUzzJwAWcnHs65YFL+d5FgZInmChmOtXCUxDLIMM0
         wWvVLze6WazLixA8gtgeeTNiRHCBPFkb9pmJAmJOkn4Y560am7ZPEVWarrzQii4lnnLY
         DAOgSmc5Iy9sTQyDY79I4UuJeAgSz2nGC+yTXV0ABasRIxOx77ISgBKjKn8e/2AjVh7s
         RhpdVIKolt2QdAVj+aMnsf7kQRVTpKHwQPii3XTawrdQ2Haq+Hb4GGfjdRmPyEfe0UQ2
         fKYei36UjwuNeobAwwDKYmgUPqzhxOUJjTBxT1cSYzWERY5e019Qanzi4dZfWYe95Vzw
         kz2w==
X-Forwarded-Encrypted: i=1; AJvYcCUOtx4fyJ0uwkYNuumrPT2qYAX13Qj8Xni1etlhNRblSun8VtRCNmhMwUM1T2Egc60WF4edKRnCXKmZhuF3@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7IOGBJwtMq62hJZe8xpNWteMfubq1LnaIHjrGZivMNzsOD6V
	Uy6WTk+MMqlkyfrhhXDIGg6jN2WDT9S+K6oiJrFTdCbNCunc77lsR09TEMzVUJc=
X-Gm-Gg: ASbGnctnRl1wpJYKAQkBxEiSvxXTIvdzZbClMH60J/nBJd3ZR9srV1t0PJ863DDbuQt
	7GY/E4QGzm1bcuPSFuKFywr8KnJBQa12+TQaIefOpwdOotL4LfXAQ8y2uuTmY7xwP++9rBMKOXY
	oCebgsN/sHneCY+GhJv1hhDxjY+s1jO0XtNj7x6KdT/hgfEwGMY9NX23Ayn30wB5Q4ylODym0dO
	/lw4VMiSD8xNDlUU/KdDRhD6TXsxGmpHkBESjmwt6Az+M4ZFOwXHY0xcC3mtHEn
X-Google-Smtp-Source: AGHT+IGaYAxtWqh7IMxF8ViFhk18fgOAKbXw+0V+Ew/jBMysPlIzqhwjKrR3aXuKjnPdNHlWFoBtfA==
X-Received: by 2002:ac2:4c47:0:b0:542:22a0:9b35 with SMTP id 2adb3069b0e04-5422959cf96mr5199367e87.53.1735035479827;
        Tue, 24 Dec 2024 02:17:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:19 +0200
Subject: [PATCH v3 20/21] arm64: dts: qcom: sdm670: move board clocks to
 sdm670.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-20-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LwSpKOq1GqZouqzSTW+vvDI2/fjTuTTRV2CIEe3lHrs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoojPpebgltMOVm1W9cBStllV3ZNroUPn0SKM
 QacWP9qRyeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIwAKCRCLPIo+Aiko
 1RYdCACBqkSxZx6B05HhhKVxR8WQF4pBEjxja5phXGD9ubT3+tKfk8ozHUi/wDtWwr05oel7pP/
 IH50XS8TteG5jhmJ9voKeArxqa/srMR+CbtAeuofabzULHxSvz2zllK55qy+psr/WVgXqxKb1RB
 DaTpKi4cyGbU3+MChOfmhVm9LL16REwH04ehiinyqQ12OIgsdfICUm58q/2uggsInukbaEm/tzW
 oFRaFbNAjev75S3qDfJjqUAT3yv7m13pRhEuUbNLxsCpq6u+rxfSmbTIhGLqdpIYlTli6nLZcng
 IMo9duTTcUnAG5eVKQASw6cGxBttAm7yPQSg2AmPeTj9OQrA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SDM670 devices define XO and clocks completely in the
board files, despite sdm670.dtsi file referencing them directly. Follow
the example of other platforms and move clock definitions to the
sdm670.dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 14 --------------
 arch/arm64/boot/dts/qcom/sdm670.dtsi             | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d45d7d3fa584f1825f4e4e681c2e7..44b708c8a4e4ef5ee1d9110bba372d230fdd5b4b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -49,20 +49,6 @@ framebuffer@9c000000 {
 		};
 	};
 
-	clocks {
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32764>;
-		};
-
-		xo_board: xo-board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <38400000>;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c93dd06c0b7d6444aefd0e24201cea999dcb23a4..c4fd7598d1ca8d8baf4c3da0e20cb191f7883f0a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -28,6 +28,20 @@ / {
 
 	chosen { };
 
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32764>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <38400000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;

-- 
2.39.5


