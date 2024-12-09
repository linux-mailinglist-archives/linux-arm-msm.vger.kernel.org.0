Return-Path: <linux-arm-msm+bounces-40957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4C9E8AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39922280AAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00145192B95;
	Mon,  9 Dec 2024 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cy2C5jjq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805718A6B2;
	Mon,  9 Dec 2024 04:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720242; cv=none; b=UoKbZtBE+rLitZGw2l0vgnctr4EuhPxh8oZV+mLdsI+m2/nv7/PENix5Uplk8ol6OJnxZDkX271EwUl05lHA/nRbhg2CaE/DLg0iGl/lzQndoeqDEYhKe5cU2G/kK3NPy24v1wr/1tYIDw3/NKX3KUltaOCm+h5uQ9s8VJWR9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720242; c=relaxed/simple;
	bh=40f8Mpjqjnnn+2Sqs45WGG0rf4OxTbfWtCqf3+2eGC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AsBaoc3ipDA39af77gQBGh6aPMQD93N078iyDhdjVKpAJSPEqsKo8AKaAGxZX3rebamtcDsM7ngQsYYb/Nj7DZsuZvUaHovDFVS6nRSbu0hhEugqXO+oL/crS5vm6TIWVY5CcVRvfmKcqRn3Q9q2xw0GvuHrOpOJ6Ek9DvdeEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cy2C5jjq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B90P27q025498;
	Mon, 9 Dec 2024 04:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5P0utX0lbp1cGNpeci+Sic
	e5+XFvyOdJHldIHVSG4wc=; b=cy2C5jjqpVQHj6tAzq2y89Jhlm66/IhyBbwpmS
	BHFJk5LpNcLvDYTTyVGeY+PP3Pv6XhUFCGEhG0efXAF1a4GnCZmoqDfxtlLeVB5Z
	0ONGDblYnjQEFPDKozYB0tkPWm0I9odETPSI5NwBxnQiuaxyynqrTUYCyuTFDG/8
	uZ8OTSUSla8uUKJRGJfyEdMHkNxJSSzKlfrtKKiZFz3F5z+77a9MRhhMfpjTiYOi
	98A7EhK7HK5WqA+Y7nojj7ksdYcJxYbrCDd70FLt5a8+Ktl9r+cgRabEgwI8qyQ6
	h3800eTXUjC8lhZwdMvfXm9eNmesSblFpmRgiVQUgoxlLE7A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cbqn3k2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 04:56:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B94usGX012471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 04:56:54 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Dec 2024 20:56:46 -0800
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
Subject: [PATCH v4 0/4]  Add static channel mapping between soundwire master and slave
Date: Mon, 9 Dec 2024 10:25:47 +0530
Message-ID: <20241209045551.1404782-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tnNu3hqleiKvLSlhWg9xGKk3QW18TzIZ
X-Proofpoint-GUID: tnNu3hqleiKvLSlhWg9xGKk3QW18TzIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090038

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


base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
-- 
2.34.1


