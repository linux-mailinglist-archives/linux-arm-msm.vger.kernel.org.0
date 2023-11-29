Return-Path: <linux-arm-msm+bounces-2485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D43F7FD9A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A62D282870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A2332197;
	Wed, 29 Nov 2023 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vxj5UPUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709CBD5C;
	Wed, 29 Nov 2023 06:38:32 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATCYx23010664;
	Wed, 29 Nov 2023 14:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rfq8CHWn49qJniN2uoDubYi8n8uzITGvJVeoFuMOVjg=;
 b=Vxj5UPUfdXgeSKlQoQt+Z4Chdf8w76bEfH2Xcu9EpKzx3+RSfbnZD7wnAqxgTGhr/avm
 kB5Aw8nN9UP6RBozsM6ITiXNWv91JryTsKx128d2lxKUbyiF1PAAr4EsvSGsE0FNrPvY
 UJEo/kuMH9y8+jjACuyoHAtwXOLzPY/ILyCq8hMU+21CxZn50IV3dShHsswSckiyaUyY
 U1zJGyJzXCoUQ/PX5KFsbOMYFrvLnIj31IfZ4hoO+qUlT7ltzKEHf48/8c9uyrZNYs1O
 kHEGwTGfaLrtJEkDQvF5P3RuyvpDU/Jvxtbr4ITnNTQVyXD8YPjVZkiPr06n+Zw1YMeW Pw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up5e8ra7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 14:38:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATEcRx8015920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 14:38:27 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 06:38:27 -0800
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
Subject: [PATCH v1 0/3] arm64: dts: qcom: Fix the warnings from coresight bindings
Date: Wed, 29 Nov 2023 06:38:08 -0800
Message-ID: <20231129143815.7892-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: COiUkpSodAXmdJKUtw4VlI99GOuxSHN9
X-Proofpoint-ORIG-GUID: COiUkpSodAXmdJKUtw4VlI99GOuxSHN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_12,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 impostorscore=0 adultscore=0 mlxlogscore=497 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290110

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


Mao Jinlong (3):
  arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
  arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
  arm64: dts: qcom: Fix coresight warnings in in-ports and out-ports

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 26 ----------------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |  5 +----
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  5 +----
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 24 ++++----------------
 5 files changed, 26 insertions(+), 66 deletions(-)

-- 
2.41.0


