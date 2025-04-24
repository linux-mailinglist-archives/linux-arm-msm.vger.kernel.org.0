Return-Path: <linux-arm-msm+bounces-55382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87DA9AC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EFC44253B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498D5227EAB;
	Thu, 24 Apr 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M7C5lWsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85D9226CF4;
	Thu, 24 Apr 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495963; cv=none; b=gpUZSf93vtegyTbiVoQaqbYg885WVLEapeI9DGg0gQVecL6G+AwS6cQ5LNqxN/24VVn6q0qrJSP8lqzlJkohItBNXE28pwCzpipgzUwBS2fZHlcSoi4ubigF696zJ6k52C5z0mq+/N/6KEBF5lI5Bl3tKycmCYgW8jkLmHcE/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495963; c=relaxed/simple;
	bh=0umQzfm0XyjSVr7yJBEdZp5YfeOzMtU/6cKJbuYPSC4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kreq117GgIUeXkWB/6yeSgHBEBY89JbJR9zu3PqtnhhtrpoNfV4tofRa950tAiQDfR6EE49VJpG8vO/VfNNG4Yzn1GTvVRvYfH1HYs4YX+rUDQXofDYkfCV8Y/v7LpJFMVsYnhqKKDGNRfvR+l+EvYuP3DwrgorulZRRqPtKbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M7C5lWsb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBobnb016314;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mEQHn9Lzi2oBulHTACKkSD
	fVZs9ArGx5jJBjivJoH5I=; b=M7C5lWsbpIlpOklc1/gJfG2jrOnHhKAXeNW3S4
	DZEK3yukUVkNnC5J9wphQB4vEX/ZEfZJkbH+IcZbh8H5TdKAbRS192wxU0r7y1Qm
	tJaDayBWYR6hhXldlc0Rk6UZ5tHWdHjRgk3Z32F6BxOzypckWbTS/pZ8GrvfW1sw
	arOFcT7VOKxle4rA/qq70cw6jwUkksDrNvhY+WRBNQeY4wOy3PgqfeifO2czRUZ5
	KnVklvzEFvu/G/iEb7tsQ5IIbcE4F7mbIKN79a2TaohX7vEwCezFYLP/lQaQwLyD
	RCl7rr2OsmtwPSx8fjRmXbOB6nP5Z9a2wcxzJBDLa19LE+mA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0dhgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx8Ab031191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:08 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:08 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/5] coresight: Add remote etm support
Date: Thu, 24 Apr 2025 04:58:49 -0700
Message-ID: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z9PfDY0Sucy_CnnLSDvmeUUYf3qyivAk
X-Proofpoint-ORIG-GUID: z9PfDY0Sucy_CnnLSDvmeUUYf3qyivAk
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a278d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=Kq4fDhYDckEUxlu27kcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX9YHt8R0ddnxh WjUMJkio8n8emcVyeFUny77nr2AbxRKi1+vcfqJO4OdOtgmQIQz6uDDtkKoNrurZk+CnmAU/LL5 Xil4b2P4+IqTuOvnOlaST1nFzp3dhWMJr/DFEQWQYgFcVwjKUoJzWWmDMJ/vFbMdUu8vWHRX1iN
 130HtWDrG1B6Z15SNtJcdFiozXCFzEhaYnt/aQ8FaB1X5ENVfBYfTiqECAljOhbLiFcKhQ1wDdV TItOzPq/At5ytgeIZXVUnZ1IRDeWY7tol6pFNHvGWq3psAgMW9OydQetl2mT4GLInuClAyMjt/Y +ZBLtOg4N6SpKkogZ6VAq2cnOZNX+nQTMqt5kNFRwB/TeplZDWU56q/RqSgTpa1i7M6aX/QULOX
 3nCtwipAhBSibpAIny5FkRmzkhSn9nMCSwidFqqHpdbDIakY5vRs8lfHxZbennKE/gt/0xAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

The system on chip (SoC) consists of main APSS(Applications processor
subsytem) and additional processors like modem, lpass. There is
coresight-etm driver for etm trace of APSS. Coresight remote etm driver
is for enabling and disabling the etm trace of remote processors.
It uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from remote
etm source to TMC sinks.

Example to capture the remote etm trace:

Enable source:
echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source

Capture the trace:
cat /dev/tmc_etf0 > /data/remote_etm.bin

Disable source:
echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source

Changes since V4:
1. Add coresight QMI driver
2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi

Changes since V3:
1. Use different compatible for different remote etms in dt.
2. Get qmi instance id from the match table data in driver.

Change since V2:
1. Change qcom,inst-id to qcom,qmi-id
2. Fix the error in code for type of remote_etm_remove
3. Depend on QMI helper in Kconfig

Changes since V1:
1. Remove unused content
2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
3. Use enabled instead of enable in driver data.
4. Validate instance id value where it's read from the DT.

Mao Jinlong (5):
  dt-bindings: arm: Add CoreSight QMI component description
  coresight: Add coresight QMI driver
  dt-bindings: arm: Add qcom,qmi-id for remote etm
  coresight: Add remote etm support
  arm64: dts: qcom: msm8996: Add coresight qmi node

 .../bindings/arm/qcom,coresight-qmi.yaml      |  65 +++++
 .../arm/qcom,coresight-remote-etm.yaml        |  10 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
 drivers/hwtracing/coresight/Kconfig           |  24 ++
 drivers/hwtracing/coresight/Makefile          |   2 +
 drivers/hwtracing/coresight/coresight-qmi.c   | 209 +++++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h   | 107 ++++++++
 .../coresight/coresight-remote-etm.c          | 252 ++++++++++++++++++
 8 files changed, 680 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.25.1


