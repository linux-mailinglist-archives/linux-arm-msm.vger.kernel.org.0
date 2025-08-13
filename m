Return-Path: <linux-arm-msm+bounces-68998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C08B24F09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBCC1885826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE9A299AA3;
	Wed, 13 Aug 2025 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBbYBjtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8C291C19
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100791; cv=none; b=QYjA8wCNyox4nmK91b/TViPZHJq31jSSkkEEvI9GjkSnB7H5gXDPsFaaOjb4zgHCsg6GghokiX2DEG9u7bEzATGYbB5g52RFQliNZqlS0rtsXClqiy4Kyf5DoeoCgZ9995DJx+blkaxPkmQkpLzvAHIRovgBQRWc934PSGYLcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100791; c=relaxed/simple;
	bh=l3L2yfE27yLL68tGI1MKqrfaMy8Xr8dhr6oWtd8kSXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cr/Xk4GJMutd1jzdvkWiKUA4FcKxIPHgzbQcuoEbTOwEaO39qG/l/i8edZ2ycQR0+4YZEr9ETo/CZyWsY3sHafFGm/kvAZNcIebvU1Sh50HwYQr+6t2FZv9pe72ZC6njsp3xyNsSiG8uOZE7RyQtdvQYGuraRW9KnSvSpNR2O3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBbYBjtd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so39618185e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100788; x=1755705588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilAhY86W6D/mCFE0ccFmIl6uGsK2qfdLyAFl6RSiZEQ=;
        b=XBbYBjtdjsANy9idyCL/VhHEcd6n1szyPg16yexdPfOEm8WLdYGG37DTS9gvXFBDGS
         phps6ZyzxabjuoPiDgYMBLBro+y5s8n5bi+qBr2VILI/13ZV1Z8J56H0rkU+GxPgFg0V
         acIgXC2HKl6z/xEMKMoCAYpp8DGklHYlxwE8mYLMau2lqxPt39ugrjPQ9h3Qig9hq04o
         9VrXXQVUG4duq9CxYO+Ru8Emhwlu0V5KJveeW/i4B06FsRQKbID7rV8B1sTdjK/i3zWS
         po5hRY1T88NIighVeZwk59hPeEe675+dPpGg2ykreSIVjR7BhD3NuWv0rW3l8Mk13Bbm
         ZcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100788; x=1755705588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilAhY86W6D/mCFE0ccFmIl6uGsK2qfdLyAFl6RSiZEQ=;
        b=U9Wx3g1HVLWIS1aJHy/QxFYfT9l/7zDZ21Q7kQZp6rbj3bT1N+H2ECbZbc4cPKfxCP
         VtJ8TMhmMKxch14CeEstVR9c5G8exUD5eSyDudiJatIm2f/vhiXFl6qeMmk5JCnmEXpT
         y53OLqqBW8u70pnxBlK/0N/s8w01O4PLMXV0rG9jGaSPW8pdq4uqwBF+mXHcf8Bdx0LT
         aKFSN7Fbx3qBY/aHZDlccyxm3/NVVhuK32D5xZAVPZ1YWoELSk+hgrb8HoJ2L9bXKbf1
         g3jwN6xHdJSM5xdfsTHcveRqJFgK1SESZfKgACedT/uJIyO/Q9j7yDr0gSls5MqN2x9V
         u6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoHsGQZGHsHOsKiNV6ArZQkbjpDzmVp5WjXN6DbboVtByFifzSSHYgnS6Qvshq3slYVpHPem9al02KOB9f@vger.kernel.org
X-Gm-Message-State: AOJu0YypQgwodWzQ/Djbwufy9OI4ufR94Al+a1T42srXpl/IXdOCcV9s
	MD3dou0sc96/FPN+TIG87H+8AJbAOLzTVXIHNjZCi5C5FLwvnisMTMy1q5A+3e8NuIc=
X-Gm-Gg: ASbGnctbsORSij1Z5CUGNHy7Lf9CMPLjwqP5Ac34zjLbG8n1alqvRxBqXJBDseWgea0
	o3prU8Hq2vyP1lNhMz8LvjjXrUQL+BXlwUiHFpOYkyaO+D2KFB3V6dAfEiyq3OxNu7l/jqiqGxW
	AMQa9+ty8SmgaAh9P8zVlRuR8+BUc5gKwijBQqLbM5oqyebKoHQ+HTnlaxZzugVyccK2xa5Ptrm
	tQkoqcY0J0YoH9x29KzyOpFUHKsn1Vf0CueUcDCQJbttLksglSVEn1Rbv4LdgfJq5+c+wEjYcgv
	DxkgFaFoW7oqfCz6pbIgWjQoDQwj3EbgoC+tJmrCT+9RL9il7SEEvpGYLIBrh+ibV+8MGHWj3TZ
	BPeNmPGKs84wrsgs9BugTJrzwUdw+1AE3LZ7WKQ==
X-Google-Smtp-Source: AGHT+IFgRJXQP7h2ypmOmygvb//roZOZXvSuj5BEnjvYNBIjrGkAeA47av9q7BT/h/81tPwAMfHUNA==
X-Received: by 2002:a05:600c:1390:b0:458:bf0a:6049 with SMTP id 5b1f17b1804b1-45a165dc915mr30627565e9.20.1755100787752;
        Wed, 13 Aug 2025 08:59:47 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:58:58 +0200
Subject: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Explicitly
 enable used audio codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-1-af82d9576f80@linaro.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
However, they do not probe without the ADSP remoteproc, which is disabled
by default. Also, not all boards make use of all the audio codecs, e.g.
there are several boards with just two speakers. In this case, the
&lpass_wsa2macro is not used.

In preparation of disabling the audio codecs by default in x1e80100.dtsi,
add the missing status lines to explicitly enable the used audio codecs.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..9e6dd0bb527a3b11f9e09d498f3ccc117d52fd0f 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -958,7 +958,13 @@ keyboard@15 {
 	};
 };
 
+&lpass_rxmacro {
+	status = "okay";
+};
+
 &lpass_tlmm {
+	status = "okay";
+
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
@@ -968,12 +974,22 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 	};
 };
 
+&lpass_txmacro {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
 	vdd-micb-supply = <&vreg_l1b_1p8>;
 	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
 };
 
 &mdss {

-- 
2.50.1


