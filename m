Return-Path: <linux-arm-msm+bounces-37940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475A9CD4E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 02:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1F0B1F2119C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 01:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CFC28366;
	Fri, 15 Nov 2024 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BR0ya8wO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91431E522;
	Fri, 15 Nov 2024 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731633345; cv=none; b=g6Arx2Ie7cEvhvuEKBk6vzPGy1CCm+LwQthZzwMZ1cUjeIPYhjYDLDMpRNuylHZnMBI5E2JlIrIILVWfrxZsFGzI5SHBawUK0PC1/J2AWi/14TrjRUawhrEkL4PObY4EEMNcjJ7OBnuFutMT10H2VczxMW277kY0daEivYgtr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731633345; c=relaxed/simple;
	bh=pJF6FnthLaZDlGhslANwjiqRlQJlVEyZ1a9Jnw0V2FE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TGuL9dKl+WOnBvtl12PsBzXzkjZcwLX+El0O5O5LadbyhYeOaWWbycrho97GApSJeEcWL5noYbs5altW9gXDiANVAI1po76R4pqS1HGIHLH/eTjqbSrHL8UfXsF5iEgoylvc3zLot8i3dy9HialrxyjB11YNv6dZJN4qA2qZaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BR0ya8wO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHw9A000914;
	Fri, 15 Nov 2024 01:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zh7TTW8tLIxvXk1cjlASsZ
	hsAqj2uXJLd5tfnba2ABw=; b=BR0ya8wOwYhyS5yr9qA1PtlUHUZObw+i42OrMq
	W3uH/AHLNjGIsnx5n39SV0EeXThRSxolsdQboeUCqZW9FTtTxAoYWCCWJ02G6LKU
	3T1lXXZiYWNKLQuYPnRJ0ESrNNHI/xMEX3mfCJTi/fXVo8j3V54Him+ZeSKtnQes
	Cg+eL2tnxJWOEZvjv18POh+MxE9AL3xbGOlLKpE+kr6Ad2yqh/mrm+zlXmlvs59N
	zZNQVEx589JS9BEZd/ELBFbNgeUUMYTPaRFoS5/WbwVu4LvXxb4n+dd/zVg19akj
	eEX/9Y5X3WB7mElmk0PhqzcKEwGu/TCV8jql2gJf8ez9WjfQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w9sv4364-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:15:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF1FXJj009013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:15:33 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 17:15:29 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V5 0/2] arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Fri, 15 Nov 2024 06:45:13 +0530
Message-ID: <20241115011515.1313447-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zjtL2fq0-uBsnsOb6Yi41aMzSpjcu7mt
X-Proofpoint-GUID: zjtL2fq0-uBsnsOb6Yi41aMzSpjcu7mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=959 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150009

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

V4:
* Splitting the series into vendor protocol and memlat client.
  Also the move the memlat client implementation back to RFC
  due to multiple opens.
* Use common xfer helper to avoid code duplication [Dmitry]
* Update enum documentation without duplicate enum info [Dmitry]
* Update the protol attributes doc with more information. [Cristian]

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



Sibi Sankar (2):
  firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
  firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions

 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 ++
 .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 139 ++++++++++++
 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
 include/linux/scmi_qcom_protocol.h            |  37 +++
 7 files changed, 406 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
 create mode 100644 include/linux/scmi_qcom_protocol.h

-- 
2.34.1


