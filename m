Return-Path: <linux-arm-msm+bounces-104504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lx1aDa1m7Gn9YQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE946546F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD15B300B522
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 07:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0811432F764;
	Sat, 25 Apr 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG3A9e98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fv5bh23v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982EF3164D6
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100424; cv=none; b=DgmBrquHyn/hHfx1riH4I6psM1OZwAfRZYP9ysKO3ln/ExmKv1JWXjVn0qDoRp8kTl5QhCfqg7EeQTOoqWzhhHXo+4g3SiILGKBSxozsCs02rSpF3LcaSamrBgvEqq1tT1szTO/ZPBzfVWSWwWK7HZuEzklBn6SHL7ReS9rg/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100424; c=relaxed/simple;
	bh=niwpLRdZVb/yv3nxiRFBgTS/h7QlpP0GdHKIgcaJ4j4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i2iDWXVCvZLA2OmgCPWUrOxdBT0bfXVNJS3WlUXwcHMBzhAL4u0k7N8Jd4aIhQ5BUDTrY/R5mx2sevE0zJ01ELXN5xwJwhSeCgsI5LRRxU8d7FGfiGqGuaYtF3bCvt8sw/6R6qt8qTwtIja/oE98NWMU7J3+thd8JlrnRFKHGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG3A9e98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fv5bh23v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3SEbq2954889
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IF+chR2Mjpd
	gv3lORJEz2M1XgHjEUWpOvfc1MZieiYY=; b=kG3A9e98PF6H0kYxSJEkqltwKNz
	l7edp3W7ydSXFMg8iAFazP5yR0Gf8wJWzjXoOBPbzwgUvN7YQMlXi5+aFqUFvYzB
	JOaWwKEKBn+xqcPXCW4Ab2a7uK/ceLnW/q59UvFO7MQ9W2OLwGjvztJoVwhO1SWs
	sxvhHRt+yDPTX5mOep4QsC8mVTD5MDV62zfkZ/yldN+liwXKEXyZ0H5Wru0GeLw+
	r7052wqE5jaygK595xNg/iPyve/gA1d1pORjQWm95jNCyXhB+7dFA01TPU2FUtgR
	EnKvFOLs6AUHBYbaVvuauKC4yUpzrLwfGEx5rFZXzh3RNyuA5vJgHKraCSg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrgbgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so12794534eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100417; x=1777705217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF+chR2Mjpdgv3lORJEz2M1XgHjEUWpOvfc1MZieiYY=;
        b=fv5bh23ve2OWVlP/Z5l1DSgrXJCVFRbKj+WFkfHjTDx8OCUoDfkl3cEpTXFP0YLTrD
         VqALLveSphr9KqtWtQRdLw03hYSry6tQGxMtkt6rHe0XTg2mxVMJBfIojmAHnGMrW1el
         HRc0xQ+6msP2HNP21yz/lL13hDMc3yaINd0sJqNHdWmFrHFEE6WVd0GVWxNMZhfV4WWl
         SLhCvFy+Xh8w6mfn30dJ4+UW1pIn7sQn/WUUrUfvjwehutoJ+5p3OrX8Mcex0vRRjk/8
         ThVXNnFEB184HdHIR2ijaSEoBDwA9ZZ/KdLlrLpmVnvBLqOMAPikT1vCNOWaGhi4yrCG
         9bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100417; x=1777705217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IF+chR2Mjpdgv3lORJEz2M1XgHjEUWpOvfc1MZieiYY=;
        b=b0hNFAPY+JmS5VJH2v37KUZkIVg33Llbh5OqoCRCrSqZmvV67eFU76cELPK/es6tJm
         IPXgeYLPsGwmbC94SMdMabWrRAzc9p2Y0V47Y6DNptg2XI87S/MNx5IgcSclJ+VDBAIq
         jAB4sbClkLzXZBjGrdNfLz1H2H4pQ9EOhrunv1lHa7thKC09jagdyTBlWoe2FBmVj3ND
         MG2rk52Bq6+VyFjz41IAmQLjG5EmdKZP5WjMPzh8L2cSSmJWJL1lyTuPS24xfmaMTpC0
         swI5TXe+QmBgfsfcNudxLAQLm6pCTulw6vJL24dcSgAo6w+aDXyO2tbltZbjRiRgQ/cC
         1lzw==
X-Forwarded-Encrypted: i=1; AFNElJ/PtrnHVREW/6yxxQcgUZ7eMvDCjc4dAj2VSDgW3UnFOVxKHpGBCbiODzkCr5cOWf5X/sAgvBxgbokoR/NH@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQSFY9FmR8geOgXEA0T0pPoZbx+hL3o1UPLgYRzu/VEakCCHp
	GcUVK/PX+bkBRVyMcRjHcKYNFhButWn1JOBsISm1pDojpIBSRK9qIEDJdVe2eoyRgGNCncjE3Bp
	p2HAoZMk0/+McR8Jet8/VtpGCr1hqtR9T4wVXHoeWnqPIXwEn++ybVhyAlQbSU2KfZyB5
X-Gm-Gg: AeBDiessNnn84rIokA6AnXHG/PJMG2qn0nT/KdyEK0X/bgNBGIT8NYls+EYjSXJuv+7
	GaG5MMPqPtxu4DvfavSLUB7nVT0/6+SXeAILTFlDd90go1x5ZbNaE3Qxk8TjWU7S0y2PpoCL+Jo
	aYRypLJ7OHI42a43iiZB03XWUQ3yi7SCkDiwg/qpnOPY+7ZsF44/ohqxn5mRz30b2EP9cJkHxh/
	nir00/kjqQS2gN6MLD2uwMnRFU2wIL8+ALE93l5kgU505m1dYj0xYUn2Sw5rslnf5iSTmz85SjF
	LnsWbpNp5bj5pHiaPzUP4+Sk2Lgy7Qp4DfHdPSYbhEM52XMx22/2Kh/nS7ioNnMF9EoYAzTDp//
	BWGmuvgp827A/U4/LGPqGE/vH8hFTxKoeLNmPLfJNz9yF1zmLk5u8Bsgxw5Df76L4jM6BwDWxI7
	ZuRP3MlR8egA==
X-Received: by 2002:a05:7022:458d:b0:12b:f616:1a4e with SMTP id a92af1059eb24-12c73fa362emr16122065c88.23.1777100416428;
        Sat, 25 Apr 2026 00:00:16 -0700 (PDT)
X-Received: by 2002:a05:7022:458d:b0:12b:f616:1a4e with SMTP id a92af1059eb24-12c73fa362emr16122043c88.23.1777100415714;
        Sat, 25 Apr 2026 00:00:15 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:15 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Date: Sat, 25 Apr 2026 00:00:02 -0700
Message-Id: <20260425070002.348733-5-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX7Nk0UHV5cYYg
 k9Skwj2PvI0ziULpnVWbxfJhD42oM7SnV2Vny9dK62xDAodgQ66EpM7eTUhYJsbh4567Y/Mc493
 VD+A7EzH5J25dDD+V4eGQ7WlFE8zu+E82yxwi+G19FoqfMXE2baG7Fb2syA0TOaBK8LgG+3h4OY
 8f2WykSZ6Bl6Tyy+hFzHl2r38I2DjXTbWQLjwYhjbDIYl58+4QDPf/kWeI7e3sGdM+4C7ESScXc
 6Yiw6vVmJyajY/Bs+ErKntcdIvSran2fuWvUpHv89mYIskwFSWaRFg10+juSTcsYqnqFZuA5o14
 UU7kxnqyAmYkeMFnGX9PNHfzzanNN8axGwu+4Boh8rgy4kXw9SJAkbGOZ4bm7BWf71e+MWQgeq3
 FDX+N+KuLHTefaTLh3a/eHJi6UcMhbdjZtLFIcHmgdk/9WVyetKYF9Fc3rc/Fpbjz6OQB5J+mz1
 dpvRGISjq+KG1iuRkGA==
X-Proofpoint-ORIG-GUID: f5-UVf0VkhHuj6jIs6qECgDTz3VQMP0u
X-Proofpoint-GUID: f5-UVf0VkhHuj6jIs6qECgDTz3VQMP0u
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ec6681 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=94TNKR-hkEinp_EYofMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: 2AFE946546F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104504-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for the USB3-DP combo PHY found on Hawi platform.

The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
PHY sequences from the hardware programming guide and new V10 register
header files. Also add a new v10 offset structure to incorporate the new
COM AON register module.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 232 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 9 files changed, 507 insertions(+), 4 deletions(-)
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
index 93f1aa10d400..cce229101473 100644
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
@@ -2058,6 +2093,142 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
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
+
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
@@ -2198,6 +2369,7 @@ struct qmp_combo_offsets {
 	u16 dp_txa;
 	u16 dp_txb;
 	u16 dp_dp_phy;
+	u16 aon_toggle;
 };
 
 struct qmp_phy_cfg {
@@ -2270,6 +2442,7 @@ struct qmp_combo {
 	const struct qmp_phy_cfg *cfg;
 
 	void __iomem *com;
+	void __iomem *aon_toggle;
 
 	void __iomem *serdes;
 	void __iomem *tx;
@@ -2416,6 +2589,24 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
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
@@ -2705,6 +2896,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
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
 
@@ -3662,13 +3874,18 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
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
@@ -3699,9 +3916,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
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
@@ -4733,6 +4950,9 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	if (offs->aon_toggle)
+		qmp->aon_toggle = base + offs->aon_toggle;
+
 	ret = qmp_combo_clk_init(qmp);
 	if (ret)
 		return ret;
@@ -4986,6 +5206,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
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


