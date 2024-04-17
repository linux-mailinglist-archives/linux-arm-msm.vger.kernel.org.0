Return-Path: <linux-arm-msm+bounces-17750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F88A8C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BAB5286527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755324C634;
	Wed, 17 Apr 2024 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9qVxFzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C3481AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384093; cv=none; b=P38sH3BYJUGZxsTcfb9KRBkeeSCD1Qn9Xh/gZWT+SmmdhVMske1nIJhs1/8tnxnmnJeZL/WAy+oOfrJgLZjLX+w0Ibn2uziKIRCEnK4onM1JhrtBmPjdcSNKDcQ60sZ+5mV3l0XkPOQ2aX/O24x/2IFLzuqIrJBKBeZL5NNlTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384093; c=relaxed/simple;
	bh=JgE0pLWRTv3liz7sG3qb+WlIgraYdzr6rzGEiGnF5I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgkYZ+wEKjY9LqrDAjuXO5e/a8YPWLaPjw6MhaKuXoiueks0W0BPxp17/AjC6JJl5pMjeR+ffGldaLeBQaFLAnmfkJlQNI2Qox7Bacp1CS71lskXze4ZI2rgcuzDcviYcf/G24UPnlOL1sw9GZ8oD/9WUvgePbjC1UMhqIbptCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9qVxFzo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so1990662a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384089; x=1713988889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ik1QcwFkKnesUoCKrKTfZ744eQhYqC76PyVF8lARPM=;
        b=A9qVxFzoe0g6j5s1SWEkig3vJR/5ZzvnKEzax7oPcbbp1l9rhGLqDqApq4x0sfMP1D
         fMkw0CA5CGxPgVQXCHMRo3FPj5tuKNbdeMV3c6qFqzMVZTVNVqAdejHiH2J53IYP6vYD
         HI/qY489N4BudlIiLwrHcwJncVxficJRw480hzLpXM6SFd0SNKAFKSp3A5COrS+oIBHd
         tmiSNEcqHL+JAwprWWV51vMFrlKmnXo1Dbxr78JeY+6KIKrC42obUtmOZ2uR7x/0jDF+
         7hCiQHcNlcPAJ77CHorkqpIKubFgAnjXhLwwHHgrMJHdPAvDEuLv68skxeOUlL/Kx92c
         3Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384089; x=1713988889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ik1QcwFkKnesUoCKrKTfZ744eQhYqC76PyVF8lARPM=;
        b=M86utGx12dGTIFMJnYrjgMdW7Rq5uImzttU4rigHSn/CggJwY/ZZEQLBObTk19VEGx
         YluP3TQQ57w5d//d/BBSwtAd91QuHPl99Ns193eaJYNe750M2YW3mMXYER4k05aUbyfk
         ZlSakbdIV5a8o5iZD+aVF1aIyiIC2+zTjrJOlVkZRMLDeApOu+6RjxZ688pbyRLSD+vm
         gxAVfv0oGfhFBdmq4sb/3pzV556th6i0x5Wza9HhS0j6V6jezBTvkTokmlPOFSMbncLD
         0C7lutkJgAMBYweUIm1/3nR7fQ5a8m5EBIcfdzR4gSEMK+ysn4d0A1s59ORd0syJki6C
         kQpg==
X-Forwarded-Encrypted: i=1; AJvYcCVghX2OsCa4B5RcDEs8VUrDJn0uBJvzd9oGkx7KFZaFGqc8thczIJKm7bO7NB1KZMbz3js9y+joXKksY3wpUj1h2xQSKxLQgoS9UFRxBA==
X-Gm-Message-State: AOJu0YxNgoNaDTmb5odIZcOdXW4zY45WzFCDzzn2UYvyijH1ZOpQd6yk
	ZhNuaTrtsm7PHFLH+Ku2bnMc8V6KP0nqgrMz+P6ePsN7D6QMoklmz+MGJTcQHvJ5WOKLzg4jYvw
	4
X-Google-Smtp-Source: AGHT+IH0ADVjOSm46pm7JjBY2G41SJgsx0GYCr4kfnbaMkRcZph7J0C5UHNbVGDyRkwCgDxixTPbbQ==
X-Received: by 2002:a17:906:33d7:b0:a51:c62f:3c91 with SMTP id w23-20020a17090633d700b00a51c62f3c91mr145681eja.21.1713384088938;
        Wed, 17 Apr 2024 13:01:28 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:57 +0300
Subject: [PATCH v10 5/7] spmi: pmic-arb: Make core resources acquiring a
 version operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-5-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8178; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=JgE0pLWRTv3liz7sG3qb+WlIgraYdzr6rzGEiGnF5I4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICqIeZOQ/UFnoQfy8FF9orO8nCgmRRZlXvP9E
 obaa5rfUNyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqiAAKCRAbX0TJAJUV
 VnrHEACcNk9YzKjklZVvURP0R2ebjLmBuVNrEpPeJWAK6M8jxodrHRei7dQWJjTjPknRP7tKwuD
 lUedljsovk4q7UZt4yeX6kIbH0zcxppunqWB6ri3PA0jYP7BWbZ+w4oUUrgF0QGc8+FGtUKE0+i
 7DwwW57X5mSwAfp/DFyQAkBEoZqru61D0Gan0rMZzKvkaIqH/MU65YG5d5e10qeiRDy4+g0hRLK
 KeaOrc/qp7UJb2WRbJAQ/giyPYahtcc7rlFX/nVYtT+InNmEy0aHyVzwjjaRxVR5md7C21px/g9
 W5Pap+fFjCcr0UlDWfqWzGRaauEYhqAUArGimmPThwTbFeZ+FFJVD4eZ3gmJvL7VioqUcNeKYbX
 2affei5CxttUztREbpi5c+7jq4SyZ3xR2+pu9zS+EMZaEVU7I/GwfWOGW6+5Gseh+t4WCbt4FmU
 cLN0yvSIftEpPRD/hGmwWmu89oGdxtKsKnXdKV4xyV65b7EKuwnqBeborL/pUK5zHgjTeJkJQPz
 uyME4yjgmefvjIET0HP9XPa7h4pqCcV4T5zRkkFzFdFgM684bnIugdkitiA2PGd/8KqgOREnx1w
 m1lNJ28BPjlWa5ZBEVS2408/80kD+fO6r9F+6rgFMJqTbHeR2ZehbyfLswrfSE8j2iXNcw3gzrq
 3MMIMjRT2PC1aEA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Rather than setting up the core, obsrv and chnls in probe by using
version specific conditionals, add a dedicated "get_core_resources"
version specific op and move the acquiring in there. Since there are
no current users of the second bus yet, drop the comment about why
devm_platform_ioremap_resource can't be used in case of "core",
as it is not applicable anymore.
Don't switch to devm_platform_ioremap_resource though as we need
to keep track of core size.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 114 +++++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 43 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index fe45d62a42e2..db33ca0e11b8 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -186,6 +186,7 @@ struct spmi_pmic_arb {
  * struct pmic_arb_ver_ops - version dependent functionality.
  *
  * @ver_str:		version string.
+ * @get_core_resources:	initializes the core, observer and channels
  * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
@@ -206,6 +207,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
 	int (*init_apid)(struct spmi_pmic_arb *pmic_arb);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -961,6 +963,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
 	return 0;
 }
 
+static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->wr_base = core;
+	pmic_arb->rd_base = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+
+	return 0;
+}
+
 static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb)
 {
 	u32 *mapping_table;
@@ -1062,6 +1077,33 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 	return apid;
 }
 
+static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->rd_base = devm_platform_ioremap_resource_byname(pdev, "obsrvr");
+	if (IS_ERR(pmic_arb->rd_base))
+		return PTR_ERR(pmic_arb->rd_base);
+
+	pmic_arb->wr_base = devm_platform_ioremap_resource_byname(pdev, "chnls");
+	if (IS_ERR(pmic_arb->wr_base))
+		return PTR_ERR(pmic_arb->wr_base);
+
+	return 0;
+}
+
+static int pmic_arb_get_core_resources_v2(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
 static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 {
 	u16 apid_valid;
@@ -1239,6 +1281,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 	return offset;
 }
 
+static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
 /*
  * v7 offset per ee and per apid for observer channels and per apid for
  * read/write channels.
@@ -1419,6 +1473,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.get_core_resources	= pmic_arb_get_core_resources_v1,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
@@ -1434,6 +1489,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1449,6 +1505,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1464,6 +1521,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1479,6 +1537,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.get_core_resources	= pmic_arb_get_core_resources_v7,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1515,16 +1574,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	pmic_arb = spmi_controller_get_drvdata(ctrl);
 	pmic_arb->spmic = ctrl;
 
-	/*
-	 * Please don't replace this with devm_platform_ioremap_resource() or
-	 * devm_ioremap_resource().  These both result in a call to
-	 * devm_request_mem_region() which prevents multiple mappings of this
-	 * register address range.  SoCs with PMIC arbiter v7 may define two
-	 * arbiter devices, for the two physical SPMI interfaces, which  share
-	 * some register address ranges (i.e. "core", "obsrvr", and "chnls").
-	 * Ensure that both devices probe successfully by calling devm_ioremap()
-	 * which does not result in a devm_request_mem_region() call.
-	 */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core = devm_ioremap(&ctrl->dev, res->start, resource_size(res));
 	if (!core)
@@ -1534,44 +1583,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
 
-	if (hw_ver < PMIC_ARB_VERSION_V2_MIN) {
+	if (hw_ver < PMIC_ARB_VERSION_V2_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v1;
-		pmic_arb->wr_base = core;
-		pmic_arb->rd_base = core;
-	} else {
-		pmic_arb->core = core;
-
-		if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v2;
-		else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v3;
-		else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
-			pmic_arb->ver_ops = &pmic_arb_v5;
-		else
-			pmic_arb->ver_ops = &pmic_arb_v7;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "obsrvr");
-		pmic_arb->rd_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (!pmic_arb->rd_base)
-			return -ENOMEM;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chnls");
-		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (!pmic_arb->wr_base)
-			return -ENOMEM;
-	}
+	else if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v2;
+	else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v3;
+	else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
+		pmic_arb->ver_ops = &pmic_arb_v5;
+	else
+		pmic_arb->ver_ops = &pmic_arb_v7;
 
 	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
 		 pmic_arb->ver_ops->ver_str, hw_ver);
 
-	if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
-		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
-	else
-		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
+	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
+	if (err)
+		return err;
 
 	err = pmic_arb->ver_ops->init_apid(pmic_arb);
 	if (err)

-- 
2.34.1


