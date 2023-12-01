Return-Path: <linux-arm-msm+bounces-2858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1180077C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42F31C20C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6E51DFFC;
	Fri,  1 Dec 2023 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZnsrJCtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6A1E6;
	Fri,  1 Dec 2023 01:50:40 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B17o8de011090;
	Fri, 1 Dec 2023 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=DLhOZuvjXEZEm7fxO270vIwSRZ0d0rkb7FIWskSaEg8=;
 b=ZnsrJCtMVJ2dNbkg/VxDhbrXf2NBgjZwlD7pGoJRMUHyVHbO7jTPnlWan1wiQ+KhwwXm
 iL+afL2w573k2CyMYiZTg8n1F9Y8bON3SWqiBK0U1WMCKvOm/QYcdguGSzI2Xw++HkCS
 YJ1MZrR737002YxZJCIaSG8jLfLHI5JZMP0sGP2t/lgxq3D1fSTPU6NNCdWy0+s2thoX
 RHhp1lWB7uFfBion0vrVhW5zA3Ofd4yQL8zqLs/QNX65jqWW8K3Fm5slYie2ZaOEtL4b
 DLgrPzDyYLvJ27c0mE/bzZCxL78FqWPjkl6jBVZ4WBEr5Nb8MmDkzqRHOU0YRYScZ3AF dQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq2kp99dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 09:50:35 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B19oYeF009110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 09:50:34 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 01:50:29 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v3 0/4] Add runtime PM support for videocc on SM8150
Date: Fri, 1 Dec 2023 15:20:23 +0530
Message-ID: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+saWUC/0XMTQ6CMBBA4auQWVsy/UGRlfcwxjTDIBMCxRaJC
 eHuVjcuv8V7GySOwgmaYoPIqyQJU4Y9FEC9nx6spM0Gg8Zqg1qt0nIgUrWuUCFV6Iw51dYh5GS
 O3Mn7t7vesrsYRrX0kf1/onWtjT07V5rso0Wl1fMldE+DH2Tx8+UrmaikMMK+fwDAjpHwowAAA
 A==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oLNDiwRRV3ocNKRU6-uwcttZ3lybAbZM
X-Proofpoint-GUID: oLNDiwRRV3ocNKRU6-uwcttZ3lybAbZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_07,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=747 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010065

Add runtime support for videocc on SM8150 and update the resets
and video_pll0_config configuration.

Changes since v2:
 - Update pm_runtime_put to pm_runtime_put_sync
 - Link to v2: https://lore.kernel.org/all/20231118123944.2202630-5-quic_skakitap@quicinc.com/

---
Satya Priya Kakitapalli (4):
      dt-bindings: clock: Update the videocc resets for sm8150
      clk: qcom: videocc-sm8150: Update the videocc resets
      clk: qcom: videocc-sm8150: Add missing PLL config property
      clk: qcom: videocc-sm8150: Add runtime PM support

 drivers/clk/qcom/videocc-sm8150.c               | 25 +++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,videocc-sm8150.h |  4 ++++
 2 files changed, 27 insertions(+), 2 deletions(-)
---
base-commit: 8c87404c76c1911a7ec5b61bf3b2c3858cb95de1
change-id: 20231201-videocc-8150-0c5042278340

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


