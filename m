Return-Path: <linux-arm-msm+bounces-35687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDF9AE6AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E88328BB11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935BB1EABA8;
	Thu, 24 Oct 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BnMxmkjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCF1DD0E3;
	Thu, 24 Oct 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776706; cv=none; b=L1LBV0y6KlSh7gAWDg1MRn2jIlt+5zMfgp77bI8PGPNNNUv1n3bXDww2SwxNuamI05FrvDx5BcEWzJ4f5SZgz1HAu9lWEPRka4977Bekd+cbilI/Nc5z9IpKO0ifJXcDSsfVefn3kujTVQO3ZWXudFXAqWg9UTEOM00vDu2566E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776706; c=relaxed/simple;
	bh=UGT6Z5g6AX7X1dVxk4wpD9q9u8GexpH1M4bkiXVmJu8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QjchomUbGHkpGGUCCfob+HeVN7DiWEYQ51kzWOLeRAlvWg/YLglmAvNqkH1/qx5vJ/wb+IbsBqRyycwpY8YSj3L1tygKjP7g2yqmd7EKBCUR+DmTAI3q6EMruEU4w4MMpTs18S6yLt6nyUEUJPzJ1fK4XE6vugCn7n/LG0rhaUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BnMxmkjw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9KZMS029454;
	Thu, 24 Oct 2024 13:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9feCkEyNUk0ij74zv0Gakc
	g56A4ZFUuZ2E3HJhxDFto=; b=BnMxmkjwuw5Cff9z0RjAAOVHQyJliTRDSR4x7V
	X56M3t9Op0hzSJnBt/5DTcMi4fOWHAbENnz4OQ0ZoAkxXI4wr0wm7WpzHut6TjTk
	YcnYRwHiR4VMnG9eYNQjt+QYv/3Y43t3laPtLPHEyteqAxhDgpzAnUqlNjXIZpjF
	aF6nCtdLj1YNEEvw0pjFUeWIbqygSyAZYHXd4STV+rY1TZYFzc3ZjoMoMeJk4zT8
	E1w2dpompKk+9IIWJXCIAR0MLmNQ2FEg5TlaXohXTCuebQqn4xV4MvchR/fu8jNv
	tn9AHbE/0+FxKx3WvLkesFlDt5KL9dvvQnq+F13z0J1x6lqQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w5tkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODVcFG023390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:38 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:34 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH v2 0/6] Add support for GPUCC, CAMCC and VIDEOCC on
 Qualcomm QCS8300 platform
Date: Thu, 24 Oct 2024 19:01:13 +0530
Message-ID: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFMGmcC/22NSw6CQBAFr0J6bZse5DO48h6GBWka6QW/GSQaw
 t0dMcaNy3rJq1rBi1PxcI5WcLKo16EPEB8i4Lbqb4JaB4aY4sSQyXBib09E2HU4VjO34rFhMmI
 5T6VOIBxHJ40+dum1/LCT6R7c829s1c+De+7hxbzXb8P+aywGCW1aUJEK5XnGlyBk7fnIQwflt
 m0vTmqHqMsAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9K3QUJIWt7aF8AM_liUT-HATXONQdGYi
X-Proofpoint-GUID: 9K3QUJIWt7aF8AM_liUT-HATXONQdGYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=888
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Please note that this series is dependent on [1] and [2], which adds support
for QCS8300 GCC and SA8775P multi media clock controllers respectively.

[1] https://lore.kernel.org/all/20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com/
[2] https://lore.kernel.org/all/20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com/

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v2:
- Updated commit text details in bindings patches as per the review comments.
- Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
- Added the R-By tags received in V1.
- Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com

---
Imran Shaik (6):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      clk: qcom: Add support for Camera Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for Video Clock Controller on QCS8300

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  1 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |  1 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |  1 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 99 +++++++++++++++++++++-
 drivers/clk/qcom/gpucc-sa8775p.c                   | 47 ++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  8 ++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  1 +
 include/dt-bindings/clock/qcom,sa8775p-gpucc.h     |  4 +-
 8 files changed, 157 insertions(+), 5 deletions(-)
---
base-commit: 891a4dc5705df4de9a258accef31786b46700394
change-id: 20241016-qcs8300-mm-patches-fc01e8c75ed4

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


