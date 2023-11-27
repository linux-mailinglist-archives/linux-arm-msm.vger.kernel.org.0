Return-Path: <linux-arm-msm+bounces-2107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E147FA3B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84F79B2116A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F328E3E;
	Mon, 27 Nov 2023 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f+jDTkvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5A0A8;
	Mon, 27 Nov 2023 06:55:03 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARBtAcQ025895;
	Mon, 27 Nov 2023 14:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4jrRKCvIIQbiqkOeD/l1o6p8cIKKL4C20uJE/QzvGFM=;
 b=f+jDTkvHbfRDCI6qJsOiRJvDpIwIk7Cvaxu3rJWb8vZ2vDcyVGpIslafpnFbxzdtpSie
 CgOJW+MHJU+3E1UuSRT/CtRT500RDvPt2Ti7ZhgHeNRnXNENy/3k4O6vbAnoGT08bzHB
 3wLuaJDlvROc7ycq/ZaiSeypNvDTf658F2zYsgxNspqIbqZfcurvjxC//kq6gVoNoyv+
 hKNDzHbMy0M7EFO1iUlfEeZ96RgzOa67AKoetMfOEtuvmZl/56S/h7YJw9cAJnXDZcNl
 8T7IpNyp/kUKpM561Y9BJdBvyp/dnXqlswZp8OthoZzKTtg9j9Q7lcSADQFzrr6AEYg/ bw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umsvagk79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 14:54:37 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AREsaaX009509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 14:54:36 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 06:54:29 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <dmitry.baryshkov@linaro.org>, <a39.skl@gmail.com>,
        <konrad.dybcio@linaro.org>, <quic_bjorande@quicinc.com>,
        <mani@kernel.org>, <quic_eberman@quicinc.com>,
        <robdclark@chromium.org>, <u.kleine-koenig@pengutronix.de>,
        <robh@kernel.org>, <vladimir.oltean@nxp.com>,
        <quic_pkondeti@quicinc.com>, <quic_molvera@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <qipl.kernel.upstream@quicinc.com>,
        Bibek Kumar Patro
	<quic_bibekkum@quicinc.com>
Subject: [PATCH v3 0/4] iommu/arm-smmu: introduction of ACTLR implementation for Qualcomm SoCs
Date: Mon, 27 Nov 2023 20:24:08 +0530
Message-ID: <20231127145412.3981-1-quic_bibekkum@quicinc.com>
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
X-Proofpoint-ORIG-GUID: BeMLe1cjLIGR24BW_9xag885Gx5CRuLZ
X-Proofpoint-GUID: BeMLe1cjLIGR24BW_9xag885Gx5CRuLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_13,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270102

This patch series consist of three parts and covers the following:

1. Introduce intital set of driver changes to implement ACTLR register
   for custom prefetcher settings in Qualcomm SoCs.

2. Add ACTLR data and implementation operations for SM8550.

3. Add ACTLR data and implementation operations for SC7280.

4. Re-enable context caching for Qualcomm SoCs to retain prefetcher
   settings during reset and runtime suspend.

Changes in v3 from v2:
 New addition:
 - Include patch 3/4 for adding ACTLR support and data for SC7280.
 - Add driver changes for actlr support in gpu smmu.
 - Add target wise actlr data and implementation ops for gpu smmu.
 Changes to incorporate suggestions from Robin as follows:
 - Match the ACTLR values with individual corresponding SID instead
   of assuming that any SMR will be programmed to match a superset of
   the data.
 - Instead of replicating each elements from qcom_smmu_match_data to
   qcom_smmu structre during smmu device creation, replace the
   replicated members with qcom_smmu_match_data structure inside
   qcom_smmu structre and handle the dereference in places that
   requires them.
 Changes to incorporate suggestions from Dmitry and Konrad as follows:
 - Maintain actlr table inside a single structure instead of
   nested structure.
 - Rename prefetch defines to more appropriately describe their behavior.
 - Remove SM8550 specific implementation ops and roll back to default
   qcom_smmu_500_impl implementation ops.
 - Add back the removed comments which are NAK.
 - Fix commit description for patch 4/4.
 Link to v2:
https://lore.kernel.org/all/20231114135654.30475-1-quic_bibekkum@quicinc.com/

Changes in v2 from v1:
 - Incorporated suggestions on v1 from Dmitry,Konrad,Pratyush.
 - Added defines for ACTLR values.
 - Linked sm8550 implementation structure to corresponding
   compatible string.
 - Repackaged actlr value set implementation to separate function.
 - Fixed indentation errors.
 - Link to v1:
https://lore.kernel.org/all/20231103215124.1095-1-quic_bibekkum@quicinc.com/

Changes in v1 from RFC:
 - Incorporated suggestion form Robin on RFC
 - Moved the actlr data table into driver, instead of maintaining
   it inside soc specific DT and piggybacking on exisiting iommus
   property (iommu = <SID, MASK, ACTLR>) to set this value during
   smmu probe.
 - Link to RFC:
https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/

Bibek Kumar Patro (4):
  iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
  iommu/arm-smmu: add ACTLR data and support for SM8550
  iommu/arm-smmu: add ACTLR data and support for SC7280
  iommu/arm-smmu: re-enable context caching in smmu reset operation

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 185 ++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   5 +
 4 files changed, 193 insertions(+), 8 deletions(-)

--
2.17.1


