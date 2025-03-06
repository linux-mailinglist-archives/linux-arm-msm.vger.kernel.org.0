Return-Path: <linux-arm-msm+bounces-50484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD7A549AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85028175C17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6216B20AF99;
	Thu,  6 Mar 2025 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KwOmASA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8120AF8D;
	Thu,  6 Mar 2025 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260861; cv=none; b=qRpBOSxussn/3uQPZxnIrbRe2myOxD6aMME/WdhzAowWhm6YIpm3oww0iRCD1YkPIXYRqPxsCZZmPw+stQRUrZU/Q5Xh4TwAG++WYToJiCXQPyEo5lDCUwHwwG2CIb6sKLlYVAtre/nOOw6mmRYaCpSnSgF/+GE0KvY9vzZJqQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260861; c=relaxed/simple;
	bh=nGIlFjPYnDd6KjV6z/AEdHqnp7KJ+f7+nfAoiU0G0/8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SwPDV3Hfo67uyNI4xcYuoPaGwd6yzCf0hK5Aw47uSGkfREaYZT82qJRz8RVOdQeC0J03VKi0H4kCnMMGqqjyOrnVmtQCDZimPj7IFId7bw11M+a7GC7oN7+Xhng/xC+hoELTCc2ATY7Sbk6Upr07GQC4ZCjncen4IURWMpAhKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KwOmASA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269522S020153;
	Thu, 6 Mar 2025 11:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m38iNQD4koMGK2VXT+LG9Q
	CzgpS3c5nrGPsF+OFZWTo=; b=KwOmASA5DV8ODUd4xZgvQLXf6pN/urZmhJofkO
	SMCUz0NLM8Kw8gOcXmcPBMtOqEhTqMXeI6Q1MpZaZg6dQWyEFpxZIibjHytAjSjS
	kna/WkOKlBWSZP+Wai6lggs3K/eUmP1XtRaISLILBbIOHahyNG35xCyKXIoy6EjL
	4IPQ74/F3ngJEsyF8jKrqKMocyZ4drbpFy2c6+L2rjYl7JAuBKyW4g68gJvZBM5H
	m4q1DifgokZ57Za3LiEVMgi3+4NehODoItMuuYB+fgRicdhhTa3IKM17AUdLV0QX
	PxZ4erfz6Ola1kdSeHrSvVjPPIkNvl5YvyUY/+J7srj6rqBQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuj1kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:34:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BYExZ030294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:34:14 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:34:11 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Add SPI nand support in IPQ9574
Date: Thu, 6 Mar 2025 17:03:54 +0530
Message-ID: <20250306113357.126602-1-quic_mdalam@quicinc.com>
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
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GTzxqXOLvvF-6sqFjlQLN_I6h6dYZdQ8
X-Proofpoint-GUID: GTzxqXOLvvF-6sqFjlQLN_I6h6dYZdQ8
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c98837 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=sZtYx3W4YspbH7VN3wYA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=739 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060087

v2:
 * Added Reviewed-by tag
 * Added new line befroe "status = okay" in qpic_nand node
 * Added "qcom,bam-v1.7.4" compatible in qpic_bam node
 * sorted qpic_nand and qpic_bam entry in dt

v1:
 * This was a part of 'Add QPIC SPI NAND driver' - [1]. Have split it out
   into a separate series based on the community feedback [2].
 * Additionally, address comments. Please see individual patches for
   details
 * The 'dt' and 'dtsi' portions of 'arm64: dts: qcom: ipq9574: Add SPI
   nand support' are split and posted as separate patches in this series. 

 1 - https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-1-quic_mdalam@quicinc.com/
 2 - https://lore.kernel.org/linux-arm-msm/4c1fe789-5190-465d-bb41-3fe1534d2523@oss.qualcomm.com/



Md Sadre Alam (3):
  arm64: dts: qcom: ipq9574: Add SPI nand support
  arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
  arm64: dts: qcom: ipq9574: Remove eMMC node

 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 44 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 12 -----
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 27 ++++++++++++
 3 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.34.1


