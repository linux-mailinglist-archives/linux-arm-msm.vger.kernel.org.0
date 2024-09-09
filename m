Return-Path: <linux-arm-msm+bounces-31268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 360399715C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A61371F23470
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA84A1B5300;
	Mon,  9 Sep 2024 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VieqZ832"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6913D53E;
	Mon,  9 Sep 2024 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879414; cv=none; b=YW+1QPQVemoWUKHvcjeZOC3Q6P8ShHunBOKB3Eh6skzvCxt8MScB2NDEFy82e44dKCdvhTcyN1mnQZY7HTv4l3jle4itMWbdVghzkiDqkOJghpubG+qfV4smCLHGvKGcC3VpQ6YXqY6QB80aQHKx/437k9DPyuvfpHgYuI4QxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879414; c=relaxed/simple;
	bh=SZKP8xg/qyZzQnZu6J7kE/Q1QRLNmUJGqGxHhrxB+wg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ni2pkCzFxR7SshofCNKI16NHWAEVVEDXIItLRQT00fhyhfDbx9n0nv5YhSVtN4/H++gn1ApZKWWgVKxjX8FcKR551SL90tI6Jzd2Wt+akPUc0e7zWDwd8mCcZrUjilBuqksOlsPxJQIvtsBRwti2UXlBBSCLmJgaLvqeqsJ36P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VieqZ832; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4899JpWi029477;
	Mon, 9 Sep 2024 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B74tMf/CUUzR3FTBRoD1ZT
	xOcnNObTJ8iLOoR7N3lnc=; b=VieqZ832dfbAdjYmo0cOvi2V28Ob0uw2BCQSWO
	AT3148mJ34iU69ns6bfOKAjAF/SNUZtIOwIMrGvM+3Gia2zo3aYC9NySmdvkuvfB
	zesbrA0Wo9Z8Tjl3062BQARSCKC4OggsSbnOINDlX9VSZr+XJXxc5BmASVB9mFw0
	DVA1X60gdiU5flqz1iwnISLJ/l2bCgvqDQJBqPskv2h44dFFhY5aKyiWAbhnhnRp
	vgObJgUt5Z/2HDqPluUhb8Z89AHIAO2tCCAdldKJhjmg7aHc/vMBIefbO4BVhow2
	AKoQstXWJ/Dv7+qxBzkFDGbCv6Vq+U+sYRywrL78JANfoZKg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpjjdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:56:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489AuXQ4007051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:56:33 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:25 -0700
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
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 0/4] Add static channel mapping between soundwire master and slave
Date: Mon, 9 Sep 2024 16:25:43 +0530
Message-ID: <20240909105547.2691015-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: cHttXC1flPaM2E5vZPuw3jjaJlUBj-fV
X-Proofpoint-GUID: cHttXC1flPaM2E5vZPuw3jjaJlUBj-fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090087

Add static channel map support between soundwire master and slave.
This patch series will resolve channel mask mismatch between master and slave.

Scenario: wcd937x AMIC2 usecase

                          Master                 Slave (wcd937x)
                     +--------------+           +--------------+
                     |  +--------+  |           |  +--------+  |
         AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
         AMIC2 ----->|  |        |  |           |  |        |  |
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
         AMIC3 ----->|  +--------+  |           |  +--------+  |
                     |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
                     |  |        |  |           |  |        |  |<-----------AMIC3
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     |  +--------+  |           |  +--------+  |
 DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
                     |  |        |  |           |  |        |  |<-----------MBHC
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     |  +--------+  |           |  +--------+  |
 DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
                     |  |        |  |           |  |        |  |
                     |  +--------+  |           |  +--------+  |
                     |              |           |              |
                     +------------- +           +--------------+

For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
for Master required PORT1 with channel mask 2,

In existing design master and slave configured with same channel mask, it will fail
AMIC2 usecase.

The New design will help to configure channel mapping between master and slave from
device tree.

Mohammad Rafi Shaik (4):
  ASoC: dt-bindings: wcd938x-sdw: Add static channel mapping support
  soundwire: stream: Add set_master_channel_map() to set static channel
    mapping
  soundwire: qcom: Add static channel mapping support in soundwire
    master
  ASoC: codecs: wcd937x: Add static channel mapping support in
    wcd937x-sdw

 .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 ++++++++++
 drivers/soundwire/qcom.c                      | 18 +++++++
 drivers/soundwire/stream.c                    | 16 ++++++
 include/linux/soundwire/sdw.h                 |  5 ++
 sound/soc/codecs/wcd937x-sdw.c                | 52 ++++++++++++++++---
 sound/soc/codecs/wcd937x.c                    | 12 ++++-
 sound/soc/codecs/wcd937x.h                    |  6 ++-
 7 files changed, 126 insertions(+), 11 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.25.1


