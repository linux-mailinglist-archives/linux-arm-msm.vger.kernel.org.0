Return-Path: <linux-arm-msm+bounces-21536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F798FA6CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4057BB21AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982DE384;
	Tue,  4 Jun 2024 00:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pbe+NSv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CAB182;
	Tue,  4 Jun 2024 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459790; cv=none; b=J2T//Ln7bxFvLuVnIfFlUz8bcbS5m8OHAiCEVSQYrHK7GQxA1MBANpIq6q/GO0bt7QsvK3nKN+reyfir17hndyNqiV2zqv0Man9SkktqK77M1Qa9QuQq+OLn6GYLLlg6acn78i/gXJvq4/HLRodRHaz/5MMKqreB/DMEzVex8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459790; c=relaxed/simple;
	bh=NcDKgQC4TD2N3BVDEvr2y4IQ2kPTEw5hZOW6NlNOqto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jifopg8tNnHOzI2FAyrLC5YhnlS3zgCkqLDoMVxdwCX38RQeXxFFakwqXeWcrqJ7tpdrzUpXHe2ek4IZpDKBBUzkSi/kkvGkV8it0Y9iPMGGXCDozPLz79X4bxlsF3cMWPVCoHB5/wKsmxPJJvVPedjKDLY8z4OX+GmOsN8n4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pbe+NSv1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453BZ5jp016164;
	Tue, 4 Jun 2024 00:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o+7iz7ZULoHi3lnCC1MvbJ
	RlX5b72gXbJF96V5x6KQs=; b=Pbe+NSv1qaqwZuXWmn3SIvu8O5qMZGXKywIT8d
	jIOt5eZZ+rhco1yhAjucu6IsI4Z+c9G9oqp7jgmpNNKIlMN2zfPGhKtYElBwoD3p
	jZNnJEYJmBYaWDCwIeRNmAXbNyhduP5JzZtv4SfrpuOQxOpJxZVhTBnIwrOLBq3p
	lr9TcGcIupnecv1j5OCEvSqJYu+vBwsuJFHCt/hr5XxheTD7WpXuki7AFBrf9jxq
	6EcC+sA/o6/iaIV7LCZRbMWF/ResPdP3QyKDEAzQ5t7e6hmsC34G/V94KhacGqCO
	sgpjqnwZKrTX7MMsu8FbtuofbGueME83/pAo1JYz+FPdWfPw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wn9gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 00:09:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45409cER010514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 00:09:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 17:09:35 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 3 Jun 2024 17:09:34 -0700
Subject: [PATCH] soc: qcom: spm: add missing MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD1bXmYC/3WNyw6CMBBFf4V07Zi2PAyu/A/DokyrTGILdIBgC
 P9uYe/yJPfcswl2kRyLe7aJ6BZi6kMCdckEdia8HZBNLLTUhSxzCd4C9wgj9h548FBpbXNENLW
 0IllDdC9az8dnk7g17KCNJmB3/HwozCt4w5OLx7wjnvr4PfuLOqT/qUWBglbdFOZVXRYKH+NMS
 AGvaSGafd9/TYfl9M8AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <kernel@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ODR97Pr8QzTwAn_do-RiYxRuBvHfzSkB
X-Proofpoint-ORIG-GUID: ODR97Pr8QzTwAn_do-RiYxRuBvHfzSkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030195

make allmodconfig && make W=1 C=1 warns:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o

Add the missing MODULE_DESCRIPTION(), using the same description as
the underlying QCOM_SPM Kconfig item.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/soc/qcom/spm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 06e2c4c2a4a8..f75659fff287 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -572,4 +572,5 @@ static int __init qcom_spm_init(void)
 }
 arch_initcall(qcom_spm_init);
 
+MODULE_DESCRIPTION("Qualcomm Subsystem Power Manager (SPM)");
 MODULE_LICENSE("GPL v2");

---
base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
change-id: 20240530-md-soc-qcom-spm-622d3ccca90d


