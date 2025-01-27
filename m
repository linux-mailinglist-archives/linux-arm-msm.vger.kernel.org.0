Return-Path: <linux-arm-msm+bounces-46185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6350A1D0FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023EF163EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 06:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3EF15749C;
	Mon, 27 Jan 2025 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mi99s+KR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEB9146A63;
	Mon, 27 Jan 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737960622; cv=none; b=G4rXrtuHlunc+HjwqNIvRLuwh62n+zzfAbE74x5zXcHcIvButNlpAscjAL5dYoiIgOa3LtUe4cLe9xfakgkktdlBVvJENZBbwdeVv0FoI1hKB5JCHVEUScwA5RpfDymiW6mIeHI/oR8bfXLFnhI5nqR4J1Gf0waztCa9fcRwhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737960622; c=relaxed/simple;
	bh=jKHXqfAoeLi01PeQa5gBWFrRFxlHQrPwyLGliREgJHs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nobjZycXIRXdFjIYFK43+kM7AcJyQa3CH8f/cnz2alxSBh6SCXeCVrK75JdGWBv1yYcRy6FrklLJTVKp2eSHunsyIOLz0SUm7LcLC8Xs5bmG5EITRraP9zJ3ZyOsHZHyjVUtbpwOZCINsceC1hUNpNkbMyQA8z8atsymapYCm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mi99s+KR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4swmf024775;
	Mon, 27 Jan 2025 06:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SP84FYDzoEXwF+/dDWin81
	LYnpDOphTBTpLCliaP7mo=; b=Mi99s+KReN/Ke5OAEozS5xAAPAlR/tj/jzLUFD
	bCAHA/SwwJZ6ql+SPB7WxC/gXo6h8AIycRJ586tNpVoFYX5frLHBtY7UBbfmb7y2
	26EHNNeNfXCdGcVCzPbpI0fPcdY1hTdYOrzHLfgLfcNNUIBfFVhv/N1+nAYgcbaI
	Rk7fIink26p3rZGDO4o5FJDav4rXGahH3GX2HOL3NNevx66zoptlZy2cqjF+I4cP
	OIzr0Z/wBznwJgIwczoDoulz+4n5mob6GbpNxmvjFMIvIEzB81vom+LHbs7P1vtf
	pOAP0gPRMnfcWo3t9kIOSTPUgeDwCj6EfFTXB82t3/4+oPvQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3h2r7bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 06:50:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R6oCnP031524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 06:50:13 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 22:50:08 -0800
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
Subject: [PATCH v8 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
Date: Mon, 27 Jan 2025 12:19:38 +0530
Message-ID: <20250127064940.1360404-1-quic_janathot@quicinc.com>
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
X-Proofpoint-GUID: kpez--dJpPhgollOgozHiNa_q5mplFjO
X-Proofpoint-ORIG-GUID: kpez--dJpPhgollOgozHiNa_q5mplFjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=940 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270053

Resending the below  reviewed  patches after fixing the regulator warnings in v7 P1.
- Patch 1/2 Add and enable BT node for qcs6490-rb3gen board.
- Patch 2/2 Use the power sequencer for wcn6750.

----
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

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 168 ++++++++++++++++++-
 drivers/bluetooth/hci_qca.c                  |   2 +-
 2 files changed, 168 insertions(+), 2 deletions(-)

-- 



