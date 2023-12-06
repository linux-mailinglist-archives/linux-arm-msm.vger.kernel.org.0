Return-Path: <linux-arm-msm+bounces-3567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18607807208
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 15:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2E5B20B6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1EB3DBBF;
	Wed,  6 Dec 2023 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="erqz6JWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED8D49;
	Wed,  6 Dec 2023 06:15:21 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B6A270b023818;
	Wed, 6 Dec 2023 14:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rfC6QjvK2AD6O9lM1e23BZ1sFVDqmw9mNyfJ4MSv5W0=;
 b=erqz6JWblo4UDdYYTJGdDaNXG+i6Un528XBzGc1P0790QU/4XJznu5pG8CkoZS3t0CRh
 vCgmiI+oQwlmiUbNb1NEIM1hYo8SzyWaGtbQEGPv/4g6RJyTfD5S25enkEuuZEa4B/qw
 mPsfAXzOH7YmaAy2iNC/E9Y7vRvKLkREnmYEAcxfoaSQMwU7VnmnhTgkZpz+Mqtpv+v6
 DOP8lplC7KH34fRb+0gLcbL6kqB56/jWtdCWXou6liPtFxGb7Yu6KYDEEhrD3Y11iNYH
 XvjO4OyknMVCCBZ5t2ZCLleVo3z7AhNNqQ7w44R48PZCGiV/3fUuSwO8OrAQqTnO9ke1 eQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utdadsxcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 14:15:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6EFEQb023823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 14:15:14 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Dec 2023 06:15:14 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Fix the warnings from coresight bindings
Date: Wed, 6 Dec 2023 06:14:55 -0800
Message-ID: <20231206141502.27016-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XcoTnA5RBi_MQXrDxnohHXAzSD1Y-8aQ
X-Proofpoint-ORIG-GUID: XcoTnA5RBi_MQXrDxnohHXAzSD1Y-8aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_11,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=473 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060115

Fix all warnings in Qualcomm boards coming from Coresight bindings.

There are warnings below after running dtbs_check. The patches are
to fix them for Qcom boards.

funnel@3023000: 'in-ports' is a required property

etm@7c40000: 'out-ports' is a required property

etf@6047000: in-ports: '#address-cells', '#size-cells', 'port@1'
do not match any of the regexes: 'pinctrl-[0-9]+'

replicator@604a000: in-ports: '#address-cells', '#size-cells',
'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'

funnel@6c2d000: out-ports: '#address-cells', '#size-cells' do not
match any of the regexes: 'pinctrl-[0-9]+'

Warning (graph_child_address): /soc@0/tpda@6004000/out-ports:
graph node has single child node 'port@0', #address-cells/#size-cells
are not necessary

Warning (graph_child_address): /soc@0/funnel@6005000/in-ports: graph
node has single child node 'port@0', #address-cells/#size-cells are
not necessary

Warning (graph_child_address): /soc@0/etf@6b05000/in-ports: graph node
has single child node 'port@0', #address-cells/#size-cells are not
necessary

Warning (graph_child_address): /soc@0/funnel@7810000/in-ports: graph
node has single child node 'port@0', #address-cells/#size-cells are
not necessary

Changes since V2:
1. Remove qcom,inst-id for remote etm.
2. Modify the node name of remote etm dt node.
3. Add space between 'endpoint' and the opening brace.

Changes since V1:
1. Add new dt binding for remote etm.
2. Add new dt node modem-etm in msm8996.dtsi

Mao Jinlong (4):
  dt-bindings: arm: Add remote etm dt-binding
  arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
  arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
  arm64: dts: qcom: Fix coresight warnings in in-ports and out-ports

 .../arm/qcom,coresight-remote-etm.yaml        | 51 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 21 ++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 32 +++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  5 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  5 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 24 ++-------
 6 files changed, 98 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml

-- 
2.41.0


