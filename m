Return-Path: <linux-arm-msm+bounces-23351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5959103B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 14:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF0D1C21008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 12:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0771ACE7D;
	Thu, 20 Jun 2024 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FiHMAKM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D581AC79E;
	Thu, 20 Jun 2024 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885213; cv=none; b=UU2s1sEGBtRDNE12TOgNJougP/GWc2RMGq34bECaFVmTYFfpG0ZR9iXp/wp0xCVTcv77XcFk+WVsYBA+ToHLfU9+CMdpKtIhPGQHREWLEMythM6HRhaEjVnCh/L4e55vBSwonYevYe/tBlPulTfRQKJy28Fr6X7DukwTc3bzd8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885213; c=relaxed/simple;
	bh=iJIgxjbBkuSefyrQt2I0llsIYU65Nthr2JUZFrfi3TM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnZJlI0cOk1NA/7NKPY9DQD74+iuQ3T+UeAbZY7rRCBWEl+BpRDU9VF6G0fKpjSacoJjXS1sGWxpR49ZP0gPlxKdghfxWeifUOhUxVpVuEy/ZtxTfC8M+h6WuRRAtwuRISZzrcMTivwok8yJ6GAb5uTYiYrxRCP8zNjPLke7w7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FiHMAKM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v69G004065;
	Thu, 20 Jun 2024 12:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOLvpz5bYQlo9Ael7d7G7wmU6IVdn8MB46HGncjkzSo=; b=FiHMAKM/gtOO/Y5M
	7otl6GbG2TgIW1YViwgJWSIng4yx7N+fkz7vjt5wiz/TYLZ238KtGXVEEX9A0Tfn
	hUWJbzM4j6B6XP7jSu10HX131jry3nGIHHUiSvv2wcs/QWz8Lt+RcXlAl+3riDiE
	VC+VtQO/RL2v+xhPbQJk3HipFdgWzOO0ZrpSh5remsGQHZHDTq+xenzXjmt3yjsf
	hUOQYgQYaMiKO3AsRxNssuWYTu2n/UUM1KWfqFHiOb1httyIpPJR9wQJDHgHCfWu
	CilrIlOVGIL5dTI9dj7+LBaprGW+/ApBecBfx/4Ga/1X5rBh9wr9RTaRgJHTwy+2
	GFnWVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv2xua62g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KC6k0E022316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:46 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 05:06:42 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3 2/4] remoteproc: qcom: q6v5: Add support for q6 rmb registers
Date: Thu, 20 Jun 2024 17:31:41 +0530
Message-ID: <20240620120143.12375-3-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
References: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oAqG3KT74XTbgax34CDC89hW0cmA2xNT
X-Proofpoint-ORIG-GUID: oAqG3KT74XTbgax34CDC89hW0cmA2xNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxlogscore=877 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200087

From: Melody Olvera <quic_molvera@quicinc.com>

When attaching a running Q6, the remoteproc driver needs a way
to communicate with the Q6 using rmb registers, so allow the
rmb register to be gotten from the device tree if present.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5.h     | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..95824d5b64ce 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -7,6 +7,12 @@
 #include <linux/completion.h>
 #include <linux/soc/qcom/qcom_aoss.h>

+#define RMB_BOOT_WAIT_REG 0x8
+#define RMB_BOOT_CONT_REG 0xC
+#define RMB_Q6_BOOT_STATUS_REG 0x10
+
+#define RMB_POLL_MAX_TIMES 250
+
 struct icc_path;
 struct rproc;
 struct qcom_smem_state;
@@ -16,6 +22,8 @@ struct qcom_q6v5 {
 	struct device *dev;
 	struct rproc *rproc;

+	void __iomem *rmb_base;
+
 	struct qcom_smem_state *state;
 	struct qmp *qmp;

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8458bcfe9e19..b9759f6b2283 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -770,6 +770,10 @@ static int adsp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	adsp->proxy_pd_count = ret;

+	adsp->q6v5.rmb_base = devm_platform_ioremap_resource_byname(pdev, "rmb");
+	if (IS_ERR(adsp->q6v5.rmb_base))
+		adsp->q6v5.rmb_base = NULL;
+
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
 			     qcom_pas_handover);
 	if (ret)
--
2.42.0


