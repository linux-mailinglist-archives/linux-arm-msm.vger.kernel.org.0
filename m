Return-Path: <linux-arm-msm+bounces-50480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCCA5490E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7EFD3AD514
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D73A20A5D1;
	Thu,  6 Mar 2025 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PcrrXlty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B233204F7A;
	Thu,  6 Mar 2025 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259798; cv=none; b=vA5oWX3ll9P6C9ToPmMi1uiWOjKXgps/USFZvi0Q0UFC+4mKjf4fNk3XyXe4OSCQALWI7c9woBFW0GnNOWAGo2mbSPhLei5c9yU3Ao7Tc/SRoIbhChcEwmqoYYcOA/vdxoFjD1V3GxYoH6p9xMBYLzVp9/mWrsMVlhhG6iu2OxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259798; c=relaxed/simple;
	bh=ZND3hEjYeqhbELs7dwJhenPkw14OV/4AWJV1s8VtDtc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UXLPN9pOF26y/TxO7kSHHnU87Pzvrv9Z6kc0nKZgiHCTpy0CQUYW6u/P9NQQLyNm/4GQ5WXdWSaFM1J9CZf2CotPsftrnw03V3xvxitBc/pDKUdY6LZPerAwcIZf24ug8jZsxA1soaGmIanijvQJgLCFdX56dhrvRE6UZ+CSicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PcrrXlty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52645EmP031237;
	Thu, 6 Mar 2025 11:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N9rqhEYUVXejlm9xlnpG5G
	7GlCfmT1Rjn+wx/2pO/wY=; b=PcrrXltyzw1JroTNx7xDZKfn4y/jj7sVGeewYf
	l+Lpkd+HrrtBCKGsoJ7q5RkY5x6eyuEk+2khD7qrCe5EGSOXg8ZwV2l0P5LRYs9M
	HL1PImEvP/+TVwWboYaCBjnXt5QrFD7CXycQO3UmRSnZUEECkeOVVTpsiLoJ+Lx8
	5diMYZn+4OjpHyeKk/Ffl4IahyKrxEHifiUEo/3TDlG40h/D5DtvVb10Yugt+EB0
	ueSUaEfZ4b0sVUf//2kLXoVjjyakK358KxUulgWcU4oR+bQky4YRjG7M7QCZ66Ds
	j2unoIDrWpdl1HixLXt51TW8W+Jd5hv6JanhxQY7ZR7mJXvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4574ce9502-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:16:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BGUh8004519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:16:30 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:16:27 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v5 0/2] Add PCIe support for IPQ5424
Date: Thu, 6 Mar 2025 16:46:08 +0530
Message-ID: <20250306111610.3313495-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nI_0at5kmODh2zQWazuuypcecvGxvCUr
X-Proofpoint-GUID: nI_0at5kmODh2zQWazuuypcecvGxvCUr
X-Authority-Analysis: v=2.4 cv=bNLsIO+Z c=1 sm=1 tr=0 ts=67c9840f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=e_WfFXnkJZi7GlnV_dQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=771
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060085

This series adds support for enabling the PCIe host devices (PCIe0,
PCIe1, PCIe2, PCIe3) found on IPQ5424 platform. The PCIe0 & PCIe1
are 1-lane Gen3 host and PCIe2 & PCIe3 are 2-lane Gen3 host.

Changes in V5:
	- Dependent dt-bindings patches [1], [2] from series [3] have been merged
	  in linux-next.

	[1] https://lore.kernel.org/linux-arm-msm/20250206121803.1128216-4-quic_varada@quicinc.com/
	[2] https://lore.kernel.org/linux-arm-msm/20250206121803.1128216-6-quic_varada@quicinc.com/
	[3] https://lore.kernel.org/linux-arm-msm/20250206121803.1128216-1-quic_varada@quicinc.com/
	
	- dtsi
		- Pick up R-b tag.
		- Updated pcie node order based on unit address.
		- Updated the dbi address space size from 0xf1d to 0xf1c
		  in all pcie controller nodes.
		- Rebased on linux-next tip.

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20250213071912.2930066-1-quic_mmanikan@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20250125035920.2651972-1-quic_mmanikan@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20250115064747.3302912-1-quic_mmanikan@quicinc.com/

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241213134950.234946-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
  arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  41 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 514 +++++++++++++++++++-
 2 files changed, 550 insertions(+), 5 deletions(-)


base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
-- 
2.34.1


