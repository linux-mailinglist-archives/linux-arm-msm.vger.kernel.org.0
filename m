Return-Path: <linux-arm-msm+bounces-44881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F85A0B677
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 877D4163DB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ECF2045A5;
	Mon, 13 Jan 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I0gFgAkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E08204581;
	Mon, 13 Jan 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770412; cv=none; b=oItn/etgzaKg154Ne7VSjVDDbTqXQakgkyWzAV4dZH/eAsItaQOIDfEYdxHL7Fp0tMtXts6F8IKK8J96MI2uhipbEKqRyhLZ5blDqVZRS8Wb3GnyalywLtjPIwnj0znnWlKBKziMp2HpNiib46789Ukfs4MyPodhnXyf0nx9oYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770412; c=relaxed/simple;
	bh=u5gMqp1OsAoPuUDbFahY/cYqsDaJykZZMRfxMe8jxT8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IE692H1MS9G/A9ABgWPaeFaqLQ5+XXdfbRMdK7Msp31MKOSSujsyTN5fnWYY4i2US5NsF2/LQEppmq8w7DJo7u6Gt57h6knpvCZgfYgbvsYp8MelubxkoHAqGfztOhBy2hSfhy74ENNgJMbfuGILwiIy7yLL9hC4Z9yNdQgJ4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I0gFgAkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5UXmM013139;
	Mon, 13 Jan 2025 12:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UrIspLkrYxlXL0Tit73bC+
	mhbazKe6O8JARFnZ/HLqQ=; b=I0gFgAkX128BzkOS5RtkbYgQl7F37BYn0wWQ0z
	BBW2K7w9PfmPH1+ld55qGxa9727WAw7gOBoEUD/1VUSqg3tTSKWnn/Nkc/ifMyyg
	OEtJzv7w2wkAINbb6LA8UKKuMnfXid02uJau9msrf+q1EkrxVfy/htx1EVC8FGaJ
	vVtF45nE2Xy+TIcAREJAsZ+LDSGMyD1F6XS3Lr0IIkm4TPBRKnNttqP2YWX8T1vB
	H1yWPPEnn4rWnzfwzAKZES7hu0ZprfOg3j3FBidLzqbmIcRXOHtgAUO7K2c+zHdh
	azO09a5bAUhUYYXjlxZefCKNr3F1tdqUF+KLj9bJx53aRKgQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444vqyh7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCDNvw000871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:13:23 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 04:13:20 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sa8775p: Update memory map for
 derived IOT boards
Date: Mon, 13 Jan 2025 17:43:05 +0530
Message-ID: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEDhWcC/zXMQQ6CMBCF4auQrh3SKRKoK+9hjKnjILMorS0aD
 eHuFhN371u8f1GZk3BWh2pRiV+SJUwFZlcpGt10Z5BbsTLatBqxgez6rmsjSJjBsw/pA95F0OS
 sReqxJ1TlHBMP8v6FT+fiIQUP85jY/XN7RLTabtm6KRsB4fEUusRrcqN3xw0yUU3Bq3X9Agt+T
 16qAAAA
X-Change-ID: 20250113-sa8775p-iot-memory-map-0ca991c818c1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736770400; l=1402;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=u5gMqp1OsAoPuUDbFahY/cYqsDaJykZZMRfxMe8jxT8=;
 b=PK3ZA0vgks1XNwCmJs8StfjRu7J6+ZrzDSM2iHm3qqiA8wI5vk6Ajf30v2MOFR9VK4h5Dwz2h
 /o8xlLzpOxqAJPkDq5D/hijJrlQuKE50ogmAhiHw4GE8VZI7WTskW8w
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xlgj0uvj7BZdOQxpDufklsL-vCBoZT_Y
X-Proofpoint-GUID: Xlgj0uvj7BZdOQxpDufklsL-vCBoZT_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=380
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130102

IOT boards derived from SA8775P have a slightly different
memory map compared to SA8775P. This series applies the
updated memory map to those boards.

One of the patches in this series depends on Wasim Nazir's
patches [1] to introduce the qcs9075* boards.

[1] https://lore.kernel.org/all/20241229152332.3068172-1-quic_wasimn@quicinc.com/

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
Changes in v2:
- Moved duplicate entries to a new dtsi as per Dmitry's suggestions
- Removed hyp_tz_reserved_mem as well
- Link to v1: https://lore.kernel.org/all/20241119092501.31111-1-quic_pbrahma@quicinc.com

---
Pratyush Brahma (3):
      arm64: dts: qcom: sa8775p-iot: Introduce new memory map
      arm64: dts: qcom: qcs9100: Update memory map
      arm64: dts: qcom: qcs9075: Update memory map

 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts     |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts |   1 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts    |   1 +
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts |   2 +
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    |   2 +
 arch/arm64/boot/dts/qcom/sa8775p-iot.dtsi    | 105 +++++++++++++++++++++++++++
 6 files changed, 112 insertions(+)
---
base-commit: 9e06a6867520aed8a65718fd06464b9d2ff397fe
change-id: 20250113-sa8775p-iot-memory-map-0ca991c818c1

Best regards,
-- 
Pratyush Brahma <quic_pbrahma@quicinc.com>


