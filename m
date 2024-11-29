Return-Path: <linux-arm-msm+bounces-39584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7AA9DE6FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ED02B23387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C5219D8A0;
	Fri, 29 Nov 2024 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXB6P5ax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302219CC36
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732885710; cv=none; b=UbOOXMjRm4Y9fJfbsl77cBIC4w1B7aho97BVypH5HtYRyr/RZtGCpvR0jk9TcBGdrG/iHQEr7FKaN7JAW5rCVscQGMu7P8Skw7MNXTbv8UmbKowYvq0PF2rJUQvwxBiVeKEqBF+erER/WgvI6PzY9lfvM6YcWa6lp8Z8X+CrrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732885710; c=relaxed/simple;
	bh=efVa4M/CLkYbXoZWdPM0C8JxkwfrxcSLyzGsT8tYjCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMyLpK/AKmrgTqXeIO3nRMxlN1bb6oFb2TlIfz2APnlwEWcIPEESxc7DlyVuUKH/spLX6ynvX6waYHMkkFFe1OxO4gm7bbJyjfCZM+ZUJs54i0qUkILkAFCvBNEqM2dixHci7170ASaYbAMGghCLhkkvkczFgmbrXum5HbSrqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXB6P5ax; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434aa222d96so20575955e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732885707; x=1733490507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pL+8KH4poUu1Hf/aDMaYYmGsu+QOmH/USEQcuPWz5Q=;
        b=oXB6P5axnjhE28AJOJQl3k51ENHjziCSOQUDrOIDvXR/MHusHXzYKWtXdvhEMQJUqv
         ZObD7lmk2eejy/wLUrpgz3z5tEWTSGL5W8JaHA/pNV/0s93CY0BbrWgmHHncikwky12D
         Bd8g/cI6cy4Z+R2sac4eIE3j6rv/CCGujbJnelwTivHRFDVYCG3+mD7wVjYLPvCG7d5V
         ezRWx1qFvEmCTaPLLNgpBP6O+WF2rtduB0s95SJLZv/NzhyEsNByUAWfBRt0mwNHfoIN
         vg75Np/YILqJmlT8UM5ip1e9itrusOX2qgO18wVtaGMszMSUgL/1RbOOo5kwremIABKd
         a+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885707; x=1733490507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pL+8KH4poUu1Hf/aDMaYYmGsu+QOmH/USEQcuPWz5Q=;
        b=oHKYCqWEL5rQkhfcXZ+oFJrfpB0gmALkMRORaoUGQykfy8IZfqAhcyNSa7xrBgaU3M
         cfvml2nDg2CvYVp3qqnNfSlpP7L07joaVMz3E92AW60igIBevEMSKm8s1LByTaa+Y4zt
         e9qsNqFayce6MsUXZq0mOy0dDDWBykcmuys6Jgu/qMNy51LWmiGPAvpJGsehhuM7lNpf
         BAiTugJM4sPKian+CSnA9V7R1JgcuHaBRHJVjNXs7HXWVZuGSf+lms2q0xzHC6XWCWc1
         Q9xc30fTj1SeP8DQQUvkJrisGvez8lBroiJatIBV/4yCBaYNF7Iekl7w+aMVIc2jxJDE
         pOOw==
X-Gm-Message-State: AOJu0YwV6Bx+7UxEuW+9YjHVIs0mlqCwUbMX/ViHlRCSIMYbxuKY5oI/
	vj2G9UrE7Y+Y6WcAOWBvopS7jPSJ6Yt7cnXCCmU+XzM5cxS6EgcI2e82fZtHhxJ+uEu2yQfTTUV
	KTGo=
X-Gm-Gg: ASbGncsRZHKm4EDvit2dA7Q336tFCdChnXXR2HVH+3uxsheTpbuuSOOhOzFZ9LP/Fux
	b1+52dnvU7hSGI8ouVLEbIlcGjQXcmtVmTpn21guk4CP3sng/kpuA91XQCe8R0Z+ZyVnBV2r8Pf
	f1+LIuyxWz23Fu5vX/1JbkiKK0mkEyYxjpxv8617hWjxo9cE8oVVqXSkNQjUIwPUyMwYYSHWOOk
	rvD5TDHajoC/B+9rEZjHFxlwanNs65bhrw63pIBAdd3B79ZJJHZEZKHtJ8=
X-Google-Smtp-Source: AGHT+IFqnjxL2YfPL0Ab/kKdB7w/mt5G61ptnPVKhh37kewWRZYO7G8+Fwcib55Ku68BT43tgDxvJg==
X-Received: by 2002:a05:600c:45cd:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-434a9dbb631mr115140325e9.6.1732885688561;
        Fri, 29 Nov 2024 05:08:08 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm86228395e9.22.2024.11.29.05.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:07:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 29 Nov 2024 13:06:49 +0000
Subject: [PATCH v6 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-3-24486a608b86@linaro.org>
References: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
In-Reply-To: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

When a clock-controller has multiple power-domains we need to attach
parent GDSCs in that clock-controller as subdomains of each of the
power-domains.

Testing on the x1e80100 reference shows that both power-domains need to be
switched on for the GDSCs in the clock-controller to work. Some open
questions remain.

1. Should there be a hirearchy of power-domains in the clock-controller.
2. If there should be no hirearchy should the parent GDSC inside the
   clock-controller attach to each power-domain in the clock-controller.
3. If there are multiple parent GDSCs in a clock-controller do we attach
   those top-level GDSCs to each controller power-domain.
4. Finally should performance-states be applied equally across those
   power-domains.

It may be if we see more clock-controllers with multiple power-domains that
some mixture of these questions will need to be implemented for specific
hardware. Right now the approach taken here is to attach the
clock-controller GDSC parent to each clock-controller power-domain.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c |  1 +
 drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
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


