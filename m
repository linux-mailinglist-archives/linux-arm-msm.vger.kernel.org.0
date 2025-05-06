Return-Path: <linux-arm-msm+bounces-56953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D5AAC573
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30AEE1C43679
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6565028135C;
	Tue,  6 May 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/l2YURg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB228033C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537031; cv=none; b=Sr4EimjpVqh/WXSE1fg++xA7BRUqoxDswEaXgwByMudmemvBKAWkUycMMEWzV7IFuXl81RxtosK/jpltzNkHVaFKIRfTyH5FjDPnN4qIz98I45mFBUfu/ihFCZWxHO0uAS6i0XqjQz1zGNrzq/49nA4RiaXOzfeJiCCnPOc4sAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537031; c=relaxed/simple;
	bh=dYgm4NlH5IPfrUOXQB7Rxpf3oTIhlLONuVDqq3iAZvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhWfpqLA0gPvHYea9uQ9H3HIhCz6q7vnCLjEgCWxHlAGhdcBpH7cN5guid0BrGqGfK73poT/ucw+3TDYyFdF/FHi0WJkiCPaeim3RRxRUlLcC7EuxZsb8pH95Iy/VEst8S0VCuYuB5ApxA+VuI2eWqiBF2ekW1zjUwpWn/qmLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/l2YURg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso49411645e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537027; x=1747141827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjTp/aG9h3L2/xPCCH1ShAi5uTe++Ief7FWXdc/5tOU=;
        b=h/l2YURgLeT+rf4NEzDX2p0MgKrifr0yHvBozo8IhI0tq7YA/GgReFHjp9R9c88c+q
         OdFNMPs/fcYQ7wBc3YSP9H1gLZecg1H/4CvgCAXwWo71igwMtX0diLJuTBPc71kL73k2
         pqYMvYUd52RrcE4AAAPCyZAKwHhLaiSA/jm2Wa+Ti6efiJD/FvqlRStvOUqrkKhDutEI
         K/38joCVEfpXtC3wDUYd6Bi2Nwd+ME6L2nf7OdkzWHU9YY3LQUw8RUCwW6EfnWSRtDa7
         qJub9sDhtCWEOIwnTYfCUmaa9Mg+TeqGcEJxCFXNatrlwmKGU+2+UWZ1eDqI6y/cDUfZ
         XDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537027; x=1747141827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTp/aG9h3L2/xPCCH1ShAi5uTe++Ief7FWXdc/5tOU=;
        b=iWmZb/TVqAh00aJSOP+3ZZPoRawwxWUYYx5HeTi9Ww05fdxISjf4aEed/nd0TsbU5g
         Ub2eF8fStd+B7RuNdNabRBtB07f5Eb/B+e3PnFirJdJOF7YwaMoun6JKviik1qI+edOE
         yFMHk0TFvXqMQYjfQPrhomj76lXaq+DifNPJBGZuDc1XEwg4QAoASt2tjrGrcN1bM95G
         0OVkqQvfNwnfjifRTKHIr5Un04Vd5bw1oNjNrlflCNM9xSCiLBD3rP887Wn7ZoF8/xc3
         iG/4gtmUY/S+HJuRLTZfqeF42hMIObIgQqNCDqEXWH6ij7V3qeMC+VBISAY0e4/0yv0r
         HURg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGjWu6/Dwt8X6WIW4jttqJj1WBcVWNGKctY2vybuzkuNRVAXPAQq5bRJ9yG1JP5O66C4q6aaMeZHWBhBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzRozoH28Loz34h73QwnNLmPY5y55ps+Eoob9uE30PUjVFh89Ap
	8ZMlVBZmATL7lsy5jmebcCM+d/zoEILQwifiMRdWb2er/8hLbf0uymU7NOJhF04=
X-Gm-Gg: ASbGncvgEIS6/UDizDNxW7JHhN28CKr1zZT0BisnJj6dGocPFom0kVrejgWE8H9t/JD
	jG5gEC1p2GTy8OQfMcmZylWQUvQtsk8zRXw2sJJ3kdG33PPOmmS0mr0koByAmI7ownoLe3hDu3I
	Jrh7+Rok6zZd1wwOmS9iUXn267Yu5KLXtWS2K6cmSdca0llN60Jp/e5M8CrjKdSAiazYh5GcN/q
	J7TSw2zV6YPPn46QOvmLAQeTx2H3nk0mzqoohzC3ZBts4TAziEUNuPGNbTCa7ygUk+YjbDiszzI
	Tr4+wei9Fn3dDYtFSLME82Q07cASByLLhzuYkLN839Z9YjGtz7NFD1Y=
X-Google-Smtp-Source: AGHT+IFaFB/FZezjripHyQEZgUYd+jxmBl3+AL6siEuRgHFWmNVit4blU6ZNo6pVl6a4NIiA+7gYKA==
X-Received: by 2002:a05:600c:1c84:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-441c4919f07mr78232605e9.20.1746537027193;
        Tue, 06 May 2025 06:10:27 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:11 +0200
Subject: [PATCH 4/4] clk: qcom: apcs-sdx55: Obtain clock from own OF node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-4-b54dddb150a5@linaro.org>
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
because the qcom-sdx55-acps-clk platform device did not have an own OF node
assigned. Now that the parent mailbox driver assigns this, obtain the
resources directly from the assigned OF node to add support for describing
the clock controller in a separate child node. This allows breaking up
circular dependencies between the mailbox and the clock controller.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
@Bjorn: If this looks good to you and you are fine with merging this
through the mailbox subsystem, could you provide an Acked-by here?
---
 drivers/clk/qcom/apcs-sdx55.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index 76ece6c4a969266aecb32806269c791712f98804..e0e779a81f2c6b8b9cd34d839eee9aaf9fa33f03 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -79,7 +79,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	a7cc->src_shift = 8;
 	a7cc->parent_map = apcs_mux_clk_parent_map;
 
-	a7cc->pclk = devm_clk_get(parent, "pll");
+	a7cc->pclk = devm_clk_get(dev, "pll");
 	if (IS_ERR(a7cc->pclk))
 		return dev_err_probe(dev, PTR_ERR(a7cc->pclk),
 				     "Failed to get PLL clk\n");

-- 
2.47.2


