Return-Path: <linux-arm-msm+bounces-21513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AF8D8B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968F21C21E93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 20:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C4D13AD20;
	Mon,  3 Jun 2024 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PLOGM/Pa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B4546436;
	Mon,  3 Jun 2024 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448370; cv=none; b=KucOdItd2wJmXO+1i/QqRKhvZ2tn2HZbdqvXe0ME6iZeki7vNdlRIxoo/FYowl60JZw+Wf81o+2Z4E/goObYTAUzHrVpDYIVQJ2nyPH2XQkxvHNRHn/xAnRkBFF/D9GxOMpgiZ7e1N9a8rtjF2+jqi01hweC9sQum79Bb3kohk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448370; c=relaxed/simple;
	bh=k9trw5fX1GJnQDX8vfMOOmEAoDJ6USuo5vwt5PenN0o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oKw7Q3oUuNK0Mr7gZ7c92a+V8KTPyhup2HZKyqa7SUG4fm/2yhz1mjNgN419Z/JZUCBD3on8rLBUXpG6/UMZ2nk2ln2aQHOcntlVULDiTAkrMskhj8NAPnIzDJZ/+ma67V9T430Qlk2hxvLwy0HdMRkZ9GK1sKjTifA5OEl2yuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PLOGM/Pa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453BvbVa021204;
	Mon, 3 Jun 2024 20:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2hC/YgdbSs9m5CwXYV8+2V
	432HTCViXc+JJs9S2ooSA=; b=PLOGM/PaIZd4UmTr1vM7U8Be2aQbVdz+JIwj8w
	twCpLUyC4m52O0il/3k+bVk4Ys6tAs4jueSiTV+eEpKHPTXA9ctmXHC+NlZogcrO
	rOibOJYoJr5tHdQouqIb+3u9i7BDGA9X6huntCTfrMBKBsUXZROyY679u8v00CDa
	wrD+4d0p89yrJHoWAbGaBstljZILXjcrz+efa3I1oZBg9MMXUFnBdTQ02OJW8hS6
	C1fccmrr1x7otMvNV1GhYUa96LUmwKbSgAcupEcIobFq2nBj0eYA2c+AADjoXxs9
	WhjIJTCEd956Vd/HDu2HTSO9H3odxA/IfodXmgRxmlL2WslQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw42vxsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:59:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KxJlV018029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:59:19 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 13:59:14 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V5 0/5] qcom: x1e80100: Enable CPUFreq
Date: Tue, 4 Jun 2024 02:28:54 +0530
Message-ID: <20240603205859.2212225-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: A49tXwnNTdQzneeZZOQOGPJx93zfV56j
X-Proofpoint-ORIG-GUID: A49tXwnNTdQzneeZZOQOGPJx93zfV56j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030169

This series enables CPUFreq support on the X1E SoC using the SCMI perf
protocol. This was originally part of the RFC: firmware: arm_scmi:
Qualcomm Vendor Protocol [1]. I've split it up so that this part can
land earlier.

V4:
* Move val, flag and chan to local loop variables. [Jassi]
* Add cpucp mailbox to the MAINTAINERS file. [Jassi]
* Move to core_initcall. [Konrad]
* Skip explicitly setting txdone_irq/txdone_poll to zero. [Konrad]

V3:
* Fix Maintainer info in cpucp mbox bindings. [Bjorn]
* Fix copyright info in cpucp driver. [Bjorn]
* Drop unused APSS_CPUCP_TX_MBOX_IDR, value init and drv_data. [Bjorn/Dmitry]
* Convert to lower case hex. [Bjorn]
* Convert irq and dev to local variables. [Bjorn]
* Replace for and if with for_each_set_bit. [Bjorn]
* Document the need for spinlock. [Bjorn]
* Add space after " for aesthetics. [Bjorn]
* Fix err in calc and add fixes tag. [Bjorn]
* Include io.h and re-order platform_device.h
* Use GENMASK_ULL to generate APSS_CPUCP_RX_MBOX_CMD_MASK.

V2:
* Fix series version number [Rob]
* Pickup Rbs from Dimitry and Rob.
* Use power-domain instead of clocks. [Sudeep/Ulf]
* Rename sram sub-nodes according to schema. [Dmitry]
* Use BIT() instead of manual shift. [Dmitry]
* Define RX_MBOX_CMD to account for chan calculation. [Dmitry]
* Clear the bit instead of the entire status within the spinlock. [Dmitry]
* Use dev_err_probe instead. [Dmitry]
* Drop superfluous error message while handling errors from get_irq. [Dmitry]
* Use devm_mbox_controller_register and drop remove path. [Dmitry]
* Define TX_MBOX_CMD to account for chan calculation.
* Use cpucp->dev in probe path for conformity.

RFC V1:
* Use x1e80100 as the fallback for future SoCs using the cpucp-mbox
  controller. [Krzysztoff/Konrad/Rob]
* Use chan->lock and chan->cl to detect if the channel is no longer
  Available. [Dmitry]
* Use BIT() instead of using manual shifts. [Dmitry]
* Don't use integer as a pointer value. [Dmitry]
* Allow it to default to of_mbox_index_xlate. [Dmitry]
* Use devm_of_iomap. [Dmitry]
* Use module_platform_driver instead of module init/exit. [Dmitry]
* Get channel number using mailbox core (like other drivers) and
  further simplify the driver by dropping setup_mbox func.

[1]: https://lore.kernel.org/lkml/20240117173458.2312669-1-quic_sibis@quicinc.com/#r

Other relevant Links:
https://lore.kernel.org/lkml/be2e475a-349f-4e98-b238-262dd7117a4e@linaro.org/

Sibi Sankar (5):
  dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings
  mailbox: Add support for QTI CPUCP mailbox controller
  arm64: dts: qcom: x1e80100: Resize GIC Redistributor register region
  arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
  arm64: dts: qcom: x1e80100: Enable cpufreq

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |  49 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        |  91 ++++++---
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 187 ++++++++++++++++++
 6 files changed, 319 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
 create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c

-- 
2.34.1


