Return-Path: <linux-arm-msm+bounces-47022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5FA2A75E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 12:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B27160AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D6522688F;
	Thu,  6 Feb 2025 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LinceZjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11046BF;
	Thu,  6 Feb 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840999; cv=none; b=i0qZQWpgM78Pdkui2OXNJUN5bsptlpcYhq3RzPMsgSVUOxpjDKWlnqvLHMorzF5wwxcNfFPLOwu2HceU74VVqq5YkMlBKEi1FLQoFiTLmLmsn9Q173CwGhy9m3PRMRqIORjcMiP2w3DII6Za6RnW7h8Um3X7NDUo9frM/fkDEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840999; c=relaxed/simple;
	bh=DF6L1QyebOFzkZeXfsTZq5B3l69YX+5OHfaKKKJiV3Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IxSUTtht4qULNoSfrInaEe3JiSrdSvSWyIdjRcl3UoWpzKlQwV40poRXuaGU9UUfguhljPE4nFCxB1WIw9ksdqMb85Etan2oOtyFa2iWxlrCdSy3m9bXt9iib6YI1Hu62lfRu6qc6w/dY5cPN03iX8echxOY8spBmFddF2l1sZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LinceZjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169CnRR015655;
	Thu, 6 Feb 2025 11:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jBOj1oIfnfa4p7oiESyNP2
	rTTTc9IfvWTR4j9gGdtrY=; b=LinceZjRbKV9YpTZEIS2PyV+avAkTzHA1OY1qs
	fPYzEqOGi+a4v17Vv3mYv6K2A/OXW7yjalW44VboB8VwohmDfF/O+9DTGihRBM18
	jpVBzzg0JFqFfKj7lo7giZhkhZXHNTYsnWZdsdSF4H+yDxrwRICoFzgNjvAlDOWQ
	pPmr/byPFDpXD2CgHPPmtSIGEM9X913vabDh66Vvlf2H2E5kt3Dt3wMa88QOyIsw
	hlQz0KWmLXkFbNBPt5Y4fjp0nuN6EsewfY2R7/38iOuh+rANXfmBEpIRJJL7LNFr
	fc3+Rr1f2Db4zYgEBmXBl2ZiMsHMA2aX1HoN3jcQGACbBkaw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mt8e0b3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:22:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BMsFe017348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:22:54 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:22:48 -0800
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
        <quic_pkumpatl@quicinc.com>, <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v6 0/4] Add static channel mapping between soundwire master and slave
Date: Thu, 6 Feb 2025 16:52:21 +0530
Message-ID: <20250206112225.3270400-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 23dRVHEZLFYbE07qcP91km56ofWW1iH4
X-Proofpoint-GUID: 23dRVHEZLFYbE07qcP91km56ofWW1iH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060094

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

Changes since v5:
 - Fixed build compile issue with v5-0003 patch, reported by Mark Brown.

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

Mohammad Rafi Shaik (4):
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

-- 
2.34.1


