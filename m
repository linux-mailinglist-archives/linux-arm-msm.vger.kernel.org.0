Return-Path: <linux-arm-msm+bounces-11090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C4855489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDBE728AD35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C6A141989;
	Wed, 14 Feb 2024 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvQUq5t6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5913F013
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707945249; cv=none; b=Vtn3Lp8OaWdolR42UmeqipYBMzq532FsY1al/2CY/2Cl8KAurawkrlewDJRdAyTnOoNm91taXexLeQeyBDEZBG9llSO1bBBbpt8r5Xcu9gkpmsN6Gqj2cwX3HeyS5ohfiJUl2/DjO/WnLigAefDXpPrudDldGODE/s8ulx00E8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707945249; c=relaxed/simple;
	bh=4LROwuZKj3G5UarAy7ISLV8Z49ILwNriSc+DX7xCbJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8B6qp8kPQPYtsrst0EXNinjm+NNaBzbDz9qi/YJLOyzH9s2/VmzR8qVVjRsDFyavKsbt+3xs3+6SK6qMm//4+TiuW8l6Tw3THWXZjsQJcVpWCJrIA8UdflZYnD0dw0uzOF8D9CgsVCucvJPjaVUG6iE2tDYMkwxhrpiUBYPSYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvQUq5t6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a28a6cef709so17349566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707945245; x=1708550045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV6KAsArxgimUtDHuQlkVbBpy/xMC87U3LszE+Jd/CE=;
        b=yvQUq5t6Q3QOm+dQbzC4De0/wETrDPOAao0LWB4yi4P3CDikO26UpB8vmNuYgcw/LP
         r+B9MPPYr70oYI7AdIhFA+qWpbnP3lh+8TMLDi8yMQlIcbWVtrKBzlinqlV/kyjjktTC
         Vks27dIoAvNyULkwaqz3QiChnO6y+gP4QoAo4XDksmwt7xOGj6Z9X+DSXiHcfelkxgEL
         XkD3xeAlKRjdkDa0z460RRWX/mN8lnKVij+FIp7IWbtSD1vD20eVvNfdcA4vMblLfOQF
         AVpgta1DU+d1/X6f7IPpKcnPMTgAEYOjEa7eYT7djuFZDrcXQpR/pA5SkkmmcsQslJQn
         iMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707945245; x=1708550045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV6KAsArxgimUtDHuQlkVbBpy/xMC87U3LszE+Jd/CE=;
        b=T4rbTIBgYZWvSphKcZjDkbVVsxuMS0HHVct1JkGQepbrJjIJslJ90m8f5/dy8Ttt6h
         k73xBdlHAhCScbHBgurMAYWEL94UiGGD044bBCks4u72kPlTBCJNz7RxxlQ2HO8ssRYC
         tz47BoQDcdeItCsdMtdvtS2kXixgeCrubOkwuq4AKnGYetAXHCSDUyouaZQMM98G12U8
         V/UAIlOlmrpEhpK62nFWuAN3h+T9dqEbJCvToiqjD3KPw+dYlruT3HQetFZ6fBU2lN1a
         QZhFF588oUhytb22fkX9FyJAcKoG4lGPzEAmMAuCEd68oOJtiI0wmhZr3Xjbz6CRCea9
         HOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZSpmHqTP25a7y32OlKJXP8R3unabhc0+iimoC1aqXNolCassaG31d7aac95k9hd42IZb7q0aX3ax4GClJI50tGfz32tB6J+oSsVRmow==
X-Gm-Message-State: AOJu0Yzeu+22R84VFP70IlVoPNd/9MzbZd93oXD+JWcys+tkntmFIpO1
	g0hDyvNOYPK7yUaB7Mx77VD5FDdguvaCJD27Rzav/jrQjBlBBeWBXP/Jur6QvkA=
X-Google-Smtp-Source: AGHT+IHzsxx3AOPYwkGUeFhogGI80PY3yhCRmEhK1odK0qQ+qlL+iVC09i1szMitkiy+RIj0HXBuVg==
X-Received: by 2002:a17:906:d9cc:b0:a38:981c:840e with SMTP id qk12-20020a170906d9cc00b00a38981c840emr2035810ejb.19.1707945245462;
        Wed, 14 Feb 2024 13:14:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqAxJRuHuLa7FtY6zZi3LVBS++rEGvWsUTk1liNL8Qm6DCRdPWPgiKSKdJBjDAbnO5bP26msigbwn8n19RT+WqKpDb8okop14WYT+nWOXRGNd4+7soYghEKc1pJvRKbsat0hCoZjygmbrvRJNtGHBux2iX3sy8qv08e7Bk0BU5KQYpvsCQ4g7aTozVmnaNavH2bcmxy/IuNmUZaqFogfHKnc387X0eq3VRdTn/1JZ6XYVDVBnWRL/mJpwMMDBDKwjEo/9uQdxPKrgwPExphlGzi2G3jnekB24KpGjEYA1XC7WpUv9iKgLNbb2bPgzdeRnZrD2CIOyt4BzWC0vnsAumFrn6ORDPLBITU2UsTWJVjXgqLQr7TDvFID5151YodRaljfHH/kWS0u6E9UKf/dkzrG/cS+Wg0tAXVzjj0jNYuW7gp1+ku34rzRyGcFCcrEZSmobmtQbu9cgNXpXdO2OQnCs3jYCGfH1R6vv5NAs/6367Rv948RyuoBiKycQ/N0Pf0cQL+RU=
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3d22f53210sm1457661ejc.188.2024.02.14.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:14:05 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:13:48 +0200
Subject: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring a
 version operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
In-Reply-To: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6892; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4LROwuZKj3G5UarAy7ISLV8Z49ILwNriSc+DX7xCbJQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS0UdlrMXcOsstRFNVkdktci53tJZ/KIRf09W
 rBYaL4DQXGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0tFAAKCRAbX0TJAJUV
 Vi1FEACETKPG5lNZ6t+PcyItRgAhtvlArhmfJXDkI30hcQXEIlDLCbTDq3ALZBtSPD9EDdV209u
 j+aZrzZrKnsBBcVZadPevuA+6tfKbs8IwL5sBt5wmQ1Qeea+9lKFEw2qA3Vl9zjTQU7XMcUeL+v
 VgvN1PUVjEV9sw331GT4VreIijLUICOkb9jNOtUNXqQ9DOhzVpLZkIhTmRI5jrZwpxeLLbgb2ed
 MkzoZuKuuV7V9/bgtXlPYtDdgH8EDdMHSH8+zSWqbqafeb0gF7jCXoMyBEO/c2aElbImxD6eBhJ
 ZHgej199mzqI+Rb0nzgwVdMhgFRkbti1LhQ3l0mdfaUJh89obSxiva2e+xeXzI7qzY6hUqMslFm
 YWHyvjUqOLsJamhY7ThnF9uAElbga/t0ON3VexpOHk3Ai8rNcC5HBZs6wVTSeKY8Xtn+wy1dAgS
 8Mgw4O5ahKlxNthuv1kOtuDLc8ZK3idnqPPo9nWCUf5F87OhEUFgslScnnm36puq8qXdGb37AUG
 PR6Dpn4i4n10i4j9XBnoV7wK49Zn910ux58VgK7mUc+XYqkYgP++sIKB341mI0qLx+e4H8z6HcE
 9had0323E0Suwfa6dvoptxcmVXpc+otagB2SCm1MVk1tkU+FywEyyM2azIe8Z+5C5y5mFl8joSJ
 QmD3QPVXwpSBZhg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Rather than setting up the core, obsrv and chnls in probe by using
version specific conditionals, add a dedicated "get_core_resources"
version specific op and move the acquiring in there.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
 1 file changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 23939c0d225f..489556467a4c 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -203,6 +203,7 @@ struct spmi_pmic_arb {
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
+	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
 	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
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
 static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
 {
 	u32 *mapping_table;
@@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
 	return apid;
 }
 
+static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "obsrvr");
+	pmic_arb->rd_base = devm_ioremap(dev, res->start,
+					 resource_size(res));
+	if (IS_ERR(pmic_arb->rd_base))
+		return PTR_ERR(pmic_arb->rd_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "chnls");
+	pmic_arb->wr_base = devm_ioremap(dev, res->start,
+					 resource_size(res));
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
@@ -1246,6 +1295,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
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
  * Only v7 supports 2 bus buses. Each bus will get a different apid count,
  * read from different registers.
@@ -1469,6 +1530,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
 
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
+	.get_core_resources	= pmic_arb_get_core_resources_v1,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
@@ -1484,6 +1546,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.ver_str		= "v2",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1499,6 +1562,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.ver_str		= "v3",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v1,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1514,6 +1578,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.ver_str		= "v5",
+	.get_core_resources	= pmic_arb_get_core_resources_v2,
 	.init_apid		= pmic_arb_init_apid_v5,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1529,6 +1594,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
+	.get_core_resources	= pmic_arb_get_core_resources_v7,
 	.init_apid		= pmic_arb_init_apid_v7,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
@@ -1584,44 +1650,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
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
-		if (IS_ERR(pmic_arb->rd_base))
-			return PTR_ERR(pmic_arb->rd_base);
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chnls");
-		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
-						 resource_size(res));
-		if (IS_ERR(pmic_arb->wr_base))
-			return PTR_ERR(pmic_arb->wr_base);
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
 
 	err = pmic_arb->ver_ops->init_apid(pmic_arb, 0);
 	if (err)

-- 
2.34.1


