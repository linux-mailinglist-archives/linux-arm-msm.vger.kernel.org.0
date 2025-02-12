Return-Path: <linux-arm-msm+bounces-47712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C973A320E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2961653C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12AE204F78;
	Wed, 12 Feb 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gSqaW9Dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65427183A;
	Wed, 12 Feb 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348589; cv=none; b=AJdnOH9A6JCIC2GgjWNJjlbc2qWVufMPpwtEbHQxc/z5BR6KaGvISpzPDljz0ShX48tWIVJD+xjm6VLRtH3XZRo6VzcGg31se7bahaoUN3qFDy3WZ1n+ok/nJSc5vvXSXItyvpIvZaFSTbeOWbZYPMpZ4MT5hW3g6IZkkg1njjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348589; c=relaxed/simple;
	bh=1J1LFJrNymifOsjL685GBaCbJBCdqY7eNcaIUkSjgvY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pZ+awZlxiJi8OMe1KDlIBzNTkQKIAwhDD6UkiArOi8uaQ266I+BKqpLs5ucLjmPgBlulOgSS2lIviw7hkhj8w1aZymqPHhVfTW9Qfco6TDV8B7VfJDP1ry40HXGdbutyv4GNbRU7mzJ7M0CktY3Tr+9eUX4nxgFfmWkleQedC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gSqaW9Dh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8Jj3K007790;
	Wed, 12 Feb 2025 08:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZNkzGbWtTndysD8KUh9Oey
	krMK/oG78PduktA8GsGxU=; b=gSqaW9DhUzeedgqp/I3imm3bO5/jMpxL2T2RuH
	qMvQpsabqO6Jat76f82fTaRoI5BnR3smxCC4PPo1fO2H2vT927qUd7J9BOuY58xF
	6YzZt5kuy7XO8rdR4+n0w1B+ojQMzG2FnjKSS+2A3sFN7tu6G52c2bLpQIgRQCAd
	c7b64N2X4M7HzS3moMfqsYcbFejca7oTk9LzQBMehtgDOv++NvGR5QhouVBfG/9p
	vFXCx7KjtWVHs/+RYU/SwTgR7TMCPbDQnH1ilCmSbJbEXlQfCI8FOvknzKEUffbk
	yalgjcr2e7zZCjWUwfKQhTR5Sv3x04oSsKlzf0zAy28BeU7g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qr0a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C8N39I010427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:03 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 00:22:56 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Wed, 12 Feb 2025 13:52:18 +0530
Message-ID: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADtarGcC/x3M3QpAQBBA4VfRXNuaBhteRdK2BlN+dyQl725z+
 V2c84ByEFaokwcCX6KyrRFZmoCf3DqykT4aCKlAQmvm3al2h19sXmEXWPlUQ5gPpbVErvAQ0z3
 wIPe/bdr3/QAk17ZHZgAAAA==
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
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XZlziayslC3kPOxfMATxAU-uh20kRY0J
X-Proofpoint-ORIG-GUID: XZlziayslC3kPOxfMATxAU-uh20kRY0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120064

This series updates the low pass audio clock controller driver for reset
functionality. The patches are split from the below series.
https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

The QCM6490 board requires only the reset functionality from the LPASS
subsystem. Thus separate out the driver probe to provide the same on the
QCM6490 boards.

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
Taniya Das (4):
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    | 14 +++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  5 +++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             | 23 ++++++++++++++++++----
 4 files changed, 43 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-lpass_qcm6490_resets-204f86622a5c

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


