Return-Path: <linux-arm-msm+bounces-43635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9E9FE67B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CA70161E5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584BF1AA1C0;
	Mon, 30 Dec 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWrGG5ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9121A08B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565436; cv=none; b=SXWXcVUhHcKBpuhXhB0Pcmw4waBhQX7Ia0M+UKJGkxmtlkS07MAkHAckfJXI/hOfcocRNAZ4E6I9h7Vb8eTI99r2h9sXEPfHFaWJUchgihd/8AA1gTNWR1JvIWR2lD60oXX2OaD4aKsMsHoA7UFeG69JgblhO59/QekcUtbuzEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565436; c=relaxed/simple;
	bh=sNd2EYZIg7l4zPuE7KNVjgjjMpcll492t3gb4SPn5/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svyU2Tb3h9I8o0bwhMKCEh7WNDV0TuxTRtq3DYK+LLwB/avTGUWJ+9quK0z6D3JY5Cw90ylO6Ka223eYtRN+ileyUTdQVqsMB0W3x/OJTgeaza7yYQcEw/0TCRdMVGENOQusWUe0lDUz4OwRk0V51NhqsFD6FVl1e31prv5caw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWrGG5ID; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436202dd730so65826135e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565433; x=1736170233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmmcpflYSTdG9DnEC1Lz8/bGJpmwX76Rv9811OTTa/Q=;
        b=EWrGG5IDJZuxm92tfhj3Ag40e0RwXi5VHjBXSRtRoXMq3Ou0bU1YPg8yyt1UvhIpIK
         JA/7YT8MK04czmdMiGvx+hjAi0ZgzD2/2APWhHgv6hlSyGiOam5CaPmiHv+pL0VF2U/p
         27BbnU9yrYKPhKT66LeP16PpbzOuSwZNApxxQ1UvGUmHhoNuwhEpS3qh56qV+Isv445K
         SQfAETCNW2SOK0sB1FStt8ySnF7A8iZLeoRA5X02aur45hD3l+uLloJh/fXOiXdqnEsu
         nlGm0XvYZGiiAqW+KZJIBrsT+7SLzol64TbhmakGXxwV000Gb4trX+JaUOHWtJDGLwq2
         F7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565433; x=1736170233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmmcpflYSTdG9DnEC1Lz8/bGJpmwX76Rv9811OTTa/Q=;
        b=hlAM6nCy3JlQEOPnfyQOFHoXCJ9y2ul+afAtm8aACNLGyfF//BqDag91D1L8+EzhIJ
         SWrx65b9Zp9jjseokL6sG+Esegffq1FnWw7JTPy3lWNpZINxcjE4iQkXRk0aQ3A0Avhv
         dqZzep4SaEzQNllXcN/rk3k2VoeiDHUVwMiACkSmZymPPMW12eOt0CTF7sg3n5NfuqlI
         WQJUZn3/MBV1VTaLWM71L7uRjnbY5LwbP1HG7NqCdVoZ6WqA+iWYS0SvdsaTWA+XAkiR
         j9c2aNESqWpkCk4bgvpOZEMafbhCc2AydCGLWV+CkMOE4UKVyeVDJKJ9cJhLTkVSXATf
         wHkw==
X-Gm-Message-State: AOJu0YwL4qNrhA+3BuTuDFbTKWgRe0hNDsoVRcj92pwEMWgLQ1njcDpg
	iWcp/cPcp88a3wxrnd4tJ7oyQB4oUuiEQSOyrlx7P5HDmu7vUUg/l0mLEtlNiSc=
X-Gm-Gg: ASbGncslNyhvaJopt/YpLf28E06uBl4NOfMytaHASVa1OkCnXUwfFU0qeh3ot8c3Eo+
	KaD176eC95MS/l+n5jnHz4KgWygKutf4o+EfBS5jcIpDIm5Bc4lKb9z6EHJ9X1hD/IaZm00lMP9
	hqBl5fo956zY4Y0t7fgbYGBcKU50wYUYrDcSjbwcmu4HtrBzrzRjmLHlP1lFVlIxlaieCxL4Gwl
	UMtHXWwI8WNYXGp2+6xmpbIo3sjjma+dbgMFTuND8ebsPnti0FsIutS8jb6Meh4rA==
X-Google-Smtp-Source: AGHT+IGtqzbMxbz8z4IpV9vofNDhZDNQzchKvO50pMuWuhuqRDt6Nomht67se1WDndXJNBW+wBsc7g==
X-Received: by 2002:a5d:6484:0:b0:388:cacf:24c1 with SMTP id ffacd0b85a97d-38a223ff10bmr30771407f8f.58.1735565432677;
        Mon, 30 Dec 2024 05:30:32 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:32 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:19 +0000
Subject: [PATCH v9 2/4] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-2-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
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
2.45.2


