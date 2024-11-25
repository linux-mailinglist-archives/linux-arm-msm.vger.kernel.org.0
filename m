Return-Path: <linux-arm-msm+bounces-39005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF09D79A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F56B162A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 01:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C45712EBEA;
	Mon, 25 Nov 2024 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t44uWrVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F0BA50
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 01:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496422; cv=none; b=Oc60vCoh4dF0QIRzMyifXNkTtcyarHBDEp72MjoHuJvqKH6Wr0PnebvXdWk8nYd8dGYmDVeKHLgvF75t2I6lyxPcwS+LgwqavSMkoyPq7qgb9tGybtVnJbEAJ84DCaUv1suO8QXGc/QswiOUheKozDSrSs61JejvqJ7Vl4x5g1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496422; c=relaxed/simple;
	bh=nVHGEOrRUdBNA5gRWj0sFzT9xtelcZ3Fgi3g7ZZhzww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsYVf5sFeNe9RHnTlcVzM4lkyGF7uqMB+UhWX2nSlzQgT2LwMS4IPlqkDWxTA0ISFg0lGRL3UsCRuh8u1PeBeMoSJWPuwYA72OvAOiKN7bKlc8odzyjlBUUprfHYCVNSC4BS87lkAnZJEgo4tppSf1X0QybJyGGunlEyzCqq4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t44uWrVu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4319399a411so37306345e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 17:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496418; x=1733101218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=t44uWrVum9Ut576va3ZJx5qy6asn0uTI389pmQ7Sqomh5HnIj62sDIikyVcM92L+kX
         8ZavPiLQuKNvOnrFwvQ2kFpcdAPRTHLXEKx9GTOKB950XeTRtEE561hEa/cGIg0zsBVe
         WKUPoagDUbusnNCO/kXVqlJvKWQotOml/hUW1F0TKleOQWwjDAGOp/kXFqU4QW5emrCW
         AI4cfAzhpnQvGPxpY4CSUNE0CufM7algpPLCdALnJ8QabrDd22f4XGTk6aa225CRs1i4
         7oVCpGhYQTwSlOEpZFzV1+7Baqt0IwAABDl+kWOl8BSm/J5dy/aafNmuLhb4YwwkVKwb
         PkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496418; x=1733101218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=oMsxiNMsnVJm7QOJNm9oiOaFtu6+/sOO/WHMGLNLN9JFnjYnnPRH0TGz2CydUVhlb8
         yAVYtrU03g8xnv9MNCexwNgA8wkA4+02seiy4QUwtkw3ScMUsPMDA16Ak4uK32+Y8Cr9
         bAZ3h/z+46a5ln0aOn9RkerxLBrQYdCyzHspUXbrBPwXlh7nAtZ/fDK+zSNQhIxnMcbq
         TThcX2TtQPBKckrF9WT0PwIlPz1xk6ksSAT37f7eQ4zVMjIno/HKoo3E9HCRykSMGemM
         OnQUvOtcuEnmG9WWxs8/7GGkUILeIfoWVzpv2tVvpB7776hQXWXV+n1riIRCmeJ+aV1V
         vJuQ==
X-Gm-Message-State: AOJu0YxP15cXkXhr8+adau9Y4fr89o9mxkhe5MRudC7jFIwZYxe9uwPK
	ZYtE/jtP/olFvj0E2ibrqEPR8bCfPa+i2WGax/dsOZ8SRye5/qTYJRgMy3P13+HJ7eext1SAoxv
	Ao/0=
X-Gm-Gg: ASbGncuSVC9RVWhUBjcoLM8TRuyLUMGenfyxtHh5/e6jwkYgy8mQF8eyZFntNMwB1Gt
	/Xc+aO78qUOmKx5MpJvEjvEHWA5GEDwD9xjV73lizVe09ubNFpZRMq3ajMuFxxtPlLS+iNbBZv3
	BaR46TJCtJmJPuK6gUf88YuHbx88w5MBuFuPJBeVcEElHOUUNHAe59hPNMNL58avZQ1AtXnAZ8G
	DIKmX1RkQ3z1RjRmWBHFLNzuTt5kmH8mliRaUACCoHdapMvkiV4YQj40j8=
X-Google-Smtp-Source: AGHT+IEAGlCilG8EQiX4eHWR9jCfgHPz1anIKZ3sLAgNmaQ9WHHp9Sq1Imvv7aOLcmrzWShE6SCeTg==
X-Received: by 2002:a05:600c:63d4:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-4349c60c065mr33631055e9.11.1732496418308;
        Sun, 24 Nov 2024 17:00:18 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349f0ba652sm24125125e9.40.2024.11.24.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 17:00:18 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 25 Nov 2024 01:00:14 +0000
Subject: [PATCH v2 3/3] driver: clk: qcom: Support attaching subdomain list
 to multiple parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-3-a5e7554d7e45@linaro.org>
References: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
In-Reply-To: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
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


