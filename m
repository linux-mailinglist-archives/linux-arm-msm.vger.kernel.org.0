Return-Path: <linux-arm-msm+bounces-32062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4597D446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 12:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 011B81C21E74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5F513CA99;
	Fri, 20 Sep 2024 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sc8c2BO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FFD13C9D4;
	Fri, 20 Sep 2024 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828714; cv=none; b=slCLWH0agpNeZt2SXpc2+HHhZ/xA8HUDHgr2ZXydz+BP38Ys33CuRO4eiAPJcqT5UXqwhph0V5QG+rGfOO2q0q5OP40q/xPuWn2Lfps9opgCYa4Ab5/ucPvRLIV4FCdjXOR+hMKGZSaDaQWnxjakKL1jQNmnEVedH06cHUZTVp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828714; c=relaxed/simple;
	bh=LgZAbc2cWMNsEhYslXdzq0WJM/yj/oyFLD+fWLg1jDM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DEROfL3YGr8eNajevBuhVVZNJ/vhWUXqNAZIOBwcsJTUg1BbPt5E8L35WTv80XMmLX+EjbN6FtOSiVF+pwYNphNzRyKDkTvIfrpYqD3lHrOSAMs/elZ7nY8yJJ9MSIOXu+oaUji4eRHciFt4Tbop6z2rUusszUbRr12b3wKx7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sc8c2BO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K8AvUI018224;
	Fri, 20 Sep 2024 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uJnmPVWKteGOLf2OW14A8J
	NFwTlQu3vQOpmxqfpOthA=; b=Sc8c2BO4RkR+p8vqhVoYlXr4gHtEGbaslUpQNz
	O8S823xwrdTkYDWhI8UG+zM2/XG850ibjd5CyJOAVv4V9N1w7WeIngj4temso83A
	8ERSHRh+KSStNkFUrziCAahgsTPYq9RY6F+NiePmXuRBg6eD0D2pWWHU6lOkSvG6
	j0F0bD5M+f7Ppuk/AHpETjchff/+ECRTPwXY8QzdgUlFlkJYPKwBWoHx5qAdT8jb
	WX7A50hAC2pzvbE8m401nqs3PhGulzOm8frYBVyUT7+S8F2AiPfmOUGx49VoLxVu
	dO1sTyETDFgLbrnfgA9goW3uvKPldVDZKlo9u1gAJlzS2AdQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j70syd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:38:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KAcQ4O012572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 10:38:26 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 03:38:21 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Fri, 20 Sep 2024 16:08:14 +0530
Message-ID: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZQ7WYC/32NQQ6CMBBFr2JmbU1bAa0r72FY4HSUiUplio2Gc
 HcrLty5fC/5748QSZgi7BYjCCWOHLoMdrkAbJvuTIp9ZrDaFtoZp3qMlSkVXgNelBdOJMpviuZ
 IvnLbsoC8vAud+DlXD/WXhfpHjg8/2XIcgrzm52Q+9v9JMkqr0qBGdJbWjd3nInKHKww3qKdpe
 gMog58wzQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ye7BJ7cenhygI-wL7s3GWyr2gqv4NWIY
X-Proofpoint-GUID: ye7BJ7cenhygI-wL7s3GWyr2gqv4NWIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200076

Add support for Global clock controller(GCC) and the RPMH clock
controller for the Qualcomm QCS615 SoC.

The QCS615 SoC is added as part of the below series.
https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes in v2:
- Update the compatible in alphabetical order for RPMHCC bindings and driver.
- Remove the extra ":" from the GCC bindings.
- Update the GCC Kconfig for some required configs and move the GCC init
  from module to subsys_initcall().
- Link to v1: https://lore.kernel.org/r/20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com

---
Taniya Das (4):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      clk: qcom: rpmhcc: Add support for QCS615 Clocks
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      clk: qcom: gcc: Add support for QCS615 GCC clocks

 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   19 +
 drivers/clk/qcom/gcc-qcs615.c                      | 3035 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 7 files changed, 3335 insertions(+)
---
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
change-id: 20240919-qcs615-clock-driver-d74abed69854

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


