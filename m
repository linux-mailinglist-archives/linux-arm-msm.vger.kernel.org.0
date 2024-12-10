Return-Path: <linux-arm-msm+bounces-41326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AF9EB479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1261428385C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9241BD9CB;
	Tue, 10 Dec 2024 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EFUnetv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C61BD007;
	Tue, 10 Dec 2024 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843868; cv=none; b=dBIXFA4MNSIC2u5g/1FFGSLjs68he4Wm+7lgyyA0K1uDxflhTiVNywGxOP9mcSJ/880+5Cx5yryDTL36/5V+CrZsU8dRsVJIEdN5xnD+e2WrRRGiusO0Dmw0Eiw3WuiY3TUpKtTtgPh9jmYvYf7Pn62MSYbgNXrEvKajO03MPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843868; c=relaxed/simple;
	bh=1BC+20K4QyIPym8VlYAso2FlqkQaxPI67UwS7wJTJTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVTyrSnS5khfBvdkxvzbSVIIkifgPr1AQ7FXyW1YyWSFoZ+aTFrr9TVrYTu+gAMFYHI6tnpagoBzrATIw9ap9f0C5IS2AB5oCwaDkWJPLnu53pnC9clZXOkdNDWHMsKBz3JRcgbKzsGzqfzFTtwNACpudKr/vJc0TTSr7vkki78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EFUnetv5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA7roab002485;
	Tue, 10 Dec 2024 15:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwCRl5Dzku1cRJ0up4Ba3bjTq8+vU650lLrDez//uRc=; b=EFUnetv5zlcxcDul
	0dGWsp1ibrHGPLzygJt+l9iXSmpiRDW7s8qYDoujrxWIm31IKHH5PpM1eaWP89L9
	NZK6Dgw7CfJnupVbBhk+zF0JIZY3E4HLbIfLZqY99XLy9XV6iqiKIu85CFEGCC9m
	ZqrCwrOSwR3ZQCPkJTBwaKFsD2fSS2pFglMmAnOA2iL7Qpzh+ewSllkJK0ZEhTSl
	4Z/S95oXBpR/ikvcx/Z2aj+WYCXpliAJctueamNJHgdcLcQ1RSj/PQfVsA/S5FcT
	jTUoulpL+6WhtkQLca5B2VmUA2Xzzk0ZWXY6oV9a4B6Kju8zLPv/QzoSIdVU2dJQ
	wune5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw44kpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAFHaux026139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:36 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 07:17:32 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_chejiang@quicinc.com>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
Subject: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand firmware-name property
Date: Tue, 10 Dec 2024 23:16:33 +0800
Message-ID: <20241210151636.2474809-2-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: z9azDFe--YnD8G9vT4txP55g11F3Tkvy
X-Proofpoint-GUID: z9azDFe--YnD8G9vT4txP55g11F3Tkvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100114

Expand the firmware-name property to specify the names of NVM and
rampatch firmware to load. This update will support loading specific
firmware (nvm and rampatch) for certain chips, like the QCA6698
Bluetooth chip, which shares the same IP core as the WCN6855 but has
different RF components and RAM sizes, requiring new firmware files.

We might use different connectivity boards on the same platform. For
example, QCA6698-based boards can support either a two-antenna or
three-antenna solution, both of which work on the sa8775p-ride platform.
Due to differences in connectivity boards and variations in RF
performance from different foundries, different NVM configurations are
used based on the board ID.

So In firmware-name, if the NVM file has an extension, the NVM file will
be used. Otherwise, the system will first try the .bNN (board ID) file,
and if that fails, it will fall back to the .bin file.

Possible configurations:
firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
firmware-name = "QCA6698/hpnv21.bin";

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 7bb68311c..2782d2325 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -101,7 +101,10 @@ properties:
   max-speed: true
 
   firmware-name:
-    description: specify the name of nvm firmware to load
+    description:
+      If one item is present, specify the name of the NVM firmware to load.
+      If two items are present, the first item specifies the name of the NVM,
+      and the second specifies the name of the rampatch firmware to load.
 
   local-bd-address: true
 
-- 
2.25.1


