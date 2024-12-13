Return-Path: <linux-arm-msm+bounces-41952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD749F0914
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78B231696F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81581B414B;
	Fri, 13 Dec 2024 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TKaNKNCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAC1AE850;
	Fri, 13 Dec 2024 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084540; cv=none; b=XCn0EPiD/hFYfp7yn4By7JW+QFaWwml8xu+vO9bez9RIr8PYZq5VEPOOuRG+Fk4oUgANZCW8l8++Uasvx874fMOtlocF5DkQ0TFFB2UR/Gy1DZo/lfW1oQI09E3no7MN1M0tNkN9EumxNmbLt1NvJLkdWJtcmTxnUI+uilZtY7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084540; c=relaxed/simple;
	bh=+3ucTeNBpy8yEnLi1K9jHDkWXwRa1EWYJdIbFTU9wOQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JSNLurbQl0edudNsbwULIieGCd55KK7BxvxSpiJkgcWPFOZZZeYYItdRWeUWJQXY5ggbMASHlHW6bGBDVzdbyBlpTdGZEu8DKgOGhO8zePiF5aw5e+jia4cDqRhWs3xdHstatiqTntMDLdPa6YrVuOYEv4/o6WQaIagtXnH7UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TKaNKNCX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8aGeN022795;
	Fri, 13 Dec 2024 10:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=N8JLusC+rWUZfPPXrdSX0CnPNMcJ2qdtDts6a60BTFQ=; b=TK
	aNKNCXHhDgb1Buo+Jj3lq2+UBZwBC+5VOnWI7ODR0U0SCCutnggX8T4lKYtd8X+6
	hzwyGk7KsJ2HPDubBggfMNJ1XzZgqaC0Wj9fTGhahfWTe6acyag2691dYuOvVi6h
	d6gasLUhgF78715MpHmmcHhPZfHwLYdlpErCfcRrYskL2r+M49ewdw7Z9LwDkKDo
	Bw66Zs3cIf0f4vyDCcNVs8NykqsKbaTyc2oVKflH8qQWqskrGTFfcvtcs0bDpzrg
	PVQt4EDIxo6kAkfzBuPDHpG7idWs8B/7RjXBLKjHUJZSDivbnGBCvy1NmVsSuTAn
	bKDeHzdyf/1CJQTOMOOA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wna19x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDA8bRZ020692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:37 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 02:08:34 -0800
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
Subject: [PATCH v7 0/4] source filtering for multi-port output
Date: Fri, 13 Dec 2024 18:07:27 +0800
Message-ID: <20241213100731.25914-1-quic_taozha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -nC0BzTkLZyvSKudH8jLuuCyzS3IXKx4
X-Proofpoint-GUID: -nC0BzTkLZyvSKudH8jLuuCyzS3IXKx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130069

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

Changes in V7:
1. Correct the use of incorrect characters.
-- Suzuki K Poulose
2. Rebase the series on v6.13-rc1
-- Suzuki K Poulose

Changes in V6:
1. Optimize the prompt content of the warning log
when the filter handle is not a trace source.
-- Suzuki K Poulose
2. Reset the filter device and fwnode if it is not
a trace source.
-- Suzuki K Poulose

Changes in V5:
1. Replace "filter-src" with "filter-source" in the
dt-binding document.
-- Suzuki K Poulose
2. Optimize the comments of the patch "coresight:
Add support for trace filtering by source" due to bad
example.
-- Suzuki K Poulose
3. Correct spelling errors in the patch "coresight:
Add support for trace filtering by source".
-- Suzuki K Poulose
4. Optimize the function "coresight_blocks_source".
-- Suzuki K Poulose
5. Add { } in the function "of_coresight_parse_endpoint".
-- Suzuki K Poulose
6. Adjust the order of the patches.
-- Suzuki K Poulose
7. Adjust the alignment in "coresight-platform.c".
-- Suzuki K Poulose

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
  coresight: Add a helper to check if a device is source
  coresight: Add support for trace filtering by source
  coresight-tpda: Optimize the function of reading element size

 .../arm/arm,coresight-static-replicator.yaml  |  19 ++-
 drivers/hwtracing/coresight/coresight-core.c  | 113 +++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  21 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +-
 include/linux/coresight.h                     |  12 +-
 5 files changed, 155 insertions(+), 23 deletions(-)

-- 
2.17.1


