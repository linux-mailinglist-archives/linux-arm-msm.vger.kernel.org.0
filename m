Return-Path: <linux-arm-msm+bounces-103641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBk5IBGM5WlwlQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B942629C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCDA23001FDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57C6280338;
	Mon, 20 Apr 2026 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VH7g70XA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ii213Owo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430DE376BEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651277; cv=none; b=nSsLXX7GvoBnQJyd1Xk8VIklWvdv4168O8lGSFFYM918J7mh/uqpPM/igndvqm7eOJLwXUjYG27IdEAootsXBqJu5vWmOs1BudOPKsmkYffSoT/HRjRDgpNx5JR4avo5VUi3HQZYvFZcYgkP9gbX7BMLURoheiL2N4rwmVbNKwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651277; c=relaxed/simple;
	bh=2cBT5GFnt0isDS4RzsxCdpiPt3QeQ3meQCU9TA1A8EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8fbZD7abp9r9DaYgTvyyXSgKzddOX+8Shgan2waRqZ1lt0d1ai3sJZQ6wRtqNlFQxZJrGtQnzYnnuzkqxWpOOjZ0+1VpcRE0vdhlKn9t4mgrOfZd6dF4v9CZ5S3jbA4xP0dqloDsQknfO6ONzqnq9HTdJSkZzCShq9HPyMIir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VH7g70XA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ii213Owo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JMviwK1475377
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0C/ne4E/r1t
	lBylE/wK5S1SqQoi9YmDu4k2L04v7f3A=; b=VH7g70XAgl7rizaYNjGJ9ylWzdu
	OYsoG8oSN5Ye5Iy5nYD76JP/tm7BCGxjfu6AGuBeU4/TOpCvzVAwGNIJfv7pnMHX
	rChnagRyHzXqLG6AdpwUsUv3R+qH2Wkztu9+spMCHlr6askd988v3n4RlynhVBhx
	+YwmAgTtdoYOcXmJD3oFio0dsn0/kxBTr8/TGahIoxb+tJv2mCUcbFwa0qnLRr8V
	Qk4wNZ+LPjWOfw7tN7GNjyH4fl1UB71/NzJzNjkUb4Ilx6kaDvphLC4h66EKrcXa
	ogeUsdG9mOw5RzdsrEIrUlB8WMHCRtlDPEvmql12pM2x9mMYpoHGb7cCG/w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3t3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:14:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1275c6fc58aso3351664c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651273; x=1777256073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C/ne4E/r1tlBylE/wK5S1SqQoi9YmDu4k2L04v7f3A=;
        b=Ii213Owow+Xtgd0Ea9vmyPFu15y514bv0E8/G1rRU9enEDSLxTlYWr0qVyvPuVlT/h
         9yxMMDlMV8nNergOojzDgMf8x3jxL0kCZEvCZclQF/TtrFCzPwKmjfyTIlA7Lree8Xik
         DWxfKDjX2kslobjfQxRRW7bSUbLEOO+XQ6MJP7pKNY6SKoWpqXqfljgeIBb8t6ySsuu6
         9zbj+qcgx9weZbM9cdooDleG2osdFYvgysPqvSXbGOuuiL2KOkHrIPz4UQwS557rZcNb
         e5hSsXAl4Xy74eWT4By801rkdsflfDYQBazkGfZtBySw8fMhghXo63S718wqZNBjZObh
         tySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651273; x=1777256073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0C/ne4E/r1tlBylE/wK5S1SqQoi9YmDu4k2L04v7f3A=;
        b=erVgT7ZkE6P8npXtSfXSDbbbHtRTzmVlMWDRpDleoE3gGRu2tVnBHS40kwAxGPdIZS
         81TtxjRezle6Dz3wy56Xs4poyT+EQ2SwfMx63uNu2jnjqxwWVD67LgLqlpZctyCXNWAj
         EkNeLkzVGjFNcfXqGzfNS8NJU4JBcb3jLIuPFGUcV3Kf97M8zrluc3Yqx6lTnE2ZIe81
         8hKFpq04g8DEgvWJiCK0bJJhEN6j/yJLmVlUMNRJxs+Sp+zA9k7OaaAV0/NgJuxT7jZF
         5dm1P+ThXZr2h/mYOT2QViw4Ud5PhFUVbX7dNsmjmTISNgB+MOZBprioXj2yHkwV+CwS
         3byg==
X-Forwarded-Encrypted: i=1; AFNElJ+lUHu8QMjmuSa+LgAhyIpA3VXomerWG3OmTpA8+xMP3jK2Z28HrbwsBNbXKmUhfb0ULh+kFJvRIHQHV2Q6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0az5iC2cvFpOGm1GgkVEEEw/TVoQea9cJkQcw1dgWp1KOM/nF
	shh9YCZuioc3K4OaW5SmS8Lq6vb7bnY9DIzi12gHv4DoD0AWexttyvQqyYzqOgCq3FYT5xz/sS1
	gtUWxT6Z8xz/mt5cHQmrWt0TKgmuSjZFUYgCkgnA4eUGZTVW+LcjOUtb0M46Hcqcv38RF
X-Gm-Gg: AeBDieu3bFoXvN5mX7/9XjeJ/05WM8l3l6Zfrxgfaj2TEJiW9vhKLdhP1rK790/NqJZ
	UdDI2qoZb71Qbw84Qs6R/a2WN5tpzNeKsnQeJ5BMG1LSiYl12PVXSmO8xJzotS3JuvAFh7hA/Ew
	Jx3x9Q7fCNtxirD62x1oRG26SskyQiCSBFLDVFo7QcIZPT/H3Bju0Mr2C22i35iKdsRdfkDfY5X
	hvAtD+8UbAj8F2ubyv4ynNKjUnUOAuEd5xt7hts2BoXzaASNVnkAOQxVYKg+aiy3Vmigdmpjz6m
	ChkolMICGHunAZPxDU+xhr3ML7+ZBX9C35rEh8kE0/lsEEneDemipy/6OXBQdKAFR260LDdmWhn
	mOxGkrzJcVyHJ/gWUjLw+5LESocx75QKbiYqabLQ9KH/bx07FT7a2UEapi7SNJsGvw7Duvj8tBw
	sSpWOWefRaQ1i4n0E1
X-Received: by 2002:a05:7022:6b99:b0:128:d352:bf8a with SMTP id a92af1059eb24-12c73fcec58mr5866126c88.33.1776651272077;
        Sun, 19 Apr 2026 19:14:32 -0700 (PDT)
X-Received: by 2002:a05:7022:6b99:b0:128:d352:bf8a with SMTP id a92af1059eb24-12c73fcec58mr5866099c88.33.1776651271186;
        Sun, 19 Apr 2026 19:14:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm12556600eec.12.2026.04.19.19.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:14:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver for Nord SoC
Date: Mon, 20 Apr 2026 10:13:51 +0800
Message-ID: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAxOSBTYWx0ZWRfX4B5sQtxfRKD6
 JDM9RdvXcC122VEGqF9+0zPiIrdSdA22Xhrkubtt4c2fbAduXi8/IAfXqgzlUa3JxAC3fYmtK5e
 nIs1zUstyGoQzHPbx1DJIGQVjP8/2iip1+2gqcyg3jbva56NJ1gZrw8to616bSU3Jn/pJ6VxUiW
 5f1rsQOWS0btGqXdkRsmMv2f6ohJXvfCt0ZtPiTi9qGLpfB7k84TkSgtdry+603/8oyB0KJZgA5
 iDorBc42qetRlABvXYKdfgHtpX8VgC0kApPmOjesiQt5CmQP4vod2nYVhrisZa5vyL0VGx4yLfg
 Xww1So1dIXCkIcZvMczg/UUktpzjsMrAonuD6kNILBsbgqb4AWKWoFW0erMtSWtMhE+vHMp8I0P
 aAG1RGq1n2OKZatSP8uRSxjGwhNpqfDYTV13O9RJx88XSnEFULAtjYJK9nEdD6Wug0i+oHo6nfX
 L/srasBPedWPK0Z3R5A==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e58c09 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dw5cIN1h9ciE3QL4M0UA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ALXSUqhgvY4_dBc7WDUIis1GwVEJiIeJ
X-Proofpoint-GUID: ALXSUqhgvY4_dBc7WDUIis1GwVEJiIeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200019
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103641-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 287B942629C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>

Add driver for the Qualcomm interconnect buses found on Nord SoC.
The topology consists of several NoCs that are controlled by
a remote processor that collects the aggregated bandwidth for each
master-slave pair.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig  |   11 +
 drivers/interconnect/qcom/Makefile |    2 +
 drivers/interconnect/qcom/nord.c   | 2682 ++++++++++++++++++++++++++++
 3 files changed, 2695 insertions(+)
 create mode 100644 drivers/interconnect/qcom/nord.c

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..32808772c363 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -107,6 +107,17 @@ config INTERCONNECT_QCOM_MSM8996
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
 	  platforms.
 
+config INTERCONNECT_QCOM_NORD
+	tristate "Qualcomm Nord interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on Nord-based
+	  platforms. The topology consists of several NoCs controlled by
+	  the RPMh hardware and communicates via Bus Clock Manager (BCM)
+	  through the Resource State Coordinator (RSC).
+
 config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index cdf2c6c9fbf3..988fa8b0f509 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -16,6 +16,7 @@ qnoc-msm8953-objs			:= msm8953.o
 qnoc-msm8974-objs			:= msm8974.o
 qnoc-msm8976-objs			:= msm8976.o
 qnoc-msm8996-objs			:= msm8996.o
+qnoc-nord-objs				:= nord.o
 icc-osm-l3-objs				:= osm-l3.o
 qnoc-qcm2290-objs			:= qcm2290.o
 qnoc-qcs404-objs			:= qcs404.o
@@ -61,6 +62,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM_MSM8953) += qnoc-msm8953.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8976) += qnoc-msm8976.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8996) += qnoc-msm8996.o
+obj-$(CONFIG_INTERCONNECT_QCOM_NORD) += qnoc-nord.o
 obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
 obj-$(CONFIG_INTERCONNECT_QCOM_QCM2290) += qnoc-qcm2290.o
 obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
diff --git a/drivers/interconnect/qcom/nord.c b/drivers/interconnect/qcom/nord.c
new file mode 100644
index 000000000000..598a9c15632c
--- /dev/null
+++ b/drivers/interconnect/qcom/nord.c
@@ -0,0 +1,2682 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+
+#include "bcm-voter.h"
+#include "icc-rpmh.h"
+
+static struct qcom_icc_node qup0_core_slave = {
+	.name = "qup0_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup1_core_slave = {
+	.name = "qup1_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup2_core_slave = {
+	.name = "qup2_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup3_core_slave = {
+	.name = "qup3_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node ps_eth_0 = {
+	.name = "ps_eth_0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node ps_eth_1 = {
+	.name = "ps_eth_1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node ps_shs_server = {
+	.name = "ps_shs_server",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy0 = {
+	.name = "qhs_ahb2phy0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy1 = {
+	.name = "qhs_ahb2phy1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy2 = {
+	.name = "qhs_ahb2phy2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy3 = {
+	.name = "qhs_ahb2phy3",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy_eth_0 = {
+	.name = "qhs_ahb2phy_eth_0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy_eth_1 = {
+	.name = "qhs_ahb2phy_eth_1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_camera_cfg = {
+	.name = "qhs_camera_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_clk_ctl = {
+	.name = "qhs_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_crypto0_cfg = {
+	.name = "qhs_crypto0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_crypto1_cfg = {
+	.name = "qhs_crypto1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_crypto2_cfg = {
+	.name = "qhs_crypto2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_display_1_cfg = {
+	.name = "qhs_display_1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_display_cfg = {
+	.name = "qhs_display_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_dprx0 = {
+	.name = "qhs_dprx0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_dprx1 = {
+	.name = "qhs_dprx1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_eva_cfg = {
+	.name = "qhs_eva_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_gpuss_0_cfg = {
+	.name = "qhs_gpuss_0_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_gpuss_1_cfg = {
+	.name = "qhs_gpuss_1_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_i2c = {
+	.name = "qhs_i2c",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_imem_cfg = {
+	.name = "qhs_imem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_mcw_pcie = {
+	.name = "qhs_mcw_pcie",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_mm_rscc = {
+	.name = "qhs_mm_rscc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ne_clk_ctl = {
+	.name = "qhs_ne_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_nspss0_cfg = {
+	.name = "qhs_nspss0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_nspss1_cfg = {
+	.name = "qhs_nspss1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_nspss2_cfg = {
+	.name = "qhs_nspss2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_nspss3_cfg = {
+	.name = "qhs_nspss3_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_nw_clk_ctl = {
+	.name = "qhs_nw_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_prng = {
+	.name = "qhs_prng",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qdss_cfg = {
+	.name = "qhs_qdss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qspi = {
+	.name = "qhs_qspi",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup0 = {
+	.name = "qhs_qup0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup02 = {
+	.name = "qhs_qup02",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup1 = {
+	.name = "qhs_qup1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup2 = {
+	.name = "qhs_qup2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_safedma_cfg = {
+	.name = "qhs_safedma_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_sdc4 = {
+	.name = "qhs_sdc4",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_se_clk_ctl = {
+	.name = "qhs_se_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tcsr = {
+	.name = "qhs_tcsr",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tlmm = {
+	.name = "qhs_tlmm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tsc_cfg = {
+	.name = "qhs_tsc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ufs_mem_cfg = {
+	.name = "qhs_ufs_mem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb2 = {
+	.name = "qhs_usb2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_0 = {
+	.name = "qhs_usb3_0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_1 = {
+	.name = "qhs_usb3_1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_venus_cfg = {
+	.name = "qhs_venus_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_computenoc_cfg = {
+	.name = "qss_computenoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_qtc_cfg = {
+	.name = "qss_qtc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_qdss_stm = {
+	.name = "xs_qdss_stm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_sys_tcu0_cfg = {
+	.name = "xs_sys_tcu0_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node xs_sys_tcu1_cfg = {
+	.name = "xs_sys_tcu1_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node xs_sys_tcu2_cfg = {
+	.name = "xs_sys_tcu2_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_aoss = {
+	.name = "qhs_aoss",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_hbcu = {
+	.name = "qhs_hbcu",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipa = {
+	.name = "qhs_ipa",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipc_router = {
+	.name = "qhs_ipc_router",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_soccp = {
+	.name = "qhs_soccp",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tme_cfg = {
+	.name = "qhs_tme_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_ddrss_cfg = {
+	.name = "qss_ddrss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qxs_imem = {
+	.name = "qxs_imem",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node ebi = {
+	.name = "ebi",
+	.channels = 16,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_ahb2phy_cfg = {
+	.name = "qhs_pcie_ahb2phy_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg_0 = {
+	.name = "qhs_pcie_cfg_0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg_1 = {
+	.name = "qhs_pcie_cfg_1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg_2 = {
+	.name = "qhs_pcie_cfg_2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg_3 = {
+	.name = "qhs_pcie_cfg_3",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_dma_0_cfg = {
+	.name = "qhs_pcie_dma_0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_dma_1_cfg = {
+	.name = "qhs_pcie_dma_1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_dma_2_cfg = {
+	.name = "qhs_pcie_dma_2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qxs_pcie_dma_0 = {
+	.name = "qxs_pcie_dma_0",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qxs_pcie_dma_1 = {
+	.name = "qxs_pcie_dma_1",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qxs_pcie_dma_2 = {
+	.name = "qxs_pcie_dma_2",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node xs_pcie_0 = {
+	.name = "xs_pcie_0",
+	.channels = 1,
+	.buswidth = 32,
+};
+
+static struct qcom_icc_node xs_pcie_1 = {
+	.name = "xs_pcie_1",
+	.channels = 1,
+	.buswidth = 32,
+};
+
+static struct qcom_icc_node xs_pcie_2 = {
+	.name = "xs_pcie_2",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node xs_pcie_3 = {
+	.name = "xs_pcie_3",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qup0_core_master = {
+	.name = "qup0_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup0_core_slave },
+};
+
+static struct qcom_icc_node qup1_core_master = {
+	.name = "qup1_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup1_core_slave },
+};
+
+static struct qcom_icc_node qup2_core_master = {
+	.name = "qup2_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup2_core_slave },
+};
+
+static struct qcom_icc_node qup3_core_master = {
+	.name = "qup3_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qup3_core_slave },
+};
+
+static struct qcom_icc_node llcc_mc = {
+	.name = "llcc_mc",
+	.channels = 16,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &ebi },
+};
+
+static struct qcom_icc_node qsm_pcie_noc_cfg = {
+	.name = "qsm_pcie_noc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 8,
+	.link_nodes = { &qhs_pcie_ahb2phy_cfg, &qhs_pcie_cfg_0,
+			&qhs_pcie_cfg_1, &qhs_pcie_cfg_2,
+			&qhs_pcie_cfg_3, &qhs_pcie_dma_0_cfg,
+			&qhs_pcie_dma_1_cfg, &qhs_pcie_dma_2_cfg },
+};
+
+static struct qcom_icc_node qnm_cnoc_pcie_dma = {
+	.name = "qnm_cnoc_pcie_dma",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 3,
+	.link_nodes = { &qxs_pcie_dma_0, &qxs_pcie_dma_1,
+			&qxs_pcie_dma_2 },
+};
+
+static struct qcom_icc_node qnm_hscnoc_pcie = {
+	.name = "qnm_hscnoc_pcie",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 4,
+	.link_nodes = { &xs_pcie_0, &xs_pcie_1,
+			&xs_pcie_2, &xs_pcie_3 },
+};
+
+static struct qcom_icc_node qnm_pcie_ibnoc_dma = {
+	.name = "qnm_pcie_ibnoc_dma",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &xs_pcie_0 },
+};
+
+static struct qcom_icc_node qss_pcie_noc_cfg = {
+	.name = "qss_pcie_noc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_pcie_noc_cfg },
+};
+
+static struct qcom_icc_node qns_pcie_dma = {
+	.name = "qns_pcie_dma",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_cnoc_pcie_dma },
+};
+
+static struct qcom_icc_node qns_llcc = {
+	.name = "qns_llcc",
+	.channels = 16,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &llcc_mc },
+};
+
+static struct qcom_icc_node qns_pcie = {
+	.name = "qns_pcie",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_hscnoc_pcie },
+};
+
+static struct qcom_icc_node qns_pcie_obnoc_dma = {
+	.name = "qns_pcie_obnoc_dma",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_pcie_ibnoc_dma },
+};
+
+static struct qcom_icc_node qsm_cfg = {
+	.name = "qsm_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 56,
+	.link_nodes = { &ps_eth_0, &ps_eth_1,
+			&ps_shs_server, &qhs_ahb2phy0,
+			&qhs_ahb2phy1, &qhs_ahb2phy2,
+			&qhs_ahb2phy3, &qhs_ahb2phy_eth_0,
+			&qhs_ahb2phy_eth_1, &qhs_camera_cfg,
+			&qhs_clk_ctl, &qhs_crypto0_cfg,
+			&qhs_crypto1_cfg, &qhs_crypto2_cfg,
+			&qhs_display_1_cfg, &qhs_display_cfg,
+			&qhs_dprx0, &qhs_dprx1,
+			&qhs_eva_cfg, &qhs_gpuss_0_cfg,
+			&qhs_gpuss_1_cfg, &qhs_i2c,
+			&qhs_imem_cfg, &qhs_mcw_pcie,
+			&qhs_mm_rscc, &qhs_ne_clk_ctl,
+			&qhs_nspss0_cfg, &qhs_nspss1_cfg,
+			&qhs_nspss2_cfg, &qhs_nspss3_cfg,
+			&qhs_nw_clk_ctl, &qhs_prng,
+			&qhs_qdss_cfg, &qhs_qspi,
+			&qhs_qup0, &qhs_qup02,
+			&qhs_qup1, &qhs_qup2,
+			&qhs_safedma_cfg, &qhs_sdc4,
+			&qhs_se_clk_ctl, &qhs_tcsr,
+			&qhs_tlmm, &qhs_tsc_cfg,
+			&qhs_ufs_mem_cfg, &qhs_usb2,
+			&qhs_usb3_0, &qhs_usb3_1,
+			&qhs_venus_cfg, &qss_computenoc_cfg,
+			&qss_pcie_noc_cfg, &qss_qtc_cfg,
+			&xs_qdss_stm, &xs_sys_tcu0_cfg,
+			&xs_sys_tcu1_cfg, &xs_sys_tcu2_cfg },
+};
+
+static struct qcom_icc_node xm_gic = {
+	.name = "xm_gic",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa44000 },
+		.prio = 4,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_node qss_cfg = {
+	.name = "qss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qsm_cfg },
+};
+
+static struct qcom_icc_node qhm_mm_rscc = {
+	.name = "qhm_mm_rscc",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = { &qss_cfg },
+};
+
+static struct qcom_icc_node qnm_hscnoc = {
+	.name = "qnm_hscnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 10,
+	.link_nodes = { &qhs_aoss, &qhs_hbcu,
+			&qhs_ipa, &qhs_ipc_router,
+			&qhs_soccp, &qhs_tme_cfg,
+			&qns_pcie_dma, &qss_cfg,
+			&qss_ddrss_cfg, &qxs_imem },
+};
+
+static struct qcom_icc_node qns_hscnoc_cnoc = {
+	.name = "qns_hscnoc_cnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_hscnoc },
+};
+
+static struct qcom_icc_node alm_gpu_tcu = {
+	.name = "alm_gpu_tcu",
+	.channels = 2,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x930000, 0xa45000 },
+		.prio = 1,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_qtc = {
+	.name = "alm_qtc",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x242000 },
+		.prio = 3,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_sys_tcu0 = {
+	.name = "alm_sys_tcu0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa42000 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_sys_tcu1 = {
+	.name = "alm_sys_tcu1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x81c000 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_sys_tcu2 = {
+	.name = "alm_sys_tcu2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x30000 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node chm_apps = {
+	.name = "chm_apps",
+	.channels = 6,
+	.buswidth = 32,
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_aggre_north = {
+	.name = "qnm_aggre_north",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x935000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_aggre_south = {
+	.name = "qnm_aggre_south",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x31000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_gpu0 = {
+	.name = "qnm_gpu0",
+	.channels = 4,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x931000, 0x932000, 0x933000, 0x934000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_gpu1 = {
+	.name = "qnm_gpu1",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0xa40000, 0xa41000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_hpass_adas_hscnoc = {
+	.name = "qnm_hpass_adas_hscnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x240000, 0x245000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_hpass_audio_hscnoc = {
+	.name = "qnm_hpass_audio_hscnoc",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x241000 },
+		.prio = 3,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_mnoc_hf = {
+	.name = "qnm_mnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x81a000, 0x81d000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_mnoc_sf = {
+	.name = "qnm_mnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x81b000, 0x81e000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_nsp0_hscnoc = {
+	.name = "qnm_nsp0_hscnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x32000, 0x33000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_nsp1_hscnoc = {
+	.name = "qnm_nsp1_hscnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x34000, 0x35000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_nsp2_hscnoc = {
+	.name = "qnm_nsp2_hscnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x36000, 0x37000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_nsp3_hscnoc = {
+	.name = "qnm_nsp3_hscnoc",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x38000, 0x39000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_pcie = {
+	.name = "qnm_pcie",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x244000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node qnm_sailss_md0_hscnoc = {
+	.name = "qnm_sailss_md0_hscnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x243000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qnm_snoc_sf = {
+	.name = "qnm_snoc_sf",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa43000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 3,
+	.link_nodes = { &qns_hscnoc_cnoc, &qns_llcc,
+			&qns_pcie },
+};
+
+static struct qcom_icc_node qns_a1noc_hscnoc = {
+	.name = "qns_a1noc_hscnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_aggre_north },
+};
+
+static struct qcom_icc_node qns_a2noc_hscnoc = {
+	.name = "qns_a2noc_hscnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_aggre_south },
+};
+
+static struct qcom_icc_node qns_hpass_agnoc_audio = {
+	.name = "qns_hpass_agnoc_audio",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_hpass_audio_hscnoc },
+};
+
+static struct qcom_icc_node qns_mem_noc_hf = {
+	.name = "qns_mem_noc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_mnoc_hf },
+};
+
+static struct qcom_icc_node qns_mem_noc_sf = {
+	.name = "qns_mem_noc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_mnoc_sf },
+};
+
+static struct qcom_icc_node qns_nsp0_hsc_noc = {
+	.name = "qns_nsp0_hsc_noc",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_nsp0_hscnoc },
+};
+
+static struct qcom_icc_node qns_nsp1_hsc_noc = {
+	.name = "qns_nsp1_hsc_noc",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_nsp1_hscnoc },
+};
+
+static struct qcom_icc_node qns_nsp2_hsc_noc = {
+	.name = "qns_nsp2_hsc_noc",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_nsp2_hscnoc },
+};
+
+static struct qcom_icc_node qns_nsp3_hsc_noc = {
+	.name = "qns_nsp3_hsc_noc",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qnm_nsp3_hscnoc },
+};
+
+static struct qcom_icc_node qns_pcie_hscnoc = {
+	.name = "qns_pcie_hscnoc",
+	.channels = 1,
+	.buswidth = 64,
+	.num_links = 1,
+	.link_nodes = { &qnm_pcie },
+};
+
+static struct qcom_icc_node qns_hscnoc_sf = {
+	.name = "qns_hscnoc_sf",
+	.channels = 1,
+	.buswidth = 64,
+	.num_links = 1,
+	.link_nodes = { &qnm_snoc_sf },
+};
+
+static struct qcom_icc_node qhm_qup2 = {
+	.name = "qhm_qup2",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1b000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node qxm_crypto_0 = {
+	.name = "qxm_crypto_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1c000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node qxm_crypto_1 = {
+	.name = "qxm_crypto_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1d000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node qxm_crypto_2 = {
+	.name = "qxm_crypto_2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1e000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_sdc4 = {
+	.name = "xm_sdc4",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_ufs_mem = {
+	.name = "xm_ufs_mem",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x17000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb2 = {
+	.name = "xm_usb2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x19000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb3_0 = {
+	.name = "xm_usb3_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x18000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb3_1 = {
+	.name = "xm_usb3_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1a000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_hscnoc },
+};
+
+static struct qcom_icc_node qhm_qup0 = {
+	.name = "qhm_qup0",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_hscnoc },
+};
+
+static struct qcom_icc_node qhm_qup1 = {
+	.name = "qhm_qup1",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_emac_0 = {
+	.name = "xm_emac_0",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_emac_1 = {
+	.name = "xm_emac_1",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x17000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_hscnoc },
+};
+
+static struct qcom_icc_node qnm_hpass_dsp0 = {
+	.name = "qnm_hpass_dsp0",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_hpass_agnoc_audio },
+};
+
+static struct qcom_icc_node qnm_hpass_dsp1 = {
+	.name = "qnm_hpass_dsp1",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_hpass_agnoc_audio },
+};
+
+static struct qcom_icc_node qnm_hpass_dsp2 = {
+	.name = "qnm_hpass_dsp2",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_hpass_agnoc_audio },
+};
+
+static struct qcom_icc_node qnm_camnoc_hf = {
+	.name = "qnm_camnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x57000, 0x58000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_camnoc_nrt_icp_sf = {
+	.name = "qnm_camnoc_nrt_icp_sf",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1a000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_rt_cdm_sf = {
+	.name = "qnm_camnoc_rt_cdm_sf",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x5b000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_sf = {
+	.name = "qnm_camnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1b000, 0x1c000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_dprx0 = {
+	.name = "qnm_dprx0",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x5c000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_dprx1 = {
+	.name = "qnm_dprx1",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x5d000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_mdp0 = {
+	.name = "qnm_mdp0",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x59000, 0x5a000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_mdp1 = {
+	.name = "qnm_mdp1",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x5e000, 0x5f000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_video_cv_cpu = {
+	.name = "qnm_video_cv_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x21000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_eva = {
+	.name = "qnm_video_eva",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x22000, 0x23000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_mvp0 = {
+	.name = "qnm_video_mvp0",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1d000, 0x1e000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_mvp1 = {
+	.name = "qnm_video_mvp1",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1f000, 0x20000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_v_cpu = {
+	.name = "qnm_video_v_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x24000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_nsp_data00 = {
+	.name = "qnm_nsp_data00",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_nsp0_hsc_noc },
+};
+
+static struct qcom_icc_node qnm_nsp_data01 = {
+	.name = "qnm_nsp_data01",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_nsp1_hsc_noc },
+};
+
+static struct qcom_icc_node qnm_nsp_data02 = {
+	.name = "qnm_nsp_data02",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_nsp2_hsc_noc },
+};
+
+static struct qcom_icc_node qnm_nsp_data03 = {
+	.name = "qnm_nsp_data03",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = { &qns_nsp3_hsc_noc },
+};
+
+static struct qcom_icc_node qxm_pcie_dma_0 = {
+	.name = "qxm_pcie_dma_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x49000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_pcie_hscnoc, &qns_pcie_obnoc_dma },
+};
+
+static struct qcom_icc_node qxm_pcie_dma_1 = {
+	.name = "qxm_pcie_dma_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4a000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_pcie_hscnoc, &qns_pcie_obnoc_dma },
+};
+
+static struct qcom_icc_node qxm_pcie_dma_2 = {
+	.name = "qxm_pcie_dma_2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x4b000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 2,
+	.link_nodes = { &qns_pcie_hscnoc, &qns_pcie_obnoc_dma },
+};
+
+static struct qcom_icc_node xm_pcie_0 = {
+	.name = "xm_pcie_0",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x18000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_hscnoc },
+};
+
+static struct qcom_icc_node xm_pcie_1 = {
+	.name = "xm_pcie_1",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x19000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_hscnoc },
+};
+
+static struct qcom_icc_node xm_pcie_2 = {
+	.name = "xm_pcie_2",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1a000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_hscnoc },
+};
+
+static struct qcom_icc_node xm_pcie_3 = {
+	.name = "xm_pcie_3",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1b000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_pcie_hscnoc },
+};
+
+static struct qcom_icc_node qnm_aggre1_noc = {
+	.name = "qnm_aggre1_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_node qnm_aggre2_noc = {
+	.name = "qnm_aggre2_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_node qnm_cnoc_data = {
+	.name = "qnm_cnoc_data",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1a000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_node qnm_nsi_noc = {
+	.name = "qnm_nsi_noc",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x19000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_node qnm_safe_dma = {
+	.name = "qnm_safe_dma",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1b000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_node qns_a1noc_snoc = {
+	.name = "qns_a1noc_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_aggre1_noc },
+};
+
+static struct qcom_icc_node qns_a2noc_snoc = {
+	.name = "qns_a2noc_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = { &qnm_aggre2_noc },
+};
+
+static struct qcom_icc_node qhm_qspi = {
+	.name = "qhm_qspi",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x18000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qnm_sailss_md1 = {
+	.name = "qnm_sailss_md1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_qup02 = {
+	.name = "qxm_qup02",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x17000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_ipa = {
+	.name = "qxm_ipa",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node qxm_soccp = {
+	.name = "qxm_soccp",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_0 = {
+	.name = "xm_qdss_etr_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_1 = {
+	.name = "xm_qdss_etr_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_bcm bcm_c0n0 = {
+	.name = "C0N0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp_data00, &qns_nsp0_hsc_noc },
+};
+
+static struct qcom_icc_bcm bcm_c1n0 = {
+	.name = "C1N0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp_data01, &qns_nsp1_hsc_noc },
+};
+
+static struct qcom_icc_bcm bcm_c2n0 = {
+	.name = "C2N0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp_data02, &qns_nsp2_hsc_noc },
+};
+
+static struct qcom_icc_bcm bcm_c3n0 = {
+	.name = "C3N0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp_data03, &qns_nsp3_hsc_noc },
+};
+
+static struct qcom_icc_bcm bcm_ce0 = {
+	.name = "CE0",
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto_0 },
+};
+
+static struct qcom_icc_bcm bcm_ce1 = {
+	.name = "CE1",
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto_1 },
+};
+
+static struct qcom_icc_bcm bcm_ce2 = {
+	.name = "CE2",
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto_2 },
+};
+
+static struct qcom_icc_bcm bcm_cn0 = {
+	.name = "CN0",
+	.keepalive = true,
+	.enable_mask = BIT(0),
+	.num_nodes = 6,
+	.nodes = { &qsm_cfg, &qhm_mm_rscc,
+		   &qnm_hscnoc, &qnm_cnoc_pcie_dma,
+		   &qnm_hscnoc_pcie, &qnm_pcie_ibnoc_dma },
+};
+
+static struct qcom_icc_bcm bcm_cn1 = {
+	.name = "CN1",
+	.num_nodes = 2,
+	.nodes = { &qhs_display_1_cfg, &qhs_display_cfg },
+};
+
+static struct qcom_icc_bcm bcm_mc0 = {
+	.name = "MC0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_mm0 = {
+	.name = "MM0",
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_bcm bcm_mm1 = {
+	.name = "MM1",
+	.enable_mask = BIT(0),
+	.num_nodes = 14,
+	.nodes = { &qnm_camnoc_hf, &qnm_camnoc_nrt_icp_sf,
+		   &qnm_camnoc_rt_cdm_sf, &qnm_camnoc_sf,
+		   &qnm_dprx0, &qnm_dprx1,
+		   &qnm_mdp0, &qnm_mdp1,
+		   &qnm_video_cv_cpu, &qnm_video_eva,
+		   &qnm_video_mvp0, &qnm_video_mvp1,
+		   &qnm_video_v_cpu, &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_bcm bcm_qup0 = {
+	.name = "QUP0",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup0_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup1 = {
+	.name = "QUP1",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup1_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup2 = {
+	.name = "QUP2",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup2_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup3 = {
+	.name = "QUP3",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup3_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_sh0 = {
+	.name = "SH0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_bcm bcm_sh1 = {
+	.name = "SH1",
+	.enable_mask = BIT(0),
+	.num_nodes = 24,
+	.nodes = { &alm_gpu_tcu, &alm_qtc,
+		   &alm_sys_tcu0, &alm_sys_tcu1,
+		   &alm_sys_tcu2, &chm_apps,
+		   &qnm_aggre_north, &qnm_aggre_south,
+		   &qnm_gpu0, &qnm_gpu1,
+		   &qnm_hpass_adas_hscnoc, &qnm_hpass_audio_hscnoc,
+		   &qnm_mnoc_hf, &qnm_mnoc_sf,
+		   &qnm_nsp0_hscnoc, &qnm_nsp1_hscnoc,
+		   &qnm_nsp2_hscnoc, &qnm_nsp3_hscnoc,
+		   &qnm_pcie, &qnm_sailss_md0_hscnoc,
+		   &qnm_snoc_sf, &xm_gic,
+		   &qns_hscnoc_cnoc, &qns_pcie },
+};
+
+static struct qcom_icc_bcm bcm_sn0 = {
+	.name = "SN0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_hscnoc_sf },
+};
+
+static struct qcom_icc_bcm bcm_sn1 = {
+	.name = "SN1",
+	.enable_mask = BIT(0),
+	.num_nodes = 14,
+	.nodes = { &qns_a1noc_hscnoc, &qns_a2noc_hscnoc,
+		   &qxm_pcie_dma_0, &qxm_pcie_dma_1,
+		   &qxm_pcie_dma_2, &xm_pcie_0,
+		   &xm_pcie_1, &xm_pcie_2,
+		   &xm_pcie_3, &qns_pcie_hscnoc,
+		   &qns_pcie_obnoc_dma, &qnm_cnoc_data,
+		   &qnm_nsi_noc, &qnm_safe_dma },
+};
+
+static struct qcom_icc_bcm bcm_sn2 = {
+	.name = "SN2",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre1_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn3 = {
+	.name = "SN3",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre2_noc },
+};
+
+static struct qcom_icc_node * const aggre1_noc_nodes[] = {
+	[MASTER_QSPI_0] = &qhm_qspi,
+	[MASTER_SAILSS_MD1] = &qnm_sailss_md1,
+	[MASTER_QUP_3] = &qxm_qup02,
+	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
+};
+
+static const struct regmap_config nord_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_aggre1_noc = {
+	.config = &nord_aggre1_noc_regmap_config,
+	.nodes = aggre1_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
+};
+
+static struct qcom_icc_bcm * const aggre1_noc_tile_bcms[] = {
+	&bcm_ce0,
+	&bcm_ce1,
+	&bcm_ce2,
+	&bcm_sn1,
+};
+
+static struct qcom_icc_node * const aggre1_noc_tile_nodes[] = {
+	[MASTER_QUP_2] = &qhm_qup2,
+	[MASTER_CRYPTO_CORE0] = &qxm_crypto_0,
+	[MASTER_CRYPTO_CORE1] = &qxm_crypto_1,
+	[MASTER_CRYPTO_CORE2] = &qxm_crypto_2,
+	[MASTER_SDCC_4] = &xm_sdc4,
+	[MASTER_UFS_MEM] = &xm_ufs_mem,
+	[MASTER_USB2] = &xm_usb2,
+	[MASTER_USB3_0] = &xm_usb3_0,
+	[MASTER_USB3_1] = &xm_usb3_1,
+	[SLAVE_A1NOC_HSCNOC] = &qns_a1noc_hscnoc,
+};
+
+static const struct regmap_config nord_aggre1_noc_tile_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x23400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_aggre1_noc_tile = {
+	.config = &nord_aggre1_noc_tile_regmap_config,
+	.nodes = aggre1_noc_tile_nodes,
+	.num_nodes = ARRAY_SIZE(aggre1_noc_tile_nodes),
+	.bcms = aggre1_noc_tile_bcms,
+	.num_bcms = ARRAY_SIZE(aggre1_noc_tile_bcms),
+};
+
+static struct qcom_icc_node * const aggre2_noc_nodes[] = {
+	[MASTER_IPA] = &qxm_ipa,
+	[MASTER_SOCCP_AGGR_NOC] = &qxm_soccp,
+	[MASTER_QDSS_ETR] = &xm_qdss_etr_0,
+	[MASTER_QDSS_ETR_1] = &xm_qdss_etr_1,
+	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
+};
+
+static const struct regmap_config nord_aggre2_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1b400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_aggre2_noc = {
+	.config = &nord_aggre2_noc_regmap_config,
+	.nodes = aggre2_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
+};
+
+static struct qcom_icc_bcm * const aggre2_noc_tile_bcms[] = {
+	&bcm_sn1,
+};
+
+static struct qcom_icc_node * const aggre2_noc_tile_nodes[] = {
+	[MASTER_QUP_0] = &qhm_qup0,
+	[MASTER_QUP_1] = &qhm_qup1,
+	[MASTER_EMAC_0] = &xm_emac_0,
+	[MASTER_EMAC_1] = &xm_emac_1,
+	[SLAVE_A2NOC_HSCNOC] = &qns_a2noc_hscnoc,
+};
+
+static const struct regmap_config nord_aggre2_noc_tile_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1b400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_aggre2_noc_tile = {
+	.config = &nord_aggre2_noc_tile_regmap_config,
+	.nodes = aggre2_noc_tile_nodes,
+	.num_nodes = ARRAY_SIZE(aggre2_noc_tile_nodes),
+	.bcms = aggre2_noc_tile_bcms,
+	.num_bcms = ARRAY_SIZE(aggre2_noc_tile_bcms),
+};
+
+static struct qcom_icc_bcm * const clk_virt_bcms[] = {
+	&bcm_qup0,
+	&bcm_qup1,
+	&bcm_qup2,
+	&bcm_qup3,
+};
+
+static struct qcom_icc_node * const clk_virt_nodes[] = {
+	[MASTER_QUP_CORE_0] = &qup0_core_master,
+	[MASTER_QUP_CORE_1] = &qup1_core_master,
+	[MASTER_QUP_CORE_2] = &qup2_core_master,
+	[MASTER_QUP_CORE_3] = &qup3_core_master,
+	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
+	[SLAVE_QUP_CORE_1] = &qup1_core_slave,
+	[SLAVE_QUP_CORE_2] = &qup2_core_slave,
+	[SLAVE_QUP_CORE_3] = &qup3_core_slave,
+};
+
+static const struct qcom_icc_desc nord_clk_virt = {
+	.nodes = clk_virt_nodes,
+	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
+	.bcms = clk_virt_bcms,
+	.num_bcms = ARRAY_SIZE(clk_virt_bcms),
+};
+
+static struct qcom_icc_bcm * const cnoc_cfg_bcms[] = {
+	&bcm_cn0,
+	&bcm_cn1,
+};
+
+static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
+	[MASTER_CNOC_CFG] = &qsm_cfg,
+	[SLAVE_PS_ETH_0] = &ps_eth_0,
+	[SLAVE_PS_ETH_1] = &ps_eth_1,
+	[SLAVE_SHS_SERVER] = &ps_shs_server,
+	[SLAVE_AHB2PHY_0] = &qhs_ahb2phy0,
+	[SLAVE_AHB2PHY_1] = &qhs_ahb2phy1,
+	[SLAVE_AHB2PHY_2] = &qhs_ahb2phy2,
+	[SLAVE_AHB2PHY_3] = &qhs_ahb2phy3,
+	[SLAVE_AHB2PHY_ETH_0] = &qhs_ahb2phy_eth_0,
+	[SLAVE_AHB2PHY_ETH_1] = &qhs_ahb2phy_eth_1,
+	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
+	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
+	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
+	[SLAVE_CRYPTO_1_CFG] = &qhs_crypto1_cfg,
+	[SLAVE_CRYPTO_2_CFG] = &qhs_crypto2_cfg,
+	[SLAVE_DISPLAY_1_CFG] = &qhs_display_1_cfg,
+	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
+	[SLAVE_DPRX0] = &qhs_dprx0,
+	[SLAVE_DPRX1] = &qhs_dprx1,
+	[SLAVE_EVA_CFG] = &qhs_eva_cfg,
+	[SLAVE_GFX3D_CFG] = &qhs_gpuss_0_cfg,
+	[SLAVE_GFX3D_1_CFG] = &qhs_gpuss_1_cfg,
+	[SLAVE_I2C] = &qhs_i2c,
+	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
+	[SLAVE_MCW_PCIE] = &qhs_mcw_pcie,
+	[SLAVE_MM_RSCC] = &qhs_mm_rscc,
+	[SLAVE_NE_CLK_CTL] = &qhs_ne_clk_ctl,
+	[SLAVE_NSPSS0_CFG] = &qhs_nspss0_cfg,
+	[SLAVE_NSPSS1_CFG] = &qhs_nspss1_cfg,
+	[SLAVE_NSPSS2_CFG] = &qhs_nspss2_cfg,
+	[SLAVE_NSPSS3_CFG] = &qhs_nspss3_cfg,
+	[SLAVE_NW_CLK_CTL] = &qhs_nw_clk_ctl,
+	[SLAVE_PRNG] = &qhs_prng,
+	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
+	[SLAVE_QSPI_0] = &qhs_qspi,
+	[SLAVE_QUP_0] = &qhs_qup0,
+	[SLAVE_QUP_3] = &qhs_qup02,
+	[SLAVE_QUP_1] = &qhs_qup1,
+	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_SAFEDMA_CFG] = &qhs_safedma_cfg,
+	[SLAVE_SDCC_4] = &qhs_sdc4,
+	[SLAVE_SE_CLK_CTL] = &qhs_se_clk_ctl,
+	[SLAVE_TCSR] = &qhs_tcsr,
+	[SLAVE_TLMM] = &qhs_tlmm,
+	[SLAVE_TSC_CFG] = &qhs_tsc_cfg,
+	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
+	[SLAVE_USB2] = &qhs_usb2,
+	[SLAVE_USB3_0] = &qhs_usb3_0,
+	[SLAVE_USB3_1] = &qhs_usb3_1,
+	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
+	[SLAVE_COMPUTENOC_CFG] = &qss_computenoc_cfg,
+	[SLAVE_PCIE_NOC_CFG] = &qss_pcie_noc_cfg,
+	[SLAVE_QTC_CFG] = &qss_qtc_cfg,
+	[SLAVE_QDSS_STM] = &xs_qdss_stm,
+	[SLAVE_SYS_TCU0_CFG] = &xs_sys_tcu0_cfg,
+	[SLAVE_SYS_TCU1_CFG] = &xs_sys_tcu1_cfg,
+	[SLAVE_SYS_TCU2_CFG] = &xs_sys_tcu2_cfg,
+};
+
+static const struct regmap_config nord_cnoc_cfg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xd200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_cnoc_cfg = {
+	.config = &nord_cnoc_cfg_regmap_config,
+	.nodes = cnoc_cfg_nodes,
+	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
+	.bcms = cnoc_cfg_bcms,
+	.num_bcms = ARRAY_SIZE(cnoc_cfg_bcms),
+};
+
+static struct qcom_icc_bcm * const cnoc_main_bcms[] = {
+	&bcm_cn0,
+};
+
+static struct qcom_icc_node * const cnoc_main_nodes[] = {
+	[MASTER_MM_RSCC] = &qhm_mm_rscc,
+	[MASTER_HSCNOC_CNOC] = &qnm_hscnoc,
+	[SLAVE_AOSS] = &qhs_aoss,
+	[SLAVE_HBCU] = &qhs_hbcu,
+	[SLAVE_IPA_CFG] = &qhs_ipa,
+	[SLAVE_IPC_ROUTER_CFG] = &qhs_ipc_router,
+	[SLAVE_SOCCP] = &qhs_soccp,
+	[SLAVE_TME_CFG] = &qhs_tme_cfg,
+	[SLAVE_PCIE_DMA] = &qns_pcie_dma,
+	[SLAVE_CNOC_CFG] = &qss_cfg,
+	[SLAVE_DDRSS_CFG] = &qss_ddrss_cfg,
+	[SLAVE_IMEM] = &qxs_imem,
+};
+
+static const struct regmap_config nord_cnoc_main_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1d200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_cnoc_main = {
+	.config = &nord_cnoc_main_regmap_config,
+	.nodes = cnoc_main_nodes,
+	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
+	.bcms = cnoc_main_bcms,
+	.num_bcms = ARRAY_SIZE(cnoc_main_bcms),
+};
+
+static struct qcom_icc_node * const hpass_ag_noc_nodes[] = {
+	[MASTER_HPASS_PROC_0] = &qnm_hpass_dsp0,
+	[MASTER_HPASS_PROC_1] = &qnm_hpass_dsp1,
+	[MASTER_HPASS_PROC_2] = &qnm_hpass_dsp2,
+	[SLAVE_HPASS_AGNOC_AUDIO] = &qns_hpass_agnoc_audio,
+};
+
+static const struct regmap_config nord_hpass_ag_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x37080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_hpass_ag_noc = {
+	.config = &nord_hpass_ag_noc_regmap_config,
+	.nodes = hpass_ag_noc_nodes,
+	.num_nodes = ARRAY_SIZE(hpass_ag_noc_nodes),
+};
+
+static struct qcom_icc_bcm * const hscnoc_bcms[] = {
+	&bcm_sh0,
+	&bcm_sh1,
+};
+
+static struct qcom_icc_node * const hscnoc_nodes[] = {
+	[MASTER_GPU_TCU] = &alm_gpu_tcu,
+	[MASTER_QTC_TCU] = &alm_qtc,
+	[MASTER_SYS_TCU_0] = &alm_sys_tcu0,
+	[MASTER_SYS_TCU_1] = &alm_sys_tcu1,
+	[MASTER_SYS_TCU_2] = &alm_sys_tcu2,
+	[MASTER_APPSS_PROC] = &chm_apps,
+	[MASTER_A1NOC_TILE_HSCNOC] = &qnm_aggre_north,
+	[MASTER_A2NOC_TILE_HSCNOC] = &qnm_aggre_south,
+	[MASTER_GFX3D] = &qnm_gpu0,
+	[MASTER_GFX3D_1] = &qnm_gpu1,
+	[MASTER_HPASS_ADAS_HSCNOC] = &qnm_hpass_adas_hscnoc,
+	[MASTER_HPASS_AUDIO_HSCNOC] = &qnm_hpass_audio_hscnoc,
+	[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
+	[MASTER_MNOC_SF_MEM_NOC] = &qnm_mnoc_sf,
+	[MASTER_NSP0_HSCNOC] = &qnm_nsp0_hscnoc,
+	[MASTER_NSP1_HSCNOC] = &qnm_nsp1_hscnoc,
+	[MASTER_NSP2_HSCNOC] = &qnm_nsp2_hscnoc,
+	[MASTER_NSP3_HSCNOC] = &qnm_nsp3_hscnoc,
+	[MASTER_ANOC_PCIE_GEM_NOC] = &qnm_pcie,
+	[MASTER_SAILSS_MD0_HSCNOC] = &qnm_sailss_md0_hscnoc,
+	[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
+	[MASTER_GIC] = &xm_gic,
+	[SLAVE_HSCNOC_CNOC] = &qns_hscnoc_cnoc,
+	[SLAVE_LLCC] = &qns_llcc,
+	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
+};
+
+static const struct regmap_config nord_hscnoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x45080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_hscnoc = {
+	.config = &nord_hscnoc_regmap_config,
+	.nodes = hscnoc_nodes,
+	.num_nodes = ARRAY_SIZE(hscnoc_nodes),
+	.bcms = hscnoc_bcms,
+	.num_bcms = ARRAY_SIZE(hscnoc_bcms),
+};
+
+static struct qcom_icc_bcm * const mc_virt_bcms[] = {
+	&bcm_mc0,
+};
+
+static struct qcom_icc_node * const mc_virt_nodes[] = {
+	[MASTER_LLCC] = &llcc_mc,
+	[SLAVE_EBI1] = &ebi,
+};
+
+static const struct qcom_icc_desc nord_mc_virt = {
+	.nodes = mc_virt_nodes,
+	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
+	.bcms = mc_virt_bcms,
+	.num_bcms = ARRAY_SIZE(mc_virt_bcms),
+};
+
+static struct qcom_icc_bcm * const mmss_noc_bcms[] = {
+	&bcm_mm0,
+	&bcm_mm1,
+};
+
+static struct qcom_icc_node * const mmss_noc_nodes[] = {
+	[MASTER_CAMNOC_HF] = &qnm_camnoc_hf,
+	[MASTER_CAMNOC_NRT_ICP_SF] = &qnm_camnoc_nrt_icp_sf,
+	[MASTER_CAMNOC_RT_CDM_SF] = &qnm_camnoc_rt_cdm_sf,
+	[MASTER_CAMNOC_SF] = &qnm_camnoc_sf,
+	[MASTER_DPRX0] = &qnm_dprx0,
+	[MASTER_DPRX1] = &qnm_dprx1,
+	[MASTER_MDP0] = &qnm_mdp0,
+	[MASTER_MDP1] = &qnm_mdp1,
+	[MASTER_VIDEO_CV_PROC] = &qnm_video_cv_cpu,
+	[MASTER_VIDEO_EVA] = &qnm_video_eva,
+	[MASTER_VIDEO_MVP0] = &qnm_video_mvp0,
+	[MASTER_VIDEO_MVP1] = &qnm_video_mvp1,
+	[MASTER_VIDEO_V_PROC] = &qnm_video_v_cpu,
+	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
+	[SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
+};
+
+static const struct regmap_config nord_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x72800,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_mmss_noc = {
+	.config = &nord_mmss_noc_regmap_config,
+	.nodes = mmss_noc_nodes,
+	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
+	.bcms = mmss_noc_bcms,
+	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
+};
+
+static struct qcom_icc_bcm * const nsp_data_noc_0_bcms[] = {
+	&bcm_c0n0,
+};
+
+static struct qcom_icc_node * const nsp_data_noc_0_nodes[] = {
+	[MASTER_NSP0_PROC] = &qnm_nsp_data00,
+	[SLAVE_NSP0_HSC_NOC] = &qns_nsp0_hsc_noc,
+};
+
+static const struct regmap_config nord_nsp_data_noc_0_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2a200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_nsp_data_noc_0 = {
+	.config = &nord_nsp_data_noc_0_regmap_config,
+	.nodes = nsp_data_noc_0_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_data_noc_0_nodes),
+	.bcms = nsp_data_noc_0_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_data_noc_0_bcms),
+};
+
+static struct qcom_icc_bcm * const nsp_data_noc_1_bcms[] = {
+	&bcm_c1n0,
+};
+
+static struct qcom_icc_node * const nsp_data_noc_1_nodes[] = {
+	[MASTER_NSP1_PROC] = &qnm_nsp_data01,
+	[SLAVE_NSP1_HSC_NOC] = &qns_nsp1_hsc_noc,
+};
+
+static const struct regmap_config nord_nsp_data_noc_1_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2a200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_nsp_data_noc_1 = {
+	.config = &nord_nsp_data_noc_1_regmap_config,
+	.nodes = nsp_data_noc_1_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_data_noc_1_nodes),
+	.bcms = nsp_data_noc_1_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_data_noc_1_bcms),
+};
+
+static struct qcom_icc_bcm * const nsp_data_noc_2_bcms[] = {
+	&bcm_c2n0,
+};
+
+static struct qcom_icc_node * const nsp_data_noc_2_nodes[] = {
+	[MASTER_NSP2_PROC] = &qnm_nsp_data02,
+	[SLAVE_NSP2_HSC_NOC] = &qns_nsp2_hsc_noc,
+};
+
+static const struct regmap_config nord_nsp_data_noc_2_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2a200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_nsp_data_noc_2 = {
+	.config = &nord_nsp_data_noc_2_regmap_config,
+	.nodes = nsp_data_noc_2_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_data_noc_2_nodes),
+	.bcms = nsp_data_noc_2_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_data_noc_2_bcms),
+};
+
+static struct qcom_icc_bcm * const nsp_data_noc_3_bcms[] = {
+	&bcm_c3n0,
+};
+
+static struct qcom_icc_node * const nsp_data_noc_3_nodes[] = {
+	[MASTER_NSP3_PROC] = &qnm_nsp_data03,
+	[SLAVE_NSP3_HSC_NOC] = &qns_nsp3_hsc_noc,
+};
+
+static const struct regmap_config nord_nsp_data_noc_3_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2a200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_nsp_data_noc_3 = {
+	.config = &nord_nsp_data_noc_3_regmap_config,
+	.nodes = nsp_data_noc_3_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_data_noc_3_nodes),
+	.bcms = nsp_data_noc_3_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_data_noc_3_bcms),
+};
+
+static struct qcom_icc_node * const pcie_cfg_nodes[] = {
+	[MASTER_PCIE_NOC_CFG] = &qsm_pcie_noc_cfg,
+	[SLAVE_PCIE_AHB2PHY_CFG] = &qhs_pcie_ahb2phy_cfg,
+	[SLAVE_PCIE_CFG_0] = &qhs_pcie_cfg_0,
+	[SLAVE_PCIE_CFG_1] = &qhs_pcie_cfg_1,
+	[SLAVE_PCIE_CFG_2] = &qhs_pcie_cfg_2,
+	[SLAVE_PCIE_CFG_3] = &qhs_pcie_cfg_3,
+	[SLAVE_PCIE_DMA_0_CFG] = &qhs_pcie_dma_0_cfg,
+	[SLAVE_PCIE_DMA_1_CFG] = &qhs_pcie_dma_1_cfg,
+	[SLAVE_PCIE_DMA_2_CFG] = &qhs_pcie_dma_2_cfg,
+};
+
+static const struct regmap_config nord_pcie_cfg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x7200,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_pcie_cfg = {
+	.config = &nord_pcie_cfg_regmap_config,
+	.nodes = pcie_cfg_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_cfg_nodes),
+};
+
+static struct qcom_icc_bcm * const pcie_data_inbound_bcms[] = {
+	&bcm_sn1,
+};
+
+static struct qcom_icc_node * const pcie_data_inbound_nodes[] = {
+	[MASTER_PCIE_DMA_0] = &qxm_pcie_dma_0,
+	[MASTER_PCIE_DMA_1] = &qxm_pcie_dma_1,
+	[MASTER_PCIE_DMA_2] = &qxm_pcie_dma_2,
+	[MASTER_PCIE_0] = &xm_pcie_0,
+	[MASTER_PCIE_1] = &xm_pcie_1,
+	[MASTER_PCIE_2] = &xm_pcie_2,
+	[MASTER_PCIE_3] = &xm_pcie_3,
+	[SLAVE_PCIE_HSCNOC] = &qns_pcie_hscnoc,
+	[SLAVE_PCIE_OBNOC_DMA] = &qns_pcie_obnoc_dma,
+};
+
+static const struct regmap_config nord_pcie_data_inbound_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x4b080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_pcie_data_inbound = {
+	.config = &nord_pcie_data_inbound_regmap_config,
+	.nodes = pcie_data_inbound_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_data_inbound_nodes),
+	.bcms = pcie_data_inbound_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_data_inbound_bcms),
+};
+
+static struct qcom_icc_bcm * const pcie_data_outbound_bcms[] = {
+	&bcm_cn0,
+};
+
+static struct qcom_icc_node * const pcie_data_outbound_nodes[] = {
+	[MASTER_CNOC_PCIE_DMA] = &qnm_cnoc_pcie_dma,
+	[MASTER_ANOC_PCIE_HSCNOC] = &qnm_hscnoc_pcie,
+	[MASTER_PCIE_IBNOC_DMA] = &qnm_pcie_ibnoc_dma,
+	[SLAVE_PCIE_DMA_0] = &qxs_pcie_dma_0,
+	[SLAVE_PCIE_DMA_1] = &qxs_pcie_dma_1,
+	[SLAVE_PCIE_DMA_2] = &qxs_pcie_dma_2,
+	[SLAVE_PCIE_0] = &xs_pcie_0,
+	[SLAVE_PCIE_1] = &xs_pcie_1,
+	[SLAVE_PCIE_2] = &xs_pcie_2,
+	[SLAVE_PCIE_3] = &xs_pcie_3,
+};
+
+static const struct regmap_config nord_pcie_data_outbound_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x17000,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_pcie_data_outbound = {
+	.config = &nord_pcie_data_outbound_regmap_config,
+	.nodes = pcie_data_outbound_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_data_outbound_nodes),
+	.bcms = pcie_data_outbound_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_data_outbound_bcms),
+};
+
+static struct qcom_icc_bcm * const system_noc_bcms[] = {
+	&bcm_sn0,
+	&bcm_sn1,
+	&bcm_sn2,
+	&bcm_sn3,
+};
+
+static struct qcom_icc_node * const system_noc_nodes[] = {
+	[MASTER_A1NOC_SNOC] = &qnm_aggre1_noc,
+	[MASTER_A2NOC_SNOC] = &qnm_aggre2_noc,
+	[MASTER_CNOC_SNOC] = &qnm_cnoc_data,
+	[MASTER_NSINOC_SNOC] = &qnm_nsi_noc,
+	[MASTER_SAFE_DMA] = &qnm_safe_dma,
+	[SLAVE_SNOC_HSCNOC_SF] = &qns_hscnoc_sf,
+};
+
+static const struct regmap_config nord_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc nord_system_noc = {
+	.config = &nord_system_noc_regmap_config,
+	.nodes = system_noc_nodes,
+	.num_nodes = ARRAY_SIZE(system_noc_nodes),
+	.bcms = system_noc_bcms,
+	.num_bcms = ARRAY_SIZE(system_noc_bcms),
+};
+
+static const struct of_device_id qnoc_of_match[] = {
+	{ .compatible = "qcom,nord-aggre1-noc", .data = &nord_aggre1_noc },
+	{ .compatible = "qcom,nord-aggre1-noc-tile", .data = &nord_aggre1_noc_tile },
+	{ .compatible = "qcom,nord-aggre2-noc", .data = &nord_aggre2_noc },
+	{ .compatible = "qcom,nord-aggre2-noc-tile", .data = &nord_aggre2_noc_tile },
+	{ .compatible = "qcom,nord-clk-virt", .data = &nord_clk_virt },
+	{ .compatible = "qcom,nord-cnoc-cfg", .data = &nord_cnoc_cfg },
+	{ .compatible = "qcom,nord-cnoc-main", .data = &nord_cnoc_main },
+	{ .compatible = "qcom,nord-hpass-ag-noc", .data = &nord_hpass_ag_noc },
+	{ .compatible = "qcom,nord-hscnoc", .data = &nord_hscnoc },
+	{ .compatible = "qcom,nord-mc-virt", .data = &nord_mc_virt },
+	{ .compatible = "qcom,nord-mmss-noc", .data = &nord_mmss_noc },
+	{ .compatible = "qcom,nord-nsp-data-noc-0", .data = &nord_nsp_data_noc_0 },
+	{ .compatible = "qcom,nord-nsp-data-noc-1", .data = &nord_nsp_data_noc_1 },
+	{ .compatible = "qcom,nord-nsp-data-noc-2", .data = &nord_nsp_data_noc_2 },
+	{ .compatible = "qcom,nord-nsp-data-noc-3", .data = &nord_nsp_data_noc_3 },
+	{ .compatible = "qcom,nord-pcie-cfg", .data = &nord_pcie_cfg },
+	{ .compatible = "qcom,nord-pcie-data-inbound", .data = &nord_pcie_data_inbound },
+	{ .compatible = "qcom,nord-pcie-data-outbound", .data = &nord_pcie_data_outbound },
+	{ .compatible = "qcom,nord-system-noc", .data = &nord_system_noc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qnoc_of_match);
+
+static struct platform_driver qnoc_driver = {
+	.probe = qcom_icc_rpmh_probe,
+	.remove = qcom_icc_rpmh_remove,
+	.driver = {
+		.name = "qnoc-nord",
+		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
+	},
+};
+
+static int __init qnoc_driver_init(void)
+{
+	return platform_driver_register(&qnoc_driver);
+}
+core_initcall(qnoc_driver_init);
+
+static void __exit qnoc_driver_exit(void)
+{
+	platform_driver_unregister(&qnoc_driver);
+}
+module_exit(qnoc_driver_exit);
+
+MODULE_DESCRIPTION("Qualcomm Nord NoC driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


