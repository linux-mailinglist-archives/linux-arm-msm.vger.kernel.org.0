Return-Path: <linux-arm-msm+bounces-39003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77489D799C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2188BB21AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 01:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B92BA38;
	Mon, 25 Nov 2024 01:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOtyzUt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD8D268
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496420; cv=none; b=sbFSYvRP04AAx5drJ6GF+CgFJoa+3MjMe+mcfW5+F6KUbfPGbuspfeX1e/WbQu+gAO1uLF/MkGBqCfWf/aUYkVFtkf06ZroTdvgmEQJfahOXkQKTPOgRIhDfV2r/AIzCqQ2e7dp9O02pqR15m8zRSN3TxL0KvGaJ7w1Y7NhMcUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496420; c=relaxed/simple;
	bh=CdkYU+QJ7VGTHMAgD+J6/KS8Mhb64oBSKmpBnvb/LZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9wvmgLbkwq8hZ+plnpOlhUZdVZ84wuxPBLw4oCazBEX02m1NpEHopLLk+ga++SUOazW6QRgyzaIt0wEdkeaF829M3gsLD0n7Lodm5ufcVo+gH8ZNxXeoOyb1sUnwQNsBANjsmmb8OC1nrb09B9EObKCaOjnXSmU2wkquY9TH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOtyzUt/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so35215605e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 17:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496415; x=1733101215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=TOtyzUt/rXyh125kPo6iV5EkKKLnH+vdwcuwgZOGTYl3sFk8kq3Nyxq6W3WbhZ0jp1
         IniqdNyAbZjX3lmefFs61zWNmonVzGjus11MxR2lWC0DuBtErcvibYk2LQk4Y7NljEoR
         OGSHsLDi7ojrR3LIeysbTfuybrxBiWJLo0e4HRd1WRyNl+F/m0lBQiEtSvSJLzzu5L9A
         lK7L3OnhorHrdcLNwWel47fufCoxqe0KPqzIKIIw0gQYaNbBC334fGGOwkKwRju141o9
         GuXl34H2M0MNG+JerHZMSBQQ3PqWwMvBg2coPz8r84pFHGIAXgwZ3E8pIVEHShOEQuDJ
         pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496415; x=1733101215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=A/JVZHo61bOtgLX1857dm9sw81XUPcAPmeUpvn0kJI88Bdio5Gqg8btq6yFxEbPTk1
         Gn1twtAePOeaJc3A95PR3iHc3JKBgimlrSJ3zhB2obvmQmqcY8dk320oC3XBiLkx5Iv1
         BZFIebqMaeispAOPjLXO0uq2sp3ndJKxXBHCMg4d37pb00F5q/N+/H51ELu3liNO6L+c
         Ex150PriEr8nEHxrWr73EVApAETsfQVLajDYUjq2L+4mm2DQ8hfIQK4syebzYECWUl58
         RT6/W+V32tr7JBqQ1/z3G/1XUX2DMbulJ4si+XFsWIloBqEVD6q9/FDdFbRjEEGsrUXL
         s1FA==
X-Gm-Message-State: AOJu0YyDXDiv9Q23Xg9J6yzPp3FD/jQkNjO/63RpHwlhux6/jAakAZ+z
	Amei+dW97v1tWVV5FvSOYZ1tYrpYskkXplq5k61I3fpl7k9aqFdRvYMZTP0ebI9z62wDynAmUY1
	/W2Y=
X-Gm-Gg: ASbGncsx8uCQe53HC3vYl4q6aKReVUPugZ4MHBGV7AbIgWgLEu7odhtFvCSemXZrSV4
	38F77qXu0o/njDbp3nhW/H2OgX9DOsfnpfrWeSvlerjB0uCw3aLU8qtgfNvuyBAlCj8KhQASCyP
	L6twMTrjn3ay1WV8nLiF/6e4iiRUJUg+QVRLuCKbpZ2Q3VK9PPAT7Fc9MJjR+L+QRVudmDOjsea
	1shdl0TsbgCrOsgA7P/vkSfTxVZzzJ9xnhnJ//4r75uwXn/ENuaYLbCABo=
X-Google-Smtp-Source: AGHT+IHMErZ6fryz2Oc3MCpFRq83v9PpLk8yzbEoM1+JFIaFwdXjct61irdWGrNB++dDxJOSlfOu8w==
X-Received: by 2002:a05:600c:3ca2:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-433ce4b2f20mr107512995e9.31.1732496415157;
        Sun, 24 Nov 2024 17:00:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349f0ba652sm24125125e9.40.2024.11.24.17.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 17:00:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 25 Nov 2024 01:00:12 +0000
Subject: [PATCH v2 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-1-a5e7554d7e45@linaro.org>
References: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
In-Reply-To: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
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

pm_genpd_add_subdomain() returns and int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
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


