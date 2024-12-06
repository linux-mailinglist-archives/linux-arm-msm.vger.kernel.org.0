Return-Path: <linux-arm-msm+bounces-40637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6099E636C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4384282C84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 01:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A26E13AA4C;
	Fri,  6 Dec 2024 01:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DuvDhpOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5581A269;
	Fri,  6 Dec 2024 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733448962; cv=none; b=W00xukpENP2REqo+aKB+tCOxKptkIzFzcIdFsl3lwsY5QgipS9jBAOnkBz76iohSwmXJgNH6/AuR15D0d0gz9uaegtTlycpoKxt3DNUh7EOowthCQZD4jwUwqVOzGuMdBjnecEEqeL0M842mkL/mssUydP7mcsDmNIkyjv2v3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733448962; c=relaxed/simple;
	bh=PtERP0PLUHtfKnseB+62zQHIiSVmIxwhOm5/12aOQOM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YwGZxckaQC2RqTfJe3N1cxdjGCf4YXgOg/u5dFtAZdDMZtNgewBpFeSNElAh0fhG2C4qNppYFQAoWiXQjSP/8+3Nn64nS2EdzHyaLlXBy+Eukk/csynVzonPRZtRLzJk/r+neCF9fz4LdEJRhwqgehMwCz2N+Oh5sogk7H4xJqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DuvDhpOS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaFPD005861;
	Fri, 6 Dec 2024 01:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vdr/pmkjZa7QLYTEhaYYlB
	UkfgPQISa0x06aT3fNTmw=; b=DuvDhpOSg3hDi2Y2MbyzRqTspjsK0l/n45kNrW
	zkCR6KWdqG0/Eh1jkC24O29P6J+xMQJCuda3J65hciCz4412MPr8nmj50RGbP199
	1eW/TqVGC3EYbHp+qaRBSJdCPYq5TnR8n7KngV6sCfwc8N6c8npKviKcRH+n//hu
	6QJne8kSfN55kF208puLtXP0aEJnAYw4PHmOrtfN61KWmxOd2c3yrj+ygYgmpE/T
	0ZLDxZ5piLymN6z/iJOKZAXp1+7TTYdgOl6gHp2VFJQ6J6OlvTh0kw/QoEYoPxCy
	pO5z6UwUJ5rNFlFBpDilk4G2o79ZJ30XNsObVgcq+JcXTqUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayembt2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 01:35:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B61ZuT7032237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 01:35:56 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 17:35:52 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v5 0/2] Enable ethernet for qcs8300
Date: Fri, 6 Dec 2024 09:35:03 +0800
Message-ID: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhUUmcC/1WPy27CMBBFfyXyuoP8ojGs+h8VQo4ZN1M1NtghS
 oT4d+xkUTG7O9a5c/xgGRNhZsfmwRJOlCmGEvYfDXO9DT8IdCmZSS61KAOXMZ9vLhvFOXijjEL
 P/R49K8Q1oad5bfs+ldzZjNAlG1xfO/4o3GcIOI8wxGBdrExPeYxpWQUmUcntFhet4LKVZieN1
 rLVIOB2J3de6JeWYvZVEwW3c3Fg9dqk/2kh1ZvppIFDJ3hnrPtU2h7e6ecmn7BsM43bDzb98j7
 QeGxW7drND1IX4vkCEZ5RgDsBAAA=
X-Change-ID: 20241111-dts_qcs8300-f8383ef0f5ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733448951; l=1146;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=PtERP0PLUHtfKnseB+62zQHIiSVmIxwhOm5/12aOQOM=;
 b=GInb7MZjrHxSx25OBewHGiQRClEjUXx6TdjHJpmBgmy7+2vOY9j3i8OP/wj82FhBbO6SVS3LB
 eZOP8gblydaB+wAZBhEeffh5KwYtZBFTucsrFa5PwpscoJj84bM5p+x
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4aEHf7HwjjrSWforuHZR4FSQxSV0uver
X-Proofpoint-ORIG-GUID: 4aEHf7HwjjrSWforuHZR4FSQxSV0uver
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=412 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060011

Add dts nodes to enable ethernet interface on qcs8300-ride.
The EMAC, SerDes and EPHY version are the same as those in sa8775p.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/ - Applied

Changes in v5:
- Pad the register with zero for both 'ethernet0' and 'serdes0'.
- Change PHY name from 'sgmii_phy0' to 'phy0'.
- Link to v4: https://lore.kernel.org/r/20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com

---
Yijie Yang (2):
      arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
      arm64: dts: qcom: qcs8300-ride: enable ethernet0

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |  43 ++++++++++++
 2 files changed, 155 insertions(+)
---
base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
change-id: 20241111-dts_qcs8300-f8383ef0f5ef

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


