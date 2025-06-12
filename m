Return-Path: <linux-arm-msm+bounces-61159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D349AD7EFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8171885C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BAB2E0B70;
	Thu, 12 Jun 2025 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PKC3iKPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B521ABC1;
	Thu, 12 Jun 2025 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771516; cv=none; b=RmxTO5qTVXbsXQoIj29KpruC9LFgyoMaopnZahTbyi2u3hmJrHNor+g36zcHbxkmyvkrwgO8SyQRG7tF1uSEi/c3skPHguID7lAnDVGmP6k1PdX1dqbxszujS5Ke+FqHLrOaIgPekLCBETKAFtfqRjuMpiiNfwKbTsKtKz775tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771516; c=relaxed/simple;
	bh=UCmoJIN3PnIxrjeH6Dj0H0MqBwJIGb75XNIGz9od9sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=umEfCCDpnH86h24IB3WQsNM0GNIKuijQ7OAK4xuCCugoOCPj1Vok+o87BSlic04L03dBlkJXrJ/aj4SyoTmWUzlaIOZ+Hl4Tm9QH+2KU7prp/QUB3+gDpaW32z5v7ruEe/46+CnXwFvvKvk9l76jDSWctaj3JoayVEumx41WpUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PKC3iKPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGuaLK027168;
	Thu, 12 Jun 2025 23:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9zUJ4QASD9b5811bOefXsI
	McEI2B4llFlLFwYd1rv9c=; b=PKC3iKPyrDZvRj7ciUnkWDUoIHcIfMFvdUZ3Xo
	QLs43pGk0yygnsA4MhOSE1/TqSjY22IZMgPdzEv8EHTdOtTjTPMLzzM0Sz667sdE
	I24uOxqYpWg7KY9RV1SEpq1BiUh690pNoI6qQ4mi60aQM7yoKGdvQHYjS8+9ecdv
	H/T24v9Da8KHfHf7PDV63GlrVIGax/wvk29VpuA6T7sC5FXjwxsz/lRPNxo5Jv6O
	BTYJh1VLfKap0be2uz8y10FLtm+snfgp+o++GTThXnaZC8RIVbpZOf0YnIq2IUAR
	tpnEUG9fXtXMhHwB6Oo87+DDkBpw/S5fyjDBjkL09zi0IhAQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvj33d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CNcQ49017023;
	Thu, 12 Jun 2025 23:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 474egnstc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55CNcPeq016972;
	Thu, 12 Jun 2025 23:38:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55CNcPrU016961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 23:38:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id AFC995AB; Thu, 12 Jun 2025 21:24:53 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v10 0/3] qcom: Add support for IQ-9075-evk board
Date: Thu, 12 Jun 2025 21:24:31 +0530
Message-ID: <20250612155437.146925-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PoNWqPUswIXl62ntH-v1vDfQ9NBpKsdp
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684b64f6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=2OP31JLycSEo0J8rzGgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PoNWqPUswIXl62ntH-v1vDfQ9NBpKsdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE4MSBTYWx0ZWRfXx67HCsbXGSOW
 EW/Aq38U6/YHkA49CMLtTBrl9fj6atQ1cYAVsR7z6Hq0vzy1ZoxCHh1tXn4Dfi8rczjdsxE03to
 bVbI2ReJRWrY3zdLME1V+/uRreiAC7I8/NWE4GPtVM0RAMgAU+aMRloQbJLztge+Zip43wT0imw
 1G0gEbEhIRtxSQxCxR8yVKu0ojfjkA7lvkkRfLx4tFLeft/dygtIrmKy+c7PhsNcIguxeMkl+2H
 ECyvGw0idcWNTkkurfD/1epF/7SWiFVKFOeRkZI5t01Vh1zt83+ifSdtNwwuJmlHysg8LQnkaLt
 HyZ+gws9k01EeIRleZbqUtCiT5j+pb8qXsD4RC1+laIoH0+OvqxrnUquGMGXaJzgaSuTtasliTq
 SqKsjJXJsK2CG4r1vFuqckCALJSvrQvlY/W/hvIlHltZu/zRSb2JAdYDbyEmbH/RXk4SOd8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120181

This series:

Add support for Qualcomm's iq9-evk board using QCS9075 SOC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

In QCS9100 SOC, the safety subsystem monitors all thermal sensors and
does corrective action for each subsystem based on sensor violation
to comply safety standards. But as QCS9075 is non-safe SOC it requires
conventional thermal mitigation for thermal management.
In this series thermal mitigation changes are not included as it needs
more discussion whether to include the change in DT or in drivers.

Below are detailed informations on IQ-9075-evk HW:
------------------------------------------------------
QCS9075 SOM is stacked on top of IQ-9075-evk board.
On top of IQ-9075-evk board additional mezzanine boards can be stacked
in future.
IQ-9075-evk is single board supporting these peripherals:
  - Storage: 2 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    eMMC on mezzanine card
  - Audio/Video, Camera & Display ports
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
  - Sensors: IMU
  - PCIe ports
  - USB & UART ports

Currently basic features are enabled to support 'boot to shell'.

---
Changelog:

v10:
  - Introduce SoC device tree file for qcs9075.
  - Squash new memory map changes to SoC DT file.
  - After moving memory map changes to SoC DT file, the qcs9075-som DT
    file is now empty. Therefore, remove it and move the remaining PMIC
    changes to the board file. Moreover, there is no point in keeping it,
    since it was introduced to accommodate the memory map differences
    which is taken care by SoC DT file.
  - v9-link: [1]

v9:
  - Retain earlier tags from Rob Herring [2] & Krzysztof Kozlowski [3]
  - v8-link: [4]

v8:
  - Squash UFS support [5] into initial board support patch.
  - Remove uart10 pinctrl settings from board, it is moved to sa8775p.dtsi.
  - Arrange ufs nodes in alphabetical order.
  - v7-link: [6]

[1] https://lore.kernel.org/all/20250530092850.631831-1-quic_wasimn@quicinc.com/
[2] https://lore.kernel.org/all/173142574295.951085.7523517676553074543.robh@kernel.org/
[3] https://lore.kernel.org/all/20250430-enlightened-enchanted-jellyfish-7049d0@kuoka/
[4] https://lore.kernel.org/all/20250528122753.3623570-1-quic_wasimn@quicinc.com/
[5] https://lore.kernel.org/all/20250513084309.10275-1-quic_sayalil@quicinc.com/
[6] https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/

Wasim Nazir (3):
  dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
  arm64: dts: qcom: Add qcs9075 IoT SOC devicetree
  arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 290 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075.dtsi         | 116 +++++++
 4 files changed, 414 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075.dtsi


base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
--
2.49.0


