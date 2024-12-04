Return-Path: <linux-arm-msm+bounces-40269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EF9E3C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9152B28126F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7351F7096;
	Wed,  4 Dec 2024 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z+f9Wlet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6DB1AF0DD;
	Wed,  4 Dec 2024 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321680; cv=none; b=SC94KM6ANRx2Nqvqpxtd5A4Muy1KEOU5CQu7ihS/Y6siLvkVcn5sEY+xWx/bVUaB3mtsNjqTCXmxYOWn4prpbtATmk+HF9wgYYR5ZpsBSYYVKf1j37UbqS5hZF0OsOiusT2dOuz4N2aeyQntoQTB0uSzEA6LZFGPsf2EgWCvpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321680; c=relaxed/simple;
	bh=MDti7bPllJiHrMkEafMYWNSx072qv+rKy8Fhlfz1Jj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dq9/ThwH7pqXMOE7pRelFLjjc6qkMoBVu0cGOV2wlnWTnT4V4TQHTmFW9G5w75vjTg+Xk7WZWquk5reIcXfFaYfkx6HRFeGWqBmefx2+tpw3FrpPciB2q/rWMdUKycptmn0FQayWhec1GYtAKhqE7Gg9TPVgG71aVagKo5ARJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z+f9Wlet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46j1tR030963;
	Wed, 4 Dec 2024 14:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pzbR+osZaDbdaEBknZn1z2
	dHZzNqzcMOUfUL0hgShMc=; b=Z+f9WleteO3BWqbnNJVLpI2fg0LKSP7GuOHm5z
	UbzJgluIuexpBiW/0KETISBcAa6T7TpB3GafsFRs8RDprBf0RGQ9W6qMckLC4FbF
	K2BPb2Q5H8gEmrgsfXwNdkW4DIQn2dnMcw/djtxZN5Exjcy7Iv6ybJNeDj+a0gOm
	D7MArvpL4i21drxK+4ZL+nPCKJ+goM1DqFT06wzQ2lHe8wsLzyIXy0BXXtZDD76x
	pz2jBVCpXEWCCXZfWzaMVTQAnIQVEtYUmajTes0Q7J6TkmiMzw2z/hzt5gxFRxcq
	DQwhjeOQ9hPQOzX3QHdAXmz3THbMA6nLBW7kdXCh6Vxi544g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90vg1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:14:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4EEYQw006891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:14:34 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:14:30 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] Add the download mode support for IPQ5424
Date: Wed, 4 Dec 2024 19:44:14 +0530
Message-ID: <20241204141416.1352545-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nYs55h1bDCvd_5LsPNAq1Eub8FdcAgY5
X-Proofpoint-GUID: nYs55h1bDCvd_5LsPNAq1Eub8FdcAgY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=516 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040108

Enable the support for download mode to collect the RAM dumps if
system crashes, to perform the post mortem analysis.

Depends On:
https://lore.kernel.org/linux-arm-msm/20241204133627.1341760-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5424
  arm64: dts: qcom: ipq5424: enable the download mode support

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                | 6 ++++++
 2 files changed, 7 insertions(+)


base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
prerequisite-patch-id: 61ac27a1827f3c1ccd07515350c06378db1082d3
prerequisite-patch-id: c4165710e51bc7f88970f09e3c5d9b2e4cf7c535
-- 
2.34.1


