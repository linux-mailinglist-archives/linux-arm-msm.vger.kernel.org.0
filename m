Return-Path: <linux-arm-msm+bounces-41536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF59ED2DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16141889FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574ED1DEFC6;
	Wed, 11 Dec 2024 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jgj6aki9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493D1DE4C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936082; cv=none; b=b55BM+7eoQVaJLUT3/9fCd7RCZAcZJGmGtg6597ploOg2+QUcluW53gRHRakoiFVTTisFhjD2VIWpGUOpXm14WKfSB2e/F2y8+NftjU8m9HLYnojCzfcfI7e0yZ7FU4GhVdLqHPqcLXWzwInSyvnlj66gq4TsYwbNjRuusZhOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936082; c=relaxed/simple;
	bh=efeXa7kgYwb3mHLsGpDYh6uMOUyyIgGO03EJS/PZJpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moCdLVykV4Tx1WPpZm+/BgZREUopn+FnkLwQe3zp4HzWlM9cCMu6bLJ+QD+Mkn6uD1lJe9GxvEjlvpxKocgtS7fgG8/LEuEacRPudXRLdPzIIaqJ7ZyF8L9GPmcHvZRm63MXDGAWl/zKbFmjJiVdl/1nLkTOgLJRSD4MDso7NjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jgj6aki9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa67333f7d2so632787666b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936077; x=1734540877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LT4Y4IAOHXINu1wqdwJVPtJlO3Wbe04qhOh0Y3ZXAqs=;
        b=Jgj6aki95z26nMzwi0wlPg0FiAwbwzp5DngkaDce8ORexPnDi+5Ydx/gk3cku6kQLq
         jP1Ab9OILcZ3NnzgJgD1Ys6ZOZ1TZ8fl90B+n6jKM9xksv3PiTtf31Yt7CRQRMYCl/pT
         uQswnENZMID7hyLDQlbxrQiiJm2bbBbDsmqU1aMEL7BMSA5VZ1GpB8WlEa5K9zA6PcyH
         EgYLtysryVNhr1FDOLhecllcSUTbSyEKs8NdkC2skwI3qH7rkOO5BHPOTG0fgFIsROlJ
         gunyb6ZCOstxhBg8ewVtKQzxf/nCb9EXrC8yzYne4HOApGw+n8xIKI4LyVtWX5sCPoAk
         7/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936077; x=1734540877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LT4Y4IAOHXINu1wqdwJVPtJlO3Wbe04qhOh0Y3ZXAqs=;
        b=idNGpNvcfFyI+I/nNZoF1rjb1ZLKRKQphqp6Fc+fs1qOpgbDlol1/Qf0OSseb8FLs1
         o+pbU4ebnGu+IJTBQz2GLLJWCcrrrx07vqZGhzWzKmgp2oG0PxPI/MtwfclwLF9iolts
         MW5AbSUZ+a74jWhiQOyYCZkuaSp9eS5CuwqRJZwBhHt2C20IjwdRSjRPjX12ZaF9d+5U
         +ecGHpBACsDxzm8swNvn/sfokl8hpzNBXYwSjNuqEUw6sF4khVr+txe1lUUXT9Ze5i+W
         qLhIuJy7Mu+Bx2fvRdJLe++Z+Euz3nt2UNWgkgb58kWhlzwr+3B6hqxAi/A3bZvV9FNB
         PWMw==
X-Gm-Message-State: AOJu0YwTe/RgDCMu3dPloPaLZnwxBB6QsuS3vJITxsK0AqNzMSGKo1HI
	jxGQ+hn9a81MUzi/CI87Ld1lHcbIurb11Toj/bnMt0DnhmlP57Oi9r8I2iF1ESs=
X-Gm-Gg: ASbGncu8gge+SlM7MfZ40Erz2dfmHq0rMYC3VmnvW/ysRSnF/E4ABN2h6LYQOsoZQXT
	NnI7vXnhnsNHNOJwbAtrV9iBnG2ZshfCuIjejAo/vE8FSAFr16l8DRp1Mk6sTMeYO0e9uacIjW7
	5EqtyE78XQfw3ybc0fpYy3fXyiCy3/UyAac8pOPE9mql/DERrMebnS1DNa3wUe7lK/BIqbMCk/d
	9zj5oXkRKeGtr2pAIZmpXqW1/xySQEXAS5V9dTO2XmNF2Is/Rpa4kjW735Dib8=
X-Google-Smtp-Source: AGHT+IG2KfzjXRF8C9q1+x+mUMJK8e9Aju/8Okxr9ZzQ+192LiiZ+ttwURACIw3KklZE95rySqsAsQ==
X-Received: by 2002:a17:906:3ca1:b0:aa6:9e40:ca66 with SMTP id a640c23a62f3a-aa6b11eab02mr318706266b.28.1733936077472;
        Wed, 11 Dec 2024 08:54:37 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:37 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 16:54:34 +0000
Subject: [PATCH v8 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-3-5d93cef910a4@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

When a clock-controller has multiple power-domains we need to attach the
GDSCs provided by the clock-controller to each of the list of power-domains
as power subdomains of each of the power-domains respectively.

GDSCs come in three forms:

1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
3. A child GDSC which derives power from the parent GDSC @ #2.

Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains - the
power-rails attached to the clock-controller to power-on.

When dtsi::power-domains = <> points to a single power-domain, Linux'
platform probe code takes care of hooking up the referenced power-domains
to the clock-controller.

When dtsi::power-domains = <> points to more than one power-domain we must
take responsibility to attach the list of power-domains to our
clock-controller.

An added complexity is that currently gdsc_enable() and gdsc_disable() do
not register the top-level GDSCs as power subdomains of the controller's
power-domains.

This patch makes the subdomain association between whatever list of
top-level GDSCs a clock-controller provides and the power-domain list of
that clock-controller.

What we don't do here is take responsibility to adjust the voltages on
those power-rails when ramping clock frequencies - PLL rates - inside of
the clock-controller.

That voltage adjustment should be performed by operating-point/performance
setpoint code in the driver requesting the new frequency.

There are some questions that it is worth discussing in the commit log:

1. Should there be a hierarchy of power-domains in the clock-controller ?

   In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
   should a specific hierarchy be applied to power pd_a then pd_b etc.

   It may be appropriate to introduce such a hierarchy however reasoning
   this point out some more, any hierarchy of power-domain dependencies
   should probably be handled in dtsi with a chain of power-domains.
   One power-domain provider would point to another via
   dtsi::power-domains = <>.

   For the case of GDSC on/off there is no clear use-case to implement
   a mechanism for a dependency list in the GDSC logic in-lieu of already
   existing methods to do dependencies in dtsi::power-domains = <>.

   A defacto ordering happens because the first power-domain pd_a will be
   powered before pd_b as the list of domains is iterated through linearly.

   This defacto hierarchical structure would not be reliable and should
   not be relied upon.

   If you need to have a hierarchy of power-domains then structuring the
   dependencies in the dtsi to

   Do this:

   pd_a {
	compat = "qcom, power-domain-a";
        power-domains = <&pd_c>;
   };

   pd_b {
        compat = "qcom, power-domain-b";

   };

   pd_c {
        compat = "qcom, power-domain-c";
   };

   clock-controller {
       compat ="qcom, some-clock-controller";
       power-domains = <&pd_a, &pd_b>;
   }

   Not this:

   pd_a {
	compat = "qcom, power-domain-a";
   };

   pd_b {
        compat = "qcom, power-domain-b";

   };

   pd_c {
        compat = "qcom, power-domain-c";
   };

   clock-controller {
       compat ="qcom, some-clock-controller";
       power-domains = <&pd_c, &pd_a, &pd_b>;
   }

   Thus ensuring that pd_a directly references its dependency to pd_c
   without assuming the order of references in clock-controller imparts
   or implements a deliberate and specific dependency hierarchy.

2. Should each GDSC inside a clock-controller be attached to each
   power-domain listed in dtsi::power-domains = <> ?

   In other words should child GDSCs attach to the power-domain list.

   The answer to this is no. GDSCs which are children of a GDSC within a
   clock-controller need only attach to the parent GDSC.

   With a single power-domain or a list of power-domains either way only
   the parent/top-level GDSC needs to be a subdomain of the input
   dtsi::power-domains = <>.

3. Should top-level GDSCs inside the clock-controller attach to each
   power-domain in the clock-controller.

   Yes a GDSC that has no parent GDSC inside of the clock-controller has an
   inferred dependency on the power-domains powering the clock-controller.

4. Performance states
   Right now the best information we have is that performance states should
   be applied to a power-domain list equally.

   Future implementations may have more detail to differentiate the option
   to vote for different voltages on different power-domains when setting
   clock frequencies.

   Either way setting the performance state of the power-domains for the
   clock-controller should be represented by operating-point code in the
   hardware driver which depends on the clocks not in the
   gdsc_enable()/gdsc_disable() path.

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


