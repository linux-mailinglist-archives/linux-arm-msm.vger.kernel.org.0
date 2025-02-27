Return-Path: <linux-arm-msm+bounces-49761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D599A489A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058C27A72EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93515270EC9;
	Thu, 27 Feb 2025 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L2/pP3CU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C163270EBF;
	Thu, 27 Feb 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687412; cv=none; b=k+OR5TqHl+Q6reaEuQf/qcoe3fNXBF7CVHlplkEdPtTcrzrPnJ9BozEkFvbOJwPYIocQbunMeMAycjjbGP3OF+QjVA/1iLqjB3bYNnfvQQx+oB1LswgyRmwNHsPC5p/04C4z38K/LdYNx2iMacpuJJZ6G45FRjlTrOvwQ0X+aok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687412; c=relaxed/simple;
	bh=TgUgSCfEjp/Ol+C+9VklJ/oJBe5DmYOGniiUhH7U5v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sXji8AHe7avHZ2i11C0XDJCoPBvnSimKE2jScEBfWmIhab326DTvsgOCRpqf/dHaCJDuR9gucwLiYZIQ8x1T8SZt5BOhVJeESRhvvYvfBUgDexxK/1cVTnEvaQzoV8jxwa4OdJeVAl5BWrLgCU2Yj3gvNnsoQslc1LU4ZEZk9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L2/pP3CU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGspj1021539;
	Thu, 27 Feb 2025 20:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lw84Gh7TvOeiskkHs/TyNfsZ1Q9WTbX4FLowNZ3+r4E=; b=L2/pP3CUfaSTP10r
	6UZUudNWejBOeX4OC1jqVdS1/Daq7jci7opb0plVpPdXUkWnfFU8LMnJRsCVNzPu
	EbWsR4QIu2Zzkbw7yVK3v2d5m7P0hbsZoG4aWf+AFvSAjJffa7AVnkJI1VX+0c59
	Cjo+ah1fQV/HWbFcxjWb4HGFv2u2TJuP0nRaoTUdhFtNmZ6ULq4hIuoZbPWuzm+9
	mdMf5i5PES2f9E0JpkXpcXO2D1GOBwsWLq6FsIx5W7HBKmvv8VymswKBSIHtpNk2
	hB9uwoGMMBfc7tn0tvK9M7bkQ7DGMv6qhMEqOso4jdOLenLNNMLgCe5kFw9+duk8
	GVF+mw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkq1k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RKGk3g021565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 20:16:46 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 12:16:42 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Fri, 28 Feb 2025 01:45:55 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs615: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-enable-trng-for-qcs615-v2-2-017aa858576e@quicinc.com>
References: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
In-Reply-To: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
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
X-Proofpoint-GUID: qn-wKMcWjadJLoYJ6LbOnQ87aCEJ6DdH
X-Proofpoint-ORIG-GUID: qn-wKMcWjadJLoYJ6LbOnQ87aCEJ6DdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=614 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270150

The qcs615 SoC has a True Random Number Generator, add the node
with the correct compatible set.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea62dea13d05eb874530947e1e8d3e..9048514e8ae9046df5cad4b8129311563af68f68 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -453,6 +453,11 @@ qusb2_hstx_trim: hstx-trim@1f8 {
 			};
 		};
 
+		rng@793000 {
+			compatible = "qcom,qcs615-trng", "qcom,trng";
+			reg = <0x0 0x00793000 0x0 0x1000>;
+		};
+
 		sdhc_1: mmc@7c4000 {
 			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x007c4000 0x0 0x1000>,

-- 
2.34.1


