Return-Path: <linux-arm-msm+bounces-21-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268207E355A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 07:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561DB1C209DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 06:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390AFBA3A;
	Tue,  7 Nov 2023 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cPZ7sJaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939AAD5D;
	Tue,  7 Nov 2023 06:46:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900A6E8;
	Mon,  6 Nov 2023 22:46:36 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75SuHY023467;
	Tue, 7 Nov 2023 06:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Rug+1Ge2zGYjSRgUXFw2EyLeaRalbAmz3hyCXghH2IY=;
 b=cPZ7sJaRM5gN0hr2FWeoAbpGfzVUiBHVgAyEAM6AotS1NGH5gFHR3qYx6p6+YJ5UXGYy
 50w7RThFV726jj/nyhOiLWi/jm+fuA8U7ZgS4XYpjjPdvumFWi95i//wtV3uMb2tfwyZ
 6dpEeI0SELUD8eZMb/OhH5q7ZoCVbjZTFE1JHmjCiN2XYCC7MkEurLqhW0V/0COnH5CU
 2myqDKZYMiLSs0//9iEzWgLPnDKTPW6jePpsU3w/KJjHZkad68oiruO+1Er5n9mGjN7v
 A7zqQRJu5pKEXjKXiqlxYQTgx6G1KTVA9OdQJCQGaLxr1EL/NdDOggP1Yf11hEYvYT0A nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u72bthv5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:46:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A76kQCq017940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 06:46:26 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 22:46:21 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: qcom: Fix SM_CAMCC_8550 dependencies
Date: Tue, 7 Nov 2023 12:15:45 +0530
Message-ID: <20231107064545.13120-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k_5763SrfRN3gAcz7i1COOnwgRTvvUaS
X-Proofpoint-GUID: k_5763SrfRN3gAcz7i1COOnwgRTvvUaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=683 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070054

SM_GCC_8550 depends on ARM64 but it is selected by
SM_CAMCC_8550, which should have the same dependencies
as SM_GCC_8550 to avoid the below Kconfig warning reported
by kernel test robot.

WARNING: unmet direct dependencies detected for SM_GCC_8550
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
  Selected by [y]:
  - SM_CAMCC_8550 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ad1acd9b7426..dbc3950c5960 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -767,6 +767,7 @@ config SM_CAMCC_8450
 
 config SM_CAMCC_8550
 	tristate "SM8550 Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
 	help
 	  Support for the camera clock controller on SM8550 devices.
-- 
2.41.0


