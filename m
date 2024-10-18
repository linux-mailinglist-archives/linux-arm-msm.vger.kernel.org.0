Return-Path: <linux-arm-msm+bounces-35005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D149A4691
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165AB282EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FD1204953;
	Fri, 18 Oct 2024 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kXS9yW3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373317DFF2;
	Fri, 18 Oct 2024 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278813; cv=none; b=fN9Qmawu9LbNxT5RjiyAo57hJsFWlyg8gcU50eOmv4Ufg/2yDiyw6AeOuyRgrVK5shKS8DbUeb/NhSB0HyhQ6kaxAdur4vA7FLkVwlZlwXQ3U1/siXMvJHjZZrZWL2YNIvdLchL8PVKVjoU2mjQD+jAfzFEHPeXJtu5tyQxai7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278813; c=relaxed/simple;
	bh=EuWCayszf/KolbLdwYjxisUiCZPNkZ+woAjsf6kyiH4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HPdrKvfXsa6jJQWh9gEj0G/4mskCR57FcRCQUnD0b3B9Kouhoa2b9ZILEgncncb7162AhCT5K7VcCCOyGzjP4e+/4KWza22sr9zI+BApMdN7iYP/xlo3rrPL+sQC1H1tZoy9B7LotAYMnnoaKRGpxRAuCz30gdYSjtDFEHCnf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kXS9yW3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IDc3Qk016598;
	Fri, 18 Oct 2024 19:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QU1vAaFNfzV4fowuj2rwJy
	OKtUAvYRTVLlr+gTcmg8E=; b=kXS9yW3AK+Mn2oYceCqCooacwMFElWL60WimUz
	YCMjHPWDGj+ZBw5v36dvdeB9ANCMCoawAOfZhJM6VdEdcT7TD6bWRwRUYwHLpISS
	lzL/xfvd5i1j29hz6dIK9tJf4Mq4kqqhEb7oCzzpsrW/x5E6VPZs4KqCcRVdLxeA
	yn2GzIYlvau09k1Mu+fMenHBeoQVQjcpHamgf3vdtNxgGWbm3O5iDhRM84VPUUtj
	+fM2HUzIQqe/9vVxFwA+7aXwTnk+PYTI6Jy/zEw5dbsiRWJjdTODWrU8Lcx2HSXC
	ArG1ai3UHhbT9l5t96Qup+AG6uZD9IQ5TgJvF5cXOMjpKx6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3paey6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:12:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IJCjFb003260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:12:45 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 12:12:39 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 00/12] Add support for videocc, camcc, dispcc and gpucc on
 Qualcomm QCS615 platform
Date: Sat, 19 Oct 2024 00:42:30 +0530
Message-ID: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6zEmcC/x3MQQqDMBBA0avIrB1IpKbUqxQXYZzYoTGxE5GCe
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XLcRngwYjRmw979QNgxSOzzayZnKsnpU
X-Proofpoint-ORIG-GUID: XLcRngwYjRmw979QNgxSOzzayZnKsnpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=905
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180122

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (12):
      clk: qcom: Update the support for alpha mode configuration
      clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
      dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
      clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
      clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
      clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
      clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
      arm64: defconfig: Enable QCS615 clock controllers

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   60 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
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
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 +++
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 19 files changed, 4213 insertions(+)
---
base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
change-id: 20241016-qcs615-mm-clockcontroller-cff9aea7a006

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


