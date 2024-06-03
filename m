Return-Path: <linux-arm-msm+bounces-21460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC198D7F47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E5451C213F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A174E84E01;
	Mon,  3 Jun 2024 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DCHqvH0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346D84DEC;
	Mon,  3 Jun 2024 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407864; cv=none; b=PKdxnN4IgBBsO11w/XJ3AzSMbwqYDsk8otUoTHpuNy4QKgspMbQXJ11IsuwW6rD5fRXpL5Yo6iBp1XCBstqJPmrQbb6QLxp+3UafSGKbP4TVo8KlglgJ2FamwAU0u1zS+57BLgZMApNAHz3xj0kNyZuzbVqGJ8u3XMCRXyOVDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407864; c=relaxed/simple;
	bh=DItxAcUNjgy5MW55AtPEraSliiAbVHCEZsIGdQoBIIQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qTvrhgJuQ8sPTJMevhsD4WAQLG8RD97Yd4pP1CIoeOhAoqr9FkFBiGe2lL0Z5JJPucPITqcgQlCG/rYkQYuzlGCceQmZUEOYts2mTR8FZzIq6bEDtK9gpN7hGPzIyBGplmnOrKJwYd/FHIMITPJEAXdEsLpROh7Qe8JoSM8el7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DCHqvH0e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452Lv3Ew001934;
	Mon, 3 Jun 2024 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mxKcaVbif8YR8gm/vyORop
	ep8/jPftOVtg5F3bZkA08=; b=DCHqvH0enz/FSm3CzaBGWlMaapkF5VllW6e0um
	bZpp4IvGQ39o5j+eIW4+kEJHVabOCHprpgLbj6+L604pgzmmADOOnwFC1vbg9qVm
	P50UKbLg8ECkVM63QJ4AzHhYpVENlR6Na1GwdH4p2SJExETD1TCaaTwyE8MnQCFD
	bGYTmwzSCWc5lPK0v0CyG2PQLs3fea6FB/bF95TfJgoHUHpqnaztmLElOf724fiv
	/Hr7y3SFRGFlLln8WOO848O4tSojCqmfjXc6AutPJOohaCuLmpIIZroGC5njCsQl
	hOfAnyER/fxh9XxdCImSl1d10jNcIIBt3FGqR7lRscgZ/w2A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5kkrx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 09:44:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4539i6RH026400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 09:44:06 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 02:44:05 -0700
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
Subject: [PATCH v2 0/3] coresight: Add preferred trace id support
Date: Mon, 3 Jun 2024 02:43:49 -0700
Message-ID: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ad7etsyRz8WJfW-JASeixCXOZGty8fn_
X-Proofpoint-ORIG-GUID: Ad7etsyRz8WJfW-JASeixCXOZGty8fn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 mlxlogscore=840 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030081

Some HW has static trace id which cannot be changed via
software programming. For this case, configure the trace id
in device tree with "trace-id = <xxx>", and
call coresight_trace_id_get_system_id with the trace id value
in device probe function. The id will be reserved for the HW
all the time if the device is probed.

Changes since V1:
1. Add argument to coresight_trace_id_get_system_id for preferred id
instead of adding new function coresight_trace_id_reserve_system_id.
2. Add constraint to trace-id in dt-binding file.

Mao Jinlong (3):
  dt-bindings: arm: Add trace-id for coresight dummy source
  coresight: Add support to get preferred id for system trace sources
  coresight: dummy: Add reserve atid support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 58 +++++++++++++++++--
 .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 32 ++++++----
 .../hwtracing/coresight/coresight-trace-id.h  |  5 +-
 include/linux/coresight.h                     |  1 +
 8 files changed, 128 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.41.0


