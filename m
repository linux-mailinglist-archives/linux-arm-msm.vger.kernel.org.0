Return-Path: <linux-arm-msm+bounces-6113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B548A8202EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 01:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739892835D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 00:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C85723AE;
	Sat, 30 Dec 2023 00:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDDcCvWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A9A5B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d60ad5f0bso27285495e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 16:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894709; x=1704499509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DylJjoN2AOQJa9PDb6h9+DyUFHVNz6qyFwVRj7sTsTU=;
        b=sDDcCvWASHGgNoPAz6+5JKJ99/7dQLngOY/fTpvmI1xuTwhpkj8q9Hgenyo9Tnz8RY
         UxEmZPyeTyNCwqHzoi0gjZjDa9bceUsoddNEWUi0wHx5B/McdJN83IB6wFAxVTnG5mSm
         SPcqea4QRG9o5ykIDdgtpXYYNNSeHN4wiZ2cNf8mcEiaw0rhW15fzq47fz5Sp9s2+PKt
         RuxWZDOKuCsuzJ7h8+fqHmBb1goLv4o/CkiHRzqPZ3FlQMyoKDy+J9SUkS+psy6EJYSQ
         Tt0lGWGs3Zs4eDV3zSlrZK9RBwvkMYnh5CDtZ0NfuziAEvaCAyPGrKln/g7Y/mavKUFb
         Cifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894709; x=1704499509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DylJjoN2AOQJa9PDb6h9+DyUFHVNz6qyFwVRj7sTsTU=;
        b=Bd2/VAszDvZ2qUoVjTtEJX8YRsSM7bIufUCBCdF8wImXjbtJgYUse7gtG4cF+Qpf+A
         QAufnstMVsiYTbKI1FzU+F/SmyYSLP8B6/zNzwORMIknxVsPtgh+uJX99c7qu5UbI5F6
         ppJqXlm4rxX3kYnkRWyUa9adzK2kEK8pPReaPpLax2EzGOj+1hjcFsQ5nXXxfv3FX1jz
         18vDJco9+BIPF4TNI2MiH/5JpX8N0ZNP8FCjVS+rLOPwqsPM3iubJj7nRoPLrTJTgP4+
         7V7Y9+lX+mX1C8NhZW26Q0qJGGMkLoelvZLtNEd6fsDrf/L3i2/isaFK0Jys6/M1Yu3C
         pPEg==
X-Gm-Message-State: AOJu0Yzyk0V443O1nLDjhJqkhOXM9y/aiJs1NDXKZBGLl4cyPe8lY+Yh
	zJ1X/PR3x2e/7HNKLzsvV7QfcVC4gnfT7w==
X-Google-Smtp-Source: AGHT+IHgBEVZCQPeZ7wQeWmxoAZQUE/CrhGn5b6M1zQBcWdEj/DocV8lmwXy973Gbq5wsF9BFbmx0Q==
X-Received: by 2002:a05:600c:2184:b0:40d:5c4c:a4ea with SMTP id e4-20020a05600c218400b0040d5c4ca4eamr3071971wme.162.1703894709018;
        Fri, 29 Dec 2023 16:05:09 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:03 +0100
Subject: [PATCH 02/10] arm64: dts: qcom: sc8180x: Hook up VDD_CX as GCC
 parent domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-2-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=804;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fM2ScZAfkldMIMY7bpO8Z6Zd7TjylAMnSp6mV61kAh4=;
 b=I77TlPoSmEB+MCaCPOsdmiDbqhbXtFivDq/xBBbbHln8RMASgu78WMhScmpnAtna2R2pFSxPt
 CCXTwLktNA6BV7LDirK2FuMfq6+NHAFM/dxToRlM5FCXEq11IvHFW/r
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Most of GCC is powered by the CX rail. Describe that relationship to
let the performance state requests trickle up the chain.

Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 0430d99091e3..91fd805f17a1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -782,6 +782,7 @@ gcc: clock-controller@100000 {
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";
+			power-domains = <&rpmhpd SC8180X_CX>;
 		};
 
 		qupv3_id_0: geniqup@8c0000 {

-- 
2.43.0


