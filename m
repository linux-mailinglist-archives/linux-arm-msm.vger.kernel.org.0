Return-Path: <linux-arm-msm+bounces-36448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F909B63B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F711C20D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9A61E906A;
	Wed, 30 Oct 2024 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cqj43x3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE51E511;
	Wed, 30 Oct 2024 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293749; cv=none; b=La5Et+XO/kRk6Jam+pdVc/2RAFU13+FDnEZwU2Y23Xnzz6bcF25HI82kSdvgVKDwKplTg8zKa+VkszyM1vKsCQ60YHvit9qme9TcJeZQqlM3FQdapiDQf6poKi1+4TO1f90Wy0/kthV7/GOCuOxeiTDWsZ+tO6LIdoAbWVF/xC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293749; c=relaxed/simple;
	bh=xVZZG4/DoF3qy4V/WWmKwFvZ9D5AYFQ4BhXmm8jTDB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pp8Z6J/5P+fNN2Vp2TS4tEoAJWI9/mX4HTDT+55wBvHULaZ+SKuqCcQvaVwuEvTB4cnUcQFDUE7bme9l5Pf+JoAjQlVtQdn7SCgcLVDQ2dOfVOYHpq7hpvzOr1zmOGs7WmvxWXKTawpvq6CmcNLVGnfkwyKeO0kMl7VTPUaZnsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cqj43x3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UCFe9o002542;
	Wed, 30 Oct 2024 13:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bv05hKFb0OwHIrzgqgpqq7
	ttSHNBtGlfmK62T3i0DLc=; b=Cqj43x3enM2NPCWNUHR8j/KJ8XAcVtYpckHV1B
	tm/63FT0vaxRkiyyt61H5wk0QnnJs8bMYW6wZ+FfNApWn4XJ0bc+O7KQOS8JpGwO
	UPvxjd753r2lZYdiJU8wQ4rPtRwxPpch+BuRACZJvVHmMxawo3O/EG7Ws45Hr1C/
	2V0+8RMI1v19u6csq3JRB/aPV+bwqs15wmSKIVntA7V+MSPaHurpxYJFOhzCPFvE
	kLhD4E7xfGcZO+EcAcjibKhuq49HzmtQXhzqTMLrosMFD1GHj3uiRT1XKl98yNiw
	YLUZo0vc+h2BIAG1i489DSJ2T4GsBl4R0RWU0p3oZ1sV5LvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5850q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:09:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UD8wQw017793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:08:58 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 06:08:53 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Date: Wed, 30 Oct 2024 18:38:38 +0530
Message-ID: <20241030130840.2890904-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FyjjBaiWaRUzfDm0OmiUyIsonQ7NNsIU
X-Proofpoint-GUID: FyjjBaiWaRUzfDm0OmiUyIsonQ7NNsIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300103

This series enables CPUFreq support on the X1E SoC using the SCMI perf
protocol. This was originally part of the RFC: firmware: arm_scmi:
Qualcomm Vendor Protocol [1]. I've split it up so that this part can
land earlier. Warnings Introduced by the series are fixed by [2]

V6:
* Drop patches that are already picked up.
* Rebase to the latest next-20241029.

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
[2]: https://lore.kernel.org/lkml/20241030125512.2884761-1-quic_sibis@quicinc.com/

Other relevant Links:
https://lore.kernel.org/lkml/be2e475a-349f-4e98-b238-262dd7117a4e@linaro.org/

base: next-20241029

Sibi Sankar (2):
  arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
  arm64: dts: qcom: x1e80100: Enable cpufreq

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 89 +++++++++++++++++++-------
 1 file changed, 65 insertions(+), 24 deletions(-)

-- 
2.34.1


