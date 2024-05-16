Return-Path: <linux-arm-msm+bounces-19906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE808C7079
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 04:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B0F9B22610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 02:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52F21A2C33;
	Thu, 16 May 2024 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ReJ90PEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61203522E;
	Thu, 16 May 2024 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715828235; cv=none; b=dwlt58DFftKw7zMLq1wozeKY90xChEtTXGPv6ceEki9M5ntxj1lhiFQqZMwY3IEYNaPnmvaETFTT6YlbWw7Aw0xnXjRyGn32Az1MB7XmtMhvGhk8POGGi0ofep+d004uCYJAWfNLruZhOHS78zx1XlFMVlZpZWOgPD43UcszEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715828235; c=relaxed/simple;
	bh=GziP5EuxONdYvySF6zDKZ9ctaWsBMTU2rlgzt665eRg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cTRNSP6i3ifozcyvTYmliF2tzkwK7iH0P2+2pl32cbaZO9SRPzrvfbHaV+/5leGYAeYnjJzd08YXJypEKxGOFThOjUQqLz6pGeRTBlArMHRFUc0rxu5VN8GNs+uyQRD1nAkFU2qdf6BOMBFHAF5pVp/Y1JoX6f5QV/VkAGFnmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ReJ90PEl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FLC8QM024800;
	Thu, 16 May 2024 02:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=KPSTHVO
	hJbfke8X0OKBwneEFhJUY7shxJp8KynfdjUI=; b=ReJ90PEl0k+7Ub4iYp9ADYt
	HfKGcH6YWIg/trFkrq0dHkoYqDJqOjZ5LwBM/pxg1e8cOEfbCF6lej22M4Y6C1N/
	8+vskoSIo2l2hXn4sykix4KbQXHXXM4NHr1x+ZPvuX7CejgiJ9TEgC5f9SE61gSR
	chCeRqDrfD7w0OCOfpbD9k4xoHyofHFltDe8xSl4OpuglpgzsPdu9QWXNDrln62M
	Kco4z1BiAqZA32/1dyEuGSqRdu2buT2vzssFjX+zPH2y3nQmKwYWOpZn9eqQKP7x
	8TS1X7S3zIEJyVZyC1lzg3mnDTMFaffX1phuWGLLd7FZiqHYQBMUvVGrpgqmL7A=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49gdv0vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G2uuVb001680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:56 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 19:56:56 -0700
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
Subject: [PATCH v1 0/3] coresight: Add reserve trace id support
Date: Wed, 15 May 2024 19:56:39 -0700
Message-ID: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
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
X-Proofpoint-GUID: ZR5JZ_7ZG0E4tv2M234P1Vu7hXVMu69p
X-Proofpoint-ORIG-GUID: ZR5JZ_7ZG0E4tv2M234P1Vu7hXVMu69p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=828
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160019

Some HW has static trace id which cannot be changed via software programming.
For this case, configure the trace id in device tree with
"trace-id = <xxx>", and call coresight_trace_id_reserve_system_id in
device probe function. The id will be reserved for the HW all the time
if the device is probed.

Mao Jinlong (3):
  dt-bindings: arm: Add trace-id for coresight dummy source
  coresight: Add reserve trace id support
  coresight: dummy: Add reserve atid support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 56 +++++++++++++++++--
 .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++
 .../hwtracing/coresight/coresight-trace-id.c  | 24 ++++++++
 .../hwtracing/coresight/coresight-trace-id.h  | 11 ++++
 include/linux/coresight.h                     |  1 +
 7 files changed, 135 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.41.0


