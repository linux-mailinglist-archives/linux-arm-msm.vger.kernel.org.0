Return-Path: <linux-arm-msm+bounces-23519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0D911B47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8833E1F229D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADB616C857;
	Fri, 21 Jun 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DdFuMzNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D21534EA;
	Fri, 21 Jun 2024 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950546; cv=none; b=HnX6/+n/w9xbzI4/WCYB97bpdJJjUTFULHZzjAvmAQRkRYiYGArspgqrPT4/Dc0FIJ2wksFgpoGiOGXgW3je1I1WUiGnX/wBo8GkjV/G00DUb9cgFurdyF3TiWvgVWNHaez5O4dM00ken3u4SlEcE5v1y2WtjioQ2J7iNiDPzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950546; c=relaxed/simple;
	bh=O9evRJX2gCyOvgN7D3f4v4px9aaOmtIKONVbD/a3e7s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPR7mcqnYWuBryG231mCyrMFXIYV9uMBO67j3HP2dqEmb3mgVokvqVSo5v+6kT1+fFhO0pk6yOfO0PzEzL5QAuFWxmFdSG5qz/rqm+oOG1RyCpbTa0y3i6Ff00AfZ8LUnDuRCz2iXJQ1Tyvnid9eYTuTjnO6ZplEk1BfVCcweGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DdFuMzNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L6AF1A017939;
	Fri, 21 Jun 2024 06:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ubTw/SGh4Hd1iy6B/oYlG5
	X2s+gU3U2DrGQmpFCywno=; b=DdFuMzNandpwFEa1hCH184xLj2+yJ0aVyY7SxI
	HxYbct6oOVaGI1givPnXp2q1r2Qh+PY6vxtoCi0bpY3xsrPsoqUrDwnwFrX+hEdD
	P1zYmjdbOAbnDoUT+cA43pDPCJA2vevUdlIhfWdxEBQYSZZMyE284Yx3OSV//id/
	70Ct+pAunA+TPETqTtTR5Ws3mZw5bIx3BLnJjfG3Sl4vT7cXy1WDV443VSHbHwqm
	3Rwwbg0c8ibWahkuxd6JS8XoHKAJDrKviAMhF7ONOTblvyBGAEWWk8AYc1HtWolG
	yr6SlMugo3oTKVXSmz+L1fa7fDfwam5OoJMarlnqAl74zMZA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrm09jqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 06:15:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45L6FaNc019800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 06:15:36 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 23:15:29 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tengfan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_jiegan@quicinc.com>
CC: <kernel@quicinc.com>, <quic_yijiyang@quicinc.com>
Subject: [PATCH] dt-bindings: phy: qcom,qmp-usb: fix spelling error
Date: Fri, 21 Jun 2024 14:15:21 +0800
Message-ID: <20240621061521.332567-1-quic_yijiyang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: yw65nC8FemhvEFmxEkjssmvn7FEc2_QL
X-Proofpoint-GUID: yw65nC8FemhvEFmxEkjssmvn7FEc2_QL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=846 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210044

From: Yijie Yang <quic_yijiyang@quicinc.com>

Correct the spelling error, changing 'com' to 'qcom'.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 5755245ecfd6..0e0b6cae07bc 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -20,7 +20,7 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,ipq9574-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
-      - com,qdu1000-qmp-usb3-uni-phy
+      - qcom,qdu1000-qmp-usb3-uni-phy
       - qcom,sa8775p-qmp-usb3-uni-phy
       - qcom,sc8180x-qmp-usb3-uni-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy

base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
-- 
2.34.1


