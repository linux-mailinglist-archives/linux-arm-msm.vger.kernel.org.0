Return-Path: <linux-arm-msm+bounces-21568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE218FAF3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9348E1F21D26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1531448C0;
	Tue,  4 Jun 2024 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwexEOHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF713A415
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494598; cv=none; b=tLwunu+UUusRYVL2wz0IJLXOzIaLM9kNKP95708WjWYYYCoBhLngRK8DxvpJO/zKZd3KsF8Km4ZYPYCdkRptiw6iOT1cRdqE95fXER9HVh8AXfoMMjGEMlH79zni9zf3q/BdZo+s7EQPRWYM8sbv/zAZ3J9PGDeAMX2hwwsErAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494598; c=relaxed/simple;
	bh=na4DmRVhf3FcBBjP2+QrPnSQxRE2pOArDjSYe5oibYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prMOMvghWdy1bCgACoRD1NeSWBLvVcg7Refmi6vpRfAmC+9vbXccbVI/GjSFA0+L+ZVZX2PJWSM4HirteEeF4JtN39Oyx/C2Ssb2nw8AEADQNaEIXLnciTetwqI+AvYQYJZarSeioUdeyg8A4jxcOALnQyfLvAM0jSk4mZkk5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwexEOHJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42133f8432aso21933815e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717494596; x=1718099396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eni1MPkr6BQj2JNT/q670h2qbU8dOfZxcp4/xHPwJss=;
        b=dwexEOHJavBHonEodhblIAbCatA1yrJDYDAt3CRR7mYZXilcIwqZjK/WM9umqVOdHD
         kmdqnA5vi7NS8wvLqJo2UHbiziqMmSE3QyAx4I9kzIlirVt7w6EL1XSW32s0hWFnClLJ
         ceIdqP+aNFjpow+pLOzAcSTRRtnR7KKzIJoNQxUS8gmn8qI52I3/xsJPS8rXoW0glXSf
         414W3fPES47GK8fBrUIuU7tZlRpNFxdwoaAGINDCbYRTq3ONUyKD6MzGt/ozYLMQFLPV
         98jCVOlQq6srlnk/6AT/X5DQ9w61Yn+unpxQY5v8Ib6uNxjrlS8Z0LjZbjmN2oi1C6d5
         OKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494596; x=1718099396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eni1MPkr6BQj2JNT/q670h2qbU8dOfZxcp4/xHPwJss=;
        b=Awb2TJPN8HtGBXTlJekHQZNY2F/j++xwhrVR4cSydNKUJus3lExCIx9ET1Jsu/++CS
         CprNHcMgOelBNCl82Pa3VKt+yPX96Lz3yumXWs8UCVa9yhv4v+4qyFGSdtx+7d8CiIut
         TXZeiuD2PNVARYBVNjWBJhfqXt1abIPXOrL7IW/LxUm2w/G8aVb4BS+OOupWLdLxJcIJ
         HMzqvbdcMh6VXEKEci7KAEFHp0AMGis5tt/I1JqrJdvbx8GKNHp0yWY0ZmBpmzdMat4q
         cpduUk6dmyK8B2ueG89BfZ8W7y3/BhQNc00CENNZrWZE5OK1vb8igR0CrucAlxjkotH1
         hUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT7r3LXdohATmLbWu+bwpznfJUqwJEmUj9GVyhPYue8rM6zCcyjHwymff1aPZ3NgJS455S4luU7UpU/YPYqYG8JT1Ej+TMf8IF2ZrKlQ==
X-Gm-Message-State: AOJu0YwX40B/QkUyTFD0WUiCs1YmyTweY5WrGxGs0RCwCkfyZzh1gqCm
	rJLySP6FSZv5q981vhzpa6XZ4NxrX6U6V+Lm1lXaaymWXivVA1kD9Q2fhRvyjHs=
X-Google-Smtp-Source: AGHT+IFNMTp2Iknbql0HmyBQsEdTLXkFZeovjw0rNu08wnkyq/afZj1EhQbTkmzPjmLwe8o15TBXbw==
X-Received: by 2002:a05:600c:a47:b0:420:29dd:84e3 with SMTP id 5b1f17b1804b1-4212e0add62mr97200255e9.26.1717494595840;
        Tue, 04 Jun 2024 02:49:55 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213c264714sm72904115e9.12.2024.06.04.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:49:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100-crd: add USB DisplayPort audio
Date: Tue,  4 Jun 2024 11:49:47 +0200
Message-ID: <20240604094947.98191-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for playing audio over USB DisplayPort (the two left USB-C
ports on the CRD device).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index c39dd493a3af..08032c02fc22 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -189,6 +189,38 @@ sound {
 				"VA DMIC3", "VA MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -836,6 +868,7 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
 	status = "okay";
 };
 
@@ -845,6 +878,7 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
 	status = "okay";
 };
 
-- 
2.43.0


