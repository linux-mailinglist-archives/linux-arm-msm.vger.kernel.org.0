Return-Path: <linux-arm-msm+bounces-103755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCqiNAkd5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:33:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790B42AC3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C8F302660F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB7639FCDC;
	Mon, 20 Apr 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8Ciu6DX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA7LdkXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4930C343
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688318; cv=none; b=XHJjCfoXjTnFqCIZXgSejP51WlTLgaUUA+mFLfORGhEscQgWPdwbT+pM8Fypspsop0No51pLp7zrtsDIkxujG92q6iqVfg4asjzxWRa3x2Y0sh88f+Mpslm69tFxnqPEadrKcH3TMYB/wTmdAeGyjG7ToO5FrnQm9j2UURm+Q2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688318; c=relaxed/simple;
	bh=D33RLHcnu03tDPMHvddUZq9xsNyemrdy+2wpzgXVACI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1cn5KDQzz05RJe8Zh5w0ZKqcJt7wzOEP7wFuoKuL/gHR9pTdPywfpufbqkfRUgl3/YxJrGpVRX4k0NJb6da5h0hCr3IgTTTU6mtChvDBy9Fcv496VMLukuWgXb+6ROL3NvsNWqLVpmb+oFdaUtrBz17EJW4XSyY3If8DLJHk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8Ciu6DX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA7LdkXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBbDC31598128
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BuyqIDl4EgS
	9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=; b=O8Ciu6DX1kcaRiRMge4fBMKzE49
	Auile1H9cCt7FB3BwaA+pcMKYKqIrJiiF4KB0p1VYSYN4RwwKc9irressz5XaNhf
	EssPWOHqHTHuHZRrJyhoUAAbX5ak+7/qIDm0K9RrrdScRwuOd35KLIPNXnABKReX
	/9AG04doQeZ+mEGxuXCpGjM3ZplKg9Nf4KoirxhXo1dskDHyBGmMVjG/D8m96Qog
	G/7ucVraYAKZwQlsddfV94veIMlBYP/xoko8v8MAlTFTJUwJlkPiyH1cal4Bp/Fn
	dZF+V3ZBPsobBJS30gOxLESMdAZVti8XoIokvJq/kd07k+mjjzAMfy3fy9g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnhds8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:54 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7a00198633fso45672247b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688314; x=1777293114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuyqIDl4EgS9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=;
        b=MA7LdkXDOqkmOP71GrPx4HIf7AYPAk2S1TQGImO6WavUBIUmAp5r1Hf5P9FyoaFi4T
         aaBnS01eVyEB4yB+VoDsPyFqwGGexbL9QucdvOkDMBtM/wEDUy2LNCftXiT8+LevRK/J
         WSzlHo8VVaAr1IviE3CfZHqUDNU/jpjyczjKaulC0P8fTNFdbPO8DuAV02o7L3JdeqnL
         lpQBm4OcEzI45L7OUTKsMElRfPKfOuQeXtgRRLDwZK6Mz3StTYQQEBSfKKE39ttJyFgB
         7YEUiP46B0vpWYJckP0nk7ovTSckRgVQ4ZgVpgkB4y7zsghPjnheSPlkkwWcyJIigkuU
         jfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688314; x=1777293114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BuyqIDl4EgS9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=;
        b=alENKTN6dw4/J24cCHvsUGJKpnLZVlCDUdGS9b+wuZYyH+fLIv67B5IvFhzQ/yKLjB
         75JpHuPv20vXkYeOypxo0tinpk0ZUcWddpoR792zp4mScOkhHaP50Szcsd5Uyu7Z0POu
         qBPsAxGOg/QoyisAwx2Sg7scpk5nZdXAkcU4mnCXYKvzw1kfUH5je31zLKHiBoFQkonp
         H2BmUbyXcAw+fm4xSQWo036NFwHbRbOMShQsjfz/S+GKcCGRAgI9oF7XpvnBHuCJtWfi
         EAauBxLXI813SgDg8/3kFGxxvhpzCONCdmxXDQHSXzCLGDZXnddsodX2AiXehSwW2x7l
         oAAA==
X-Gm-Message-State: AOJu0YyEiigYzhmI3BZjy3SqymCwLkv8bEssM9PIGth2ZtNEU6lrP0G0
	2V4ibk3EXDkpaaQWylu1unju1EgnPv+mrz5Cs0RkzgPFYxAxG0PKnkLWNop8hBgqKw4d7RPXbGb
	eReC98NgGMk5gxdkRjSNqKp4fggKKXy3wQIpHxRyOvl81YfsUPHJWJY+/MMoUQ+oCllHU
X-Gm-Gg: AeBDiet1PnBSsSlOdqnXk3EG+m15a+1Pf4iIrWeQyfIX8gt49Kmi7Th9lcxd/3WBMDA
	XqZualwYIY9wiOikFQRul03WaP1qYnszGiW98yEp5rxh1aGsRhHZVq4WVRALPlRkBKCoIebaO9X
	LiihGZPMD587I/nenxAErzvoFYq1fq85PT7hD8s1NsIOsvtrT+O14cSi0U1Hei9JgwqSSx2TuHB
	2ccaL4fB7cRwZUXf1TpFG+mbEzIfVkyvBmssH83OsfrZw5Lpbp/Hin5PlAWtmOlgOsS1ZEw6iTj
	xOv6ic+TFY9EDCKwBmpEHmeI2DMupWEDnTSL7iUw4uiMLWFB7XCp2wnShIjv9OcIxXSns2tbYlX
	OPZor9ia47yyagfS2d70hmuhKR6Radn79lAtZIdKUxjlH4YYKjI7AY+4qxo8T
X-Received: by 2002:a05:690c:498f:b0:7b8:f152:7538 with SMTP id 00721157ae682-7b9ece761fdmr145060187b3.1.1776688313985;
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
X-Received: by 2002:a05:690c:498f:b0:7b8:f152:7538 with SMTP id 00721157ae682-7b9ece761fdmr145059797b3.1.1776688313525;
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Mon, 20 Apr 2026 18:01:33 +0530
Message-Id: <20260420123135.350446-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FwgMq_kbQLPzzQZRihxfI-Hf1F3bCxId
X-Proofpoint-GUID: FwgMq_kbQLPzzQZRihxfI-Hf1F3bCxId
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e61cba cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6_wSKh-cYxHhlBVotpgA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX82bNzuKr/mBT
 Ch//h2vK43p5/s8aVq31Mt5UMSXGjkbg15OIV6hDyuJ0KzcDp8YqLbzGaZQOaPFxOzrIKj1uMR4
 PLt7MrMyWV+Hsvb3fmwIy9rcMuLclBHcZCjgi9JmRkckZer/A1ieNnAa7GJHH//ny+XYYqY7vMK
 N2ygcNQhn8cnwnN8H5dOzte5f4eVOC0P9iZWoUIXRD2fqMsYep4bAj8GaOc35earg/s3edLUcbD
 B+TlkX/gxTU+X8F7P5R3gAaIuu5FeKxYYhG+7d9K61pPYSnB+b522REEGkfX+Imk0uPnu4s9fIl
 7T+4+FqvFsogCbBn6Lswcuq4TPETIFvy3JU9ENmO3clejIPA3sO34Az8XxOj8jecGraMbWm0Xe/
 edcpVMJ2MYv2m6xq19THHgy0JFTb2yV8QIIohvC6brGr8GFln6LsUQqKPn0sALJ9MiZ7spnvx0n
 8L2oc3I9FlFBHHwUpuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103755-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,sto.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7790B42AC3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 22 +++++++++----------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  7 ++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296279..2b0956ff2ae0 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -15,6 +15,8 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +24,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +32,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -480,9 +480,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -495,13 +492,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -539,8 +540,8 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 
 err_pinctrl:
+	pm_runtime_disable(dev);
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -552,7 +553,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	int i;
 
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..64a200dd8f41 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -139,10 +141,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


