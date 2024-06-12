Return-Path: <linux-arm-msm+bounces-22432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0159052AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF087B24B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F00D17082A;
	Wed, 12 Jun 2024 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dp6+j6TW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CA16F29C;
	Wed, 12 Jun 2024 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196088; cv=none; b=iTNgq5fdvgUb+ifkPcSf6xb0pvD1GVC2fMzXNHvNxpj0fTj05vrNGbXSFAuxiUPIZ4ckzDIsCWxdgkho2If2rB1hTtvzBFB6Nkly1RDyDIkiLpuaQokFrxudnQCTlfHfOPhfRz6FV3iVYDnbV21WKjwHpFV4fZ84fwmqZHCmNz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196088; c=relaxed/simple;
	bh=QKNi1AnJcoaWSExqqXnv1fwPnCX7d8tJdIQZQ5sLTLg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=peKpkElDWmUMq/R0r8hS1vq8CskSvn+g+15f1uPAPxgh/T2ywxfGZrnnBd0Mzsyr1NoVNxlj/AVUsYnmBQrkSp/vqRYOw0umPrpbM/7mIFB5xLwd7QAJ3cNc0dFZDy/UOQExcw9phPQlXVlS+dMQ4iaDtN79QMU/ty35PqYdD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dp6+j6TW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5FpOs026048;
	Wed, 12 Jun 2024 12:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4w9NEFBq31+/OpwZoJSdmS
	qWfK/PiX4zNunRe6a0SyE=; b=dp6+j6TW7nWc9elNgo/XTtQUx3DdqbL0CQDIPy
	sEiMsnzYWJ1SbjnTxlB+LYPKN+kXDJ7z+lV9KAdZMR+kR1UnY4PK3XY67YCoaf9r
	oB+Gtd07s81QDDY9Pg+HA7SFHmR+YgeimuCcdS5Z8BQkdzAsMucst7AXABywB0HN
	ZUkXqlCPi4KzbAU7g0lVeox/6UkS9zi5DL1WouidQYivY0okUrcUHc13yjLFsfOm
	nCflnln6CKrFdbxrspnncoTUcmOdNpYrw0P1wDhDAXyGm3tUgQHjh/HRg91eCr/r
	p0MHRnOoh5Rvt+lc0V2o2ydwfpBi0YeFKo9WF+x739kEPErg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yps5xak42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:41:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CCfHwl003077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:41:17 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 05:41:11 -0700
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
Subject: [PATCH V6 0/5] qcom: x1e80100: Enable CPUFreq
Date: Wed, 12 Jun 2024 18:10:51 +0530
Message-ID: <20240612124056.39230-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: vUAtslI0AYZvWHAMOgUuY4fAXaXabGRf
X-Proofpoint-ORIG-GUID: vUAtslI0AYZvWHAMOgUuY4fAXaXabGRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120092

This series enables CPUFreq support on the X1E SoC using the SCMI perf
protocol. This was originally part of the RFC: firmware: arm_scmi:
Qualcomm Vendor Protocol [1]. I've split it up so that this part can
land earlier.

V5:
* Fix build error reported by kernel test robot by adding 64BIT requirement
  to COMPILE_TEST
* Pick Rbs

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


