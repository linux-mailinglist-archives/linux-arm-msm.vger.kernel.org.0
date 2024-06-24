Return-Path: <linux-arm-msm+bounces-23914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C15679147EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435CE1F23CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552813957E;
	Mon, 24 Jun 2024 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiOxpPKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CDD137764
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719226554; cv=none; b=ZwkZ2i9Coop2TDbYbohKQ+rN2OV6CJpr90V5tSXBsCcjdXsToIbAqCuBmJIhmZMYgLn3CthfIaQC0cMdkKquGzB1Kkiq/voS/2qvlnvaFfSOblJQrrQs8F/g/fehfklKlnahFvtoGkwZyaD/CG+m/gkSGtsUMWMREfYTPjPOTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719226554; c=relaxed/simple;
	bh=R2uw2dMuYl7zwil88qF/x4d4ebApqZzOu7SwAH6k4Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fx4V0fuL9F/nIEhF9AoaG4fAN6Tx1C39P55+KKEaxutUvd3D9qWg3OUN9CJycRhyWlaKugUf88FVtHJVqkrWA5QWeqdAqLSCpf+nkQo88tIPd3eo/yeaF9YxhFTIt8C77E2PvioAnyI80ylKvoOCb1klrvrZQkSnWdvR55CzmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TiOxpPKK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421b9068274so36724495e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719226551; x=1719831351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEwavVao0Gsfb/DgVDyGw6ByYlqqESQWmuX31QFD0oQ=;
        b=TiOxpPKKykbEbmZCGTMI2C6cyHKtvc0fSCLnPlks+ssTtoyCiTOVgdZz+TzsRFlvt1
         OC05H+FpG/+eGymFDxSlUpXzl48NyQEJ0LXJToZ/NHKVj1lj8PZVLE4cq7M99wnyDxZW
         xShyEgPXKmww6L2o9XvEjy2Ojb8N+J7BT7Nk2EvPBg+tNVl2GK7GjVAVSqikhcHLJ8Wu
         DScpZxinKFGh3WaemyC7s9Vvb4CvmijIxb1hIo86ZlLjkw65wcsjUnaQ7WWW+MtiV2Hn
         L21C4zvWR41u8WmQ0t+fFIhZAR9VWqE1keT+y8hLzzrwEBi/hcCMFoqMddK0rvmD/xM1
         wIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719226551; x=1719831351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEwavVao0Gsfb/DgVDyGw6ByYlqqESQWmuX31QFD0oQ=;
        b=SY4JqlVm0tvKxMCt8CQkmTIJpWcH3smulSHrp7FPjvt3BwsrO591nL6JyM6+pwnIdQ
         04/NCi7dB5cthIRFvsoNEbovF4UQ4X9bSGzGAoN0n7++uR8biaC+aWijMjxoVso9S460
         lNVoK0f+sH3OQbNxVSJTzdrabalRFwbVup+8fePPk2luTOzR64ehI5WBaBox9F6qow/X
         3YBssiPZT496agH3QmKZblyXuhRnbqIkQgCwpL6pU2jBI9xu1OPXnRfbLiI5+g79vt1t
         171uk742APDdCjbBE/zz946zZqTq4r+Mzk+25L7gpGF2hEWb6tOgGb0ycf7UY4oRICzJ
         Eupg==
X-Gm-Message-State: AOJu0YwRUlA3BZITt5KZ7NOhftVALJUDywjLGkKw+L3lIR0UZh6WXacL
	1xCjYwDoSjgIz28KJJ4hIO5aj2QcuCPqSqfOWzHoM58JQQG9/IhbC5+rahaNrOM=
X-Google-Smtp-Source: AGHT+IHL8HuFJolUEGriM0+9J6rrdoOcoFZWMtcDA+8ARtXB4bGhew2DEEWtm+E1J0iUkMu80/KmFw==
X-Received: by 2002:a05:600c:2902:b0:421:79a1:bd16 with SMTP id 5b1f17b1804b1-4248b958d16mr32380715e9.16.1719226551385;
        Mon, 24 Jun 2024 03:55:51 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm172479595e9.32.2024.06.24.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 03:55:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 24 Jun 2024 11:55:31 +0100
Subject: [PATCH 2/3] dt-bindings: clock: Add x1e80100 LPASSCC reset
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-x1e-swr-reset-v1-2-da326d0733d4@linaro.org>
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
In-Reply-To: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=R2uw2dMuYl7zwil88qF/x4d4ebApqZzOu7SwAH6k4Iw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeVC0pa4r/wnl6+83Pu7ZqWVv22Lwlgwa0aJaX
 7tuFwdb7EeJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnlQtAAKCRB6of1ZxzRV
 Nz7GB/0QPxEluIUaDDM138y3z3f6S2tpr4WD3cbTq2bIeL9XK4xQdTikR9Ocrf8XO59tWttJJqI
 GKm0h+JjeG+h9NtDTQefDSUe2PmkLhqfxWVmCfaBVLW027zQRfJ3g7GdDuOmDusFchAyrrmvs5o
 7R/anlK9U6q9ZExN8Na02g8MsfA4ye+KLSiYicMw8G5slFhot+p4C+G0bJiu4OtfyLJF/mL8Tb0
 xD8BWnZeiJEAbsGTIKk07lP4JGiZPQlf4U41Mt6n21ENvVW7+BXm24N5wPZk8yNC2Q252fSIDP8
 Gt9Jo4PalG73TPXQaVWZnOgn4WJHB0escY5+q8QjZyD7Nd+F
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

X1E80100 LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add x1e80100 compatible to the existing sc8280xp as these reset
controllers have same reg layout and compatible.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 1565252be672..a576cb895bed 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sc8280xp-lpassaudiocc
       - qcom,sc8280xp-lpasscc
       - qcom,x1e80100-lpassaudiocc
+      - qcom,x1e80100-lpasscc
 
   reg:
     maxItems: 1

-- 
2.25.1


