Return-Path: <linux-arm-msm+bounces-48377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF4A39FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E1B3B603D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79F826AA96;
	Tue, 18 Feb 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EwBUuKzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC2526A0DA;
	Tue, 18 Feb 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888858; cv=none; b=p/GGzpSYOMbzGDoLMm1uaf2LmdGRtAor7p/Dqz1eIf+azz1NtZx+HOQCdOc22WzAmNY4cSChgemWOPtQRQBjs2RnwxY/TJa0C2VQahkWm/vyAsApmV3naG0ri/QmZA6F8hmEoGuP3siDhzEi+2dZaET5uUhslVw7H5o6eniqO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888858; c=relaxed/simple;
	bh=PhB6OzwPDDrY1d9lL1JvH7rZoen6/sphN1KSoNVFKS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sojEZ+vYDqs18l/1VEqW3TsglYb+GMxpoYDI/NkgkS9eLU+tA+Pdl8Sq4OBlcy3Gjxhhl9WKbYoqHJWrTMi336FSeor3aI04H1ybuicjSohcOC9sBugHiA5o4+RAPhDGkp3qo7mvTKr+yrrbmLpmiU6ERo+vhaGSwtrKYJIMn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EwBUuKzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IAmPmX020884;
	Tue, 18 Feb 2025 14:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvW4R9RdiZDuhArRhb8iPnmp3Z7MWWkpYGzDzEtr/YA=; b=EwBUuKzi276BXZad
	fPeQMpYoR+8m0xdDT9iKLS4tHSxULwGeMfPeMneotcVQMxINIaAg+4Kxo3edjJI4
	FJLqCRN3OyAzW0PE4HEAsfbvHdWev3Yi0BH+UxFRCXZSExvYPhsmDeteUqiycdGj
	xRhfEFYG6/89lQKBzyaoZNcJH+DkmbNghw3pQflRznlchWT1IpIHIrRLfauLS/gv
	43Z1chvAYKl9Iif37YPksYjsMtkSKEYwsS+u4+QsUN4QItW4btKe/zM2qnBbCBDa
	8ZsGy/qCVFLNddI1UnRxqQNWREusgCqAmlk9KDtoT8RQCzCWlC0IwBUe7lU7g21R
	epmp5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sw53b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IERN0O024307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:23 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 06:27:18 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 18 Feb 2025 19:56:47 +0530
Subject: [PATCH 2/5] clk: qcom: common: Add support to attach multiple
 power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-videocc-pll-multi-pd-voting-v1-2-cfe6289ea29b@quicinc.com>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sZOxJA6fYnQb5lBszC5ag8aH77-x2TCK
X-Proofpoint-ORIG-GUID: sZOxJA6fYnQb5lBszC5ag8aH77-x2TCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=832 phishscore=0 spamscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180109

From: Taniya Das <quic_tdas@quicinc.com>

In the latest chipset clock controllers, multiple power domains
can be required to access and configure the PLLs in probe. Therefore,
add support for an API to attach to multiple power domains in the
clock controller probe before configuring the PLLs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 12 ++++++++++++
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9e3380fd718198c9fe63d7361615a91c3ecb3d60..ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -391,5 +391,17 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
+int qcom_cc_attach_pds(struct device *dev, struct qcom_cc_desc *desc)
+{
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, NULL, &desc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_cc_attach_pds);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI Common Clock module");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7ace5d7f5836aa81431153ba92d8f14f2ffe8147..45f1f53fb407d4600f5059b792564b68cd8c244d 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -38,6 +38,7 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	struct dev_pm_domain_list *pd_list;
 };
 
 /**
@@ -76,5 +77,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
+extern int qcom_cc_attach_pds(struct device *dev, struct qcom_cc_desc *desc);
 
 #endif

-- 
2.34.1


