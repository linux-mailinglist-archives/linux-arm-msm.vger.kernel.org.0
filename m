Return-Path: <linux-arm-msm+bounces-25384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3A928AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 648A3B20CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5723516A38B;
	Fri,  5 Jul 2024 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zz09jFgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FBA14B064;
	Fri,  5 Jul 2024 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190110; cv=none; b=N1qqiSp3ESJIbF0VHNJR4c+kavV/kximYrvFwn3PEDrp/Aps0fLCFASJ0rDEiy7fIesFi3OiIGpOsU5cQO0+PXMk+W2G40HXRQiDz7IpyV8DdcLvJvb4fRoTV9jD1yPzEASLD+wrsXCgb/ukkIfyX1IF3I7wVBS1Q4E1dzlYCfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190110; c=relaxed/simple;
	bh=GlyV+PKxk3INjRd4XTmHLYzsltHLCVxsPbrtr/5mliM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mLfyTV1ouD8rlYBf6uouPey02FuvP/sLh4NsLx4ea2OOyceKjKY2ueiGmR/O3fIY6yrYQ4cpnBbW/WztasdqM2MnUoPbbOlIGCZWeP237NwaHenZzm8Wi1cGq8Q+4qPz2ZYKFHUGg18LGMWLmDvlEzLo6oXejxdndU3wUfmxia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zz09jFgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659LwnY026217;
	Fri, 5 Jul 2024 14:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/fg4kmevgVaH7YcHhAfj13
	+1uVNJjgC6q3Q0YteaxMk=; b=Zz09jFgrv9H8giImXJWQFfvwtcF99pQKPOSW1R
	lU1CBQxwPttHf6VbFxsrfWk7YdWwCh1RQlnR/d36NMsTLX91wa671sz2EohUGL+R
	4LckB8bqZgi22fK+6oPV0rRhYq5qUXkYTOExggyAkc5BXt9JsR4Tz01MXcJobIMt
	za3jbDLsOUWa29S9C8dv2akT4mfhfdQv1QUvAsgjNgUUi5fqlzKtAzMcd0870KjP
	e7zAJ9MBO9aaDOJmPfiGr7ThrUIj460g4k8xMKtLkUz9vxoZE/O1W5QNUpCdULdu
	O6+I9jjXOH0k9OXGBa5V1Dw1xG2zrnMq1rAs0l+XazdWk/1A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndx2xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 14:35:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465EZ4rZ024818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 14:35:04 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 07:35:01 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Enable download mode register write
Date: Fri, 5 Jul 2024 20:04:43 +0530
Message-ID: <20240705143443.1491956-1-quic_mojha@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mp1YcA1S51jWO7YSb7Yh_lbYOWZdqF2D
X-Proofpoint-ORIG-GUID: mp1YcA1S51jWO7YSb7Yh_lbYOWZdqF2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=779
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407050104

Enable download mode setting for sc7280 which can help collect
ramdump for this SoC.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Change in v2:
 - Wrong tcsr phandle, it should be tcsr_2.

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 06d0e59e7125..3d8410683402 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -711,6 +711,7 @@ memory@80000000 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
+			qcom,dload-mode = <&tcsr_2 0x13000>;
 		};
 	};
 
-- 
2.34.1


