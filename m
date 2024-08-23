Return-Path: <linux-arm-msm+bounces-29360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1A95CD01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04796289AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E312189B8A;
	Fri, 23 Aug 2024 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wt2HdV1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA018951B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417508; cv=none; b=IoYs6NuAzyP5w+KA0llNtzXVj2EtNk3KM3Fh8GwHNBbslrQCNWyslb1bu5sY8xu2rmB364r9yI9BlrkDTL2AoRIAofkAE6ieTJJ/QXmkmRlxIEPKmX68yHndN2WyLeJ4na18QqmrtDfnHOWjtoDhd1SGZRLMDnpAYGson0+OAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417508; c=relaxed/simple;
	bh=RaCHoWfcvN19DBMmkgIRc0NGUjytTpFgVMcU13mcxgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7tXybkYED1PRIThzWz2b3SddurR+kSmrfbCsiorjF3k+lHbZg7lsCB2OljGvDfz1zDaXWdA5gMeglOwcnTe8Wp1WksBbO6aa2LLsdl6xaW1Q7h5EjGJ5sFkN+xo0NVGfCfTkYwYw3gGTWi5JQXYEcxMgZLfeu7OoJcBXLGKBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wt2HdV1Y; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86a1abc05eso3659866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417505; x=1725022305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rp37AUE8o1pDdOTGLdrCW8KtmisO6ANjwH8PgBb0ls=;
        b=wt2HdV1Y+hpHDtGu4AZPY1gaQjH5BA43pu8GrqurKqPNSlmSGOIsL7UA3uNXKqMvy1
         V3CZ2Pn0K3rZqssB0KftZzRFMWFKPd7VmMuKxDJuqwbyrySnATjgpa0xcLst8zinsR4n
         eUNyCsX9ezBEKxt7psZ8dyQSFW5uX1InKa80iqqi1s7y7k8xwR1bqHG+OCRxDMJPx5Vu
         VV2pib7S8T0OargbhFdQopxYtXNlMlXBuzBCyOZjUBucAClgh34ccrLUlQ1zUf5AOLvO
         mpGzY+v9zoVnyXXTJ5LzikHb3TUT0MIId2ydVNMZcFFVi8R0Qn0C3L1/gqzURz1YQBZo
         UVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417505; x=1725022305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rp37AUE8o1pDdOTGLdrCW8KtmisO6ANjwH8PgBb0ls=;
        b=L6t+0gAKtmrC2N7XZ73lliPwaGSAUbsIGgrFRaG+tJ2IXCsrQArvrm1kyWhKeYH6tL
         kuOpMJZe8IbghwXJ3LNhSlQTEFG7K+HN0Y+QC9LWe0aTz3xDRuICWQnGg00ViyZKEBsW
         ZRUlmoczD8KiX3trzsVTYe8bXqqreZc33CKq+jwKoyuPX4z4wQMkmt+KfUc9JXvTzJmD
         zzVe8mI9uf/T8rongb8EPEccpIu9+EJHMKFUz6Un6k7UnpvN404FkXiTGnS1+754zlUs
         Mp0TzprVflLtUYTBZZHoFcQLZ1ah1zTgjjMVbeb9ZktNR+d5vfkyfvkg8YLLn0Pcl2fc
         8TgA==
X-Forwarded-Encrypted: i=1; AJvYcCVlSQ67Qogaq5eOiGo8C/oQTl+gTHRQVofeh5GO/Hi46i0ND9l1TjUPleqSuVvnLM1nubCATNrMBqoEu2QE@vger.kernel.org
X-Gm-Message-State: AOJu0YxlU7d1B/X+fXl0N/fGH+VODxyUmEhMfk0xaFKnGbZ6fj+PYz5N
	XJ814uHMnkz15MDd49p9TqDb702urTQn6XW0LErtx6JX4sooAhM9SwaPR8Afmco=
X-Google-Smtp-Source: AGHT+IE1+3Q98ogeUT94jLgiJMspBnSs1Bmg9/MGG8bMaWFikVo5szbklH8yaPLEJlsyUwI0svusGA==
X-Received: by 2002:a17:906:c355:b0:a86:a694:aaff with SMTP id a640c23a62f3a-a86a694abe2mr75972666b.1.1724417504852;
        Fri, 23 Aug 2024 05:51:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:14 +0200
Subject: [PATCH 10/10] pmdomain: renesas: rcar-sysc: Use scoped device node
 handling to simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-10-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RaCHoWfcvN19DBMmkgIRc0NGUjytTpFgVMcU13mcxgo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXNR2zayhDCmXFhzQ1RKmq8aC4JQfASOX82l
 qQyhlx44UOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFzQAKCRDBN2bmhouD
 1xL8D/9RUFSYlgRZQEabYs+Zlod9oIJejL78n+4Ll7xzEa+aucx3mi/5XlXocpJxNV+gOzHmnL5
 pTAKjf9vr2rrSCFpdxWqcebEDpOfdp3FhZVpBNUc1h/OP5bjr184cjhi7i9TuCDo/iVdB0pUXdN
 M76MCTdDAD/bgYmwRgVMQpXF1J769uZTGjSJmi58B0VRQhOhJgjmrSLchp8/NAEnWPwerPXMCkm
 eB714yX5DLHHI+JfhnayFx/N2/E534xyEO1HvsBvfioJrdNphfVPfe4xI/qOHupvYmd5t+/9Ghd
 in1T0ooZnRBOqqF/8HZO+fb5oZPBETF2hHD6X7fMDmFhHDfW6lReeoDHG+ru1B6TG9NLvU0x98u
 wrOOoAXHWLuo2AT/cJjkItEh9Q4T0t0HZ4GscFMohXEJ+GKyoOgFKiAgIBfVgaeJ9bfTpT6teuW
 zljMa7caswrosPMTvLgRiWDI6NIuUAP1HdpDhMSMerJwDdR3mM18CodSRTqDknlhCH8Tff/UyzE
 YQqB1Shvtr1g7dD8+6Ajdjhu72i65o1lOBEcq/i6nT6QV3efKKqIzTcF1WoXBmdjq5ZQQyxC71v
 yN682xplaXESoBHsCxOVmTmEK5SdClLG2XTLvLhB2ErFuaqOK91wtibYaqRUCEPcNvHLuNxW/fR
 7csJsV6ahkbU4zA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/renesas/rcar-sysc.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index b99326917330..da169eed638c 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2015-2017 Glider bvba
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -348,12 +349,12 @@ static int __init rcar_sysc_pd_init(void)
 	const struct rcar_sysc_info *info;
 	const struct of_device_id *match;
 	struct rcar_pm_domains *domains;
-	struct device_node *np;
 	void __iomem *base;
 	unsigned int i;
 	int error;
 
-	np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
 	if (!np)
 		return -ENODEV;
 
@@ -362,7 +363,7 @@ static int __init rcar_sysc_pd_init(void)
 	if (info->init) {
 		error = info->init();
 		if (error)
-			goto out_put;
+			return error;
 	}
 
 	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
@@ -371,8 +372,7 @@ static int __init rcar_sysc_pd_init(void)
 	base = of_iomap(np, 0);
 	if (!base) {
 		pr_warn("%pOF: Cannot map regs\n", np);
-		error = -ENOMEM;
-		goto out_put;
+		return -ENOMEM;
 	}
 
 	rcar_sysc_base = base;
@@ -382,10 +382,8 @@ static int __init rcar_sysc_pd_init(void)
 	rcar_sysc_extmask_val = info->extmask_val;
 
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
-	if (!domains) {
-		error = -ENOMEM;
-		goto out_put;
-	}
+	if (!domains)
+		return -ENOMEM;
 
 	domains->onecell_data.domains = domains->domains;
 	domains->onecell_data.num_domains = ARRAY_SIZE(domains->domains);
@@ -403,10 +401,8 @@ static int __init rcar_sysc_pd_init(void)
 
 		n = strlen(area->name) + 1;
 		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
-		if (!pd) {
-			error = -ENOMEM;
-			goto out_put;
-		}
+		if (!pd)
+			return -ENOMEM;
 
 		memcpy(pd->name, area->name, n);
 		pd->genpd.name = pd->name;
@@ -417,7 +413,7 @@ static int __init rcar_sysc_pd_init(void)
 
 		error = rcar_sysc_pd_setup(pd);
 		if (error)
-			goto out_put;
+			return error;
 
 		domains->domains[area->isr_bit] = &pd->genpd;
 
@@ -429,7 +425,7 @@ static int __init rcar_sysc_pd_init(void)
 		if (error) {
 			pr_warn("Failed to add PM subdomain %s to parent %u\n",
 				area->name, area->parent);
-			goto out_put;
+			return error;
 		}
 	}
 
@@ -437,8 +433,6 @@ static int __init rcar_sysc_pd_init(void)
 	if (!error)
 		fwnode_dev_initialized(of_fwnode_handle(np), true);
 
-out_put:
-	of_node_put(np);
 	return error;
 }
 early_initcall(rcar_sysc_pd_init);

-- 
2.43.0


