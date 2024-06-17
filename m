Return-Path: <linux-arm-msm+bounces-22803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2E90A682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B271C25FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 07:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B417187331;
	Mon, 17 Jun 2024 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j10ALPtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A80269D31;
	Mon, 17 Jun 2024 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608164; cv=none; b=L7i5erBlW0a7XxfiWoS3/KdjtvEWK0otMpiMPr+C0tnwKtpWzPGpNijPBARZXJzxNFxw3jidAKuly4BU7wmElSLWDSHq2zovzAmOxClnzsCupE9p+kUQwE2wjLVuaJ+jw8a2K5li/0ykFYDW8DLp2axXS2xS9VHeL6lkuaTu+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608164; c=relaxed/simple;
	bh=omAFcBkiIeF3oDwNg1SA45RPTx9IUXA8dn8K551h5iI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UcAav5wHczs5ARYJ/xWv8hh2cF7eJ6i0xzks366umonkZ+wrLMmvzg+FIhOMXEubhpOnb28S6SQGvMoAeuVFGy2afIsaMs+n6Q5hHFgaWPdp32Gj8o8XXwyIl8tpCWJ+mbLt2pgScq5IAzBi836HxKXdYY5HpCZVWJBoWqwDei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j10ALPtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H1Ei04010650;
	Mon, 17 Jun 2024 07:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KMGSuuYq3JLu9Nw9GFxe9Z
	tVre62ltGolbLBWFUGriA=; b=j10ALPtnfbed2ysotfEWDpt3W9fFyKYZggkYSu
	Ry7G+4E7VsxzLysapQMvGT3Ft40qm6C0TF0HGNSE3k8hZV56HnSN9VebCUmQxsJ9
	wRxE0vSGizus9apmdsdoznt5ThSCRY7aaQx3XZB2fyPzQjKPeiIvJijv2eJpoEMr
	pDw2hHOniz6RT0H2AcYrmlvmjnTd/J3OoWu7X0XpPV6nr6axAW1tcfgkP9vFzu4O
	O10H2TjidtzQKIImXkaRaMOwaTN/lJ8BBbQwxl+RD2THjHAVVDvedT0SP3CpdjUr
	wEd1lrfM8yEcjblEX6UvOGREnzQasMFfG+QTewg+BJJo9GjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys29gu03k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 07:09:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H79E75018538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 07:09:14 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 00:09:12 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bryan.odonoghue@linaro.org>,
        kernel test
 robot <lkp@intel.com>
Subject: [PATCH] clk: qcom: nsscc-qca8k: Fix the MDIO functions undefined issue
Date: Mon, 17 Jun 2024 15:09:01 +0800
Message-ID: <20240617070901.3218636-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a6fNrG5IXCTskvWO3EK35fSwjuj91EbZ
X-Proofpoint-ORIG-GUID: a6fNrG5IXCTskvWO3EK35fSwjuj91EbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_06,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=894
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170053

When the COMPILE_TEST is enabled, the MDIO_BUS is necessary because
of the mdio_module_driver used for qca8k clock controller driver.

This patch fixes the following undefined symbols.
ERROR: modpost: "mdio_driver_register"
[drivers/clk/qcom/nsscc-qca8k.ko] undefined!
ERROR: modpost: "mdio_driver_unregister"
[drivers/clk/qcom/nsscc-qca8k.ko] undefined!
ERROR: modpost: "__mdiobus_write"
[drivers/clk/qcom/nsscc-qca8k.ko] undefined!
ERROR: modpost: "__mdiobus_read"
[drivers/clk/qcom/nsscc-qca8k.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406161634.B27sOs8B-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202406162047.QkUMa2fG-lkp@intel.com/
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 4432b1cce478..4e8ca0ecf1f3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -251,7 +251,7 @@ config IPQ_GCC_9574
 
 config IPQ_NSSCC_QCA8K
 	tristate "QCA8K(QCA8386 or QCA8084) NSS Clock Controller"
-	depends on MDIO_BUS || COMPILE_TEST
+	depends on COMPILE_TEST && MDIO_BUS
 	help
 	  Support for NSS(Network SubSystem) clock controller on
 	  qca8386/qca8084 chip.
-- 
2.34.1


