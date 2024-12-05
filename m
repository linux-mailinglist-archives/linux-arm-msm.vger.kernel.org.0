Return-Path: <linux-arm-msm+bounces-40482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34039E5244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0FA283F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A951D61A4;
	Thu,  5 Dec 2024 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pK01OT9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E545FEE4;
	Thu,  5 Dec 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394537; cv=none; b=rIVRsomBcm6tycv3qERKKoZJ1CiQKcjz9/9MqDNriWZjfREJ82pRRcLu4pSRVR2KXZnuGIn3k0QkZGf4UvmGECkCbERJ+3NqkR5N1hkxK4vVzF5HJV1oSgcNKG8ViNn1j4mmZktVvoivYh7Sh2OdfRgSmtLtmi/VRw4sw5vPELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394537; c=relaxed/simple;
	bh=5sirFvSvWHyYrxAbp8x9gAt+L5MkI/vP8NYp0eHOX70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Bm4VchotIbU1RKKwqnjBzoYvU2sURzT+2hcVNmTEJxNA37TWVOaij4TqScBvk6/DpOEfleKkwm2H4Qr55IOEe2sTRWuLuzgqfqEo1MHZ3VSHOdH7CdE6ICtPC850yhD9RHgnTXz5MYF7tKMgYwY9KXcQKBJcl7Ja+EoLHKCcytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pK01OT9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57Wnhg031188;
	Thu, 5 Dec 2024 10:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gWPgj79tm0v1wD578aDgh7
	HHrmCnR1PmBKm5+R3gC50=; b=pK01OT9qy0xhdnI+57klIFzAK7QBPAiqapLYDP
	H7L49v6UbjVjn/b7Yhd3ZH8+xgyIKqXZn2XFXyjgsUtNqusAu2XbKVOchw/bP2aF
	3t8J+bdCnNFNhFXIfCNJFdLsXMbN5tzLu7J3eYP96rDoXX2FDa+dltel9y8ndptV
	395hvF2AH9GtLLun4EOhW9pN7clS7UFVt6RRNtpwpHhyZUhXEWw5YDHw21R8JEGo
	G4/IY8TBGdnzMDkupSXeMYGmNjvipIiC8t6Fel+oBNMrJoL3qZniAh7z0nThNQ51
	8EGIzLDNcWzHyaDIb86msQC+gAaa2STp7t9AnyVnCPt4A3GA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90y7pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:28:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5ASoMT016244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:28:50 GMT
Received: from congzhan2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 02:28:46 -0800
From: Cong Zhang <quic_congzhan@quicinc.com>
Date: Thu, 5 Dec 2024 18:28:13 +0800
Subject: [PATCH v2] arm64: dts: qcom: sdx75: Correct IRQ number of EL2
 non-secure physical timer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-correct_timer_irq-v2-1-7db282a5e475@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADyAUWcC/52Ou26DQBBFf8XaOmOxDxbjyv9hWRY7O2tGCaw9E
 BTL4t8NNGlSpTzFPfe81EDCNKjj7qWEJh449wuYj53CtulvBBwXVqYwTpuiBMwihON15I7kyvK
 AWJFP6NBrH9Wyuwsl/tmc58vCSXIHYyvU/Jq0qf4wTRo0IDlb1MGXZYinxzcj97jH3K3qlocxy
 3Orncx6oJwha2oboaliBBdsDQeyHlwZdLI6HUKhT58kPX3ts9zUWjTZbfrvkss8z2/ADROeOgE
 AAA==
X-Change-ID: 20241205-correct_timer_irq-d7e6fc4c616d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cong Zhang
	<quic_congzhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733394526; l=1202;
 i=quic_congzhan@quicinc.com; s=20241126; h=from:subject:message-id;
 bh=5sirFvSvWHyYrxAbp8x9gAt+L5MkI/vP8NYp0eHOX70=;
 b=6zBSJkjUzNklKTtLFSvMzejn8k7/I27w/zxcmhLaJ5AZv7S9Z21+oKgAagxb7oWM0zSW1sM9e
 EgzRO8SKqmODFu836dT+RmsgC84daixo0Xn2+4vne/Z2ORQ5PgieEqt
X-Developer-Key: i=quic_congzhan@quicinc.com; a=ed25519;
 pk=EAdxxOpkixn8jyG0MRQXsIFtZX7PytBUry7L44VBHIo=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J3sz_tP9VQZmUR004azu_nkLZ25vVXRD
X-Proofpoint-GUID: J3sz_tP9VQZmUR004azu_nkLZ25vVXRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=586 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050074

The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
of EL2 non-secure physical timer should be 10 (26 - 16).

Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..b0775173278f3eed0f301b40dfba0f2680d7b0d0 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1548,6 +1548,6 @@ timer {
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };

---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241205-correct_timer_irq-d7e6fc4c616d

Best regards,
-- 
Cong Zhang <quic_congzhan@quicinc.com>


