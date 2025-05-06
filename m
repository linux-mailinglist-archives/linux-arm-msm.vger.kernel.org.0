Return-Path: <linux-arm-msm+bounces-56952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F1AAC562
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A9F9810FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88835280CEA;
	Tue,  6 May 2025 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cptEZha7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0E028002B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537030; cv=none; b=WHaXd4TYTx13IbNv0vFg2/84Kwy+MpTmLRnjk1DBiQ0P5DhlF6emrWpOmAAxP6IJXv/7kTHY9SaMZjfsC51achU9fF0IjcNRtNCRnNbqKI/mwMaBLicwe9JALlS1dlxQzAiGYc8hwx6Tb9wTgTfJCzEkAOQREtJ3spkCMro8Z5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537030; c=relaxed/simple;
	bh=yxf14Ljk58+UMoTg7Yyge6qVosH5ZXrWvi6A5xwpE58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6HBLMTs60NVB78RdvW0N/pmhLVu8BoTww7Gg0aF6oOSbGet8diEh5hP4SI2ykeL/aAq8HMMulqtaio70OJcPiE30AJKwC0WzhbNX6KUfiHy+hs/0yTmcdoc7+Avlumk3TS5er52i2e01cBzrfiHNt38pft/VrQ2zIjA9d/YwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cptEZha7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441c99459e9so18193785e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537026; x=1747141826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgxrymKBqlMpBOa4fXvZbXrP4W9uX8YtK+8DIxg3UAo=;
        b=cptEZha7oz2gk4leZ3179fl5bOD1MXNRE9fZM93udsp24gxoJexzpHeE9lWgsMrf3Y
         blVG1y8SxyHSw0abw7cZlHaLw8c9v+6qBiFTQeuY9p/F9t9FqTarACbaCXvWQjECZQ1/
         PBh2omLc6+OuxVSqM1XMzYU6ZslauQikCob2oimdrtEl0YFX/A3vBFHiU/37lvVudOWx
         E9yjaXKNGEDbalAquXZCCiAHl0YBcE/tPOqAxJMuMcZ+ChcLNc4pc72irqY/OE7kNWK7
         LldukcY+Z7bn0Bqy8AIAV9obrgGcXfgBcYV3m36H73i6EKmHXGV2TnRiWIzQw8FGOIjB
         MtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537026; x=1747141826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgxrymKBqlMpBOa4fXvZbXrP4W9uX8YtK+8DIxg3UAo=;
        b=OhnkF2BKOXDIG1hrUAYSyjY02EW3UurT+qh8tBJhbCStNf9Jz417g7K2UGNkS0uxec
         VXBIK74Iicgnm0it1RKdLqmErFuRsPzbhybo7AbDfeigj2d3VgUBnIJZ4CGWbY5cUpoI
         YuFpIh9bR5b8qc905Y7VaaDOk0of0WGTwlPTcF6OUEIBQNz3h46l1KfH2PAMz2kr6KuR
         KtVQZQD+B1IPhgwmW26R+kcm9f48lIQ1TC0ZxnsGvoJ8jvSrUj4dUwB9eUFGS17jMAd6
         WY6dh/7tgaAEKypbhudjU+xeNMXw18PH32WgAYsVe7+bIdllKOTCcQTTo7qA5eKMbSz0
         ETtg==
X-Forwarded-Encrypted: i=1; AJvYcCU43/BPaOPbTg1yNlZ2WNLHsSPw7dN0ligC2a2DNtD0Ln5yJyfeRs1lY5W6DV87V6o2FFRGSECcV0M365Jd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj9vcXy+kHE52N65tCCB6j+iDkY71ljCSC12QdclJSPaj7rHHL
	SoaARJtXRiVfyKi8ovjrqBlY6iNQ98YjPJ9R2Lhp32dffLzJUWnfGZvZ7Gsge/g=
X-Gm-Gg: ASbGncsjTFTHC9hA1kC4aVNIueOGIUCO82yFPjsBa8+mESwmcYu6GuHkTQ5XZ1yApOh
	rnS0OHoB814idGLnO8p3P95xqAr81Pe5FooYT3Ozed/nTZ50VnGoA5Xh8nHL6oIMvmUMMq4+lvs
	QSadrx9k/3ZJ/6a1cw1p2rFGHbvxvd5lA/f5fDYhc9QHuuRC7J9YuTdxWTYAMsnnutD7qp586Pd
	N8ol1+ofoFZserlrlxszWWbs+99hJEyunE/oXvLxQ+Ym7tifiavsFzO6zhnBm75qywbuPzEBvp8
	lkbialcOS/GkxjLRQYidV49liKMVyh8dxRKFVEuHfQR8Jkq7LHl5eAfYq8CQOGf8zg==
X-Google-Smtp-Source: AGHT+IH4gKCkUyIZVMKUSRcuZsuNAPJ6O+y8mkjQv/iAU3euFY+19csLb2q2NlIB4YzdYULF7KFX4w==
X-Received: by 2002:a05:600c:350e:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-441bbe2c815mr163710535e9.0.1746537026227;
        Tue, 06 May 2025 06:10:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:10 +0200
Subject: [PATCH 3/4] clk: qcom: apcs-msm8916: Obtain clock from own OF node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-3-b54dddb150a5@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2

So far we had to obtain all resources like clocks from the parent device,
because the qcom-apcs-msm8916-clk platform device did not have an own OF
node assigned. Now that the parent mailbox driver assigns this, obtain the
resources directly from the assigned OF node to add support for describing
the clock controller in a separate child node. This allows breaking up
circular dependencies between the mailbox and the clock controller.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
@Bjorn: If this looks good to you and you are fine with merging this
through the mailbox subsystem, could you provide an Acked-by here?
---
 drivers/clk/qcom/apcs-msm8916.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index ef31386831ebd2404b99edaeff4c95a31eb68477..af60f3ab1f82068e5ab046ee4a2231c7fb85ff41 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -82,7 +82,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
+	a53cc->pclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(a53cc->pclk)) {
 		ret = PTR_ERR(a53cc->pclk);
 		if (ret != -EPROBE_DEFER)

-- 
2.47.2


