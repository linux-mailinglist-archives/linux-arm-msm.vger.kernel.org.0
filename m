Return-Path: <linux-arm-msm+bounces-62609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC791AE99FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E08C6A2F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032C02BF01C;
	Thu, 26 Jun 2025 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cp1a70XI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE22264C3;
	Thu, 26 Jun 2025 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930248; cv=none; b=MWHvNRJGRaVSkPUGDyMk1ZTDJOIV0gBxev1vWC77hzndOSsCHTbN0zDEFNs/J7RtaZWGrjSe54NUh+7wlakNPceyNM8ryTBUuTYm+7Y1S0ciy03EYutc/RnFMENps1UYmDOiefyev/ugRerikXmbAE1bDvRtvwa6GgOI8NaUq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930248; c=relaxed/simple;
	bh=IlkNMzux1bdmIAPi2kGZMq826sbYkBUtao2A2Cu2dyg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jm3U8BuosNJE4GS2HEono+j4QOikshVPCZgA387QTWNiOQNJXRHcfjJBh8LXx0c4WCoKfx9j1P2CBIFnfzGRjVVr6hzeFJa/VZrVoHpIvBv+lQJEyYW4OEWWev73upM0vNw4TSMCCq8mJXGfsKpEj6HNxhB81rocOO1xcD5XJvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cp1a70XI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0EDtk014499;
	Thu, 26 Jun 2025 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+8ZFQIryNLDWfo2NkMJE/R
	C9YVC5xe0Yms/pvV0HVSs=; b=cp1a70XIjAjlk71phocySKzDzPRObUThtKBEcR
	6xXbsXZqidpP/9CVkwFGOKzP97rfaPfcG/XsJRhMHWOAuVDtDHZPu2eJL96xBNP3
	nc3S3E3Le8O7DNbKDcgd4DddDCz93c26A/Jz8ZjSO5vtHqKk/S7e9mCeLac+Eg9U
	a+O9gQS5gZdO24SuXN9a20APJQsM1zkhD+C1uLKNP85Z4nFxR52XfZiQm8c9iv90
	w24va34TDgWWZuXxwp0HeRdfP3yqwGec/joH8+rx9OmEmiUwntMigApvXula6i0J
	EEELdOf8g5H6VFu1teqKrJDqjOGlxwqdfaDW8ZyeYwIyuqiw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgjt0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55Q9Ugvs010132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:42 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 02:30:11 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sc7280: Add property for sc7280
Date: Thu, 26 Jun 2025 14:59:50 +0530
Message-ID: <20250626092952.847393-1-quic_lxu5@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C2LI0kuCZwWmT940ErjJ_sA-oZBHyG0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3OCBTYWx0ZWRfX9Qhcq7/DljAF
 Mk/I02zkV76/mcPZRxfHVDtUL6LUPAfOEzZ56YFVOJxS+FNtHWZ7r1EsemMpNbiiunI9vn1FH5T
 bSpqhikZNN6bSz/ufHSlfZJZxKVV1DYUOzNhraqcIEq9Mj7akflwO46cNWmnC2YjDP8z2e8qhDe
 3jpFRNoG7mJVD7GXhHxgHIC/6DDH/9WgDBIINWjOlaYBwYBHO29nQAl2JLcF+AGH9fgKOVuEjjs
 4uO2SznwUa6YPrhD+jBSZFhhFsuZUKd3pCOYFBd74YsVtJfPDbQOPdfr4f+FOalS0TSrM1OQdr5
 rE+eaktUdfUNyB2bfL1c7lCVnXchotAvs3BHL9aoy4fInTVnGl9Nc/ATot67xFKGf2oAq7NDp5C
 kSEsMAyflT1LM9zTStq/VgsNQeoonapQ78ty5zxqEns3j+OYjYRtKFk1cORvJCICHOvPbyoK
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d1343 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=nP9DjPefQNtmf87SolwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C2LI0kuCZwWmT940ErjJ_sA-oZBHyG0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=364 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260078

This patch series add memory region, nsessions and dma-coherent property
for sc7280.
Patch [v2]: https://lore.kernel.org/linux-arm-msm/20250516110029.1637270-1-quic_lxu5@quicinc.com/

Changes in v3:
  - Dropped dma-coherent change.
  - Modified indentation.
Changes in v2:
  - Added compatible.

Ling Xu (2):
  arm64: dts: qcom: sc7280: Add memory region for audiopd
  arm64: dts: qcom: sc7280: Add nsessions property for adsp

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1


