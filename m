Return-Path: <linux-arm-msm+bounces-35011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E319A46B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8698F28228D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD421802AB;
	Fri, 18 Oct 2024 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HoUDb72q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053216EB4C;
	Fri, 18 Oct 2024 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278990; cv=none; b=eZ670frAOlwVmd5R+6TlA4vRF7vk8L1q5jvHqlv19Rjbkp0dth1vyuRvOAcik74BT5ABA5n/FLWU2DwzN/lgU7ToAXYWtsuwiEi/KQqL1fJDY+h3418JU7J1c9qZjLK/l3WEUqEiLanDzD5/cHwEDqGvIEgAuZCCTJui0fQxlvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278990; c=relaxed/simple;
	bh=8sRXPz6JJyR8sXa6f3CH21IUJbDVkAY6tMrl6yeUXC0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Zm8ZiGVQs+3N/uNKuA+AHdt4gw8mEYIiigEIzylFTZE5fqkLOWl8FxTbblBZVZvyLHg1fnFjg1zcbF/4vqwA6BycpPjV8tB1mVmESi55v43JHngcjeSOXCtH6QGqNSYvO8khxvWrNf1veMNEp2MrlRcMAAzOEprzf1l/yVKsei0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HoUDb72q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9MEWs006586;
	Fri, 18 Oct 2024 19:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8eHTTnDlfhlAftSLOZoZj8
	tc2+Wz71d8+57O+JTluAA=; b=HoUDb72qfSXmKIHVrA2Z2YxvpsZT+AkkaaKMOB
	HbzrkRQ03mJGr6tIqL9jouGYPO0vvC/hv5irXXBmzZkLc2M0L3prgo1lQG5PfxKy
	fbAefwe9afHGYb5ZonVl4+UKN3RnhuLlZy07FJYVrfwv3wnID/BG4/97zmShP6qd
	navECAbbs/M5EZQ+/cWhnrWdnPl8RC8Kl3gd4Tis+EFgML8LFiyxzRreTurH7qYS
	/C4TRF3PhhPss3do+nPPIVzCxHE6A/BcMv6v3mJkjoS35BOTMIU578NICQ+Nt0ps
	1+6LFrUxcbxiOYuzMM9y61DbGRnGO2HM2ulgtCe4ALUKFYEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bmys9qsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:15:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IJFoO5007294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:15:50 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 12:15:45 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 00/11] Add support for videocc, camcc, dispcc and gpucc on
 Qualcomm QCS615 platform
Date: Sat, 19 Oct 2024 00:45:36 +0530
Message-ID: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANizEmcC/x3MQQqDMBBA0avIrB1IpKbUqxQXYZzYoTGxE5GCe
 HeDy7f4/4DCKlxgaA5Q3qVIThW2bYA+Ps2MMlVDZ7qHNdbhj4qzPS4LUsz0pZw2zTGyIoXw8uy
 f3hgHtV+Vg/zv93s8zwsn932RawAAAA==
X-Change-ID: 20241016-qcs615-mm-clockcontroller-cff9aea7a006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Stephen Boyd" <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Taniya
 Das" <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EGIlBdbIjUCseKlcTZWdcxZK3TqPtIS5
X-Proofpoint-ORIG-GUID: EGIlBdbIjUCseKlcTZWdcxZK3TqPtIS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=820 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410180123

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (11):
      clk: qcom: Update the support for alpha mode configuration
      clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
      dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
      clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
      clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
      clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
      clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
      arm64: defconfig: Enable QCS615 clock controllers

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   60 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   35 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-qcs615.c                    | 1588 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  174 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
 drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 17 files changed, 3943 insertions(+)
---
base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
change-id: 20241016-qcs615-mm-clockcontroller-cff9aea7a006

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


