Return-Path: <linux-arm-msm+bounces-76097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D403BBEFC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 20:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B799E4EC463
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 18:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C832DCBEB;
	Mon,  6 Oct 2025 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SyXEZ1ST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC4246766
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775850; cv=none; b=Lfk/mMk8T/7DanuLlFC1bJ291buDaXA40JJa6SbgK9aST2nyqP8yLyEJrFbXX70EH3XHXFZjaNoR4tkGscrpFOtfkFVLv3yjO79lxXsupMri4Pn+LPj4rMm0k6szUNu4ZCOpXJKdmz+115qYh/ywxmoCBFQd/jSo99LnZBvGa/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775850; c=relaxed/simple;
	bh=Qp6v0O2Q8NFftpiMvFMR7p+AevcyccZ4xtCUgR9Y2kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uicphtDSdKhwDk4WcJ7xvbEmYi/odWvpb9187110mmcb33DpGYYvGW5QMvgZ2d6c+/z815vrei8XR29g0VqDdCesJhUmtAf+dGK5srwKBQYvFd3GRflf8ciVcUU6HgxLDZFlRF4GqEW8dLM2/aMg0ZwEJWqcYZ7RswdkVvZqMIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SyXEZ1ST; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso39113005e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775847; x=1760380647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeyoAqoTx6ztjUQYYrMEzGjhHggPr9sSrZX7sEZuQ9g=;
        b=SyXEZ1STqfKfUK7rk4aBKezW1ZGySK3zKZQTl0XWrjUcw+lbaoa1UREwhr4QJ1pgkm
         15jq8+4WT5EbsTYUVwSgeUHjkPFi22lWhpYvSVALL6jx/XCGmI1EPscPctIp6O65Bl0P
         fobTmtx6Bmawu95UUo4kp2LVdIFi+5BD6EecevfPA1auIiYGjwrso4g3Us5A+O1J5szH
         B6ehgMjQtaBefX3MftPL2xg5JEi91nnnT6l2Ji+ZN43Wsrm5Q+m5TUhqs44Vf6opid1t
         nhhpzzmZ5JMT/dcglQwUbqWIT/y+VUPDrvZdjyqewQcXMFvAFKc6MLQD3WsrnHRgBYy4
         4FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775847; x=1760380647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeyoAqoTx6ztjUQYYrMEzGjhHggPr9sSrZX7sEZuQ9g=;
        b=MF6TsIWcFIxXJwNSs0Xiik6RZmH7sKeBCFInOnq2uNm29avZ8MM3eZOjQCPnG2RQRj
         jY50q16CZv87UYhEeGDj/zDdv/HSCZX5k2heqd+pK/e4hC4QRJdrSvn7a5fjogSYfeyc
         i3lXw+QJ6qXhGLsROCXov0MbRCjqWmjIGPZ8AVM+dxZLZZzkbNFs7rF5zMtbbfJAuE76
         DjZwPgqB0Uy14nj4tv+Jo5aQUTqzyQPFG5uoZHuTWDHpbmVYQXcgU7mFJaJggkI3jERx
         MGhCCDTAYo12ivypwl+Eek09egeNW7TwFmzyHb8PAmqdNF9AUghfhgm8VPfw4rKjqm0c
         wHQg==
X-Forwarded-Encrypted: i=1; AJvYcCWNi6MDNvcE7JaNwLjBz3v99qUi2Mj4Q1RzFeZXGlIf3I/r07tsguCgopPRD2TnjzXnWIriaEcjPe1EI8zt@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2KS4XjeW+QeDO0JHA5MSv/ho8s5HHVY19rfGhNq66eFlsSW+
	G/V2N0LqoJJRbuSd0iza9S8/JX2RPZRh/ad4imJMGzRY1jkEIWxw5YiU/ApdBgKqJbc=
X-Gm-Gg: ASbGncug1BmXjquI+9lkeYvYFHoAmTmcbwbh+UHDchieF3Q9bTCEc9E11Z02TPNiLzZ
	pzfocg/5W6WKlQLVV1zXlXq/IyLudt0qU/5QH+GmcEQWoWMF323E1hIfIzX+CXqYLwC4yJ9Aun4
	1arz6oZ0T+xEH+CEUhH9lEfB9mlIx6NKfBLzAcqBKuQnnG0Sdx3SE3fIAhpc9ZghHamB8HQZg9F
	Ov7ambGSOF7jr0NtSomhStYjEfUWuGtElvrg5vUJW2sTXELF2ym01OPM/9i+PMmXtzru+HsbEhY
	3Yl/Zysna2b1hxtCnXUkAiUkM44UmkAbUePcK1+fVIxARbYdmJIN9O7ReMhPsor4UUCf+qc9+ue
	ZKQbRYecHKe8XkjVTZ0eS6CMeyuFdRa6X5DFh6o/tVsFPDaxQaRurdmhltgz8J/KS1FHTMVg=
X-Google-Smtp-Source: AGHT+IG4RjGlyCXEOm9wkWq+m//UME7kOlLBh/A4mZhgPhBTK6yQf14gjTtn9AlP3bNLoZkdPbHqLQ==
X-Received: by 2002:a05:600c:3d90:b0:46e:4921:9443 with SMTP id 5b1f17b1804b1-46e711524f1mr87726135e9.37.1759775846628;
        Mon, 06 Oct 2025 11:37:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 20:37:14 +0200
Subject: [PATCH RFC 1/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-1-184b15a87e0a@linaro.org>
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Qp6v0O2Q8NFftpiMvFMR7p+AevcyccZ4xtCUgR9Y2kY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5AxiRs4sfyET/B67e9Rj5CXeJXryqCiSfd8bdQs0
 WN6OJ8SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMYgAKCRB33NvayMhJ0RIKD/
 9KUTyO+q+qcvQ4cjdDHHBlsMRcXeZ3d0+fIL9V8qFErG/76eVNE2SKT5Y6D+4KsUPVfG3VKL5XB54d
 k9UUcjVkWdhZB0oKv1ZlLPBCyTT4lKvszJo7euyxownqj6C+vyFKqpsb/1b0eameAkVuT7+eGn6RRN
 V/ZB70KC0H+eE4aSQ5WovizsuljsboedvnPuKFiDj93hdKsyWX7/1PoC8Llp8X2Cd1hWLfXPOVk/RC
 ySrbaWyJ/EguCbBfovQc8PsLbepW+YwTLAjZ1XzwPQeLKuVxPfSIKvrBtxfP3o1Yrn5hQ0V6c6CTEG
 grwhO19vABtvH2nnRS/w2QPiBVRKnM/ViUFD6jZR01/sWknYiGZhBvQCyeBqoBXH1j7yafqk5uU0jl
 SWNrGSZMj+VXySiKk84MuNsIfyb8B/YdEAp5aHR9CIv2150jsjLHc2eSzh3EolRvclKfVsiNPQiOT/
 NZKJVwPKR39CJtx2bnxlOvaPa9fTox5u6JRoWmseA9FM9BZfH4lU5sie3bjNhf1oG8Gu1JHmQYKWrC
 NE6wSu0ddPRN65o+gz1CWbnRBx9jkj05uedHligeT3BB/3KvicULZrC1Ce4bwOmIF2FZ8zwbw3+Ub7
 B0ed/qO87zBohiPXzhreqv3SQZZsYUqNM1Ag5AWNjwl58SnPItNcr9GaSNBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing MCLK ids for the q6prm DSP interface.

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
index a988a32086fe105e32c4fd713b8e0a3d17b83bca..7a3f2ad7bbd465a6950568af1ff3839e5cbe4f62 100644
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
+#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305
+
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
 #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
 

-- 
2.34.1


