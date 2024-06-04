Return-Path: <linux-arm-msm+bounces-21544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB48FA85E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 04:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D42531F2567A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714EA137C34;
	Tue,  4 Jun 2024 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAj0HVVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B722AD04;
	Tue,  4 Jun 2024 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717469310; cv=none; b=SNVQA/GBSuBYLtKUj2vZt4hW52f/cG9ypq8xA30FV8AvIqvjTnCxosJzFAxug+0YTdaJrwng2zq9VC2ODyRinddDkD3IBM0UXHGde9BZzdDCZooiC3VanfiJVYxbw1gNBRkIm5BaPz0CAw2ROUd3v/VDNHzaU40kh3gZycHCkJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717469310; c=relaxed/simple;
	bh=JW+7DjScBdS8dK/sOcyD9WjXP7CreJL8ky4P0cdfV9g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jn5/xCULQwjYSFmE5GrJVPb7Edi9+vH7qsD5OFzrAqP7vdcVfiti+KP6/Jo+XUdu6zr/h4Ot2mx7sGjCKOdh6RfLgVoPoSrepmFGCszrBdULBksK65fm6mhcpCL0SjoxM7bO8ynAyfXtFcTunpoguEy5W1/zch/j1UzPGCjJtAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAj0HVVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4540CwXV022087;
	Tue, 4 Jun 2024 02:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=abhgvx5PcQ2TPqFSMg9xhOSMCDgZLFd/2VxdwZcjVmQ=; b=SA
	j0HVVz8p3Sitaob+eC9rssKk1spawnKMSQVNNWih4H6tCGZXx4yxJlyQJLSA5Fbq
	OChexmwc1a/l7TV9tEfKduoFRcfvtHm4C6kPBALzAInqgKDB5zjBHuzVmFshXJnn
	sHzY27730xBTc9wfhOlXqZ2TRu1Xfa9pb7rR/WrYyVXc7SFBGNxik3MCkH1voRj7
	rMAdglgm2tQ6Z2hFZSxmrIDrckIHnuXV8AyXryyRkJ8s0sZrccg4XC0TGqXanFeE
	aM7WANIgQWeQu6y/+2K8M2hMB6wsloJ3/h71qQXItJO3+HOshqB9sJ7yB0/3y3va
	uSaIGhhfE7hP1XoQxY3A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wnhg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 02:48:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4542mGrZ027630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 02:48:16 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 19:48:12 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Jie Gan
	<quic_jiegan@quicinc.com>
Subject: [PATCH 0/3] Add support to configure TPDM MCMB subunit
Date: Tue, 4 Jun 2024 10:47:38 +0800
Message-ID: <20240604024741.3550-1-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yEXelwuhrjgHKwUDtQOZgsVa1kSTJuZx
X-Proofpoint-ORIG-GUID: yEXelwuhrjgHKwUDtQOZgsVa1kSTJuZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxlogscore=741 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040021

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

Tao Zhang (3):
  coresight-tpdm: Add MCMB dataset support
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   4 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 119 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  33 ++++-
 4 files changed, 162 insertions(+), 9 deletions(-)

-- 
2.17.1


