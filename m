Return-Path: <linux-arm-msm+bounces-22794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BED90A15A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 03:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FFA285F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 01:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F0012CDB5;
	Mon, 17 Jun 2024 00:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lgGFSTjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA537A13A;
	Mon, 17 Jun 2024 00:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585964; cv=none; b=mceAurdB1f3GLmELeh2zfwKqrcDK4dkNDipYKoHSVZTgmxT/BuKWW4nJio9NPxsZOccJ4R0PmCSVr9xt39XoDtYZNsvkluA0AdLBrRXwTy3C+aYgNRFjjdu2burXnwit63gyvjJYkSjLTWcSMTcYZ9+pcgeh8SQWQtjE5BGUmMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585964; c=relaxed/simple;
	bh=Q9DnyRXgbNujyyxKFTyewf0poF/ivPCZH6G1ww8HAUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5yX+qBk2Ufcm/uFLy+WV34VBsWge/Z+Q5K4rAmW8cvWOTrQ+4p0cC9MehNYoqucZaem+Hp1AWORGGJ9jSp75WfjhzfEcsIgJVqOBZJNF2FxwC3RPGdy0sSgfkroM/PODNCwMFapvqX3qZqCuvvsZfQyH+5vpw2wywCed76dzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lgGFSTjI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GMnHID030415;
	Mon, 17 Jun 2024 00:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7L/A0+cytDzW4klze3wZpoBT/u6UakhyS1scZfRB6k=; b=lgGFSTjIydO646aI
	DhtVKkXyk3VIjLs9wDJF/rywlNtVNKIPOM29sc4dz20MH9OLaxKGzQ8vpxGu+WVR
	30eAnEm7HxEhzAtgE70zhh+GF5k5mmgc0nGumY2WdHhhkZQwjOpYKJkdIf+ySJ7y
	UvdqPVvtFpxaqTJC/AMnYjtckCXopsQy2BaA0ac2c8u5uOA4drk8jWwZoSiXFMv7
	tAG/YUhs66+cA6zt46hSJlj2DN9wHCqMqPpFGm5Av/NTX4XpvdDNZyNO5nJRIozE
	1wCH+4iubSRQFwkORh8WqMLLPHRzxFq7XATC06pryNwcbb91eckcyiL1MkrPHDLe
	Y9//og==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1wr2frw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H0x1RX027026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 00:59:02 GMT
Received: from hu-gaurkash-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 16 Jun 2024 17:58:58 -0700
From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <andersson@kernel.org>, <ebiggers@google.com>,
        <neil.armstrong@linaro.org>, <srinivas.kandagatla@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <kernel@quicinc.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_omprsing@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <bartosz.golaszewski@linaro.org>,
        <konrad.dybcio@linaro.org>, <ulf.hansson@linaro.org>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <mani@kernel.org>,
        <davem@davemloft.net>, <herbert@gondor.apana.org.au>,
        <psodagud@quicinc.com>, <quic_apurupa@quicinc.com>,
        <sonalg@quicinc.com>, Gaurav Kashyap
	<quic_gaurkash@quicinc.com>
Subject: [PATCH v5 14/15] arm64: dts: qcom: sm8650: add hwkm support to ufs ice
Date: Sun, 16 Jun 2024 17:51:09 -0700
Message-ID: <20240617005825.1443206-15-quic_gaurkash@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DYmW4Twe4_nYLS6hQGCA3goiw8D3wASZ
X-Proofpoint-ORIG-GUID: DYmW4Twe4_nYLS6hQGCA3goiw8D3wASZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170006

The Inline Crypto Engine (ICE) for UFS/EMMC supports the
Hardware Key Manager (HWKM) to securely manage storage
keys. Enable using this hardware on sm8650.

This requires two changes:
1. Register size increase: HWKM is an additional piece of hardware
   sitting alongside ICE, and extends the old ICE's register space.
2. Explicitly tell the ICE driver to use HWKM with ICE so that
   wrapped keys are used in sm8650.

Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bb0b3c48ee4b..a34c4b7ccbac 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2593,9 +2593,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 		ice: crypto@1d88000 {
 			compatible = "qcom,sm8650-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x10000>;
 
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+
+			qcom,ice-use-hwkm;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.43.0


