Return-Path: <linux-arm-msm+bounces-39582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F059DE6F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D6D4280E3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E334E19D8AC;
	Fri, 29 Nov 2024 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5IDfDI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D419CC36
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732885664; cv=none; b=CK+/rVzaTF4rEQi6iNr9q3Xg0QRggd18xq8WUxx3nEXmjwyYmFHZdyjQ7ETr0aIl4hd/PRc4sC5QRAuIinXKAcYHXeibHEBb3rDdtkjKc+sfJWjCF1fBMTMhjAAr8YuYK7rFvFdYZtwJZPLwEhIcqLcZe3dQdoYvVCm1ZZKrfq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732885664; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHxkljaKOcJEJWD8CBHvCEffwJ1ylN/1j6Ubd0qa5fmIpphJIrRI2M+cZohce5bgIm/hOHa598W2z1413bibN4Wxspu4YmRQ1/35c7U8MWLRLjkjs8/cHYyAFvHerr0NWspXtSiT8O7jfsltPwq2emh84uRl0YDm7p4ikHDLQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5IDfDI9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43494a20379so16962525e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 05:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732885661; x=1733490461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=R5IDfDI9TKVnyj6lHw+l5l7gbB1ICpTZkx/K+V6gG4UQVmrLCb/iNc1ra4GaZE9txO
         csKf2OX0dDpsciUKr84zqwTicYwS/pbfjEoDaQXfYRqTzteX65+KG7IdYwpRAjaOe6Fr
         /nyEivv971MqrUE2DJcTPDSL+A7nUF8ihYRr+yEi5yWg7P3U/M1fI7ae4WvHYm6LR6Kq
         L3T1f8fCxlWJw7ktevq7r43ujVuo+gppeTqsml0rsY2k1wnmF9Ltae9ChjAJjKziqkjK
         1UD4MdXwlun1ujaOvCOdvJaXREGXpJs2vaylwQayUAPgQPQ3BkDIw7vb/KVMdQT49lem
         1agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885661; x=1733490461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=dmxPXZrJUT7DlbGT4QiepFc5kSOUuov53KWMCbLnmrSK0JbFoZnw4kj24GeZ2eG4zc
         972kwzUghtICk+c11yxWXQlJz2g7G89htJLDoejo5dTgRVVvImFEqyHHnnHkRw0qhEzn
         UOD1npb7anopXnM7mTAEGGplLjvMGeBLv7aJtzmegGqGtsfS8ENvVlhvlbLlS/zMRDda
         vKVsl01DDdt7BQD4H8YjX8dSa48NDU7Wy4DMSxVD5p3Dym24BTiDriHj3tc6vPMx8UBd
         6KxXS6/gKxYnTJbkcEnI++8XqJY7RnZCIZNe/iFqksk8qA2Zup3t6vNE2e4eXsVUAruW
         OQaQ==
X-Gm-Message-State: AOJu0YwIFDSE04Hl0pBNul9BXDuscFXE3tQGr9IrY3ECE2XZGib7476o
	6kvoYySbEPQw6wnKnXbkLmgulp3UwSDWmoayHaMfj8ZKmwxcEG+gHAJ+mpWdSEIZLXWoII0/0gO
	hgFc=
X-Gm-Gg: ASbGncsQ9qnfrmsFE9ah2qwA/A9vXCzMA5mLltqj593Nns0UnWfXFZMApXUP4uNPiy2
	nHvjr4ivfeDoJmjuYKGYSsBKnLfOiFwhgdDaTMKXnIjhzNGEb6UG/kzlyxNFzIBfpMFOJ//GOnS
	mOMxc5/OKW3e/6PEvk7IB6jsYMJSYFV1gVk/qayb529ocn2/HqfIVaJlE1ri4jHStEcOsnkSgRU
	zngU7nposTNNVG/xHWu1niYvJDHGQY4rs/2DJd1W3CkPfAa7M0R4FpJBrg=
X-Google-Smtp-Source: AGHT+IHhtPopN59nF0wT9aM0MO2ZUTkad4G2GioIMf1qnkxOPmpIkivwxwFk/94QpZ1tIVuayw0v5g==
X-Received: by 2002:a05:600c:1d18:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-434a9dbbcc7mr111429935e9.4.1732885642767;
        Fri, 29 Nov 2024 05:07:22 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm86228395e9.22.2024.11.29.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:07:21 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 29 Nov 2024 13:06:47 +0000
Subject: [PATCH v6 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-1-24486a608b86@linaro.org>
References: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
In-Reply-To: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);

-- 
2.45.2


