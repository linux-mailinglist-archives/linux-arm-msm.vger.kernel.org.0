Return-Path: <linux-arm-msm+bounces-33754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33680997A5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78A64B22987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D139FD0;
	Thu, 10 Oct 2024 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PucWOVUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E232B14293;
	Thu, 10 Oct 2024 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728525944; cv=none; b=XxB91ghpg7xF1UsAUy3fzD1gpKR0D3Uyk/VwEN8d/VuFcN3EHYzi0ubU9jxNwnaDWyUG03NQyJanaSD+fbtRsQS3qqfKzQWWc62n5Dc5rAKEd/zDFpgwGQpvfFtnZ6h2wuDt1ijmkvCkAiQM9QDWG1H/EBKixkLg9+WzDqkMI3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728525944; c=relaxed/simple;
	bh=8zg7uqJ9F9dHFV5MUGZbEkc0C4syuarZNtsPZdOTC1w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=iwJDdq105JrbZDUnknxWCFKxw7iDFZcVjRqoTxF7fGob/A3dpswEM7gVIJx2X6tgdu9Zy82oUEM3j+5Ld94HIGn7uDm0vvraomf3RL3PumdvIvPTzaeeXClBUivRdgcm53nKOwGSvmSJ/bDwTtkM6fEpsiznIAzy1AjZerU+LRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PucWOVUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1b1xH026795;
	Thu, 10 Oct 2024 02:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PwguU8K9q4ElaypTqADSdE
	jaBpITo1N/cE2UK0wTvlo=; b=PucWOVUectwALyJK6+gH3sMjq8crcTSDQ/4iHJ
	O+ZWIWIQLkH8210u7bEFFNS0QeUtC7ldmBj6mWjq9k3n9gVAfTZQLVBvCk4D68UR
	BW0zakZkBuLDKzFh7cM44huQdvjJ0nJrREflhPNUmHXvmsnBoADORLen9fjgVUPw
	1OYKmUjo8e8K6i5WjL0FWmKj2Lp0jlQvY7pNi6txM7c65qYWiIi11QehEhkHqVZP
	sgyZ0qGUjjs1aS/5U181yK3eUqusMGvwy3ljVBVaxVb/3mR0bna5Usv2vghWaPjB
	00hbhbCoc/FUDaHOZ6FrNmKEQ66H/xrDVqk7f9jffhE7s4nA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qvaqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A25NNa000712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:23 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:05:17 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH 0/3] Add ethernet dts schema for qcs615/qcs8300
Date: Thu, 10 Oct 2024 10:03:42 +0800
Message-ID: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP41B2cC/x3MQQrDIBCF4avIrCuMkmDIVUoXjpnEWcQWp5SA5
 O6xWX7wv9dAuQorzKZB5Z+ovEuHexhIOZaNrSzd4NEPDh1aTZn3aEckpBBC8hNBjz+VVznuo+e
 rm6KypRpLyv85fzOc5wXYMImIbgAAAA==
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728525916; l=1227;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=8zg7uqJ9F9dHFV5MUGZbEkc0C4syuarZNtsPZdOTC1w=;
 b=oCL7TZG9kQ4YdHZE+54xecj+BYNcwqM1fbzZOQRtv0td5mOVAR6MWjiS6we9TuVamgVX6wdPD
 tTxcPcMK/VRC4VBiKOeWRGbwVp7XBEEtfx+c7dJFNtYvjR0hMDDFTXJ
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kp9LMD8qygJjScGPbJUJBEvHuHGfvBuv
X-Proofpoint-ORIG-GUID: kp9LMD8qygJjScGPbJUJBEvHuHGfvBuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100012

Document the ethernet and SerDes compatible for qcs8300. This platform
shares the same EMAC and SerDes as sa8775p, so the compatible fallback to
it.
Document the ethernet compatible for qcs615. This platform shares the
same EMAC as sm8150, so the compatible fallback to it.
Document the compatible for revision 2 of the qcs8300-ride board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

---
Yijie Yang (3):
      dt-bindings: net: qcom,ethqos: add description for qcs615
      dt-bindings: phy: describe the Qualcomm SGMII PHY
      dt-bindings: net: qcom,ethqos: add description for qcs8300

 .../devicetree/bindings/net/qcom,ethqos.yaml          | 19 ++++++++++++++-----
 .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml    |  7 ++++++-
 2 files changed, 20 insertions(+), 6 deletions(-)
---
base-commit: 70c6ab36f8b7756260369952a3c13b3362034bd1
change-id: 20241010-schema-50b0b777c28b

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


