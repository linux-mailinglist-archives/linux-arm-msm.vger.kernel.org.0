Return-Path: <linux-arm-msm+bounces-48842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE7A3F06B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDC827AA652
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6831204098;
	Fri, 21 Feb 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AptHHLxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0291F4299;
	Fri, 21 Feb 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130522; cv=none; b=TxalHQ/HQwlVAhVPFgl7RZGskm+97VeOB/YEczlTusLwoubz1mC84fXarharhXqjPm6vdtqZbNc8glOV6Vt4+hidr7sF4FArQA+kIxZPikYN5y72cjt0ZV23bm+cGIh9w5xL3wCHdhaGcDxUNqQNqC7Xm8wNn+nPbMI++XBBQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130522; c=relaxed/simple;
	bh=Yvo8933EZoIcR8I7kToxMz4CyMyp2BlcbqWrO/HbTgs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PvDsvj6iNgV+90vEfYT7F1vcUHfNDMND8zFwsBTPdL5S6mQAjcUcLTCe+bLtpeB7ONTBpOL7DmvWc3onf9I3uPsQyfQiFcMSd7tNivkRsCry1CCkdFgq2ZV2JcUFJA8VyVXpFxuHGZ0Ez0AXMjnUI/rJdD86RS1PFoNwBBpQowc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AptHHLxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6P0to020486;
	Fri, 21 Feb 2025 09:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d16QP9veh1dZ1LH8WnDDq8
	TlFxirQr16FIo86HVzOUc=; b=AptHHLxg4ts26Hu1gzyJevNm0K53X9gTDtFAhB
	HgQ4n2ilfId2mDLkPxPaiCjf8c22JgYyHqkd2788sVdwOWeRHd78wVvf8em0ghX1
	FLVVoE7foQ3rFio4OKyCxkcQ/g/WVHle5aoImWyuqKww+Q7Q3j3fC+UsZrv6vfJV
	kXKou0QAxV5wMllntw6K9cwbuRPILAqpDAb7Lbye91iztwqR0MmC1J2h5RMdhVWQ
	feFcBQ6BxhxEOvoRWqtRDqKngL9zGVYpDxlR7p+dx7Tstn8Yuw91kCwLKUdb/19o
	NXmzVXFbREp5IrFV+igt3mO6HpYzvfNtsZmS8ZBr22+PHCpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t45nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9ZGsd028032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:16 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:35:12 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v5 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Fri, 21 Feb 2025 15:04:53 +0530
Message-ID: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1IuGcC/3XNywrCMBCF4VcpWRtJcyO68j1ESpNO7YC9JTUop
 e9uWlwo6PI/MN/MJIBHCOSYzcRDxIB9l0LtMuKasrsCxSo14Ywrxpmmt6EMoRhdq+WBFR4CTIF
 yJmujNeelciSdDh5qfGzs+ZK6wTD1/rl9iWJd32DOf4NRUEaZzV1thbLCwGm8o8PO7V3fkpWM8
 oPh7A8jE6NNZaEyykmjvpllWV5NEyL+AQEAAA==
X-Change-ID: 20250206-lpass_qcm6490_resets-204f86622a5c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6HKIqpWYjgyIfzvrjhmcUUwgxrybwcT4
X-Proofpoint-GUID: 6HKIqpWYjgyIfzvrjhmcUUwgxrybwcT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210073

This series updates the low pass audio clock controller driver for reset
functionality. The patches are split from the below series.
https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

The QCM6490 board requires only the reset functionality from the LPASS
subsystem. Thus separate out the driver probe to provide the same on the
QCM6490 boards.

[v5]:
Changes in [v5] compared to [v4]:
 - Update the commit to describe the need for the new qcm6490
 compatible. [Krzysztof]
 - sort the compatibles. [Krzysztof]
 - Link to v4: https://lore.kernel.org/r/20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com

[v4]:
Changes in [v4] compared to [v3]:
- Update the documentation bindings to keep the clocks, powerdomain
  constraints. [Krzysztof]
- Update the driver to use 'of_device_is_compatible()' instead of
  'desc->num_resets' check. [Dmitry]
- Link to v3: https://lore.kernel.org/r/20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com

[v3]:
Changes in [v3] compared to [v2]:
- update to Documentation bindings adding constraints. [Krzysztof]
- split the DT patch for "Update protected clocks list" for QCM6490 IDP
https://lore.kernel.org/linux-devicetree/20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com/

[v2]:
Changes in [v2] compared to [v1]:
 - Updated the lpass_audio_cc_sc7280 probe to get the match_data for both SC7280 and QCM6490.
 - Separate regmap for resets [Konrad]
 - Split the lpassaudiocc compatible and GCC protected clocks list changes. [Dmitry]
 - Link to V1: https://lore.kernel.org/all/20240531102252.26061-1-quic_tdas@quicinc.com/T/

[v1]
  - Add a separate platform driver for QCM6490 resets.
  - Add device tree changes for protected clocks for GCC and LPASS AudioCC
    compatible update.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com

Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com

---
Taniya Das (4):
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  5 ++++-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  5 +++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             | 23 ++++++++++++++++++----
 4 files changed, 33 insertions(+), 5 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-lpass_qcm6490_resets-204f86622a5c

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


