Return-Path: <linux-arm-msm+bounces-33317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCF992440
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5307B203FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07651531CB;
	Mon,  7 Oct 2024 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="koXDVT+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3313D53E;
	Mon,  7 Oct 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728281455; cv=none; b=qpwKL4zu30C9yf/FmMbhgoiR/YGppbiSEqnrltT+2vxwKu0oNhGuyyjNc0g9y5vMXaeMZhUgZ3iYFS7Uq+JsGxbbMZbCf32zVLEeUFuj8N0KRCoFC2LGVMmpoQYHcokkbAYiOUDvKMVf3tsBnYZCO6AK8rwwLFgtMwhM2eAcYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728281455; c=relaxed/simple;
	bh=r955dWg+S+StGQmZU5dxvqPHbywcpM3NGWv6H988Db8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N76cwebtSspWK1M9pddLTcejXfU9ev2E0/r0d7aAUR7RZE9pZ9K1Juxj+DsEQiMWX8ev8ixdc3f58MTJR/GjSFnO4mREQ12paoiKTCxy1x8RKZcQa0O0dVG5EEMiC1J1nMgAb3xWYhFzzy7PwOKCze9ueAjehsdrSgnjYw7ligE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=koXDVT+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SrB3021358;
	Mon, 7 Oct 2024 06:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+CZ49p7HFm3uH0HM36YrKk
	nU0wvPtDu9vkc9qYaMgAM=; b=koXDVT+Ho5xd1gnM+XFtO70IEUJ733IcHJEMXP
	9m1S5QIYO1ZN4Jzyfclus4pNQS8/pNlupVP9snTAWda0mM2gttQ1J8yA+T5tIjQa
	p/1/R9b7FCJyWWXvmC9FSkM9HZNS/uJ86UfsZ8mklXw9mF5sJM49Kz1/GHhnrIHa
	t083Ltipdb0YnAwhkUu+m1UcnTF61hBa9MJOmX6B9bgyfckzmP01W+mvoQdhnduU
	X9FOHjx7uumkoSwbLBifCkAvw63dRSoLAeXGzT1xseNf4yyHSv8CiU7a0tp9zLY6
	XXdIfDLYQ7O0FrF3YQuUhvaCiuFVfOBsNBwMbtsiy6aIkBgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5k6g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:10:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976Ag1D028654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:10:42 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 6 Oct 2024 23:10:38 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Mon, 7 Oct 2024 11:40:18 +0530
Message-ID: <20241007061023.1978380-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JrOMYAWzTqizh08RsKl3jAc3gd2RsfcC
X-Proofpoint-ORIG-GUID: JrOMYAWzTqizh08RsKl3jAc3gd2RsfcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070041

The QCOM SCMI vendor protocol provides a generic way of exposing a
number of Qualcomm SoC specific features (like memory bus scaling)
through a mixture of pre-determined algorithm strings and param_id
pairs hosted on the SCMI controller. Introduce a client driver that
uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
to detect memory latency workloads and control frequency/level of
the various memory buses (DDR/LLCC/DDR_QOS).

QCOM SCMI Generic Vendor protocol background:
It was found that a lot of the vendor protocol used internally was
for debug/internal development purposes that would either be super
SoC specific or had to be disabled because of some features being
fused out during production. This lead to a large number of vendor
protocol numbers being quickly consumed and were never released
either. Using a generic vendor protocol with functionality abstracted
behind algorithm strings gave us the flexibility of allowing such
functionality exist during initial development/debugging while
still being able to expose functionality like memlat once they have
matured enough. The param-ids are certainly expected to act as ABI
for algorithms strings like MEMLAT.

Thanks in advance for taking time to review the series.

V3:
* Restructure the bindings to mimic IMX [Christian]
* Add documentation for the qcom generic vendor protocol [Christian/Sudeep]
* Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
* Follow naming convention and folder structure used by IMX
* Add missing enum in the vendor protocol and fix documentation [Konrad]
* Add missing enum in the scmi memlat driver and fix documentation [Konrad]
* Add checks for max memory and monitor [Shivnandan]
* Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
* Make populate_physical_mask func to void [Shivnandan]
* Remove unecessary zero set [Shivnandan]
* Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
* Use sdev->dev.of_node directly [Christian]
* use return dev_err_probe in multiple places [Christian]

V2:
* Drop container dvfs memlat container node. [Rob]
* Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
* using the same protocol number. [Rob]
* Replace qcom,cpulist with the standard "cpus" property. [Rob]
* Fix up compute-type/ipm-ceil required. [Rob]
* Make driver changes to the accommodate bindings changes. [Rob]
* Minor fixups in subjects/coverletter.
* Minor style fixes in dts.

V1:
* Add missing bindings for the protocol. [Konrad/Dmitry]
* Use alternate bindings. [Dmitry/Konrad]
* Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
* Add more documentation wherever possible. [Sudeep]
* Replace pr_err/info with it's dev equivalents.
* Mixed tabs and initialization cleanups in the memlat driver. [Konrad]
* Commit message update for the memlat driver. [Dmitry]
* Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
* Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
* Detect physical cpu to deal with variants with reduced cpu count.
* Add support for DDR_QOS mem_type.

Sibi Sankar (5):
  dt-bindings: firmware: Document bindings for QCOM SCMI Generic
    Extension
  firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
  firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions
  soc: qcom: Introduce SCMI based Memlat (Memory Latency) governor
  arm64: dts: qcom: x1e80100: Enable LLCC/DDR/DDR_QOS dvfs

 .../bindings/firmware/arm,scmi.yaml           |   1 +
 .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 138 +++++
 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 +
 .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 184 ++++++
 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 210 +++++++
 drivers/soc/qcom/Kconfig                      |  12 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_scmi_memlat_client.c    | 569 ++++++++++++++++++
 .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 +
 include/linux/scmi_qcom_protocol.h            |  39 ++
 14 files changed, 1441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
 create mode 100644 drivers/soc/qcom/qcom_scmi_memlat_client.c
 create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
 create mode 100644 include/linux/scmi_qcom_protocol.h

-- 
2.34.1


