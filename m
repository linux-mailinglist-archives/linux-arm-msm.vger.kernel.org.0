Return-Path: <linux-arm-msm+bounces-35651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C287D9ADC9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DE0BB214D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 06:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F407189917;
	Thu, 24 Oct 2024 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="peKqNvVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40EC171650;
	Thu, 24 Oct 2024 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752828; cv=none; b=m2ynYxnGb/FeujRCkjWK1ukwJpQi0/u/9Zx5fc6s6myKAMQUqtdAknE3cNcsZiXHK1tL4RTAb9wk3l50mD0O/P9INPHqaX0Igh+9CfL7F9oIweBTt1jXYFj5FTMQ9jEisWxbYck/Jbl4Hy5IpdvPRnTUMkO2G6YZ+8LEeV6pv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752828; c=relaxed/simple;
	bh=1pz944t+a9BKJryOTzpFWfMMYcD+NQyp503YqX/ipCA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qwpv4WMXhhAWC7ZWPu5wyMW+uKoHPEzL+6AeoMOD6Yek6GI6YN9xcMKEAmUYsHpOicOjwiehpXzTO1e5ZQaztHQIMLshvaiaMsxWDiMP5k2QTi5RqdsdNVbHsoxrXwba8GfYXnApTP0Oqe3ABArZnsnql2AEPP1R0i/hn9l+GbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=peKqNvVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NNbkMD005001;
	Thu, 24 Oct 2024 06:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=722sH8vlS+jg6Q7ivA83EhL1BYZ69kLJVl+Sto7FhzM=; b=pe
	KqNvVrO+ic2cgkftqoAC9DKbiUloX8MwB1rBQp5lpjiyirEKEuHS3IgvtgdLbQDe
	KflMF+sixdN8rC2UYOyQCexbOI08dn5V07ys0LHNLXzgl2z0MjYQWc4utgKu4DQ8
	B25SaI3r2drYZQaahAPrsMkt7uN+TndYjTzVC97GUofUpbr4IU5DIHci/1UFYHVZ
	V91gZCIHBhmPQBOi1POK/GRuD3XeYdxcbt+Mz0sYMVcTekauug5wXeP4Hm44eGt1
	fmGY2b2xCsRQduT3N4146Y8V00ED/rfbbsQaA7UxHtG9l2CTsXfNC0fCwbw9KDsk
	BlQ2BPlByQEBJFjVUW/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em684qdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O6rROo028969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 23:53:24 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 0/4] source filtering for multi-port output
Date: Thu, 24 Oct 2024 14:53:02 +0800
Message-ID: <20241024065306.14647-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zIkvlmfqhECPK3qMKTdIgbsqYC_OSXli
X-Proofpoint-GUID: zIkvlmfqhECPK3qMKTdIgbsqYC_OSXli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240051

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


Changes in V4:
1. Use "coresight_get_source(path)" in the function
"coresight_disable_path_from" instead of explicitly
passing the source.
-- Suzuki K Poulose
2. Optimize the order of the input parameters for
"_coresight_build_path".
-- Suzuki K Poulose
3. Reuse the method "coresight_block_source" in
"_coresight_build_path".
-- Suzuki K Poulose
4. Remove the unnecessary () in "coresight_build_path".
-- Suzuki K Poulose
5. Add a helper to check if a device is SOURCE.
-- Suzuki K Poulose
6. Adjust the posistion of setting "still_orphan" in
"coresight_build_path".
-- Suzuki K Poulose

Changes in V3:
1. Rename the function "coresight_source_filter" to
"coresight_block_source". And refine this function.
-- Suzuki K Poulose
2. Rename the parameters of the function
"coresight_find_out_connection" to avoid confusion.
-- Suzuki K Poulose
3. Get the source of path in "coresight_enable_path" and
"coresight_disable_path".
-- Suzuki K Poulose
4. Fix filter source device before skip the port in
"coresight_orphan_match".
-- Suzuki K Poulose
5. Make sure the device still orphan if whter is a filter
source firmware node but the filter source device is null.
-- Suzuki K Poulose
6. Walk through the entire coresight bus and fixup the
"filter_src_dev" if the source is being removed.
-- Suzuki K Poulose
7. Refine the commit description of patch#2.
-- Suzuki K Poulose
8. Fix the warning reported by kernel test robot.
-- kernel test robot.
9. Use the source device directly if the port has a
hardcoded filter in "tpda_get_element_size".
-- Suzuki K Poulose

Changes in V2:
1. Change the reference for endpoint property in dt-binding.
-- Krzysztof Kozlowski
2. Change the property name "filter_src" to "filter-src".
-- Krzysztof Kozlowski
3. Fix the errors in running 'make dt_binding_check'.
-- Rob Herring
4. Pass in the source parameter instead of path.
-- Suzuki K Poulose
5. Reset the "filter_src_dev" if the "src" csdev is being removed.
-- Suzuki K Poulose
6. Add a warning if the "filter_src_dev" is of not the
type DEV_TYPE_SOURCE.
-- Suzuki K Poulose
7. Optimize the procedure for handling all possible cases.
-- Suzuki K Poulose

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

Tao Zhang (4):
  dt-bindings: arm: qcom,coresight-static-replicator: Add property for
    source filtering
  coresight: Add support for trace filtering by source
  coresight: Add a helper to check if a device is source
  coresight-tpda: Optimize the function of reading element size

 .../arm/arm,coresight-static-replicator.yaml  |  19 ++-
 drivers/hwtracing/coresight/coresight-core.c  | 116 +++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  18 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +-
 include/linux/coresight.h                     |  12 +-
 5 files changed, 155 insertions(+), 23 deletions(-)

-- 
2.17.1


