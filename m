Return-Path: <linux-arm-msm+bounces-110793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDVLJlKhHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A07962B68D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CF9E3028149
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9593CAE9E;
	Tue,  2 Jun 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwpH7FzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZmhbltG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07C3CF95A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392136; cv=none; b=R7n3HhafIzGYaY3fDNFkVAvf7fMa4LmZ7EBVsCHkARSK4iB9q1o3uHfcxG0Pya+g69lCfeVIRVn8Tbdv4w9qGwgCGsF7nx4ywZDhabmVS9h/+JVs05RjUUxljP8ZcpX2MsVVs004rYScNMbn/sbntUvUQaKjoQbWEJo2SOIhU+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392136; c=relaxed/simple;
	bh=nJr0f2i5H2A5VVRNHa2M0Oo/CaVCv4/HnDg5AdP6qa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XU4/OHHH+uGgDGIU9sD4jIKbqwDLBpjE+nwbT/Nk9uXy9HoM5509dBnXuF3VDf4F7y/GE0uK51RU5dCWV4jAOuco2P45YPBVQf9P2PThHOMn8CBj6SbB4dSa/+4sBdEXwP0JZ/M9MDrRlkYUilfPAX22pW4RPR5qgGNMo5Fluuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwpH7FzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZmhbltG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525itOA1316907
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=; b=GwpH7FzZv8y8u6lj
	iRBzfvO/0r0rVLC+l7jxF2DtKyX3X+HjVw14Q76NqMBaxGZauTy9OyBpMgQ+Co69
	BKXHN9qAMs0VTMjTArxOx1we94iYlpw5+TDLnUSR+yU0p7Qqd+J5J+KOz7Y5dQ+2
	Y5V04yeKq4ga4BxyC4fXWp27NWaLr1AwtRyEPKe6xOw0kHjiY//RMMqU9Of6CxRB
	f2JBncVfgYKRbl0bSSy2SbaEcNIF1aWR1rw1x8Sj6XSAOuU6EtTnLM+E/2SF3Pf/
	otsXtEPEAiPUjM+rsrrylC8O7baLqvLLtwofezzA8NHBwz6YbAi7ItSkoTvThlO3
	QrG8/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vrw18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:22:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2079084a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392134; x=1780996934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=;
        b=MZmhbltGH1+s1ovO1hp9qdPYl/lyYA6eX7wk3a5xx2AXXpSFWAft4UJyfcTiqP53dV
         AfNEw/kVIG1WNHfY0Z7rXSZ9Xy/gxp7d8eVEz33jQUfgkZ1p4opf4lwjqkcrwbzVYKXO
         hWlkIb/QbkY93Id6HFLHUoCO8UdutmYXk9Q8fnj1/AliQckj3VXfbhGtyai1IjNxmbaa
         JBSWCBgxgzBTvwwBRYLIl5hfoy3TdT5kBBnqbDYDPPx2YCrJCB0/2FsWdlYi84aPygnh
         SzEcQ5B3dhG1dy3H8XSlTtcjNsXLCwM51EnrvKvTmIFqgp2+l99+wdaB8yICx7bhp1Lm
         lMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392134; x=1780996934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=;
        b=F0gIyNz/F52qvsv7U+r+moSq4BXDY7q95T4OaEqi4mXbrYcscjqjlghOarL0FnaF4e
         m+SdgJUBLjUrb1mSnUWwh0knT/3Ke+OB0XGCsVyBwQqBCe2eXrMYylW+TKQlsis/oqXr
         DJ/ZizU9DVNGuNF+E2o7vuGsDlgbYrCs7OmvjWmNPTtLTW/ZWNoG87xR0U3dskZqpqbM
         YQxSCElyA484YWG+6bPsn1SlmD1r30i2agD5GEhxRCebfeugP5gZMTQ4V73Abo164bxl
         z/8JwAZn/DZp2tPvFdHOqVj9MkuXTr8yVVkdcYO2KllWGUrXIHaqoECLgjvu0w4PaNB9
         tuvw==
X-Gm-Message-State: AOJu0YyNWxtrJfU+Xo3e2F7PrLKseuUALW3SHfp9r4gybfxUPB/e/t5j
	fQOsc11ZYZmJ0pWw2/+YMQhiXA1a5TuYbUNjNzFC0ChJUdU4tX3nCISyvZFsDdZpWY223lZCFjI
	gFVSWBkLUMV6WKYNAPrMjWqT8MdqwE7ot+XjBV4ZX7KX1EQfUGqZmtMwJJaXNyRKzpvSD
X-Gm-Gg: Acq92OG5UaWGtFU3fvEhYlFo3O1UM5pJVp41kdaLktc7V0om13ymUmhagPZOc3S/D6F
	C3JKj0NyFowZDOYmuKpUwvof8UZWvmZTt5+GJ03yeXLV1ZNKjoXmfOESYZIrtxbm47aevzibzl1
	GgrUvoPOdfpOTOCTiB1sqkWhPYH2YBKfTycGYU52ivjCQa5HhyVTV6LVd2FKt6bS47adAO+CwZ4
	Zlkv4qjsbMrsqfMt2kO4if6KzSNSNN71qsQMJYXfzc5ijFunXuk1rDsTCp+SLbZQMUEP0f8VT3h
	RQaDG/7uUj0J12VmpAjLcOLDXh7OLWj60QzLEemzYbemFfTH2IoXvpkiXnBBkStYCpHDj/15RmH
	zWqr6NYGcKksh5c6MT0UOs9kY+lKqmzQjdSccw76YFYhSmVA5ZWCLPLRxYLddB+aDQtHlwSanuM
	2Ibw+XMTMgmVktPEKox+fa8HtKMaTRvG6SGFOsKqILFD0sUhq4G0N97twB/WFFZ5BESdY=
X-Received: by 2002:a17:90b:498d:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36c685a8b24mr15601015a91.27.1780392133910;
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
X-Received: by 2002:a17:90b:498d:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36c685a8b24mr15600991a91.27.1780392133436;
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:52:00 +0530
Subject: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 79OV1J3pdM8nBjgrtvVtpYV9SjXMC4Nt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfX2q98DSO/ix0j
 PtL+WxtTzx/w5H8lnmDw8RjfmazClMLhtX9tJQT/o0VRL9jtvsQFKhR6kwgIwz1AWkb5dnrN1JM
 ek8zB9ATxwZoR3k6KvqZjasSy+1RdarK+AXlbKvnTQErPDI5JlMhtXjg/MqtaiKZ6QZYCtv3GL1
 G0UiFwJz02+MCGKExs0qmtQpGRKzbobQc9O5/o86ExQBmDsoQl00cy2syVVvoaof4bZWf6jKEaK
 gUqNC205guOlIKj4CTXeeypAKjTM67tgzo4LjzWqjsvB3xCDoD+vWVMGDJ6ANDpAobFmeSrsDAU
 i9e0lrn2WDpnn5BkTg6/8Z6Vt0Tdk0Rbf2GLqwaQ5q/tTX5OMoMtiNZd60DrDb1PW5T3122YE+Q
 pYCPG8XuYPfY3vuyNAx+1FVC6cRkt21efH+MTen+1LJe7aTDRFLLtCRHIzqfqr9HbvNDXBFR0UH
 /V8QIlPeblyL0gSzqZA==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1ea0c6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mehsi33qI3AhlkpvdBkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 79OV1J3pdM8nBjgrtvVtpYV9SjXMC4Nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020087
X-Rspamd-Queue-Id: 3A07962B68D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-110793-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

As per the design team, REFGEN block provides the reference current.
Hence marked the regulator type as REGULATOR_CURRENT.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..2858792acba8 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -10,6 +11,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
 
 #define REFGEN_REG_BIAS_EN		0x08
 #define REFGEN_BIAS_EN_MASK		GENMASK(2, 0)
@@ -25,6 +27,17 @@
 #define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
  #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
 
+struct qcom_refgen_regulator_data {
+	const struct regulator_desc *rdesc;
+	bool has_clocks;
+};
+
+struct qcom_refgen_drvdata {
+	struct clk_bulk_data *clks;
+	int num_clks;
+	unsigned int enable_count;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
 	return 1;
 }
 
+static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return ret;
+
+	drvdata->enable_count++;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	drvdata->enable_count--;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	return drvdata->enable_count > 0;
+}
+
+static const struct regulator_desc ipq9650_refgen_desc = {
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_CURRENT,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_ipq9650_refgen_enable,
+		.disable	= qcom_ipq9650_refgen_disable,
+		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +146,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	},
 };
 
+static const struct qcom_refgen_regulator_data ipq9650_data = {
+	.rdesc = &ipq9650_refgen_desc,
+	.has_clocks = true,
+};
+
+static const struct qcom_refgen_regulator_data sdm845_data = {
+	.rdesc = &sdm845_refgen_desc,
+};
+
+static const struct qcom_refgen_regulator_data sm8250_data = {
+	.rdesc = &sm8250_refgen_desc,
+};
+
 static const struct regmap_config qcom_refgen_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -98,6 +167,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +177,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	void __iomem *base;
 
-	rdesc = of_device_get_match_data(dev);
-	if (!rdesc)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -ENODATA;
 
+	if (data->has_clocks) {
+		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+		if (!drvdata)
+			return -ENOMEM;
+
+		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
+		if (drvdata->num_clks < 0)
+			return dev_err_probe(dev, drvdata->num_clks,
+					     "failed to get clocks\n");
+	}
+
+	rdesc = data->rdesc;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -126,6 +210,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +220,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_refgen_match_table[] = {
-	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
-	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
+	{ .compatible = "qcom,ipq9650-refgen-regulator", .data = &ipq9650_data },
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_refgen_match_table);

-- 
2.34.1


