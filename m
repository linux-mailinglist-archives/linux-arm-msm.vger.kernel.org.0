Return-Path: <linux-arm-msm+bounces-107338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI1hBFmIBGoJLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA861534E12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5DA03083B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E342DF15C;
	Wed, 13 May 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caMebPoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnqtjAXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D12DEA86
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680830; cv=none; b=IM0CKHkvr2QOsAa18WhJySAp7q01UIRuoGauo3jIaV+uDVyPdOArXwDYNX1pBJ1HRxVrOmyEgNdtOYkcRBWBqkG6l8HRcZNfUWSpLOqEQgYQ/gjNOiuYP4d+IuUVJBa6CAX3ja8eOmlbNWNriQWvlw3PEqiI7Zr5LFtkS4rKamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680830; c=relaxed/simple;
	bh=oPThCnshvF0b9uT3Ddx8L/OThmoOfUCulhxnC7Vt2FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlOdr1vHhooTwdu4Xlm0TIEokdgwN65PlmX3tt8nQiGd3LGZrki4LEhxJ/Vo8jfBEXLbaXYgo5owZ5oQ7mv5RfkaausEKddB1jih+mbkzjDU/sry8XmhySa+RdWbcFBISh0su9r9bo198Ylz+GllQlcMubiKtjvfCUNPRLexiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caMebPoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnqtjAXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC29Rc2965186
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iCR1wWYDk7P
	Uvs3e9gMD6BoPYPhmx+vYRptveKOv16U=; b=caMebPoI5FvCaMcWHlD1WEcec6E
	bFDQynP3c+xdgmTD3fh17PQaSleu5h9cdlCnTn14n7s9mxojXRuHWG9q7F4A3Fga
	vIeWeiGefTfH33c2s6mm2gs+aAQyS4+79olEEF/wo5xTtLqXqNRHpWRDyvwicmP+
	Ru2BTpm18D8KqL+qj0B/buR/WvUqLKNKVzjxRcoxYGkriLdvrDO7bsGQh/BEzrbc
	VqHA7iLQckCHiY2wcZ8yvfoY42CArfCr6f28BhQKYAndlfM5XdE+ThYXEixY8dTI
	4vxzqqcU19SYmLJckNpG4WZ9cjtMSF28YFRIdNAD+xIVR4WzrJjeH/Kz0Kw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59nm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:00:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so71928435ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680826; x=1779285626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCR1wWYDk7PUvs3e9gMD6BoPYPhmx+vYRptveKOv16U=;
        b=VnqtjAXZzM8aR6HjO40bF3XiAXDs/ROWAn7jnS/zfJMKVTfMBcwdsMUUfmsHXIUQlI
         TRZ1i8+RqgPmO4PQYOgcyHX41gGBu1LQRJgHskg/dHOI8r/GJ3s+YWNiiuhCfxfDP72L
         Mum8/w7puJQz0NPPw5RtXWQScpeR3Sesoem19lkg5BQrUqqn3FtbgQamd9j5Kh1UMnMW
         l8Y5p77hiJpt5yq33rB9CVCZXObiYaAR3bjOo3R1vj5kBO069gz+iLcDBt815iqxRAlh
         I6sldKU9pn/JH6RG4ISaiB4MKgELO+sFtnjLC6zpFgqP4BrvTGBPQNmdc2C02elsNIJy
         6JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680826; x=1779285626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCR1wWYDk7PUvs3e9gMD6BoPYPhmx+vYRptveKOv16U=;
        b=Y8h1GB4NsRJpKDegEO0YUY2lJ1T6E5/N5wFuzHb7H0HZWpMf24YzOTwB3j+Sl4X1Oh
         QrBHXtRsIghRDOPibqEavy/KVWRCBIqdRQomb1QMQaAdD85gocgF4B0C3on8rQlJj3kR
         zBY6V+ZF7f8c17+8lyHezur2pLo2h5CgF6uKGuFgYQHQg+ezTu8Csb8pG1dA9APmBR9V
         PlV1b3eib0qJNjQtPUW8evLfNu1/C33NfOuguVE8Rc2iuBoqRB7YluQQMs/Vq/4Yf2MD
         OJ5wVT9zWXXs7dwnX3+BKIa3hRqlHZD+G4udPut9aLLydLrpXH8MExMZNcYoi7QCI6Br
         hE6w==
X-Gm-Message-State: AOJu0YwQ/dSYSERtYWMUeZcdG3VkICg9YTjBqG7yniAYmEFIlvKK/IUc
	ypyfoFC6/iowI6a8R2vYj3kXU9V5iDj8iI4bDhimJnA1dg6PBw4AYGOe8dCF7k48BtoV91u8rMn
	KQfrsxSF//0PbBwB3kYmt+JXgFDM2TfEcqpvbuGVojXWRPRuuUPMpbliSyn3nAo0poSmK
X-Gm-Gg: Acq92OG1Py+vaMiCbfLoQkOFCuMxGoyDx9JTrPONRlh4TN0jmkosiMWu27PAYfoQUWK
	q7Ew9+1gVgoBSUoZm6QQ/KG1B8ZqFRdnW7/x9JBzgcKmA43xXozwUwy4LT3nt89M6UoOe1wZabX
	ndmiKHEpzdAPqJennQwkIGjH+oztQt75rfAWOFa5cBuiNfrEDYr+5xqet9I6S/D6PYuIzJbL951
	eFEkaKG1/nZoYNgin/IGQyoUPgUGu3CvAskDGtDpX9CwdvoKKZo9/ojjr6LWIhqU1QWL8llmtO8
	U0syj3IZnz6500L3GhjueD2LvPpW/FVerxcDUs6zKZxFq8suK74MBbvwkJp0jG+Yp38zfz5+fAo
	QrlhBm/IO4YnZVp0WSvuBaLmzz6n1Xw4puz3XAznKtkmbNUb1aw==
X-Received: by 2002:a17:902:b188:b0:2bc:8f30:74f0 with SMTP id d9443c01a7336-2bd275c7fa9mr25753365ad.26.1778680825608;
        Wed, 13 May 2026 07:00:25 -0700 (PDT)
X-Received: by 2002:a17:902:b188:b0:2bc:8f30:74f0 with SMTP id d9443c01a7336-2bd275c7fa9mr25752805ad.26.1778680824882;
        Wed, 13 May 2026 07:00:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm176189555ad.81.2026.05.13.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:00:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
Date: Wed, 13 May 2026 19:30:08 +0530
Message-Id: <20260513140009.3841770-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MyBTYWx0ZWRfX6EowIKxKlwO4
 w0Nfjzy2opX4/SUKVl7uX9y0ZHA6LJMvh43TS0XEaM7OW4EOaKkiBNgWB3994O29WWlMoNI7CvH
 x3bznTHXL5SdY7dsCmW9QTrHfRG+gl8kv4qgcPx8FCPj6ZCVEm373mY50lddXIknukT0XbdMX6j
 WUCierg8YULjNGadNNTlqPdizsIxWOu+8uiRysSX9i/xrbWVbHXO0WrS5a1XRQCVrZRh8Lhf+eO
 QOM52TzQIn5Qd9a/CuJW/T/j7c62LchxBeaJ9w58UtU3oUsH/aUjHn4NTaomVF4n/MOQFoI0oFn
 moKRcbWiy1VsctsE+8tYyf3T4KO50vfTti3cbCp9eF+x9Sp+PQy/q2un6iCKI8RwW74/+O8/g02
 v3ykD51wxIX9ZLRlJaAUTx9Gi4PvjfIQCKEigZPT2YM8s4ODrXBkZ9TVM9raQOAsYFeg4LP9x8U
 rAjooXTj/JlGr43mJ7A==
X-Proofpoint-ORIG-GUID: qA3xpmqUQ-ucxnNdwuDdFZ6b1ZNcb8AL
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a0483fb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZNL_fLR5ULJS_YlRCRQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qA3xpmqUQ-ucxnNdwuDdFZ6b1ZNcb8AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130143
X-Rspamd-Queue-Id: EA861534E12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107338-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The LPASS LPI core conversion to PM clock framework relies on variant
drivers wiring runtime PM callbacks.

Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
in this patch so they are prepared for the shared core conversion.
sc7280 wiring is completed in the following patch.

This commit is a preparatory NOP on its own, as runtime PM is still
disabled on these devices until the following core conversion patch.

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----
 10 files changed, 90 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 3bf6fe0cf1bb..72b8ffd97860 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-milos-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..27c47710365e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -166,17 +168,22 @@ static const struct lpi_pinctrl_variant_data sc8280xp_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
-	       .data = &sc8280xp_lpi_data,
+		.compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
+		.data = &sc8280xp_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index 65411abfbfac..7b5aacaae7d7 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -145,10 +147,15 @@ static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm660_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm660-lpass-lpi-pinctrl",
 		.of_match_table = sdm660_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 858146c408d0..0a31f7ad2e0d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -151,10 +153,15 @@ static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm670_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm670-lpass-lpi-pinctrl",
 		.of_match_table = sdm670_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index c0e178be9cfc..75bafa62426a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -221,10 +223,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm4250-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index b7d9186861a2..05435ea6e17a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -141,10 +143,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm6115-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..454de788be21 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -127,17 +129,22 @@ static const struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
-	       .data = &sm8250_lpi_data,
+		.compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+		.data = &sm8250_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8250-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..834eee8dcce9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -195,17 +197,22 @@ static const struct lpi_pinctrl_variant_data sm8450_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8450-lpass-lpi-pinctrl",
-	       .data = &sm8450_lpi_data,
+		.compatible = "qcom,sm8450-lpass-lpi-pinctrl",
+		.data = &sm8450_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8450-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..875e04e5d2b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,17 +205,22 @@ static const struct lpi_pinctrl_variant_data sm8550_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8550-lpass-lpi-pinctrl",
-	       .data = &sm8550_lpi_data,
+		.compatible = "qcom,sm8550-lpass-lpi-pinctrl",
+		.data = &sm8550_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8550-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..bc7889c993d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,17 +212,22 @@ static const struct lpi_pinctrl_variant_data sm8650_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8650-lpass-lpi-pinctrl",
-	       .data = &sm8650_lpi_data,
+		.compatible = "qcom,sm8650-lpass-lpi-pinctrl",
+		.data = &sm8650_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8650-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


