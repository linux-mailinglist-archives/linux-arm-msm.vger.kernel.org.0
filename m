Return-Path: <linux-arm-msm+bounces-44348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF38A058F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A96957A247F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64C91F1906;
	Wed,  8 Jan 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hlmzO1xv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73719D090;
	Wed,  8 Jan 2025 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334068; cv=none; b=kUklZvouDUHxT4+N7GnR+/FvCP/Sy4h0zM3ZWXpFPrF+pjSQHHIymb17CaKRzPsah7dbVykIfbWOeZehg+CHlvLxDq4MIeYcTD1TFUXV5okCUJjwrAzSFll+2z6eu5C/CIcSgaaCXl+SxUAKRUjyE00bTeNJ0WxTmEtJtfxRsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334068; c=relaxed/simple;
	bh=L60VLcNzBtyJj9RVSMqxb1ScNRR+Q5rqLRt830aCL48=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uJk4++RwQxIHwF/3Rr5N5Hq6zkgWu1Ao8kgDn009oOR8GnU3Zfc5SSx+yBMwoiKwHXLagXJLei8aAbUyMYI3YwcJmgCC2ir83Q6NvpaV1d59yYnoGWbt/AMGlUx39cmckhbMUUxIP6T9VGd+XsVJh1p+Hk9L3j1S9Y87wjxx5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hlmzO1xv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ad1P7002931;
	Wed, 8 Jan 2025 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qsKgFz2RzwuQGYangGC2P+
	wbXaCFZlAjxz8oNwbuUr8=; b=hlmzO1xv6yDq+AlJ3AScU7sdHxCyo/516vmcC6
	ArNjX3fcKnuL/SE60zNf3AzgoBIy4zVTBUkY3s92HE9KYxxzmZ3ORklPhB1BrwXu
	gN7SEfqVJZHT017eb0mrrIM6uUtiLgqctvd9kFt7h1GmakAlZCvRC/S2yuxTBMP9
	MQahQ9xV6EYJDgT4WO/2WGXh1rlmed9rZ4tysLLBR4jm1ScMdnPL4mXPKjDDXRFE
	QrJB9yyXitafxY9NRhWL9GyVZbTsKekhYvp4O7svAp6KZ4joH/At9Sxa1mXABCtc
	F2WasL4eF4kdpCcB8WNdDDuqSucEuRGn7/sS4lWFWNdVDkaA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441md30nnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 11:01:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508B11gx023684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 11:01:01 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 03:00:55 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH v3 0/2] Adds SPMI bus, PMIC and peripherals for
 qcs8300-ride
Date: Wed, 8 Jan 2025 19:00:16 +0800
Message-ID: <20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee94642279ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMRafmcC/5WPy2rDMBBFf8VoXRW9Iile9T9KCdJIqgcS25Fc0
 xL875WdFJJds5jFHZgz515IiRljIW1zITnOWHDoa5AvDYHO9Z+RYqiZCCYU50JQF0KhZTwhrQN
 0rOdjF7M7FpqGTM9QrGSMMidBqZ2FZCKpsDHHhN/bo/ePa87x/FX/Tdcl8a5ECsPphFPbJGU1W
 Oe49pYbkbT0IYBhnGvHwO6NM0kmJsi9Z9vcLO2fxgF7nNAdD2EqWNVl4nsJkQfTzoqsHh2Wacg
 /W/+ZbyLPVp05ZdQbsQMhVEhJvdVegD281jar4A2onwIK65JV4K1O9gG4Ws/i3tT+GywqmDEOz
 MdgQJtH8LIsvzmfhk0QAgAA
X-Change-ID: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736334054; l=1888;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=L60VLcNzBtyJj9RVSMqxb1ScNRR+Q5rqLRt830aCL48=;
 b=wYGAVaPFo/Vip4IOCd1qq8WuQTxB0g/1fy5gAKsbwKCzm4VHrmLWb4B5ZDTk9HYWeScYlLxid
 I7O01O7Sk1HDSRh5bn2FPr9043gUveh0D//eB3MdWugdJONZHuXbDjn
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KlrXgbvOWr1YhzM0fCfv_vkgjaUcrkhR
X-Proofpoint-ORIG-GUID: KlrXgbvOWr1YhzM0fCfv_vkgjaUcrkhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=824 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080089

Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The 
qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).

This patch series depends on the patch series:
https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com/

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Changes in v3:
- Created qcs8300-pmics.dtsi for PMICs specifically in case there will
  be more qcs8300-based boards.
- Rebased on https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com/
- Link to v2: https://lore.kernel.org/r/20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com

Changes in v2:
- Fixed comments in community.
- Added arbiter version(5.2.0) in commit message.
- Link to v1: https://lore.kernel.org/r/20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com

---
Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals

 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi | 51 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts   |  1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi       | 22 +++++++++++++
 3 files changed, 74 insertions(+)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
prerequisite-change-id: 20241128-qcs8300_initial_dtsi-ad3f193ce1d7:v4
prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


