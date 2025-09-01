Return-Path: <linux-arm-msm+bounces-71354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A38B3DA6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89245189B727
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47051264F9F;
	Mon,  1 Sep 2025 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaMBKQQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B325C6F9
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709906; cv=none; b=Fasy98S97yPWX8lw0TKNxXWI0+/E9VI+/wxHUOueTOYEqrYi6eTDIu7AVTkbliuMDNQJ8iguqkZkcuMJMfAIWNSJHPquwC8gDrKy8c+qRnyyOcF5uBfatWrwdh8ceZa6KL5T2N/hw9ZPCc6ebnD1qSaOt/f4hKoGSCqHjWR+IvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709906; c=relaxed/simple;
	bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqMsN5bes3cYjmZL6pFwozKYnIe4ZYjVfLJH0ALBOn9Usido7syNEzvXEacyt8EnwOW7qUxUtxlz+0Pmz5SzvDmsxYCUvuJepSPPwD9KFPLmtTuBy1uZez7mmqX0UiX7XmmX5km3DI67BHW2TruNoOiGHiHFFGke+JVnJHx8vjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaMBKQQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VKfxOs009921
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 06:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=kaMBKQQ6da2o01z1
	9plibbtddOkVBUlHva3ruEEundWBVzyyTP7SHdQsly7O03WWKrTlKe/CI/pUPAZm
	ANGR0X8UiGFx87oChoS8ZZzYJ4M5vvswv6FBVQFTmc7tE4n+h1zYl7pQV856aHkD
	GIZZitkqUw8cjdQ8zLLYZsFgY6emRIQI/o/hBUsnKatcrP6OeGBoer9NsgKWRW73
	g1OhnaPn7nZMhg7rfFFFGyrA5k/KD68tVA8urg9ju/BuUNi4shqscoV6wYkDe+Wa
	nJhRwpeNtgPFNGuSmHSu+WJVAz+4/eWYeH2dWE96KIQCTuwDXFJ9UudyiOM2ohw2
	LvnYWw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbmk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 06:58:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471737e673so6127570a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 23:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709902; x=1757314702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=cNJkWJhqo0LtwxqSfkdq021QBCw5A5sLAo+vkITjuaccsLzyxuOlUxP7Ce/yKAccZ3
         eLI2gwQHnVXBGjZEVe8SSumlzLR90ph5bJkA2zOfd8IhiqCwXEtZLPPjINR/7xkgjo+T
         ILpaPvnWEhKk1wq8pV6MtzT3zmGfo727BAV2dCAyJyaeAl1GAxolXa3Xu8TatcOSYQ6U
         51gH7T+hYkVcuQrileE4kQBcjDrjZDgIF49R260w70TXIJy+jhq+SXA9g+hSa8aMlPIJ
         8tXhPlh89ch1adXrVAsdBKH1/iyTob4ZMQ0UnMFwXDSeX9vjKYTb3EyZVS2gRfAAKBXl
         nDXw==
X-Forwarded-Encrypted: i=1; AJvYcCVznzzt1wH+iOrSBDkhIwB9fgFjSW0a+eXE7nbSPwrj0ONPR6+zPa6PF0AEiM+FuX8FheYWSLA62yiMj6bf@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzRTSaCaZVqUsPpIwrV4Q23olfpxwEP+iuv7PhTb14jnyhpIU
	e0jwuXhfEbHG4sN/Hz2vFHnF5uHCCAJ8kQvCxy7peZGOdcf2Rqav6MCWaWmtRxWTFGdg4BA95hR
	e/G16t65aFsc93lM2NoWqlkNbrBQMEtpXuBpcxfPXUyqUrMRXXOnVC44VlDCZpBpPF2BU62fJEe
	C9zdw=
X-Gm-Gg: ASbGncuG29NzYtNj/F7SG3Y3RdOJYQCdN7b6TmwP+7Gtblk1rFdAfUhTnPydrSa8myi
	xrfm8LKHndzJ9+u9/6TKHmvOuA4IDjTdCyTlVfFzBmy8kigv0h2qUkk/O7AC+v4w1wOjDBS8+Lj
	Z4gXTlMzNahdl1ngdl16lps83rL6hC4NS2cET3k1eGx3QJdJcIxKQfvH9Vcy2iY+ILrNOpcfHwW
	1o0rkk8FYkdgGQncIXzdyh/usLMVGMXMcQ6aLNbGV8fXb381c0mA07obkS3xcg/E35lCwWZ/TeK
	Gmp7gFjWRTZLndO3WwSgYU8hVTtX7jc5/kdp+pVORRwuZilNcIZbkdO5E+Fuq0eFdss0kbR7sG0
	jFh+nlU0ZwNVIRspIiKZpEw==
X-Received: by 2002:a05:6a20:1595:b0:243:a20a:3ca5 with SMTP id adf61e73a8af0-243d6dfda4fmr9693670637.13.1756709901495;
        Sun, 31 Aug 2025 23:58:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyL3Lv23HMZmNxbBVc6texbzqxTHCnrLR1QdzLtU1W4qMyK9JtaDWZrc48KBy+vPO5XHS0IQ==
X-Received: by 2002:a05:6a20:1595:b0:243:a20a:3ca5 with SMTP id adf61e73a8af0-243d6dfda4fmr9693635637.13.1756709900981;
        Sun, 31 Aug 2025 23:58:20 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:20 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 23:58:14 -0700
Subject: [PATCH v4 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-itnoc-v4-2-f0fb0ef822a5@oss.qualcomm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=6708;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
 b=IKzRBw7TeIeOne6GVMmJ8xWElyiFd0ax5BypFhIxchVpAsCbnr8C1CbZMbunnsXAfNp1LfbbF
 uLybIkfQPP8BaERJ5jgDNzThZex2zlJK9HEM71GBNF4ttZPunWA8Rk7
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b5440f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=pUju2gecW9X7egxZnGUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: WspGrXOJ49jbvyQgRrOY3yxxsKULECJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX7EtvdUszSbId
 00uyYAHLyvQbXO+/1YjaJwf68Br6EdW32vsJ7kAiW2+F2BWwuTiNx+lyLUKHpoTnTw9whAoQJG4
 o+d03AERhE0O5eScU5uL7ggaFCjhTHx7wJ74CSwKSq4EcDF5VnaHuUTB80e98L52OBiOtZKgIiu
 /l42wmR4Junn6UeR8N3VfpL65AosqdsYWsmLjYbAtrFihWwgFG1K4X7++TbArqxkbKwxjD7vbDM
 7ftxlc3xtnbPmwycqcJxyifJ3A2xYdtAO8+ifkuAf6a2QUSQDN4+X6qr0b6EWm7BRuykvQIm/FW
 WCD05RkDrBhCPtApgbz8ijkOeAutdtd/JRQ27/PTSULjyg3vJHIcUnaIajxG5lKjH8jnDci5vc+
 5lDiVROz
X-Proofpoint-ORIG-GUID: WspGrXOJ49jbvyQgRrOY3yxxsKULECJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

This patch adds platform driver support for the CoreSight Interconnect
TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
it does not have aggregation and ATID functionality.

Key changes:
- Add platform driver `coresight-itnoc` with device tree match support.
- Refactor probe logic into a common `_tnoc_probe()` function.
- Conditionally initialize ATID only for AMBA-based TNOC blocks.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 113 ++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..5be882300d79bc0173aa6a19d7da1d48c4aaca9c 100644
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
@@ -51,6 +53,12 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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
 
@@ -124,6 +132,11 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
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
@@ -149,8 +162,21 @@ static struct attribute *coresight_tnoc_attrs[] = {
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
@@ -158,9 +184,8 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -173,16 +198,20 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
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
 
@@ -195,20 +224,31 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
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
@@ -236,7 +276,58 @@ static struct amba_driver trace_noc_driver = {
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


