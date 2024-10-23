Return-Path: <linux-arm-msm+bounces-35536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070689ABEA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34E9284458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C9F14A4E1;
	Wed, 23 Oct 2024 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o7FglmnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC84149C57;
	Wed, 23 Oct 2024 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729664668; cv=none; b=Bs5FZFokHCoXgFCySEDcAlrT6UEtB0J+dx94sc4PHpdFQSFjtBk+rRcVeZVCH9hW5KR0AN8BE/1HxOhZs7kHAjt71u3X1IHelm2kHhkqLTWXhVaKhRESsg8w5zvLKjVa6vTTKP0P09s0IEPPA069R7ju+uo2ZP/uvGcPOj5JgGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729664668; c=relaxed/simple;
	bh=IFeKc89QaO+eYZaE146VWSl3aq9xGMn3iEQrzKkeeHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=feuG34ybrEdOtZRWm6lePvaVDEL0hcLf2oto8gfGu8YDs6qSg1IJ0ytEkOnF1d0gdcrEY3K6Kiu+fOE9uHzNDPzAXYJ1qpI/3/i70R4MAzIrUKnhG+Ko1EfPqb+DTVwGC3fAIr2cG8ynI+W9mdkeDIAdONH7IQk8TjJ9D/niyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o7FglmnM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa0k1029512;
	Wed, 23 Oct 2024 06:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kf1w2trACv87w1EUPIPbIo
	wPpzj3SRDz6K5hqU1ltuY=; b=o7FglmnMzR3b6/w9pV/olcGk8e7u4rLo+X5HyE
	XXJ7Nb2OrFMIXPCeed2EF2jLDfFi6pSRE0AdD4zTwggIkiQYX/+weESmiDOxYVFZ
	PjUT4sA7rMwAQH3Xn4tcPpyrC8CYTG46VMvCWaqaTHt2GSazeDYSCv1D/cAQrhpf
	lwiPV5PqtdGPjRx9UO28c0OSD/AmYyryKdXt9nIxlbjDrMk8JurXRRVTl2HAzAFx
	sBXALkKe8QLTcx7U8X8tjmVuIAVA3DXnM1up1uiRSNQVbf9uDiwKuI4rY09Wwmh3
	aSWiCV8YzZNqZWY/W7RO3ZiHi4d3fBd5v8qf9DBmW1fiRzhA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w142k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:24:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N6OCfd027312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:24:12 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:24:04 -0700
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
Subject: [RESEND v2 0/4] Add static channel mapping between soundwire master and slave
Date: Wed, 23 Oct 2024 11:53:27 +0530
Message-ID: <20241023062331.3872883-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: O-yqcPy9LspCTWidAJdrVnrMSVdxw1mL
X-Proofpoint-GUID: O-yqcPy9LspCTWidAJdrVnrMSVdxw1mL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230037

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
 sound/soc/codecs/wcd937x-sdw.c                | 38 +++++++++++--
 sound/soc/codecs/wcd937x.c                    | 53 ++++++++++++++++++-
 sound/soc/codecs/wcd937x.h                    |  6 ++-
 sound/soc/qcom/sdw.c                          | 34 ++++++++++--
 6 files changed, 183 insertions(+), 10 deletions(-)


base-commit: 7436324ebd147598f940dde1335b7979dbccc339
-- 
2.25.1


