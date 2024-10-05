Return-Path: <linux-arm-msm+bounces-33171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BB9914EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 08:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AFAAB21B97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 06:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C546F305;
	Sat,  5 Oct 2024 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="neL0g8ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBD54F95;
	Sat,  5 Oct 2024 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110643; cv=none; b=m4E2Nz43Nf2Q4FZA5gg5q+JY6aEpi46uB5S4L+BYeTjzXJ15f45OXfZweTM32Va7PWJQByUcaPJKpam8G1Qy4VXH/AtjBl/k1dj+hiTOa8J7ceKF2u+mYxDjGQ1UbNfC9OFiM5Qemowq+LviS6w34B3WZq7ZgrFMrMmf3lhnLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110643; c=relaxed/simple;
	bh=z2Sa3eT2Q7kjFGskN9xt9Uf1H5+Ymy4fjPjmEnfa6+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKOXqCi4fcW50aKHcGHnW8R/OFujlslTfX28/JhWqRKfjMH2YI9Ool1xbDGHZEGz6IzKt+pJlz92raCFQCbOcrx88Wb8MsyhAjW9qrsQ3humqGeA2FlMEm/tZyLP4q9bZRTvPQiaQpbDfip9UAK8CRV2ftD1LoyL6F/mwSFItf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=neL0g8ea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4955U2mJ020209;
	Sat, 5 Oct 2024 06:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Iy2clGsIiHmnZAPATEaNIq3Rbx4hAEwt9/JJHoAsEE=; b=neL0g8eakDJ0FeQQ
	mqRc1kasLi/NCUCIUpWf11dYOUuvMRPsNN+GsfgorfJctt4PZjiXGLstPr8YS3X7
	XEkNUQQn8Fw7KjW4uOfWSyR7MAyTlU9E3/RP/5xrkb8DUxCnPX2j8sZoQtg/6IUr
	vnaqrs6zl2MKIUsPdeDlwp+xn4QCaMG4CEDscOTXfKP+TCZ4UahHoz2IEjv8T3vu
	/7Wan9U25Hq9+acxOtW0NptaE1f7PYLjKpCL4vL8Gy5Wjp5HPS6vF1D69uBpPd07
	38BM1vV8jtXMpwGWo+3hS5g8gMbYG2KfQrtFEaTBW34QAnIXIx0afxY8G1AjnBK7
	tKwoKA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsng3s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 06:43:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4956hmaZ020681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 06:43:48 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 23:43:43 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rdwivedi@quicinc.com>
Subject: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Add ICE algorithm entries
Date: Sat, 5 Oct 2024 12:13:06 +0530
Message-ID: <20241005064307.18972-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AoelYQlNLrdundApUBVlYLWkN5Q2fnL5
X-Proofpoint-ORIG-GUID: AoelYQlNLrdundApUBVlYLWkN5Q2fnL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050047

There are three algorithms supported for inline crypto engine:
Floor based, Static and Instantaneous algorithm.

Add ice algorithm entries and enable instantaneous algorithm
by default.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 9d9bbb9aca64..56a7ca6a3af4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2590,6 +2590,25 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			#reset-cells = <1>;
 
 			status = "disabled";
+
+			ice_cfg: ice-config {
+				alg1 {
+					alg-name = "alg1";
+					rx-alloc-percent = <60>;
+					status = "disabled";
+				};
+
+				alg2 {
+					alg-name = "alg2";
+					status = "disabled";
+				};
+
+				alg3 {
+					alg-name = "alg3";
+					num-core = <28 28 15 13>;
+					status = "ok";
+				};
+			};
 		};
 
 		ice: crypto@1d88000 {
-- 
2.46.0


