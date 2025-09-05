Return-Path: <linux-arm-msm+bounces-72240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C0B453CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1340E3ABA18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0C4296BB7;
	Fri,  5 Sep 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+eGuey3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B9296BB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066044; cv=none; b=I5EYDNXHDQCEKAUeQ8bZ+HOXZWN8ySBwuIMTakkJbj75qI0ck9OJlRA+0jIXnZxS3f9NKXBfxFFwMmdSLNiLRD/zew/sOwzLvD+f1/Yv3BYUHa/Np6Hd3ECbSOs2QpAChnV2NOaWvisH2/Ny3EkNEUQX/yoXgXXAylE5iGedY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066044; c=relaxed/simple;
	bh=/znKzGBu5RuPK371ffJpsYCdH53GVaLVamMZW2EJlQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN1fmHt9aThCGqzRLhH8xpMsLQ7wY1zG35RyXKagJyZBZa59DVlmEnfTS8RU+W4ZQhVMZhbXhONElgUHT6JFNE/d/yGE1a6d1lkWQib+cl+yyGCCLT+OD5ERjHnVYB73A0QJ5W1YhNh8gpIDBdUtLK3L4STIFNwINqZH4NI8bKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+eGuey3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so2873025e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757066041; x=1757670841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79qwGQajCQ/R8QZORjPKFotZPS+EuPoe5zdLgoDwmiA=;
        b=g+eGuey3CSTJw3s+92n8MVahqwQFKCOG+vCAvwzH1RIqUUdE/0XyvtI1NrWSs/Ua+e
         dLQQAi1AQxCND6JwY31BW1O+8r0MWW9hTa+ZiBWZdPbGBYGeHsHI8U9UAldE8fv3AmBz
         l78aW8lGSgivQx8FW289nW2FMyjhVlgvVYsbr2lLe3lUSrwoMS8G2K1iywg6MMdmoEde
         LsmZlz+5mhusRF+TPBjh1h1fk/RAQImRMx0+Sn+h/xl13cXlsIvS2eitctHFcQS3P6xb
         x08CZvLEbulY7o4JYGzaToDAfzRK+c+8mJW/i1ac5N1nlxiDohPZ8w4I7iypPPe4MF9R
         cFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066041; x=1757670841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79qwGQajCQ/R8QZORjPKFotZPS+EuPoe5zdLgoDwmiA=;
        b=Lv8FQdN02B7FJfPZv4v5ubeivRktQp5scETe5FqsMTcvULX83Rn/2qk1XFMaWd6AHS
         eTh4/a9QOSF4ePPymHnLWFPAZsIm/KZla5wNnbvTaU1Rr8ZJg908uMNSDCRAHohJWpl7
         wp6YQpC1sxcsYqar41FXDbCxlNNvTfrMSh4hrVYYfLMfQKknuONPNQ4EjTSfCZ9U0lqE
         +pm0hvsKM18nIYi11qTRLTwfeXjXdMQGqfWJg9RVeJFiNV9n/1GNI8yzb5p/0MrrgeJp
         48aPv5QpQCaVCaidP86kbDB+BE0RpDf3GzL+g1XGTkrCbSoigQoFrAq9pT1GAKgYiy4B
         VhPA==
X-Forwarded-Encrypted: i=1; AJvYcCV3UgAlab2fUMwvoOtR2ctXJl6vMFubJt8Fb3zLfFHshbV3fA6LfqqvkrJjlSSo0kc4hDPjxwnL7fRseZ4+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaEt/WsNGrBDyjbOcaeBy7qA7xxlpNhqUqmG2fpSOI2ZRNlVG
	n5jGwNwlowR3R9Grh5spucn0DkEpUNfX4sawh4siKy2K64O21R80ffDZ2ionHep8sXg=
X-Gm-Gg: ASbGnctIkDyO78EG/bK3EikLUYHt0zhOtQ1ZvVwuWuRqZ5cZBRujeZKW6PS9ZK0HS/Q
	Nt+HSogbFPvjGQC3jSrj/bAePW+aGbuEKzPtKcLNHProeutB2s+N+eS4Lo5UQxVTXDGSzOvsXs6
	qX7sk6oAAreq48HHXi6F+6qTZo9v5P66HsBahXj8q8KJSwgVVr8rCkqeeLUnyCBcMRdboX4geNK
	im7enSAi3qGXLX+nF5D2i6tculnPGX6Nu/7jeUxich4NikHCsmhYDjdHq4c4FZAb1o+cts0eqr9
	UxLYAWWCs88l3ZMDjiYTGNmUXt5daMHuewJMIx3S5cHjudQXMHg6aLssb1TMnd0yUG3+uCXLx4S
	q+Gi5/BTOyoLxzcf9h68EoL3sbzjiXkWeqU22Rr5fpdxtg5j6Qrp09AQ=
X-Google-Smtp-Source: AGHT+IFs3NLqkxTF3RXfXzl4gp74qrH4ClrepPtc97J3f3qeEc5J3aGpEDp1CQUHXfCpfsJxzFJn+w==
X-Received: by 2002:a05:600c:1c9d:b0:45b:75d9:2363 with SMTP id 5b1f17b1804b1-45b8016df84mr106837605e9.1.1757066040958;
        Fri, 05 Sep 2025 02:54:00 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm152550295e9.6.2025.09.05.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:53:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: Enable PMIC RTC
Date: Fri,  5 Sep 2025 11:53:54 +0200
Message-ID: <20250905095353.150100-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=672; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=/znKzGBu5RuPK371ffJpsYCdH53GVaLVamMZW2EJlQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBourMyesXH6y1kWweaAyPfVnS+sAwPXImVjWyZu
 P6myedG5H2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLqzMgAKCRDBN2bmhouD
 1+D2D/9IogNR6pzhuIvj/auBwDyMNBB9XZ+DohtcRgK4UrYOfQMZ5KWCCp7prlGrhZaFPfR3+5S
 gMjtfSxwU+EjjM1UvnEZXkVubIYqPAsHSf4HJIsziz/6lyOwHSpQ2CxnPbS9AFkIuBQpy2duEXy
 CDXFROEJlIMUk/2i7Gua6MVC879FKkVvLzWU9L1s2ktIsQuPRk787xkIO/dUv44S7mvmAaMqse1
 DWu6cPPxkkj5L7tYsDIOMXse1di03q1JouiN2dpQFzt0wQHwAgPCBvU+l5/wyFMBu5+Ip7ZRkUO
 LHImUkKLAO1M6ShkGrGSY3B1jnQcKC+QggtS0YvRMTr6U3WnRosvxz+pV6eJYj/OiagL+gX8bzg
 WfONpgeYjk7sE2PPXDekBYOIKOpwdVIf1cjFL+afEAaTjnJnyEJyc9qyow7j8y4OSPaDE86i9Rr
 6ETaJT/eDzNGdhkkZYQzUG9oeK9Y649v77a8/XzSSnqTY6ml9fcdq4GAaKbov0RToPeUmdCx9Q9
 tOYsCzWDmHa7keajZAZ3iOyHkHPDl5yFtZFonBfxtHW27NljSKuSABORvHa0vohN8ttdKukm8BU
 5rYRXQjEOt0K47YK5k8IPRgp2CrjOkUBU333t7z/j2wi0OjJsgRAq6n0OEeiDzqeTUzmOWGBckc uiqAUdbJes/AS4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Enable the Real Time Clock on PMK8550 RTC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 456e55329665..86c2d56bd4a7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1146,6 +1146,10 @@ &pmih0108_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pmk8550_rtc {
+	status = "okay";
+};
+
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
-- 
2.48.1


