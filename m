Return-Path: <linux-arm-msm+bounces-27047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461793C0E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0123C282EE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E8C1993AE;
	Thu, 25 Jul 2024 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ehvNAJ26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E41993A3;
	Thu, 25 Jul 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907227; cv=none; b=QmISwNdrk82kDoc4QjWwarytHG/iz3jCH8xTGHZu4yJRWNMc8bwAeSv6QY1FtuYfpH73/xmovgJ5y11be/AbQVhCjwGlPF7FsTux0L1lZ8SgYlbuK/WsU3yE25p+RsHp5jfni7cbfr6i67qraMG35qXrlAAj/wbFw/ahCrMzaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907227; c=relaxed/simple;
	bh=j/fdAKrvGirk9DBqNvpzfYv7lXeN1yDW8K2QuUGz7ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oIrZ/20fjZUUvVasakiom4lC7lZrh6a5oDqB5vlrudVIZOHqKbuadRdj5rSMNUEhcPKg6gbUSefbRPVgJ8qS7J2o3f/T7g6Bc+99e0CToy8etvWrotgCMgUE/Mt4CimpjO4WRaCruiWPAvHWPxmvVryORukw7Q76gH8MMoPO3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ehvNAJ26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PA1PnN030777;
	Thu, 25 Jul 2024 11:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1JCoZkxYtB5UGG/WDnui3KroFWBogL+3Ow1Wh61G+8=; b=ehvNAJ26YvA6UXcj
	R8v/mB67Bteszm1QVXo1svEDItnn6Or6Z4N5rIbD5Z+FBwGgPdiasZKHoVyYxjgi
	mtYgAmIerEzGjtjxkT/SHP7lPIJWFGXY5nRLMRptuaisDfdtM414vbNELzkr7uL5
	kvoAg5iE7u7YgOEUe5K1sGoA1w3viKpf+QI54HSfSMSkZAir0VSX5HvAhQ5Qfzty
	55cyIT8yXh6RKH7oTGxHGjh1AKYiJW7L/45NgcJFublE76wsUGpOmkmdqQ+x3aYV
	8ATQI+hmOl0uW2zLfCjVRfqwIMSlhGESbEP4454jc0rJJWqKux+qB1Ni+MbPl3q8
	ZXuNPQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40k413jn1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PBXgQn013480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 11:33:42 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 04:33:38 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 25 Jul 2024 17:03:12 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add GPLL9 support on
 gcc-sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240725-gcc-sc8180x-fixes-v1-2-576a55fe4780@quicinc.com>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
In-Reply-To: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UvG7ZA1-79iOLqJbWkNIg20mVVKfrIlT
X-Proofpoint-GUID: UvG7ZA1-79iOLqJbWkNIg20mVVKfrIlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=777 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250077

Add the missing GPLL9 which is required for the gcc sdcc2 clock.

Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index 90c6e021a035..2569f874fe13 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -248,6 +248,7 @@
 #define GCC_USB3_SEC_CLKREF_CLK					238
 #define GCC_UFS_MEM_CLKREF_EN					239
 #define GCC_UFS_CARD_CLKREF_EN					240
+#define GPLL9							241
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1

-- 
2.25.1


