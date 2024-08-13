Return-Path: <linux-arm-msm+bounces-28363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3F95009E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 11:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD741F2238A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5710B170A23;
	Tue, 13 Aug 2024 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f5nA37Ur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E915B7;
	Tue, 13 Aug 2024 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539590; cv=none; b=j1fYz8Qk+iKnbsOSZUNOklolmBT9NHC+FjLRfVHfAZWFyFTPt9fUr0tt20UFTxViinyMmDIMcmOAPYW87oqooWYPAo4mP5iF0SRI3lwSbK+A3P/AXaO8dnmldh+K4lkkNrawBiLcvociqgPq5hjnoQycobO25CxEp9WZOt0O3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539590; c=relaxed/simple;
	bh=JdP+ROVMh/KRzmmlnV0TwLHRyhPOyOX63BSvHWTPQaI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N7cVOE7GJC0PHEYW5505QTaBxKNSNOZo9Z5Pa/8LinqBkgSGy4IS0UwCVR1XU1Sd1aM7Gbu0q0CYUeoBHKnGnhyLBBXrxEFPFOvDoZfJps0TJfSD8jGtBvg7T7cqzu1GDOr4c01n1bG82UnyZiDULvAEh/Jcy+v1Z7yBmlFYeRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f5nA37Ur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D3wSbI001097;
	Tue, 13 Aug 2024 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ld6Y5Moq8AyX9mmvL9mUQl
	4XzuJgmry59u66zwjmbok=; b=f5nA37Urjq3nXNEV4dsVK0SfCJgmQkgmDfJofo
	NGsLSWyLWt7cFF0wRA+qRTlQDTV9iO9lSL1N8MEb3KQEJUZHRzzzXVmzSLHQJcY+
	dwhkULAM5/9XtNlIM0HM+9kjKbpBBaeSPA3qFf+VJ7FZOYUWEqNSoc3YGrtRBXM3
	yQrp306yE8zQRm3EX+Q8y5lF0C5HvRcnGEO5yENyNfrlnyZ1kF2QKuJ7VL64ligo
	WPfjOzyuybLH+W1p3VblA+0sxdfClynif+s209o2G7XhzRUsRtmn+2iZ71+ZzhF4
	fJeDbg/+IUns8ZO+yS55yGYkRndv0ebW6UCOfnOVzje6qPLw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3et6rjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:59:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D8xgTw011173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:59:42 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 Aug 2024 01:59:38 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: qcom: Fix SM_CAMCC_8150 dependencies
Date: Tue, 13 Aug 2024 14:28:46 +0530
Message-ID: <20240813085846.941855-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YuLh0-TfGia6Dtd3lgzZNLDC6jWVKgF2
X-Proofpoint-ORIG-GUID: YuLh0-TfGia6Dtd3lgzZNLDC6jWVKgF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_01,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=684
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130063

SM_CAMCC_8150 depends on SM_GCC_8150, which inturn depends on ARM64.
Hence add the dependency to avoid below kernel-bot warning.

WARNING: unmet direct dependencies detected for SM_GCC_8150
Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
Selected by [y]:
- SM_CAMCC_8150 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

Fixes: ea73b7aceff6 ("clk: qcom: Add camera clock controller driver for SM8150")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408020234.jg9wrvhd-lkp@intel.com/
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index cf6ad908327f..416002d97062 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -828,6 +828,7 @@ config SM_CAMCC_7150
 
 config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
-- 
2.25.1


