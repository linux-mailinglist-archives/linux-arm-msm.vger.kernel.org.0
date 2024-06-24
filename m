Return-Path: <linux-arm-msm+bounces-23958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27C914ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE711F20FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC1313F456;
	Mon, 24 Jun 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDtRuiH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76613A86A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235965; cv=none; b=Hq+9jKIC1Uzku8eciZtKPSoWSv0bcYCoDTJnia1Ga5Jsk3JYX5QNGwDu0OQYQ49+G3wTnneQ8lnRnCD8F9Px3WtJs8PrE/EtUdnMGyqDL20xkWu37On6NwO6aqD1WSounA3OlRAG0ms2I0Ls5a/u8UyuS/gWQr3DUSBUReFC9AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235965; c=relaxed/simple;
	bh=Zctin6COyKSAWT24NAPILQLGDPPOxvw8MfxxSaQPMYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWX0YHOwmVHur0261ARyEZ44Jj4PBd4EQ0dcqLKs7iaMI123ccrT1fgqyEgPzgyqW2wZo3hMtxUBBixJ1r5S2jOO9QLuZMnncw7xlDb7Qb443jYMP2QCALfRyKjZa+SNlAKcnqEVJMXNbUELODT6CNBCouJ9C5tMEdG/paMcuLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDtRuiH5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-364c9ec17d1so2757790f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719235961; x=1719840761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acDdzmJIbwxTt5wAKcrh1Xq7fcWeeo52mZWsQ/yfejo=;
        b=tDtRuiH5kkk0AgupCGdUkRxrvhBOuUnsX2gVgQSkXHYIx7js21+YXLH8wyQ/cRJpSj
         3hALwxbuplCmDFT9q9CAPebcdtlYubL+2TWRWQFnGTOeDiPm04y8pF2sOYCkLVvnvn/W
         krurQudyNeOzfKr+PNppnboxN1PiGMtNR0j69jZh4MeUgdSM9APtaiIIFyQeci4dHS2M
         7O+bl6TYp6yykModZdmoW+oha87qQ4E8X0kInMUlnNG3g1xfCW234t3453Ze1fhQVMce
         Dzj2uEj0XTrUS/vk2Ve/VwQRREx0hXrZtfhrfOIpkSR7xdTFf2nQ0SE13swsKEG3ictg
         l7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235961; x=1719840761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acDdzmJIbwxTt5wAKcrh1Xq7fcWeeo52mZWsQ/yfejo=;
        b=UhHwGEoJ61d7obu65ItT4JY0zCXJeKxZI3cqVpGh4ZZ2ykGaxDjEGKDod5rRk1xn5N
         YuQO5WOPbwmYtlrW44dGHZY3mCx4gwM94dK4fNM+3Z5Z913RjauiQe3xTWBR2okJtW9/
         O+4HLvzBMDrhy5HgePRtBefMmLmHMw3vC7qArOph3vA9f1BBQDXQFbJhpJ8P7vwu0KGm
         NcLNtKZi5CDguz33DDylzscwaYpG6eRJh4f7+6ZAidmEx/EzuNiXbIc3zlSFgpz4i6Ls
         YjuMjKXW7dZfNA2BupCKpu0MmhQUMCgxDDdm5M7m3DzF0DpEpWobmZJwlDXH9O4p9fie
         RcIA==
X-Gm-Message-State: AOJu0Ywg2jtUGnwZ/HpCgK6RLmu6C46SGoRkXTW9HG2JuGaRLeHIP+VE
	ZdrztKhBSuG98kVsS/OKAaZzfYDNfJnbzxB/Ggg5JN/dOGDmHKUuSdJdHo5/dFU=
X-Google-Smtp-Source: AGHT+IEa+EUqe8BKULw5qE3fhDzT7QD/+vr5MXLtKuB2+LpQ4HeqG26DKI1mPXCclOfeAMB0FAGkhg==
X-Received: by 2002:adf:f003:0:b0:360:9bf5:1eab with SMTP id ffacd0b85a97d-366e94cbbf9mr3216076f8f.36.1719235961381;
        Mon, 24 Jun 2024 06:32:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f7406f4dsm1888274f8f.114.2024.06.24.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:32:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 24 Jun 2024 14:32:36 +0100
Subject: [PATCH v2 1/3] dt-bindings: clock: Add x1e80100 LPASS AUDIOCC
 reset controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-x1e-swr-reset-v2-1-8bc677fcfa64@linaro.org>
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
In-Reply-To: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Zctin6COyKSAWT24NAPILQLGDPPOxvw8MfxxSaQPMYQ=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeXV2Tw8UtDzNYIbML/4wm20PRXTUnQob7544G
 fLaztYmXWqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnl1dgAKCRB6of1ZxzRV
 NwvNCACC9DWfPuze/pH+xM+4aD3tTujKPiL6OM5YbdXR0ilkuxvaQvrTkFrvw0re3MRZSyUOmr9
 2NHEjHy/GBh7ys66NPdQXZgJCk1jR2BTeq1CpOap6ns1CWL0AawX4cXIg4j4vgQeiNVoQ6NY8Dv
 oFaF8SpAbngtWSFHiFHcXMBg0Ll2m0av8OKBkvfKG5HTOEIJ5r8OXf3UNvg/79SzrVWeTl5cyyO
 pkl2M78K9w3oolVAYYwnjToQo7F29kPvtZOj7r66CUsVLZGsIdvh35qIlU64jMfri22tIrvhF0y
 C4PDjYLM8O4zDsu7V5exnu/KtzsP0vymUJN5seecogvADhpu
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

X1E80100 LPASS (Low Power Audio Subsystem) Audio clock controller
provides reset support when it is under the control of Q6DSP.

Add x1e80100 compatible to the existing sc8280xp as these reset
controllers have same reg layout and compatible.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 3326dcd6766c..c33bf4c5af7d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -18,10 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc8280xp-lpassaudiocc
-      - qcom,sc8280xp-lpasscc
-
+    oneOf:
+      - enum:
+          - qcom,sc8280xp-lpassaudiocc
+          - qcom,sc8280xp-lpasscc
+      - items:
+          - const: qcom,x1e80100-lpassaudiocc
+          - const: qcom,sc8280xp-lpassaudiocc
   reg:
     maxItems: 1
 

-- 
2.25.1


