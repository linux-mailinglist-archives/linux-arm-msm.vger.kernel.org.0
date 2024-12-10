Return-Path: <linux-arm-msm+bounces-41329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4899EB48A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B8B167FDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C21C1AB4;
	Tue, 10 Dec 2024 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HtTUKGxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63E1C173F;
	Tue, 10 Dec 2024 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843876; cv=none; b=sigXV7P+u5/TyJEhzRlg0jR4IvWgDLYaMkga7CnfDaXs4YKdLjweRrb49r4BVnN6s1Fb1T6rZCRQYlq8TzLrAb4SMLAXWRaU0lk84XidGZMPQJ+ciQlsqS/awjflQsFJbJE48t4RbkqO7VL71ldlkQS5bbeBfB6hwW/5N04T+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843876; c=relaxed/simple;
	bh=/PeGRqRFynm+jdz+IzuH3g5meFjWDE80+ziUXDeEDNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXorwUZSvBhCmcTvbD813WhcUph42GOtwcoXHNbSBEXi1LDVpu1EmG9CrQlaGAz0Qor0wltIXXcEQxzBihCOIcNJ09jjgvH3iW7F9/3TErSAsJ5/QrQt6ffzr92UpbAwRGOqX1iaSgNfDM1mRSsyx+SP2fe36en4BzZA1k+GFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HtTUKGxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADaa17019597;
	Tue, 10 Dec 2024 15:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rlN1lGzUAwSQi/4asiMCnXvAR8eN6Qe35fSnB1yc1vQ=; b=HtTUKGxPk6y4jxQD
	u3DBKEDPz/s+IlNBlam9BYbkApLhqPj/cCO+KQYxJRkW66FjF6Lv4oDBp0apHAFx
	cA6rlWhDp6aCYG5ZvciSYXW0IcUh5kaPwAOFi/aOepsMdYpl+fpbyrvqqEO0rFev
	Hx2Ts9h5ChrZYTQ3Bor2+lLxn5ujp5Uys9Htd6laSSgYsMQOfQihFnCI1FNOiYC1
	IR3R9wKZM8FqwqLYvLjVFGYIBu5rNoIZWGoRQO3SFBOWGNlZ36uYHYpxzo1FniMy
	XA4Yhmtb9zwZWBWQL13CI81CQAr7KY3CD25BmLQGmaJ1UUM9kfuQ2bUxOGO6zuv7
	w0FmtA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341bjxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAFHmJ5029854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:17:48 GMT
Received: from bt-iot-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 07:17:44 -0800
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
Subject: [PATCH v4 4/4] arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node
Date: Tue, 10 Dec 2024 23:16:36 +0800
Message-ID: <20241210151636.2474809-5-quic_chejiang@quicinc.com>
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
X-Proofpoint-GUID: Mv7cYIsAHEMDP4-28FaFwIcZGqtTZXWl
X-Proofpoint-ORIG-GUID: Mv7cYIsAHEMDP4-28FaFwIcZGqtTZXWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100114

The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
QCA6698 shares the same IP core as the WCN6855, it has different RF
components and RAM sizes, requiring new firmware files. Use the
firmware-name property to specify the NVM and rampatch firmware to load.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 3fc62e123..e7fe53d95 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -857,6 +857,7 @@ &uart17 {
 
 	bluetooth {
 		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
 
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
-- 
2.25.1


