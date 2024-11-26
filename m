Return-Path: <linux-arm-msm+bounces-39231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5699D9FCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 00:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E112D283009
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 23:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE231E0B70;
	Tue, 26 Nov 2024 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxG539p/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8691E049C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664679; cv=none; b=Dj2dHcCg6wBsBVqKFuHytiZKvEXsVT99Pd3mQ3tZMRhKrMxjqe98+iQC4STKn0Co+fK5d+9uNGEDsUOUnHjWfENJd0g/X5VKEhfIeb2CGV7SYNKe7gZ651a2MYNxwIVJYJtTkPZSpJIqr7pskI5x+XNXhPoBB7gw3ixnKOjVt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664679; c=relaxed/simple;
	bh=nVHGEOrRUdBNA5gRWj0sFzT9xtelcZ3Fgi3g7ZZhzww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClQUew+AO1t+FoQHZyIGaK+a6vtdp35fRymx0jg8XnZWyWMGSMliJi7Iy+2yUZqGpnRYSvVw0dnjRKG0mHmFqm2CIoFB9azrVl04qXdLcxY5Tm28bROY5ZIkzhhzNCMeLgmCFCP9NyqvyvWUGXVaHIXjXXdOV15j1rZBM248kcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxG539p/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4349f160d62so25772865e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664676; x=1733269476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=JxG539p/bnkKA/TwZTCcEQ7syyPsoN4yl43pdhfBegBFA+PKgVZhZdVR2Y2mPySnMN
         ENWByUqYgO9C0WRp8eJJKZ9TGUjQ7cxsNerfLjnsbI0ZZzOaT3yNT6AO57SGRIwuPEqV
         C3nfzjSQzWW6H0r/Zxq8RGwJ6iRW2kSeVBl1RG7Rr9oRxmam6LW7eZ/qd6neMQqHWkxp
         Tw7ehbmIhzQ9d6GbgStisa8NmDzARED90SfAeJv+jbzYP5ndHUggVD3RiaA7NhS+m8F/
         /mRkY195lWjO9SHEntCsA3vS7V+RJO9gqqLyNGNE1pnzq8RZIDQ72mpEeGwVB26F00g6
         wJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664676; x=1733269476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=vypgF6hPX4MBq7UK2Ts0PxdsC/cxy8XfomAqJF3OD4+b9goEgNbK0ZDTGpwYM7+7tS
         /HQJdLJkNwRWXP5eOuMutf1lBUPA/BH5OFvyUNLE+DQMSfFm3FRBMD0WJ4NZViyuje/V
         KVwQ7ukdJ01OBmE9QZG8mxMul2CFjFzHVd+Wj57tsrB9WN8A8Sjj1kgczMdgEJpZcQod
         5bXhfDg5vNOoR7ZwAOsfHI8wR569b25/iIJGLZ4wuKe2NT/IO6VK/4xL1uFX+cUZTeZ2
         B4aWD+StCVW53npInARAAxVuDktu7vrCS2s9cCzoArj54YXnHjwK1ixeUtUVdyWRG6R5
         fTUQ==
X-Gm-Message-State: AOJu0YyBC4nZcgfRQ3binfZRpnI7D+RwvkkugMJbCDt6jo7tjv/NoaOY
	rYx8m3WgB81P+QQnSaj+9maDu6A7zz9AaeakshlaugJQngFsccOEypf1pgrUGaahg72dBnrgJ3X
	no6c=
X-Gm-Gg: ASbGncuNGa/qT5rXZFwN1d6pPMA2fIy11n1dnRsfh10tCdhfnCS94GncF18iWArJtPQ
	VR6z6I/V6LIRuOIMf/eEXmRMZii698dmhQgQAnDJZY3xBgeIRK7+9uk19RGTjv9jn0L0InJ68vj
	eZkREqy5UWkIFjo9Nxzq3K5SIjQhlpsDtY3mng8iIKMrggIp23WHQ5hJVuKigJPrSIN3GF4wOq8
	NUQddj9+RjO+IF3bAH/rUlNuTUt/gXgvDroHgesED4upcjSmlHZQhqk1Ic=
X-Google-Smtp-Source: AGHT+IGd+fjrVRUKvsVcA1pohdHvtSxuhDJA0UKE8GpD7PEO4QQLWsNHgyLqbxvvvkEfp+17KqBElA==
X-Received: by 2002:a05:600c:1d18:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-434a9dc694fmr9606295e9.18.1732664676497;
        Tue, 26 Nov 2024 15:44:36 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:35 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:29 +0000
Subject: [PATCH v3 3/3] driver: clk: qcom: Support attaching subdomain list
 to multiple parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-3-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

When a clock-controller has multiple power-domains we need to attach parent
GDSCs in that clock-controller as subdomains of each of the power-domains.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c |  1 +
 drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 7727295c57c8f6672d46d2380e1ff5ec2ac68d42..58a8397eefe51da237a4285d4e7cee967e19948f 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -338,6 +338,7 @@ int qcom_cc_really_probe(struct device *dev,
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
+		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
 			return ret;
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
+				   struct generic_pm_domain *subdomain)
+{
+	int i, ret;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		ret = pm_genpd_add_subdomain(genpd, subdomain);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
+				       struct generic_pm_domain *subdomain)
+{
+	int i;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+}
+
 int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
@@ -558,6 +588,9 @@ int gdsc_register(struct gdsc_desc *desc,
 			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
+
 		if (ret)
 			return ret;
 	}
@@ -580,6 +613,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -80,6 +80,7 @@ struct gdsc_desc {
 	struct device *dev;
 	struct gdsc **scs;
 	size_t num;
+	struct dev_pm_domain_list *pd_list;
 };
 
 #ifdef CONFIG_QCOM_GDSC

-- 
2.45.2


