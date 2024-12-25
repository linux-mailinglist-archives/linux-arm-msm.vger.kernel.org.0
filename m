Return-Path: <linux-arm-msm+bounces-43292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48309FC4CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 11:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB20163E2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 10:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618831465A1;
	Wed, 25 Dec 2024 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bUg9Nsl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F331D696;
	Wed, 25 Dec 2024 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735123295; cv=none; b=LLoAjlTd8T2zcipjHzvMOWZ/CoBwj/gJ0kGEEI8gHoz/QeDqNcgkyw+6oHZ7x+BDi7fMvs0a/b787nTJx6wexZrjRpVVICnB2C+yWacCTHW0NjOTgEAV4LWYGxJE5f0GIHw0cNkHWeQ9NfoywLeaTEfJsAChKINg4+Fr8C4kzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735123295; c=relaxed/simple;
	bh=CtaHU0MAmz8YjqpbLYGCXriGylSGNzP0piypES70IEs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KYpyiuwaQM7ndO4WlB/8CVHXc4Wz1wV1gvZZiEuFtBDbWfqMt8eWUHBhy7De5Y/U3x16DS+s4ecIiRr3hz17KaA8Wp735m8enaW+aVonE+LL2dspaOyxu84vPfNTl330TL/Op2wtu4eJPYMkqfzHx5WPbog8NVrewFBl74IB/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bUg9Nsl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2ZohA029012;
	Wed, 25 Dec 2024 10:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4ccDKxYtB2BjCAgx7sUJFLkUp3I/k2NAnkNJaFwOBT4=; b=bU
	g9Nsl2EwtIyqhQobCuhTgeQsEQKNhkAkGRMudFLLBMCTpaXWTEcO9UbUU867pZ9v
	sARDxs2sIJFXb8eOaK59wgPruV0VrzEQbBQLj4ThwSo4eTXR/txCC9XE3v9+FkDP
	2TTq9IMNKcKJ4SlwqgNKuyGwYGUbP+pvid+FT8KDfSPGMhvya8/cLlkKUd6JTvF0
	kEJQYeeLG+Mk2NELWIj+OGvts4h9PvoIvlOYYHTnqXzywIDcByuyNZJsHpp6VgR/
	/fb6I6ZhbIS3DlQ9nxM3D+JOqL67/4Gcrct6U8gWvv1wsyy7rgTDzZuvrFEjYFtX
	fVpUvoWr1lA5luXdq7EQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43r9dd9rdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPAfNGA018004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:23 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:41:20 -0800
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
Subject: [PATCH v3 0/3] Add support to configure TPDM MCMB subunit 
Date: Wed, 25 Dec 2024 18:41:04 +0800
Message-ID: <20241225104107.13425-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 41WGpP7Gh4S7aIzuC3lBmfXYD6DEzzdI
X-Proofpoint-GUID: 41WGpP7Gh4S7aIzuC3lBmfXYD6DEzzdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=779 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250094

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

Changes in V3:
1. Update the date in ABI file.
2. Remove the unrelated change.
3. Correct typo.
4. Move the CMB_CR related definitions together.

Changes in V2:
1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
2. Embed mcmb_dataset struct into cmb struct.
3. Update the date and version in sysfs-bus-coresight-devices-tpdm
Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20241105123940.39602-4-quic_jinlmao@quicinc.com/

Mao Jinlong (1):
  coresight-tpdm: Add MCMB dataset support

Tao Zhang (2):
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 120 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
 4 files changed, 155 insertions(+), 20 deletions(-)

-- 
2.17.1


