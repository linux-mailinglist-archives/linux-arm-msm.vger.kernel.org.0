Return-Path: <linux-arm-msm+bounces-1684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DEB7F5E51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BE781C20F36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A862241E3;
	Thu, 23 Nov 2023 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AENSVShV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6129A;
	Thu, 23 Nov 2023 03:54:03 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN9a19p011095;
	Thu, 23 Nov 2023 11:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=cahJq3zvyMWZ26vAEszpiEN1alzkguUJCq7NtLAPzUI=;
 b=AENSVShVaRjv1DOY+ccVE2fRBFRLxpIpTmPy6AR9ZJFU5yWXUJNUz7BG4dubXI3cGJgT
 C3fglSqoQ9TwQzD+66urjX3OYSDUXdpAA4DGVh+4zcPYwxUJjPpb12oMlA5yNMyhUPSJ
 3HfTH1J2N02YjvTuxFXS6xXl4OsYWvO9duk9XuNof2b4gb+sI9PsFa9Oo6EAj0JzYerD
 q+CMOpoctsqXtQq+o7kYP2XQ6Q+X4SjCZOzBcWvhdWwrJXYKNOLIIKsHuylfOBjBBSxN
 776EWJprOCM4p1dYEnfJ4SiImFIZl4IroCOOJKI0lwk6sx5C+mHmJt8h4Cv/g5fdvBxI sg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj3ec0bvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:53:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANBrpmT021868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:53:51 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 03:53:41 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
CC: <kernel@quicinc.com>
Subject: [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ support
Date: Thu, 23 Nov 2023 17:23:19 +0530
Message-ID: <cover.1700737841.git.quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uFRYnVx6PQExqimVzUmhlLkKjiEdG1iI
X-Proofpoint-GUID: uFRYnVx6PQExqimVzUmhlLkKjiEdG1iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_10,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=771 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230084

Suraj Jaiswal (3):
  dt-bindings: net: qcom,ethqos: add binding doc for fault IRQ for
    sa8775p
  arm64: dts: qcom: sa8775p: enable Fault IRQ
  net: stmmac: Add driver support for DWMAC5 fault IRQ Support

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  7 +++++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++++++++++++
 6 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.25.1


