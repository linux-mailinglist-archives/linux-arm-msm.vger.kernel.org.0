Return-Path: <linux-arm-msm+bounces-1617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F07F5888
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 07:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88EA2812B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 06:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6542BF9F0;
	Thu, 23 Nov 2023 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tq1TMn0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7E5AD;
	Wed, 22 Nov 2023 22:48:31 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN19fC4027423;
	Thu, 23 Nov 2023 06:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RYOEdN/p5Ny3t5mDHy6Fv03Bj+dIJIXS9d6jKHwYuqY=;
 b=Tq1TMn0tAb1/wM81xxvkoPCTk74j2UJ1bdlsEIiAREd6cFkhgCtEilYmRnrbeuPdu8/f
 A5Y5YAP3TCm6fQahsUuysposhF3et9Eo6uFWQOBvRkQ3ZBgWhpaCqxriR1ifrlEI+W7N
 95DPdpqp2rZ+4x8prXS+sdsTbAToBOIXMMdr4BUT2JIQ9DYPfbrN6w+Yto8etKQLKE99
 SxSl/vI+3+aJb7lSUq6d+XVmLc8BQAEk+3VAhIVgy3KtAIrixwdSxBI3C94muHdqOCDs
 5kWli6h7qqNZHXpj25g3bvX0sUTe8x0VSazjm/xIora+l6qCfbJQbScrjLAU391bO7sp zA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhey5aj4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 06:48:21 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AN6mK0I011791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 06:48:20 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 22:48:15 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH V5 0/4] Add support for Qualcomm ECPRI clock controller
Date: Thu, 23 Nov 2023 12:17:31 +0530
Message-ID: <20231123064735.2979802-1-quic_imrashai@quicinc.com>
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
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YglHcXbqRHdIyLPCxtFIwgvGeSAOSRWo
X-Proofpoint-GUID: YglHcXbqRHdIyLPCxtFIwgvGeSAOSRWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_04,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=875
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230045

The ECPRI clock controller support for QDU1000 and QRU1000. The clock
controller has a special branch which requires an additional memory to
be enabled/disabled before the branch ops.

Changes since v4:
 - Aligned the lines as per the review comments
 - Used the clk_hw_get_name implicitly in WARN as per the review comments

Changes since v3:
 - Updated the bindings description as per the review comments
 - Updated mem ops and ecpricc driver patches as per the review comments

Changes since v2:
 - Updated the mem ops implementation as per the latest review comments
 - Updated the ecpricc driver as per the review comments

Changes since v1:
 - Updated the dt-bindings
 - Modified mem ops logic as per the review comments
 - Update all the hex values to lowercase
 - Aligned the clock entries in DT as per the review comment

Previous series:
v4 - https://lore.kernel.org/linux-arm-msm/20231117095558.3313877-1-quic_imrashai@quicinc.com/
v3 - https://lore.kernel.org/linux-arm-msm/20231106103027.3988871-1-quic_imrashai@quicinc.com/
v2 - https://lore.kernel.org/linux-arm-msm/20231011090028.1706653-1-quic_imrashai@quicinc.com/
v1 - https://lore.kernel.org/linux-arm-msm/20230808051407.647395-1-quic_imrashai@quicinc.com/

Imran Shaik (3):
  dt-bindings: clock: qcom: Add ECPRICC clocks for QDU1000 and QRU1000
  clk: qcom: Add ECPRICC driver support for QDU1000 and QRU1000
  arm64: dts: qcom: qdu1000: Add ECPRI clock controller

Taniya Das (1):
  clk: qcom: branch: Add mem ops support for branch2 clocks

 .../bindings/clock/qcom,qdu1000-ecpricc.yaml  |   68 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |   14 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-branch.c                 |   38 +
 drivers/clk/qcom/clk-branch.h                 |   21 +
 drivers/clk/qcom/ecpricc-qdu1000.c            | 2456 +++++++++++++++++
 .../dt-bindings/clock/qcom,qdu1000-ecpricc.h  |  147 +
 8 files changed, 2754 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml
 create mode 100644 drivers/clk/qcom/ecpricc-qdu1000.c
 create mode 100644 include/dt-bindings/clock/qcom,qdu1000-ecpricc.h

-- 
2.25.1


