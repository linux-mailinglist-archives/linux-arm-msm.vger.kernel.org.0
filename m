Return-Path: <linux-arm-msm+bounces-102533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMr/Ourr12kbUwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B689A3CE7FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5289F30164D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38563E316A;
	Thu,  9 Apr 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bH11E42j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqF2bxOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A43E3140
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758307; cv=none; b=rFXJPWRQwH99kenEY4xmV5q8KeXr35YhPVUsMFh4YK24Ia/NUWOBGALC9D+4em05rgWQR5nxqWQhhxu63m+Uio+Ke6eHLCRdWwGZWtaWPowHphe0TL2lRaJbwzKWU9z5eV3MbLE6RkDpM6Tip6H5HB6sJVBrPxpT/2reRNBQmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758307; c=relaxed/simple;
	bh=cSulSvEAaQFEkI2nfIQ0dy9xNgljxdPbgRyhjYa3kSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtMnptn8uoOAq9b3Sp7BUmtvOX0RMO/EUmvWwtTmnhwsGWuhHSGP71OPWC/UNXwVlzVSnRCbTPWISeNCx2xklyGJhT5y+7VCg/Mgfwwv7EtxwggVDSGen8jGqmgThucfq4QLkxQt7tK+g6oLUG+J/agsjc+2rAee15OND+yNa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bH11E42j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqF2bxOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D26tS2626845
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X22rT/zbu3F7W08XQlABIxCyNhTv2dDnNb+GR0T0Z10=; b=bH11E42jaU1hrRLJ
	x5iodUiE3GyuHIhI5sE47vQClzdbBOgX1Lr1LOjLy6I0d6ZJBA1nUx8KSx1fX1Vh
	UX/5Y8vM+Hq8dN8hKVx0aQ3xQkO8I2xDOrrMk/VH10uv9mQQKww2svRZrEyfr3o6
	UqJnf0nO2vfyr6BnNKjtJHrm+fBeYJ5uaEKwCkV6ilAGgIYZuYKnN8WCBQ58sbt4
	GwjRYWkeNQVuEvP4beCN4DnsAenhV6TEfP3fJP+jyk22hYXuzmkberzRYW7Cmwwc
	crG5WZS+rbdS8yHSSw5cIklx1cJz3sARC/sH4hhqObCwULBLe2RnG7L9EHw2XFwa
	5TUsPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu15pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0cf396c45so15996405ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758301; x=1776363101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X22rT/zbu3F7W08XQlABIxCyNhTv2dDnNb+GR0T0Z10=;
        b=UqF2bxOzb8JLmGLgmG6JakdQ3k7BpNqXl6OVBlsAm8OBmij/GY7HWgl7pnbLGLoclI
         NAJ5MoRva96vse61rDS+OoEn74szxTsKKKtxsC7Rpp6kNeVbzyhqA49fd1kiSEaWTkcI
         vETG6W7ykVFxpBGMvVudgZb/baT5yz9q+D+Z+EpFg92zcY8w9pp4m88M0iq2HDE9O5Bl
         GY7jQVRg5X7h/itfxhg2Z5Iz/QNMZs/GApapPrgB8OtzqQmT2PVi+jGIOT2u3cBpnnus
         O10Wh4L0Izqg6qTz1Wyl51xgY7LCCOzW88hym0cAvbTzyxzevQ5uKRML0uqrz7OQna04
         Entw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758301; x=1776363101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X22rT/zbu3F7W08XQlABIxCyNhTv2dDnNb+GR0T0Z10=;
        b=fra5GnA6alOM9iEKJIwqB3N5rA0mn8mOPYz2LSaPyd4zu/ubNamIE/7yUiROTc+lRt
         d4vhN0YKZ0gixqIpixeQgo93oxtfQu/mzcP/eJbW/Mm4cn6EzlUhJOcj0ZAJcp2v4GO8
         FtpG+Cf7eELD7hOp+70+jW33wLb8sxeLzfJ6/qMf1BB1ftrG2l1vcyQ3ot/5893msPOM
         FXtU0xpSX3NFL8m0gWaRxvznROi+1yvisYDNP8wP//6ayjzQGBH36t0pzp9lpJo5FoVO
         3HjcW7wBWFkYkJ+Tr67Py7wUNELkGjiNAiMUJ5pJ+sFtk5uofUBedLyJavnP+Map9Dmd
         BDrg==
X-Forwarded-Encrypted: i=1; AJvYcCVPhKI3VtcKzwaD5WLk7FZNOnOa/Fi2LJ821PRERmYqDEKtb3OwjVufpJq1Z7FqwR2yMyNlVaIANtk8cW4S@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+AmdHJaAp6bsC85pf0hQJ04l86z9oLdA1ZZWAqFksWAr368QI
	Km73AkKWa0va2C4HjK2KHF6B6J7BGFzbkBTyAPFmLl0YchTe31DAqi3JAopOM1RSzN77kq7E6Rd
	alMxZKaDPuVIn4hWuiX59pSU+v0/eHhjLu1IiVEfA4fR9ThFXeaQjTaPdCkclQrihjkOX
X-Gm-Gg: AeBDieu6bQ3nzgM6mk5i7d9YwMg69PUjgv2neGxlDiOWTR30UFFU29KVesJ2ysMUTIQ
	8TxZ63i16QjmrpQCUsYyECX8hw34NvgiBTzWiQ1Yh9+v8RbKq8FIYrzinxrpcuwyVYQTCugMBej
	Fd6z8nkqOvDhd+5m2QA2xcfj4T7l/l3CDGZ0qLzOT3YdVP1Nb+m2GbtXeec3SgXw76W/4wROcnA
	4oa3/lHMt8JVmRSNHETM72bcLoc3bkxd+YcMRK3B/DN8cGob0u2gkVf7Z6tg/QSll735XuFCys6
	UWJ7uUyB9SlKITZeT0jPt31zD9jf91CTjfq9qC951K2pvbWkG4du01iZPlA8Sh/WcS/v4d9TnWd
	vOLOqqiACKWsH9g+NEK+0T8aUV9nYETeZ4SEUPli0H4HVOA==
X-Received: by 2002:a05:6a20:1611:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-39fc80ddbbbmr6046603637.12.1775758299376;
        Thu, 09 Apr 2026 11:11:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-39fc80ddbbbmr6046524637.12.1775758298355;
        Thu, 09 Apr 2026 11:11:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:47 +0530
Subject: [PATCH v2 6/8] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-6-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ZgHUJ97tjROYbq9cHXwil4pnICQV35L8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXyfv+TEyxNcx1
 av2Qtc7eCDl+XGIF9FoqAYe1MWMiUmW0AwbvyffDDCkvqes6K9urK+jkwAWUOWJRgBb035RJJb4
 2ws03YoWKowI2XGJbg8Xb87MCwnxzd7r6Y/3YMZJojMfieW4K9vsPIs/l/j7VHyMFeGi1RgGZZA
 gE5SQgRFpIxuLHBlFKGxZPb18izKUT4PR+fLmgijg9wrJo12YnWu+jtdF3tGgr+9gz9LHhBbgiy
 jlpkVXlBkZlIvYern1oXj3HA7IR0UyjUADr+71nMlK8xmvVbVGGC+bDntFfC32mpZIQ9v76ZrBv
 j4pe/cDfAiDFLdwYPIp77l083xTmg8dqea8G8lOqcO3A53+4rN91eZPFcyalviZCJJ4lbF3n929
 8t3ipI09jDALS0EsyLVs1vEs/2juiylv9spINZl9zAoj0Zwjv3cqBIYjKp+05BUbJQPZ/oVzVfr
 vM4rrywadWJGOgh6jtw==
X-Proofpoint-ORIG-GUID: ZgHUJ97tjROYbq9cHXwil4pnICQV35L8
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d7ebde cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X1llO5yGiJ2-4Hw6Iw4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102533-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B689A3CE7FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Camera Clock Controller (CAMCC) on the Eliza
platform.

The CAMCC block on Eliza includes both the primary camera clock
controller and the Camera BIST clock controller, which provides the
functional MCLK required for camera operations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig               |   10 +
 drivers/clk/qcom/Makefile              |    1 +
 drivers/clk/qcom/cambistmclkcc-eliza.c |  465 ++++++
 drivers/clk/qcom/camcc-eliza.c         | 2803 ++++++++++++++++++++++++++++++++
 4 files changed, 3279 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7626dfa536ece08e88ad198d8fa60972f06f14d5..3a8b4922ee3745f172922faa3e0316972ec7052f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -19,6 +19,16 @@ menuconfig COMMON_CLK_QCOM
 
 if COMMON_CLK_QCOM
 
+config CLK_ELIZA_CAMCC
+	tristate "Eliza Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  Eliza devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config CLK_ELIZA_DISPCC
 	tristate "Eliza Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1c34797eb385963110614ba43eb9bbc9653699fb..12574157b7c8a82c890996502f79da03f25cfaa2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -20,6 +20,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_CLK_ELIZA_CAMCC) += cambistmclkcc-eliza.o camcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
diff --git a/drivers/clk/qcom/cambistmclkcc-eliza.c b/drivers/clk/qcom/cambistmclkcc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..3fda22ad13c91aeff68947d4f68154c263a8e321
--- /dev/null
+++ b/drivers/clk/qcom/cambistmclkcc-eliza.c
@@ -0,0 +1,465 @@
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
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_AHB_CLK,
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN,
+	P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco rivian_ole_vco[] = {
+	{ 777000000, 1285000000, 0 },
+};
+
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_bist_mclk_cc_pll0_config = {
+	.l = 0x32,
+	.cal_l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0x10000030,
+	.config_ctl_hi_val = 0x80890263,
+	.config_ctl_hi1_val = 0x00000217,
+	.user_ctl_val = 0x00000001,
+	.user_ctl_hi_val = 0x00000000,
+};
+
+static struct clk_alpha_pll cam_bist_mclk_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_bist_mclk_cc_pll0_config,
+	.vco_table = rivian_ole_vco,
+	.num_vco = ARRAY_SIZE(rivian_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_rivian_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map cam_bist_mclk_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 3 },
+	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data cam_bist_mclk_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_bist_mclk_cc_pll0.clkr.hw },
+	{ .hw = &cam_bist_mclk_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_bist_mclk_cc_parent_map_1[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data cam_bist_mclk_cc_parent_data_1[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_cam_bist_mclk_cc_mclk0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4),
+	F(68571429, P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 14, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk0_clk_src = {
+	.cmd_rcgr = 0x4000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk0_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk1_clk_src = {
+	.cmd_rcgr = 0x401c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk1_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk2_clk_src = {
+	.cmd_rcgr = 0x4038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk2_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk3_clk_src = {
+	.cmd_rcgr = 0x4054,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk3_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk4_clk_src = {
+	.cmd_rcgr = 0x4070,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk4_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk5_clk_src = {
+	.cmd_rcgr = 0x408c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk5_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk6_clk_src = {
+	.cmd_rcgr = 0x40a8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk6_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_mclk7_clk_src = {
+	.cmd_rcgr = 0x40c4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_mclk0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_mclk7_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_bist_mclk_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_bist_mclk_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x40e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_bist_mclk_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_bist_mclk_cc_sleep_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_bist_mclk_cc_sleep_clk_src",
+		.parent_data = cam_bist_mclk_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_bist_mclk_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk0_clk = {
+	.halt_reg = 0x4018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk1_clk = {
+	.halt_reg = 0x4034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk2_clk = {
+	.halt_reg = 0x4050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk3_clk = {
+	.halt_reg = 0x406c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x406c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk4_clk = {
+	.halt_reg = 0x4088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk5_clk = {
+	.halt_reg = 0x40a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x40a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk6_clk = {
+	.halt_reg = 0x40c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x40c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_bist_mclk_cc_mclk7_clk = {
+	.halt_reg = 0x40dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x40dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_bist_mclk_cc_mclk7_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_bist_mclk_cc_mclk7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *cam_bist_mclk_cc_eliza_clocks[] = {
+	[CAM_BIST_MCLK_CC_MCLK0_CLK] = &cam_bist_mclk_cc_mclk0_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK0_CLK_SRC] = &cam_bist_mclk_cc_mclk0_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK1_CLK] = &cam_bist_mclk_cc_mclk1_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK1_CLK_SRC] = &cam_bist_mclk_cc_mclk1_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK2_CLK] = &cam_bist_mclk_cc_mclk2_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK2_CLK_SRC] = &cam_bist_mclk_cc_mclk2_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK3_CLK] = &cam_bist_mclk_cc_mclk3_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK3_CLK_SRC] = &cam_bist_mclk_cc_mclk3_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK4_CLK] = &cam_bist_mclk_cc_mclk4_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK4_CLK_SRC] = &cam_bist_mclk_cc_mclk4_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK5_CLK] = &cam_bist_mclk_cc_mclk5_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK5_CLK_SRC] = &cam_bist_mclk_cc_mclk5_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK6_CLK] = &cam_bist_mclk_cc_mclk6_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK6_CLK_SRC] = &cam_bist_mclk_cc_mclk6_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_MCLK7_CLK] = &cam_bist_mclk_cc_mclk7_clk.clkr,
+	[CAM_BIST_MCLK_CC_MCLK7_CLK_SRC] = &cam_bist_mclk_cc_mclk7_clk_src.clkr,
+	[CAM_BIST_MCLK_CC_PLL0] = &cam_bist_mclk_cc_pll0.clkr,
+	[CAM_BIST_MCLK_CC_SLEEP_CLK_SRC] = &cam_bist_mclk_cc_sleep_clk_src.clkr,
+};
+
+static struct clk_alpha_pll *cam_bist_mclk_cc_eliza_plls[] = {
+	&cam_bist_mclk_cc_pll0,
+};
+
+static u32 cam_bist_mclk_cc_eliza_critical_cbcrs[] = {
+	0x40f8, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config cam_bist_mclk_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5010,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data cam_bist_mclk_cc_eliza_driver_data = {
+	.alpha_plls = cam_bist_mclk_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_eliza_plls),
+	.clk_cbcrs = cam_bist_mclk_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc cam_bist_mclk_cc_eliza_desc = {
+	.config = &cam_bist_mclk_cc_eliza_regmap_config,
+	.clks = cam_bist_mclk_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_eliza_clocks),
+	.use_rpm = true,
+	.driver_data = &cam_bist_mclk_cc_eliza_driver_data,
+};
+
+static const struct of_device_id cam_bist_mclk_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-cambistmclkcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_bist_mclk_cc_eliza_match_table);
+
+static int cam_bist_mclk_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_bist_mclk_cc_eliza_desc);
+}
+
+static struct platform_driver cam_bist_mclk_cc_eliza_driver = {
+	.probe = cam_bist_mclk_cc_eliza_probe,
+	.driver = {
+		.name = "cambistmclkcc-eliza",
+		.of_match_table = cam_bist_mclk_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(cam_bist_mclk_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI CAMBISTMCLKCC Eliza Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/camcc-eliza.c b/drivers/clk/qcom/camcc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..52cef1827ffb43b82c68234349baa1988d7a1527
--- /dev/null
+++ b/drivers/clk/qcom/camcc-eliza.c
@@ -0,0 +1,2803 @@
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
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_AHB_CLK,
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_CAM_CC_PLL0_OUT_EVEN,
+	P_CAM_CC_PLL0_OUT_MAIN,
+	P_CAM_CC_PLL0_OUT_ODD,
+	P_CAM_CC_PLL1_OUT_EVEN,
+	P_CAM_CC_PLL2_OUT_EVEN,
+	P_CAM_CC_PLL3_OUT_EVEN,
+	P_CAM_CC_PLL4_OUT_EVEN,
+	P_CAM_CC_PLL5_OUT_EVEN,
+	P_CAM_CC_PLL6_OUT_EVEN,
+	P_CAM_CC_PLL6_OUT_ODD,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x3e,
+	.cal_l = 0x44,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 900.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config = {
+	.l = 0x2e,
+	.cal_l = 0x44,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
+	.offset = 0x1000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll1_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll1_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll1_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll1.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 872.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x2d,
+	.cal_l = 0x44,
+	.alpha = 0x6aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll2_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
+	.offset = 0x2000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll2_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll2_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 890.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x2e,
+	.cal_l = 0x44,
+	.alpha = 0x5aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
+	.offset = 0x3000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll3_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll3_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 890.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config = {
+	.l = 0x2e,
+	.cal_l = 0x44,
+	.alpha = 0x5aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll4 = {
+	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
+	.offset = 0x4000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll4_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll4_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll4_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 890.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config = {
+	.l = 0x2e,
+	.cal_l = 0x44,
+	.alpha = 0x5aaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll5 = {
+	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
+	.offset = 0x5000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll5_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll5_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll5_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config = {
+	.l = 0x32,
+	.cal_l = 0x44,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll cam_cc_pll6 = {
+	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll6",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
+	.offset = 0x6000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll6_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll6_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll6_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll6_out_odd = {
+	.offset = 0x6000,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll6_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll6_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
+	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
+	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_odd.clkr.hw },
+	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 4 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL4_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll4_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL5_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll5_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
+	.cmd_rcgr = 0x112e8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_camnoc_rt_axi_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_0_clk_src = {
+	.cmd_rcgr = 0x1126c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_0_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_1_clk_src = {
+	.cmd_rcgr = 0x11288,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_1_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_2_clk_src = {
+	.cmd_rcgr = 0x112a4,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_2_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x11068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cphy_rx_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cre_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cre_clk_src = {
+	.cmd_rcgr = 0x111ac,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cre_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cre_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x10000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi0phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x10024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi1phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
+	.cmd_rcgr = 0x10044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi2phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
+	.cmd_rcgr = 0x10064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi3phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
+	.cmd_rcgr = 0x10084,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi4phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
+	.cmd_rcgr = 0x100a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi5phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csid_clk_src = {
+	.cmd_rcgr = 0x112c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csid_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x100dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_fast_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_0_clk_src[] = {
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_0_clk_src = {
+	.cmd_rcgr = 0x11214,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_0_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_icp_1_clk_src = {
+	.cmd_rcgr = 0x1123c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_1_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0x11150,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0x1117c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_csid_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ipe_nps_clk_src[] = {
+	F(450000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(575000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	F(825000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
+	.cmd_rcgr = 0x10190,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ipe_nps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ipe_nps_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_jpeg_clk_src = {
+	.cmd_rcgr = 0x111d0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cre_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_jpeg_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
+	F(436000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(570000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(675000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(757000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ofe_clk_src = {
+	.cmd_rcgr = 0x1011c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ofe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ofe_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(60000000, P_CAM_CC_PLL6_OUT_EVEN, 8, 0, 0),
+	F(120000000, P_CAM_CC_PLL0_OUT_EVEN, 5, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x1132c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x11380,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_sleep_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x10100,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_slow_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_0_clk_src[] = {
+	F(445000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(567000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(644000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(785000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_0_clk_src = {
+	.cmd_rcgr = 0x11018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_tfe_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_0_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_1_clk_src[] = {
+	F(445000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(567000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(644000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(785000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_1_clk_src = {
+	.cmd_rcgr = 0x11098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6,
+	.freq_tbl = ftbl_cam_cc_tfe_1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_1_clk_src",
+		.parent_data = cam_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_tfe_2_clk_src[] = {
+	F(445000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(567000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(644000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(785000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_tfe_2_clk_src = {
+	.cmd_rcgr = 0x11100,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_7,
+	.freq_tbl = ftbl_cam_cc_tfe_2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_tfe_2_clk_src",
+		.parent_data = cam_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_xo_clk_src = {
+	.cmd_rcgr = 0x11364,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_8,
+	.freq_tbl = ftbl_cam_cc_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_xo_clk_src",
+		.parent_data = cam_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch cam_cc_cam_top_ahb_clk = {
+	.halt_reg = 0x113ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x113ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cam_top_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cam_top_fast_ahb_clk = {
+	.halt_reg = 0x1139c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1139c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cam_top_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
+	.halt_reg = 0x11320,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11320,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_dcd_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_axi_clk = {
+	.halt_reg = 0x11310,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x11310,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x11310,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_cre_clk = {
+	.halt_reg = 0x111c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_cre_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cre_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ipe_nps_clk = {
+	.halt_reg = 0x101b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ofe_anchor_clk = {
+	.halt_reg = 0x10158,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10158,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ofe_anchor_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ofe_hdr_clk = {
+	.halt_reg = 0x1016c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1016c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ofe_hdr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_ofe_main_clk = {
+	.halt_reg = 0x10144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_ofe_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_axi_clk = {
+	.halt_reg = 0x11300,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11300,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_ife_lite_clk = {
+	.halt_reg = 0x11178,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11178,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_0_bayer_clk = {
+	.halt_reg = 0x11054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_0_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_0_main_clk = {
+	.halt_reg = 0x11040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_0_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_1_bayer_clk = {
+	.halt_reg = 0x110d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_1_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_1_main_clk = {
+	.halt_reg = 0x110c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_1_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_2_bayer_clk = {
+	.halt_reg = 0x1113c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1113c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_2_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_tfe_2_main_clk = {
+	.halt_reg = 0x11128,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11128,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_tfe_2_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_xo_clk = {
+	.halt_reg = 0x11324,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11324,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_0_clk = {
+	.halt_reg = 0x11284,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11284,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_1_clk = {
+	.halt_reg = 0x112a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_2_clk = {
+	.halt_reg = 0x112bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_core_ahb_clk = {
+	.halt_reg = 0x11360,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x11360,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_core_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cre_ahb_clk = {
+	.halt_reg = 0x111cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cre_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cre_clk = {
+	.halt_reg = 0x111c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cre_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cre_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x10018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x1003c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1003c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi2phytimer_clk = {
+	.halt_reg = 0x1005c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1005c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi2phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi3phytimer_clk = {
+	.halt_reg = 0x1007c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1007c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi3phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi4phytimer_clk = {
+	.halt_reg = 0x1009c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1009c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi4phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi5phytimer_clk = {
+	.halt_reg = 0x100bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi5phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi5phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_clk = {
+	.halt_reg = 0x112d8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
+	.halt_reg = 0x10020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_csiphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x1001c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1001c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x10040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy2_clk = {
+	.halt_reg = 0x10060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy3_clk = {
+	.halt_reg = 0x10080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy4_clk = {
+	.halt_reg = 0x100a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy5_clk = {
+	.halt_reg = 0x100c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_drv_ahb_clk = {
+	.halt_reg = 0x113c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x113c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_drv_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_drv_xo_clk = {
+	.halt_reg = 0x113c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x113c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_drv_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_ahb_clk = {
+	.halt_reg = 0x11264,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11264,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_clk = {
+	.halt_reg = 0x1122c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1122c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_ahb_clk = {
+	.halt_reg = 0x11268,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11268,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_clk = {
+	.halt_reg = 0x11254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_ahb_clk = {
+	.halt_reg = 0x111a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0x11168,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11168,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0x111a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0x11194,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11194,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
+	.halt_reg = 0x101d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_clk = {
+	.halt_reg = 0x101a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
+	.halt_reg = 0x101d8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_nps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_clk = {
+	.halt_reg = 0x101bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
+	.halt_reg = 0x101dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x101dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_pps_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_0_clk = {
+	.halt_reg = 0x111e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_1_clk = {
+	.halt_reg = 0x111f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x111f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_ahb_clk = {
+	.halt_reg = 0x10118,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_anchor_clk = {
+	.halt_reg = 0x10148,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_anchor_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_anchor_fast_ahb_clk = {
+	.halt_reg = 0x100f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_anchor_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_hdr_clk = {
+	.halt_reg = 0x1015c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1015c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_hdr_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_hdr_fast_ahb_clk = {
+	.halt_reg = 0x100fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_hdr_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_main_clk = {
+	.halt_reg = 0x10134,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ofe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ofe_main_fast_ahb_clk = {
+	.halt_reg = 0x100f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ofe_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x11344,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11344,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x11348,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11348,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_bayer_clk = {
+	.halt_reg = 0x11044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_bayer_fast_ahb_clk = {
+	.halt_reg = 0x11064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_main_clk = {
+	.halt_reg = 0x11030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_0_main_fast_ahb_clk = {
+	.halt_reg = 0x11060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_0_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_bayer_clk = {
+	.halt_reg = 0x110c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_bayer_fast_ahb_clk = {
+	.halt_reg = 0x110e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_main_clk = {
+	.halt_reg = 0x110b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_1_main_fast_ahb_clk = {
+	.halt_reg = 0x110e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_1_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_bayer_clk = {
+	.halt_reg = 0x1112c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1112c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_bayer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_bayer_fast_ahb_clk = {
+	.halt_reg = 0x1114c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1114c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_bayer_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_main_clk = {
+	.halt_reg = 0x11118,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_tfe_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tfe_2_main_fast_ahb_clk = {
+	.halt_reg = 0x11148,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tfe_2_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc cam_cc_titan_top_gdsc = {
+	.gdscr = 0x1134c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ipe_0_gdsc = {
+	.gdscr = 0x1017c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ipe_0_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ofe_gdsc = {
+	.gdscr = 0x100c8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ofe_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_tfe_0_gdsc = {
+	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_0_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_tfe_1_gdsc = {
+	.gdscr = 0x11084,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_1_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_tfe_2_gdsc = {
+	.gdscr = 0x110ec,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_tfe_2_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *cam_cc_eliza_clocks[] = {
+	[CAM_CC_CAM_TOP_AHB_CLK] = &cam_cc_cam_top_ahb_clk.clkr,
+	[CAM_CC_CAM_TOP_FAST_AHB_CLK] = &cam_cc_cam_top_fast_ahb_clk.clkr,
+	[CAM_CC_CAMNOC_DCD_XO_CLK] = &cam_cc_camnoc_dcd_xo_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_AXI_CLK] = &cam_cc_camnoc_nrt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_CRE_CLK] = &cam_cc_camnoc_nrt_cre_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_IPE_NPS_CLK] = &cam_cc_camnoc_nrt_ipe_nps_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK] = &cam_cc_camnoc_nrt_ofe_anchor_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_OFE_HDR_CLK] = &cam_cc_camnoc_nrt_ofe_hdr_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK] = &cam_cc_camnoc_nrt_ofe_main_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK] = &cam_cc_camnoc_rt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK_SRC] = &cam_cc_camnoc_rt_axi_clk_src.clkr,
+	[CAM_CC_CAMNOC_RT_IFE_LITE_CLK] = &cam_cc_camnoc_rt_ife_lite_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK] = &cam_cc_camnoc_rt_tfe_0_bayer_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_0_main_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK] = &cam_cc_camnoc_rt_tfe_1_bayer_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_1_main_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK] = &cam_cc_camnoc_rt_tfe_2_bayer_clk.clkr,
+	[CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK] = &cam_cc_camnoc_rt_tfe_2_main_clk.clkr,
+	[CAM_CC_CAMNOC_XO_CLK] = &cam_cc_camnoc_xo_clk.clkr,
+	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
+	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
+	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
+	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
+	[CAM_CC_CCI_2_CLK] = &cam_cc_cci_2_clk.clkr,
+	[CAM_CC_CCI_2_CLK_SRC] = &cam_cc_cci_2_clk_src.clkr,
+	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CRE_AHB_CLK] = &cam_cc_cre_ahb_clk.clkr,
+	[CAM_CC_CRE_CLK] = &cam_cc_cre_clk.clkr,
+	[CAM_CC_CRE_CLK_SRC] = &cam_cc_cre_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
+	[CAM_CC_CSI5PHYTIMER_CLK] = &cam_cc_csi5phytimer_clk.clkr,
+	[CAM_CC_CSI5PHYTIMER_CLK_SRC] = &cam_cc_csi5phytimer_clk_src.clkr,
+	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
+	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
+	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
+	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
+	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
+	[CAM_CC_CSIPHY5_CLK] = &cam_cc_csiphy5_clk.clkr,
+	[CAM_CC_DRV_AHB_CLK] = &cam_cc_drv_ahb_clk.clkr,
+	[CAM_CC_DRV_XO_CLK] = &cam_cc_drv_xo_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_0_AHB_CLK] = &cam_cc_icp_0_ahb_clk.clkr,
+	[CAM_CC_ICP_0_CLK] = &cam_cc_icp_0_clk.clkr,
+	[CAM_CC_ICP_0_CLK_SRC] = &cam_cc_icp_0_clk_src.clkr,
+	[CAM_CC_ICP_1_AHB_CLK] = &cam_cc_icp_1_ahb_clk.clkr,
+	[CAM_CC_ICP_1_CLK] = &cam_cc_icp_1_clk.clkr,
+	[CAM_CC_ICP_1_CLK_SRC] = &cam_cc_icp_1_clk_src.clkr,
+	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_NPS_AHB_CLK] = &cam_cc_ipe_nps_ahb_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK] = &cam_cc_ipe_nps_clk.clkr,
+	[CAM_CC_IPE_NPS_CLK_SRC] = &cam_cc_ipe_nps_clk_src.clkr,
+	[CAM_CC_IPE_NPS_FAST_AHB_CLK] = &cam_cc_ipe_nps_fast_ahb_clk.clkr,
+	[CAM_CC_IPE_PPS_CLK] = &cam_cc_ipe_pps_clk.clkr,
+	[CAM_CC_IPE_PPS_FAST_AHB_CLK] = &cam_cc_ipe_pps_fast_ahb_clk.clkr,
+	[CAM_CC_JPEG_0_CLK] = &cam_cc_jpeg_0_clk.clkr,
+	[CAM_CC_JPEG_1_CLK] = &cam_cc_jpeg_1_clk.clkr,
+	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
+	[CAM_CC_OFE_AHB_CLK] = &cam_cc_ofe_ahb_clk.clkr,
+	[CAM_CC_OFE_ANCHOR_CLK] = &cam_cc_ofe_anchor_clk.clkr,
+	[CAM_CC_OFE_ANCHOR_FAST_AHB_CLK] = &cam_cc_ofe_anchor_fast_ahb_clk.clkr,
+	[CAM_CC_OFE_CLK_SRC] = &cam_cc_ofe_clk_src.clkr,
+	[CAM_CC_OFE_HDR_CLK] = &cam_cc_ofe_hdr_clk.clkr,
+	[CAM_CC_OFE_HDR_FAST_AHB_CLK] = &cam_cc_ofe_hdr_fast_ahb_clk.clkr,
+	[CAM_CC_OFE_MAIN_CLK] = &cam_cc_ofe_main_clk.clkr,
+	[CAM_CC_OFE_MAIN_FAST_AHB_CLK] = &cam_cc_ofe_main_fast_ahb_clk.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
+	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
+	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
+	[CAM_CC_PLL1_OUT_EVEN] = &cam_cc_pll1_out_even.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL2_OUT_EVEN] = &cam_cc_pll2_out_even.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
+	[CAM_CC_PLL4] = &cam_cc_pll4.clkr,
+	[CAM_CC_PLL4_OUT_EVEN] = &cam_cc_pll4_out_even.clkr,
+	[CAM_CC_PLL5] = &cam_cc_pll5.clkr,
+	[CAM_CC_PLL5_OUT_EVEN] = &cam_cc_pll5_out_even.clkr,
+	[CAM_CC_PLL6] = &cam_cc_pll6.clkr,
+	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
+	[CAM_CC_PLL6_OUT_ODD] = &cam_cc_pll6_out_odd.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
+	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_TFE_0_BAYER_CLK] = &cam_cc_tfe_0_bayer_clk.clkr,
+	[CAM_CC_TFE_0_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_0_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_0_CLK_SRC] = &cam_cc_tfe_0_clk_src.clkr,
+	[CAM_CC_TFE_0_MAIN_CLK] = &cam_cc_tfe_0_main_clk.clkr,
+	[CAM_CC_TFE_0_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_0_main_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_1_BAYER_CLK] = &cam_cc_tfe_1_bayer_clk.clkr,
+	[CAM_CC_TFE_1_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_1_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_1_CLK_SRC] = &cam_cc_tfe_1_clk_src.clkr,
+	[CAM_CC_TFE_1_MAIN_CLK] = &cam_cc_tfe_1_main_clk.clkr,
+	[CAM_CC_TFE_1_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_1_main_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_2_BAYER_CLK] = &cam_cc_tfe_2_bayer_clk.clkr,
+	[CAM_CC_TFE_2_BAYER_FAST_AHB_CLK] = &cam_cc_tfe_2_bayer_fast_ahb_clk.clkr,
+	[CAM_CC_TFE_2_CLK_SRC] = &cam_cc_tfe_2_clk_src.clkr,
+	[CAM_CC_TFE_2_MAIN_CLK] = &cam_cc_tfe_2_main_clk.clkr,
+	[CAM_CC_TFE_2_MAIN_FAST_AHB_CLK] = &cam_cc_tfe_2_main_fast_ahb_clk.clkr,
+	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *cam_cc_eliza_gdscs[] = {
+	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
+	[CAM_CC_OFE_GDSC] = &cam_cc_ofe_gdsc,
+	[CAM_CC_TFE_0_GDSC] = &cam_cc_tfe_0_gdsc,
+	[CAM_CC_TFE_1_GDSC] = &cam_cc_tfe_1_gdsc,
+	[CAM_CC_TFE_2_GDSC] = &cam_cc_tfe_2_gdsc,
+	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
+};
+
+static const struct qcom_reset_map cam_cc_eliza_resets[] = {
+	[CAM_CC_DRV_BCR] = { 0x113bc },
+	[CAM_CC_ICP_BCR] = { 0x11210 },
+	[CAM_CC_IPE_0_BCR] = { 0x10178 },
+	[CAM_CC_OFE_BCR] = { 0x100c4 },
+	[CAM_CC_QDSS_DEBUG_BCR] = { 0x11328 },
+	[CAM_CC_TFE_0_BCR] = { 0x11000 },
+	[CAM_CC_TFE_1_BCR] = { 0x11080 },
+	[CAM_CC_TFE_2_BCR] = { 0x110e8 },
+};
+
+static struct clk_alpha_pll *cam_cc_eliza_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+};
+
+static u32 cam_cc_eliza_critical_cbcrs[] = {
+	0x1137c, /* CAM_CC_GDSC_CLK */
+	0x11398, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config cam_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1601c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data cam_cc_eliza_driver_data = {
+	.alpha_plls = cam_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_eliza_plls),
+	.clk_cbcrs = cam_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc cam_cc_eliza_desc = {
+	.config = &cam_cc_eliza_regmap_config,
+	.clks = cam_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_eliza_clocks),
+	.resets = cam_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(cam_cc_eliza_resets),
+	.gdscs = cam_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_eliza_gdscs),
+	.driver_data = &cam_cc_eliza_driver_data,
+};
+
+static const struct of_device_id cam_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_eliza_match_table);
+
+static int cam_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_cc_eliza_desc);
+}
+
+static struct platform_driver cam_cc_eliza_driver = {
+	.probe = cam_cc_eliza_probe,
+	.driver = {
+		.name = "camcc-eliza",
+		.of_match_table = cam_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(cam_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI CAMCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


