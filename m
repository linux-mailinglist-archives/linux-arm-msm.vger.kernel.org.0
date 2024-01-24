Return-Path: <linux-arm-msm+bounces-8144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B707D83AEA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 17:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442FA1F25957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66957E791;
	Wed, 24 Jan 2024 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtmEOujY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D967E599
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706114715; cv=none; b=U8HnWVFvdvFeUKHby5Ex+Udn0eXyoUecMhZFhri6HycISBDNW6ZEo/3GN3M8eKusSmOn0+up1sldWmlDdamxcnbpkrak/be+j5fIWpqgrQEPxT+I4gVNjuty3gDGn2lDeg1bqTdeGxxqF0n+BfVl6M3n1PEAHO/a7O+vMBnOAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706114715; c=relaxed/simple;
	bh=jpcsDAXA1KZo6FHeypWnR2nrsXwXdx1uTU+szPAsXns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rzp6+7scE6lL2IOXL+lcCx8ZKoEDJ1yCZDHpS3R6/bvrOFDo3XN9oJzfS8tf5KYmCu7/3J0Cm8Rpy+9Nu8Jupwkt31rYj5dpHgAVh3YlmxraQmcOwWZjUnUGpMbPnzPXWHglPJUjjCw+yC7Ni3ftbIPnxSUprVpeVz0XqiaZNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtmEOujY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3394ca0c874so862966f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706114712; x=1706719512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma1QQhK11zUQI9f4hz2k25EV0GtpYeqsCa+/7KAoKQo=;
        b=RtmEOujY5veOsJjr1Ih8ThLDzgb78MykZozR/w5AePWJQO8ThlitYILjYCzS+iWfZz
         MDCysTjBbTCCNg7xxNAuXKcFUYcFYMyVDxy86xnKbWW5CuplnS20wdWnTfTLvpM5Y7uB
         qoccCgst41jZK1PspCzAVeYFz4gJ8cuaTxcwD83bCHFbZ+04O7dmaMoMTRr38VQ8ZT+D
         NAPzElpCy8vopzMWVLmhzOHqqcBN9o3nnjqZxar7WaFLFxsroK2sbUVBvXQ4y3BBaEEI
         z8xCYkYKTo06oewVDIT4hmyJ9/RfAmQcA/6mmRAKKUqm0XPMrqh5eUAtPFdVlffcGc3Y
         A2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706114712; x=1706719512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma1QQhK11zUQI9f4hz2k25EV0GtpYeqsCa+/7KAoKQo=;
        b=ASgvs7LcTUs4hEb1qF9xhGBip5CXDBL3dRQVsGk9QYc8BgXDEkyUBYgSw+vKSbClA0
         VFbEzjmu33+3RKF+vEJBwFhwIn3avMYIOnoTBZKFO6sNPDgHuHU9qypt1k7Wd4P2/9ND
         nB4/XkKkxSJU2VCCmig2/FpcO0wIr07U3kydjrIQHZuCOBCAyggd2d7F6vqpp/bwAUqA
         lVUUkjXfg1DDSG7cbCkg1dgelRDNoQJYbahVEw9ZYRGiidymbGdBIxz+7iBHQmRiZfWI
         oxa+YhQPsjrmgAl4c4psxVIEjrAFv7Nlscq3EfiWK0J89ifzd43GqhvVYFFFddxdp6Uo
         iZCQ==
X-Gm-Message-State: AOJu0YyuifTP5DxKW1QErw+TOiFsRojGICZE8RmfDjhL13iiRbeCtDBa
	nja2d0bOYTCGKbnH8XpGWYBkUkQXWKzUy/pcptER226yi9XLuymzPnlr+MXGi64=
X-Google-Smtp-Source: AGHT+IGzDIEpUxydzHRjypRSAxJj3nt4qh5Z5VHhh07APhW85LKtlspdKIerOdWzYvhVVp/mhxw6eg==
X-Received: by 2002:adf:e2ce:0:b0:339:2db3:f4e9 with SMTP id d14-20020adfe2ce000000b003392db3f4e9mr770103wrj.32.1706114712445;
        Wed, 24 Jan 2024 08:45:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d5909000000b0033936c34713sm8137883wrd.78.2024.01.24.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 08:45:12 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: qcom: sm8550-mtp: add correct analogue microphones
Date: Wed, 24 Jan 2024 17:45:05 +0100
Message-Id: <20240124164505.293202-4-krzysztof.kozlowski@linaro.org>
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

This should bring AMIC1, AMIC2 (headphones), AMIC3, AMIC4 and AMIC5
onboard microphones to work, although was not tested on the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 393702fe61aa..0c94edb8b824 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -105,14 +105,21 @@ sound {
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


