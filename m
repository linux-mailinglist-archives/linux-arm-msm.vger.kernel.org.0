Return-Path: <linux-arm-msm+bounces-22415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49E9050CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E497D1C20C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0930016F830;
	Wed, 12 Jun 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LmWCfbPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517716F29C;
	Wed, 12 Jun 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189332; cv=none; b=pPF6jn0o7oFLy/uMR5ajWOwA6Ih0C1dtLQErxWLLteAS1ZoJ+IzwMwWKUf/sHrAVx1Sg9qXkjSz+HL0U3oMd30yN4hIDphfV8OIxFFvp14DebDnI+xg5Sqrp+ILBoRXHGwKCRGjcbpEWgYCflC8NVjJpVPkdzt3uMoWhpon9ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189332; c=relaxed/simple;
	bh=PlYH2OwBBcttSkvr8o5/xKWY+A0ZE9cwWl5A68RcHz0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=n8KSChb4FSZPiGg6EDVvkZkep9T11kMKM05qQs/u7d7qIqDRz9P53gjxlXh07i/YfkrwJguOIGZow8t5lkJzw35seaHSwAdTeSOC+jdGIPz0TpAkIo0MkdsiUQLsIhXnydf5fH8tI0YzllIHwL/jyQkN5Rttz2XUhkBSdcZAGpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LmWCfbPV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C4QklN025946;
	Wed, 12 Jun 2024 10:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ncQ6Kepu2XYMg1KEqoS4xg
	xCZZxEeYjYvRff0fzY/o0=; b=LmWCfbPVjfSGihZTEbe3By2AscUyyNWZbQdsFP
	G4UzUsOL89pFcN4bP066sNZuUD8wVnG3jmpGSmnmSgwM2JVJ/BfsdRYznL658IWb
	nThGjUId05EyZKe42Ez4WfbzZym987BTQaJXTKyIg6hCvyqJwPBKZMf9IStNAqKS
	eLfR/zZrSfpwyEpzHfRoHSI9LHR1s4c/V4Js7XTaYrrUZxHRT3RRaBc2qLs6xGKt
	CuU5xub+ihjLtwAcd5F160HgeEqVUQ6ncHBzptncsYXijxl+XjG2hIItqUMtLQbQ
	nVTAdjc3IpKuWTvGJhSQl1bNNbuyBQQ99ZbCk7iDh725LozQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yps5xabae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAmFY3011181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:15 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 03:48:10 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/8] Add support for SA8775P Multimedia clock controllers
Date: Wed, 12 Jun 2024 16:17:41 +0530
Message-ID: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM18aWYC/x3MwQrCMAwA0F8ZORtYq7XDXxEPW0w12LUjERmM/
 fuKx3d5GxirsMGt20D5Jya1NLhTB/Qey4tRns3ge3/pr86jjUOMYcF5RsqVPki1fLXmzGqYhni
 mMLkppQCtWJSTrP/+/tj3A/myyLtuAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kflZ4fh2gIImidgoPR3g9u-cJt8RPR6m
X-Proofpoint-ORIG-GUID: kflZ4fh2gIImidgoPR3g9u-cJt8RPR6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=977
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120077

Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
platform.

These multimedia clock controller and device tree patches are split
from the below series.
https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Changes in this series compared to above series:
 [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
 [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000

---
Taniya Das (8):
      dt-bindings: clock: qcom: Add SA8775P video clock controller
      clk: qcom: Add support for Video clock controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P camera clock controller
      clk: qcom: Add support for Camera Clock Controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P display clock controllers
      clk: qcom: Add support for Display clock Controllers on SA8775P
      arm64: dts: qcom: Add support for multimedia clock controllers
      arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P

 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 1849 ++++++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  107 ++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 14 files changed, 5925 insertions(+), 1 deletion(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240612-sa8775p-mm-clock-controllers-f873c5b1bff5

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


