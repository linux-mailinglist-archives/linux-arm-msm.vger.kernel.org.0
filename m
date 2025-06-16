Return-Path: <linux-arm-msm+bounces-61358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E71ECADA51D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 02:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE8AC7A4C26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 00:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81F021ABC9;
	Mon, 16 Jun 2025 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFNvrleb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1D1F1927
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033773; cv=none; b=aLgUZEt+hkzhrJMQ2F3D4hK19/H3Byey2PoMMCy1yoS7IlviFWEbc3bdYQK1jvjbRzAPLE8BxLvaCvQpLNhNAtoY3fCM0ll//5qdAL4yH34kBUll2u90JL+zPIUMy1Q1RkohBP82yoR8UVvfy/xoaQAzNyJO9SnkYfYxuwMl5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033773; c=relaxed/simple;
	bh=bBbPgWexkDpRCqTXwnbgm6YFg8/jSw7JM3CzIo4s1w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TanfiIHXUrxqItWJvXAGyl4GlOWq2YGiYXCcAaNw99YsMi6qi7TAchjY7XZyxH5VWfj/LaVw9sXCL9AmwJKtvoIzmTcPYRhBesbRI4TzFLAy13fu60WhEmKIxk5e+oP7rCe91dDK4gY2x/lU+P1A0rMtJ8N1+UdKpMug5OeRgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFNvrleb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLswIY004109
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	va5aZWVKpIytVwsEgq7nQjCg9ua6/jvkJ8zXIIesBDQ=; b=hFNvrlebAoeorEHE
	HFfp2qO3ia8HjU0hv8gZHIAPj1PRJCrK3PS044ukw39+H0emRCYmom3JYcCGV9ts
	GP1bZddam1BOz5WkKFmKswjg4VTIxn5l6FcQWNJzmSR/FRs9XcYlT6KM7Za/uMyH
	vAKWXZsGaDeThbuL4UxaEaxQYpboeQutWr0seT5i5RIMzlj1opEJLRheZjarRgjK
	dG1IjtGPkFZ3C+zospeFkKi0HwLIi3MmOKk1sq+TPbnhVw0h/wkROAJDRUC0qhJU
	b/ROY0+nbxt1gI4dl1Q1rZ/MYj8bfRUu3AqUp2MCZa8b+2oigqGedGzdDeQDXwSV
	dwrvYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fstjfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab979413fso77947786d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 17:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033768; x=1750638568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va5aZWVKpIytVwsEgq7nQjCg9ua6/jvkJ8zXIIesBDQ=;
        b=pIe/oQFUT3P/+SXh3ktgq7yIYlLqFcLyISAKQjHYu4VBLRS0OtMCfw3FbyqCep/MIg
         bqyay9kFGcJnZIaI5RxY+DK/FF33VbsPWmisro7/qd/7tQe2S+RECHjAlM0k8I66SCoV
         Pe4Dk0ifcVgmgyrpXeYS0VfP15unBQhrH/woBcxgDTmLMIQRy9Y4/P980RIuX+5pFeTf
         uoBMV/X02nVuzNXud9rOZm8EGFe7+UnJ1KT2c1rvD+wEoxeKZWctT8/BGg1PcJdXlpCv
         hybt+Sfmv+KQ+OTiw/zk7vuSaDOoZ+r/95kvJpruLLNegzHxIsa2SGtxCR2+CD+3TLQm
         CSig==
X-Gm-Message-State: AOJu0Yx4UVDCfTCyFg9WO06vRrpct+i6zY7BcQRP6KDxlWsywqyNtZpD
	1s429Qw9Exl6M8JWHAoMwEUsQhTxjLWb8T/WiP4Zl2cI9IYgE5zbcd0RcKVLx7U+ORkN3PPiwc2
	7t6Uv92q4NM479RIbksf7JVTUwqRlsNa84rEDLY04xy5V7gUmGU5iDku3g+EGIlfvTrImPtMlGC
	Hqjl4=
X-Gm-Gg: ASbGncu4l7kI+f/a+vb6YEC5006ccAQenXj5QeYt4ENy5u6q0RAGn9sOmwqDZ+cWgZS
	aI429ezezYPPCOZ1Uc+9oJuC1+Miji+WZnhY6LYh2bTFLVOUjeHVAnsM0Wir6HP/5VG7/sFQaIr
	zRjNfZnhlxKe2RAuK7GmS9pgOvZq7ou5sAKGpcbmCMLyB1zFLw486Oa9OLy5FVOI/FHernWj1mQ
	YKdwVRwKkYUZe/9z1fRLb1YB/syh9mv+mWl55KovcMuofWP8qNcD/qizHWD6J73CCEezxrI7IQm
	iFq2ijsxf7rCVABUcjDb4XDseMp6w9jKm6oV7DMiL0rg922UvWMpusPnJGOSieepKkcIvxxS72Q
	WFHZPYdy/E1NuxziE3znmAIzGAeiVo7LOiAM=
X-Received: by 2002:a05:6214:27c5:b0:6fa:faf9:aabb with SMTP id 6a1803df08f44-6fb477a6aefmr115441226d6.38.1750033768185;
        Sun, 15 Jun 2025 17:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxcSHaWZ1GE3oxXPrFiGiCmOuCIJ5D+fOF5FEv2u0ZuVjou/26J5cb/q8GVNcizcuNksgY7w==
X-Received: by 2002:a05:6214:27c5:b0:6fa:faf9:aabb with SMTP id 6a1803df08f44-6fb477a6aefmr115441066d6.38.1750033767727;
        Sun, 15 Jun 2025 17:29:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:29:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:29 +0300
Subject: [PATCH 17/28] interconnect: qcom: sdx55: convert to dynamic IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-17-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBbPgWexkDpRCqTXwnbgm6YFg8/jSw7JM3CzIo4s1w8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoT2Uk7jUEs7s6tFS9U9vaFFbB13bNdJ9erPPpl
 aJNJ29RE0mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaE9lJAAKCRCLPIo+Aiko
 1UyQB/9mrzlSrp9Gvi8dBzn4p8gUg1QrajCy/UnpB3RvkOE+TCDL37nVY3Quh+CygsynnQnsGKc
 ke8VIIQYHu1RrTmDpqTfIB3x/RxhRqeypkHim5vTgr2Jhj4TIe7m7YbWamuD/LCXSj6YXTgvQSk
 Urp6SSjbcJzg2lQutGgUhUOkmZX7XoK+G3OzbJQcoEt2DghxtVxQqL4zpYWS7AF+LFPKTMYiFpV
 5SV3/5muddz3GPa3hdQNri4IMKWL1VSYncIyY3/EmPupI9jp2GztUL9ej/dnb8wmhp0CWCg3tcS
 emvK9z99X95WU8u6tIILnhAF8ANiuSgXRIDaESoKi0gB3LID
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMSBTYWx0ZWRfXxM1tApEoFuGA
 H0NRjoGPdzZ3N9ANNi58EsV14Mn5X41R6B7TTI49hI0RuGIvsRbDz8imbCmRLI7kWtkU0XIMTJC
 Oa7t7WFnfrNPcXoqbnpLKQs1fbSRyOWRSNIDObqfXw0MRgWW79cRXjLuWiyh9mg3Wl8qD/agOD7
 k6phsO4yNGlWW+19elvgz5EsPm8YY8bUyFVz1JEozU448zIyQdnmEGLvl4xevN05+4yqXRnQMAP
 W1RNpiWSmXp8nebusIQNZjJ9NVpzg5l4hk4cToLvyhfkYcLUNDig9L/88jEj65FcHsHLufBXIzF
 vFm8boqlzooBKYg6hL0AEZA8FGZYoSGysMNPB2clM+0kXUbcN8pxykLC5yDm6Gzy04rKDvorpuk
 KOitClFr6CJHOi/EFNshNSeQ0A0Pj5aL+UYsdc9lx3CxPg9LTnxZYPNhRvHvR+Au2PNNReMh
X-Proofpoint-ORIG-GUID: v3CrWrFoG-RfakWuL_lxjyVpW9FMDney
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=684f6569 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lxKA6TRo1hT2z37wmrwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: v3CrWrFoG-RfakWuL_lxjyVpW9FMDney
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160001

Stop using fixed and IDs and covert the platform to use dynamic IDs for
the interconnect. This gives more flexibility and also allows us to drop
the .num_links member, saving from possible errors related to it being
not set or set incorrectly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sdx55.c | 554 +++++++++++++++++++-------------------
 drivers/interconnect/qcom/sdx55.h |  70 -----
 2 files changed, 275 insertions(+), 349 deletions(-)

diff --git a/drivers/interconnect/qcom/sdx55.c b/drivers/interconnect/qcom/sdx55.c
index af273e39eef3e90519635d1c310dc108a9f8b708..5d85c1e6ec58d3949b30c143440bb6dd0779a605 100644
--- a/drivers/interconnect/qcom/sdx55.c
+++ b/drivers/interconnect/qcom/sdx55.c
@@ -17,630 +17,623 @@
 
 #include "bcm-voter.h"
 #include "icc-rpmh.h"
-#include "sdx55.h"
+
+static struct qcom_icc_node llcc_mc;
+static struct qcom_icc_node acm_tcu;
+static struct qcom_icc_node qnm_snoc_gc;
+static struct qcom_icc_node xm_apps_rdwr;
+static struct qcom_icc_node qhm_audio;
+static struct qcom_icc_node qhm_blsp1;
+static struct qcom_icc_node qhm_qdss_bam;
+static struct qcom_icc_node qhm_qpic;
+static struct qcom_icc_node qhm_snoc_cfg;
+static struct qcom_icc_node qhm_spmi_fetcher1;
+static struct qcom_icc_node qnm_aggre_noc;
+static struct qcom_icc_node qnm_ipa;
+static struct qcom_icc_node qnm_memnoc;
+static struct qcom_icc_node qnm_memnoc_pcie;
+static struct qcom_icc_node qxm_crypto;
+static struct qcom_icc_node xm_emac;
+static struct qcom_icc_node xm_ipa2pcie_slv;
+static struct qcom_icc_node xm_pcie;
+static struct qcom_icc_node xm_qdss_etr;
+static struct qcom_icc_node xm_sdc1;
+static struct qcom_icc_node xm_usb3;
+static struct qcom_icc_node ebi;
+static struct qcom_icc_node qns_llcc;
+static struct qcom_icc_node qns_memnoc_snoc;
+static struct qcom_icc_node qns_sys_pcie;
+static struct qcom_icc_node qhs_aop;
+static struct qcom_icc_node qhs_aoss;
+static struct qcom_icc_node qhs_apss;
+static struct qcom_icc_node qhs_audio;
+static struct qcom_icc_node qhs_blsp1;
+static struct qcom_icc_node qhs_clk_ctl;
+static struct qcom_icc_node qhs_crypto0_cfg;
+static struct qcom_icc_node qhs_ddrss_cfg;
+static struct qcom_icc_node qhs_ecc_cfg;
+static struct qcom_icc_node qhs_emac_cfg;
+static struct qcom_icc_node qhs_imem_cfg;
+static struct qcom_icc_node qhs_ipa;
+static struct qcom_icc_node qhs_mss_cfg;
+static struct qcom_icc_node qhs_pcie_parf;
+static struct qcom_icc_node qhs_pdm;
+static struct qcom_icc_node qhs_prng;
+static struct qcom_icc_node qhs_qdss_cfg;
+static struct qcom_icc_node qhs_qpic;
+static struct qcom_icc_node qhs_sdc1;
+static struct qcom_icc_node qhs_snoc_cfg;
+static struct qcom_icc_node qhs_spmi_fetcher;
+static struct qcom_icc_node qhs_spmi_vgi_coex;
+static struct qcom_icc_node qhs_tcsr;
+static struct qcom_icc_node qhs_tlmm;
+static struct qcom_icc_node qhs_usb3;
+static struct qcom_icc_node qhs_usb3_phy;
+static struct qcom_icc_node qns_aggre_noc;
+static struct qcom_icc_node qns_snoc_memnoc;
+static struct qcom_icc_node qxs_imem;
+static struct qcom_icc_node srvc_snoc;
+static struct qcom_icc_node xs_pcie;
+static struct qcom_icc_node xs_qdss_stm;
+static struct qcom_icc_node xs_sys_tcu_cfg;
 
 static struct qcom_icc_node llcc_mc = {
 	.name = "llcc_mc",
-	.id = SDX55_MASTER_LLCC,
 	.channels = 4,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_EBI_CH0 },
+	.link_nodes = { &ebi, NULL },
 };
 
 static struct qcom_icc_node acm_tcu = {
 	.name = "acm_tcu",
-	.id = SDX55_MASTER_TCU_0,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 3,
-	.links = { SDX55_SLAVE_LLCC,
-		   SDX55_SLAVE_MEM_NOC_SNOC,
-		   SDX55_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_memnoc_snoc,
+			&qns_sys_pcie, NULL },
 };
 
 static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
-	.id = SDX55_MASTER_SNOC_GC_MEM_NOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_LLCC },
+	.link_nodes = { &qns_llcc, NULL },
 };
 
 static struct qcom_icc_node xm_apps_rdwr = {
 	.name = "xm_apps_rdwr",
-	.id = SDX55_MASTER_AMPSS_M0,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 3,
-	.links = { SDX55_SLAVE_LLCC,
-		   SDX55_SLAVE_MEM_NOC_SNOC,
-		   SDX55_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_memnoc_snoc,
+			&qns_sys_pcie, NULL },
 };
 
 static struct qcom_icc_node qhm_audio = {
 	.name = "qhm_audio",
-	.id = SDX55_MASTER_AUDIO,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node qhm_blsp1 = {
 	.name = "qhm_blsp1",
-	.id = SDX55_MASTER_BLSP_1,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
-	.id = SDX55_MASTER_QDSS_BAM,
-	.channels = 1,
-	.buswidth = 4,
-	.num_links = 28,
-	.links = { SDX55_SLAVE_SNOC_CFG,
-		   SDX55_SLAVE_EMAC_CFG,
-		   SDX55_SLAVE_USB3,
-		   SDX55_SLAVE_TLMM,
-		   SDX55_SLAVE_SPMI_FETCHER,
-		   SDX55_SLAVE_QDSS_CFG,
-		   SDX55_SLAVE_PDM,
-		   SDX55_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX55_SLAVE_TCSR,
-		   SDX55_SLAVE_CNOC_DDRSS,
-		   SDX55_SLAVE_SPMI_VGI_COEX,
-		   SDX55_SLAVE_QPIC,
-		   SDX55_SLAVE_OCIMEM,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_USB3_PHY_CFG,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_BLSP_1,
-		   SDX55_SLAVE_SDCC_1,
-		   SDX55_SLAVE_CNOC_MSS,
-		   SDX55_SLAVE_PCIE_PARF,
-		   SDX55_SLAVE_ECC_CFG,
-		   SDX55_SLAVE_AUDIO,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_PRNG,
-		   SDX55_SLAVE_CRYPTO_0_CFG,
-		   SDX55_SLAVE_TCU,
-		   SDX55_SLAVE_CLK_CTL,
-		   SDX55_SLAVE_IMEM_CFG
-	},
+	.channels = 1,
+	.buswidth = 4,
+	.link_nodes = { &qhs_snoc_cfg,
+			&qhs_emac_cfg,
+			&qhs_usb3,
+			&qhs_tlmm,
+			&qhs_spmi_fetcher,
+			&qhs_qdss_cfg,
+			&qhs_pdm,
+			&qns_snoc_memnoc,
+			&qhs_tcsr,
+			&qhs_ddrss_cfg,
+			&qhs_spmi_vgi_coex,
+			&qhs_qpic,
+			&qxs_imem,
+			&qhs_ipa,
+			&qhs_usb3_phy,
+			&qhs_aop,
+			&qhs_blsp1,
+			&qhs_sdc1,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_ecc_cfg,
+			&qhs_audio,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_crypto0_cfg,
+			&xs_sys_tcu_cfg,
+			&qhs_clk_ctl,
+			&qhs_imem_cfg, NULL },
 };
 
 static struct qcom_icc_node qhm_qpic = {
 	.name = "qhm_qpic",
-	.id = SDX55_MASTER_QPIC,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 5,
-	.links = { SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_ANOC_SNOC,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_AUDIO
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_ipa,
+			&qns_aggre_noc,
+			&qhs_aop,
+			&qhs_audio, NULL },
 };
 
 static struct qcom_icc_node qhm_snoc_cfg = {
 	.name = "qhm_snoc_cfg",
-	.id = SDX55_MASTER_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_SERVICE_SNOC },
+	.link_nodes = { &srvc_snoc, NULL },
 };
 
 static struct qcom_icc_node qhm_spmi_fetcher1 = {
 	.name = "qhm_spmi_fetcher1",
-	.id = SDX55_MASTER_SPMI_FETCHER,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 3,
-	.links = { SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_ANOC_SNOC,
-		   SDX55_SLAVE_AOP
-	},
+	.link_nodes = { &qhs_aoss,
+			&qns_aggre_noc,
+			&qhs_aop, NULL },
 };
 
 static struct qcom_icc_node qnm_aggre_noc = {
 	.name = "qnm_aggre_noc",
-	.id = SDX55_MASTER_ANOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 30,
-	.links = { SDX55_SLAVE_PCIE_0,
-		   SDX55_SLAVE_SNOC_CFG,
-		   SDX55_SLAVE_SDCC_1,
-		   SDX55_SLAVE_TLMM,
-		   SDX55_SLAVE_SPMI_FETCHER,
-		   SDX55_SLAVE_QDSS_CFG,
-		   SDX55_SLAVE_PDM,
-		   SDX55_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX55_SLAVE_TCSR,
-		   SDX55_SLAVE_CNOC_DDRSS,
-		   SDX55_SLAVE_SPMI_VGI_COEX,
-		   SDX55_SLAVE_QDSS_STM,
-		   SDX55_SLAVE_QPIC,
-		   SDX55_SLAVE_OCIMEM,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_USB3_PHY_CFG,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_BLSP_1,
-		   SDX55_SLAVE_USB3,
-		   SDX55_SLAVE_CNOC_MSS,
-		   SDX55_SLAVE_PCIE_PARF,
-		   SDX55_SLAVE_ECC_CFG,
-		   SDX55_SLAVE_APPSS,
-		   SDX55_SLAVE_AUDIO,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_PRNG,
-		   SDX55_SLAVE_CRYPTO_0_CFG,
-		   SDX55_SLAVE_TCU,
-		   SDX55_SLAVE_CLK_CTL,
-		   SDX55_SLAVE_IMEM_CFG
-	},
+	.link_nodes = { &xs_pcie,
+			&qhs_snoc_cfg,
+			&qhs_sdc1,
+			&qhs_tlmm,
+			&qhs_spmi_fetcher,
+			&qhs_qdss_cfg,
+			&qhs_pdm,
+			&qns_snoc_memnoc,
+			&qhs_tcsr,
+			&qhs_ddrss_cfg,
+			&qhs_spmi_vgi_coex,
+			&xs_qdss_stm,
+			&qhs_qpic,
+			&qxs_imem,
+			&qhs_ipa,
+			&qhs_usb3_phy,
+			&qhs_aop,
+			&qhs_blsp1,
+			&qhs_usb3,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_ecc_cfg,
+			&qhs_apss,
+			&qhs_audio,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_crypto0_cfg,
+			&xs_sys_tcu_cfg,
+			&qhs_clk_ctl,
+			&qhs_imem_cfg, NULL },
 };
 
 static struct qcom_icc_node qnm_ipa = {
 	.name = "qnm_ipa",
-	.id = SDX55_MASTER_IPA,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 27,
-	.links = { SDX55_SLAVE_SNOC_CFG,
-		   SDX55_SLAVE_EMAC_CFG,
-		   SDX55_SLAVE_USB3,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_SPMI_FETCHER,
-		   SDX55_SLAVE_QDSS_CFG,
-		   SDX55_SLAVE_PDM,
-		   SDX55_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX55_SLAVE_TCSR,
-		   SDX55_SLAVE_CNOC_DDRSS,
-		   SDX55_SLAVE_QDSS_STM,
-		   SDX55_SLAVE_QPIC,
-		   SDX55_SLAVE_OCIMEM,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_USB3_PHY_CFG,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_BLSP_1,
-		   SDX55_SLAVE_SDCC_1,
-		   SDX55_SLAVE_CNOC_MSS,
-		   SDX55_SLAVE_PCIE_PARF,
-		   SDX55_SLAVE_ECC_CFG,
-		   SDX55_SLAVE_AUDIO,
-		   SDX55_SLAVE_TLMM,
-		   SDX55_SLAVE_PRNG,
-		   SDX55_SLAVE_CRYPTO_0_CFG,
-		   SDX55_SLAVE_CLK_CTL,
-		   SDX55_SLAVE_IMEM_CFG
-	},
+	.link_nodes = { &qhs_snoc_cfg,
+			&qhs_emac_cfg,
+			&qhs_usb3,
+			&qhs_aoss,
+			&qhs_spmi_fetcher,
+			&qhs_qdss_cfg,
+			&qhs_pdm,
+			&qns_snoc_memnoc,
+			&qhs_tcsr,
+			&qhs_ddrss_cfg,
+			&xs_qdss_stm,
+			&qhs_qpic,
+			&qxs_imem,
+			&qhs_ipa,
+			&qhs_usb3_phy,
+			&qhs_aop,
+			&qhs_blsp1,
+			&qhs_sdc1,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_ecc_cfg,
+			&qhs_audio,
+			&qhs_tlmm,
+			&qhs_prng,
+			&qhs_crypto0_cfg,
+			&qhs_clk_ctl,
+			&qhs_imem_cfg, NULL },
 };
 
 static struct qcom_icc_node qnm_memnoc = {
 	.name = "qnm_memnoc",
-	.id = SDX55_MASTER_MEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 29,
-	.links = { SDX55_SLAVE_SNOC_CFG,
-		   SDX55_SLAVE_EMAC_CFG,
-		   SDX55_SLAVE_USB3,
-		   SDX55_SLAVE_TLMM,
-		   SDX55_SLAVE_SPMI_FETCHER,
-		   SDX55_SLAVE_QDSS_CFG,
-		   SDX55_SLAVE_PDM,
-		   SDX55_SLAVE_TCSR,
-		   SDX55_SLAVE_CNOC_DDRSS,
-		   SDX55_SLAVE_SPMI_VGI_COEX,
-		   SDX55_SLAVE_QDSS_STM,
-		   SDX55_SLAVE_QPIC,
-		   SDX55_SLAVE_OCIMEM,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_USB3_PHY_CFG,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_BLSP_1,
-		   SDX55_SLAVE_SDCC_1,
-		   SDX55_SLAVE_CNOC_MSS,
-		   SDX55_SLAVE_PCIE_PARF,
-		   SDX55_SLAVE_ECC_CFG,
-		   SDX55_SLAVE_APPSS,
-		   SDX55_SLAVE_AUDIO,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_PRNG,
-		   SDX55_SLAVE_CRYPTO_0_CFG,
-		   SDX55_SLAVE_TCU,
-		   SDX55_SLAVE_CLK_CTL,
-		   SDX55_SLAVE_IMEM_CFG
-	},
+	.link_nodes = { &qhs_snoc_cfg,
+			&qhs_emac_cfg,
+			&qhs_usb3,
+			&qhs_tlmm,
+			&qhs_spmi_fetcher,
+			&qhs_qdss_cfg,
+			&qhs_pdm,
+			&qhs_tcsr,
+			&qhs_ddrss_cfg,
+			&qhs_spmi_vgi_coex,
+			&xs_qdss_stm,
+			&qhs_qpic,
+			&qxs_imem,
+			&qhs_ipa,
+			&qhs_usb3_phy,
+			&qhs_aop,
+			&qhs_blsp1,
+			&qhs_sdc1,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_ecc_cfg,
+			&qhs_apss,
+			&qhs_audio,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_crypto0_cfg,
+			&xs_sys_tcu_cfg,
+			&qhs_clk_ctl,
+			&qhs_imem_cfg, NULL },
 };
 
 static struct qcom_icc_node qnm_memnoc_pcie = {
 	.name = "qnm_memnoc_pcie",
-	.id = SDX55_MASTER_MEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_PCIE_0 },
+	.link_nodes = { &xs_pcie, NULL },
 };
 
 static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
-	.id = SDX55_MASTER_CRYPTO_CORE_0,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 3,
-	.links = { SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_ANOC_SNOC,
-		   SDX55_SLAVE_AOP
-	},
+	.link_nodes = { &qhs_aoss,
+			&qns_aggre_noc,
+			&qhs_aop, NULL },
 };
 
 static struct qcom_icc_node xm_emac = {
 	.name = "xm_emac",
-	.id = SDX55_MASTER_EMAC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node xm_ipa2pcie_slv = {
 	.name = "xm_ipa2pcie_slv",
-	.id = SDX55_MASTER_IPA_PCIE,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_PCIE_0 },
+	.link_nodes = { &xs_pcie, NULL },
 };
 
 static struct qcom_icc_node xm_pcie = {
 	.name = "xm_pcie",
-	.id = SDX55_MASTER_PCIE,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
-	.id = SDX55_MASTER_QDSS_ETR,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 28,
-	.links = { SDX55_SLAVE_SNOC_CFG,
-		   SDX55_SLAVE_EMAC_CFG,
-		   SDX55_SLAVE_USB3,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_SPMI_FETCHER,
-		   SDX55_SLAVE_QDSS_CFG,
-		   SDX55_SLAVE_PDM,
-		   SDX55_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX55_SLAVE_TCSR,
-		   SDX55_SLAVE_CNOC_DDRSS,
-		   SDX55_SLAVE_SPMI_VGI_COEX,
-		   SDX55_SLAVE_QPIC,
-		   SDX55_SLAVE_OCIMEM,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_USB3_PHY_CFG,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_BLSP_1,
-		   SDX55_SLAVE_SDCC_1,
-		   SDX55_SLAVE_CNOC_MSS,
-		   SDX55_SLAVE_PCIE_PARF,
-		   SDX55_SLAVE_ECC_CFG,
-		   SDX55_SLAVE_AUDIO,
-		   SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_PRNG,
-		   SDX55_SLAVE_CRYPTO_0_CFG,
-		   SDX55_SLAVE_TCU,
-		   SDX55_SLAVE_CLK_CTL,
-		   SDX55_SLAVE_IMEM_CFG
-	},
+	.link_nodes = { &qhs_snoc_cfg,
+			&qhs_emac_cfg,
+			&qhs_usb3,
+			&qhs_aoss,
+			&qhs_spmi_fetcher,
+			&qhs_qdss_cfg,
+			&qhs_pdm,
+			&qns_snoc_memnoc,
+			&qhs_tcsr,
+			&qhs_ddrss_cfg,
+			&qhs_spmi_vgi_coex,
+			&qhs_qpic,
+			&qxs_imem,
+			&qhs_ipa,
+			&qhs_usb3_phy,
+			&qhs_aop,
+			&qhs_blsp1,
+			&qhs_sdc1,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_ecc_cfg,
+			&qhs_audio,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_crypto0_cfg,
+			&xs_sys_tcu_cfg,
+			&qhs_clk_ctl,
+			&qhs_imem_cfg, NULL },
 };
 
 static struct qcom_icc_node xm_sdc1 = {
 	.name = "xm_sdc1",
-	.id = SDX55_MASTER_SDCC_1,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 5,
-	.links = { SDX55_SLAVE_AOSS,
-		   SDX55_SLAVE_IPA_CFG,
-		   SDX55_SLAVE_ANOC_SNOC,
-		   SDX55_SLAVE_AOP,
-		   SDX55_SLAVE_AUDIO
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_ipa,
+			&qns_aggre_noc,
+			&qhs_aop,
+			&qhs_audio, NULL },
 };
 
 static struct qcom_icc_node xm_usb3 = {
 	.name = "xm_usb3",
-	.id = SDX55_MASTER_USB3,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node ebi = {
 	.name = "ebi",
-	.id = SDX55_SLAVE_EBI_CH0,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_llcc = {
 	.name = "qns_llcc",
-	.id = SDX55_SLAVE_LLCC,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SDX55_SLAVE_EBI_CH0 },
+	.link_nodes = { &ebi, NULL },
 };
 
 static struct qcom_icc_node qns_memnoc_snoc = {
 	.name = "qns_memnoc_snoc",
-	.id = SDX55_SLAVE_MEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_MASTER_MEM_NOC_SNOC },
+	.link_nodes = { &qnm_memnoc, NULL },
 };
 
 static struct qcom_icc_node qns_sys_pcie = {
 	.name = "qns_sys_pcie",
-	.id = SDX55_SLAVE_MEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_MASTER_MEM_NOC_PCIE_SNOC },
+	.link_nodes = { &qnm_memnoc_pcie, NULL },
 };
 
 static struct qcom_icc_node qhs_aop = {
 	.name = "qhs_aop",
-	.id = SDX55_SLAVE_AOP,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_aoss = {
 	.name = "qhs_aoss",
-	.id = SDX55_SLAVE_AOSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_apss = {
 	.name = "qhs_apss",
-	.id = SDX55_SLAVE_APPSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_audio = {
 	.name = "qhs_audio",
-	.id = SDX55_SLAVE_AUDIO,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_blsp1 = {
 	.name = "qhs_blsp1",
-	.id = SDX55_SLAVE_BLSP_1,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_clk_ctl = {
 	.name = "qhs_clk_ctl",
-	.id = SDX55_SLAVE_CLK_CTL,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_crypto0_cfg = {
 	.name = "qhs_crypto0_cfg",
-	.id = SDX55_SLAVE_CRYPTO_0_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ddrss_cfg = {
 	.name = "qhs_ddrss_cfg",
-	.id = SDX55_SLAVE_CNOC_DDRSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ecc_cfg = {
 	.name = "qhs_ecc_cfg",
-	.id = SDX55_SLAVE_ECC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_emac_cfg = {
 	.name = "qhs_emac_cfg",
-	.id = SDX55_SLAVE_EMAC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_imem_cfg = {
 	.name = "qhs_imem_cfg",
-	.id = SDX55_SLAVE_IMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ipa = {
 	.name = "qhs_ipa",
-	.id = SDX55_SLAVE_IPA_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_mss_cfg = {
 	.name = "qhs_mss_cfg",
-	.id = SDX55_SLAVE_CNOC_MSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_pcie_parf = {
 	.name = "qhs_pcie_parf",
-	.id = SDX55_SLAVE_PCIE_PARF,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_pdm = {
 	.name = "qhs_pdm",
-	.id = SDX55_SLAVE_PDM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_prng = {
 	.name = "qhs_prng",
-	.id = SDX55_SLAVE_PRNG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qdss_cfg = {
 	.name = "qhs_qdss_cfg",
-	.id = SDX55_SLAVE_QDSS_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qpic = {
 	.name = "qhs_qpic",
-	.id = SDX55_SLAVE_QPIC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_sdc1 = {
 	.name = "qhs_sdc1",
-	.id = SDX55_SLAVE_SDCC_1,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_snoc_cfg = {
 	.name = "qhs_snoc_cfg",
-	.id = SDX55_SLAVE_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SDX55_MASTER_SNOC_CFG },
+	.link_nodes = { &qhm_snoc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_spmi_fetcher = {
 	.name = "qhs_spmi_fetcher",
-	.id = SDX55_SLAVE_SPMI_FETCHER,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_spmi_vgi_coex = {
 	.name = "qhs_spmi_vgi_coex",
-	.id = SDX55_SLAVE_SPMI_VGI_COEX,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_tcsr = {
 	.name = "qhs_tcsr",
-	.id = SDX55_SLAVE_TCSR,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_tlmm = {
 	.name = "qhs_tlmm",
-	.id = SDX55_SLAVE_TLMM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_usb3 = {
 	.name = "qhs_usb3",
-	.id = SDX55_SLAVE_USB3,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_usb3_phy = {
 	.name = "qhs_usb3_phy",
-	.id = SDX55_SLAVE_USB3_PHY_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_aggre_noc = {
 	.name = "qns_aggre_noc",
-	.id = SDX55_SLAVE_ANOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_MASTER_ANOC_SNOC },
+	.link_nodes = { &qnm_aggre_noc, NULL },
 };
 
 static struct qcom_icc_node qns_snoc_memnoc = {
 	.name = "qns_snoc_memnoc",
-	.id = SDX55_SLAVE_SNOC_MEM_NOC_GC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SDX55_MASTER_SNOC_GC_MEM_NOC },
+	.link_nodes = { &qnm_snoc_gc, NULL },
 };
 
 static struct qcom_icc_node qxs_imem = {
 	.name = "qxs_imem",
-	.id = SDX55_SLAVE_OCIMEM,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node srvc_snoc = {
 	.name = "srvc_snoc",
-	.id = SDX55_SLAVE_SERVICE_SNOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node xs_pcie = {
 	.name = "xs_pcie",
-	.id = SDX55_SLAVE_PCIE_0,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node xs_qdss_stm = {
 	.name = "xs_qdss_stm",
-	.id = SDX55_SLAVE_QDSS_STM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node xs_sys_tcu_cfg = {
 	.name = "xs_sys_tcu_cfg",
-	.id = SDX55_SLAVE_TCU,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_bcm bcm_mc0 = {
@@ -773,6 +766,7 @@ static struct qcom_icc_node * const mc_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx55_mc_virt = {
+	.alloc_dyn_id = true,
 	.nodes = mc_virt_nodes,
 	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
 	.bcms = mc_virt_bcms,
@@ -795,6 +789,7 @@ static struct qcom_icc_node * const mem_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx55_mem_noc = {
+	.alloc_dyn_id = true,
 	.nodes = mem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mem_noc_nodes),
 	.bcms = mem_noc_bcms,
@@ -874,6 +869,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx55_system_noc = {
+	.alloc_dyn_id = true,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
diff --git a/drivers/interconnect/qcom/sdx55.h b/drivers/interconnect/qcom/sdx55.h
deleted file mode 100644
index 46cbabec8aa1f95be840e50618efd04bcbf89f10..0000000000000000000000000000000000000000
--- a/drivers/interconnect/qcom/sdx55.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2021, Linaro Ltd.
- */
-
-#ifndef __DRIVERS_INTERCONNECT_QCOM_SDX55_H
-#define __DRIVERS_INTERCONNECT_QCOM_SDX55_H
-
-/* 0 was used by MASTER_IPA_CORE, now represented as RPMh clock */
-#define SDX55_MASTER_LLCC			1
-#define SDX55_MASTER_TCU_0			2
-#define SDX55_MASTER_SNOC_GC_MEM_NOC		3
-#define SDX55_MASTER_AMPSS_M0			4
-#define SDX55_MASTER_AUDIO			5
-#define SDX55_MASTER_BLSP_1			6
-#define SDX55_MASTER_QDSS_BAM			7
-#define SDX55_MASTER_QPIC			8
-#define SDX55_MASTER_SNOC_CFG			9
-#define SDX55_MASTER_SPMI_FETCHER		10
-#define SDX55_MASTER_ANOC_SNOC			11
-#define SDX55_MASTER_IPA			12
-#define SDX55_MASTER_MEM_NOC_SNOC		13
-#define SDX55_MASTER_MEM_NOC_PCIE_SNOC		14
-#define SDX55_MASTER_CRYPTO_CORE_0		15
-#define SDX55_MASTER_EMAC			16
-#define SDX55_MASTER_IPA_PCIE			17
-#define SDX55_MASTER_PCIE			18
-#define SDX55_MASTER_QDSS_ETR			19
-#define SDX55_MASTER_SDCC_1			20
-#define SDX55_MASTER_USB3			21
-/* 22 was used by SLAVE_IPA_CORE, now represented as RPMh clock */
-#define SDX55_SLAVE_EBI_CH0			23
-#define SDX55_SLAVE_LLCC			24
-#define SDX55_SLAVE_MEM_NOC_SNOC		25
-#define SDX55_SLAVE_MEM_NOC_PCIE_SNOC		26
-#define SDX55_SLAVE_ANOC_SNOC			27
-#define SDX55_SLAVE_SNOC_CFG			28
-#define SDX55_SLAVE_EMAC_CFG			29
-#define SDX55_SLAVE_USB3			30
-#define SDX55_SLAVE_TLMM			31
-#define SDX55_SLAVE_SPMI_FETCHER		32
-#define SDX55_SLAVE_QDSS_CFG			33
-#define SDX55_SLAVE_PDM				34
-#define SDX55_SLAVE_SNOC_MEM_NOC_GC		35
-#define SDX55_SLAVE_TCSR			36
-#define SDX55_SLAVE_CNOC_DDRSS			37
-#define SDX55_SLAVE_SPMI_VGI_COEX		38
-#define SDX55_SLAVE_QPIC			39
-#define SDX55_SLAVE_OCIMEM			40
-#define SDX55_SLAVE_IPA_CFG			41
-#define SDX55_SLAVE_USB3_PHY_CFG		42
-#define SDX55_SLAVE_AOP				43
-#define SDX55_SLAVE_BLSP_1			44
-#define SDX55_SLAVE_SDCC_1			45
-#define SDX55_SLAVE_CNOC_MSS			46
-#define SDX55_SLAVE_PCIE_PARF			47
-#define SDX55_SLAVE_ECC_CFG			48
-#define SDX55_SLAVE_AUDIO			49
-#define SDX55_SLAVE_AOSS			51
-#define SDX55_SLAVE_PRNG			52
-#define SDX55_SLAVE_CRYPTO_0_CFG		53
-#define SDX55_SLAVE_TCU				54
-#define SDX55_SLAVE_CLK_CTL			55
-#define SDX55_SLAVE_IMEM_CFG			56
-#define SDX55_SLAVE_SERVICE_SNOC		57
-#define SDX55_SLAVE_PCIE_0			58
-#define SDX55_SLAVE_QDSS_STM			59
-#define SDX55_SLAVE_APPSS			60
-
-#endif

-- 
2.39.5


