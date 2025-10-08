Return-Path: <linux-arm-msm+bounces-76484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1CBC65EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6DDCD34F936
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B682C11F1;
	Wed,  8 Oct 2025 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGBvR0TW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF727B50F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949818; cv=none; b=pBlTFS5XtMcLin5MvxJ1vaX4UIFyBwOUY8G4+4hc3j70GYve4r35pP65EaI8aqspg/RJ+ixgqDBDFS9Ub6+bJa+YjPPTiIH+lUMZaQW5mPz/Aj8gRdod2N83nDHnteWIIav85qvV+lEJ8+ocr/AXNQ4A+ly3wgbpyB2x7txJJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949818; c=relaxed/simple;
	bh=o2AYik/e+vN8VxsPgeAxxUqzsELYjKj/XmU41yiPdgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ET9iNXQDSE1H7jAChXjIdT/4jifN2EwPb+D77kcrNNf6hDlFFpku1NeDv7fDWDJ8DtOpa9viZtzl8+0UO8XclHsDZZUg7DCpuBsi9n+4DbTqWnbCZOSmaLbtaChbcGg1OMv66gUCVmA0NNG750NvO++UN/GV1xH3yMf8wBNWWPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGBvR0TW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso225041f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949815; x=1760554615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrhdDIRe1o3+P/UYLupG9vR2K+U9ntmMSAXW1Y8SyYA=;
        b=GGBvR0TWZ9l/q+mKkzHEaGooP5OTW69al6DF/zF6F8ytFD5RuZeiSQnshwMTlYEqpl
         sDpSf+kHeiIUH/2lq+lViBOsEbRBw7Y/QC2y4d1ftv5OBDnhQ5AiyqLzYb+RoLNPgv0q
         Cv5gJy0Xd8qvI1EtjQ182I88XJbDjVTWDv1+P6hJJodEyqIDyfHG6AuEq6CEPtBNTgUQ
         PW+6kWAa4z3jCqJczxkrU5sLJ936uRNIHMeGzOf/0eqJ5Agt93xlMxmMZcfOLCEuTLYe
         Wd6COZQApkBo2Uwk+r6ifJXEz97bsfbAOqkwOfSz1AJRv1k/O1O5FkPHu9pC2Bz3xo3A
         x9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949815; x=1760554615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrhdDIRe1o3+P/UYLupG9vR2K+U9ntmMSAXW1Y8SyYA=;
        b=SDK0mY+RmGbaDaCNbvYKZNG+TwoYklUEQJv4jsnP4PfkV3oiVxpZY+mpMQcymVulFO
         Ft5KGKTJKmbZFgncVWC+sgrdF50Tt+KRESgAmocm2HyDHCY+lUcb3VmQ+AbH+vWzvvaM
         5nsp4JA04sga58btbOkx41RHRn5Q1DiHrTndxz+Y4iAYPuqfKbW+frBF9k6d3DPYWuoL
         5MbGRN93fx5/0HzGRYEqYyw9esQAsnipyqJe9J58wDVkfSW6k+3toG+DZ3AM3ivNrBFs
         GfS+RVaSa78pO06p46zK0Q8fw0vxpZjLByNdKNjU+FbKPHHFnvtT2zpBFrE7ydwpqb0W
         B68A==
X-Forwarded-Encrypted: i=1; AJvYcCUMgN6WyELsZu3sY/hte2jmQJTwGsvqPE6XU6wXATPQvrG1iYZBb0vxl0v23bGtUlta5OrTZz7si6A6oVRp@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIMZTFrTyFGJWH+r2aSZDxwU+HWtIg1HzE1Lzn+Cb9MAt1TX8
	pzRrh0GgqxUdXnh64HNijlDekROOVLRylIfU8aAAW760oeCgneOO1YOQ4/miQemd15y+g8v0Z3R
	lbSkx
X-Gm-Gg: ASbGnctxmWLYCUYyMNPVx2mYSwRLmsdUwWVZZ7XK4FfZVjoNuGWyWA21joWnDsDnXNt
	mfLRBpOxtz7B+IlR77z31bCgrj/yAxlZxQ+1Prv+w+PxPD8c6Dj9Hjp7BKVdUThz1MG2TBROHkf
	4owUEj0RLbYHDeOcA/RBf91ai84BKjeUykaU4iZx3Ub3rUBTIPRKhFztp4ceT6PI7c+ZdYy4qwG
	htgRwDa844ZuhZq55Ry0T2ldv1tl8Xwlxn2IzlyCHXLZ6FaRQzjkZ/vbs09/HsSiWj+P8qrKAvC
	PJFVDQK3JqKlJJjKYKhWEMUmwLKSMP7GlisL6fZqRID0Jo7y0A5BGVcrZofdcrv4fDlQnQHt41R
	EWlPADJitJjEE0JKu61m3fKbVk2AEdBx3gVAM7JmNVCHXJFa8vgv2kNGeQZP8ESb+opB5UUw=
X-Google-Smtp-Source: AGHT+IFhL1ZEQ2bwNk3n6zQQaVBtT46suLjh6nupdx+hhvcnLWv911nqilsond0J7QD6wWtn4NSpWg==
X-Received: by 2002:a05:6000:2891:b0:403:8633:b7e3 with SMTP id ffacd0b85a97d-4266e7d461emr3174953f8f.30.1759949815020;
        Wed, 08 Oct 2025 11:56:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Oct 2025 20:56:48 +0200
Subject: [PATCH RFC v2 1/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o2AYik/e+vN8VxsPgeAxxUqzsELYjKj/XmU41yiPdgk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rPywIdUbOeRJo0FaMm38BDXdkqhYAvW2P3VgCLJ
 zMdx2CCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz8gAKCRB33NvayMhJ0ZTtEA
 CEZknn++6zBfvHda0Mpz9u9YIBluXbjueZX6XarIzYOBvl52JxlMfTv5nfYGQLc8l+h8LFybExrO6Z
 gcegfFv025V7jepDLrtOL9yt7pQMgHp4ZhsbAch3P7LuMnkd4cbC4lGH1dQhiAIrHfYZdF/590JEM3
 Sqt5Xhtc15wd8VtCx5BJVBXKeZCddhh+zW2vWYwhDmnP/C2MeYUnb85C4u85aiGyTRVW8UdVjj1RJa
 KOIZlAFzj/va0ZDWSxWI4EyWz/Umn5uAYY6nQ8rSOCyM3KXW2VJzRv+ylaXICDdrRzR9k7XRpY8E//
 ErauRF9mXX5N1ON+HdySo/qIHAdj7ii8r4bFHXw5gROHVBAsX6ZgM/xFYjhEDbyY+fC7cms8ociXOK
 ZMB1c8F+DeFOFqrxZ611k03fIzCQrJQzFDPyOW9JIzeM6ZwSOzXufd+fwPFU6Mc+wzCT1aEEuFWUh/
 r0PfsNPxBMNjC3QY9JH/Ye6dnpXcZcwSWpwqVRlH0Z/l/yu60NUXQhftm7qMHOo5lCwXE5OiQYeIvv
 G8+LD/2fp38DT/rx10ukwaZeGmRMeII8rbJKs1ICyunVpd3RgkKFR5wvYxr9KJwxhkxaPuoUHGM+jM
 CZr8dqgNm6n9naoYZkppFR5GzM8HNSTc8uhumNeFCLPh42uzsWii64tTIp+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing MCLK ids for the q6prm DSP interface.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
 sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab0040bc39ae16ec324b41dfc152b408..51b131fa95316cff50342ff60bfc9e3608939d6c 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
 	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a32086fe105e32c4fd713b8e0a3d17b83bca..6917e70bcb8a5f3a6bc0ce3ace2fbf42725a3133 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -52,6 +52,17 @@
 /* Clock ID for QUINARY MI2S OSR CLK  */
 #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
 
+/* Clock ID for MCLK1 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
+/* Clock ID for MCLK2 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
+/* Clock ID for MCLK3 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
+/* Clock ID for MCLK4 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
+/* Clock ID for MCLK5 */
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 

-- 
2.34.1


