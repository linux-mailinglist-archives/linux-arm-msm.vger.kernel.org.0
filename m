Return-Path: <linux-arm-msm+bounces-50816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01870A59288
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59FEE7A27E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C035921D5BA;
	Mon, 10 Mar 2025 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pg3G48wU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D121D3F7;
	Mon, 10 Mar 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741605541; cv=none; b=NyvlmPnCsvFRZol0rDz1NsIz0oqMucOP/uJFMkctTy4J5zna8/YSqyXkjASgtpl9I89cZDWHRY9OFDEzdnuEX9JhCXtm8WfXPEOWj5P95jV/z/VaIb6Nfvaj54qRTrFDRVegb+SRd8NulsvYMjPiuuW1llOyvJ+oOZ9iy8OA2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741605541; c=relaxed/simple;
	bh=iSfx5FlK+U5xTphC1c3YObxLSk45/xDHZO7IwewM798=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JFlvl8HglX4sPalrKjJMy/UimSBfdy9BFtZsCb0g5UTu5X3eQVvbuDiBKMNiaSBuUJEPjBt6shR8Ho8jrZFQ4XnwdGOVVhPIFV4+ETudAr4lMTKnSfUyuE1RmgIlgEv7XOyd06WWW4OFrfTJ7YDKx2FrHSipEDXy/6nDbHgScms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pg3G48wU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9ZJvA012316;
	Mon, 10 Mar 2025 11:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=62xgEb8g3bZDbv4vofxcE/
	5/8alepEYXWb456WTmHus=; b=pg3G48wUz1MzHaM8m2eKAn37fEB4By18jnDgoi
	XSKo7Efi0TR5m7XDVopDH59Mp0mr7WlQgtHyMZL4BDQOz8VMrWoAlLoXlFg6U2ny
	sXHyQg5s8meQaqvkUOAWZ58bxSd1CwJnv005KlrL61EECIx9xICygUNalf8P34Le
	MzOvu3epr9qz/7n19ty9dTcICRZTN8z2URh1yuD7H5L55pK9bXZrDHTrbj9+LN/7
	DQmTjCBk8z795vFdgXt/X+UDTHI6NpomSlm0SfH62SEc7xJafC4TpzUo3tReRmJj
	eIC4H7MI+2NeGO96RJbE+OB7nQKBLuH+oRtKxUiUVwbqJhEQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyucm7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 11:18:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52ABIlhm007230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 11:18:47 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 04:18:42 -0700
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: [PATCH v6 0/2] Add support for GPU SMMU on QCS8300
Date: Mon, 10 Mar 2025 16:48:33 +0530
Message-ID: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInKzmcC/23Oyw6CMBAF0F8hXTumbx8r/8O4aGsLswC0lQZD+
 HcLbjQhmc2d5J6ZiSQf0SdyriYSfcaEfVeC3lXENaarPeC9ZMIpV5QJBlaCjaZzDdRhhNS2A1g
 quGYnLaiWpBQf0QccV/R6K7nB9Orje72R5bL9cpyKLS5LoOCNOZTRPMjj5Tmgw87tXd+SBczqB
 2GbP2VVkBCodVYb4RT7R+Z5/gBESXLz+wAAAA==
X-Change-ID: 20250131-b4-branch-gfx-smmu-b03261963064
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741605522; l=2280;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=iSfx5FlK+U5xTphC1c3YObxLSk45/xDHZO7IwewM798=;
 b=idMcCUSfxFH0h5+bs1DcgTiMLicPb6SLMYO56UQy6PWNk6p8NalQUjT7Oinqzy76AE4DDJ82C
 2rZIgCTquNnDeR2tbBYsbPV7eRNWYWjhXr7DPG+C8Dpb5P6xmVMC21y
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67ceca98 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=ZYyXoZZ4nwus4yg4O3YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: G5CPuGBsa8FAYbQw2ifzQWn3n6xSGEC6
X-Proofpoint-GUID: G5CPuGBsa8FAYbQw2ifzQWn3n6xSGEC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100090

Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
for address translation in GPU device.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
Changes since v5:
- Corrected the clock order to be compatible with existing bindings
- Link to v5: https://lore.kernel.org/r/20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com

Changes since v4:
- Corrected the clocks list to be inline with clock-names
- Removed stray whitespaces
- Added r-by tag from Krzysztof on the bindings patch
- Link to v4: https://lore.kernel.org/r/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com

Changes since v3:
- Modified the order of clock voting and properties as suggested by Konrad
- Removed dependency on clocks in commit text as change is merged in
  linux-next before current base commit

Link to v3:
https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/

Changes since v2:
Corrected typo in cover letter to include QCS8300
Link to
v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/

Changes since v1:
Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
Link to v1:
https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Pratyush Brahma (2):
      dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
      arm64: dts: qcom: qcs8300: Add device node for  gfx_smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20250131-b4-branch-gfx-smmu-b03261963064

Best regards,
-- 
Pratyush Brahma <quic_pbrahma@quicinc.com>


