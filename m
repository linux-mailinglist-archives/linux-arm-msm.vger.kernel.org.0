Return-Path: <linux-arm-msm+bounces-64529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC8B01868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC9A1CA5374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5645C27E1B1;
	Fri, 11 Jul 2025 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AWYfEiBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860B527BF7C;
	Fri, 11 Jul 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226862; cv=none; b=EU0F6TQgzUu3ODY9Y+dMD5CGM9mWcB1pGnstNzziy5ValuB3/OObzKW2N06THYc4rJizZR7QkjyY4D1uyKvqtCtmVBRoUaLGuhxCCPbLzG7/cONCQ7tkC8J0KMHoCBmRho8rI3lC4FqxiFnbXFe0G2SxEH/sEqkV0/Ge1b/lWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226862; c=relaxed/simple;
	bh=BSdkDWu43+UVOap9ka/dvJ0oQpyuDATvTPk0vOlfLl4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HK5LWt+S626jTbusSegZTDrbO+ZKIRM1s4XjDvvcmVHJGQSsEyzOzISVral8wgtbl61XFfK3iXn5/nO/acmk+Ezuxf5QulLwar99v4gVZUbqCAc8SpW2mXq72hf1JGPWaSc4Cq/WFEA6dZfgaqeqet7d71rlWDZGNnnY+7U6u3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AWYfEiBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X3MD012022;
	Fri, 11 Jul 2025 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MA07l9FmpGczpoSTMauVWq
	0Uzfsbk2Ip1qlrg9BU980=; b=AWYfEiBUFJYXUnc2auC4uhsRy8WHMCCpgARYt4
	2i8kZGnLmg67tA3TJzx7Gc2NTzO5s+S/phXo1cySuAh1U7Ea50EjKDLsbqFWrS50
	LuzSKyrWy6gZvB+Vb/JHG6798sEY0L5eyai6TXsVOzY84BYIgbD3rs0XyeCissbg
	gcT6WWTefG5RaCtYf1zOFqWyiQzcH5+wm9nv94s6iintwY28KIiorIBh6Iv1zzc0
	+hpeAwIhjfDwSztIVtCSIoW6AgtoAqZiqJqrghPYhQtmewvTQBmQmwpYGcdmZ330
	pUDFt4Up13MaetOGqeMe+oWRAKOGDcIH4Ex0wxrqeHM3/ezA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e01v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9ek8A010472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:46 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:45 -0700
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
Subject: [PATCH v6 0/5] coresight: Add remote etm support
Date: Fri, 11 Jul 2025 02:40:26 -0700
Message-ID: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jG5-B5-Sc7km8FmPZAf7znFYe5jKPfuI
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=6870dc1f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=07d9gI8wAAAA:8 a=COk6AnOGAAAA:8
 a=Kq4fDhYDckEUxlu27kcA:9 a=e2CUPOnPG4QKp8I52DXD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jG5-B5-Sc7km8FmPZAf7znFYe5jKPfuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX6BEVW175zuaD
 lnxY4ctxY9TQTwS0Tc7ph0llP4eVFjuB37Ak7NmF7UBy8VD4dl4hRqXcnR4LFdbzP4fMjuXQs6z
 Z4h4AWazBoRcHy63a6evU4ATnpn/IPviSxCFHiP3Bjb9QhLOjGvR9UJzMtmec9y3GTTOwgsJtxi
 GdfWUPYO+AcoT/9/s4RhM0s1dj9JHL/SZdmIOLlh+KLoehtnBSOojVGpoIYMU4w+OUzElGGckg3
 djr/BryvYwj9JJ09IiNZf1UFEZYomf2ELbOg9VU/483SKelWsBMI4cRAw82pF0A0w3JLavCfL9B
 82kz50ZOGVQxKWEfPgzogp4IAqxzQMYuT/U/hXK9GjXrkyhcIsCusrBEAfZd7PZeAGELJ/1wJUN
 1ekGYtO0yMcJ/xC6oe6XiEiuMfaejtOMoLY4CVwq5ddJBOXA/HpQ5sYKB0FFW1av9gk9PN9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110068

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

Changes since V5:
1. Fix the warning and error when compile.
2. Add traceid for remote etm.
3. Change qcom,qmi-id tp qcom,qmi-instance-id.

Changes since V4:
1. Add coresight QMI driver
2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi
V5: https://lwn.net/ml/all/20250424115854.2328190-1-quic_jinlmao@quicinc.com/

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
 .../arm/qcom,coresight-remote-etm.yaml        |   9 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
 drivers/hwtracing/coresight/Kconfig           |  23 ++
 drivers/hwtracing/coresight/Makefile          |   2 +
 drivers/hwtracing/coresight/coresight-qmi.c   | 198 +++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h   | 101 +++++++
 .../coresight/coresight-remote-etm.c          | 262 ++++++++++++++++++
 8 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.25.1


