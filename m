Return-Path: <linux-arm-msm+bounces-64168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67362AFE575
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B185C3A8D76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E1A28AB03;
	Wed,  9 Jul 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLSFuKtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEB28BAB0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055798; cv=none; b=drAjEAZjCbp/3ehkVz2zdSyYGvTtsQmMOd7jdKfpqsoFvNrHSReuOQlXdvCGf7r78SZqwBeY8lKX2LvGM0isobBu/9LMtXZ9rdgvf4AQSsXoiTdJEViTRgfUCFa08TQsW3Flepxc+Kt5iqpem0O2lMBZ7RM1gc78RLgviUQGz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055798; c=relaxed/simple;
	bh=LxMkKb5hgW8cAQlNkcmWm9X1PpNrjirxZmIseahJ6W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRA6IRy/QvrEGuiZh3xm54h/Xp+EI72bzHnwI7C86yZ/nTPSs4lqlqu9skbmUBclkW1//7iwLmrwvTarWPs0uHY2LcyR6Iwd+R7AQWVE6X/VQ+G5xU/ywhozALc4Pt/jkUUQGBzeCoy2XD7fuOaRH2sRW8iR4lue4w4WTZhSSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLSFuKtk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d6ade159so47451355e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055794; x=1752660594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbOIQ7E1kZS/+21cXjdFZh+OYTVjRBSsv4Y2mT/dCkc=;
        b=WLSFuKtkvYKZmcz/iM1CeBnBF9vOR7Rq6MWwTZAqd2CJ9Uk9DWv2zZj6Hj90sOEeHw
         wn4rnSSPDCWMVyLf66v7GQUnwIxdnG6QXHYqhTzAsl7EhEiGKnNB1KL7yCs0jEcbfmE4
         xkEsAXi37B7OAJmBaZjCMI+dQLfQVIf0Qu2yRX/Jhgu9s7+ucZ3VnQEuE3+y5uWdJyW6
         fKgFX6GiX3KBAQtWZzW6fSJmhDNLDpqQwnefYFbBPG9qjmsWPX+OWvD4ggF25TC81cPM
         au4rG597SwGFLsxS/6ARY+yc0i4xnn/0fcPaOMX+3udJqoSa+h0NJrccnMvQdd+C+M6b
         5+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055794; x=1752660594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbOIQ7E1kZS/+21cXjdFZh+OYTVjRBSsv4Y2mT/dCkc=;
        b=JVyvFAcIhNXJq55RTcu/H94v8X4xa2ejJweCFr201X4z/kzDfDMpVbNcxfuudUgxQ4
         Q1oQH7nROwGeEuVx1jF6uVlmfMIb4MyI/azoi38z5Ttk4XGhYwGYehhYHgR2DDA/n5dh
         7GujXgPTzMLazV9eK7UMbXClxzqigAVeMgBAjO6B83cRNJ5/HaJtzSiI3EG1Ym41Pz6D
         lxyEBU/ccgTShoL1VlRJdX2vLCrK8YJnTMCkFQMpuLfyBHAeglNWrNvEH1j6Rb+WZldT
         1zVIZp5r/6LL9ICnidm0QeGtK0RolDGjm0XmSkR9Hu73rmkUifJ/pNSn+J41KuwQemOf
         Ipfw==
X-Forwarded-Encrypted: i=1; AJvYcCUTZfvDzr8IVbbWbuYOE8CHZngHycRFWbRBs3PK65dvowDAWCWYmFw8glSpi7omWoqq0uJ6h7uF3q4OG66P@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+c7XuRkGpQ3g8w5NMnkf87xEQk2NkOmVtyxxUiTmTuACRr8o
	wTwbwxhSUrkKoyIOxnzd+UhHXPQASPxGnR/msN3TV8HxM97kj3A9plaVGF66zMolENU=
X-Gm-Gg: ASbGncutTJ3rrWB+9UihoaVrqlpQmrn+Ut0h19iWNw//zW5Ta1Q5wD2Mg8y7UF/CT9a
	YhCLaGx/o4Svq/QlCTOFYb0r9PQU3w5QRODFX/c+SvdQXtmvHsC8/E75TEpwo5f2UTlTHdkqgYh
	UVAZtEmgfyTnP9pXjD/0KX6Yve/PN6ulMv58F74YQprJ2TKHLcbSLToGTKHCZl+cE02bc1jcZ8G
	D2DM6EajweSapSwHpeOjlszzAq3RVJkH8DWOYD42cqyXhSK4Tf8CHEpcc/BB5BHJze9q+ahWvFX
	P+XxabQlg7l6GTP/degLdSi75uqSCut5y11k6T7ly6JqDiAA7LqXdZ36O/ymB1N3oPjJ0iI+qW9
	tPg==
X-Google-Smtp-Source: AGHT+IGJCRy2yXBuJPF8rLO5PJrDnfPVSKiuDW0McfOpT3Cn3c63cry4nGGcVEDSDD3axp6iyvUJiQ==
X-Received: by 2002:a05:600c:a305:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-454d532eeecmr13729955e9.2.1752055793564;
        Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:56 +0200
Subject: [PATCH v2 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-4-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -482,4 +482,6 @@
 #define GCC_USB_1_PHY_BCR					85
 #define GCC_USB_2_PHY_BCR					86
 #define GCC_VIDEO_BCR						87
+#define GCC_VIDEO_AXI0_CLK_ARES					88
+#define GCC_VIDEO_AXI1_CLK_ARES					89
 #endif

-- 
2.49.0


