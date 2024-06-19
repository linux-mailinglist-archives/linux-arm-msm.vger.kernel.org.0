Return-Path: <linux-arm-msm+bounces-23235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90990F2C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 17:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080F51F2708B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E37E1514D4;
	Wed, 19 Jun 2024 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a3LsaCld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C903E1514FF;
	Wed, 19 Jun 2024 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811738; cv=none; b=gnLbrN/Qhm4qe0sugArOXTv34e37g6kQT9DxJQnaQdzugqwzb1sPCNDv2fofQlI6H3ZKN7cmgpBQLuTGcgeevF0+tHg0hrv1NatxD6vWfuBgrmiHyWH6AE/1G1to1r4nj0vYSxyQ8m1LPXfKYXQZ+O4l8lbP8Q4BIUo2wu5uzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811738; c=relaxed/simple;
	bh=mDeqP/sKc/AiS+vkB59fy7TDZDcUAoDaRDc/g//Qu2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kZopSXiPdBmDF9O0NBsTDMrxNq4Yz85tMSpH1oKoHgmDPyKvpavKMUZQZhZ32Jzy2olylS0JwFSFzDQ4J589o6rFKdIJHMURQnDa3+52GF6o8UvpauEsQwJGR5EBl8PDTDL5Q/A6AzZMfDTba01cNqj6ipcHi9ClMZ7X4eh+j1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a3LsaCld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JAJdI5024352;
	Wed, 19 Jun 2024 15:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rjGkieKHjJuNG2DdUFCsCx
	8s1Dw+liQJJNIIPKCrxDo=; b=a3LsaCldDf92WKhJyq2CL7nw6veAsDzoYILz4s
	CR5DsDlUZB7EO5O/rMMrrzKLB//KEv+HlcSfYNVnrvskY7C65fQ6Qeh1rbYw4vkf
	/bQ8zD0rgJdeUuLQwLK9yJGj+vH4MKkLkGQOC7LfbpVFBhby1gNaWcAHuifVGShb
	y1ogxqgye6mOiLsJm8EAJwk0G6CabvsHxll4lok3hF2bYdRq1emdFvmmCSemp7xp
	7MSf5NYOofPImB+ZQxi65LcyKDOEitsb5vwSg8arnTcIclfbYM5tLCqA0xiJy2SJ
	OXeDDB1Zf4LTLdLOB93odgtLdmMd3CGwNccnMbqzqcMs8l9Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja7a42r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 15:42:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JFgChb019220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 15:42:12 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 08:42:11 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Wed, 19 Jun 2024 08:41:52 -0700
Subject: [PATCH] clk: qcom: Remove QCOM_RPMCC symbol
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240619-drop-qcom-rpmcc-v1-1-b487c95162ef@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD/8cmYC/x3MPQqAMAxA4atIZgNt/UG8ijiUNGoGbU1BBPHuF
 sdveO+BzCqcYaweUL4kSzwKbF0Bbf5YGSUUgzOuNb0dMGhMeFLcUdNOhG5pwtB58sZbKFVSXuT
 +j9P8vh9O8LueYQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x16CFweXn5yL5KOk21xmjuUJBUvB8CoI
X-Proofpoint-GUID: x16CFweXn5yL5KOk21xmjuUJBUvB8CoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=626 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190118

This symbol is selected by a couple drivers, but isn't used by anyone
and hasn't been for years now. Drop it.

No functional change intended.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f72838aa573b..67c9188d53cb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -7,9 +7,6 @@ config QCOM_GDSC
 	bool
 	select PM_GENERIC_DOMAINS if PM
 
-config QCOM_RPMCC
-	bool
-
 menuconfig COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
@@ -122,7 +119,6 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
-	select QCOM_RPMCC
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -135,7 +131,6 @@ config QCOM_CLK_RPM
 config QCOM_CLK_SMD_RPM
 	tristate "RPM over SMD based Clock Controller"
 	depends on QCOM_SMD_RPM
-	select QCOM_RPMCC
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power

---
base-commit: eefb5ee4b41cdb68bf6feffe0d68b5bbe038e29d
change-id: 20240618-drop-qcom-rpmcc-2f3d85aca0a1

Best regards,
-- 
Elliot Berman <quic_eberman@quicinc.com>


