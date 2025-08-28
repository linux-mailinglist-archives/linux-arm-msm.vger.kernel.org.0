Return-Path: <linux-arm-msm+bounces-71085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD40B3983B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64ACB460541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384E2ECEA2;
	Thu, 28 Aug 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqPaEDs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313272E3AFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756373252; cv=none; b=SV4NngKZKvJS9EjcjSMPDjHtQpUYE/E/IMo5hcdbLr/FIxattP/fmIhiLMtoIXs2N/hthZz6JcmrhdP5N1HSjV6nWZTE87sxkUjXPRjlSnQaJ+nPw9Opt0Ndo+yR6EhbXmVEAwxnGkxraEIH1uwaF5Cgg9v7M5XsrwmUIvnD318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756373252; c=relaxed/simple;
	bh=Z1eZnevWYnpyIWyKbJ9mcPze0cP6MZDj2l5bPS/eoB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCeiV7bIahFspO0pSYNsccyx4llhMmQgBWyJNf9s8Rw04LGVkVIEZ6vbJEYzmE2YxmfzbkjW1al5V80+QxnwJE3G2ciPoxXeZsNnbA5p2+75VgSZy4m2KPv0VDHo3VINF3dA9a6jDQDA17jvue7eJwe8fD2U9w31FQovV9ghja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqPaEDs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S667DH029188
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKIdXBVxutyc8Yt4qrD8SDHqVrhzt82FltAq6xGnVQ0=; b=cqPaEDs3JrHzjMkU
	S6HU1E20b4XpzBlBTHrY+mEBv4YUG0NqhHeEhOYzxxCmYC1qo7LsDH1Gc07iAEws
	z/rrgIuzz7FXeMM9Le8+vE04S7iKXnINpVG+zwvJV6+JhFwonMG5zpIL2Z8X6H7E
	19LojccQOcLSYviTshB+fEaZaoSFmVtXQ3wLd2iPQoewNi/QCfmqsnLaa9f/MqLX
	9MDxEsWunOqbjNlLC+vcw3bcOqEh9y3fQO367n2qFZumXFqNuwS8MBJwupwLh9hj
	aUGqg/ndzHbdEMJpfpecIvCKlbalbXWzrYd2/vcMxvhj8IRWYE4Fb9B9enS4BCrO
	lKRV2w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umfugw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:27:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so1156302a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373250; x=1756978050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKIdXBVxutyc8Yt4qrD8SDHqVrhzt82FltAq6xGnVQ0=;
        b=ct1eADyMbKoDMbrGJ8/OzaQh0UfXCUgK0RJJAVbGkqI70scfMmxZ/nk1oVnBBuKG1X
         leQd0Q9csxnqZboSMDZ5EkTH1Q0DuvN4n8pr2c2SDEqhF3tG2pIHBMWwAfye90TrzyXB
         VwTtlQMhOiZMRScKq1uRQftc+nCC0sEm+1DjJ2zoSzUpXPL9IdvUC46L80pm1EanorSU
         tXJiNVLu6V9hL3xYsxv4ndRsSBvUt2hPvMhhfSgY+PBbAvtfgFHxIMSIZCUb3uTqVKJg
         zM2ERhL/sMx6DXi6hv87dRznLCJlL9c2wYKZy0jLnk0JH4ERtsGuWGa/+4uknCkEK635
         icBA==
X-Forwarded-Encrypted: i=1; AJvYcCXUNLl16RQfmftAAuGTu+LDz9gkx3d87SZXFdGSMoG4GwPk4EuflqLJc325T+5RtLqlzMUAw4IbipbM1T7+@vger.kernel.org
X-Gm-Message-State: AOJu0YzatFrNHdvWeD2YX6E2am3QeKTHR8K74GgFTcYq44IB+ZdoKwnd
	vFaPNa+/yo9Ja8acbUEz8+TIQRt3qxF30jhCkH2kwDA4ccBpiAu4+syLYAgFf8MEgv5PGP82XJa
	3MXPxz49gET6/FhZu+PKhzf+vYDNx8OcvKyQATpxZ5ROTxN4gaOjBPQAceasDKN/ZVoqG
X-Gm-Gg: ASbGncuUdZxM1oAudMGo0MmihwgPAcPfuVbtG7gtvkRD0Cia+WTwgBhEeMl35Yw+jha
	vNAEvTluccfdmbYWJXekiELvOARfUAwNEAd+EJQ1iiszBluZQktVNzOJgaMcKZDQqRABFmQ0Qfb
	wLJ91iZ60DUwWgzqttEWC3r0nxKJ2FjlzXsWO0jDcaoGARgHoWWBT6cwFejFCXjQhI7uoPbqEEJ
	xLEsZ0MubL5AREy4+EhWxP2D2rr4uyykPLsaXTJaWo3zwOwHL4klQhiNSPd9sLZumdb3HhIRQbi
	ytijgpWj7t6Iwemq/8pkG/LpNjTivEPTCd9b2H033TNFWzV8NUxGslkY0jENN/IJWR8LWGhWS5s
	1UCC9cWHsGqREMVweUCa34w==
X-Received: by 2002:a17:903:943:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2462eeb75edmr278218625ad.38.1756373249439;
        Thu, 28 Aug 2025 02:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8bhrS/FHtm9K9UqNFSs1oYSrwJND1nV5qQFHIBImBkF0Oz12krvGLgAxPoglax5tDS/693g==
X-Received: by 2002:a17:903:943:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2462eeb75edmr278218465ad.38.1756373248954;
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:23 -0700
Subject: [PATCH v3 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=7284;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Z1eZnevWYnpyIWyKbJ9mcPze0cP6MZDj2l5bPS/eoB8=;
 b=nAWlBA6HM/gtRZPVJfqqW6BAai6jca5mXaH+6xDBN0pEgZT/mWyyMrmD1X74QIykxkiSoeO4b
 6NLb6TAq4fkBvCmg8WgK4KpBzdjqQFLGLen0v53MUOx6H/VABzcfQnB
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b02102 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=YgsqhSH9U0MoioIrZkcA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXxMB3bHA28EfW
 fTBtso/deBcUU2+EkUA3xwCIrTcWMjCNV6gFUJ3FogMf+OfPWKsGOOkEwCJNv27qCDI86VCXvl5
 BKjlfJlH6lpAkxUu2nujhhNfYEwRSQyXvq40Smq+4hicF59KtJH4UbdkxGIVr+JHFgV5c1D7idg
 UF0RSQAHmH7ahH/Ap48z1hCIO8DMMPKPIbdnGztBORWsUqVAPwPk+bJ6duekGe34oPTyoMS4f3o
 OOGhV4tcMN5QZ+CvmCZs0GK6llfidqAqjBjNON+lJaWaOLRM2P/11ebKZZZLR9aab5YAkY+YYoU
 WnOXDtsbHzHFEHn/SyFZyp6V3qVPfUlA1eG30bEZkliavNsoOAmSxR2PGrPD1xyDrX4T3tFoOd1
 sm7PLLI+
X-Proofpoint-GUID: pQb_hjq-1DWXoscSvz8ywYespcThH8YI
X-Proofpoint-ORIG-GUID: pQb_hjq-1DWXoscSvz8ywYespcThH8YI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

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
 drivers/hwtracing/coresight/coresight-tnoc.c | 116 ++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..ca96c3e66d683d6c1d1215b1b48d2f7b7f58d5b0 100644
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
@@ -51,12 +53,17 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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
 	 * - Set the FLAG packets to 'FLAG' packets
 	 * - Set the FREQ packets to 'FREQ_TS' packets
@@ -68,8 +75,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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


