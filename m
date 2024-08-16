Return-Path: <linux-arm-msm+bounces-28823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E6955026
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 19:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35751F235A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88F11C231F;
	Fri, 16 Aug 2024 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YwbptvIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2641C2317;
	Fri, 16 Aug 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830228; cv=none; b=cDzhKnnpDmDUoQrD0YPq8cXdBpW+AdTKbMGPk9xUcoo+pkVuaN8dNgNJL0yIMB9HKTsnoOiZCVtUu56ivSaP0VYrMIN/TuvrW5DUz1CT+/AAibYrIzmCtTUNbmNw428FndgHnxNNQ6TVivFae1Mi05q/8dNXDYYKfn72ctG8UOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830228; c=relaxed/simple;
	bh=yDkfcWTp+QmNqkfqfdUDxFDPyDOZPP5LO8lKPvjMTnc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rLA1MXRZ/grW4TC3J5vcTOGqn2SkBZGGkusegIZ5YMJNhthIK54FG/Fm7WOY71XJj/7gqFxNAxMPv4RbNQAjfPOxSHbrGcuGs2RM81hNeFgl5El6V6q9Ivpn+C8jyEwZ0a+krp+ED98jpSCNQ5RJ07PYWbpmRNWmHBekDwQKCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YwbptvIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G7ZenG025470;
	Fri, 16 Aug 2024 17:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z1R3XUleNTgelwO5ooUqyh
	a4Y9uVYcbtADRZFrri/V8=; b=YwbptvIY4XulhmcEAgquhmISOel2jYOqqJc+RD
	nATZYCUWzysf+m02R+3jdsxNTs5G4+jINvR4Yuapsxzu2lAyjjtAoz6oJ472d88i
	0tznSGYZK9BsTqXq/zmjhhy+Av5pbSa8Qq1oKMziT6HkqMhoQujOJ1yBNm/IlBdX
	3RYOVH5Ptc3IqiPXtTBlfbj7Vc4DiosqV46LE/NrVM095vQ/l4KLYxfCj0JBEmPw
	TxbqHyIdEcl70ebonm0aVHv+kQCb4Vf7fiDnpZ+HFHp8d+dz64dHbD3aVGL++zbg
	W3Bo4lUt8zlIbkH+KidKp9zgzY3I+APxldlmTVgwslg3Sq7w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411957vtv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GHhQo4012152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:43:26 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 10:43:21 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v14 0/6] iommu/arm-smmu: introduction of ACTLR implementation for Qualcomm SoCs
Date: Fri, 16 Aug 2024 23:12:53 +0530
Message-ID: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SZmVcq98zoWmRbOZHoMykowyWV3zWKlw
X-Proofpoint-ORIG-GUID: SZmVcq98zoWmRbOZHoMykowyWV3zWKlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_12,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160124

This patch series consist of six parts and covers the following:

1. Re-enable context caching for Qualcomm SoCs to retain prefetcher
   settings during reset and runtime suspend.

2. Remove cfg inside qcom_smmu structure and replace it with single
   pointer to qcom_smmu_match_data avoiding replication of multiple
   members from same.

3. Introduce intital set of driver changes to implement ACTLR register
   for custom prefetcher settings in Qualcomm SoCs.

4. Add ACTLR data and implementation operations for SM8550.

5. Add ACTLR data and implementation operations for SC7280.

6. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.

Changes in v14 from v13:
 Patch 6/6:
 - As discussed incorprate changes to carry out PRR implementation only for
   targets based on MMU-500 by using compat string based SMMU version detection.
 - Split the set_actlr interface into two separate interface namely set_prr_bit
   and set_prr_addr to set the prr enable bit and prr page address resepectively.
 Patch 3/6:
  - Fix a bug in gfx actlr_config which is uncovered while testing the gfx actlr setting in sc7280
    during PRR experiment which prevented clients on certain sids of gfx smmmu to be skipped during
    setting up of the ACTLR values : Fix involves swapping the arguments passed in smr_is_subset to make
     device smr <from devicetree> a subset of actlr_config table entries < defined in the driver>.
 Patch 4/6, 5/6:
  - Sort the actlr table values in increasing order of the SIDs.
 Link to v13:
 https://lore.kernel.org/all/20240628140435.1652374-1-quic_bibekkum@quicinc.com/

Changes in v13 from v12:
 - Fix the compilation issues reported by kernel test robot [1].
 [1] https://lore.kernel.org/all/202406281241.xEX0TWjt-lkp@intel.com/#t
 Link to v12:
 https://lore.kernel.org/all/20240626143020.3682243-1-quic_bibekkum@quicinc.com/

Changes in v12 from v11:
 Changes to incorporate suggestion from Rob:
 - Fix the set and reset logic for prr bit as pointed out in v11-6/6.
 - Rename set_actlr_bit function name to set_prr.
 - Add extension for PRR name as Partially-Resident-Region in comments
   for set_prr function.
 - Add few missing sids for sc7280 in patch-5/6.
 Link to v11:
 https://lore.kernel.org/all/20240605121713.3596499-1-quic_bibekkum@quicinc.com/

Changes in v11 from v10:
 - Include a new patch 6/6 to add support for ACTLR PRR bit
   through adreno-smmu-priv interface as suggested by Rob and Dmitry.
 Link to v10:
 https://lore.kernel.org/all/20240524131800.2288259-1-quic_bibekkum@quicinc.com/

Changes in v10 from v9:
 - Added reviewed-by tags 1/5,2/5,3/5.
 Changes incorporated:
 - Remove redundant PRR bit setting from gfx actlr table(patch 4/5,5/5)
   as this bit needs special handling in the gfx driver along with
   the associated register settings.
 Link to discussion on PRR bit:
 https://lore.kernel.org/all/f2222714-1e00-424e-946d-c314d55541b8@quicinc.com/
 Link to v9:
 https://lore.kernel.org/all/20240123144543.9405-1-quic_bibekkum@quicinc.com/

Changes in v9 from v8:
 Changes to incorporate suggestions from Konrad as follows:
 - Re-wrap struct members of actlr_variant in patch 4/5,5/5
   in a cleaner way.
 - Move actlr_config members to the header.
 Link to v8:
 https://lore.kernel.org/all/20240116150411.23876-1-quic_bibekkum@quicinc.com/

Changes in v8 from v7:
 - Added reviewed-by tags on patch 1/5, 2/5.
 Changes to incorporate suggestions from Pavan and Konrad:
 - Remove non necessary extra lines.
 - Use num_smmu and num_actlrcfg to store the array size and use the
   same to traverse the table and save on sentinel space along with
   indentation levels.
 - Refactor blocks containing qcom_smmu_set_actlr to remove block
   repetition in patch 3/5.
 - Change copyright year from 2023 to 2022-2023 in patch 3/5.
 - Modify qcom_smmu_match_data.actlrvar and actlr_variant.actlrcfg to
   const pointer to a const resource.
 - use C99 designated initializers and put the address first.
 Link to v7:
 https://lore.kernel.org/all/20240109114220.30243-1-quic_bibekkum@quicinc.com/

Changes in v7 from v6:
 Changes to incorporate suggestions from Dmitry as follows:
 - Use io_start address instead of compatible string to identify the
   correct instance by comparing with smmu start address and check for
   which smmu the corresponding actlr table is to be picked.
Link to v6:
https://lore.kernel.org/all/20231220133808.5654-1-quic_bibekkum@quicinc.com/

Changes in v6 from v5:
 - Remove extra Suggested-by tags.
 - Add return check for arm_mmu500_reset in 1/5 as discussed.
Link to v5:
https://lore.kernel.org/all/20231219135947.1623-1-quic_bibekkum@quicinc.com/

Changes in v5 from v4:
 New addition:
 - Modify copyright year in arm-smmu-qcom.h to 2023 from 2022.
 Changes to incorporate suggestions from Dmitry as follows:
 - Modify the defines for prefetch in (foo << bar) format
   as suggested.(FIELD_PREP could not be used in defines
   is not inside any block/function)
 Changes to incorporate suggestions from Konrad as follows:
 - Shift context caching enablement patch as 1/5 instead of 5/5 to
   be picked up as independent patch.
 - Fix the codestyle to orient variables in reverse xmas tree format
   for patch 1/5.
 - Fix variable name in patch 1/5 as suggested.
 Link to v4:
https://lore.kernel.org/all/20231215101827.30549-1-quic_bibekkum@quicinc.com/

Changes in v4 from v3:
 New addition:
 - Remove actlrcfg_size and use NULL end element instead to traverse
   the actlr table, as this would be a cleaner approach by removing
   redundancy of actlrcfg_size.
 - Renaming of actlr set function to arm_smmu_qcom based proprietary
   convention.
 - break from loop once sid is found and ACTLR value is initialized
   in qcom_smmu_set_actlr.
 - Modify the GFX prefetch value separating into 2 sensible defines.
 - Modify comments for prefetch defines as per SMMU-500 TRM.
 Changes to incorporate suggestions from Konrad as follows:
 - Use Reverse-Christmas-tree sorting wherever applicable.
 - Pass arguments directly to arm_smmu_set_actlr instead of creating
   duplicate variables.
 - Use array indexing instead of direct pointer addressed by new
   addition of eliminating actlrcfg_size.
 - Switch the HEX value's case from upper to lower case in SC7280
   actlrcfg table.
 Changes to incorporate suggestions from Dmitry as follows:
 - Separate changes not related to ACTLR support to different commit
   with patch 5/5.
 - Using pointer to struct for arguments in smr_is_subset().
 Changes to incorporate suggestions from Bjorn as follows:
 - fix the commit message for patch 2/5 to properly document the
   value space to avoid confusion.
 Fixed build issues reported by kernel test robot [1] for
 arm64-allyesconfig [2].
 [1]: https://lore.kernel.org/all/202312011750.Pwca3TWE-lkp@intel.com/
 [2]:
https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/config
 Link to v3:
https://lore.kernel.org/all/20231127145412.3981-1-quic_bibekkum@quicinc.com/

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
 - Rename prefetch defines to more appropriately describe their
   behavior.
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

Bibek Kumar Patro (6):
  iommu/arm-smmu: re-enable context caching in smmu reset operation
  iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
  iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
  iommu/arm-smmu: add ACTLR data and support for SM8550
  iommu/arm-smmu: add ACTLR data and support for SC7280
  iommu/arm-smmu: add support for PRR bit setup

 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |   2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 284 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  18 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |   7 +
 include/linux/adreno-smmu-priv.h              |  10 +-
 6 files changed, 315 insertions(+), 11 deletions(-)

--
2.34.1


