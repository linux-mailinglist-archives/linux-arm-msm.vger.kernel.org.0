Return-Path: <linux-arm-msm+bounces-64165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97418AFE553
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7F01C45869
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C1F28AAFC;
	Wed,  9 Jul 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuGiAtFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02B28B3FA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055794; cv=none; b=IW3NswL3ndLXZu+GZV9X8Y+afu41GAmW/GlVuItoC/8OjT6tYMNLVXGt6Nz5kXTUYLxbaQ/he8Cq1EVqsVYpriLbbk3hd8D5Dk8dqeeEKRLRnZL+xmeBN+rnL8eHyCC59mLjA/C83HDWOp9LmGNyfjMoOgBn46XnRCzesHmB7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055794; c=relaxed/simple;
	bh=famRRvFrFYpSXcgLA4nbJLP0BYRXxaou57j/60RhaTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQvLlF34EVbp1/5pkgaeRVKH6LimFFAv0lnSMepN/3dQ8wJWc9ZRknHsSot/DXYHSI6zkZ2NLEiFvPyfNJCjl87P8tQ9i/ggVOZqNeNLgma7rvpDezH0MjzW4l8fH5q3N3XHqhfklKEb03QfaJxMAer5wn0O0uVG3CM3iOU/zkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuGiAtFx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45348bff79fso57353055e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055790; x=1752660590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMidPiz8WPRxgxTAsiQCyYCTxHgFambXMuO+HJdSTnU=;
        b=RuGiAtFxfe7V8SltGasThXEfB805tdDLOGRKSa8tRGZnt51aW8CAAIS5OSaexbmCfH
         kQR1Rq5AlylCmwtUa4FZ5FHjIBRtPOHZ2FvQOczz5r3Ki4AS7HnjWkwjdsjJ2KtKr7Mh
         d/10rnAn/j0G6sShLvQ3NTXVExhy0iwzpyB1My9ahCEGYvqaocFs4gytRSnLTt7Tj3gP
         38IEh7WLBKFLUU806CggYKFY+I0h+tMOf+FK+iUTVphygOExP4dw/5ifKVdkWcL78jO9
         yj/XN8lCD1cJuDF4qX1VE9WapJQQI/cYi3QNAAvqsNGWX+68RE/OeXxLnpgxig90+uRy
         knvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055790; x=1752660590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMidPiz8WPRxgxTAsiQCyYCTxHgFambXMuO+HJdSTnU=;
        b=Fgc10shSqfA1Dsp/3PcQJS9YlanglTN9tTdzZoZ6yzXdd6ZrPWPjA8VNNipJVzRn3s
         xKSXYUzTEl435ZzKdyjAX2hqg7VTL0Y+hO7QNhrMQsgKMJBjqyfUEc/MriUMPFPdfUj0
         guaV3iFI8mqYgqxHKs5aHz/MM2mpJJxyq5+UwI+RxA+RqVN4VSs9V/zqrncaXjXMSCck
         hukkD2ZkLDGw0uXUljEIIhc2sWU5P43oILjbx8tGiD/HDgNZRLYUeXlmv6zsIzGK9TZx
         AWK0JehIE/kB97BYLEgNU6cU2K9BvXFa/4ovZOPyut47GfJntF2bRwV6AgWVPcGSRCdu
         4MnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1kHBDAgLpLr+v1vhksEPRLfU5NxREl3bda924pvel9GaQplXWGJfJ0GnbL1gVTdmK8CR1D57PTiQS9st4@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZp0Ww59CAk+sQZq5tPe7CgWwl+6rQmxLTyNxyR2vdiUKLoPA
	OXvDSSG9cfaojIs93+IpBi/XMQhvnKIVwaRT6XmqDuYK86Zwn+fLGP/w+GG7J9hANlU=
X-Gm-Gg: ASbGncvMuld4J9mIrs7mOBc1vxBgab9o0dWnLBoYOEfgXehfjx84t9D4zkaBmHUgluf
	WdYuFCQdhzMp7JHnvUy3kKzZuOkVKkAOTDTCxoNRF/YJIohXUAGhK/isMbbQPNATQJVe4YHyWVn
	1Br9jDzf5Q/krF3fLyzm88KMh9lYTK4kABjXa5lwKdNm1WSBM2WGEvXhRq5+4P86CFyBYbRCRLV
	db/pBrtoxkYuQN6Zrj3Uox5b5owNvtYBsC4VICXGG0bYd/SACxkeUdlokhaMRT1NnMiIEZlkUap
	u8Jj9ok7FOwAUu28OXdKTuutHVXp3emp88h/QlJGUiLQBP58HBtBhOYCLyDnSTkN6uXQaisTjmf
	etg==
X-Google-Smtp-Source: AGHT+IEQkukkYSsMmMa7GE5Hjh/cy4YGqwOjr0P/jFLkEO6jYv+Hgr+mzq9RXN3BH/cGiA3SEVfLcQ==
X-Received: by 2002:a05:600c:4fcf:b0:454:ad94:4b3d with SMTP id 5b1f17b1804b1-454d5310e5fmr15844895e9.1.1752055790451;
        Wed, 09 Jul 2025 03:09:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:53 +0200
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-1-ad1acf5674b4@linaro.org>
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

X1E80100 videocc is largely identical to SM8550, but needs slightly
different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
to the existing schema used for SM8550.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,x1e80100-videocc
 
   clocks:
     items:

-- 
2.49.0


