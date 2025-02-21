Return-Path: <linux-arm-msm+bounces-48967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B84A3FD07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46566164C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E650424C684;
	Fri, 21 Feb 2025 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TvzXkccs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10981728;
	Fri, 21 Feb 2025 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157844; cv=none; b=fw/FVAiJexTFxQeVVoFvKxY5oT7sByxgLdIvo5kkqJILpff5KLMjm/+o3Wkqh3K274E0Yt/4jrsH+brwvPwhGGJKBod5Z4LIbAWhOkuhzJzgI+iVUkilEuyacVYpyXwvimAbcAWr5LAEScIvozjTLR3CES3Gz5ClOA5GnADqGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157844; c=relaxed/simple;
	bh=O2KxljMLsiJkvk1x1mV/7tfMvB7XKbaHrSbExGg+UZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fc732dVJs9wyxHRWtAIa75qx9bgjA7756yzgrnzcfedNxnlV6L3jaqtcQtugO4u1QciljoMdfno2WYCiAxYA2Dk890VATrlvPgeyfNpAqhdsw9G2x7uY5mgI1riJgRQMRc9xxxo7h2W79U45EL5beDnTUYFJcvzpx7hoWmG8L3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TvzXkccs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCoZnL012227;
	Fri, 21 Feb 2025 17:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YGZR5bb4Yo+zoe/67pesCM
	UP0GY+ikdMoIV3QP+AqIc=; b=TvzXkccs4mfZ/kC4XZGdCdBtZn3vUdw4nsAC4/
	VbNGM8KpcSGrPVNZtEcOg5IX6pFK9NY/5xdI8J/L+Diy11L2K2IqzfBqNImATGOa
	vitfWzbI0BFzq1PHy6GruRBOV6+kAMHvSsQV2oNzq931bJhgncRklSAPti0yd0V8
	hh14vXtrSD/hveH1UL+etnhJMfVQDJcKEw+OGWjNVshDOAKEm8/QRC8AIi9UY2jI
	FQXWX6vX1cgoEVoYOaE1ynwZkp5mdjxBztK+icpJ9vpl3ZJ2HkrSCQkSEwtjhAtp
	voWfcmgjwRB4X/BOtdLgUYl0dx4NYMePn3dGscLv/bRouvLA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1tsr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 17:10:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LHAaw7018264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 17:10:36 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 09:10:32 -0800
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_janathot@quicinc.com>,
        <quic_hbandi@quicinc.com>, <quic_anubhavg@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/1] Enable Bluetooth on qcs6490-rb3gen2 board
Date: Fri, 21 Feb 2025 22:40:13 +0530
Message-ID: <20250221171014.120946-1-quic_janathot@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZDP17XihiEKhjL8PGY0kSh2PGUnjlsnQ
X-Proofpoint-ORIG-GUID: ZDP17XihiEKhjL8PGY0kSh2PGUnjlsnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=661 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210120

Patch 1/1
  Addressed review comments related to alignment in patch 1

----
Changes from v9:
* Addressed review comments provided Dmitry 
* Link to v9: https://lore.kernel.org/linux-arm-msm/20250220112945.3106086-1-quic_janathot@quicinc.com/

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
Janaki Ramaiah Thota (1):
  arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 171 ++++++++++++++++++-
 1 file changed, 170 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


