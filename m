Return-Path: <linux-arm-msm+bounces-34028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC4999CF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44549B222D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA06A20966C;
	Fri, 11 Oct 2024 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DOTS+2Pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3199C19923C;
	Fri, 11 Oct 2024 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629278; cv=none; b=TQlp7b/NPqCa0/EqkmzBRjwq9Nkw1Ib1p39zy0ox/UnSNWVKbtu7+6T+EYGz7lUEEEpLgCd9LZL61rv64HaosTvkJrcSN+R5LXFMC2BFgB1THPHzOYpe0ZfFyB2mUArj6MzLI2KrWhYc4taeaNzrcytXGL5idO4PJc0y2uLdH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629278; c=relaxed/simple;
	bh=lqeIU0Ya4tm0dUD6gRoDOQLAc84JQBGmCnF++tHWHUI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hmSOTBU3pyu0Ghyo1D6d4Iimsnsen2O8SJ8IYmuBs8DKwSEUCd75oJTJaJ4JJN5ZgQH4wW8LfpgJE5bgriQxD8VwNO/5Yq8EHfZl+Bb9LY6B7KQcJg7QVAfWGcIwYpvnwI51avhjUEPvHVpZvy7eAYP2RVgvav9/Ai+MCrI23xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DOTS+2Pp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4nQY4008279;
	Fri, 11 Oct 2024 06:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wNPzb6+bWZo38HPDJePXJ/
	3eRd7xcPQkoCdaV9cYYRI=; b=DOTS+2Ppcr5ioNMdT24bS13d4V0G14Cu1FbKU1
	XOIct7qzMDA8d1JvWy7F/BQW7SIffe0UADLl4fumMtfFCrhiHgqMuKXQjHy17beH
	qmhu2Z4ZzWMqSBM4Kxr4a3OhIUMs2SbbFEEv8+HJKrlXCea0f8kVfFbSzQBIw4if
	83PaaspNcQPrt5xnpCEtrqMubqk9NVnFn8tK5GoXDIHZ2NLFqjVOP33tAoqvHvEZ
	ceBQZpJ7NProCryobHrE3xaK2zpnVO/RH6SspkfJlVh37xwK94mAJU76NEqfpo3r
	oblBFnuP298VEG0pvAPKUW7qYH9e+Z+ODfglHEVZ2GZZ6zJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426gw2j2b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6livn028142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:45 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:47:44 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v1 RESEND 0/3] Add support to configure TPDM MCMB subunit
Date: Thu, 10 Oct 2024 23:47:27 -0700
Message-ID: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1STqIZHG0vEMKGpLLuglP11PTuA3cbxj
X-Proofpoint-ORIG-GUID: 1STqIZHG0vEMKGpLLuglP11PTuA3cbxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=716 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110043

Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit has the same number and usage of registers as CMB subunit.
Just like the CMB subunit, the MCMB subunit must be configured prior
to enablement. This series adds support for TPDM to configure the
MCMB subunit.

Once this series patches are applied properly, the new tpdm nodes for
should be observed at the tpdm path /sys/bus/coresight/devices/tpdm*
which supports MCMB subunit. All sysfs files of CMB subunit TPDM are
included in MCMB subunit TPDM. On this basis, MCMB subunit TPDM will
have new sysfs files to select and enable the lane.

Mao Jinlong (1):
  coresight-tpdm: Add MCMB dataset support

Tao Zhang (2):
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   5 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 121 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  32 ++++-
 4 files changed, 164 insertions(+), 9 deletions(-)

-- 
2.46.0


