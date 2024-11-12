Return-Path: <linux-arm-msm+bounces-37574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359B9C51CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21A71F224AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2DB20C02C;
	Tue, 12 Nov 2024 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ixCZCBt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CBD20C01C;
	Tue, 12 Nov 2024 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403346; cv=none; b=p2evoxgO4oixd1GBOMgDciAFdEWPbz0h2Buj4apJSbDSg9hQOSHlq7xVTZ5tNVrwaRYNiKKCpuTbLfCtQwH6IY6S0ib/xVcACo59caDIZtrKmcy7iNirG9uiNUcrwwxURYwK4Rq1ECTs5gbnobmams7xI9DbgUwSzIqAygB/Wl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403346; c=relaxed/simple;
	bh=iJuIVOuBuZnFPhNNfXUDsCPp+lt4LSt/sALTj5UHlaM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IoKwAbAjUXEOlx2y39Seiwey0zn1lctawZ+JBHCHbAkjtD1I15sK2eoy6sDf/aXK2ILcYc/3iGEwu8msPTNmdsWvjR+tZDUDs1us++HaN8FEXHnnIIbUMeMxJBO26ZqrThGdm8MsQF6zGI4KcIxktEQ0PgQDs7QwG3O0XA1L878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ixCZCBt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1vA3T028090;
	Tue, 12 Nov 2024 09:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6nfNuKmznZz2iyPtYydCeS
	WZFpAGdlrh0f7cxMfDGks=; b=ixCZCBt8cTt8oz4SSar8sjB1tJuRDY2CZ2ZvrQ
	+we/sJOOWJQV3A4YCk18malui/ajrvYCqb5jGnF6LuRvuZ5t+e21TAZMy2Ez8oZW
	IVaMPjEVZ1RquVBRxRI5BtGAPxicyL5ojU0Gegq6TCYmZdA+vIb3J9fjEmxYijqL
	fmADO3PReOPM6rTclogUPUyqx6INCTASBzroZ6fKW0IaNAsYS6VRsqnfmA6l0yqd
	OmbMjQ1FRT8Sx4ZhiEQloMuC/qs3IfBwbophuPQ3Ki2G3Z/WTCS72Z5/OejJQ3pu
	Lnvfia4PjFAjiTyovirTHpp14eBXCi8r1I66sgSzNY9IrgoQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsprh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9MKPE005396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:20 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:22:12 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v4 0/3] Add SPMI bus, PMIC for qcs615 and fix reboot-modes
 etc.
Date: Tue, 12 Nov 2024 17:21:29 +0800
Message-ID: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABseM2cC/62Qy2rDMBBFfyV4XRWNnrZX/Y9SjDSSGkFiO5JjW
 kL+vbJT2oZSSKCLWVyBzrkzpyr7FH2u2s2pSn6OOQ59CeJhU+HW9K+eRFdyxSgTtGENMc5lksd
 9JGWQjOX7uPXJ7DIJQyIHzAokAeW95KAbo11VWGPyIb6tnueXS07+cCy66fL4bWs3iwuAisXVx
 T5O0ey6fBzHIU1dkXSfEkWFRFZDw6RtZ7l4rMme4LDfx6ndeGSNFBwpWO5sQNsY5owRnqLj3AT
 LkVPkTbU02sY8Del9PcQMa6U7d56BALFa6xBqDYHjU1kQY4+PpdBSbt2LAtzDa4SrmXIQHPo/e
 OIenpLSG21cAIP/wasNR6VdvfS84i03ndnXHaHMrVxWuIEpZg0T3Cr+m8t/cutbuZxQEqjWtdT
 MewHX3PP5/AHUVG39DgMAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731403332; l=4041;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=iJuIVOuBuZnFPhNNfXUDsCPp+lt4LSt/sALTj5UHlaM=;
 b=7u8D5eqqwjCESXGgqxqphCOAR7hd7ZUvNTLVycOVGFjTHR0BguLsNyKk8LoPhRpupSeCB4GBu
 2AqsjqQnC3XD4PaB2BILj7V77Q0katKZN/pPLoMMFJeXR8aymZwU8yP
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SQDo1CiYGPjF8NDjjDEoIIcHPicgUUHM
X-Proofpoint-ORIG-GUID: SQDo1CiYGPjF8NDjjDEoIIcHPicgUUHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120076

This patch series depends on the patch series:
- https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

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

Validation made for all other boards:
1.Compile kernel before changing pm8150.dtsi.
2.Copy arch/arm64/boot/dts/qcom as folderA.
3.Made the change in 4.pm8150.dtsi(remove mode-xxx in pon).
4.Compile kernel again and then copy arch/arm64/boot/dts/qcom as folderB.
5.Made the change for 1-3,5-13.(add mode-xxx for pon which's been deleted in 3)
6.Compile kernel once again and copy arch/arm64/boot/dts/qcom as folderC.
7.Compare folderA,folderB and folderC each other.
-7.1 Compare(folderA,folderB): Some boards.dtb files have been changed.
-7.2 Compare(folderA,folderC): The boards.dtb files keep all the same.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v4:
- Moved PMIC pon reboot-modes from pm8150.dtsi to board dtsi/dts files(13
  files changed:1-,12+).
- Removed "/delete-property/ mode-xxx" in qcs615-ride.dts.
- Added "review-by" tag for qcs615.dtsi.
- Changed the title to fit the new patchset.
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
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 10 ++++++++++
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
 15 files changed, 93 insertions(+), 2 deletions(-)
---
base-commit: ec29543c01b3dbfcb9a2daa4e0cd33afb3c30c39
change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
prerequisite-change-id: 20241104-add_initial_support_for_qcs615-6045c281925b:v5
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


