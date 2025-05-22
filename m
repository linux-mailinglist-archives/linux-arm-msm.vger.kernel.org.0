Return-Path: <linux-arm-msm+bounces-59078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916CAC125E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76CD13B8434
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D73328D8C6;
	Thu, 22 May 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrAwFJTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AD19E966
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935662; cv=none; b=I1cRBNQZQcdBug1xHnzGHx25LAaDHq4liCvwh7gMiqxK0lCCUDWOZpm35SOi2L29QhDY+0FI/ZFs83lZtegpqpr5fwe5OQSavE1pPc5RFP4kygADGITYN/KWK1TKKwSGO8qAlnHVF9wdzc6wIdSW+7DQGl6yG4PfIU76AT0Q/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935662; c=relaxed/simple;
	bh=aSSdjHrrQmluhjdKxBq1rycaxTM3YZu9EjkuFLbPokc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vF1vBEysBTp4N8DaP0xfsFuMQsrku828xUf9cO8KVRnpT5ivu4EN6cX3DNgmSdFnUJMW0Qw3268eUOiMKEcAnkIyx7S0FtOo5RL/U1cn+ha/jDvIXeTyyQ5sm/hCftNpBqUU/BOk2kbRg9S4UKlGEp3D0qX/ZPWHbszqy7NUUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrAwFJTM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso58421925e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935658; x=1748540458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=RrAwFJTMQLocOma6E9sQmzbbIAxNgpCghY4qbNMVZz9kuabuOKd/c90NApiTYIArgx
         +kr01kzZMFtydwrFVsn9gdp037xDLrJ++0CA+rX10bHRpPPkcf+sBH+fRQr+axOSWOra
         S4BP/ydc94WSRqVXtjPtFlWY7f11EN1y2Ot3Ifehl0vD+qkj+3jwXj7j8BxqEPhfgi6S
         gM14EDdgb8pvwYEYsNciqtcIwvKuRpL2KWuxYP7JgQ3pOKTFCsuHtxY/NuxJKtlaYy+C
         /s89KhRxFu2HvtAperhHs38z/AuJ4qp/KgzgJ8V78102pCSCmMOBnu6NL6mc+skprQfV
         kxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935658; x=1748540458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=Cz3uf3hQ7sp3hCsyKUZ64nYlIs0GdR0aDL/kI7Nj8Qb1iwQGfMSzgbX9BiptA0L0Nv
         EXNANUWFpD5Y12dmrvH+gcBi7VJRxV1NuqQwae16d9Ykh9dI9vizUS+yr4ZOnUZLAT9a
         rDdF3N7F4y47A06vjyrj7o/G0e8elMLEI/QlPLdLZ0R50CtLRpX4OhCSMsN/t9aBlHQm
         96+O0wglVewfyxc6jJcGRa4KCVEx5XQt6m6n95/RbjtAKTj7LiIQDKMJcRWvcVzjcvLx
         j8LH/a3x10wyMJ6bwr8+zASLx3+wk9lfiwXE19PzRXbcUJ9JzRTjeK1i0DqBTXAJ/V/P
         VXEA==
X-Forwarded-Encrypted: i=1; AJvYcCVZpnpim8qqLtgDEvbiieGz9KT2a3Pg6bUQjjIqfLIr+SuzL8iq7wfZGyM3MeQiCje2E/v3hhh77KcgfA4R@vger.kernel.org
X-Gm-Message-State: AOJu0YzYh1O1LRUW3pT5y28RSOltURln4mNGyYxatnwbxsGptULoL4ai
	NOqTfYX5QNWQgdkLRg/wU18R85cTtkvpjnxhG5Z1T1lNyPk9+rwtJM+0cTUFWyUMyv4=
X-Gm-Gg: ASbGnctbnyfkwg9bZ9JHpkpxz+mOJXoNbqC6L5MJVaZ8UwFqBXDiAEut2SsmDiCbVSS
	UYGr+u+5FFcrN38kMXZSwjKOuMhCAgwrfLUenjmaDZDLi/ZCNPk/wK5sSIzNQOa6/dpaSDe31MR
	F/vXDYSNtckv7+SZQCBNkIhox7cuxJoq9k2hcY04mHiJYLl99aZxomIfbbAQDBfTkuRgiLLnlwb
	TlczQyYLXIMT3i9tHfCxfUoXczJOXq6CrxdY4ObeaI0B1UgN37sOiJTqI69CTBgzka98dmW8MN3
	HA1NS4+nHNvIHgW2r1Z6T5GbG1vh9YnJa8GiyJsJM0WTJSPvDjPIgCAqprM=
X-Google-Smtp-Source: AGHT+IEQ6/iKMVU24aJMoLqOXxLbhZL7C0KXFrDMArF8ok4GGZf8FXJBiXkIhzqyqj4QCOms+GXpzA==
X-Received: by 2002:a05:600c:5305:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-442fd62733amr247120525e9.11.1747935658292;
        Thu, 22 May 2025 10:40:58 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:57 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:54 +0100
Subject: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

Add rxmacro compatible for sm6115.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1dfef46cdf0ecf3b8c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,

-- 
2.47.2


