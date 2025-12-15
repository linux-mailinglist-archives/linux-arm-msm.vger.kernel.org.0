Return-Path: <linux-arm-msm+bounces-85230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB21CBDACA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05D343020DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597E9330B22;
	Mon, 15 Dec 2025 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qzq+QCqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAA32AAC2;
	Mon, 15 Dec 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800031; cv=none; b=setc1IgaviM/OD4Dq4YhiOxw39kWRq96tLqgyPvfJv2O123p1yrEwktMPZ/6DVEeQscapxYArhqGghM0krmJWQYOIZKt3Fxk1RhewL2YL/lZN5q2Tnb9vulJ1yiGiIRYGolY7+VUnuvqzmViMmYbJtmTYEEdTHAaEOYC+8AOMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800031; c=relaxed/simple;
	bh=s5L0D44I9/qrsJ6pTD90a9Fa9vxlhjdd9ltWfH6WNQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cb+iDrYKG38hMZmj896UmIwVbJxL9GDxS5i+YPF/yOgVQDgbrBKvxDlNpBuFF3tFErPyg5PMT9MQAJfp+lNcPp9G1ERKeOtyI666sJBg+rfw2LvVMuNcuduvItMnZuQua0xbi/gPAWWI+TK3SS1cYbUZZO6f2XqnYL5ueMSjkaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qzq+QCqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFAOAl23698008;
	Mon, 15 Dec 2025 12:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LkzRN15bfrz
	FupZb26I6dPUWuor67Rt4ThUnhR53EF0=; b=Qzq+QCqm35UebC0dBV/QMdrD9mq
	SAZj7wfjBuArI3q7zGN3x7HIlzCMLGOvkTNqeZ/68laHDOappZWH32OD96W39ZEL
	/ZDz6e8DxSLm2eyCL6l1pzUWH+fl62/lOSCkmZnblhj3650FUH/mb9024GOz2oxP
	yrfUapkMlYInJjuZzLh/at/8Hc09LeWnQxQ9+HuAzTZ+XkL+LRwcA0CpDpCGA7yQ
	koNpA421xtXn/6HJiedFOmEJZpmVq1GD6DGGb03k8l6iA/MZ9g+jZ4aNr9nEMypN
	mF72WedkPH9bfsFdxczcL3nOev2Hhhi34AMAOwU+q6tO/GsFb65ycIlfmQg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afcf3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0Jsn029071;
	Mon, 15 Dec 2025 12:00:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0JWH029064;
	Mon, 15 Dec 2025 12:00:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0IBQ029061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id AEB315D6; Mon, 15 Dec 2025 17:30:17 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v6 2/5] arm64: dts: qcom: Add sdhc dll-presets
Date: Mon, 15 Dec 2025 17:30:06 +0530
Message-Id: <20251215120009.3877889-3-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693ff857 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=LY8UskAvO7GVwCLl8fAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfX7llbMFJP6amE
 6HO77eevDD1WNWZVLt/qzAUBF7EhtSKOU2AJXnw/GSpYW8Ndz8U09SXSvzYUCqeu89FRJljuiWg
 ObW89EVXh9X06x9EtKSgjkwba1REim9YslitDaqMstkckUbz1vUkpyVWQ14HZy8bWhSwbFd6/yo
 GkytGgEDBWx02ygn6IjM/CXp03r6FVkn/g5V97wPHWZlJP/WS3rcxYeKkC3yL+ulY6fx66TfUgQ
 AgNKlZ9IEykAp5jqh+PYIja3Li8TKDZ8okk0qfc064LTevzFaSCvnniJBILkVTy/bBVVKJUoQyJ
 8026jMnNxq6ZfFj9Ul22P5lxb+btaF3lFtlKZsgVrSC66nJteQPkoNb2v92FdnUGS8szLONIrBr
 kuKdzZJ0S04o4BSlS+SKfd9DAxVeYw==
X-Proofpoint-GUID: _uQKtiD927rn3ABRp56Ym7ihdGjXZ_8v
X-Proofpoint-ORIG-GUID: _uQKtiD927rn3ABRp56Ym7ihdGjXZ_8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150104

Add sdhc dll-presets for qdu1000 target.

Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 846e5e5899aa..bc31504d5c8c 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -912,8 +912,8 @@ sdhc: mmc@8804000 {
 
 			bus-width = <8>;
 
-			qcom,dll-config = <0x0007642c>;
-			qcom,ddr-config = <0x80040868>;
+			qcom,dll-presets = <0x000F64EC 0x0 0x01	0x2C010800 0x80040868>,
+					   <0x0007642C 0x0 0x10 0x2C010800 0x80040868>;
 
 			status = "disabled";
 
-- 
2.34.1


