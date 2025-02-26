Return-Path: <linux-arm-msm+bounces-49420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61FA455D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 897BE177448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33FB269AEA;
	Wed, 26 Feb 2025 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KwSTyPY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867326A093;
	Wed, 26 Feb 2025 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740552039; cv=none; b=OR9suJ9S00BuFPjV2SHCBKeqTSlOb5/PlAiFLAPikInqmiT7noSelk0d/79O6r1ORYfezT0soMa9XZFoQ3rsKGDH/pvp0aXm0awtJ0xnS6eLAASY9SF4VfuOgpsaC0tui8wwTZhygDkGmKu+49vxicBCNEVvGs8jDxDg2S6+icI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740552039; c=relaxed/simple;
	bh=KA0z0sZI44EPNVCp0Ji9pEwp1ewbw9YFLH52MbjN6+Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ljvfK6mH6Pp2uZfw72cbMYUkebgOySeh0aTjwx8EYb/ro8SnoxW1SYC5NC5iwJNTZNBq3qyw/IGf9z49APHMU7LAJgTmAtxwTyXxMyeovQF0zhaOg88jHmQzRSp0bXbhFk1z/J7AsPj9UrP36zImnkhm72oAstLlt0ZoNdnTdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KwSTyPY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMX2Nh011930;
	Wed, 26 Feb 2025 06:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q6KRKhgiFSyppJoyuQD2m7
	H324VXci25W2Tl1Ha42rg=; b=KwSTyPY8oBBR1eK6gwSJGqHwV8neRtiv+HN/x8
	ze7/jZS0P4bG0SiSqrRBmW51ptRnxuTmxbWctwXC8E6cQzXxkzQo7zZWX0VzFLVN
	7vB4hUzDEXqE9wJoY2N9yDUQz0wqoBsbCBSsq/RNJV4c4dRMHevbEgiJcN7Yl+DX
	NaJl9vkbcf7qJT+zabJdj6KB5J/J5HDZBLL7npox9cDzhXYHbPc+BBmisEHsPzCp
	5pEJ2sn9VZTwlop+IJ/0JaHWkU+dynUUlOeWseOOmN97jbjSzWwWxCKFjV7LyjmZ
	wMv7gBrLJBA40z5PrhSCZkbnxSQQfs/FqKl1BAumOitBqVnQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk90hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q6eQpA016207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:26 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 22:40:26 -0800
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
Subject: [PATCH v4 0/3] Add support to configure TPDM MCMB subunit
Date: Tue, 25 Feb 2025 22:40:05 -0800
Message-ID: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oJezr4Xre9TLScOU74gDakWWLUZPp_ZB
X-Proofpoint-ORIG-GUID: oJezr4Xre9TLScOU74gDakWWLUZPp_ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=832 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260051

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

Changes in V4:
1. Update the date and kernel verison in ABI file.
2. Update the year of copyright. 

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


