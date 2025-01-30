Return-Path: <linux-arm-msm+bounces-46584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16614A233D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 19:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89CDA7A2F50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 18:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E881F03D7;
	Thu, 30 Jan 2025 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xij4tm7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4231EB9F8;
	Thu, 30 Jan 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262127; cv=none; b=TtyAgY1lepUDSYM/ZR4MhP8z9GqnTYfUy9+QDrH9JhjIp49Hr0iU4kCIXxm0e5bdElTfgLGDq0vhX2eBBZEhpIMJX2ts1EHQIE3VXTmiO8LJ9kphUQt63cdiK/NdmTXYWJrG6tY0sbGfjgbNSlhUaaIgRsbRrqOe4vc5bNcmRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262127; c=relaxed/simple;
	bh=GlABbLQNdlEWm8DmN6/oAlkh9Ch4kaIssmUYP35PdPI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R+uC9JDHoJJNmriXb/Q1EVrX6MlGNsWzkt4dClbEg/wtNfUN57n1VWrFmBjwmZMHXY9HRPN9qM7G+T+bTWsEJdxly8dTU+Z33HQ36rb3jQTFqjb4LBsSpdYNPtRm4qCOXLNgh+y+/DcDyaj9Hq1HzjdNLhUmaAOcx6sCz2u7yt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xij4tm7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UD45UZ012012;
	Thu, 30 Jan 2025 18:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=599FXlmZ3EgyEUHHKK5D1A
	8GuodYRYwTvseL6b1+1ag=; b=Xij4tm7pC0i+sqJTSVX+/iaOIiRw71vJECyVD8
	JakvwonwwMqxJm3Gs0BE+sAriS4mtFTIgxTyuBBR7QIqGPpm8gOnmyHJFqPYLqDB
	EMc8aTsQPN87/LthnC85yTtoJC+gZj8B85hEjTWz4dKNCokAjYHAR2p8J2J8NnrO
	nZE4iLRzuYoA2wRXLhhPqoT93VYowG1SdTgKbVMAwAmvNettyEVsL2LP2v6O5ptj
	xsYRAV8NHxElhjTbskbUkOALJ0QHX0coOm8kPSLiBsTWGk+HYn4UEy8qsDF/jw0V
	x8N197UAqF05Lnuq9hKYBt4uLZUB96o+dCZpetLZqKG0QMCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g9ys0ux8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 18:35:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50UIZH1D002264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 18:35:17 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 Jan 2025 10:35:13 -0800
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>
Subject: [PATCH v9 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
Date: Fri, 31 Jan 2025 00:04:32 +0530
Message-ID: <20250130183434.2394058-1-quic_janathot@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4eO3I_pjnoOgNmnmE_iNX6F0SlBirign
X-Proofpoint-ORIG-GUID: 4eO3I_pjnoOgNmnmE_iNX6F0SlBirign
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=744 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300140

Patch 1/2
  The new state node qup_uart7_sleep is causing a dt-check warning because the 
  base DTSI (sc7280.dtsi) is defined with individual pin configurations

----
Changes from v8:
* Fixed the dtb-check warning  in P1 and removed tag: Reviewed-by
* Link to v8: https://lore.kernel.org/linux-arm-msm/20250127064940.1360404-1-quic_janathot@quicinc.com/

Changes from v7:
* updated P1 & P2 with tag: Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 
* Link to v7: https://lore.kernel.org/lkml/20250107134157.211702-1-quic_janathot@quicinc.com/#t

Changes from v6:
* Elaborated the commit message with more information.
* Link to v6: https://lore.kernel.org/lkml/20241223135700.22660-1-quic_janathot@quicinc.com/

Changes from v5:
* Update the wcn6750 required properties in bindings.
* Link to v5: https://lore.kernel.org/linux-arm-msm/20241209103455.9675-1-quic_janathot@quicinc.com/

Changes from v4:
* Added reviewed tag by Krzysztof in p1
* Updated the p2 commit message with sw_ctrl and wifi-enable are
  handled in wifi FW.
* Added blank line between the nodes in p2
* Placed the structures in proper order in p4
* Link to v4: https://lore.kernel.org/all/20241204131706.20791-1-quic_janathot@quicinc.com/

Changes from v3:
* Defined the PMU node and used the its output to power up BT
* Used power sequencer for wcn wcn6750 module
* Split the patch to multiple as per subtree
* Add description of the PMU of the WCN6750 module
* Include separate UART state node for sleep pin configuarion
* Link to v3: https://lore.kernel.org/linux-arm-msm/20241022104600.3228-1-quic_janathot@quicinc.com/

Changes from v2:
* Sorted nodes alphabetically
* Link to v2: https://lore.kernel.org/linux-arm-msm/20241010105107.30118-1-quic_janathot@quicinc.com/

Changes from v1:
* Corrected the board name in subject
* Link to v1: https://lore.kernel.org/linux-arm-msm/20241009111436.23473-1-quic_janathot@quicinc.com/
Janaki Ramaiah Thota (2):
  arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
  Bluetooth: hci_qca: use the power sequencer for wcn6750

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 167 ++++++++++++++++++-
 drivers/bluetooth/hci_qca.c                  |   2 +-
 2 files changed, 167 insertions(+), 2 deletions(-)

-- 



