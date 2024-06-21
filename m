Return-Path: <linux-arm-msm+bounces-23591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E491272F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B47287BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537671D54B;
	Fri, 21 Jun 2024 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvOEjRUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A9208C3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978510; cv=none; b=IFfoMmN6tMWT648gwUn13gMT3wYSsCR/OWXo/pdquiV/y0X2CXX/fWEn1M7MqXt2kMsYQlV4u+Ydwua8F1mZtczy2r5C+ijehOzr2JwX4MMrtU/8EM3qO5gMTy4b786PnUFN4fTKhAsVh6Z94ZCXVZE6bsIw/BfuLosazzG1QdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978510; c=relaxed/simple;
	bh=VQk7sZTiA8wCKqvgDmKRoTUmlQX31qFVVMeZqdFX4f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9n2LKUl7iemvS8v1fZyp0jyBnKoTwxINUzIxuniNT0TGwQ+b4VvbMD8KUfR8sNvEO/0joxkAlmus8brg6logJ0T6ft4sTcxo4Pjd4qqLQefX7vVzOI0qYsKqiGO3zd/vpXC01wSNR16BV0D3Bmbr2r7TfNAAkGzrGYrfCEuC4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvOEjRUh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-361785bfa71so1701164f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978507; x=1719583307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIq5NFporX9JL7hH7seYl7KxrZat3hGcNxPAVyQ42iM=;
        b=CvOEjRUhPUPxLzTFFFGJ2v/KCC7of/q/myCWM75lIIxYw1rVbM05em13him2b9dKEh
         SASSYv4oqzCS4LfNIqP7KfM7kHtqzSORvMheS9j+CS1x20Bmo2yqoWYJbubSANlog9ht
         +XzQc5ZLno6T6MMQyqDbEqsq8z1qUTsW+umEE+YYlOWfD5VE8EWtBUJk+oqNHJM57Nw9
         MQY522cNotfAqlQaTgQyKyN2sDbmHG81ojjtLWEbJV6noY8TIae2m97obPjdSwrXsTwC
         Vb8EHatZktQi+usdqnsBi7QKYcm68zzljo2p+SWgH193Qv6/WGjCnsZB4ngnOKI/CKSs
         m9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978507; x=1719583307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIq5NFporX9JL7hH7seYl7KxrZat3hGcNxPAVyQ42iM=;
        b=r20vY/hfkjfuFtDnTnRu4/vXaUq9/j11ozKx8gnK2jvDR1JjyTX2Og6cqA9HP6CUof
         lNjzh+c+kjbU/8JKtPgQ4O8v5vfUROApLwwP/QTW6IP18S0ZuoHN26U2BNSQil4NdduN
         AXoezogK8oBDxR7Ct8GcSFrOH2qNPU654380dlHsql5L+nlJRoN12CKDrQ7znraasmkQ
         aTRDAJHSW5d8He6sG0rvh7k3kklR3SXMbsDbNRUecTKEXeFAhYgfYaaOKSypc/vcmq8J
         J0YGLCR2NPlqLsg0GrmzLJhW22QjUQwg6SlnX/UZpANmLPTyvHAmFMbl0bC6AE0l/vGA
         3E+w==
X-Gm-Message-State: AOJu0YwRgC0FLmJbZEnU5yaCjjQk7wkhu1sr8UtY9O5uwwG53+1EUrJl
	B40FGjXyDuzyBxnt/4QiDZ4lE9mPTJTtyL1EobZup4SGWTKBzpLitOAHNI4PZEQ=
X-Google-Smtp-Source: AGHT+IFSqdMZ2rBm5DpH9rcAlEZXXwPTN8ojNO4QOtSfIWSE6aXjyDv1ozNml8jDWBt1IAxYyU5FAw==
X-Received: by 2002:a5d:4902:0:b0:360:7f79:b4cc with SMTP id ffacd0b85a97d-3631998ebe5mr5943433f8f.68.1718978506614;
        Fri, 21 Jun 2024 07:01:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 21 Jun 2024 16:01:17 +0200
Subject: [PATCH 4/5] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-4-7b297dd9fcc1@linaro.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VQk7sZTiA8wCKqvgDmKRoTUmlQX31qFVVMeZqdFX4f8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfEFHDRWYkjp39n+HmQdqAoGn//ocgCqERcabOO
 jWuGhOGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHxAAKCRB33NvayMhJ0cRQD/
 4hljnI17ls7MCb7+we/IEpqnLHxfOUqBt8jxMRUJKGNVKC88x3eD1HCiRGMjimQ6f1GwyDR4qFeRnz
 aoCfHwrpn78tWxcTEZmuwtXeHO0VaGn+YIM6Dsn9Z0xtquawGXH8nNqHAJaKFjHXzGvn55H1OrYyqZ
 i732H+XKUHqroi/IKBrfRMsB3NmGcdInpWrD5b+9mtmUNwRerxdUBbKpIFDys/RA61lV/fjE2O7T6W
 H96SuPcm3tRbbrLiUu8EvjVTjKauBq1YxwkMZ6t0lLhlkiVhqeEnXePZL6/iMByWH/SDV21LrxGYuk
 a1TLLuIUeByAEktGVzqCmwg/ZgA4ye2K3wsWKxtXs/TA9z7WnUhZND50LxUNn0dtsC2LTPYfbJeyBd
 282/RkTvE98V75Hw9gaXU91zoojSbeSwpQ2S0XpUNi5uD9zzlPncXIYUdnkxSNV3qJ2TBZwChz5Dn5
 YFOSYKJMcPodBhk7BA27A9XCwXoUQAxZpVmSFI8jt8R86Y/s38IvjBr5qpVX+jYRBZJWofuNIYYRK1
 kC/w/WXBWA6pG8JGI4/RlMOvWy5fnfiXeiFUwpDCA0so7Y4G2kDd6iKsQBH0TUrCXGENGdOCniEg1s
 r/QbOiLgNEgQmCh6KVSdLLrE0tfLl99ADkEvsGFvp+QmEypqlPtFZ39mOUMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
and byte1_div_clk_src, the clock rate should propagate to
the corresponding _clk_src.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index d22f61772667..d88eebb32575 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -694,6 +694,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -708,6 +709,7 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.34.1


