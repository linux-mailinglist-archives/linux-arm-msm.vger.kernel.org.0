Return-Path: <linux-arm-msm+bounces-8143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9583AE9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 17:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA3C1F24B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA5D7E762;
	Wed, 24 Jan 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0bT4Blz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68867E564
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706114714; cv=none; b=G2Uw5SNt3mNIU9KFMYMyGPA30fd6aodGEYK6Y+d2TsJUY2w254bjUxKmaS1RFEHOttl3qs+wMm/BYGkKI2uv+oi2kCQO2eJOWkzIpW3VswteEsmgEr/2KbWO87ws9Gr3E6WyE+XhGCu/cv3R8D9bTvU+Y5iYePR05RJxQfQ4U+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706114714; c=relaxed/simple;
	bh=QoOGnO9l48+0iK2zIq/3QM25tfKdYuavsbe3FmMLGCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S9v0xEqEgEz2PHmZjSGQ9BW5kCtBnLHcqdrN7tOjmnZpx43InMrqjgnYnw0Y0rEUKSBqnK9PGHzjQ5tDm+iU8Bx/CTRN4+GCOolPm0CB+lU3cPvcdVHG1dtRtKETHCEV6PYNi6Ma2+Ak/jlJ6sjKRqmBKg6jzZ9wDO4M1V7masY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0bT4Blz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3392b15ca41so2564824f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706114711; x=1706719511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPfitwNDeh5IgnqcpIOPgmDXuTM9ZGL9gpaSrx5A5EI=;
        b=Q0bT4Blzca3gzvOquclKRUMXcovCgJ3rbjkEdaC6IiCS6146aCpprC7vxsqn6BmZwp
         0Inw3gzFJ0DL+/unlqNpbrYrt1yUiLymcTmL15WXsDXlVdf+MhnTKquCTdzGykTPMn1q
         TNP0hpsims2RBYMT0+Ge3TFVCfaoWnNe0jUsPVVvAJJ6afMTX6NentK5MgWyNeH9jaVs
         rjdOLUOkHKnavccCdJgpRKIGXGIeplV7KnXE7uJnFVslag5prIst/BiLUAor4xjrBbXw
         JrvmJBckWF9NLrJqu+pWTC91RW23g4vDy5+oxp1Ksxp9y1I5B86bZjF9qHhKVI8fPTtS
         2/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706114711; x=1706719511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPfitwNDeh5IgnqcpIOPgmDXuTM9ZGL9gpaSrx5A5EI=;
        b=veOSNp8DGO1idjwWrjVKoy5IC+9E043t2UKgofsm9bSeuaQ8V8AcTrefu4HSqAsAnI
         0WAax/YvLTpf7rIMLpTYQaoJ7x+bC5+QoI0U+x+6O6EYDSNZuyxpnEpYNqkBaWhuqWBr
         Xs6wDWojY5PVRUrK6fDph2LisEcuF1/cQCnk67zAqZ0nttZpeuR0TsBzOjeM7TcAaqfB
         ALKzw9SnVS24i9rcCtR6abczXCpv/UELN3pXAPW78PlTNvFCSHvlr86fxedXF82ea2Fp
         l5xTrsL0rhy0zu/UwPmZotdqqDDWeuSKcNgEqq/6aKn3t8Cm+IUCM9UPJQhVHJN2UmBr
         /t4w==
X-Gm-Message-State: AOJu0YyNMz5YGR2T+fWNhEBrtndOb4VDSJ5v9rY+dBX8lOGFFR6FaC1z
	AMGuIvdsmQPSyAWw2tx6tOL6txLCjafoxnAn+Ajze5btkgnZgW/cz9OhuyKPXwA=
X-Google-Smtp-Source: AGHT+IFNcVQ/QAhZDmpYTpVA0l1F6ufY+pFwRE7hXKbSPf/Vo2IglSs9KoURycgpOMh/wr1pefDR9A==
X-Received: by 2002:a5d:4703:0:b0:338:5dfa:5080 with SMTP id y3-20020a5d4703000000b003385dfa5080mr595282wrq.24.1706114711106;
        Wed, 24 Jan 2024 08:45:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d5909000000b0033936c34713sm8137883wrd.78.2024.01.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 08:45:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sm8550-qrd: add correct analogue microphones
Date: Wed, 24 Jan 2024 17:45:04 +0100
Message-Id: <20240124164505.293202-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
References: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add proper audio routes for onboard analogue microphones AMIC[1345] -
MIC biases and route from TX macro codec to WCD9385 audio codec.

This finally brings AMIC1, AMIC3, AMIC4 and AMIC5 onboard microphones to
work.  AMIC2 (headphones) should be fine well, however it didn't work
during tests, probably because of incomplete USB switch.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 76e9ca954093..79ec673f9f7c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -123,14 +123,21 @@ sound {
 				"SpkrRight IN", "WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
 				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
 				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"AMIC4", "MIC BIAS3",
+				"AMIC5", "MIC BIAS4",
 				"VA DMIC0", "MIC BIAS1",
 				"VA DMIC1", "MIC BIAS1",
 				"VA DMIC2", "MIC BIAS3",
 				"TX DMIC0", "MIC BIAS1",
 				"TX DMIC1", "MIC BIAS2",
 				"TX DMIC2", "MIC BIAS3",
-				"TX SWR_ADC1", "ADC2_OUTPUT";
+				"TX SWR_INPUT0", "ADC1_OUTPUT",
+				"TX SWR_INPUT1", "ADC2_OUTPUT",
+				"TX SWR_INPUT0", "ADC3_OUTPUT",
+				"TX SWR_INPUT1", "ADC4_OUTPUT";
 
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
-- 
2.34.1


