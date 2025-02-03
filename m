Return-Path: <linux-arm-msm+bounces-46752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01975A25ACE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8716C165737
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE7F205E0B;
	Mon,  3 Feb 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGAnwtdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669215CDF1
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589009; cv=none; b=Ce1Uyxm1+bv/dF4cFgSE+L/Wzy4qVaAJA4c+6kSf1wyTPYUvZrzq/zVRhGiCNQPVXNub/aU+mi704NCH/8ydZ0c1EmxFLNl5n3JX2P+rw6NPurqRJplw6wUwOBqiDcu7IYmVPU7ohHpc2E2oXJ6zLHJuMtI9IqH7PmSCdU8dnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589009; c=relaxed/simple;
	bh=EOIT5wasTuCdnIGFj+C+v7Imz8Bay8RvnyftNqd+jIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fjwn6zMRoB2vFcLOLY6lr+HazfgdZrRIKLRxAsj1fiwXPGes/wpY+kChU98gZ0u+W+Syw35gVWN+uokNs8VknaXKQ+fOCfD7c+p5y7FnNf6rOqPzeSLtkVLBXXFXjsec+Qk8QVa8FYUp6RevvtyoAzQnr9fxF2hKKExgv0WALYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGAnwtdW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a39e659cso30217525e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589003; x=1739193803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXfDylpmdi5Gu6DnNa4S+BfTwzb2q5/gQueEk5XiMs0=;
        b=iGAnwtdWx16IqVgGu+I8PN78UTvofchjMNOWwm/m8uiAzY7jO2xEp/MByIZdL1fomp
         txcMQjx1ksGvU0Y+94SLmduNlpO8GfF0soGu2e10SePlGXTFZ3dsnwlRqHxJ+IblOAQt
         wPbJ99zb/tvbDEOrkbqJhNQbV7TFe6lzcHCu/2IlAnuq1wUUE7X4m6mm9bnubMN/Ko2U
         t4XvzuWbkiVdlzhOlmfXe2HLkUhCKpiOTTZ7SJUj1kK/ScoPbeHZDtM4LWvau+F/QVy7
         FgGI91rIkyVQwGt8WyECwGkaQvvc7rlj/F5Zhjrivp87bP/eAw0EOx3TqXdQN5OMlo/Z
         xA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589003; x=1739193803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXfDylpmdi5Gu6DnNa4S+BfTwzb2q5/gQueEk5XiMs0=;
        b=K0q9Dx3khXCcsYCwr3q78TpDfU2Ig7SOXTwuqWLPmMDi71qcNyLFz/QSTHWQnQSKSk
         ZiY2KyTGH1CJUdY8fOmlq96G3qti6WopK2NzNnjLLaZ6m5rHPigNF3HwBbD6uXCVBlQ0
         HD9S5sOZCRt8XJ+kCGspR8OI5Dh2IbE7CG4S358GWZ5Sg8ix7jSmjxlmoMuPnlWiUEQl
         fbnyMLsB2GkoUryNkeZvlCp8YIOUmzoHBoxBTNskuxLlY1bXZqS/5EjZwbaPQroEmp0n
         DLJrvDYqUoj7zjzbGK8E0uemcK/UbbITbr2+mxRBfDTBnhtwKb7pobqqfD5V7ZDzgw2f
         egrQ==
X-Gm-Message-State: AOJu0YxlP3tLrKoZER5nnv4821pWvmO4M8oG102uzkGIgjTZQkPJK6pH
	KG24anQbrpVXrbll/QInMcqRzEriWWpM2B4fmsjoDkspwjC2T1UwkZL14B9bLDI=
X-Gm-Gg: ASbGncvETR46wwUeKrCIXYu1VjgBMyvyhH/hEneLvG6cFbnzp+pSBAopDcZ4wutsrvY
	xMXOzVIxre5zclFVKkiHguekcCbFH1UAdr8t/pK5C2lOXLTgYoko9iC02LsrU93bl78Pr9rNC+J
	ys0hoHpGU+2CU5uKPHac3bi+XKqcg+1c/4q6Z+y8+LH+t4XJXJxLrw8lvqn7YbW/XFIoC/JE91I
	22vTF1yJiwjj7zollDrYQ3lt1a+XrSC7ozCj8itriWOfbejFJOFciblTISSpwE+vWeKl0W6U6Ge
	gVaCzXWhXCSwMtQI+iZ78A04Uj/pezl8zn3B
X-Google-Smtp-Source: AGHT+IE5GJHn5FYb7QOdVTzlwabnZlpVmi7aKybmkPH4eiiM8cXeslT2VUEAaTnmNv6/TZDnvtlCsw==
X-Received: by 2002:a05:600c:c87:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-438e0d879fdmr154434155e9.3.1738589003503;
        Mon, 03 Feb 2025 05:23:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12570858f8f.20.2025.02.03.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:23:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Feb 2025 14:23:19 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm8650: harmonize all unregulated
 thermal trip points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-sm8650-thermal-cpu-idle-v4-3-65e35f307301@linaro.org>
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10297;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EOIT5wasTuCdnIGFj+C+v7Imz8Bay8RvnyftNqd+jIs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnoMNHq3GRUG9dYxOl47nngw5nliHhpEMM3iIhL1d0
 o1jLzHqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6DDRwAKCRB33NvayMhJ0R9tEA
 CFpRY1iDFpPmKDW6/3YvU4j5G4OE/sioIEF+jtcexa0Pc5nx5vTBnJj28uvsjyqIMn6Gu23G5AgWoN
 hsjPgO+1WaYnfqj/58Etul9FvxObfVHzJQBD+HHksZHf/uRctsXW1u7GQ6c94As+O4ra8Hbu8ez3mA
 g9jRcD3WIPkgQqThrPiwvvOUXrvIZM32M1K7CVNHow02U044xa2p1ziv3R57pIdLkED6bxSzBHbaOy
 gsRL4cJJJ0EIHXtEhRyBgeQVVDvXodkfjnMwClCqzRtU7nGBKHwExuHFC/9Ek38bhi6DLI6mkRKfSy
 smBPAH4wbJqGnumI9Qtmju55vD6s5ethIQ6GpAswp99zi13xaY0S8GEGEV5dHZx0kwFTqsVXBNgkFC
 8mcvoD7OuJLJVZYMTs7DrEQN3S1S9Aqm+B02qNKqIG0YHUSas4J/Y1jUGorNpUM9Hz/Z0A6Jjbi7Um
 BBv5SzOjxttThhbDVwABoMBwj4B7NuPN6TZ7VwzZQgCBBILgcaov+oAap8F+dYV7Ux8vBDgKH31yQX
 mN4mMJtP8JQnMUY7jl3qiR26lMm2O+LR8QBBtSKZAcgrb/a2Tlw9tkLeZ5v055b0CqAV5AMtit6jhR
 dG72gld9mYYjG7Yza1KTG2lyefmC6us5v9sYwQiiZHMHK54rpz9rqaawnHpQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While the CPUs thermal is handled by the LMH, and GPU has a passive
cooldowm via the HLOS DCVS, all the other thermal blocks only have
hot and critical and no passive/active trip points.

Passive or active thermal management for those blocks should
be either defined if somehow we can express those in DT or
in the board definition if there's an active cooling device
available.

The tsens MAX_THRESHOLD is set to 120C on those platforms, so set
the hot to 110C to leave a chance to HLOS to react and critical to
115C to avoid the monitor thermal shutdown.

In the case a passive or active cooling device would be
available, the downstream reference implementation uses
the 95C "tj" trip point, as we already use for the
gpuss thermal blocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 170 +++++++++++++++++------------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 798265e0300e7c7934e04cd971e3b9d3d55e3bec..24070d99b6f097f38e618330414b5a04734e7e32 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5661,14 +5661,14 @@ aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				aoss0-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5679,14 +5679,14 @@ cpuss0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				cpuss0-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5697,14 +5697,14 @@ cpuss1-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				cpuss1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5715,14 +5715,14 @@ cpuss2-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss2-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				cpuss2-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5733,14 +5733,14 @@ cpuss3-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				cpuss3-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				cpuss3-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5871,14 +5871,14 @@ aoss1-thermal {
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				aoss1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5951,14 +5951,14 @@ nsphvx0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphvx0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
-				nsphvx1-critical {
-					temperature = <110000>;
+				nsphvx0-critical {
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5971,14 +5971,14 @@ nsphvx1-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphvx1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				nsphvx1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -5991,14 +5991,14 @@ nsphmx0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				nsphmx0-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6011,14 +6011,14 @@ nsphmx1-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				nsphmx1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6031,14 +6031,14 @@ nsphmx2-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx2-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				nsphmx2-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6051,14 +6051,14 @@ nsphmx3-thermal {
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				nsphmx3-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				nsphmx3-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6071,14 +6071,14 @@ video-thermal {
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				video-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				video-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6091,14 +6091,14 @@ ddr-thermal {
 			thermal-sensors = <&tsens1 13>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				ddr-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				ddr-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6109,14 +6109,14 @@ camera0-thermal {
 			thermal-sensors = <&tsens1 14>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				camera0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				camera0-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6127,14 +6127,14 @@ camera1-thermal {
 			thermal-sensors = <&tsens1 15>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				camera1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				camera1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6145,14 +6145,14 @@ aoss2-thermal {
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				aoss2-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				aoss2-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6427,14 +6427,14 @@ modem0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem0-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				modem0-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6445,14 +6445,14 @@ modem1-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem1-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				modem1-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6463,14 +6463,14 @@ modem2-thermal {
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem2-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				modem2-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -6481,14 +6481,14 @@ modem3-thermal {
 			thermal-sensors = <&tsens2 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
+				modem3-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				modem3-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};

-- 
2.34.1


