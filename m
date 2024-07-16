Return-Path: <linux-arm-msm+bounces-26347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B89327DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B61D1C227B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4D519B3D8;
	Tue, 16 Jul 2024 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKrRriEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBC19AD89
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721138233; cv=none; b=KVJDytOtz59Mi7Kn256wecwT7m8bP6oAY4H7h6X7pgz8E/Yky+VWWEEGa/q+cSZ2ko2lXeQwTQpk+NYw7jP0ZVWfc18EnNACOMIQaHcImu1rNkD6PZXSlO0MojYUYoXabrvmm4IazOBd7+RlViFTNN2iv675ViISR8ClHf3fQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721138233; c=relaxed/simple;
	bh=6ielWizRopPkxt9Xz5NhoZmUGUPDJRFuNHGi/CU8TFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/C4jyzwEl9C9vKjW9KZZLOn5VcylyUImehUDanZOq6KBP8Bo9ED7Id3zfS0//UwE//u1EDXT47cHBqPWSl5pYyuEyn+kayFoxkDEoTZMBOuRCTpNsO8/whhh/Ybw37xphE4lIvGVyWVsz4YbjgaH+rCr/mYHuHon3NuExH3D+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKrRriEF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so43889215e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721138229; x=1721743029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AD5pyTTXIBOHwrPdHnxMSU03OrIeYJeJpP0/KwZpIGo=;
        b=kKrRriEFOCiDCMHH+GikMXjV3iMpeVUMjJzt8VvVCfnU9EAj+Lwxjx0hjBurjQ50t2
         +5Z6wvK58cAMc9So5WEvRwbYUcOyfEQJ1TsTvlmX9FbXOIA5N9Dzjk+3K3sSpa7LnCwE
         tEwWI5DWMuCdrBDBglUOSZkF0hFVBLk/Qn+8oRv07ZnDTgT7d5eIiQS0Iy05CQ9FOuNU
         EEutZgibVBPbAWsFE8WCsqv8rQL7wOMdWM9KWdbNGqCgaLj4hHA939okGkzwY2sHqsnx
         7NF24ltNiAR4pUzsR40vOPkWjEjXMR/6BabC/hc7ucv5d7n7vnl2ZL6i/KlYONuY6qDz
         gE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138229; x=1721743029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD5pyTTXIBOHwrPdHnxMSU03OrIeYJeJpP0/KwZpIGo=;
        b=NnKLTADwmhaPrU1JCZNDCPvUDPF4LKIfyJ6+QwEJcHKEpAMEsJFdfifbSAv4qNMGfv
         7VeG/F3nPjBl8qaUJEiv+hr9q0tZfGLqkcTeAXWFxTLGo9JHV+p8cylbGuZfGX3Lz5+E
         uC3gFbAQA/Jpkn+SDhZk1Q8a4cEuKXw4UDZgO6ulA/F9q+XAYknc0QZgUqdssOunQ2zp
         voQpKlIk0DJPmeEK7deL9eCYVZYILH+g5YaUakXV8le6n9YWWbidVAPAaeHZQ2vRKKJ8
         odcjpDkjyUu1OAXEvlb2CWHBxJbcBAUomFlNhrLVMPawUt767L47QdPF0kCfQCb/kB8X
         6plw==
X-Gm-Message-State: AOJu0YyKvyKlednfVvlIXhTfcPrz3wy46ZIQimb77y/qa5CvglD6TM1E
	uEL38ddabza+iWmbodbGS5bx01MVPsVKxlGy6GrMGST/QX2koin4UzkoDCjkqwMuzqcVnXmgROV
	Z
X-Google-Smtp-Source: AGHT+IHfXvfzcFPFhmELdhCG/Exp1aFv5Ieq9lSZsPGvNiqjb3fzPq3o6IHorLqxOsRM8yer9Q8BXg==
X-Received: by 2002:a05:600c:1908:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-427ba650391mr21090175e9.8.1721138229388;
        Tue, 16 Jul 2024 06:57:09 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427bb99a23dsm19118905e9.1.2024.07.16.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:57:09 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8939-samsung-a7: rename pwm node to conform to dtschema
Date: Tue, 16 Jul 2024 14:53:38 +0100
Message-ID: <20240716135339.87192-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the pwm node from "pwm-vibrator" to "pwm" to conform to the dt schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
index 91acdb160227..ceba6e73b211 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
@@ -198,7 +198,7 @@ touchkey@20 {
 		};
 	};
 
-	pwm_vibrator: pwm-vibrator {
+	pwm_vibrator: pwm {
 		compatible = "clk-pwm";
 		#pwm-cells = <2>;
 
-- 
2.45.2


