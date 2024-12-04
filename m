Return-Path: <linux-arm-msm+bounces-40259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B179E3B5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832F2162CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F21D1DF267;
	Wed,  4 Dec 2024 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eZNy5ar5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4381C1F29;
	Wed,  4 Dec 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319413; cv=none; b=NeAj91p81Ss9b8k42gLyxLa3/eD1yMr0VrlzPbW7QqbTE4O0bH7V5IT9pcReR2ZgmBfhq3NKnAZdIkeGE8IcLQNy3TdICmwf4yT2zrNYWmhhfXB4fwZgrA5SirULFv2qi8z+j7wl9GxdKnJEa2Pirqe1fSuSRfzN3GAUNfB3+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319413; c=relaxed/simple;
	bh=ljcYeflpta4LCGvaaPkON2t0CEuP/AhPe1gpJdSesU8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jvlt/eozEOq7zQbqpq6nmCp0F7tuc7i49rPTruvJKa6T6Mh5gNIxhekKbzqdNaMtTgAdBTrFnk/klJ/Vrr4eBJgwpANCio27RSu5QDCPgvdjVj2a5aaZ/spKD6aKD6W1YFYfwQDrgwZZkRYoDyRxQOzyLL6PGv8hM5e8gd+q288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eZNy5ar5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45h3fO010130;
	Wed, 4 Dec 2024 13:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m1tmOZRlXbIkkV6w+FSK1D
	VP4q7Na8G7VwgaikcCC6M=; b=eZNy5ar5fVFl2Ir8qBJ8zgdFE8xxMVCBXegoeU
	mtEXn4jFZ6djtgoyyVcUUH2dFFqPSoKn/GvtFsRKglyP3oT5u75/TTI6eKxd7lsD
	N4KOj5tg5/mgQl22+fFhQuNMauTqzvIi5Zu55Cjf0Ls9nh1iKrj0v1fsRJdfPWCv
	vh5gLidNztdRG5rPiI0mjjUq54ZR53rWo9QUflbm1LIxcm0PbfafI2IZrvFgqaUu
	QqhTtkT7CgLpzzENWZMdLLFhrXm8skbgiMWYW3L+iVULJsU/awbI1ywx4TZwFgdx
	YDvaIc1SljU80ZebWq/8iNTRm/ZOZMZNtb4SpgSJQmnrWfgA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a4by3417-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 13:36:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4Dakw7009853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 13:36:46 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 05:36:42 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] Add SCM support for IPQ5424
Date: Wed, 4 Dec 2024 19:06:25 +0530
Message-ID: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: fKerM7oVc753woZFpBvo6TAsHhe-eNQd
X-Proofpoint-ORIG-GUID: fKerM7oVc753woZFpBvo6TAsHhe-eNQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=642
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040104

Add a scm node to the IPQ5424 device tree to interact with the
secure world.

Manikanta Mylavarapu (2):
  dt-bindings: firmware: qcom,scm: Document ipq5424 SCM
  arm64: dts: qcom: ipq5424: add scm node

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                    | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.34.1


