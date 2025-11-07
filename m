Return-Path: <linux-arm-msm+bounces-80798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D2C40DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE36F1889A80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D3527877D;
	Fri,  7 Nov 2025 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XOPgB5C3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF526E6E5;
	Fri,  7 Nov 2025 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532753; cv=none; b=bbQHsvb4aVumL27GCw7RFT5XCoorWMACRYhfsnC2EC+w1T4AYRXnp6+7W/2ShVey91yBr4GVp3HCf1Qzypg3+TuWliWBttPZtnzhvAE1UwYDWKWP+KMRdUlu5I9/bo/YDCMFku0eyJnBSxiX0s2DK42ObhHk/kqEWQgqSErfaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532753; c=relaxed/simple;
	bh=8alfOU0mQaBaJpINi/m+qO51QxnigBe2rWYr+trrnn0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gtlv4pMFKbCZ6yay5D5XfMa5gT5BrkfcrIk9UyJDh6eBj4lpZgC/KR1yFCcYFbi/zFyUT44QlzpEzcchkcVid9mb7NAZtdFiMiYxpKZutQsYS+EaBlXetqTs4i+2YnSqpqWjw0IB07WmLcluJZmpGCtWJ1y/0yO9PMEZVdu3spQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XOPgB5C3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A797wrY1709849;
	Fri, 7 Nov 2025 16:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CrhGbWxcC1iUQeHqVcuxlH
	gMynfCI5UcRitAyCyxlxA=; b=XOPgB5C34gh0lLy53qP92+JG8A+oUtlCpQo/5m
	3aVgKVnTBC5yodbQRpysDYOgOSNPSU0plMfzFJLoOVY9xPqdSMFbbREl5iPCZqb0
	wVgEVDNjr3ZTjwu+ZmcMNYlqlhfYH0+9RAxzNSmD2q+nexOQqqJQkcJ97s2dntFK
	tL+9118GpjpkQRMJ7Hm/Ezz0s7ZW8QuAxgUEGY4gXCenI5Hq9CJbl0L2pGHgQz2h
	udbU5mpNwdlv1tRH2DkqlEc7EL1+ZsBaMsEyz2k42gY4h6ceXM9Bk/GGNXNm3rSL
	8N6UVJiez164I+DOsg5+MR4/T52J39a7udvPSQUKnv2K41Aw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue2fgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 16:25:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A7GPenW006277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 16:25:40 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 7 Nov 2025 08:25:35 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>
Subject: [PATCH v6 0/2] qcom: qcs8300: Add qcs8300 camss support
Date: Fri, 7 Nov 2025 21:55:19 +0530
Message-ID: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690e1d86 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Db8qaQl5Y44jcrp6U3UA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ufjOcVvIYD00xcJLq9GnOfCQdvlWUniz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEzNSBTYWx0ZWRfX1pbUhqFpsZ2S
 Z9esFPgOQzsjQkFR+m2g2gBcoQvjcjYNTuADTvQ4r240m/zbn734XrmRKgB1IkKDaNB/P6vtqLu
 STlkeZSGQy8buj0XrrzjjfWWuEK9UjycPJZ2p+n2OcCfLr6g+T04aPBRfFPa+khnW1uvc6n61un
 AC5mIZMv4D4pyzrzfKofrQ5BcfFfwzcsZczuqFiGHAJpgo0KQiDPAtCC6yF8Pw1JLyvOUP5NJg/
 ZiXalaH23wQEb1uS0w5oJeCLYaRIyxNWDIET4FwSgmxrZvhONpsnva0L5y4Y0FBPoRXrTOSiaeG
 Ww3yS7arCGWFAm01UCt3qsgNDFvVPJrXACmrPsyTBPzHBsMn8zp43JFMOh1Pn9x9qLHgTAkHGE5
 GPCtEEg1h5iJLDN7xFhgXmTa/7IlNw==
X-Proofpoint-GUID: ufjOcVvIYD00xcJLq9GnOfCQdvlWUniz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070135

QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Changes in v6:
- Update commit text for bindings patch - Krzysztof 
- Reverted back to v4 version of dt patch - Krzysztof
- Link to v5:
  https://lore.kernel.org/all/20251107132154.436017-1-quic_vikramsa@quicinc.com

Changes in v5:
- Added Fixes: tag - Bryan
- Removed empty lines between single properties - Vladimir
- Modified binding phy supply description - Vladimir
- Link to v4:
  https://lore.kernel.org/all/20251015130130.2790829-1-quic_vikramsa@quicinc.com

Changes in v4 compared to v3:
- Added supplies in bindings to enable camera sensor.
  This change was earlier added as V3.1 of Binidings which was 
  reviewed by Krzysztof and Bryan. Link to this discussion:
  https://lore.kernel.org/all/20250910104915.1444669-1-quic_vikramsa@quicinc.com
- Droped the zero-prefix from the size field un DT patch - Konrad
- Link to v3:
  https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com

Changes in v3 compared to v2:
- Bindings and Device Tree: Reordered csid_wrapper to appear first in the
  register list (as suggested by Bryan).
- CSIPHY Driver: Updated the commit message for the CSIPHY patch.
- VFE/CSID Resource Data: Reused the same resource data as sa8775p for VFE
  and CSID.
- Patch Series Order: Rearranged the patch sequence and moved the DTSI
  update to the final patch in the series.
- Code Cleanup: Removed duplicate data structures and reused existing
  ones.
- Optimization: Simplified and optimized conditional checks.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250711131134.215382-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  dt_binding_check
- make -j32 W=1
- checkpatch.pl

Vikram Sharma (2):
  dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    |  13 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 172 ++++++++++++++++++
 2 files changed, 185 insertions(+)

-- 
2.34.1


