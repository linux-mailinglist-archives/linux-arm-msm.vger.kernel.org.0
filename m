Return-Path: <linux-arm-msm+bounces-34837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621019A3318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 04:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91E3D1C222FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 02:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FFD153803;
	Fri, 18 Oct 2024 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwhMPome"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775361714C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220106; cv=none; b=Tyfy5Jjjqcu82u7VYcgzsBzlb0UXOEYMiE9Ol4tzEwOv5i7NSBcAGiWz/hrG2NsOVLFouxqgKXoWnVC5zKirDNJW6XQykB0nBNvpuzlFF1KdBhwgxEuc6ZD6X2qP8TJk62e28qAQetHsN9YbZ0BlaFNTWHk22WShJfQUcA3XgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220106; c=relaxed/simple;
	bh=xedB+SB35rrM1xMdjWGMO/4ms1873Lcpp/f93A898qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9tp0kO7z7w2Xj07pXsaR9D0a5yKlakJI4M9gas/FXmO2KroMQ1sGJEovq2qqLhhhO5DTaPAWWKmxeuygo9Y3hR/FdOw92AVAz+Ze3OYQfGqEiPNqF56YpDh0YR+anrHt9VaOPC16MZPwXg0GRJAoK2LY94CbRB5a0wNIbj0ulM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwhMPome; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so1045715f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220102; x=1729824902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMr0ESHdQgzcPRySL/dluD2VQE3JhFz1dwfU5pmNjTA=;
        b=VwhMPomeT3ZLJl+SuDoKYx/78er/bZWCZ+RK0nCz+eg0o3yAWgPhO9XrA7uIKompmF
         0g8d9RXlrgGUBGcVbVjfPGHz5/I8hPFL0tG+nMndP7KbiKsRRY0/fZrIwIhx/Hh9fbzd
         k3jbM2XmThOXXV+DZ8IRbPbqD0hIenOQDdqOBUQlIdn/0S82OjdM5eJQgwRvc9sPQRje
         zc4tSh5sNKFXIuZyLbfzdTzLT64UJAZTTHomSB+CpopQr5w07Tcugz9Mj5vbO34BVv2G
         SPrmdlt8AcBOCs4Xeoxh2nyVMT7iShDSmlsV2QURYROTtOEgsDqW18jZkMvUNvclpcco
         0FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220102; x=1729824902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMr0ESHdQgzcPRySL/dluD2VQE3JhFz1dwfU5pmNjTA=;
        b=sydxPUnxdGCztKcv4ARE6XB9GTSL6d78gJm98apEiW/+otW1Ph65UdGCKngIlElC2R
         4QWDI12VCfNMeS/ZQ+W7pekZ8vQ/KaHRJZ5xJdD7cRivhs/ZZhd9iTjJuAgaa7+ppfXI
         AuZpiL2ssSKqIn5MnGgvl0lZj7lMQncwxWg7Z55H8p4ykNeipRFYuqT7GL7O++ncZQKi
         orfrH3LhylngbiExfg7j1r+LnfGvb5v5y1l47AnAKKrVI066ElX8l/w/CjJ/SmeKZi0F
         0/uzBMNQ6cy90e7557jfhAb6gzqFi+UN/Sz6RaUqQSPzkIVcLl3d0cyAE4epMQsOQNYq
         A/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfuO8FV3hruTQ6xT57iIohmQKQQPQO0Y4HSfWjLqzzgdpHXuaA0D6Inp9WTMWjIgNKKs0a7zryQK7Xa+T@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/DpwkPJgcEGvhYRO874NvzI2yn79RjNd88RcRTMTEZZR8tSZ
	maOInMcb6V51t4EAKpcd8bzQiQycKhYEsiGhYNqixaSv0xgn3te+x2EW97A6E6U=
X-Google-Smtp-Source: AGHT+IGvUn4grmNS8CcRKT+SghKVVzCeokQjz5FYdRiEPm69qPlRzfdRibvODAIWEaDjkmb+3OCRmA==
X-Received: by 2002:a5d:4e4d:0:b0:37d:542a:7872 with SMTP id ffacd0b85a97d-37eab7281ecmr455305f8f.49.1729220101751;
        Thu, 17 Oct 2024 19:55:01 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:55:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v3 4/5] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Fri, 18 Oct 2024 03:54:50 +0100
Message-ID: <20241018025452.1362293-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
lpass pin controller comparing to sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index c5add8f44fc0..ed5eb5818d5f 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -36,3 +36,42 @@ &CPU6 {
 &CPU7 {
 	compatible = "qcom,kryo240";
 };
+
+&lpass_tlmm {
+	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+	gpio-ranges = <&lpass_tlmm 0 0 26>;
+
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pins {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1-pins {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
-- 
2.45.2


