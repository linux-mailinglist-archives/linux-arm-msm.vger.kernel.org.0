Return-Path: <linux-arm-msm+bounces-29352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779195CCD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A031F219C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076081865FD;
	Fri, 23 Aug 2024 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STdoBzG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0151849CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417492; cv=none; b=pcseUhfzO0Mam6YDKTXCq2h49RLZ16RhSXZ8kr4Bq2YTM7UUrEgFVXxLKD3Bmu3x4UTQ1ZyeIl/UpFdgy16uTdAcJW0o9BeIr7BQZTBX4pgiA8CVRdrCsqDMad5Yc9AbVMLuEMdBgp4H1agQSilkPS4CVris9pGfi/OpgRiQcag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417492; c=relaxed/simple;
	bh=iAvSFaGsUDYZxq4WQx5Z23ymXzI0A4MTtwCWNichnqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuLxhgXhwH6P+q7kGkpCJypI+zNwOOn2CiAvCO1l9o9gq9/2hA+G64FUXH10V1NHjF6qfmJir4LGnBbqYw21LhT62YA6m6IfhTJgRoZfEdNKVz7PFsIbDjLKWqLBOUiITad7qJZFNz1wrAwX/3ulLWEFUpC77ou57uP/oR6hUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STdoBzG4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bebc865578so325125a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417489; x=1725022289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqZoUlf9FXxVw5XTreRUZPBs7/v+HjBAPIDWEHMdLrg=;
        b=STdoBzG4pgaJMQYn7GrlfvoBSaTF/wit+2Hgz6fFkj15NYG38KnPuMcJSvF8gnth8D
         zdAeIZOfVMA/mz1Lf57v8HcoRbHu7RMaDQxStjhFhFqG5F5HZTu0f9nU/qmogeNEbSuM
         e30ZNoyMzqK7EJ+LkazL/AC3KdyALI6G2v7jUU6s0sBpYcFQCXesBGrqe8Zo1RqHRDZf
         Z0xJHpiQtrvkx6EqCvtTIHL4Fh33CEzDi6Z5uCMA9n9SSvtNG26NXLb4ZCexXJ+Rt1uT
         qHi+6IAQwMPOzlErpnnFOWGiKT5wZ3WgoOYoTJTRvdUDGz2Iup+nlJrwUtJKjg+dUcmJ
         Jmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417489; x=1725022289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqZoUlf9FXxVw5XTreRUZPBs7/v+HjBAPIDWEHMdLrg=;
        b=Zpo5NfBi8y+7n38YY6zfhdw2K6aM7h2OuvyelfBzix4eet1VrqJVMi6hGP1IUTFG8M
         bxaGv4nzZ3sRC+q11/HIwqCKN8Xwpe7UnC4ml+Adb6S2XrxT5gXhRPmhJFdNM+HpNAB0
         KsXP4zbfJVyDyYi4qZ9m1xi1MOkxcJzrHSZwVLo8bHMlLiQoqLK9jZdabUrji+eD2igE
         RjCghM648hfCAMyJc3TBoULyQesCStpTl7GiGMV0EwPUyf1Bplx1N5vg5LVsUJhlJ1H9
         8by1hEoaeiLjLO3hSkCq5+WZiQsGmv5x/GQCHQOoY+TULTUPRMh5QtSe5rMSy9CzEBDS
         fyEg==
X-Forwarded-Encrypted: i=1; AJvYcCX/LLTYqMb46dDBpx8h2lGueZIVBuEiQj7TRRjeZILcCrpyeoh/f+XlEfhasKnZOQlfTeeYgomZlJP9XqWe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6bcG/iNlUctKr04yKKrlkRavgJF/k5ATQ9zGdwHfzMf5d/3k
	MVnOhhHBbpcbK4gMwZG5NnWXEbJdt42uwd1+6Y8Rjo/fhdTkPKM+1JuPagseqnA=
X-Google-Smtp-Source: AGHT+IHFhimXCeBq1Wbp/Qo8sanPB2U9J/NJviX3SdYBYaOdu/gpBKluIRkFnIoy6jGG2DDcfdAykQ==
X-Received: by 2002:a17:907:9724:b0:a7a:a33e:47cd with SMTP id a640c23a62f3a-a86a54b6508mr79978766b.8.1724417489316;
        Fri, 23 Aug 2024 05:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:05 +0200
Subject: [PATCH 01/10] pmdomain: rockchip: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-1-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iAvSFaGsUDYZxq4WQx5Z23ymXzI0A4MTtwCWNichnqc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXEfKtBsZmUp5ta2YLZwS3sUTURaeY/K91+s
 GdqnZCFccqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxAAKCRDBN2bmhouD
 1/miD/9sqb/VfS0E5eSdkqMTP9BUn0QyIpD/1zkhakVYkcdbfbRO1J4fbIQy6ivtt22yqA0cF/E
 dapzg65Y/ms6uu6SOMeDn8A3Ux/v0H11tSSsjxwPIUvshnIBtSpUICJ43/aT7HrB1AZ8KXj7303
 fjKLWh0M/kXCNLEmgmnaZla7eT5SyWxL86w7s/LmQVmf/v9x6481XcJMxvKFTiyulEWiMLl7O39
 SM/1GdybwLP4Mrwl2CO4D02fr4QaUP6pwp5yfKLSVVJcqT7ojS6mnDtvAsmUzfy5v9vGvEdjZf4
 XcGVejBE/gQHe+SDiyCUztR+2Alc2i59HHAMvPTl+E3TRLY0IeY1J71Qr0RIASGsYrwJa2lv6+w
 eou5bPoQBuM2UY3PWz8wRJdOlZlN0ppHYZrz89L57/U87bW/iREdkNPk9C9EkajVT3ZTsopV7Ch
 QuIh63mZ00thXJ68Yekopv1G+3Jyldicvc1pnAAmcmNk9/wIDdjN+pkGTWXgjX2TapOChOus7zI
 YlfIvKyDakxpFuy0n/iCLdXHrHEhSzRhci7v65ixuLvU3R6kHc0ltTlQh5QsKtYMF7m7aIVWfAy
 x6UXjngSQQY2qVflmHpNw+XsYM/7XNaeScdPr+P+xsJbEPVcmANtg2SAroolfyRltcIAgh3rngg
 yBjt0SYdMpyHcZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() and
for_each_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/rockchip/pm-domains.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 64b4d7120d83..5679ad336a11 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -804,11 +804,10 @@ static void rockchip_configure_pd_cnt(struct rockchip_pmu *pmu,
 static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 				     struct device_node *parent)
 {
-	struct device_node *np;
 	struct generic_pm_domain *child_domain, *parent_domain;
 	int error;
 
-	for_each_child_of_node(parent, np) {
+	for_each_child_of_node_scoped(parent, np) {
 		u32 idx;
 
 		error = of_property_read_u32(parent, "reg", &idx);
@@ -816,7 +815,7 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 			dev_err(pmu->dev,
 				"%pOFn: failed to retrieve domain id (reg): %d\n",
 				parent, error);
-			goto err_out;
+			return error;
 		}
 		parent_domain = pmu->genpd_data.domains[idx];
 
@@ -824,7 +823,7 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 		if (error) {
 			dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
 				np, error);
-			goto err_out;
+			return error;
 		}
 
 		error = of_property_read_u32(np, "reg", &idx);
@@ -832,7 +831,7 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 			dev_err(pmu->dev,
 				"%pOFn: failed to retrieve domain id (reg): %d\n",
 				np, error);
-			goto err_out;
+			return error;
 		}
 		child_domain = pmu->genpd_data.domains[idx];
 
@@ -840,7 +839,7 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 		if (error) {
 			dev_err(pmu->dev, "%s failed to add subdomain %s: %d\n",
 				parent_domain->name, child_domain->name, error);
-			goto err_out;
+			return error;
 		} else {
 			dev_dbg(pmu->dev, "%s add subdomain: %s\n",
 				parent_domain->name, child_domain->name);
@@ -850,17 +849,12 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 	}
 
 	return 0;
-
-err_out:
-	of_node_put(np);
-	return error;
 }
 
 static int rockchip_pm_domain_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *node;
 	struct device *parent;
 	struct rockchip_pmu *pmu;
 	const struct rockchip_pmu_info *pmu_info;
@@ -918,12 +912,11 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	 */
 	mutex_lock(&dmc_pmu_mutex);
 
-	for_each_available_child_of_node(np, node) {
+	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
 		if (error) {
 			dev_err(dev, "failed to handle node %pOFn: %d\n",
 				node, error);
-			of_node_put(node);
 			goto err_out;
 		}
 
@@ -931,7 +924,6 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 		if (error < 0) {
 			dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
 				node, error);
-			of_node_put(node);
 			goto err_out;
 		}
 	}

-- 
2.43.0


