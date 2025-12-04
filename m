Return-Path: <linux-arm-msm+bounces-84292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83387CA256B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88D953073169
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CD0303A03;
	Thu,  4 Dec 2025 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvwbA8er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTs7CArP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064593019A7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823398; cv=none; b=RkZxt5mi7Hou+3MnqwOMoo5sV0EXPF72raVBk/fNWshyVNE+SsW8r1QJOt+tv1XBetLvAwB4XITTM+bKbt4Yd87bMxRoYmh2l3+5VPtCBgb4mZRIEWAp5MA+QLO3zg3pD6XlMC1Z2zGHhGTr24ybvqxKA3zOt8DPVnhjHz9nQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823398; c=relaxed/simple;
	bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFJDvpptq0LkbGUNmnxcI259sQaO5rCzE+D8vzrFBilBUc8gTnNdIG42WBXiZ0NDnPweckcKWCd4bP6c9WHJfD4yjAqQBKM1DJs1AB0mFPExmyaZvv8no3400Y7/gKD4sxjJIwNXBP7Yt02VmopsJuYSC0i3VglxjJDxaEGnUr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvwbA8er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTs7CArP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GOKdu2659326
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=kvwbA8erHs7ibcJD
	a1SX96/NqavGIaAHA3Sh7X0NqbLqfoefAOgYsMK4oOn7tOf65SmRq+XC84WIfZbH
	fBUy4/nqOwJp4lNRspiyyYvyj5/C1qH2BST8nUm6j9I3n5tx2CzP1Rh0eZ8n3AEK
	Jhizv8tzd7YIM7hrg4k/Wd0zeEnbueVUNdh7HImeWV/uEA5NXa6eU6f1RL1IAV3x
	ge+5/22j0AIA5CWWm1h/2o0ZTG+q/TPyfQr9yGrRgRms0xAb5TBcVyHq6g5dATtr
	NVKFxto3vBpepBHyWRxMRJ4iUORoCy31TWzX4rrJ2Mud6vQ3RyZpUhlgMujohT5x
	njHYcw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrpphxju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:43:15 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7c7599a6f1fso1036440a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823394; x=1765428194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=VTs7CArPocUZPPYqqyb5va0vaHxU7fP+k++S9t5fqRv+SpUS76MUzIoVIaq6TXmo0f
         PzKdyvmxIX6jzcAYQVgsz2Nm03THnjF7UcweQelRBVPjeulnr4DjYBEvStUBOQpCaYOZ
         qI8AnSfUf+Tg28/4DBtEwdqTAT5cwgUNXEQDNORyuvb+1z2OGNe3KCIcU0pZ9jlLmI8B
         wo/CRaaL6FUMFoZ1WWYh+EgB2dn/imn+Vz3fpzYlLRWJ/rHwT2pKrnUmst1Ei4E1XkdQ
         nv9/AOFG6YGIjvABebBAUpy5o67/A2pouSdDhfZMSeMIUriVE6Io+prjI6bIRM5/5evP
         XN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823394; x=1765428194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=ueVbxIBXUTMdNiTNtIPXIf7DS4W4/+XEn/u5K5UyOIh6ZYewK3YYmS5hA67fnBq9Za
         I0D3n8tWtb7Onf7UtBSe9PkHBI+3j+cJWoUIuhle0JF23u1J60DD2wbj9cptvvCLcH6H
         korxaUaOnNgYW4B0I67ZfaLwncxq3IsC6PXqIzoHt9GwtmFKQlBgqWd2D8AFDuhwqzJs
         Y52iSMTQg9ZdMPm93IjWuJ/f/k2VxySzqMir0BIVyaoZCC8dkqMmncQn+ujKOjMZ3VYH
         8xOVU53IN4KPmgcP2yGH0laIyXBLifHAUfHo/pgt04RGLzNm+H/mD4glywh6NB5CYi7g
         bxKw==
X-Forwarded-Encrypted: i=1; AJvYcCXeU4vUm/mgrV+Gw3zXMRz0TvqYa5WAIDJxdwZ4mQeJmUFWlWYQbblafL7VPOgs9VsVok1kDe/FI9UHPe+2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkI5A3JZ1Ulacr0o5ho71V/ao5XWTi3KBFJDj2PCIeeqhqKXdy
	9K1lDRVszLZvZ6Fqdm5r0Q8vPzRFgoPStOQ2oeA7QHITCOQwqNqheYKxBuM2UhAXq9JsUTL1Z0L
	+li5Znh7RqwMHoGx9A0VGdHJvkpZv5OEiN5Tp7Wy8lOjG+psr25NW5oD1KyeEd2nhR6adfVSHHj
	/C4CE=
X-Gm-Gg: ASbGncuCxnmzLWgVmRoMYFFL66LS1C6jSJ64+yAznIWZ919/PuEPR3HnBxe06Ri9wp9
	FrOjAUaTJ9d9vBKHz2gm8+pifDbiR04rtJeNyR50VqMmylLxDXR5amRH0ysiDMv4c2TJ23rtLPQ
	TlHopfDoqdf6ZdtorPhoisBtg3PtM2quNfZ4z4AM4UDQWHySbXST5ooOkZp61dugKl4j7k8pXl9
	2Ui8SYIh4av9UvpzeP2J2qJSJrNkeqBLqa4EsUp5bnUuHknLnnqnbCWuANRXskidz+X4GQO4FAC
	4fdjWEqIvfsHLR/BdyxYHISktTQ4EtkVKBZXv8xNIrzj0lx2+2iWVkh3b5U9fa7JTS59MACu3LZ
	lL7a0Ryf4h/7HYI9LnPd7Cxlyy2DuuBJYKxbdkFji5k1afAyExI1o/QS4MQljlGX5pxI=
X-Received: by 2002:a05:6830:928:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7c94da8d653mr3905744a34.16.1764823394033;
        Wed, 03 Dec 2025 20:43:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfTC4VxSFkNGVr4Z5bujBFVddU6sL6eyMbA/c6ZS4EDGp+VnJNrluZK6lZDDhee9esv+QgHQ==
X-Received: by 2002:a05:6830:928:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7c94da8d653mr3905734a34.16.1764823393701;
        Wed, 03 Dec 2025 20:43:13 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:13 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 20:43:08 -0800
Subject: [PATCH RESEND v5 2/3] coresight-tnoc: add platform driver to
 support Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-itnoc-v5-2-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=6708;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
 b=tkVi5jpLE980exzS+Ml41aR0N2Jk1T47l1iyiqMOLHp6mL/4uVVz7qGscZWkpxkGowYQJ6Zeu
 7Jo3qrDk1yNDot9ZSqeELlNhsyl0YKP0Ba5HB0Nc997/lEm6al1EhyA
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: U_1AJ-TqE5JxB922NzXDBy6LXNxsL0m5
X-Proofpoint-GUID: U_1AJ-TqE5JxB922NzXDBy6LXNxsL0m5
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=69311163 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=pUju2gecW9X7egxZnGUA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX212v7CW74Cvl
 C85y+GZzuLG4wJHf05IqM/ph7TyGHjmeg8DKisKIkhEyry4UJMFvLZzyh5yXJpnrtbHWmLgI/jl
 xx8poW7zZD6/SzkOWfyzrEbfBRHEd0bX0a3kE9Lv2Xw3MfvGsWX3RdDKlSZa6G6N5HJ75zTqzeD
 LXzpLWiK5xmSP5koarQEw6Zmo4knSJikwNVWH6rbK1LD+PeW0ebST06WIRjgK5dw8CN6mYtHqaJ
 oLviBAn4oCloZfRxGox/a4yJbwyVPULlT3tPncAtwg6mETHGN+42du6ilVIWJ9b+wBKgjxgMpwP
 ax+wNAiwNyOborgduRpZRWIuvCOHIMcnLFfZ/PFeDaW0TfqjhyL/DTreI388ZNW27tnj5lO5fzU
 zHCGdJL7IUxsJtSf5ArQtROLXzyN+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040035

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


