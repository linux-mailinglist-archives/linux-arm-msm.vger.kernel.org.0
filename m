Return-Path: <linux-arm-msm+bounces-51769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B3A6785E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9429C189E187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC10210184;
	Tue, 18 Mar 2025 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LL20/uxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CF220E309
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313053; cv=none; b=G9I2eAy5u9Yadk7ajdfMsWujx6zlKyOzEWg7IG4JtLKcBPo2l1rURMunrixRmsKJ2JRmJ/EXTE3OJsnxZFYuoOjqTAZmpW7jac//B/HzIKi0gX2yE2MDwf/ozy1eg6MqUIFaobJ9mU+3W/ecBebC29OAzlFMwqTPace7OJs7/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313053; c=relaxed/simple;
	bh=rCVeganpgKkSmMUxzbkZl/t2tM+TN3Tix8wM6E4Lfms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrc0Hd3V4aoDjAbjp2VrksqdCde5BCUsAHGR9krZDINVqvH3jChoqMv/N6ReTbVCOlPhW+2zPwkYSIJxLmDB+3rQ4nVu9mN9fULOtlKFa/YxgNV+vKkiDAzte8Bf7zgr3yQ3SIbcJL/aJXEYqONFUcJFRiD/w25X1LMSVwNucjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LL20/uxJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso191464766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742313050; x=1742917850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SxRdYZ96n2ayDL/V6fz5vJX00R/j7bp+EUMURrHrM4=;
        b=LL20/uxJfnyu3Tp571roFQEX24Km+CtoTVtW5a1g8qgDkjlLgXGjI2cIUCgcwSSTLZ
         dRgj0o7/4J8ZDn9NSjsrREVYfzZ4gXszPGyef5p5efwNX+RBALhazjt3iehOfDbGBi6v
         k7Jzck7V6FzT79qgj+ZbPWjkqBPuCc147GMQN5mEsgrqC0lEBySP/DeD6MBdbqYwPuOD
         6QRRuCBPIgv3Lhq7nQobzlLVPWaTworo/Z7gfNkc4vcBH9yCDBhaf+VKQ5y+y1fQsL9b
         ysDgaH+rrE+zrOwTWaUUo29IUjoYf9h60Ng1LxX36hVtAY4QY3vGh/1GnKbiaM4qWyJo
         NEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742313050; x=1742917850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SxRdYZ96n2ayDL/V6fz5vJX00R/j7bp+EUMURrHrM4=;
        b=ufBsPRAU+CZlGZClJMYjDBW8yGgA5q2z6WQciw1n80k79lOhJZAM02THbQ2/h6AXAk
         mBxI6tvtufevUU6w1BlvUMoiCxNFFfI77qUWI88vH3sV/MUDSxjNJWC4aYLDOnbCtCnO
         ylfBEpdXF/J2/P4wJK7xkwZW+hGHBfF4dLqnVhxsgHXY1CT62JzM07AlyBKt258YXJO5
         2ysb8J22W16QDxwZpbqU9hwNiq/vu+uwabIHA3SV+1GjRiO7WZw/QxTKDptuLpcYn102
         YKs1WtAQXgUn0Tneo8F6cmsK/SN/ILRSkbQXTLBsp3XZx/UXvQbzNE5PId39bXptHW0g
         Sldg==
X-Forwarded-Encrypted: i=1; AJvYcCWw0n9dwmBoWcfjDnyNo8G7XumvWpw132sQnU8OyfUwQ5aqyS7Vb1PXOs+11nVtxc2btSsK5mTv7CcOxEAb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzle692wrvsqcwqQP5SPMQgqfVDrfGZdScIaWfm5Ue87Y3VeI0C
	uWpjIA2EOSbctuEvOfJxeC206Shsqw4XdOTKFCAa6WYD0/Il5hSqXMDyjL6yLkLLz+06bXtWYGj
	S
X-Gm-Gg: ASbGncucG1c0ML1U7Iw8jmXd70ysl3KRIKAJeilCj0wipwayFg17wIkN0ZnbZ7GHJMv
	iXd0G3qnqXXH0PyY7wWepqQuPLXGJnW1uYckebH6MX0WuMrjkl3Kp0n8Ly3qaB/6FCQU9YMSwjl
	J3fD8nAOpoEhATbuo/QksVDO3QqsO/o4vMp7llCBrj6oxDRc1FUhyIOxiQYg0amtN/M90qTU6Nu
	e6NYlnZrIiNjSMohYBzwunuZo1VP4rVh0Nbib7wCyhBuB1/8NnSAGnOjoU9LKKj4yUgPzP9hIHu
	tjn+2pHp4exCUG4VWRgYZBS8dw5zfus9uLSEacDG4Mk=
X-Google-Smtp-Source: AGHT+IEKCPuQQev+o0+YEdDKl7tdgUxc3l0FvMatFpeLvpp4wnyLNN8JknDhVHmNYu1IQdq9pe6y9A==
X-Received: by 2002:a17:907:7241:b0:abf:78ff:e271 with SMTP id a640c23a62f3a-ac3304dffa0mr1984316566b.49.1742313050085;
        Tue, 18 Mar 2025 08:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0077sm875615566b.93.2025.03.18.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:50:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 18 Mar 2025 17:50:35 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config for
 USB0 retimer vregs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-2-1c092f630b0c@linaro.org>
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
In-Reply-To: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=rCVeganpgKkSmMUxzbkZl/t2tM+TN3Tix8wM6E4Lfms=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBn2ZZUjDHi0vqhIg3drSU+F3dHvkYwMoFaYrTN+
 cD4T6qtT/6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ9mWVAAKCRAbX0TJAJUV
 VmyVEACkYoRW8iPBffxz1TxKfC9gNMTU669MB4BwTaURu+VzQfqXIzPBnQcMQiP076Qyc8o21Rw
 tLkoG9jYZd2hIoha8GdMYDynMLH9PeOclE0xrCvBvpWPMr16mzLcVq9BgdxKTRcGVZ5DMTSW5q/
 iSjnsL6Tek39HQ0ua/D8I6CKRsVdSKhIJgM1fkA/AMUbxnhnT7RgYGbauD8Ir+5zP6AoX1jGbq8
 Jm/DyCh3NUhgqvbImeQCAp2wjRHPWs5EDykAgDYKD1ksTYaQhQLCTTd0X/QaLcsmcDAZM/xTVjp
 eaOM51cX7d9wman5r5xPjFk6YnV/AIME36OOlTXYvh2Xw/YzFF9Xrn/MzAiTh4ySoOGSK3dPM2N
 FjFi3CtSHvLjoqjeUdlkd89d+5+l1q3ssr4YOSx2IsOfxn7emSDBmk9jdNKOtGDBJ4OYYbExnt7
 Qn+jwsEVgURKPnO6N+RvYVXE/nkhSw8QvCop4qNvUcxp+aLv8pRZPNTo+ZCGlm2rW6knetVHFez
 VRhnA/LJPjkInpxrSciAxJDJXZQ1lEM9skfEz0fSs4UBcf2obnqR80KQaQLei70sL0/oJ8CE22i
 kiCjeRjlojyFWNYc3vX0/M4EuBZ3DK8Gf1YqoD0rAuDunhDzYbif+QXuuxNmndP4R48UPii79ye
 0svPkl+sWVykX5g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the missing power source, bias and direction for each of the USB0
retimer gpio-controlled voltage regulators related pin configuration.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 902335396c586a991c4a2de19906b039d887780f..8e88e00c335a05d0d36b4b08b85df82f38ef4355 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1039,6 +1039,10 @@ rtmr0_default: rtmr0-reset-n-active-state {
 	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 		pins = "gpio11";
 		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 
@@ -1046,6 +1050,10 @@ &pmc8380_5_gpios {
 	usb0_pwr_1p15_en: usb0-pwr-1p15-en-state {
 		pins = "gpio8";
 		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 
@@ -1053,6 +1061,10 @@ &pm8550ve_9_gpios {
 	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		pins = "gpio8";
 		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
 	};
 };
 

-- 
2.34.1


