Return-Path: <linux-arm-msm+bounces-69723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FDEB2BEE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5D077A805E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5846532276B;
	Tue, 19 Aug 2025 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YssduXWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B9320CC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599279; cv=none; b=LdK+HTuLdn0S+LkAq8DXeYtSJDuNoCK7rGnZt3DWmO9ohQ8nq0zujl5yJQxAafjSiKMgYMuH9hK6xz2RO8Y8h4Hhu5Z20m3aSDyNVXpBcd9lRaXN7s+qI0bO2hGWI2hCCgN9bKsV8C0V4XbX8Bf9SH5d2llgLTT+xICJOAEaTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599279; c=relaxed/simple;
	bh=XO9D6AwhUNAnacAZyuMr3vcbzQlze7wwXSgBjm1UkaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqN8tmRdKhhD2Ep1pcrHAqjzxqdgqwesxaXEMV5+43jx7DibwZvg3SpvgtV4hVKItMcrbiehnZPWH9ZxxWfz8ENbUlXT6hy8Wvt4EdagCuU2EESvaqU/13wC0tNwGflHRlU2mTTrZOwFjC8+68Mv7u8Ortjqsx6e/FwytsEobs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YssduXWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90a0A030852
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cImJsAweHgFKioboFNl2oSzG/5IDjBZZwddm+qkdJKQ=; b=YssduXWzAuALRbLC
	WNing4pNcgkCNJIxh1kbSVqMUccako0b3Cj9gOHmeXLrd9g/88BdGdbOBN1Cmkn+
	xLs3u2uxbHCTwIQLWUrytmL4jWus7bcQi8ROVv7uIxRR1jjeZF9lNdSS5WO1K2nG
	Islk9TiLYy/wAZIG9IRNZMqFNVW3+9YigVg0XDyGbPDiI/kGjEJaF0wfNWPGZYLb
	VsbCcLz1MJu2JYga+uqzctvYR9ya858Gd4QzeV0i3A3pEdzaj1wcOMdLG1cVETHH
	0htPJBUx5V8HwLaicUHpvMel9NZ1X8DXGqOMCUJXkvhZCFMKEUSkuGaUiFVAvdws
	u298tA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtgcan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471737c5efso3883800a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599276; x=1756204076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cImJsAweHgFKioboFNl2oSzG/5IDjBZZwddm+qkdJKQ=;
        b=cxb/Te1BZMQjtnUdU6yWxKvbspqFExy4eYmtUIRpXLt3kfXNZQPlF0mbhqHkX6oy7q
         PbxaPm5xpaW76WpUfLc/wzpIESLlG76KoHHnffSk4Hxxb6bV65DF9IS2n7yAAiROyqo4
         l7yHgUjHOxhOk2VFgNCw6P3XKqMCtbDOMCvviyIUceORXxjR+FpBepjyeaFTfVLIQq62
         2/wTjDUkVy3VJ6GdXoXDG8UeP8pnDA0j6zcwyjNM8h9GFHvxzw5RQ4YtViTJ4YTx+LJe
         TTb23xWfYKjS/4YZGn5/F6PNlcwRMEsxXObqX+sJBXlG5XYzD7mANaZHrcpP5iT87FmL
         ZnaA==
X-Forwarded-Encrypted: i=1; AJvYcCVyu3fGb6vUJderYC+hyHaCTcHwcYzIyKUulmRTmE7fb13zJDDFrnMtsLfo0RPdhjG+9+vS7ut2lDI1wHIu@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1/G7VouSU4M0mDwtHyMN5VxaNy28IjMJkO6pP3rb2qWx7+yL
	UlD/jXTsoJP4bGAZQmG2D9ZJnl5bwuNsbQu0tTCH442cTwUXnI/NmiLZ9KJRiDd0P60MAAB8TIz
	9JcDxzy8i6WLkzyCtjtbTKoTlFYRBuLqD71Fybis3yxJp1ObbitoAW1U6HA5LHlHbkzN6
X-Gm-Gg: ASbGncvq07254LJ/Mp2Cwjs0nJN6586sNlDsUpI3yz1w5XX6RtRaoav1EBoelUSlHVf
	qKLmODfzK/ZodsGV3VC17YLcTQg1Pq2pkoooLkoot1KshnyYz+RCcjme6N9YDLeMxATufGNTl/V
	h7Yg9M3Efw9NHlGW/KWHFhdHWpqnYzVvFqQ91sZnbBQksLMwx3RzZDJMpv1xTdzivaYZyJejPtH
	R/DFt1phXf2IMUYZk4PvMzM2Q9wZXvT4wA7veGVJ3JLBzJvLYUHMo6LUyj+StquizLeyP+HZruh
	30nqV/DNKkw68Gvd519IHET8Qrrd+x9PK+4cQbiqI0KWKZPkPkF5m7USRkENtrN2sq4W6Bs6Vb2
	egCz5bjcR/L4OqbGWgesYZQ==
X-Received: by 2002:a05:6a20:3d07:b0:23e:19fd:e18f with SMTP id adf61e73a8af0-2430d42de0fmr2739851637.35.1755599275500;
        Tue, 19 Aug 2025 03:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6GGIZhxrnmD9roD8ShgJeEsO3lov+BMPjiKwTc0CsQQuDH53U0AS/ChsScRIhHH/GKUGPgA==
X-Received: by 2002:a05:6a20:3d07:b0:23e:19fd:e18f with SMTP id adf61e73a8af0-2430d42de0fmr2739808637.35.1755599274967;
        Tue, 19 Aug 2025 03:27:54 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:54 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:27:44 -0700
Subject: [PATCH v2 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-itnoc-v2-2-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=7467;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=XO9D6AwhUNAnacAZyuMr3vcbzQlze7wwXSgBjm1UkaA=;
 b=ZlUiRoSRBBukIvPcZLBxJbhHLQf6Cy8WzWkVJGbcJBK/MhJvZpBxH4ihhyf9kUzrx3zgA7Nj/
 NV/v1ngkFWWApBZBipPi8XEIi33vZmbmYYirK25LZdBVXVv4eJQZjU0
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: VNgaJ1Gj_8hycUKtMAz0aW1Dnpbw9MG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX1MfrFIQoWYYK
 SmKqiXS2omqULKcxEwTVA1fgAKf7SeffXqVc9PAonWkyIrn03ZU3H2yhJ1esSop4l5K1gg7qaEZ
 j8pI8OBv6/noBvXCJV+JIcK/OWef/dzHUaz1cNYXtLAWHf4BKCXuTWQM1vMEzQu1T1p/oULET3Z
 KNNAwYoOkOvAEE5kdgqq3EqzSKy6qOxUdIFZYYqANSyikPRv20rpuxUmInk/A8BTTNpmbxazzrh
 sD7ySyoQ2UTeUy8TE8LtGg5bgUXPz0Fq+w9NrSpJi1zlzgzSFG5Jfzm88wEIUPM932XcdpVYtSc
 1NzonYEKMM/IDCPntA/N3rslthZwvECnmiV/oIYOrNF6D3zbxFSAI02CSQI6phEu6pWlt1s7eCe
 +boXLLul
X-Proofpoint-GUID: VNgaJ1Gj_8hycUKtMAz0aW1Dnpbw9MG1
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a451ac cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vZzgk5nmo-DiXalhxAsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

This patch adds platform driver support for the CoreSight Interconnect
TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
it does not have aggregation and ATID functionality.

Key changes:
- Add platform driver `coresight-itnoc` with device tree match support.
- Refactor probe logic into a common `_tnoc_probe()` function.
- Conditionally initialize ATID only for AMBA-based TNOC blocks.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 124 +++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..407595e893096d8011dfcefd74cca742d9b96695 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -34,6 +34,7 @@
  * @base:      memory mapped base address for this component.
  * @dev:       device node for trace_noc_drvdata.
  * @csdev:     component vitals needed by the framework.
+ * @pclk:	APB clock if present, otherwise NULL
  * @spinlock:  serialize enable/disable operation.
  * @atid:      id for the trace packet.
  */
@@ -41,8 +42,9 @@ struct trace_noc_drvdata {
 	void __iomem		*base;
 	struct device		*dev;
 	struct coresight_device	*csdev;
+	struct clk		*pclk;
 	spinlock_t		spinlock;
-	u32			atid;
+	int			atid;
 };
 
 DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
@@ -51,25 +53,30 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
+	/* No valid ATID, simply enable the unit */
+	if (drvdata->atid == -EOPNOTSUPP) {
+		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
+		return;
+	}
+
 	/* Set ATID */
 	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
 
 	/* Set the data word count between 'SYNC' packets */
 	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
-
 	/* Set the Control register:
-	 * - Set the FLAG packets to 'FLAG' packets
-	 * - Set the FREQ packets to 'FREQ_TS' packets
-	 * - Enable generation of output ATB traffic
-	 */
+		* - Set the FLAG packets to 'FLAG' packets
+		* - Set the FREQ packets to 'FREQ_TS' packets
+		* - Enable generation of output ATB traffic
+		*/
 
 	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
 
 	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
 	val |= TRACE_NOC_CTRL_FREQTYPE;
 	val |= TRACE_NOC_CTRL_PORTEN;
-
 	writel(val, drvdata->base + TRACE_NOC_CTRL);
+
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
@@ -124,6 +131,11 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
+	if (!dev_is_amba(drvdata->dev)) {
+		drvdata->atid = -EOPNOTSUPP;
+		return 0;
+	}
+
 	atid = coresight_trace_id_get_system_id();
 	if (atid < 0)
 		return atid;
@@ -149,8 +161,21 @@ static struct attribute *coresight_tnoc_attrs[] = {
 	NULL,
 };
 
+static umode_t trace_id_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group coresight_tnoc_group = {
 	.attrs = coresight_tnoc_attrs,
+	.is_visible = trace_id_is_visible,
 };
 
 static const struct attribute_group *coresight_tnoc_groups[] = {
@@ -158,9 +183,8 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -173,16 +197,20 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->dev = &adev->dev;
+	drvdata->dev = dev;
 	dev_set_drvdata(dev, drvdata);
 
-	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
+	if (ret)
+		return ret;
+
+	drvdata->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
 
@@ -195,20 +223,31 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.pdata = adev->dev.platform_data;
-	desc.dev = &adev->dev;
+	desc.pdata = pdata;
+	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
-		coresight_trace_id_put_system_id(drvdata->atid);
+		if (drvdata->atid > 0)
+			coresight_trace_id_put_system_id(drvdata->atid);
 		return PTR_ERR(drvdata->csdev);
 	}
-	pm_runtime_put(&adev->dev);
 
 	return 0;
 }
 
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = _tnoc_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
 static void trace_noc_remove(struct amba_device *adev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
@@ -236,7 +275,58 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-module_amba_driver(trace_noc_driver);
+static int itnoc_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = _tnoc_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void itnoc_remove(struct platform_device *pdev)
+{
+	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id itnoc_of_match[] = {
+	{ .compatible = "qcom,coresight-itnoc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itnoc_of_match);
+
+static struct platform_driver itnoc_driver = {
+	.probe = itnoc_probe,
+	.remove = itnoc_remove,
+	.driver = {
+		.name = "coresight-itnoc",
+		.of_match_table = itnoc_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init tnoc_init(void)
+{
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+}
+
+static void __exit tnoc_exit(void)
+{
+	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+}
+module_init(tnoc_init);
+module_exit(tnoc_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Trace NOC driver");

-- 
2.34.1


