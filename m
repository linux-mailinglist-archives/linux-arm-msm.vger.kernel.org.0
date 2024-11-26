Return-Path: <linux-arm-msm+bounces-39217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A109D9BB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 17:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD4C616049D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 16:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05A91D90AD;
	Tue, 26 Nov 2024 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l563hpIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348011D8DE4;
	Tue, 26 Nov 2024 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639501; cv=none; b=UeX9AoPQrxyRcnsjRMHKaQALgF5ZxCE3ALShWhETt19wsPoNLnLb6n4EAUF1za4wP46Q2w7aura1imUBsS7MALAjbWT2EXojU771GcOKpAnbPZdTVU2jOBpwtc4Qmtt0Z/9ioMZZrXZV5B/h6z4fq+q0oS70vNpnK9QkHBmidHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639501; c=relaxed/simple;
	bh=diuuyXhplyrEbr8scX5wzkrvkgLDNoK92z8t+TQ8Nk0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ELWMTc0HNmU9SSRQGzTWIKjmY6fq4Fm3bBhf1QXCnsjWkWC4I4PC2myzEG2HWZeu5Hh7JWDOuVr8Jj4vsX6vn/I4lI4rvO5iscd7O7APfB4ljDD/7RU9w/QKpYlIkvcl3mteMTT7zQ+UEoQMyIeqD60NkWhPE/0IWpCquXdg4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l563hpIZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ9AYrH031015;
	Tue, 26 Nov 2024 16:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FHpbuFNYn2ybWZo0VvNrOJ
	WA65p0oT/c9DSOTVRC5J4=; b=l563hpIZTT8G/wP25jC52mdKnKZFAfI1DPJdVF
	m1+TVqccZEKq4oX04cEDOov8aEaaUkjCGpcu1cwHZEMtShf/OU10QpXuu9DSpllS
	GuwBX7ni7pqGiWH2Y0WzpZT3c8w7/AEh/rss/LB6lcgT9NUhJH60a7F+2K/MxLfo
	UI+DGex51HS1oXjYAAgjtXMvhLHfIPWWS61wp67364MLfmqS0whoFCZgzMzzzQxV
	oIboIK/m1prYV5P4zbUvlss6gDceUCKL1gfFbwWrEgWdnuhgdalZQBKIUE0ZU3mU
	xF7Ztah2HreEzEgC98k54/1ZohLNco84dEZqw0pDMVqI6Qfg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5h75u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQGiXGc006195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:33 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 08:44:25 -0800
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
Subject: [PATCH v3 0/5] Add static channel mapping between soundwire master and slave
Date: Tue, 26 Nov 2024 22:12:55 +0530
Message-ID: <20241126164300.3305903-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: eyytTXnGwdnBlzbcxL5kDKnUGdcLANV9
X-Proofpoint-GUID: eyytTXnGwdnBlzbcxL5kDKnUGdcLANV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260134

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

Changes since v2:
 - Rephrase commit description v2-0001 dt-bindings patch as suggested by Krzysztof.

Changes since v1:
 - Modified the design and followed new approach to setting the master channel mask.
 - Used existing set_channel_map api as suggested by Pierre-Louis
 - Fixed the typo mistake in v1-0001 dt-bindings patch.
 - Rephrase the commit description for all v1 patches.

Mohammad Rafi Shaik (5):
  ASoC: dt-bindings: Add bindings for wcd937x static channel mapping
  ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
  ASoC: codecs: wcd937x: Add static channel mapping support in
    wcd937x-sdw
  soundwire: qcom: Add set_channel_map api support
  ASoC: qcom: sdw: Add get and set channel maps support from codec to
    cpu dais

 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 48 +++++++++++++++++
 drivers/soundwire/qcom.c                      | 26 +++++++++
 include/dt-bindings/sound/qcom,wcd93xx.h      | 13 +++++
 sound/soc/codecs/wcd937x-sdw.c                | 38 +++++++++++--
 sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
 sound/soc/codecs/wcd937x.h                    |  6 ++-
 sound/soc/qcom/sdw.c                          | 34 ++++++++++--
 7 files changed, 208 insertions(+), 10 deletions(-)
 create mode 100644 include/dt-bindings/sound/qcom,wcd93xx.h

-- 
2.25.1


