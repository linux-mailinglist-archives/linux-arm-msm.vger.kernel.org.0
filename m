Return-Path: <linux-arm-msm+bounces-104840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN3ZOFjZ72maGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:47:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8747ADE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89170307584A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34CE3AE1B9;
	Mon, 27 Apr 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmnCGXP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUTf9Atv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153363AD512
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326168; cv=none; b=O1GfuFGbNj/5O9xLI7608iWjopRt+CV0R4XY42Tdsy7yko1fXlShAKTFn4ZtmtpFzQMOjdm6dR57cugu4n24vf0c80nUdHY8+M0IdZuCVCjDgFByLYWEMCK9+90gcoj9kpD9/3k/ZQfc+ENVE+gSAmtObVNkQGH3hecwyZnizbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326168; c=relaxed/simple;
	bh=uw4V+B7+t2cS9fxUGJzEQ7PDOrnJ0Qlz4lTdJNTmnow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qd/mQ94qyXVCsljLTzwmu0z/fZqjtcWa//mT0kP907664IE0fxSTFgdqickZPmIn499KsFkZyRXUPZ0dZWpyj5Cr38fu8THrISOUx3l88QOdwhDTlK+XLsWYQEGJc21puXvnEKQZkVC98XK1f6RLpvITWUSI4+cq2a4PNTR9skY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmnCGXP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUTf9Atv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDte2m241153
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jOnqOHnDIgR
	D38YYduiVZKhDrJNGyymPdUYwPxflU+g=; b=QmnCGXP7w66E4B3ZVS2p+RudyVG
	txhXOVcurLkyYuWbxxy26asXZTPOyyoy1BiYnc5uuDNprh19ZFfoQ65y6DogcogP
	kL+YZvHIjnznjbRmEXAIu0+mgcoG5xYQYRUbfeTMbCIsuyHWmRmEhvshy0Q2cHrR
	gMcQLdUnl5nwSFAniecwYVg4OfHLfueuzhL5d5U0vsUtzHuGsQt1m6U6kLaEaTEg
	ebjSXWg1rraME9FKkhWnpl6DA+tFmJzU6byjqqV4vPfyDAuNyDMtHydfiQpv1WwM
	Sr6Rhq4jeS5ToOdyxM3YlrWjY9vLgn+BcBrFJr2wwcHNqOMT+skC4NPmL3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946sps4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:44 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c21dbc9c1so40507662c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326164; x=1777930964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOnqOHnDIgRD38YYduiVZKhDrJNGyymPdUYwPxflU+g=;
        b=HUTf9AtvulKsijy+gF6YXYkSXsQW69ygjCK9JVFbU3f5P1Af2r85LEvewM37riIZsf
         7Djo0V/kIGhNpLv1Mx+yuUytTgU2rJFrLxnNnSLCLfJW/eQsJwE7hT5KGPTCYSmC8Nc9
         5f4OxoOWKVWR6tAIvaudAgqiJRQkWvQhQ4AJ4itb2/HRAMPc7BUpR2nllxNHjVBFDC7C
         Usd71r33rdYR3IBUMmHktLqMwnK5yQuyj6Kt0MVwiPsd1vh63X1688z3Fb4ESYnTQnSv
         UElf3HN5O1mW2dsNYcwlGvhWwPHuG82T7xQjqLR5oS7LvUOKQLgDJPxM7RTtqExsnI8r
         Q1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326164; x=1777930964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOnqOHnDIgRD38YYduiVZKhDrJNGyymPdUYwPxflU+g=;
        b=c/duIClasjle51Nn9/dxUNeuyhh5L+B+uGEKwmYJ0C2ZmCiNmWNpBDg7c8SJgeq5fV
         O7BbgS85Ni2/SNP53n3V8aV+i2rkeqhUV/vEiryRmrYErKbBZ6szAvKUtWugnHcHymHN
         4zUmoE9yywfcRfSpQRCBMU2KgdX3ohhYXHkJ+xDDB93jeYKq4c7OyJbGDBagnWxMdBad
         hsWlPdR0j99iGC1BihfXyliC87kRY6u4JXABPR78w+IWV6mF6VEn/79sgnSb14WaUUAX
         b5L6sSumTG0iF1M/fulkEJ9br8YTlt6BVVGN/Oug0l7c54lBdadvH1cw8CV7A9Vu0bjt
         K2ig==
X-Forwarded-Encrypted: i=1; AFNElJ9El7MlxjmDrAtbz6T5wn4ZTSQUQMZXyCGIEWDpZpNrBk3Dz1yTr9/X4aIKcCTcZoZ3oPXVougucGJ+1Vug@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmGRGEIe+oefydY8LRvo8FCiWXANIKOdiSvN5LBiSEmqrsPMa
	Le30WWiIguk/j//S+u8/InOC2+hCoaXm7aUJKFLcTEF/z4MQ6eCNAYZs1uQbZe4BvAD+LzWPs4O
	PRnCsHSWALEKXmJd8uZtwshVlXWqRAPaic8WWmltf+CW/W0eZQ/wbSgiJENGYJPKJ7VsH
X-Gm-Gg: AeBDievHZwsuXgkuQeW+PJY5BifivQp8u5ajD7YeM1kt+tslPW9EsG+oNXS5lcc1ybS
	CPSJooJkm1DkxbatcDmTd4UKqG8FTEa6Uejm69GAstxzwH7QsK0MvUyfebPuvLOMBG1LOsrGG1A
	q9a+F9F8HH+fJq+EjfUWikk+U8CcbY4c1HbxxnZ+hbYyNkdSRGsk9m1kDpD+/s3hoxoWxsJ0ZB3
	nKUqmMK3N8UujNJKL+rQM6rbkmeHUPfuph3Fqzj7nFq4J3bc2MU6X7ISvrZduKMl3X5uVN6pnNP
	mDaYkTJ1e5BCYeTyhKjg5Z2o7XsMFB9vvg8ycOmbBrjeUce7w18LIon0aVjtYCtB8sZy08Rt4wW
	IZ+VR1HT/wtVWD3gb7g9QIDxIO64Uo7BKjsPZZJPxWHDGIZCMMsfwznGFGJjtll/KCE8yX8ufoV
	8YvCFKcgGytg==
X-Received: by 2002:a05:7022:b8a:b0:12d:b8e5:5b4 with SMTP id a92af1059eb24-12ddd986d02mr322139c88.17.1777326163568;
        Mon, 27 Apr 2026 14:42:43 -0700 (PDT)
X-Received: by 2002:a05:7022:b8a:b0:12d:b8e5:5b4 with SMTP id a92af1059eb24-12ddd986d02mr322096c88.17.1777326162779;
        Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Date: Mon, 27 Apr 2026 14:42:17 -0700
Message-Id: <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efd854 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=94TNKR-hkEinp_EYofMA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 7Zf0dUkJ2rgLoa4jCJ963zWHSL_YGsCi
X-Proofpoint-ORIG-GUID: 7Zf0dUkJ2rgLoa4jCJ963zWHSL_YGsCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfXwVqB2HUlLV35
 CE6k0wQ04JKstcDYMZ2O8wNcwHP9OkjGN1eGs7f2sCajoa6rtsnjZyuktOMW365s54tRExlVAZ/
 1zvENeltHYwV0Vn1Fb1jdVzyTCR9hcuEAHuCwT/XEa4eEUtEWnfZkKTVmPcW3W/cpezohwzVKHr
 pMl8tqaJiYdZR9F64/0HuqHhlGMaTqKHvFxpd2mGx593PFR8ft/bFOLyRxgEh6vrLvlJyJ7OBCb
 B1alCxBWPFvwF1z3af0y8RXwepdja0IEL7HyDODfzJ8AQ73+nWD9BtpOvr+iOQY1hocHkPWMImH
 bSZ+8A1R60DLB8sdlgYnYO5Kg1kQ5WqOZSgSOk73CZu5cW46OxUhXmwEPtyEmDl568JJsj/Hep2
 2bNAMWnJXXpnuq9HfwZehvz5d1Z3JPi2XUAvTAhMz3gSXEHiUKLZsvhEkOVDYoDPMWis7pOrttz
 C8mV4wzOmF3lIK640eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270230
X-Rspamd-Queue-Id: 64B8747ADE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104840-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for the USB3-DP combo PHY found on Hawi platform.

The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
PHY sequences from the hardware programming guide and new V10 register
header files. Also add a new v10 offset structure to incorporate the new
COM AON register module.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 9 files changed, 506 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
new file mode 100644
index 000000000000..6542b586be89
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_COM_AON_V10_H_
+#define QCOM_PHY_QMP_COM_AON_V10_H_
+
+/* Only for QMP V10 PHY - COM AON registers */
+
+#define QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE         0x00
+#define QPHY_V10_COM_AON_DP_AON_TOGGLE_ENABLE           0x04
+#define QPHY_V10_COM_AON_DUMMY_STATUS                   0x08
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..53b709ea93d5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -32,6 +32,7 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-aon-v6.h"
 #include "phy-qcom-qmp-pcs-aon-v8.h"
+#include "phy-qcom-qmp-pcs-aon-v10.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-misc-v5.h"
@@ -40,6 +41,7 @@
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
 #include "phy-qcom-qmp-pcs-usb-v8.h"
+#include "phy-qcom-qmp-pcs-usb-v10.h"
 
 #include "phy-qcom-qmp-dp-com-v3.h"
 
@@ -49,9 +51,12 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
 
+#include "phy-qcom-qmp-com-aon-v10.h"
+
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
 #define SW_DPPHY_RESET				BIT(0)
@@ -268,6 +273,36 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
 };
 
+static const unsigned int qmp_v10_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V10_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V10_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V10_PCS_AON_CLAMP_ENABLE,
+
+	[QPHY_AON_TOGGLE_ENABLE]	= QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE,
+	[QPHY_DP_AON_TOGGLE_ENABLE]	= QPHY_V10_COM_AON_DP_AON_TOGGLE_ENABLE,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V10_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V10_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V10_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V10_COM_BIAS_EN_CLKBUFLR_EN,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V10_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V10_DP_PHY_VCO_DIV,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V10_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V10_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V10_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V10_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V10_TX_TRANSCEIVER_BIAS_EN,
+};
+
 static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V8_USB43_PCS_SW_RESET,
 	[QPHY_START_CTRL]			= QPHY_V8_USB43_PCS_START_CONTROL,
@@ -2058,6 +2093,141 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
+static const struct qmp_phy_init_tbl hawi_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE1, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE1_MODE1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CORE_CLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE0, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE1_MODE0, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_BUF_ENABLE, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP_CFG, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_ADDITIONAL_MISC, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_1, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_5, 0x5d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V10_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V10_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_GAIN2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_AUX_DATA_TCOARSE_TFINE, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_GM_CAL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH3, 0xdf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH4, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_LOW, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH2, 0x91),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VTH_CODE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_CONFIG, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG2, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+};
+
 /* list of regulators */
 static struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 21800, },
@@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
 	u16 dp_txa;
 	u16 dp_txb;
 	u16 dp_dp_phy;
+	u16 aon_toggle;
 };
 
 struct qmp_phy_cfg {
@@ -2270,6 +2441,7 @@ struct qmp_combo {
 	const struct qmp_phy_cfg *cfg;
 
 	void __iomem *com;
+	void __iomem *aon_toggle;
 
 	void __iomem *serdes;
 	void __iomem *tx;
@@ -2416,6 +2588,24 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
+	.com		= 0x0000,
+	.aon_toggle	= 0x0400,
+	.txa		= 0x1400,
+	.rxa		= 0x1600,
+	.txb		= 0x1800,
+	.rxb		= 0x1a00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1c00,
+	.usb3_pcs	= 0x1e00,
+	.usb3_pcs_aon	= 0x2000,
+	.usb3_pcs_usb	= 0x2100,
+	.dp_serdes	= 0x3000,
+	.dp_txa		= 0x3400,
+	.dp_txb		= 0x3800,
+	.dp_dp_phy	= 0x3c00,
+};
+
 static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.com		= 0x0000,
 	.usb3_pcs_aon	= 0x0100,
@@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.regs			= qmp_v6_n4_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v10,
+
+	.serdes_tbl		= hawi_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
+	.tx_tbl			= hawi_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
+	.rx_tbl			= hawi_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
+	.pcs_tbl		= hawi_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
+	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
+
+	.regs			= qmp_v10_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -3662,13 +3873,18 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
-	void __iomem *pcs_aon = qmp->pcs_aon;
+	void __iomem *aon_toggle;
 	int ret;
 	u32 val;
 
 	if (!force && qmp->init_count++)
 		return 0;
 
+	if (qmp->aon_toggle)
+		aon_toggle = qmp->aon_toggle;
+	else
+		aon_toggle = qmp->pcs_aon;
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -3699,9 +3915,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
 	/* override hardware control for reset of qmp phy */
-	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
-		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
-		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
+	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
+		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
 	}
 
 	/* Use software based port select and switch on typec orientation */
@@ -4733,6 +4949,9 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	if (offs->aon_toggle)
+		qmp->aon_toggle = base + offs->aon_toggle;
+
 	ret = qmp_combo_clk_init(qmp);
 	if (ret)
 		return ret;
@@ -4986,6 +5205,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,glymur-qmp-usb3-dp-phy",
 		.data = &glymur_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,hawi-qmp-usb3-dp-phy",
+		.data = &hawi_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
new file mode 100644
index 000000000000..6f3ea7d13556
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V10_H_
+#define QCOM_PHY_QMP_DP_PHY_V10_H_
+
+/* Only for QMP V10 PHY - DP PHY registers */
+
+#define QSERDES_V10_DP_PHY_VCO_DIV			0x070
+#define QSERDES_V10_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
+#define QSERDES_V10_DP_PHY_STATUS			0x0e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
new file mode 100644
index 000000000000..b858381bc238
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_AON_V10_H_
+#define QCOM_PHY_QMP_PCS_AON_V10_H_
+
+/* Only for QMP V10 PHY - PCS AON registers */
+
+#define QPHY_V10_PCS_AON_CLAMP_ENABLE			0x00
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
new file mode 100644
index 000000000000..0cc25e6acf58
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V10_H_
+#define QCOM_PHY_QMP_PCS_USB_V10_H_
+
+/* Only for QMP V10 PHY - USB PCS registers */
+
+#define QPHY_V10_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V10_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V10_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
+#define QPHY_V10_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_V10_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
new file mode 100644
index 000000000000..ac0fc434984b
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_H_
+#define QCOM_PHY_QMP_PCS_V10_H_
+
+/* Only for QMP V10 PHY - PCS registers */
+
+#define QPHY_V10_PCS_SW_RESET				0x000
+#define QPHY_V10_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V10_PCS_START_CONTROL			0x044
+#define QPHY_V10_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V10_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V10_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V10_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V10_PCS_RX_CONFIG				0x1b0
+#define QPHY_V10_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V10_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG2			0x1d4
+#define QPHY_V10_PCS_EQ_CONFIG1				0x1e0
+#define QPHY_V10_PCS_EQ_CONFIG2				0x1e4
+#define QPHY_V10_PCS_EQ_CONFIG5				0x1f0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
new file mode 100644
index 000000000000..92fbde7c9c7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES COM registers */
+
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1			0x00
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1			0x04
+#define QSERDES_V10_COM_CP_CTRL_MODE1				0x10
+#define QSERDES_V10_COM_PLL_RCTRL_MODE1				0x14
+#define QSERDES_V10_COM_PLL_CCTRL_MODE1				0x18
+#define QSERDES_V10_COM_CORECLK_DIV_MODE1			0x1c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE1				0x20
+#define QSERDES_V10_COM_LOCK_CMP2_MODE1				0x24
+#define QSERDES_V10_COM_DEC_START_MODE1				0x28
+#define QSERDES_V10_COM_DEC_START_MSB_MODE1			0x2c
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE1			0x30
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE1			0x34
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE1			0x38
+#define QSERDES_V10_COM_HSCLK_SEL_1				0x3c
+#define QSERDES_V10_COM_INTEGLOOP_GAIN0_MODE1			0x40
+#define QSERDES_V10_COM_INTEGLOOP_GAIN1_MODE1			0x44
+#define QSERDES_V10_COM_VCO_TUNE1_MODE1				0x48
+#define QSERDES_V10_COM_VCO_TUNE2_MODE1				0x4c
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x50
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE1		0x54
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE0		0x58
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE0		0x5c
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0			0x60
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0			0x64
+#define QSERDES_V10_COM_CP_CTRL_MODE0				0x70
+#define QSERDES_V10_COM_PLL_RCTRL_MODE0				0x74
+#define QSERDES_V10_COM_PLL_CCTRL_MODE0				0x78
+#define QSERDES_V10_COM_PLL_CORE_CLK_DIV_MODE0			0x7c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE0				0x80
+#define QSERDES_V10_COM_LOCK_CMP2_MODE0				0x84
+#define QSERDES_V10_COM_DEC_START_MODE0				0x88
+#define QSERDES_V10_COM_DEC_START_MSB_MODE0			0x8c
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE0			0x90
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE0			0x94
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE0			0x98
+#define QSERDES_V10_COM_HSCLK_HS_SWITCH_SEL_1			0x9c
+#define QSERDES_V10_COM_INTEGLOOP_GAIN0_MODE0			0xa0
+#define QSERDES_V10_COM_INTEGLOOP_GAIN1_MODE0			0xa4
+#define QSERDES_V10_COM_VCO_TUNE1_MODE0				0xa8
+#define QSERDES_V10_COM_VCO_TUNE2_MODE0				0xac
+#define QSERDES_V10_COM_BG_TIMER				0xbc
+#define QSERDES_V10_COM_SSC_EN_CENTER				0xc0
+#define QSERDES_V10_COM_SSC_ADJ_PER1				0xc4
+#define QSERDES_V10_COM_SSC_PER1				0xcc
+#define QSERDES_V10_COM_SSC_PER2				0xd0
+#define QSERDES_V10_COM_POST_DIV_MUX				0xd8
+#define QSERDES_V10_COM_BIAS_EN_CLKBUFLR_EN			0xdc
+#define QSERDES_V10_COM_CLK_ENABLE1				0xe0
+#define QSERDES_V10_COM_SYS_CLK_CTRL				0xe4
+#define QSERDES_V10_COM_SYSCLK_BUF_ENABLE			0xe8
+#define QSERDES_V10_COM_PLL_IVCO				0xf4
+#define QSERDES_V10_COM_PLL_IVCO_MODE1				0xf8
+#define QSERDES_V10_COM_CMN_IETRIM				0xfc
+#define QSERDES_V10_COM_CMN_IPTRIM				0x100
+#define QSERDES_V10_COM_SYSCLK_EN_SEL				0x110
+#define QSERDES_V10_COM_RESETSM_CNTRL				0x118
+#define QSERDES_V10_COM_LOCK_CMP_EN				0x120
+#define QSERDES_V10_COM_LOCK_CMP_CFG				0x124
+#define QSERDES_V10_COM_VCO_TUNE_CTRL				0x13c
+#define QSERDES_V10_COM_VCO_TUNE_MAP				0x140
+#define QSERDES_V10_COM_VCO_TUNE_INITVAL2			0x148
+#define QSERDES_V10_COM_VCO_TUNE_MAXVAL2			0x158
+#define QSERDES_V10_COM_CLK_SELECT				0x164
+#define QSERDES_V10_COM_CORE_CLK_EN				0x170
+#define QSERDES_V10_COM_CMN_CONFIG_1				0x174
+#define QSERDES_V10_COM_SVS_MODE_CLK_SEL			0x17c
+#define QSERDES_V10_COM_CMN_MISC_1				0x184
+#define QSERDES_V10_COM_CMN_MODE				0x188
+#define QSERDES_V10_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
+#define QSERDES_V10_COM_ADDITIONAL_MISC				0x1b4
+#define QSERDES_V10_COM_ADDITIONAL_MISC_2			0x1b8
+#define QSERDES_V10_COM_ADDITIONAL_MISC_3			0x1bc
+#define QSERDES_V10_COM_CMN_STATUS				0x2c8
+#define QSERDES_V10_COM_C_READY_STATUS				0x2f0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
new file mode 100644
index 000000000000..84f1adee5ff7
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES TX/RX registers */
+
+/* TX registers */
+#define QSERDES_V10_TX_CLKBUF_ENABLE				0x08
+#define QSERDES_V10_TX_TX_EMP_POST1_LVL				0x0c
+#define QSERDES_V10_TX_TX_DRV_LVL				0x14
+#define QSERDES_V10_TX_RESET_TSYNC_EN				0x1c
+#define QSERDES_V10_TX_PRE_STALL_LDO_BOOST_EN			0x20
+#define QSERDES_V10_TX_TX_BAND					0x24
+#define QSERDES_V10_TX_INTERFACE_SELECT				0x2c
+#define QSERDES_V10_TX_RES_CODE_LANE_TX				0x34
+#define QSERDES_V10_TX_RES_CODE_LANE_RX				0x38
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX			0x3c
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V10_TX_TRANSCEIVER_BIAS_EN			0x54
+#define QSERDES_V10_TX_HIGHZ_DRVR_EN				0x58
+#define QSERDES_V10_TX_TX_POL_INV				0x5c
+#define QSERDES_V10_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
+#define QSERDES_V10_TX_BIST_PATTERN7				0x7c
+#define QSERDES_V10_TX_LANE_MODE_1				0x84
+#define QSERDES_V10_TX_LANE_MODE_2				0x88
+#define QSERDES_V10_TX_LANE_MODE_3				0x8c
+#define QSERDES_V10_TX_LANE_MODE_4				0x90
+#define QSERDES_V10_TX_LANE_MODE_5				0x94
+#define QSERDES_V10_TX_RCV_DETECT_LVL_2				0xa4
+#define QSERDES_V10_TX_TRAN_DRVR_EMP_EN				0xc0
+#define QSERDES_V10_TX_TX_INTERFACE_MODE			0xc4
+#define QSERDES_V10_TX_VMODE_CTRL1				0xc8
+#define QSERDES_V10_TX_PI_QEC_CTRL				0xe4
+
+/* RX registers */
+#define QSERDES_V10_RX_UCDR_FO_GAIN				0x08
+#define QSERDES_V10_RX_UCDR_SO_GAIN				0x14
+#define QSERDES_V10_RX_UCDR_FASTLOCK_FO_GAIN			0x30
+#define QSERDES_V10_RX_UCDR_SO_SATURATION_AND_ENABLE		0x34
+#define QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
+#define QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
+#define QSERDES_V10_RX_UCDR_PI_CONTROLS				0x44
+#define QSERDES_V10_RX_UCDR_SB2_THRESH1				0x4c
+#define QSERDES_V10_RX_UCDR_SB2_THRESH2				0x50
+#define QSERDES_V10_RX_UCDR_SB2_GAIN1				0x54
+#define QSERDES_V10_RX_UCDR_SB2_GAIN2				0x58
+#define QSERDES_V10_RX_AUX_DATA_TCOARSE_TFINE			0x60
+#define QSERDES_V10_RX_TX_ADAPT_POST_THRESH			0xcc
+#define QSERDES_V10_RX_VGA_CAL_CNTRL1				0xd4
+#define QSERDES_V10_RX_VGA_CAL_CNTRL2				0xd8
+#define QSERDES_V10_RX_GM_CAL					0xdc
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW			0xf8
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_HIGH			0xfc
+#define QSERDES_V10_RX_RX_IDAC_ENABLES				0x100
+#define QSERDES_V10_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET	0x104
+#define QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
+#define QSERDES_V10_RX_SIGDET_ENABLES				0x118
+#define QSERDES_V10_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V10_RX_SIGDET_DEGLITCH_CNTRL			0x124
+#define QSERDES_V10_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V10_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V10_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V10_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V10_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V10_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V10_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V10_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V10_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V10_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V10_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V10_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V10_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V10_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V10_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V10_RX_DFE_EN_TIMER				0x1a0
+#define QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V10_RX_DCC_CTRL1				0x1a8
+#define QSERDES_V10_RX_VTH_CODE					0x1b0
+#define QSERDES_V10_RX_SIGDET_CAL_CTRL1				0x1e4
+#define QSERDES_V10_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a873bdd7bffe..7af77572970e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -39,6 +39,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -65,6 +68,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
-- 
2.34.1


