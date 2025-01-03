Return-Path: <linux-arm-msm+bounces-43821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66699A003DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487BD3A1F81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD631B3927;
	Fri,  3 Jan 2025 06:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dfpCuXmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9B1B21A7;
	Fri,  3 Jan 2025 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735884052; cv=none; b=rEvthRQvn+2DEbLAQcB3t2EBlzhUr6blSOQNKwd5r4Z5bxfcZpME0UTi6z49UfPjuDMvrZIFI8Sp3NSLq3Bl/fYLSWYgjJGJbrMorK1Pl71UmufEYYNTk9ztw9+BjxzzBKLmRz4zlag62t6W/BkZqncCKCQNVEP/E0VL282C2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735884052; c=relaxed/simple;
	bh=grRqn/HmUlgik7+bURJ2yHlSaIdjqyhyK/J2vHwdgUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=laioref7/p9Jq8yLP08ah0uQLKIynpEDdI9o8/qHmCq3lFt2Lta2085OLTeDfFjb68++YD8LPFJhYR56Ab1XbB7qZlXHetjSR9BoDfnvATcBOGUOa8Xm3scK041S8dQLWtq9q4MtiVK22KzNsHe91sKIpcBmL4asetiLddhv1n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dfpCuXmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1LSe005804;
	Fri, 3 Jan 2025 06:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Whv3pVENXohyz4nvjcDNeW
	ZG3Mcei/WUcBNq5Y4J14k=; b=dfpCuXmfMjKGS4agG/n9tkX1H7l8Cgmz3D+PAj
	nsYBFMyAscQIK73u+jURyyfyks8BREdNzE1rYmXQDzsSKtlODol0FMdLfBK0ECyI
	gJXJzNB2wLU/yVIimNFGvyg01Tyz/llG4dr/Bei+5DuR/szWA3SQzCAmOutXebK9
	tG9hBHN604OYQ+XkBlk58xZvAwyyTG8Xf6X1PgOO6XBgm6w8T3VYCSPyBbnM+7tv
	hN775DpY9gWJbH6eh3uFAewQEIgzumkmpEZYQLZ9rcxi+I/sXDdKYuDnsjw2e2Lz
	fO31hQwlxYSgKSbR6PEeOpv54+MCpkmyuTTRVKKCW0uDxBsQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ww1p1km8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:00:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50360LBx008849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:00:21 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:00:13 -0800
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
Subject: [RESEND v5 0/4] Add static channel mapping between soundwire master and slave
Date: Fri, 3 Jan 2025 11:29:10 +0530
Message-ID: <20250103055914.1835943-1-quic_mohs@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JjZJZEcxKR1BpF0OD82KM8LQGzlX_gHG
X-Proofpoint-ORIG-GUID: JjZJZEcxKR1BpF0OD82KM8LQGzlX_gHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030048

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


base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
-- 
2.34.1


