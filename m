Return-Path: <linux-arm-msm+bounces-45403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87756A15101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D30D01887760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448F8201001;
	Fri, 17 Jan 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olwd0Whf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13351FFC40
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122055; cv=none; b=hWUq97PRkC72BpbNXpkkgc8E7NczrlXhAsjC2QpeYcwk84vObPKSZ9Rim27VqMx1sC+IlrWr8ZR09P+GEmIhw0YJ25+1q9hmrtK3gMlLTnBHXOFHf6SRvELKCvdo75UkWbTnk72aSEB06+aih6tNrWhvRwP/txWCF3WER9caEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122055; c=relaxed/simple;
	bh=MAgPHU1Bz2sNDNZOkc4tcdXK0ulAsoRdPInzeOCBuFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNHMB529OinilSVEz0KHJyHR+4jRQkkDdQCqCFiJREfU3+DZcZfWi3zvxVkDliUJsMONwVJFLm8c7JtZ0BS3UxuaCjvMykYSCh1YPQ1jH0vvZNuoFBmAtRPqrA9R6gDdumWrJ8rTKPtTRRKDLsYbmeKb5gQGObCclMqYAPnEazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olwd0Whf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1196305f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122051; x=1737726851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTx7trlO+qhAIZBVr4sCxA6UgBBZ6iW+pqhCeQ0jUHA=;
        b=olwd0WhfJHs1nlCt7ZFpe26jJ5Fkc0+UG1ZoPVuauVKFqw614ula0o2e8kqa05C8GK
         lTkjqnUWlff1TFbBcl5ijSIQGM/DeEqbAsZKbtBCoc4F1yoFr46Qe5MGhLpoedtZZDPf
         yd4S3oBpjHl3ft6NZAMIdoEn5FdNjuxbtEL0MyHyHF86YjyOtX9hU5dwAuvv2LNTsLLZ
         c2WSMtUkqFwoYlXjGcekGE0WNDADEWJlvdZM2sUFliy8XQFfCQXe4my2wXpbzk6g/qOT
         gHwVXPV5HCF6RTZdA0gaJu8gQNFm4leIgxf6bBgIkDgwqoTAFGRHe31x7KOjvz8FZOlP
         ArFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122051; x=1737726851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTx7trlO+qhAIZBVr4sCxA6UgBBZ6iW+pqhCeQ0jUHA=;
        b=Y/0Hm2wBOS0soS6zzDGdKA+jK7dZ6cKmXpAHSDsrfmmCeZpVeDlULGcmBSeRsn+OGs
         V+MqTM85+cAKGGEfNaZbnfMvEYiiyOORVbhhiPL4gMtu3KYtGMJLuKdXYaNi3cghfCGo
         s0xSBbOVi9TGYiX6SBZv9Co44ZaltBA14nmpwKs1O2LYk4uY1pNLuGEgokYp8nv77tK2
         BF3ljdW4ymp2tlGR79o4hTCC/g/33AgXBzQhKqwZZg3woJZED3vPONReQn1lE8PGoAx8
         eRUSY9ljd1S/uWcrwvFjgvZV+SeiDGFwP7hEm/AElVw769y+V93KpWzUeSdajSLQHVJ4
         ZQGg==
X-Gm-Message-State: AOJu0YzjBP0mL+dkqCBjpVZ1yhfHh7/3BCqCD4nctwGjltK52OOppI04
	ek1lVwKWj4LuqBLpLbSSgcq3f7zN4YUF71AOUbi3sF9f0G1kKFxMfBMBGPIaf5o=
X-Gm-Gg: ASbGncvqw3eS4XR458jn1Bpz53iT5zyNIPtkLEK5LUV8QmnXuJE0VxWZbTDa7cNlLWj
	KbAygJJocXC2jgDm7qmO04vH62UsitagKEohsH30ZK8OrDprm4wcQx7/BVfaAkFzJzTBePkxTFx
	E3EcIm3b4RIIkWOvPVTtr2UGLHRPIKcpFhOc4ZQ6+tbOouGCuQlmudZu7idd64HZrcuAU86hTQN
	pQuzHWeQ1MKlGa4XmV63P5910M644MwTVuTL0uSUKtkyyIS/5IY5cEKzweofDpBiw==
X-Google-Smtp-Source: AGHT+IEDPXdDbnFx8QRaTJCrevmOYsul85rv9RHdhHqFBMauSQzaP+fCqw7xsorGDbZRjoKdq/HThQ==
X-Received: by 2002:a05:6000:4021:b0:38a:a055:8498 with SMTP id ffacd0b85a97d-38bf57a9436mr2476005f8f.42.1737122050978;
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:08 +0000
Subject: [PATCH v10 2/4] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-2-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index bc1b1e37bf4222017c172b77603f8dedba961ed5..fdedf6dfe7b90c074b200353fc0c2b897863c79f 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,23 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
+{
+	struct device *dev = desc->dev;
+	struct gdsc **scs = desc->scs;
+	int i;
+
+	/* Remove subdomains */
+	for (i = num - 1; i >= 0; i--) {
+		if (!scs[i])
+			continue;
+		if (scs[i]->parent)
+			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+	}
+}
+
 int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
@@ -555,30 +572,27 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			goto err_pm_subdomain_remove;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
+
+err_pm_subdomain_remove:
+	gdsc_pm_subdomain_remove(desc, i);
+
+	return ret;
 }
 
 void gdsc_unregister(struct gdsc_desc *desc)
 {
-	int i;
 	struct device *dev = desc->dev;
-	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
-	/* Remove subdomains */
-	for (i = num - 1; i >= 0; i--) {
-		if (!scs[i])
-			continue;
-		if (scs[i]->parent)
-			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
-		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
-	}
+	gdsc_pm_subdomain_remove(desc, num);
 	of_genpd_del_provider(dev->of_node);
 }
 

-- 
2.47.1


