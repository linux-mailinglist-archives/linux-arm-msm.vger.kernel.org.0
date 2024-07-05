Return-Path: <linux-arm-msm+bounces-25331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6092842E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 10:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716721C22854
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 08:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04AD146591;
	Fri,  5 Jul 2024 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUBM0O8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288FC145FFF;
	Fri,  5 Jul 2024 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169562; cv=none; b=kxcGyNr7N5kIpt7c8OKdrJL8wBqpbGzGjGNP/gX3c52xcjmFUXXcHUdQfrC7uUMMQSKAdaa7oTpllBMXSLcB3rE1qNIO6lDSBRmhg/sVbQSwUHKNDodtWA6V93LO8DnpvHkI2veOa2mfnJISGxgrzgFlEznQ4XzL999CzHmLbkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169562; c=relaxed/simple;
	bh=tNFKfuk5Ymyt8xk9GhZ2T11xYTpUmsgjx3Rqz+ObP2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tUPFoMbahzmEp/qgIF1gsqJ8Yg/ByGXbWpsKn6s8gvJvhQjEv0IaQE5JGxi5pDSrepHEcR5YlidWl2k25FKRrigMikMFKJ6SrBVGDF3hxurii5LhdyUTllqBVD4EXidQRqaa8GfX9pDRk9csvCSEhSR4rb8eJfSzwLGAQjv6yAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUBM0O8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464Nid1K026603;
	Fri, 5 Jul 2024 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Sg+a5AmYrZODA6buMyIBZVZhyNMtazQcn/qad/A8YnE=; b=jU
	BM0O8R1YF3sYtyqUYGaXSuN/CNnkIrwpPgdh6f9A+IaiugGoqHWKJq5vStNCczM3
	BN+WXiLRim4wThvx2gejIA2vgC8EgeEKHR/S4EvZn+P0XvmW8Y9NmdHURn3m6mZw
	I12guzaAnPBQp5IN5FEfagSoX7f545LDvtAx+F/c3XSNjB7Ooohz9H1VFNuOwnOU
	AnDtYMVSXDa1VQa6fiWR/Vpe/Qb8bA6OQdC63fRDQjkYyKJcLUaE+GF8U0BL4QUR
	neCaGz6/i94gd5NunJ0sQk5LOZcit13AZGeTOR4lhymDru4RINpV9qgd5LafwMHL
	2yOVJF1Fl8CCkesnzAPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe3r13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 08:52:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4658qPig019633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 08:52:25 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 01:52:20 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v1 0/3] Add source filtering for multi-port output
Date: Fri, 5 Jul 2024 16:51:49 +0800
Message-ID: <20240705085152.9063-1-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uWUFv2iMHS_yCMLb3UsUwAt8tRg8SDZa
X-Proofpoint-GUID: uWUFv2iMHS_yCMLb3UsUwAt8tRg8SDZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050066

In our hardware design, by combining a funnel and a replicator, it
implement a hardware device with one-to-one correspondence between
output ports and input ports. The programming usage on this device
is the same as funnel. The software uses a funnel and a static
replicator to implement the driver of this device. Since original
funnels only support a single output connection and original
replicator only support a single input connection, the code needs
to be modified to support this new feature. The following is a
typical topology diagram of multi-port output mechanism.
|----------|     |---------|     |----------|   |---------|
|  TPDM 0  |     | Source0 |     | Source 1 |   | TPDM 1  |
|----------|     |---------|     |----------|   |---------|
      |                |                |             |
      |                |                |             |
      |      --------- |                |             |
      |      |                          |             |
      |      |                          |             |
      |      |                          |             |
   \-------------/ ----------------------             |
    \  Funnel 0 /  |                                  |
     -----------   |     ------------------------------
          |        |     |
          |        |     |
        \------------------/
         \    Funnel 1    /     ----|
          \--------------/          |
                  |                 |----> Combine a funnel and a
                  |                 |      static replicator
          /-----------------\       |
         /    replicator 0   \  ----|
        /---------------------\
             |     |      |
             |     |      |-----------|
             |     |---------|        |
             |               |TPDM0   |TPDM1
             |            \-----------------/
             |             \   TPDA 0      /
             |              \-------------/
             |                    |
             |                    |
             |Source0/1           |
          \-------------------------------/
           \           Funnel 2          /
            \---------------------------/

Changes in V1:
1. Add a static replicator connect to a funnel to implement the
correspondence between the output ports and the input ports on
funnels.
-- Suzuki K Poulose
2. Add filter_src_dev and filter_src_dev phandle to
"coresight_connection" struct, and populate them if there is one.
-- Suzuki K Poulose
3. To look at the phandle and then fixup/remove the filter_src
device in fixup/remove connections.
-- Suzuki K Poulose
4. When TPDA reads DSB/CMB element size, it is implemented by
looking up filter src device in the connections.
-- Suzuki K Poulose

Tao Zhang (3):
  dt-bindings: arm: qcom,coresight-static-replicator: Add property for
    source filtering
  coresight: Add source filtering for multi-port output
  coresight-tpda: Optimize the function of reading element size

 .../arm/arm,coresight-static-replicator.yaml  | 18 +++-
 drivers/hwtracing/coresight/coresight-core.c  | 89 ++++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  | 13 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |  6 +-
 include/linux/coresight.h                     |  5 ++
 5 files changed, 115 insertions(+), 16 deletions(-)

-- 
2.17.1


