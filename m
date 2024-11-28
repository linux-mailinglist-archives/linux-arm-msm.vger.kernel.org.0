Return-Path: <linux-arm-msm+bounces-39419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56B9DB6F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8107B20A8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7C719AD86;
	Thu, 28 Nov 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JanU/gbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA326199385;
	Thu, 28 Nov 2024 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732794990; cv=none; b=XuHGEi/F5Fdl/JODjE9WyD4LgOwI22xrgHTtSGYmZjoShgBnQwhXtgvcyxs+umxYNRlWulUTZHGxOhHsny1PgERxIkqL9b/1HA4ItZEF2DX7ViFooTWx1iXd8/qsEH+LNwwQaRJv/8468b2Fa8koAc4dlw4NPA4qiUy5RC3h03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732794990; c=relaxed/simple;
	bh=D0JT3Zj7x/ZqX2P8pk9jlaPujnjhQrNTfvJOpJhnZDw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=mGECdT/n+ORGt7IeUR37HZ1nQ76D08J30eCGkwWK17iY/NMxbujMnjW7nD7uYkvZwCg0vtuVehLTxUxoh5cep7X9fkvLO8ZMRlJm4DGtIMVLa9bYxQFp5Qjs8+L60dHJHYm5Xe3ljmyPSVVg9WJLy9SpMqFbVbHGj0Dl7rLANKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JanU/gbo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8TDnZ025351;
	Thu, 28 Nov 2024 11:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9iXJNgogQFBdDrIVykQ0XZ
	o2AP0UMX0yHJsJeP83Ad0=; b=JanU/gboBth7KpHb6WcsozR2Ud/AMWMRQukBHx
	bQ5Sid0/vdnKK/qnBwfDAwkV13tnhHpixqDEfLnXioyQv9jOZQRUspt8dtGYX04U
	zxCWKd6mViWzwf0Fv5yKF7DWnr1J1gJwMitLvI3yZuHdWdOoqFwAsPqI5WUtwR7H
	T6zlCz3P8wq6rF2aV7C2NM/NdmVgZd6ZsZKEyHO3grcIafdw/OwtQvBbma3OqRVT
	9CbpRK2Bq3kScEcRAphH2K4i8L3I1xXcJXFwfT1FyygZJ33MMNGNRcoqUcFuJCRs
	YY0zYJCQUCr0UfXz9EfjauBIYNkV9cW8kZ5WoiVXWeAML9Dg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw2jve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:56:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASBuPgF010767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:56:25 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 03:56:19 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v5 0/3] Add SPMI bus, PMIC for qcs615 and fix reboot-modes
 etc.
Date: Thu, 28 Nov 2024 19:55:24 +0800
Message-ID: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBaSGcC/62Ry2rDMBBFf8V4XRXP6Oms+h+lBFkaNYLEdizHt
 IT8e2WnNA2hkEAXWoxA59y5OpaJhkipXBXHcqAppti1eZBPRek2tn0nFn2eS6xQVDXWzHqfWOp
 3keXjWJ+f9xsa7Dax0A1s75ICyUARSQ66ttqXmdUPFOLH4nl9O88D7Q9ZN54vL7ZVMbugQpxd6
 9jGMdrtOh36vhvGdZasvyWIUgUlbO1QrCYxexqbiLlut4vjqvBUc6PA+AYbGxoCqytnghM8VMo
 571XFlWiwnBNtYhq74XMpYoIl0oM7T8CANVrrEIyGwN1LXtDF1j3nQHO4814Aj/Bq4Q0qD8E7+
 oMnHuEpKclq6wNY9x88Y7lT2ps55xVv7nTCnx7zf97NxcwNqPKnoeCN4rdc/ptr7uVyVrFQaW2
 kRiIBt1xx4QLgvVyxcEnmCholQV1zT6fTF+4omdZmAwAA
X-Change-ID: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732794978; l=3739;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=D0JT3Zj7x/ZqX2P8pk9jlaPujnjhQrNTfvJOpJhnZDw=;
 b=sCSACda/zHM7RbhNuKZXE9CmRzCfBa9VFQGU+15VYObgwj6oQ5MiiIabWOsP/e+izQMRx2JRj
 sPv0qb/Iu7vB4KqHYx64k1lOH5kwd887YM6ZQ2Awpgqf9G6hY4hld/1
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qDH5o-isPgvadvlgbYsXwG3qp6dABSwr
X-Proofpoint-ORIG-GUID: qDH5o-isPgvadvlgbYsXwG3qp6dABSwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280094

This patch series depends on the patch series:
- https://lore.kernel.org/all/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/

Board files changed for reboot-modes moving(all dtb files keep the same):
1.sm8150-mtp.dts
2.sm8150-sony-xperia-kumano.dtsi
3.qru1000-idp.dts
4.pm8150.dtsi (remove)
5.sm8150-microsoft-surface-duo.dts
6.sm8250-xiaomi-pipa.dts
7.sm8250-hdk.dts
8.sm8250-sony-xperia-edo.dtsi
9.qrb5165-rb5.dts
10.sm8250-mtp.dts
11.sm8250-xiaomi-elish-common.dtsi
12.sm8150-hdk.dts
13.qdu1000-idp.dts

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v5:
- Adjusted pon* nodes in alpha order.
- Inserted a line before status = "disabled".
- Link to v4: https://lore.kernel.org/r/20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com

Changes in v4:
- Moved PMIC pon reboot-modes from pm8150.dtsi to board dtsi/dts files(13
  files changed:1-,12+).
- Removed "/delete-property/ mode-xxx" in that pm8150.dtsi has removed
  mode-xxx already in this patch series.
- Link to v3: https://lore.kernel.org/r/20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com

Changes in v3:
- Fixed comments from the community in V2.
- Split the patch into 2 patches(SoC:qcs615.dtsi; Board:qcs615-ride.dts). 
- Link to v2: https://lore.kernel.org/r/20241024-adds-spmi-pmic-peripherals-for-qcs615-v2-1-f262ba243b63@quicinc.com

Changes in v2:
- Include "pm8150.dtsi" for QCS615 PMIC instead of creating a new
  qcs615-pmic.dtsi in the case that pmm6155au is a variant of pm8150.
- Fixed comments from community in V1.
- Link to v1: https://lore.kernel.org/r/20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com

---
Tingguo Cheng (3):
      arm64: dts: qcom: qcs615: Adds SPMI support
      arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals
      arm64: dts: qcom: move pon reboot-modes from pm8150.dtsi to board files

 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  2 --
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 11 +++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  5 +++++
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |  5 +++++
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |  5 +++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |  5 +++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  5 +++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  5 +++++
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  5 +++++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |  5 +++++
 15 files changed, 94 insertions(+), 2 deletions(-)
---
base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
prerequisite-change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24:v4
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


