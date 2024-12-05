Return-Path: <linux-arm-msm+bounces-40475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CE9E5211
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E721B1881E30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20F41DA619;
	Thu,  5 Dec 2024 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EUzU2Vhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBC1D9595;
	Thu,  5 Dec 2024 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394190; cv=none; b=oVIYDtBcNPnGWp3c6r0ul+Q6AIYX7kXpk+EZZi6DSCPimBd64dshR7ZNfiiMAeNZwPCz+If8Vz+DZnYi7zieI5XN8+S/gU0aSiK2RtPo8v3Fi8glLmRKAkDn42JPEA/1VluaZuEumypMVvejc4NBNH9vrHkvgZSbKpjHTdgdIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394190; c=relaxed/simple;
	bh=hSLSn9gYao7+2IZIz4i4MOeufeS5s0m9Wx/K5ErgcUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fySsEZcOWJrGCt6cI7U7K7j5KFUqPkcDjQxzfodxOrHQQcnMuelfC50XSaaIpEEII+n1kecvuzdL/uFx9FUZV9fehLOp9E6dVVI/MFFJXzWpOKYkSHE67TVCBOvg/XqA6b13SDHDqlvqyGn+92fVwAnRxO4vfEb2ZVreLf87iXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EUzU2Vhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B551eGv021235;
	Thu, 5 Dec 2024 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWoW6sMe+9JuqHI905bcxrJ12/jrwpZuAsPEibBIi3E=; b=EUzU2Vhexi6qaQ76
	tVLe7yp2Ov45oXSIU76Pf2ZLQ+vl4v0LwcPuMFfcNIXBb9hy2L4hYL5X0BqgdBhQ
	EOjU/KOYvOdJjlLPAm4QSK1qjqo3thTHuRltiWECXDuuSm99C/t22XPNWqZ4M/MS
	VtrXy9M+Wt1Wqq/oIukvVVcMWZLBljtbHgzKtsp/Bst7cI776tygYqqZH7j9y7th
	E36KdXoTBSRcxD/xVKQ6SQgUh8M4fENCLcvGsQaB9QW1Eqryh6dHifkhrVJgjV+N
	PQH9Bugs2aTei3WFo0KgQNHHt5bmMCL0J7Df04tKWXJ6DJrb/i1bPGiV+SRzY3x5
	c+4z2A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exe4bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:23:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AN21V023086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:23:02 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 02:22:58 -0800
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
Subject: [PATCH v3 1/3] dt-bindings: net: bluetooth: qca: Expand firmware-name property
Date: Thu, 5 Dec 2024 18:22:11 +0800
Message-ID: <20241205102213.1281865-2-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: av_QYl4-nGNH2OKd35jrWe88f-kmqVLH
X-Proofpoint-GUID: av_QYl4-nGNH2OKd35jrWe88f-kmqVLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050073

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
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 7bb68311c..6d73de9cd 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -101,7 +101,9 @@ properties:
   max-speed: true
 
   firmware-name:
+    maxItems: 2
     description: specify the name of nvm firmware to load
+    description: specify the name of rampatch firmware to load
 
   local-bd-address: true
 
-- 
2.25.1


