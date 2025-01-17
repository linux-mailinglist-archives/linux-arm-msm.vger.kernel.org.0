Return-Path: <linux-arm-msm+bounces-45405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD58A15107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31ACC3A9BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D60D202C2B;
	Fri, 17 Jan 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCput38k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910E2010F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122058; cv=none; b=tCImlvJwKdNiOL2JPml3WJMU1qCOkUroFCqSYaMMNuQjjDKzuwSRp/ZY5L8TIyy7qoK4UEKldDTbZUuxejQh/EoxOYUZbUTxxi6uIbFssb10xRlP9LRs2k+EQYJ4X29VmmRzhHYwB1xrchHc97rTM11Rh0/rsufVVmGGcyKT5J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122058; c=relaxed/simple;
	bh=mMqiI/+I+zEagfKuHYtYK6UtY5ankGGl9IJrIWTvRH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOKji6Ug0sS08KgW2lCvH4IpIVHKXqub/6KuJfhRG5bUMybis1j82OSjJB+jvboSCkcPbjD8mWyre9IyyUJ7gClELBlajJvAXJ2lGz+aM35i9VXV1zZZcufdO52eg3lJQwvMynKvSb8Ino619c5e+CFPhvdFpZmCncr/MqtP2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCput38k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38637614567so1040169f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122055; x=1737726855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqLgiwkb25f50FFmindGDO9xj3DpwPWvWiLB7nut8us=;
        b=lCput38k635S6xJaKgADG7xUt+QbFWWqQNWADURs8diRJC5hVTztDA+wRwA7Jz6mAf
         1wee0ZUIme8cmiXXSaJBhJIaeGPX9S/Wb+mkzOsh4l4oxgk3ITiThU1WsEp1tDzP+a7s
         jvnl4MALG8FxK9TsgZl0kaepPyZPFr6Pg1zO7MucsPqT2XrfzLFKSjIhTx34ay4wHqF/
         JY0ngRSwMm3qjtkMW07sFu16RH6NRjNcAvAt5h/8wTFLYd19bHo5ALERaY2GQ7TtlFMr
         /kLxiPhv7RZDygINgamsdDE3n7rXeqlSLMNdLYabbJBbxa/GRAIjDCBE63b5vguQK8UH
         au7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122055; x=1737726855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqLgiwkb25f50FFmindGDO9xj3DpwPWvWiLB7nut8us=;
        b=Ryecaica6THsNd0D2GmMbcaeVXRZaynL18wH1jqpY0YACv9mod654U1PIDhSQXEsm5
         erUzJ+kclUcxZODS2WKvecmXsG8XY7/HHkrfNIU2S8ekAHXTeoc+BVikG+TlvLNDYwzj
         RwCpqWn2JnRyFwotspiJaB4H0/5ubPh9jeTwPRDuWOdsIWa65NfzGdtmgokY7+o1Qbzc
         7IsUd5VDkYuAKlEbIFxccpihml3runLqkUOo8OyuQzH0y1mLUpTvCDtqR8jmjImwa2/l
         /EQtH2fs6WoFJ5mQ2t4el9JngmTCz/IFUppJbBf5DyjOl14KJp7exN9FixGZ63m045f7
         F51w==
X-Gm-Message-State: AOJu0YxraAy3u73gzc/TVUWXP/CQzMRZvBlDpI5t7wZxXg8edSbMNnrF
	GK1uWIAiWOjeINSt75H8GDcI7P4sb69lA/Eu84UQNEXDDDfrWYJi/TA2fbSp8p0=
X-Gm-Gg: ASbGncs0FgNq3ExEJsif8epj09f3HDmljHTZQ0tz+HaBk1PIYlxJJCFuHpYIJzL3BgB
	H2Z6BFW2LkZVuxiSIPKQmwnV05GGB4QYw8/Os3BKDUW4BtlqnoLhpx8Ksl5D+dQo+l3AEA9K9Ug
	VsWMqsdmsWlNJVPiENAWJdcgbOz7Oq6apbmH+atisT3mlhQDvkjbkZgmgXGAOdXLJZhGQuLVUV6
	lo+lNo/ujGvaJFPnR9QUTpftJJ/I19t7La9c5ae3tA0nSdLq2mOp48Ftod74g9K0A==
X-Google-Smtp-Source: AGHT+IGaJSeW2w7x6eBG4XpsNAmWHIvhG8jsJzu3RDMO/gYbJM75+0vPf6DPLMTpEA3hk3sTOsZFzg==
X-Received: by 2002:a5d:4007:0:b0:38a:888c:7dec with SMTP id ffacd0b85a97d-38bf5675e61mr2124765f8f.28.1737122053112;
        Fri, 17 Jan 2025 05:54:13 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:10 +0000
Subject: [PATCH v10 4/4] clk: qcom: Support attaching GDSCs to multiple
 parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-4-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

When a clock-controller lists multiple power-domains we need make each GDSC a
subdomain of each of the clock-controller's listed power-domains.

GDSCs without an explicitly defined parent should be a subdomain of each of
the clock-controller's listed power-domains.

GDSCs with an explicitly defined parent should attach only to the parent
GDSC and not the listed power-domains. Any votes will trickle through the
hierarchy up to the external power-domains.

========================================
::  arch/arm64/boot/dts/example.dtsi  ::
========================================

clockcc: clock-controller@0 {
        compat ="qcom,example-clockcc";
        power-domains = <&pd_a, &pd_b>;
}

========================================
:: drivers/clk/qcom/example-clockcc.c ::
========================================

static struct gdsc parent_gdsc = {
        .pd = {
                .name = "parent_gdsc",
        },
};

static struct gdsc child0_gdsc = {
        .pd = {
                .name = "child0_gdsc",
        },
        .parent = &parent_gdsc.pd,
};

static struct gdsc child1_gdsc = {
        .pd = {
                .name = "child1_gdsc",
        },
        .parent = &parent_gdsc.pd,
};

========================================
::          power-subdomains          ::
========================================

pm-domain::pd_a
└── pm-subdomain::clockcc::parent_gdsc
    ├── pm-subdomain::clockcc::child0_gdsc
    └── pm-subdomain::clockcc::child1_gdsc

pm-domain::pd_b
└── pm-subdomain::clockcc::parent_gdsc
    ├── pm-subdomain::clockcc::child1_gdsc
    └── pm-subdomain::clockcc::child2_gdsc

The performance states will percolate through the pm-domain hierarchy to
the domains that handle the relevant states.

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
index fdedf6dfe7b90c074b200353fc0c2b897863c79f..7687661491f1fd5a3076c839c4f70f430783fc51 100644
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
 static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
 {
 	struct device *dev = desc->dev;
@@ -520,6 +550,8 @@ static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
 	}
 }
 
@@ -575,6 +607,9 @@ int gdsc_register(struct gdsc_desc *desc,
 			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
+
 		if (ret)
 			goto err_pm_subdomain_remove;
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
2.47.1


