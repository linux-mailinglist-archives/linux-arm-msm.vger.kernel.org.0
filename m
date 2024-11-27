Return-Path: <linux-arm-msm+bounces-39294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48F9DA611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CC728206F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF684197558;
	Wed, 27 Nov 2024 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lBc1CX9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03820433C8;
	Wed, 27 Nov 2024 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704476; cv=none; b=IgmVqZSW2AizZcrdd4qC3QfsIWkLsfJb1A8KXf6usQbHL/Y2nYt+Hs5te4lkKrwJrQlNBaInhQ4b+95nJQyMWrxKAcOvf55duVJteugZvjgW+PH4qLOPeXmTjjKOmjNje7l8HP5UmCYyGHSnQIAqwTVL3IGXBziRV19XZJLoTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704476; c=relaxed/simple;
	bh=SpnSQeWT5lT1z7xDNetuP2wmhNA0qhOK4b308H9vCIs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=WazkQYVEgTwOeBybPsp++8MetgqVicuyvYIIV1QwDr9cCc3QAow1Jea7Udb/pcRtpXrja4dcMy0p2T8HwqKA42quqodU1rMrPVgmQafPOohKBOr+C+uGy01mntMJnd2ieC1VzNXk1RXF8ij/FUwQ258mKdx/0ifa1glomhPCBKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lBc1CX9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8ZlVl009498;
	Wed, 27 Nov 2024 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7KXvgJQ3toOxG8D4+Kjtkh
	kuDCQsC6JGHFo5MD5xdYo=; b=lBc1CX9YYsbCCt6ZaXgXMmGgckuOKw5h5sAKH6
	DW/TEymqQK8TLBFTn+42YpdYl3IvkcuAo61muEIIXoF57A/Upy9xtQr03uDyArCB
	gN/dkCxEXte1cPUs1D1v5P3xaS5wo3bGGcEyGPzRJnb2sji88WjAlrZMa98+pko5
	+JsvaApOeewkYfJPGdACDaDA89i5di+FECTpd3vx/ztzM6eYnsLWbSPuPU4EIxXU
	VCXIaC9whxHrm/6qLXvRZsYDafzA/4qGAFKmbWulmUmxrzMm/czI0ZLgKcTndWcb
	eq8odleBWNCwxj/g9SVZFWN73XWtRTjDSwd5orddaNmIOxSg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffyu2pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:47:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARAlntL018222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:47:49 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 02:47:45 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH 0/2] Enable Display Port for Qualcomm QCS8300-ride platform
Date: Wed, 27 Nov 2024 18:45:12 +0800
Message-ID: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHX4RmcC/43R204DIRAA0F9peHYMzMICffI/jGlYGCyJe+myb
 jRN/112a6O1MfrGkMyZ25FlGhNltt0c2UhzyqnvSiDuNszvXfdMkEKJGXKUQiBCGHZhyruDz6b
 iHIgqiSHyGCvNStIwUkxvK/j4dI5HOrwWdzp/spZydqu7XVBuUcGntktdmpJ7WSokmBE4SCu95
 NGhk/hQHJ86f+/7dqn1QxJCyIsEbQveQ5hgcJPfwyxAgHZWS8WN11X9p4Ua2pC/Bi0CB7QN+or
 Iqsb8R7jMFYZzPg8lqpU3Xt3kNy4TlHebpu1GCumt9raum9qSdDU53VRodVmFKJ8YbWMpcrbse
 J/y1I/v6w1nsS75t3OtXcSSroSJnNBddbFgM34H6htgOYpBWSljJKJU18DpdPoAXv3ze1MCAAA
 =
X-Change-ID: 20241122-dp_dts_qcs8300-ee342df0ff37
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732704464; l=2355;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=SpnSQeWT5lT1z7xDNetuP2wmhNA0qhOK4b308H9vCIs=;
 b=qgvGh/Ld5jpZnG1Ysu12M5hvbocsy0ri1QzNyEK7hAwJOD2/Z5ulXVhdQDn9O2UUViV9qgdHz
 ZEGTvf2HcbzDftCLBNsgexxhcmYMwXDZfA0XoWmRPofIDWwQ3L6rScv
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OEAi1OfBRta0l1mLnmWI_P4xFA09GYIM
X-Proofpoint-ORIG-GUID: OEAi1OfBRta0l1mLnmWI_P4xFA09GYIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=326 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270089

This series adds the DPTX0 node, as a part of mdss0 on Qualcomm QCS8300
SoC. It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
Please note this patch depends on following series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
https://lore.kernel.org/all/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com/
https://lore.kernel.org/all/20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com/

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add DisplayPort device nodes
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 115 +++++++++++++++++++++++++++++-
 2 files changed, 158 insertions(+), 1 deletion(-)
---
base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
change-id: 20241122-dp_dts_qcs8300-ee342df0ff37
prerequisite-message-id:20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
prerequisite-message-id:20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
prerequisite-message-id:20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
prerequisite-patch-id: d13db448443d15d4c87329dbf8a20c2132ed3e65
prerequisite-patch-id: 93a9abef1fdabcc459688518ac5a563be0d723e9
prerequisite-patch-id: 7e65b4b4719b3955c1af0be922b86ec91a1db0e7
prerequisite-patch-id: c8be7acdd2ddc57b381de1dc886a50523af77974
prerequisite-patch-id: 646869c16608a54c66107a2e7e92af15be0fb1a2
prerequisite-message-id:20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com
prerequisite-patch-id: e9c4526e6b5f3f3c1eb8b4583df0ffccc6576581
prerequisite-patch-id: c016862828657b27feecccca34ad8552b42dd04d
prerequisite-patch-id: f49e5d4dc01a2e968751d294267f2a8d63360a85
prerequisite-patch-id: f24850d18c2d192673eb07efdae234dcf3e5a00c

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


