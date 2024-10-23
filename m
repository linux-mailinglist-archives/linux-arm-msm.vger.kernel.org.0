Return-Path: <linux-arm-msm+bounces-35531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A209ABE84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14A0C282207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746DC1494C3;
	Wed, 23 Oct 2024 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WEtMQlN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE70213AD05;
	Wed, 23 Oct 2024 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729664126; cv=none; b=X6qzIYVgV3J5p2W9hLH60yjKOWVJI9z0tXmmd3pxvI+48681ce/qPKOiAaG1b6G/i25pfM83t97XqFUoLujHMcka9fz2Ofpn/tW7hGcNmTuF915kY5o2GP4nzxg6pJc47V+hs3lFxwr7VX16zhswDIxwEBVRRYJ1/7UheHTMOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729664126; c=relaxed/simple;
	bh=hOCjI87sY8qupXlz5mDEbVsgaaalAuBsPrcjoZDMtYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JfIGWTY4/PZfFJQacfqw29zUhnbQtgY5Ln1avDXMgMThSvSdtmpnG9Rbb+DkCNOKY//DrgpUGwTlHHQFXMY8N6sY+2A5IiVtrlP38ZnGBAoUGlpzp7okd4h95OD2Qq7O+OZdWX93xuuk3TZcDAzrtNdljB85E3FpwgbQWj3XLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WEtMQlN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLejDk018638;
	Wed, 23 Oct 2024 06:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2QMoPtj8QOhCRp2s6Mp3aq
	1cG4rK8HhM1JZaRz73mOw=; b=WEtMQlN82VMG4hR6fdWJ47shTrADqFzIOTaGnf
	Nvb5R38GPYd75QjIx4RaoBJ7kcStSy+2OGGWWuKAUu3g7/4Vc9UPj7RDVjbSgZ+6
	Zn+67Eg6VlXLGkg1QUavvm5I8kc3mwZnHjo2XbqKOj5RAWJ9lIkYiE5SPzrUBNzh
	Z81NwxdmGmfTWGtsKsESOt+qhYZHjj46+mAg9ltS7n0Z2jMZfXmgRiUCH6GIYKdZ
	8mzyTYMhyuy9zIKHcVIb4zhpGYWZm68l8d5Ka/FLf3Ml1kUOHKvPXCXPUwVsiHsH
	bAxnHgoGsLrzZqrq6V43UBDFVuSjLTb3oOK6BrabFws8GRZQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em6692en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:15:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N6F0Pl015692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:15:00 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:14:52 -0700
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
        <quic_rohkumar@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v2 0/4] Add static channel mapping between soundwire master and slave
Date: Wed, 23 Oct 2024 11:43:22 +0530
Message-ID: <20241023061326.3871877-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: G9zE8UGDeq2cRtWy7gJ_kFDFrmqCzBCH
X-Proofpoint-GUID: G9zE8UGDeq2cRtWy7gJ_kFDFrmqCzBCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230036

Add static channel map support between soundwire master and slave.

Currently, the channel mask for each soundwire port is hardcoded in the wcd937x-sdw driver,
and the same channel mask value is configured in the soundwire master.
The Qualcomm boards like the QCM6490-IDP require different channel mask settings
for the soundwire master and slave ports.

With the introduction of the following channel mapping properties, it is now possible to
configure the master channel mask directly from the device tree.

Added qcom_swrm_set_channel_map api to set the master channel mask which allows more
flexible to configure channel mask in runtime for specific active soundwire ports.

Add get and set channel maps support from codec to cpu dais in common
Qualcomm sdw driver.

Mohammad Rafi Shaik (4):
  ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
  ASoC: codecs: wcd937x: Add static channel mapping support in
    wcd937x-sdw
  soundwire: qcom: Add set_channel_map api support
  ASoC: qcom: sdw: Add get and set channel maps support from codec to
    cpu dais

 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++
 drivers/soundwire/qcom.c                      | 26 +++++++++
 sound/soc/codecs/wcd937x-sdw.c                | 38 +++++++++++--
 sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
 sound/soc/codecs/wcd937x.h                    |  6 ++-
 sound/soc/qcom/sdw.c                          | 34 ++++++++++--
 6 files changed, 183 insertions(+), 10 deletions(-)


base-commit: 7436324ebd147598f940dde1335b7979dbccc339
-- 
2.25.1


