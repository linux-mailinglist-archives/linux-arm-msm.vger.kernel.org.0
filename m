Return-Path: <linux-arm-msm+bounces-40134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7CA9E29C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E24C160612
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE141FDE01;
	Tue,  3 Dec 2024 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0weV0Y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65241FBCA1
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247862; cv=none; b=uRiCsu1g7deM3RCBe/IepuBkZ6kHVAc0BZ4iMXOSOwu2LJ39RD+rTpTS9gHbsK4lrREcClevUBWFay3dgPDkmlzAVjkvw6+/fVrfe+ynhVpjJh6oYm1b5L08S9t+kT4RXVdBSQael9jkgr8O9Ln9qZ9wfKHLl2zpqvJ3oehawYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247862; c=relaxed/simple;
	bh=/p05xSypzO/4OeH+2vX+nGZmcBYlJ2JK65edxSL5uQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAKuhp5LtIk/vvwOWGT4Oqny0Es0yFbfU1Z854pXFHLhznRctMGwd1AhBGEk+kw+mv2tG8sRhdyo2HVim7stOIxxTWMyPdfXMpjvU1D1EzW9gO9Jdjtt4Vou+mVRy5e+vyKCBnsDlezMi9+e7Uneb9EesieOcI5ndLAG4X5gi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0weV0Y6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349fb56260so51222115e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733247859; x=1733852659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20enjGFbIMY6ySoTLbqeBiSJRGb2uQMuia/Z5TqK/Vk=;
        b=U0weV0Y6Dd76An6ast9Ib9o0DP3SetY+zXv/J9FiR0Y0buNdXZeA3obQK33TpDxKVa
         JDQWmg2W1IXCvBNJfT2yFAd+HNF97H6Av9MBOX/r13dvXLovztEjkENQ7tmCGf8SuzCX
         LZDCWu+0V2LDFj7ZSmmlmAVbTvbpbad5LWWTRerrGTRTvWJ/P9WMBFOkYsObqmTPO5rY
         p3nU0S5fIumsKDAGRUhOw+hs3TmNdhr9dyfTUKwVFiUBGPjxb4m72NDRaxpapNfTaOSw
         Jhtov0VB/5mKZVUBuHUIHyG/FM52cLla8FMtmV3jo7J8h7lfBWqEZmPQZCQXVSGD4etN
         9gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247859; x=1733852659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20enjGFbIMY6ySoTLbqeBiSJRGb2uQMuia/Z5TqK/Vk=;
        b=Q2hxm3EbADfkHID0rUifMOiZXm93pN0e7oLvkPgT8AWsW0Nilh26cjfmAR8sggfZSu
         qnKHpX4ByQPWlM/2If1WxeQmK0z6i1mVQYcHAXva46CcHpe4j5qcPXmBEowos6tJ2Y8s
         a7YQjqFin1lGtzKuyg0bnWFU4VGkzI42mv8lOk54t8XAp+C0OG4Kyhm/OfG9wVRAZBll
         H4ekdsHRDJ9NaD7a6vxMZYSZcfnbVkSOEmcyEhZSan2L/Lse0xElnNdmG5wKj7/KQB5L
         uQWtJ76jvtky9ikA4U37Z6aEtau7LgoK0aLWl16jwFy2Y+ymHIv7/FTDIDWFibJhKmEj
         TQAw==
X-Forwarded-Encrypted: i=1; AJvYcCXX07vz1JrjhycuYVy1pSMeDtZcRCu88NF9gC/ifi8/SqK1JYyNkYAcg9pTrx9XuxJFj5/14WPqG0QqumQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOBCnbmL/LO+odixH5WbM6FJLds2wWsOKRhI2+zGCJfRzgjz+
	uMUQDTw+ve7rBF3gbviT6Sw+BprGK5lhH29Cekm1WP2fEKsmPseDT89/PYdeV7M=
X-Gm-Gg: ASbGnct+qcUzIqwgUWiIdWakyp2dmkOKFl4EdxZLhC0VbQB+gCU3lVPZrdhI98SuHLd
	MQkH73YZqvVYbAhJ5kI7diO4+FH1M+UrJvFUC4a7zqOpEzpadbtrixt1SGTlpAEb/dmY0sqjn4i
	pvf9gVjk1O71cGJLvjaqoT1VgCoA8i20wGwdJ0/R7n8Q/8+xkYIzIYsvGOidLnE2NqZ++hayOvK
	4AG+RHPHslcAhgv+V8Ajk1G2eP1kZ2pRDXYvXTV3kgVaQnVPF0JtVdRr3obtOs=
X-Google-Smtp-Source: AGHT+IHWm+MdE4pGT7/SWD+IygidPPYvtwFY2rLG6XMxPlA0erOfEDLVdpRRoXo4nK9V4WvRYNyvTQ==
X-Received: by 2002:a05:600c:524d:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434d09ce368mr32037235e9.16.1733247858857;
        Tue, 03 Dec 2024 09:44:18 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:9f9f:834f:9008:1528])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d05b4909sm17648055e9.2.2024.12.03.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:44:18 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 03 Dec 2024 18:44:02 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC
 supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-x1e80100-va-mic-bias-v1-1-0dfd4d9b492c@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
In-Reply-To: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The WCD938x codec provides two controls for each of the MIC_BIASn outputs:

 - "MIC BIASn" enables an internal regulator to generate the output
   with a configurable voltage (qcom,micbiasN-microvolt).

 - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
   regulator and directly outputs fixed 1.8V from the VDD_PX pin.
   This is intended for low-power VA (voice activation) use cases.

The audio-routing setup for the ThinkPad X13s currently specifies both
as power supplies for the DMICs, but only one of them can be active
at the same time. In practice, only the internal regulator is used
with the current setup because the driver prefers it over pull-up mode.

Make this more clear by dropping the redundant routes to the pull-up
"VA MIC BIASn" supply. There is no functional difference except that we
skip briefly switching to pull-up mode when shutting down the microphone.

Fixes: 2e498f35c385 ("arm64: dts: qcom: sc8280xp-x13s: fix va dmic dai links and routing")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f3190f408f4b2c7ca9fe368d652d5d66bb3949af..0f1ebd869ce315bfed2c17ae90b2451b3892b96b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1202,9 +1202,6 @@ &sound {
 		"VA DMIC0", "MIC BIAS1",
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
-		"VA DMIC0", "VA MIC BIAS1",
-		"VA DMIC1", "VA MIC BIAS1",
-		"VA DMIC2", "VA MIC BIAS3",
 		"TX SWR_ADC1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {

-- 
2.47.0


