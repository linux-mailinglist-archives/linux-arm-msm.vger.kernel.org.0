Return-Path: <linux-arm-msm+bounces-42928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D99F8D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE227168938
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45031185E7F;
	Fri, 20 Dec 2024 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJAjN/bT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B77156C40;
	Fri, 20 Dec 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678150; cv=none; b=LEKlWXeyKDi8luE5Iv3AaqA5aPnWjyjkbzY6YWJW5Mnx3k1PrFq/X9Y/pRzkcild7No06zTY+d1sRI5dH475KH9b6uKXsbEDC5X+MXtPLOIeFDEYS5jMGlZcpQiTjDGGvzwCo+bv5y0pich+8FTh5MT3i1xzI5SZOd3xU7PgOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678150; c=relaxed/simple;
	bh=AQWwlRXGtax7dfVtc9xiNjsEzN71TLwmq44fMWbaGB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XoUT0PAEcstNah0gXMhPnI/dLO7fJThLsUDFgZ1NCEf93yIHInFnuffU5b6LD/6rOoa7c9sOLMQtN4mpDHL/JwffYW+3iyS7NSILKN5Ot5g3ZKBA5NS1beKAe8NVNbEns6ONM6gjz2LvjxvPAVC6l4Z1K4XQ942F/RQwlao3D94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJAjN/bT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6lba6001414;
	Fri, 20 Dec 2024 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRWJPL7L3pPqSCyTvvuhdv0KwAqKL/47DsiqT/HFT9I=; b=oJAjN/bTc28NoaGV
	O3xMdxlRsCg96906aCC83HGw36AUV1qgb/qGZWNiLM3aTJ7rsv66ZDdaIfVRTN9V
	XCwBlslIv1x02iU1lVIlvqThIfjT0twDuFipUC7bzUeVghbEBoDeoa7ThfXws149
	BiTxBGUs20OSFTt0D/lJgv+xLXGhHt1hpKmGLIB2AYVPHHnrJBXGqh+CW6joBeAD
	QqGtVvq0aQA+Azs3um88peL3FjABgpLzJfGoeClXdf1bqvTnmUM4HFFc4eyPZo0P
	kATCku6rhp2Vu83mVQ9+EVeg8+JNxQ3xYY4ohkAzXaU/n0r54SraQdcAtv+xtxs4
	ANzPvg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3mfr12g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK71IXu010934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:18 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 23:01:13 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: ipq9574: update TRNG compatible
Date: Fri, 20 Dec 2024 12:30:35 +0530
Message-ID: <20241220070036.3434658-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hM-G_0V5knLhuHifPVISGxB8UQdSdrSq
X-Proofpoint-ORIG-GUID: hM-G_0V5knLhuHifPVISGxB8UQdSdrSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200058

RNG hardware versions greater than 3.0 are Truly Random Number
Generators (TRNG). In IPQ9574, the RNGblock is a TRNG.

This patch corrects the compatible property which correctly describes
the hardware without making any functional changes

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Revised the commit message
* Changed IPQ95xx to IPQ9574 in the commit message
* updated compatible string

Change in [v1]

* Submitted initial patche to activate TRNG

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index d1fd35ebc4a2..453574c370f1 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -227,7 +227,7 @@ rpm_msg_ram: sram@60000 {
 		};
 
 		rng: rng@e3000 {
-			compatible = "qcom,prng-ee";
+			compatible = "qcom,ipq9574-trng", "qcom,trng";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-- 
2.34.1


