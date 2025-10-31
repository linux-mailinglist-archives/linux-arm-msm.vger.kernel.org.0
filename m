Return-Path: <linux-arm-msm+bounces-79927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCDC25B54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52D11A62B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F72C234B;
	Fri, 31 Oct 2025 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N62ReDpe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcScskbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891FC280CE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921963; cv=none; b=UxH9AQIhqx0/vavDp8TZEhHoquFTVazoiGsIGcQZu1RHiy9Zcm8nzzPuF2hA7/8QHuDAA5Y+eiGU9j1QNGSfUipQHf7MgaAjaSHB/TVLro2Z3wzkfg8SJPmqlLxRX/i3NbwmFo4gImUT1nsaO+hRAGVMJ+0yy48QEpezmyMo3iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921963; c=relaxed/simple;
	bh=z0Im5FBBNFtrfaj7CDk/tsm6bicCeBlzFt8/a6LKRA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxXXgtwORW8GGpFFkckxSxqCkmGbzHAfxIgzhsTzaL1m6DIncMHPNXGPiiJ2xZVzGxku02ZJNlhxH7OsNy2tsfayqECF8fHAVDPvdOl8PEilJqFPLDV0969CRIu6nLFIp0BkyL5HkNN8CFcJ61PIObxor7pE39t0+WvN6QzAw+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N62ReDpe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcScskbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VCYuOT102826
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSTvtbxv5/WjzxnTfmBaP4ZNtPC/0sbhIu6IEPFQ8xY=; b=N62ReDpe1ZRWZ/77
	y8aKFxuJHx3+DjEEFFQEweWkpO67uqT2EgBIJ3BKQgQ9kEa4L3Y1dqIOsOouD9/o
	fibBjAAu1M27RJQfUs0ZOfbTIIKoJ7ihoJ6y0MUKdQzteP1Facj766Fgj9mfXXbd
	Ve/G9V/RQlra0Ld0UIe6fyk/Ss460qliQZ/QPDIrBoKVoZG/UI7VSRbYFsCJtIRq
	zYz7t1JwaK0cfJSjxl233oUiBnk5FmO85/CEfXlZtgqdNSErzvTDunjCDH3x7cxV
	JD7y2ZgKdjc2yklkRjxbME2QZE4fimbcUwaeKo3d2m5vILdDOVo88QwKtVK/JmsT
	QJ7EqA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdkg09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:45:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-932be1ee6ceso813249241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921953; x=1762526753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSTvtbxv5/WjzxnTfmBaP4ZNtPC/0sbhIu6IEPFQ8xY=;
        b=hcScskbXL50Xp4PUaeEc0fwpqBC/VT5mGO5GS5TkJLgy3E8wUL7K3eP3fi1BUo2FvX
         CvcQO8o7l5P8dWmoc1IO3Nu9dINFCknQeWRECUNCBKUNMTYJGFfpEK3wtE4nohDhcfwx
         CZFf8P6A2fQEzAMTX+6oArBEBEWfRsaRt3ZEm4zIPwypdC9SLQkUy8Q1iCmG3Oc7uwhW
         PILmdGpuuuQMe1vrCogy8oALhiWVKlis/9REhDcDsutCedqiJVqM+5f+T6Vq64OVM3uM
         Nr/2HRV0F85W//CCky1TUkRG/+yVF9z4AkdrgQ9dUmZTXm+0Q/lFEfUmSPvXEZ+GVDEo
         mPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921953; x=1762526753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSTvtbxv5/WjzxnTfmBaP4ZNtPC/0sbhIu6IEPFQ8xY=;
        b=LEnlg4FmOolWqUUTkEjwSzgDDalGr92uI+gkc9wmBoJ3KhugZwH5Sprf+Q1IJNmj4s
         7dTK7rA83RT0idJw2U8duvgvipq7I7AoJuCvKRHUAuz9moHVkCFa9541O65cVfBLdrCg
         Fjh2QLpZJobln7yzPpnTwRVHIB301ZI6kqONdWrS5jGB+T2fmqSLxMSTaBFRSdxGnGIE
         aTVOyHoHF+wklGa8mIM9Q7zoitTtc2GZmRXad4V4u3HeuUv7hjIcKkBztSVFUdCLd879
         o8RHNYJwalGQ4ieZex3RB52A99+/ZBqDfG/yaetb0j4l7TeRAMRFiIVl1j+KDYQGUOtU
         a4ug==
X-Gm-Message-State: AOJu0YxX1MZylZ1YSiDgJKwWVyEpKg78fesBKjlKeuCi0SkOdPK+vzXX
	s/UCd6oZds7sdSDE1XflbrWPzp5Y20t+FubcZ4Q/82HKc1L3bL5K400HVjjZ7fAqFcJslPp/xuT
	pjUzW27GYmi6WPwsajN7QwzyZOqupXyw/RhPxqk252NS2YO56BcniWCtRWiBe2AscfYfDJ0Xfbx
	yS
X-Gm-Gg: ASbGnctwDUBAERG/NLKjM42VcEUbCE3TBaelLn6oMAFOULTT+u34/QdbajRFofOtwX0
	DolZtcZHaFAt61LNsO7/t+nvRCxf+mY7z7PBiTgUYzvtQVLWhN6cwTwbkzyKghOnEck1NfEozz8
	/Io+v7JmkCLIDgMPhukmvb4fOYakmlyWQ+yyYv0eXXiCdSyR1LZAop4BbkKA/3kWqL/+aswczTy
	nl9kLF9kau+Seaa1sqnLXEYTQeRta3fZQ0jbAh7QMrRuEc71J+F3WnDLwkbMy+ATFzSngBWsMxQ
	zHO0+NVVQ5LubfyMHLYdVF78PXssxvwrxuC+XBhx9nD3yv2kUE5sWKbVrE/2TfqDlhqf4Bnn1SZ
	JciDBFAjZdlecZhEs9kbI5rOjtnAgKtI8NXfMey/lXlLNgi9bogsJwyFSaKKNGG43YawnCZeDWJ
	QO7U2W4rWEJjkf
X-Received: by 2002:a05:6102:3711:b0:5db:25b5:9b52 with SMTP id ada2fe7eead31-5dbb12e18cbmr1290476137.20.1761921953169;
        Fri, 31 Oct 2025 07:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvDqYLU4BHrLD00fvG4QRl3QeJ5sXjGSN6j9P//NPO6d2/kg8jEqc01BiD9LsyyBcB5HGufg==
X-Received: by 2002:a05:6102:3711:b0:5db:25b5:9b52 with SMTP id ada2fe7eead31-5dbb12e18cbmr1290429137.20.1761921952601;
        Fri, 31 Oct 2025 07:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc218sm541405e87.93.2025.10.31.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:45:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:45:31 +0200
Subject: [PATCH v3 15/25] interconnect: qcom: sdx65: convert to dynamic IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-rework-icc-v3-15-0575304c9624@oss.qualcomm.com>
References: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
In-Reply-To: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23508;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z0Im5FBBNFtrfaj7CDk/tsm6bicCeBlzFt8/a6LKRA4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpBMuFNlF5Ua++jFqXpL3wsPLjf1HOB4adABeRf
 0jatiqwekGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQTLhQAKCRCLPIo+Aiko
 1Re8B/wKVZ23h6WRm0XFkTzrmeU/BLGsG1zn8QuNJX3VGSfI2bum1suaiT2Zo5boqhCLVAnSptT
 M1R0pJeG/nIy5KXYBoaOyAeduZX4hjrOA3X6KlNIpWNjXUQwdr4hwpWY/nnCXVj0knO9rXFvtgm
 IJ+zJwgbOk3gMLjvO51t5Kqhpm2GXJMX8xsO8tZBJWFnXI1PP8XmsyUhfsmdAKiJomNmq27x4ti
 jICErbamfGV48xjaMeetD8qDkh1ZanfDTLETqsN8icRDVI1FzzosYt8M7GhNQQkpVC1c4cCYKe8
 dFziSosCibgExm5aE4DeBoNSotXh1GsLp3ywjTVFtJK1a8fW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfX3Pzc6vAuV9je
 Y/mywUjByBQ4i3Xp0X9Se6GwkQfiOgl2VDO0P5fcM4J04q7X3PNSH2CsqY0C/XKjjKy1J4TAShA
 EbuGDqIdA/weZ4L2hBpvzxnWA/TJL1eu9sAN3OHJJNHqBvTQw2J8Hf3LpAZFnM5LaYuhAF8tDvX
 GZtqCpJOUZ6hZhMqU6xc9ryC3+Udb+wNICnBPV0lGwz1BHLypuNwfwzln6ZGKOH6qPk6JbOEXJ0
 WfvlZKPw78sA0o0aeZxNuRqZOQJNncYOYlRX6HFvULZ+H7HGWIG8Boc4D4uh9xzg9cuYAQnJvux
 Kpk/fQyGvPk28PNUrp1GdekV1lvgWR8q4qJWxvoJjyU250tmgSSMWOlmKsCD5EroHLZCNp7HEBw
 3S/bF6U7ReSP2MHiN003/NX9OKZI1g==
X-Proofpoint-GUID: 5yw-ITjs9REFABLBXBnfw5qKufEjGq9k
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904cba2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6SwnLQanp_DmqS38I4wA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 5yw-ITjs9REFABLBXBnfw5qKufEjGq9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310133

Stop using fixed and IDs and covert the platform to use dynamic IDs for
the interconnect. This gives more flexibility and also allows us to drop
the .num_links member, saving from possible errors related to it being
not set or set incorrectly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sdx65.c | 460 +++++++++++++++++++-------------------
 drivers/interconnect/qcom/sdx65.h |  65 ------
 2 files changed, 226 insertions(+), 299 deletions(-)

diff --git a/drivers/interconnect/qcom/sdx65.c b/drivers/interconnect/qcom/sdx65.c
index d3a6c6c148e5dedc95dbac3ad9b20538ce56a16d..7c8798174e026c9d1fa06b60a75bf15e01a34049 100644
--- a/drivers/interconnect/qcom/sdx65.c
+++ b/drivers/interconnect/qcom/sdx65.c
@@ -13,593 +13,582 @@
 
 #include "bcm-voter.h"
 #include "icc-rpmh.h"
-#include "sdx65.h"
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
+static struct qcom_icc_node xm_ipa2pcie_slv;
+static struct qcom_icc_node xm_pcie;
+static struct qcom_icc_node xm_qdss_etr;
+static struct qcom_icc_node xm_sdc1;
+static struct qcom_icc_node xm_usb3;
+static struct qcom_icc_node ebi;
+static struct qcom_icc_node qns_llcc;
+static struct qcom_icc_node qns_memnoc_snoc;
+static struct qcom_icc_node qns_sys_pcie;
+static struct qcom_icc_node qhs_aoss;
+static struct qcom_icc_node qhs_apss;
+static struct qcom_icc_node qhs_audio;
+static struct qcom_icc_node qhs_blsp1;
+static struct qcom_icc_node qhs_clk_ctl;
+static struct qcom_icc_node qhs_crypto0_cfg;
+static struct qcom_icc_node qhs_ddrss_cfg;
+static struct qcom_icc_node qhs_ecc_cfg;
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
-	.id = SDX65_MASTER_LLCC,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_EBI1 },
+	.link_nodes = { &ebi },
 };
 
 static struct qcom_icc_node acm_tcu = {
 	.name = "acm_tcu",
-	.id = SDX65_MASTER_TCU_0,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 3,
-	.links = { SDX65_SLAVE_LLCC,
-		   SDX65_SLAVE_MEM_NOC_SNOC,
-		   SDX65_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_memnoc_snoc,
+			&qns_sys_pcie },
 };
 
 static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
-	.id = SDX65_MASTER_SNOC_GC_MEM_NOC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_LLCC },
+	.link_nodes = { &qns_llcc },
 };
 
 static struct qcom_icc_node xm_apps_rdwr = {
 	.name = "xm_apps_rdwr",
-	.id = SDX65_MASTER_APPSS_PROC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 3,
-	.links = { SDX65_SLAVE_LLCC,
-		   SDX65_SLAVE_MEM_NOC_SNOC,
-		   SDX65_SLAVE_MEM_NOC_PCIE_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_memnoc_snoc,
+			&qns_sys_pcie },
 };
 
 static struct qcom_icc_node qhm_audio = {
 	.name = "qhm_audio",
-	.id = SDX65_MASTER_AUDIO,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc },
 };
 
 static struct qcom_icc_node qhm_blsp1 = {
 	.name = "qhm_blsp1",
-	.id = SDX65_MASTER_BLSP_1,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc },
 };
 
 static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
-	.id = SDX65_MASTER_QDSS_BAM,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 26,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_BLSP_1,
-		   SDX65_SLAVE_CLK_CTL,
-		   SDX65_SLAVE_CRYPTO_0_CFG,
-		   SDX65_SLAVE_CNOC_DDRSS,
-		   SDX65_SLAVE_ECC_CFG,
-		   SDX65_SLAVE_IMEM_CFG,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_CNOC_MSS,
-		   SDX65_SLAVE_PCIE_PARF,
-		   SDX65_SLAVE_PDM,
-		   SDX65_SLAVE_PRNG,
-		   SDX65_SLAVE_QDSS_CFG,
-		   SDX65_SLAVE_QPIC,
-		   SDX65_SLAVE_SDCC_1,
-		   SDX65_SLAVE_SNOC_CFG,
-		   SDX65_SLAVE_SPMI_FETCHER,
-		   SDX65_SLAVE_SPMI_VGI_COEX,
-		   SDX65_SLAVE_TCSR,
-		   SDX65_SLAVE_TLMM,
-		   SDX65_SLAVE_USB3,
-		   SDX65_SLAVE_USB3_PHY_CFG,
-		   SDX65_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX65_SLAVE_IMEM,
-		   SDX65_SLAVE_TCU
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_audio,
+			&qhs_blsp1,
+			&qhs_clk_ctl,
+			&qhs_crypto0_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_ecc_cfg,
+			&qhs_imem_cfg,
+			&qhs_ipa,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_pdm,
+			&qhs_prng,
+			&qhs_qdss_cfg,
+			&qhs_qpic,
+			&qhs_sdc1,
+			&qhs_snoc_cfg,
+			&qhs_spmi_fetcher,
+			&qhs_spmi_vgi_coex,
+			&qhs_tcsr,
+			&qhs_tlmm,
+			&qhs_usb3,
+			&qhs_usb3_phy,
+			&qns_snoc_memnoc,
+			&qxs_imem,
+			&xs_sys_tcu_cfg },
 };
 
 static struct qcom_icc_node qhm_qpic = {
 	.name = "qhm_qpic",
-	.id = SDX65_MASTER_QPIC,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 4,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_ANOC_SNOC
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_audio,
+			&qhs_ipa,
+			&qns_aggre_noc },
 };
 
 static struct qcom_icc_node qhm_snoc_cfg = {
 	.name = "qhm_snoc_cfg",
-	.id = SDX65_MASTER_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_SERVICE_SNOC },
+	.link_nodes = { &srvc_snoc },
 };
 
 static struct qcom_icc_node qhm_spmi_fetcher1 = {
 	.name = "qhm_spmi_fetcher1",
-	.id = SDX65_MASTER_SPMI_FETCHER,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 2,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_ANOC_SNOC
-	},
+	.link_nodes = { &qhs_aoss,
+			&qns_aggre_noc },
 };
 
 static struct qcom_icc_node qnm_aggre_noc = {
 	.name = "qnm_aggre_noc",
-	.id = SDX65_MASTER_ANOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 29,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_APPSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_BLSP_1,
-		   SDX65_SLAVE_CLK_CTL,
-		   SDX65_SLAVE_CRYPTO_0_CFG,
-		   SDX65_SLAVE_CNOC_DDRSS,
-		   SDX65_SLAVE_ECC_CFG,
-		   SDX65_SLAVE_IMEM_CFG,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_CNOC_MSS,
-		   SDX65_SLAVE_PCIE_PARF,
-		   SDX65_SLAVE_PDM,
-		   SDX65_SLAVE_PRNG,
-		   SDX65_SLAVE_QDSS_CFG,
-		   SDX65_SLAVE_QPIC,
-		   SDX65_SLAVE_SDCC_1,
-		   SDX65_SLAVE_SNOC_CFG,
-		   SDX65_SLAVE_SPMI_FETCHER,
-		   SDX65_SLAVE_SPMI_VGI_COEX,
-		   SDX65_SLAVE_TCSR,
-		   SDX65_SLAVE_TLMM,
-		   SDX65_SLAVE_USB3,
-		   SDX65_SLAVE_USB3_PHY_CFG,
-		   SDX65_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX65_SLAVE_IMEM,
-		   SDX65_SLAVE_PCIE_0,
-		   SDX65_SLAVE_QDSS_STM,
-		   SDX65_SLAVE_TCU
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_apss,
+			&qhs_audio,
+			&qhs_blsp1,
+			&qhs_clk_ctl,
+			&qhs_crypto0_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_ecc_cfg,
+			&qhs_imem_cfg,
+			&qhs_ipa,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_pdm,
+			&qhs_prng,
+			&qhs_qdss_cfg,
+			&qhs_qpic,
+			&qhs_sdc1,
+			&qhs_snoc_cfg,
+			&qhs_spmi_fetcher,
+			&qhs_spmi_vgi_coex,
+			&qhs_tcsr,
+			&qhs_tlmm,
+			&qhs_usb3,
+			&qhs_usb3_phy,
+			&qns_snoc_memnoc,
+			&qxs_imem,
+			&xs_pcie,
+			&xs_qdss_stm,
+			&xs_sys_tcu_cfg },
 };
 
 static struct qcom_icc_node qnm_ipa = {
 	.name = "qnm_ipa",
-	.id = SDX65_MASTER_IPA,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 26,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_BLSP_1,
-		   SDX65_SLAVE_CLK_CTL,
-		   SDX65_SLAVE_CRYPTO_0_CFG,
-		   SDX65_SLAVE_CNOC_DDRSS,
-		   SDX65_SLAVE_ECC_CFG,
-		   SDX65_SLAVE_IMEM_CFG,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_CNOC_MSS,
-		   SDX65_SLAVE_PCIE_PARF,
-		   SDX65_SLAVE_PDM,
-		   SDX65_SLAVE_PRNG,
-		   SDX65_SLAVE_QDSS_CFG,
-		   SDX65_SLAVE_QPIC,
-		   SDX65_SLAVE_SDCC_1,
-		   SDX65_SLAVE_SNOC_CFG,
-		   SDX65_SLAVE_SPMI_FETCHER,
-		   SDX65_SLAVE_TCSR,
-		   SDX65_SLAVE_TLMM,
-		   SDX65_SLAVE_USB3,
-		   SDX65_SLAVE_USB3_PHY_CFG,
-		   SDX65_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX65_SLAVE_IMEM,
-		   SDX65_SLAVE_PCIE_0,
-		   SDX65_SLAVE_QDSS_STM
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_audio,
+			&qhs_blsp1,
+			&qhs_clk_ctl,
+			&qhs_crypto0_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_ecc_cfg,
+			&qhs_imem_cfg,
+			&qhs_ipa,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_pdm,
+			&qhs_prng,
+			&qhs_qdss_cfg,
+			&qhs_qpic,
+			&qhs_sdc1,
+			&qhs_snoc_cfg,
+			&qhs_spmi_fetcher,
+			&qhs_tcsr,
+			&qhs_tlmm,
+			&qhs_usb3,
+			&qhs_usb3_phy,
+			&qns_snoc_memnoc,
+			&qxs_imem,
+			&xs_pcie,
+			&xs_qdss_stm },
 };
 
 static struct qcom_icc_node qnm_memnoc = {
 	.name = "qnm_memnoc",
-	.id = SDX65_MASTER_MEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 27,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_APPSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_BLSP_1,
-		   SDX65_SLAVE_CLK_CTL,
-		   SDX65_SLAVE_CRYPTO_0_CFG,
-		   SDX65_SLAVE_CNOC_DDRSS,
-		   SDX65_SLAVE_ECC_CFG,
-		   SDX65_SLAVE_IMEM_CFG,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_CNOC_MSS,
-		   SDX65_SLAVE_PCIE_PARF,
-		   SDX65_SLAVE_PDM,
-		   SDX65_SLAVE_PRNG,
-		   SDX65_SLAVE_QDSS_CFG,
-		   SDX65_SLAVE_QPIC,
-		   SDX65_SLAVE_SDCC_1,
-		   SDX65_SLAVE_SNOC_CFG,
-		   SDX65_SLAVE_SPMI_FETCHER,
-		   SDX65_SLAVE_SPMI_VGI_COEX,
-		   SDX65_SLAVE_TCSR,
-		   SDX65_SLAVE_TLMM,
-		   SDX65_SLAVE_USB3,
-		   SDX65_SLAVE_USB3_PHY_CFG,
-		   SDX65_SLAVE_IMEM,
-		   SDX65_SLAVE_QDSS_STM,
-		   SDX65_SLAVE_TCU
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_apss,
+			&qhs_audio,
+			&qhs_blsp1,
+			&qhs_clk_ctl,
+			&qhs_crypto0_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_ecc_cfg,
+			&qhs_imem_cfg,
+			&qhs_ipa,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_pdm,
+			&qhs_prng,
+			&qhs_qdss_cfg,
+			&qhs_qpic,
+			&qhs_sdc1,
+			&qhs_snoc_cfg,
+			&qhs_spmi_fetcher,
+			&qhs_spmi_vgi_coex,
+			&qhs_tcsr,
+			&qhs_tlmm,
+			&qhs_usb3,
+			&qhs_usb3_phy,
+			&qxs_imem,
+			&xs_qdss_stm,
+			&xs_sys_tcu_cfg },
 };
 
 static struct qcom_icc_node qnm_memnoc_pcie = {
 	.name = "qnm_memnoc_pcie",
-	.id = SDX65_MASTER_MEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_PCIE_0 },
+	.link_nodes = { &xs_pcie },
 };
 
 static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
-	.id = SDX65_MASTER_CRYPTO,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 2,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_ANOC_SNOC
-	},
+	.link_nodes = { &qhs_aoss,
+			&qns_aggre_noc },
 };
 
 static struct qcom_icc_node xm_ipa2pcie_slv = {
 	.name = "xm_ipa2pcie_slv",
-	.id = SDX65_MASTER_IPA_PCIE,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_PCIE_0 },
+	.link_nodes = { &xs_pcie },
 };
 
 static struct qcom_icc_node xm_pcie = {
 	.name = "xm_pcie",
-	.id = SDX65_MASTER_PCIE_0,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc },
 };
 
 static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
-	.id = SDX65_MASTER_QDSS_ETR,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 26,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_BLSP_1,
-		   SDX65_SLAVE_CLK_CTL,
-		   SDX65_SLAVE_CRYPTO_0_CFG,
-		   SDX65_SLAVE_CNOC_DDRSS,
-		   SDX65_SLAVE_ECC_CFG,
-		   SDX65_SLAVE_IMEM_CFG,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_CNOC_MSS,
-		   SDX65_SLAVE_PCIE_PARF,
-		   SDX65_SLAVE_PDM,
-		   SDX65_SLAVE_PRNG,
-		   SDX65_SLAVE_QDSS_CFG,
-		   SDX65_SLAVE_QPIC,
-		   SDX65_SLAVE_SDCC_1,
-		   SDX65_SLAVE_SNOC_CFG,
-		   SDX65_SLAVE_SPMI_FETCHER,
-		   SDX65_SLAVE_SPMI_VGI_COEX,
-		   SDX65_SLAVE_TCSR,
-		   SDX65_SLAVE_TLMM,
-		   SDX65_SLAVE_USB3,
-		   SDX65_SLAVE_USB3_PHY_CFG,
-		   SDX65_SLAVE_SNOC_MEM_NOC_GC,
-		   SDX65_SLAVE_IMEM,
-		   SDX65_SLAVE_TCU
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_audio,
+			&qhs_blsp1,
+			&qhs_clk_ctl,
+			&qhs_crypto0_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_ecc_cfg,
+			&qhs_imem_cfg,
+			&qhs_ipa,
+			&qhs_mss_cfg,
+			&qhs_pcie_parf,
+			&qhs_pdm,
+			&qhs_prng,
+			&qhs_qdss_cfg,
+			&qhs_qpic,
+			&qhs_sdc1,
+			&qhs_snoc_cfg,
+			&qhs_spmi_fetcher,
+			&qhs_spmi_vgi_coex,
+			&qhs_tcsr,
+			&qhs_tlmm,
+			&qhs_usb3,
+			&qhs_usb3_phy,
+			&qns_snoc_memnoc,
+			&qxs_imem,
+			&xs_sys_tcu_cfg },
 };
 
 static struct qcom_icc_node xm_sdc1 = {
 	.name = "xm_sdc1",
-	.id = SDX65_MASTER_SDCC_1,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 4,
-	.links = { SDX65_SLAVE_AOSS,
-		   SDX65_SLAVE_AUDIO,
-		   SDX65_SLAVE_IPA_CFG,
-		   SDX65_SLAVE_ANOC_SNOC
-	},
+	.link_nodes = { &qhs_aoss,
+			&qhs_audio,
+			&qhs_ipa,
+			&qns_aggre_noc },
 };
 
 static struct qcom_icc_node xm_usb3 = {
 	.name = "xm_usb3",
-	.id = SDX65_MASTER_USB3,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_SLAVE_ANOC_SNOC },
+	.link_nodes = { &qns_aggre_noc },
 };
 
 static struct qcom_icc_node ebi = {
 	.name = "ebi",
-	.id = SDX65_SLAVE_EBI1,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qns_llcc = {
 	.name = "qns_llcc",
-	.id = SDX65_SLAVE_LLCC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { SDX65_MASTER_LLCC },
+	.link_nodes = { &llcc_mc },
 };
 
 static struct qcom_icc_node qns_memnoc_snoc = {
 	.name = "qns_memnoc_snoc",
-	.id = SDX65_SLAVE_MEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_MASTER_MEM_NOC_SNOC },
+	.link_nodes = { &qnm_memnoc },
 };
 
 static struct qcom_icc_node qns_sys_pcie = {
 	.name = "qns_sys_pcie",
-	.id = SDX65_SLAVE_MEM_NOC_PCIE_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_MASTER_MEM_NOC_PCIE_SNOC },
+	.link_nodes = { &qnm_memnoc_pcie },
 };
 
 static struct qcom_icc_node qhs_aoss = {
 	.name = "qhs_aoss",
-	.id = SDX65_SLAVE_AOSS,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_apss = {
 	.name = "qhs_apss",
-	.id = SDX65_SLAVE_APPSS,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_audio = {
 	.name = "qhs_audio",
-	.id = SDX65_SLAVE_AUDIO,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_blsp1 = {
 	.name = "qhs_blsp1",
-	.id = SDX65_SLAVE_BLSP_1,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_clk_ctl = {
 	.name = "qhs_clk_ctl",
-	.id = SDX65_SLAVE_CLK_CTL,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_crypto0_cfg = {
 	.name = "qhs_crypto0_cfg",
-	.id = SDX65_SLAVE_CRYPTO_0_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_ddrss_cfg = {
 	.name = "qhs_ddrss_cfg",
-	.id = SDX65_SLAVE_CNOC_DDRSS,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_ecc_cfg = {
 	.name = "qhs_ecc_cfg",
-	.id = SDX65_SLAVE_ECC_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_imem_cfg = {
 	.name = "qhs_imem_cfg",
-	.id = SDX65_SLAVE_IMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_ipa = {
 	.name = "qhs_ipa",
-	.id = SDX65_SLAVE_IPA_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_mss_cfg = {
 	.name = "qhs_mss_cfg",
-	.id = SDX65_SLAVE_CNOC_MSS,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_pcie_parf = {
 	.name = "qhs_pcie_parf",
-	.id = SDX65_SLAVE_PCIE_PARF,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_pdm = {
 	.name = "qhs_pdm",
-	.id = SDX65_SLAVE_PDM,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_prng = {
 	.name = "qhs_prng",
-	.id = SDX65_SLAVE_PRNG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_qdss_cfg = {
 	.name = "qhs_qdss_cfg",
-	.id = SDX65_SLAVE_QDSS_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_qpic = {
 	.name = "qhs_qpic",
-	.id = SDX65_SLAVE_QPIC,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_sdc1 = {
 	.name = "qhs_sdc1",
-	.id = SDX65_SLAVE_SDCC_1,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_snoc_cfg = {
 	.name = "qhs_snoc_cfg",
-	.id = SDX65_SLAVE_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
 	.num_links = 1,
-	.links = { SDX65_MASTER_SNOC_CFG },
+	.link_nodes = { &qhm_snoc_cfg },
 };
 
 static struct qcom_icc_node qhs_spmi_fetcher = {
 	.name = "qhs_spmi_fetcher",
-	.id = SDX65_SLAVE_SPMI_FETCHER,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_spmi_vgi_coex = {
 	.name = "qhs_spmi_vgi_coex",
-	.id = SDX65_SLAVE_SPMI_VGI_COEX,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_tcsr = {
 	.name = "qhs_tcsr",
-	.id = SDX65_SLAVE_TCSR,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_tlmm = {
 	.name = "qhs_tlmm",
-	.id = SDX65_SLAVE_TLMM,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_usb3 = {
 	.name = "qhs_usb3",
-	.id = SDX65_SLAVE_USB3,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qhs_usb3_phy = {
 	.name = "qhs_usb3_phy",
-	.id = SDX65_SLAVE_USB3_PHY_CFG,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node qns_aggre_noc = {
 	.name = "qns_aggre_noc",
-	.id = SDX65_SLAVE_ANOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
 	.num_links = 1,
-	.links = { SDX65_MASTER_ANOC_SNOC },
+	.link_nodes = { &qnm_aggre_noc },
 };
 
 static struct qcom_icc_node qns_snoc_memnoc = {
 	.name = "qns_snoc_memnoc",
-	.id = SDX65_SLAVE_SNOC_MEM_NOC_GC,
 	.channels = 1,
 	.buswidth = 16,
 	.num_links = 1,
-	.links = { SDX65_MASTER_SNOC_GC_MEM_NOC },
+	.link_nodes = { &qnm_snoc_gc },
 };
 
 static struct qcom_icc_node qxs_imem = {
 	.name = "qxs_imem",
-	.id = SDX65_SLAVE_IMEM,
 	.channels = 1,
 	.buswidth = 8,
 };
 
 static struct qcom_icc_node srvc_snoc = {
 	.name = "srvc_snoc",
-	.id = SDX65_SLAVE_SERVICE_SNOC,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node xs_pcie = {
 	.name = "xs_pcie",
-	.id = SDX65_SLAVE_PCIE_0,
 	.channels = 1,
 	.buswidth = 8,
 };
 
 static struct qcom_icc_node xs_qdss_stm = {
 	.name = "xs_qdss_stm",
-	.id = SDX65_SLAVE_QDSS_STM,
 	.channels = 1,
 	.buswidth = 4,
 };
 
 static struct qcom_icc_node xs_sys_tcu_cfg = {
 	.name = "xs_sys_tcu_cfg",
-	.id = SDX65_SLAVE_TCU,
 	.channels = 1,
 	.buswidth = 8,
 };
@@ -780,6 +769,7 @@ static struct qcom_icc_node * const mc_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx65_mc_virt = {
+	.alloc_dyn_id = true,
 	.nodes = mc_virt_nodes,
 	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
 	.bcms = mc_virt_bcms,
@@ -802,6 +792,7 @@ static struct qcom_icc_node * const mem_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx65_mem_noc = {
+	.alloc_dyn_id = true,
 	.nodes = mem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mem_noc_nodes),
 	.bcms = mem_noc_bcms,
@@ -878,6 +869,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sdx65_system_noc = {
+	.alloc_dyn_id = true,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
diff --git a/drivers/interconnect/qcom/sdx65.h b/drivers/interconnect/qcom/sdx65.h
deleted file mode 100644
index 5dca6e8b32c99942e4a4f474999bc72ea2fb4fb6..0000000000000000000000000000000000000000
--- a/drivers/interconnect/qcom/sdx65.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#ifndef __DRIVERS_INTERCONNECT_QCOM_SDX65_H
-#define __DRIVERS_INTERCONNECT_QCOM_SDX65_H
-
-#define SDX65_MASTER_TCU_0		0
-#define SDX65_MASTER_LLCC		1
-#define SDX65_MASTER_AUDIO		2
-#define SDX65_MASTER_BLSP_1		3
-#define SDX65_MASTER_QDSS_BAM		4
-#define SDX65_MASTER_QPIC		5
-#define SDX65_MASTER_SNOC_CFG		6
-#define SDX65_MASTER_SPMI_FETCHER	7
-#define SDX65_MASTER_ANOC_SNOC		8
-#define SDX65_MASTER_IPA		9
-#define SDX65_MASTER_MEM_NOC_SNOC	10
-#define SDX65_MASTER_MEM_NOC_PCIE_SNOC	11
-#define SDX65_MASTER_SNOC_GC_MEM_NOC	12
-#define SDX65_MASTER_CRYPTO		13
-#define SDX65_MASTER_APPSS_PROC		14
-#define SDX65_MASTER_IPA_PCIE		15
-#define SDX65_MASTER_PCIE_0		16
-#define SDX65_MASTER_QDSS_ETR		17
-#define SDX65_MASTER_SDCC_1		18
-#define SDX65_MASTER_USB3		19
-#define SDX65_SLAVE_EBI1		512
-#define SDX65_SLAVE_AOSS		513
-#define SDX65_SLAVE_APPSS		514
-#define SDX65_SLAVE_AUDIO		515
-#define SDX65_SLAVE_BLSP_1		516
-#define SDX65_SLAVE_CLK_CTL		517
-#define SDX65_SLAVE_CRYPTO_0_CFG	518
-#define SDX65_SLAVE_CNOC_DDRSS		519
-#define SDX65_SLAVE_ECC_CFG		520
-#define SDX65_SLAVE_IMEM_CFG		521
-#define SDX65_SLAVE_IPA_CFG		522
-#define SDX65_SLAVE_CNOC_MSS		523
-#define SDX65_SLAVE_PCIE_PARF		524
-#define SDX65_SLAVE_PDM			525
-#define SDX65_SLAVE_PRNG		526
-#define SDX65_SLAVE_QDSS_CFG		527
-#define SDX65_SLAVE_QPIC		528
-#define SDX65_SLAVE_SDCC_1		529
-#define SDX65_SLAVE_SNOC_CFG		530
-#define SDX65_SLAVE_SPMI_FETCHER	531
-#define SDX65_SLAVE_SPMI_VGI_COEX	532
-#define SDX65_SLAVE_TCSR		533
-#define SDX65_SLAVE_TLMM		534
-#define SDX65_SLAVE_USB3		535
-#define SDX65_SLAVE_USB3_PHY_CFG	536
-#define SDX65_SLAVE_ANOC_SNOC		537
-#define SDX65_SLAVE_LLCC		538
-#define SDX65_SLAVE_MEM_NOC_SNOC	539
-#define SDX65_SLAVE_SNOC_MEM_NOC_GC	540
-#define SDX65_SLAVE_MEM_NOC_PCIE_SNOC	541
-#define SDX65_SLAVE_IMEM		542
-#define SDX65_SLAVE_SERVICE_SNOC	543
-#define SDX65_SLAVE_PCIE_0		544
-#define SDX65_SLAVE_QDSS_STM		545
-#define SDX65_SLAVE_TCU			546
-
-#endif

-- 
2.47.3


