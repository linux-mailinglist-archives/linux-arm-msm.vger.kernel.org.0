Return-Path: <linux-arm-msm+bounces-24216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B491787B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D957E1C21E9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C0A13D8A8;
	Wed, 26 Jun 2024 06:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Olw+FSv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DB2B9C0;
	Wed, 26 Jun 2024 06:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382079; cv=none; b=CaACdnGWqoDMW0zHW+nd+VqYyk0pFvo/M4isg/LVIbvQtKhcsldpoDs+dqvpw+8ZXc7Awv/j1mNceb2uBIq5w6NWpV+RAZfgpFXatqWfSGP6a3fYLcYEIzpP8ZYXOcvrz57o71EMztoJjXbr4dGDMyFlel6cfsRLRifL/0+pAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382079; c=relaxed/simple;
	bh=RpW3pyUuDN6ReYlgAjSd9nrfqdrRn2bJnPyDkjkcTUw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gdr38vwAfAQD2bxEo4cPhZ9IJtH7ZRQFKDPemUMAJAHNXD0q+Pim8BaIL/BFk/B3yS3QXN6SpGzcY4ydBF9Nkv7fpH0vpaxtRu+wa5MM37vML1Etp8AB6ITArQCUcJ+xiFgo1HI7o0zOxsCedTB8cy+R8tyI9qxslFQmrnlIpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Olw+FSv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PK6elr018110;
	Wed, 26 Jun 2024 06:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HlqBNYpYDnsP6od7gKlrv+
	WkUaBVZGago0uliQENjrg=; b=Olw+FSv48FSDkx9wM/dIKH8u+BUZqFpB+xJ+6c
	P/c/8woGZHP5uAIGaTREI6CDPF92abxpZANGjM84bTS8Fpxe5yT38YaUbbPzJmEx
	Dwses165XTwWlgnihzr2ksr8FnXMkp60/XEEDopc1Xd1TWUxqSJWTkrd/0ZDUblR
	61zjJfxkN6Y9vQa6jH+zy8kyTC2iRQsm66za0Xj9bccXc5CilXZgY9p+dMuB9gvD
	O3Ndtntv6sMxyPVZeo+NcMB1FRXZD+rINKfN0qka88rIB9eXsuwCqNGLPp/c3sBQ
	V0jQRLFtpUibeLOurw/57G+kpEzMXXe2xKdoMQQnFBRNE4iA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6rbjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 06:07:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q67aVT031734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 06:07:36 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 23:07:36 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        songchai <quic_songchai@quicinc.com>
Subject: [PATCH v3 0/3] coresight: Add preferred trace id support
Date: Tue, 25 Jun 2024 23:07:19 -0700
Message-ID: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RsaxaYJO0j_7DpXlAyhf_thPkv9rC1hr
X-Proofpoint-ORIG-GUID: RsaxaYJO0j_7DpXlAyhf_thPkv9rC1hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=898 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260046

Some HW has static trace id which cannot be changed via
software programming. For this case, configure the trace id
in device tree with "arm,trace-id = <xxx>", and
call coresight_trace_id_get_system_id with the trace id value
in device probe function. The id will be reserved for the HW
all the time if the device is probed.

Changes since V2:
1. Change "trace-id" to "arm,trace-id".
2. Add trace id flag for getting preferred id or ODD id.

Changes since V1:
1. Add argument to coresight_trace_id_get_system_id for preferred id
instead of adding new function coresight_trace_id_reserve_system_id.
2. Add constraint to trace-id in dt-binding file.

Mao Jinlong (3):
  dt-bindings: arm: Add arm,trace-id for coresight dummy source
  coresight: Add support to get preferred id for system trace sources
  coresight: dummy: Add reserve atid support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
 .../hwtracing/coresight/coresight-platform.c  | 25 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  2 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 35 +++++++----
 .../hwtracing/coresight/coresight-trace-id.h  | 11 +++-
 include/linux/coresight.h                     |  1 +
 9 files changed, 137 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.41.0


