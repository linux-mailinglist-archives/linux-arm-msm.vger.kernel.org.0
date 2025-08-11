Return-Path: <linux-arm-msm+bounces-68375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C5B20C0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D293A74FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C414E255222;
	Mon, 11 Aug 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R194GU3s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03261253954;
	Mon, 11 Aug 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922733; cv=none; b=hcfIWO+ituYg8RD5Jhi8vLI+XdQwEhuwl8fWdgZlEk24NaYIDbrlcE3Z4ynwfmTLac5zgmCVu2Q80NocQAtQK6tS7VpZq5qwdQvUnGob+nB5QIOaofnKVeddHDIl+N/bcfLh8Fa/h4IqStYryeDyEMxkGjrwV3bJl4FcTZdo1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922733; c=relaxed/simple;
	bh=HsA/94xQfgSMGsZ4fw4F7HfPfgVBgxfap1XShbrhYAI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uoBmTGCWxNzp4Ares9rgF5HUEEnzBWbRAzQuPxS/U5v+xEL+ry9OwAdX6u0lc0DGOE/R4W7GXAQYyp123ON59HG4nGF8bIX2rDCFwqMosEMjPBTmcpQrM/7ggMSIDysOxnP/Ew8diUOqH4xPNBQ+61wF0W4imZ6+bIWagBKaflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R194GU3s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dHsN005228;
	Mon, 11 Aug 2025 14:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hprZG84kFc+PbnEQxbInW0
	GI4dBPm0+mI23eGZXztU8=; b=R194GU3scjdKiiy4WIvUAuyhlUJ3TjwCZuvziw
	D8Qn/DESH/ICPdqifgpX31CyVT7SrVn4dpVmbuCuTqrgv+YVuj9XwH+FY7Wqsh45
	+WZwpiBW+XYYFvNRop0JxiPO4prRfF+g0JELW5lPH60I6lohq0ofvaC+Zi43/xiN
	t9UFzhPOCfcXOWsQ+ysDPNJyjLEewavXi7HFqAqWe/hi7j0J9CEyAfDHpPrcmXrf
	/LsrD4sZs7Bc6H7fDz0foBHpbqfn5RdBiWoumElOtMpl+vTTt9JBjAWjRthbmu6A
	spcpRiLKwprOGUbN8m9UXyjOPJGPIrcB5uXGHp0/rfhd1xfA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx2xt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:31:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BEVwmd019797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:31:58 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 07:31:53 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 0/4] Enable UFS MCQ support for SM8650 and SM8750
Date: Mon, 11 Aug 2025 20:01:35 +0530
Message-ID: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXwHoGF2zpl0yl
 80DDtz1hn0CIHrFls3/PhQJW8gcdK78zkspGeit9ddfNz2A33R1Uc66HK+N3AarxaZFILxAeOfz
 6znXRsAcTU60Z07eeDM+ZasxHK+0g8XK9Q9X6X2AgJkmaboP9vVH1e9hmXsGQln4B66VEP5Z3gJ
 oFM7KLdtZqVyD2DLE2Noze6kkdeSOjJd6PgTv6miAlaa1M5juk9Qo0h5NWz2pZRv385WusFfhT3
 1qAmayi3StIG2qCRhGAioxo9+Dmk5fiu3JAUis9NHyGJ1YcW7Yyokc+bAzJpOHPy3HRrzAI1NoF
 BRUJetamhisgpIz1BtLMd2zjANckc1uARnVYF+oKylj9sLjHjxCpMmoWnsbj+MiiyawI2+cRnoO
 z7xCC6cM
X-Proofpoint-GUID: GopPQZ17NuoxlOJSOHpGHZ6Y1CB0qgXS
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899fedf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=rqdb9q47H7dJNthdBScA:9
X-Proofpoint-ORIG-GUID: GopPQZ17NuoxlOJSOHpGHZ6Y1CB0qgXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

This patch series enables Multi-Circular Queue (MCQ) support for the UFS 
host controller on Qualcomm SM8650 and SM8750 platforms. MCQ is a modern
queuing model that improves performance and scalability by allowing
multiple hardware queues.

Patch 1 updates the device tree bindings to allow the additional register
regions and reg-names required for MCQ operation.

Patches 2 and 3 update the device trees for SM8650 and SM8750 respectively
to enable MCQ by adding the necessary register mappings and MSI parent.

Patch 4 is streamlining UFS MCQ resource mapping with a single MCQ region
mapping.

Tested on SM8650 and SM8750.

Changes from v1: 
1. As per Krzysztof's suggestion, replaced mcq_vs and mcq_sqd DT mappings
   with a single MCQ region mapping.
2. Minor changes in commit messge as per Krzysztof's suggestion.

Nitin Rawat (1):
  ufs: ufs-qcom: Streamline UFS MCQ resource mapping

Palash Kambar (1):
  arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller

Ram Kumar Dwivedi (2):
  dt-bindings: ufs: qcom: Document MCQ register space for UFS
  arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  16 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   7 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          |   8 +-
 drivers/ufs/host/ufs-qcom.c                   | 146 +++++++-----------
 drivers/ufs/host/ufs-qcom.h                   |  21 ++-
 5 files changed, 94 insertions(+), 104 deletions(-)

-- 
2.50.1


