Return-Path: <linux-arm-msm+bounces-106238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LknOt8l/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 803524E32C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45D13024122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C10330B07;
	Thu,  7 May 2026 05:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFa8zh9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtvX80El"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B832D7F8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132349; cv=none; b=VOKW81dMUfJW5pzPvlg1QhaKZlbXVWFu/f7AtC0NZeVEBRQWUkTpehH3X8d5/bdwrIV0PlO/X0XKzP0i57qitVm8sQIgq9LUjlbX+NCD38fiK+osb1tC+AERGbvdzJxT5u0nfuVXdSivDdXR2g/Ya3zPejopPqCA1lVWooCPAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132349; c=relaxed/simple;
	bh=7eQjfk/G+gZ+fCfbVOOfdg19ySeweLcdr06UOL7ey+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lm6+reY5AIHncFcJcClkS1HhDz3R7LESS2pzJnou7y7tBz4XUidRiOXWNGXOBWm3uIWNQupvBxvDyXCgyjiKDNBhScEr+5ji7RT0+rsE0X5ypG2bW8zK59ztivGqDqkWix+0TdVZ/AzSQvuaB+PSWGUQAzfQMlT8ZppvsCM0nsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFa8zh9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtvX80El; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64746WL0880840
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhzORjC2bcs4KKlw1WG8JyaasPHX3gS3wloxmhKlz7o=; b=GFa8zh9AyEFDq52D
	lB/wcqX3B7Rfj7A6q73Kb61Ot5/OGe8Y6qNkoM+RxhlPfEAWZPUhpM++7jwnudGV
	p4ZXCoG4OJlKSqy/USy58IdiUdNLA6ZM2QCBYXfkFBkc4HJ6Z2brX05tcaqXv6t+
	1VDkfSby7UInp5WlGjdWtRTv5LpxdPuYujE0O6he9Fr2rcvuqAF8NX1Wy7AX90by
	bKBebaKlSqhbklku7Dq313fmQgrjuRKpOR9cLz+VanbVB8AOdNtjh73OvLd/6DDq
	4E5C82gd+0mV7PrXvqIsBLj7RFcr4kn/rO0yj8rV6KOETYsy7Q/P1gem/FixvDhw
	Ne9rtg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq08g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:39:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso404193b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132345; x=1778737145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhzORjC2bcs4KKlw1WG8JyaasPHX3gS3wloxmhKlz7o=;
        b=BtvX80ElB8MSagtuMeTS/P+qjXPvuVusjaisL/mxfaA9tDAbCaQv799RuxPXFFelWF
         as7zksTwDoxigzazMD+wOzqOaqKsUUiN59vSd5jyjGTRFWo3zj74HxfdfV4GVmI2Cklw
         TBVG9n+xnZOsiHrscgBS6WgytFNNsOIKK/2f/ANHO5ANbfvQUsynQAVZnKUwj/+raLdi
         khGPxk3v6OYntlJP7vdOXbSaOXw06ZWc1ESwldg49i96YZXYHRf5xoNKczYJzmd3KSjh
         PhfU0drxYLZ0Kz/cFvqyrtDdDJ6n2oajkdRlsUrCUit82ls1AXwmjAhfJ3oNBxRrj5D9
         7Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132345; x=1778737145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GhzORjC2bcs4KKlw1WG8JyaasPHX3gS3wloxmhKlz7o=;
        b=gIzv3ytpKssTwi1+AaFN2SjKOUvj3Pd1ySDOlR9bKK7acyyrpeVdl0lMivHED9MXQ2
         uClCNb2YlW/sA9J1Wune974TniETkNaV5sRpgmZkVuy4jlUdb3PSe/+1Jd4hqwtWbKvI
         2wBhQqMrzxJaOoMPjMKASMo5UVJaz7PucJl9YexPTQFc55QnbnaFzehL6+s+f/2DpNJm
         4qz6Qes4yfowze+BLX+r1F6hQ218aVtKcHP6dSG9TG2BVL3tUXsWKZASspZpYR7TxWtZ
         /kEHaXCws/C7UctZrPlSFo5RmpWzrnb6UHx8j2kXo2gN88P4JfR1/zjF4pUVOu8iqUT9
         z0hw==
X-Gm-Message-State: AOJu0YwEaut760TFWPviLHx3nSIJLmTjv3EgfOdMXJzCR3mQB9YsfW5g
	oWt3ADi/LNLALNcM6T3KlSe7TmdFqkrAxV99Idf1RVtAdmPTHsLBW/NNeMGeMTXOeLJQThCCUzg
	4RI5V6yD3DoxIvvD1/LZG56qYRj7DYnfUNL38sdgnrl3f+q3DR2WftfoVJhdLUfmV0nf6
X-Gm-Gg: AeBDievhe10Wo3jfOv2vWsPaCPQVWGCxPRzxyJyFBFYS2ZkUdImh9a8neYwZeE+agwF
	jD/mw27cN0PDK5qGw78xOPKGk9FUWwgwgttYOtMPVCdSWpEQxC87FSjT2EIvz/M1166JU3svSWf
	Z+6AqcbSyq9PH8St2TdrFfip1LwACRR5T/1OZ9sNeiB6Y01dkrjeSWQe7VW1TgsTFCLbccJU2L9
	mxpRMLGOgbKvcEgL2lPA95Yd6iAziDLfJSfh5OE8Coo3waR0oA1MDdHDNl4F8b++dYPxTppsVqW
	/g3ygJyrQDApYaTWEXLhRDfY7dg2AK+0nwa3zbYUZTcppyPYrxL1IlKXOntgkgrAQJTLd/sghFp
	HVvgM9Q9C3o8M/r594+UC4WjyB2dcc8I0XSWMRfCNQzzRgTq4nmmkPFj0Q9qjnpc=
X-Received: by 2002:a05:6a00:8e09:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-83a5d873ebemr6414751b3a.29.1778132344837;
        Wed, 06 May 2026 22:39:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e09:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-83a5d873ebemr6414703b3a.29.1778132344194;
        Wed, 06 May 2026 22:39:04 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:28 +0530
Subject: [PATCH v5 3/6] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-3-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc257a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RKjULyPvNO9injS1lHcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: t85w-4nBEftezagFeGN0OsL91BHGY2BW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX1fQ77MEx5n4e
 HOmPT0tcuG63bF598Q7o9ZsdA3449XnxFfzeSM8oINgQcegRV4DbhAZkXXB4qbhGEasBwWZWl9n
 N0lViT9oSpnQsCh0dbV4KOUrFYNLPvQFiiU2uFad0WzyviWa3+WK+tp2qxpPU80RcfDMRBwv3N8
 jxnRK/yQjYeshC9nkaA60ndKoRkElztkoKbcyn1kjgdE7xzOayxa9NyhZmG2rVs17k07TyhreDK
 P2wZsjslwAG/c54aIJB2MZCNI1x9ZVmobshapch08N3bBsXJk/JkFgR07yyv2OEIoaBWF+ucooJ
 pDBdSpf52oy6TiatyVH/khbIvdV/RuFFA7alM7XCwNMdY/Wj3DbgGWkl5jLH2U4xwm169+Wfkcw
 CrQ3OZhYUYGUyDncgDtv0SWPaGEkiuHZo8KeRAL1qWB3vH0mrwcvC27ma8eophopkn7/4cWuc79
 Tn9ZtS2/xLmAry2JSeQ==
X-Proofpoint-GUID: t85w-4nBEftezagFeGN0OsL91BHGY2BW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052
X-Rspamd-Queue-Id: 803524E32C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106238-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the video clock controller for video clients to be
able to request for videocc clocks on X1P42100 platform. Although
X1P42100 is derived from X1E80100, the video clock controller differs
significantly. The BSE clocks are newly added, several cdiv clocks have
been removed, and most RCG frequency tables have been updated. Initial
PLL configurations also require changes, hence introduce a separate
videocc driver for X1P42100 platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |  11 +
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
 3 files changed, 597 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index df21ef5ffd6862bec26e3a77ace62ad935ef44fb..83e3b7afc67e228ac517246fbcb2b96b458d96c3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -209,6 +209,17 @@ config CLK_X1P42100_GPUCC
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config CLK_X1P42100_VIDEOCC
+	tristate "X1P42100 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  X1P42100 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d931963f388b7ce0f8e8ca43846eea..6b69e1688854939d59e5d02f91d2e7190c12e718 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
+obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
 obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
new file mode 100644
index 0000000000000000000000000000000000000000..2bb40ac6fcc57e817ce8f0b6727a571c7c072ffa
--- /dev/null
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 420.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x15,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1050.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x36,
+	.alpha = 0xb000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
+	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_xo_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
+	.reg = 0x817c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_div4_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_bse_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80ec,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_bse_clk = {
+	.halt_reg = 0x8170,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8170,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_bse_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8128,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8128,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x812c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x812c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80e0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80e0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_shift_clk = {
+	.halt_reg = 0x8130,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_shift_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x804c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80cc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_x1p42100_clocks[] = {
+	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
+	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
+	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_x1p42100_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
+	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
+	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
+	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_x1p42100_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8150, /* VIDEO_CC_SLEEP_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_x1p42100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f54,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+	.alpha_plls = video_cc_x1p42100_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
+	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_x1p42100_desc = {
+	.config = &video_cc_x1p42100_regmap_config,
+	.clks = video_cc_x1p42100_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
+	.resets = video_cc_x1p42100_resets,
+	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
+	.gdscs = video_cc_x1p42100_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_x1p42100_driver_data,
+};
+
+static const struct of_device_id video_cc_x1p42100_match_table[] = {
+	{ .compatible = "qcom,x1p42100-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
+
+static int video_cc_x1p42100_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
+}
+
+static struct platform_driver video_cc_x1p42100_driver = {
+	.probe = video_cc_x1p42100_probe,
+	.driver = {
+		.name = "videocc-x1p42100",
+		.of_match_table = video_cc_x1p42100_match_table,
+	},
+};
+
+module_platform_driver(video_cc_x1p42100_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


