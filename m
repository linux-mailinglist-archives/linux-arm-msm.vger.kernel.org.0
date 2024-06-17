Return-Path: <linux-arm-msm+bounces-22829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D290A9F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E6928C6E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A324E1957E9;
	Mon, 17 Jun 2024 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cr6MxLhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6991953A3;
	Mon, 17 Jun 2024 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617108; cv=none; b=ILemi8Z/zUwxWFyf/IUew1eS8PotPG2efUKo3JPFj5MkZvvAO9O1THwNopoj4bjsdFr+SVZ9rILZHQYhlFXE2oYIi2c/Tixeti3Ib27ZqstXrgdqtg2y+tDs5ni3SVdLBN7cy039R43syjzIyFtwLTh36Z+b/Pf2niOwWmlsnNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617108; c=relaxed/simple;
	bh=X4TgZvR8YTRuJlHakvo1qNbgCFhjwBTkNSAlyUW534c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tx9JO4JJNgkhQXJ19Yejr4Ns/4QB7bvogzo2B16s1VNl5yKv14Ulox8lVu8k3jxJJBgN0jEEzme9O5Eu3hiomWFJ26K1fxxmy3LiWrmhXrIoqEEd8IAxp7jUPABK6y5sUFA6G9qeo6PvwQ+jPGk1Nafm+B7RNQInv+d0PLCLQO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cr6MxLhN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GNgrPq015294;
	Mon, 17 Jun 2024 09:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XZWR+LPUU8g++qZHyoVAYs
	vrY/YFVlLvCNv77TwxLuc=; b=cr6MxLhNLXcfyxcRodtoBEJDiGiJ9JZw1gMLNO
	RXdTdc3ZbYaZQMNC+6S71b1FzLXQU+gg1DGznSnkh0gRCBV9PkykA1z6GK1zXjRD
	N//I1arVQ0MbBnsW3RdZxA59laQwIxH9HXviqVK2E7SJS8Wb1MTVKCm14rjHv//k
	VhDaOuohk8kQQdj+cLNxcc9ybZjdACfjiNu/yqQ6GmVIoxIXTWFq/IltE09eXLv8
	jbcBCH7Qn2BNxXGzXBa8LBo2fCPioEdH/CoNVXzikZKc0tZjUkrU6BXI/OrWr1v/
	wNH9CVc2sAqX2Nz2aFWygyCrnMr07ywl4D9pUKqFm0EpAJAg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0an3en7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:38:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9cJbJ021271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:38:19 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 02:38:17 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bryan.odonoghue@linaro.org>,
        kernel test
 robot <lkp@intel.com>
Subject: [PATCH v2] clk: qcom: nsscc-qca8k: Fix the MDIO functions undefined issue
Date: Mon, 17 Jun 2024 17:38:06 +0800
Message-ID: <20240617093806.3461165-1-quic_luoj@quicinc.com>
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
X-Proofpoint-GUID: WO2qlUJu_vFuNd3LErenDaK_3CZK0Uob
X-Proofpoint-ORIG-GUID: WO2qlUJu_vFuNd3LErenDaK_3CZK0Uob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=876
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170073

The clock controller driver of QCA8K depends on MDIO_BUS because
of mdio_module_driver used to register the driver.

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
Changes in v2:
	*update the depends on MDIO_BUS.
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 4432b1cce478..1e468e48401b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -251,7 +251,7 @@ config IPQ_GCC_9574
 
 config IPQ_NSSCC_QCA8K
 	tristate "QCA8K(QCA8386 or QCA8084) NSS Clock Controller"
-	depends on MDIO_BUS || COMPILE_TEST
+	depends on MDIO_BUS
 	help
 	  Support for NSS(Network SubSystem) clock controller on
 	  qca8386/qca8084 chip.
-- 
2.34.1


