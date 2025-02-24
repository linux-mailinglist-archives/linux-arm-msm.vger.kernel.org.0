Return-Path: <linux-arm-msm+bounces-49136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1CA41982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D0116D85A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F221245035;
	Mon, 24 Feb 2025 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RiEEbV6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337E1A08C5;
	Mon, 24 Feb 2025 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390653; cv=none; b=fGRoK+ym206urYFTQeEAgwQ57bCzltpmneUcYD8bdnOJPmsrWhaYBJT6/48OuFzbbZE72iCGZE/nLKQrneslP/fFsQmt9kUH8klICfpwcGUEbiYaIIF9pNy1kCZXwdbugLVhWyWEENngvoKlVgmkyFP0FezK9tdZbotMGHeyCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390653; c=relaxed/simple;
	bh=5fU2PZlxklOXAz3WBOD3tBxeCI7SfU36BEOyoLnQRhs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FpNbglTPRBHvGoGrdJsmLz1gKCtO6VBk2iCayefEm3Yik1jfI8iblOvwuurLI+tNTWYjHk8d74Kht1jqgSd1jAz398W0Fl7nBQzOetQnw3x14Z3946/jHNUawWbLX0qcT9niJoPZvva/6X+qZ/IsOiU/6Zpky1Bdz6ey1MEdfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RiEEbV6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9axRw001740;
	Mon, 24 Feb 2025 09:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MmofVo7qfx/rrCa9A/0teO
	rGqwTLjT9i0k2n9oXMAi0=; b=RiEEbV6JuH8XfDcP6gR1gu74INYjUi2iovAS3v
	HcwQpItNTGB5wrOv59dwWCwUYbTfFlq21zUBB3UuszqbH6IrgMSx55ap5C7j/UzO
	9n3OZr/ZSO3oiQax7AQRTu3DNnu+lFDrsDv5liGhEUqXp9/Jvhw0UqmdTaV/+Ojf
	A0Q0lce/cg04hxgCxkXIx3H/IZZHK/T0kJKInn6j7kq/3ZrlxwTq1B9Y917sGONA
	eRuQutAflNIG1Q2yTIRPwbCJoaoApQmlC5lF5ODA/V0uxhUdVW1pmlfGm/AScoOg
	Ge/oLOy0OzhqVkiVZJnhQfwiIv1kn+ojPK/REbTUB4L08DYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xncqrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9ofW2001478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:41 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 01:50:37 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Subject: [PATCH 0/2] Enable TRNG for QCS615 Platform
Date: Mon, 24 Feb 2025 15:20:07 +0530
Message-ID: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9AvGcC/x3MMQqAMAxA0atIZgNtRQWvIg5tjBqQqqmIIN7d4
 viG/x9IrMIJuuIB5UuSbDHDlgXQ4uPMKGM2OONq41yFHH1YGU+NM06b4kGpsTW2piEiW9ngW8j
 xrjzJ/Y/74X0/zjORiWgAAAA=
X-Change-ID: 20250223-enable-trng-for-qcs615-706ccc131ba7
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lRQc1G4nKaHz4cbAmy--T9EBqr7w83z6
X-Proofpoint-GUID: lRQc1G4nKaHz4cbAmy--T9EBqr7w83z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=528 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240071

Add device-tree nodes to enable TRNG for QCS615

This patch series depends on the below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
Abhinaba Rakshit (2):
      dt-bindings: crypto: qcom,prng: document QCS615
      arm64: dts: qcom: qcs615: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250223-enable-trng-for-qcs615-706ccc131ba7

Best regards,
-- 
Abhinaba Rakshit <quic_arakshit@quicinc.com>


