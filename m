Return-Path: <linux-arm-msm+bounces-55094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF44A98531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46AAF1B63A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA85525CC6A;
	Wed, 23 Apr 2025 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K3VPKqRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01121FF51;
	Wed, 23 Apr 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399897; cv=none; b=kofkKviNYwcEpIInlJOdS1zs8WajM4EgyFJPxhFrsQruwPUMJ8PywYS1YsEx1xrAJWcBAEtPtR5V2mSx9U0igADfjfQJ6cAwMH8StyOif7kvjllKPH/7/L05bMOh5cKO2iNwIJkvuDuJlaQqvEKW7x3iVGbn+FF4874PGn+A5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399897; c=relaxed/simple;
	bh=VdlkXnTwXpGrP6sp7HDP7TuuCWRR/qkP/h+2DMXA5RY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=d9BEBDdtLNAdvrSFpEhqRvohh9yWbG+0Oqt16gYTFeB9A6Of3AFFwO1/6ktBbGckm0eYowK/nbxvkyOV4DjmE9czSwl+9MccV1zuWJf4MwPMf5FRaXO0Cf/lbfuzWAvBtlq70biQCpweNDRwXfysOayTkEBWDY4RWVycZPmGI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K3VPKqRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iA4T023892;
	Wed, 23 Apr 2025 09:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIINzLwUhP0TrtdUJFWXe7M2HGjHzuxaMga6LW9HvB0=; b=K3VPKqROmGm41gdc
	w/B/XldLzC/TGedSpI5feeaRqlAKgr2Lw91vSTMc1QEa+uBE1W5iVuswuBSuEhMn
	G9R1fUrtp+rUEpbv/7zM1xf3NPxFsVGM/h4LgQ8+04Z5PKya1QSoVIftORBxx75L
	Ta94D68XNIE7q5h6n/K8qWx+P3xCBdXbYy9yJKzeR14pd21qFgatn0NPNywukGcy
	kpxwus6TcEZh/+s29GiY5UagZ6ZCUgzUIou4RRQ8tNZTC06m4b9AFgSIziW2CYAr
	79hPzuYCWLKIm0xgS0+71MhOCMA/O6+l5dzKnU4lSn0UZe+bs/8bwMzAC2uHK6Fi
	hXCrKA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39jn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9IABd015865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:10 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:04 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:38 +0800
Subject: [PATCH 2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-2-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=797;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=VdlkXnTwXpGrP6sp7HDP7TuuCWRR/qkP/h+2DMXA5RY=;
 b=b+wRpMpmht5Az1tqrLUjY7vvw2JILnxrC2g9L/3QcxhL/j0P5akPeRTai1UEDSGAwrJRW5M9E
 dyXCleZbnbjDYUeCxsH+RJ7rzPEQe8xuvhbrEndJ4fq8LrGHbOQBkgY
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v-KL3OONGZKSMaJQ7p5PKhWBOVEj26Bo
X-Proofpoint-GUID: v-KL3OONGZKSMaJQ7p5PKhWBOVEj26Bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfXz762HeTqAsem UjefYNufy0mClleJ7vDT3fnvfeyKkuAib1V/UAMuxZ9KlFKZ7H7vhokOu9YTuV7p873PsM92Tf4 El+r7wmJMLK4+6kltV1XXM+Hr0JJ8r6QBArBx1eZqUdKH+D2anESVPrrKGJLeyu0ZMTTxOxbUBc
 L3aqZdpB4YisyvYc2NitrXZmstSx/vDRP3z5BnZMDlhWZK39ZAuraKJPI5e3eHiD4/2vlKGdEPy qLT4pD1rAbYlwLnvw3EhmR1MaWPUVqQ+G7bGRNzrI/7yWltRP9YOnwFr+lWwaIQcq39eYLFrXBO QrbFhlmEl9zX93Wc9H1qWKgBEsgxIIodYZ55VVt5u3uwgLc2Nr2TCHPcU8QDj2mIv19bsynSAWp
 0m/7meGtLhATByLpoIh3kcXXj3IkfZ5+fUfvxUWYdDJme1nWLfJOcC6v0HdwVUQZtaRIzYYL
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808b053 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=t81gwU7txs9n4WTBcGUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=749 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

Document qcom,qcs615-imem compatible. It has a child node for debugging
purposes.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664..dc3b5a69b925 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,msm8974-imem
           - qcom,msm8976-imem
           - qcom,qcs404-imem
+          - qcom,qcs615-imem
           - qcom,qcs8300-imem
           - qcom,qdu1000-imem
           - qcom,sa8775p-imem

-- 
2.46.0


