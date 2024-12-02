Return-Path: <linux-arm-msm+bounces-39807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CD9DFD57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A7AB22DE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDDF1FA856;
	Mon,  2 Dec 2024 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BUDBnT/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F91FA179;
	Mon,  2 Dec 2024 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132285; cv=none; b=YKFuGg/FMtdzrcuM2T7+4/ZNOcNiw1L7sHo3Z8KO5VesGjJSpcv+m+AkY4Qf9ZWR5UNpGvsR6R9Pz92ner21bkU4qGk7PUVxC7jUdr9reTbuFx3IsJwoqMJhOYdgzIeXgTbxo/27zHb/e7Ll86yCSQMk1gW8u7z0R9Udx9Zw9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132285; c=relaxed/simple;
	bh=Ygi0J1wnK+gDWpCXJm6vIxPVKtdwPAgoE5g10mgZV6s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=g35wwQLnl11yOFN+t+Ljm7YPHcgnpEWPg0cRMBR67fbqGa/toN1jcbX3Ex3n7bL9B3l0JsGAyFWSmBH/ercI+25MZIk6Y1aMsuMJEtE8Vn389S7+eMlELigpqlQh1/9u3IXQax7yruGdIlKvsZFYLy8jGnGGAh5kjRU7l/mf8sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BUDBnT/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28fmo4031409;
	Mon, 2 Dec 2024 09:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RpYFWjQqnKepSMv8j67ltm
	9bTQcUrl5Pryr6qwLGITc=; b=BUDBnT/cPuvavVJBxUXyhcATWe893Lu58OMIRe
	B+LWuo+2dz9h7fInZHgY1aXQDVxZdV87WrXTxbt8bNvEHm7MdzM8YAsk+R4RFlOT
	ASC16gVqfzMFyBkBFoJ6EUY5XllfqhtUaZgxVQybQSGWyJdZgJA2fTkvEcJbYvwS
	ZXzdhpyfObBmWAxuhh85gH4E+T/UEaR2q9X+Fnm3I0djKjQIatZLZixs/cZWdlVx
	r0vHozuOKC5rFtP5ts29G41BOqLmT2vb5gC82UCIYy+soqnKE+su09o5hybdoOlR
	85dfTCHEjpWsBhyFIzj42EBwZWHikNr91EDBS/fVuznmOyRw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36cb6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:38:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29bxkw018790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:37:59 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 01:37:52 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v6 0/3] Add SPMI bus, PMIC for qcs615 and fix reboot-modes
 etc.
Date: Mon, 2 Dec 2024 17:37:21 +0800
Message-ID: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANR/TWcC/62Ry2rDMBBFfyV4XRXPSBrJWfU/Sgl6jBpBE7uWa
 1pK/r1yUvogFBLowosx6Jw7d96bwmPm0qxX783Icy6539eBblZN2Lr9I4sc69xgi6rtsBMuxiL
 KsMuifkEM9fmw5dE9FZH6UTyHQqAFELOWYDpnYlNZw8gpvx499w+neeTnl6qbTj+/bevV4oIWc
 XFt8j5P2T1tyssw9OO0qZLNpwRRUyLluoBqPavF411hEfrdLk/rVeROWgIbPXqXPIMzbbApKJl
 aCiFGaiUpj82SaJvL1I9vxyJmOEa6cucZBAhvjEnJGkgy3NUFQ96H2xpoCXfaC+AaXqeiRYqQY
 uA/eOoaHmnNzriYwIX/4FknA5lol5y/eEunM371WO95MRcrNyHVo6GSnuQ5V/7k2ku5UrQitcZ
 YbZBZwTlXfXMB8FKuOnJZ1wo8aaBzrv7BvTyvrlzHZKTuyBv4fa+Hw+HwAcjB/66+AwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733132271; l=4037;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Ygi0J1wnK+gDWpCXJm6vIxPVKtdwPAgoE5g10mgZV6s=;
 b=Myw/nB0PR9HQgHq6KetUW5LnfO9TXRoA2Z+6jmhv3Y7mwJOrqkhQXlns9WB1/p85TDcyHoJ5o
 rQfkv0V7VJHBjSoDR0Q5KQUbtWLUCurHevMOnOnDzZgHAtKejKB3MKs
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OoL3UQk2IaWQrfrKpI7X0nc6e27MV2si
X-Proofpoint-ORIG-GUID: OoL3UQk2IaWQrfrKpI7X0nc6e27MV2si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020085

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
Changes in v6:
- Added more details about platforms in the commit message for "moving reboot-modes" patch.
- Put the "moving reboot-modes patch" before "enabling pmic patch".
- Link to v5: https://lore.kernel.org/r/20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com

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
      arm64: dts: qcom: move pon reboot-modes from pm8150.dtsi to board files
      arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals

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


