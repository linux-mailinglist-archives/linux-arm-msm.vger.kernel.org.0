Return-Path: <linux-arm-msm+bounces-41788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6E9EF131
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1021729F36B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CAD23A185;
	Thu, 12 Dec 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BPUYpORk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B59229678;
	Thu, 12 Dec 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020732; cv=none; b=ALXRBjtCJjq46RP6jb2QXgNeAEm+EdOf7ygKcSH9Fsv5X3WWX7InZ7A/M53rBZ8rFo9kxSvcbbW34gcfDA8Nxf5BmDH1nokE69L6WoAu6xx0kRf2+H+O0w2TigwZe2NztHzTK3kM3IZ8Y6T7RYBtn7txBDSgAeaw/klFjXog0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020732; c=relaxed/simple;
	bh=vGAEDmrrxJR67HcmDsQm9Ej3F9JoAnhDptOHqFy3E6w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Py6trTGGzjSQZo7zCRhp7C6f/33mI3Qf9NbidmN3ffiYOQQgrL/qbj9Fa4e9BQkcvtmMJdLKXwO3iKI3/MQG+xlrixlVK+WVsiglfno3pFBBCxE2O5SD4OhIbCClfXGZlZbgOO5yeCLFG1LlOZZ0VHBTJ3mS5sB2QZ24vG4tUVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BPUYpORk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7pCd3002061;
	Thu, 12 Dec 2024 16:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VdNbqiA/jWA5zUEQ0a0xj5
	sMueOUmzcP5KTmWF4092c=; b=BPUYpORkiAN3KNTFLS7stKUadprQi14kCkaR6N
	5mK+Fqw0n5FdUmhKTaGNnZRzMqkxbT+Wm2LwUA2NSmEpfuZj06wlB753o5Txnb3+
	gpa9qyVkVOKwDPYyM5gDx4E6cEgbCUezJKq7HLAKlCQFZnFcxPF8THzQsby+YOyB
	Z2lPefX85O4Zi+P/dukweTdUf4hKAwe1u+kFEQCsI0rmQbfnu9gBSqkOVuxvIkwf
	hNljXYac3HnSDeZEQrVEFtIsheKHZt2tDY5o+ucNjehgVV6YRRY76QRteRMV0lV8
	JwBiwCfmfSYZgGS6yNLf6v7PhXFm+GuFUUaXsOm5ZgpMonBA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg663qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:25:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCGP7KW004935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:25:07 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 08:24:59 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkumpatl@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 0/4] Add static channel mapping between soundwire master and slave
Date: Thu, 12 Dec 2024 21:53:30 +0530
Message-ID: <20241212162334.36739-1-quic_mohs@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QTGaPIH4OGNnX62KYaGeXgMvSpvKw8y3
X-Proofpoint-ORIG-GUID: QTGaPIH4OGNnX62KYaGeXgMvSpvKw8y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120118

Add static channel map support between soundwire master and slave.

Currently, the channel value for each soundwire port is hardcoded in the
wcd937x-sdw driver and the same channel  value is configured in the
soundwire master.

The Qualcomm board like the QCM6490-IDP require static channel map
settings for the soundwire master and slave ports.

If another boards which are using enable wcd937x, the channel mapping
index values between master and slave may be different depending on the
board hw design and requirements. If the above properties are not used
in a SoC specific device tree, the channel mapping index values are set
to default.

With the introduction of the following channel mapping properties, it is
now possible to configure the master channel mapping directly from the
device tree.

Added qcom_swrm_set_channel_map api to set the master channel values
which allows more flexible to configure channel values in runtime for
specific active soundwire ports.

Add get and set channel maps support from codec to cpu dais in common
Qualcomm sdw driver.

Changes since v4:
 - Update the order of channel map index values in v4-0001 dt-bindings patch as suggested by Krzysztof.
 
Changes since v3:
 - Change the order of channel map index values in v3-0002 dt-bindings patch as suggested by Krzysztof.
 - Dropped V3-0001 patch which is not required.

Changes since v2:
 - Rephrase commit description v2-0001 dt-bindings patch as suggested by Krzysztof.

Changes since v1:
 - Modified the design and followed new approach to setting the master channel mask.
 - Used existing set_channel_map api as suggested by Pierre-Louis
 - Fixed the typo mistake in v1-0001 dt-bindings patch.
 - Rephrase the commit description for all v1 patches.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
  ASoC: codecs: wcd937x: Add static channel mapping support in
    wcd937x-sdw
  soundwire: qcom: Add set_channel_map api support
  ASoC: qcom: sdw: Add get and set channel maps support from codec to
    cpu dais

 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++
 drivers/soundwire/qcom.c                      | 26 +++++++++
 sound/soc/codecs/wcd937x-sdw.c                | 39 ++++++++++++--
 sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
 sound/soc/codecs/wcd937x.h                    |  7 ++-
 sound/soc/qcom/sdw.c                          | 34 ++++++++++--
 6 files changed, 185 insertions(+), 10 deletions(-)


base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
-- 
2.34.1


