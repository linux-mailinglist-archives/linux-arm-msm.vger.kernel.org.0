Return-Path: <linux-arm-msm+bounces-22500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FA905AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50944282F8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9655482CD;
	Wed, 12 Jun 2024 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hGkDeiqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329142904;
	Wed, 12 Jun 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217070; cv=none; b=E8/McPnd3LDRfJIVNqBsW11GxgB7+NKl0ncMlGFolHilP2OEsBSxM5HZDCVYaLWd1hCuN7Zwdu7/KoNb1Nqzitb5/g29lu3WXl93NFvX3ImgaRMdVFFO/s0oW5P4DjhWVArIE+ZXWrl6SYAenosQSoecHQ496kzlekdLQGBv/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217070; c=relaxed/simple;
	bh=bbW9jfn/YkVzxgq0mUcCmWnAQ+1pHU/SiOxwbF4Robs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A12fxE9TskWEkN/V+7ZbdazmMAFZFA4N4nRb9JDo6JGPfldyDIby7/o5hSt8KtNxSda09qybPIT4kkg3JGYuNz1cf6voNPzGCELZN1G/iC16OLZu1Jn/fipj+uN23NShPrWFlvsr4lemmAacXkkHvpRVpAXLJdyl3BLKSQ05nkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hGkDeiqB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CFbk34016948;
	Wed, 12 Jun 2024 18:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EzEJlEWFLZbkymQcOUSopO
	cRdcYxgvQlzTjdmeL+W4g=; b=hGkDeiqBA7+fhg3uWzCox7KlLclY0ov7oIH/6Q
	yYv+aZmpML5yrWgc8hHdUen0fdon168D7hZFtI5FzpWp1n+wftssKw5QJkcYnVnw
	mFCc6QVSoXZUF5bvZ5/JNfZ4JyOTDKQvZHIh7hUBtkUuGL7S473f40MFSeeJAkfw
	MElXflXSdf+L7FzkDiWVT1wp6uru+Bqyz5OBgWxm1iAWkwBxTMKu5wKMtszfs/Bj
	HdRQbt4lWMPbsw+KnnVlC17LGPdNAAzJO+Chy1V2qCD+z+zm03hWiccP+FFg0Itj
	iwZ8t2pXnQSdEqR3Ojs5s7Mkseh7xQEKk5C2P+PqAh1Wvy3g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjavmby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:30:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIUvr6007635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:30:57 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 11:30:53 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>
Subject: [RFC V2 0/4] firmware: arm_scmi: vendors: Qualcomm Vendor Protocol
Date: Thu, 13 Jun 2024 00:00:27 +0530
Message-ID: <20240612183031.219906-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nzqeVsfnI2NV1gNaM2IAzbyH651A5Gwt
X-Proofpoint-ORIG-GUID: nzqeVsfnI2NV1gNaM2IAzbyH651A5Gwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=913
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120132

The SCMI QCOM vendor protocol provides a generic way of exposing a
number of Qualcomm SoC specific features (like memory bus scaling)
through a mixture of pre-determined algorithm strings and param_id
pairs hosted on the SCMI controller. Introduce a client driver that
uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
to detect memory latency workloads and control frequency/level of
the various memory buses (DDR/LLCC/DDR_QOS).

Generic QCOM Vendor protocol background:
It was found that a lot of the vendor protocol used internally was
for debug/internal development purposes that would either be super
SoC specific or had to be disabled because of some features being
fused during production. This lead to a large number of vendor
protocol numbers being quickly consumed and were never released
either. Using a generic vendor protocol with functionality abstracted
behind algorithm strings gave us the flexibility of allowing such
functionality exist during initial development/debugging while
still being able to expose functionality like memlat once they have
matured enough. The param-ids are certainly expected to act as ABI
for algorithms strings like MEMLAT.

Now that the SCMI controller firmware (CPUCP) is feature complete
with the impending release of X1E SoCs, I should be able to get out
next re-spins a lot quicker. I'll keep adding more documentation in
the subsequent re-spins. Thanks in advance for taking time to review
the series.

Opens:
* opp-tables are used but they don't get to be added to the scmi device (thus we
  rely on a lot of manual parsing) because the memlat client driver doesn't vote
  on these resources clocks/interconnects/power-domain from the kernel and some
  of the resouces aren't modelled in the first place like DDR_QOS.

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

To Dos:
* More documentation [Sudeep/Dmitry/Konrad]
* Use alternate bindings instead of freq-table-Hz. [Dmitry]
* Prevent duplication of code using vendor protocol driver. [Dmitry]

Depends on:
vendor protocol submenu: https://lore.kernel.org/all/20240408093052.3801576-3-cristian.marussi@arm.com/
X1E cpufreq: https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/

Sibi Sankar (4):
  dt-bindings: firmware: Add support for QCOM Vendor Protocol
  firmware: arm_scmi: vendors: Add QCOM vendor protocol
  soc: qcom: Introduce SCMI based Memlat (Memory Latency) governor
  arm64: dts: qcom: x1e80100: Enable LLCC/DDR/DDR_QOS dvfs

 .../bindings/firmware/arm,scmi.yaml           |  21 +
 .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 243 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 136 ++++
 drivers/firmware/arm_scmi/vendors/Kconfig     |  12 +
 drivers/firmware/arm_scmi/vendors/Makefile    |   2 +-
 .../arm_scmi/vendors/qcom_scmi_vendor.c       | 184 ++++++
 drivers/soc/qcom/Kconfig                      |  12 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_scmi_client.c           | 590 ++++++++++++++++++
 include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 +
 include/linux/qcom_scmi_vendor.h              |  39 ++
 11 files changed, 1261 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
 create mode 100644 drivers/soc/qcom/qcom_scmi_client.c
 create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h
 create mode 100644 include/linux/qcom_scmi_vendor.h

-- 
2.34.1


