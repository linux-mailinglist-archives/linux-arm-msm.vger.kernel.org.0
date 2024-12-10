Return-Path: <linux-arm-msm+bounces-41247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBD9EAB8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B70C1188B3FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C88E231C90;
	Tue, 10 Dec 2024 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0SwLQ4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB123594F;
	Tue, 10 Dec 2024 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821907; cv=none; b=p2AK9VFBd9pjcbfD6Cc9c8oh9VYzcNl5c01sd6G1hyLWV7/gCxEWcKYDawnlB2N8bygdP9e4aCDAtaQUgdrRbnQIj52tBid13LO2YanmlcuUEOTWgIevUCBwVhKBXjM0rnlTVy8YQHHbCPObpVD85wb1UfBM69s+28DoMhWM5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821907; c=relaxed/simple;
	bh=D6ucRDBS8v0B0OiXNqYMqX4QXovKQR9G5ZIJ+dErJOQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VkZa0KVR5SamDxmz7KJ5entMClWlkxzolZ+163Qp7t9zfIoecrvjaubb6SMmvmjxw8qbecHH+zhlx/VBsEvcRvq7v7A4ZM2YjGvHNtRFgJ2xKwNAA59jBeYhpMWlthFywVreIi53jOBnVryT9gSToxE6QrCu0dje6uCc8EKoshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0SwLQ4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA2j2ts006932;
	Tue, 10 Dec 2024 09:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/QzlSKxhQ5Rn1ZZHcA30M
	caNc+LMnL2fFRHCaw3Z5M=; b=P0SwLQ4NqzrqtdWLkgDxvjWkeoTSngcDrxljxR
	bhcPgKX8vTNNR/rpaqPuSUw+JhQ4750s0BFZLczhoeCtKdYThqxobU8sr4V66sBx
	q3OE4v5PpzFjl0QmbZhif2/oePG/K2GjB2A3bv8AOjl2fqQFcAMFJbrfeFGMrreW
	ZVuZ4rkIG6dTWhOaz0mqrYg/NUspKglSEZyjgbBjLevLdvDw3Y1uCWAcj3K/kUi8
	6kQppplJYepPge3X2gdduDcd9UOlvVhvMAhJcOy/aejmW6AOzrw4Inep0qgjjxy0
	q/kFm3CC4CO75cEaNsTyY1OwIJZ5TQDW6lNHrUcIFqcs+2Lg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bjrnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9BfU7002221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:41 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 01:11:38 -0800
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: [PATCH 0/2] Add support for DisplayPort on the QCS615 RIDE
 platform
Date: Tue, 10 Dec 2024 17:11:04 +0800
Message-ID: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoFWGcC/x2N0QrCMAwAf2Xk2cBSVmX+ivgQmqgBWWtTRRn7d
 8uejnu5W8G1mjqchxWqfswtL13oMEB68HJXNOkOYQwTBRqRRVDMy5N/JdeG/i47W8ZX8iNFlJ5
 J2qoqUjxF5knDPAv0ZKl6s+++u1y37Q/1e+SKfgAAAA==
X-Change-ID: 20241210-add-displayport-support-to-qcs615-devicetree-1575aa4e299d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fange Zhang
	<quic_fangez@quicinc.com>,
        Li Liu <quic_lliu6@quicinc.com>,
        Xiangxu Yin
	<quic_xiangxuy@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733821897; l=1345;
 i=quic_xiangxuy@quicinc.com; s=20241125; h=from:subject:message-id;
 bh=D6ucRDBS8v0B0OiXNqYMqX4QXovKQR9G5ZIJ+dErJOQ=;
 b=vjdUTJT6D3HHzE26qV/psKIYerx36lF8aK2n+f3p2lkCfjzFQSeIdojJNWxsxZQym5xJd6Jvj
 1d0zGb5Pe4oAYOyTr4X3YtnISrZ7iWq7Me20dEaqgg6lo7BbmuPqhwI
X-Developer-Key: i=quic_xiangxuy@quicinc.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D2LY2VYLTwQm5jsRSiQ-gAY4hJAJVlhd
X-Proofpoint-ORIG-GUID: D2LY2VYLTwQm5jsRSiQ-gAY4hJAJVlhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 mlxlogscore=829 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100068

The patches include:
1.ADD DisplayPort controller and phy nodes to Qualcomm QCS615 dtsi file.
2.Add dp-connector, config hpd-gpios which used for Displayport hotplug detect.
3.Config lane mapping through data-lanes prop.

This patch series depends on below patch series:
- dispcc
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
- dispcc dts
https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
- display
https://lore.kernel.org/all/20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com/
- displayport driver
https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>

---
Xiangxu Yin (2):
      arm64: dts: qcom: Add DisplayPort support for QCS615
      arm64: dts: qcom: Enable DisplayPort on QCS615 RIDE platform

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  30 +++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 107 ++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 2 deletions(-)
---
base-commit: 68586ffc0ad47448d0c00a72ba61db66b127c23a
change-id: 20241210-add-displayport-support-to-qcs615-devicetree-1575aa4e299d

Best regards,
-- 
xiangxuy <quic_xiangxuy@quicinc.com>


