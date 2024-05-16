Return-Path: <linux-arm-msm+bounces-19949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186E8C7D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 21:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0659A2832C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 19:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD696156F47;
	Thu, 16 May 2024 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eXaneYh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52602156F29;
	Thu, 16 May 2024 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715888151; cv=none; b=hhcSpDA+T6Nw0/qvOYcRFv66xHowFRwsE1E8ZxZ2WjG/N85ulZDJLhDfVvNMFm6hmFeWqSDhkGEGn58Ivf3ayXvlMQma9zjsxUVuE4s4iE3c+Lwq53hpk/wB/iAjEQRs1resP2KagdJscUQlcZSVUlXnTYBtkj7Y2Dk5x9knr4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715888151; c=relaxed/simple;
	bh=mNGvbi6UBTqM0UtD7DtDPlPW0sys/RPnQHWpHwLBo0w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T0d/wJq3HRb4erXjNUMgQFE+rLjG3RjRvZE2D5hFPJ8EaiFDHkbimlGmEmgyp4+HG2s3OZjIuqJv8T18xAzR++tXtfjSCLHSLOxx96ZhxFay/RL9uP8ZtDVDVtppSWq+36PPz9Qv/JOiy4wW1nG3OZsXvO+62AtFS57XQ5oWU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eXaneYh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8a25c004298;
	Thu, 16 May 2024 19:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=8F41lEOUWhxcepV6aCwJ/7/6o8SC7cZS2HU/5lRsPDU=; b=eX
	aneYh7Vd8L7jCzZ/uVou1mTCUKBsnh6aW/lp885V0znX0TGzdmruN9gBdy+ZzK9p
	iEHqAq02ktCHGovyc9L/EukPlB2D0aGQvDrdEVDHMoI+OPOb9Zx0hEcRnVNvUTxV
	Mpx4RafuxCy8BbkNF3F4xoIbkAOk8mQ1F2Okqtpr17aSMeUbB7KnWSw5lgMkj5LN
	8ZjwO12I47PTJ6YidtET29gkBX7+sqp/ZyFwPcyJcuUEYh5gX/qQehXnI+ItDsus
	po2EHZR03xu3xd5U1/M84hS2homfr+uOkS99dQdl8rBXtN6Asq9QhMnOCUNbTt/l
	DPwQ/EdJBi6FUujwXRhg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125mnm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:35:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GJZinB022406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:35:44 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 12:35:41 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robh@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sm8650: Enable download mode register write
Date: Fri, 17 May 2024 01:05:33 +0530
Message-ID: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5AnmAQduDhgfS8_89aWFVbTU0H_D4dSt
X-Proofpoint-ORIG-GUID: 5AnmAQduDhgfS8_89aWFVbTU0H_D4dSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=831 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160141

Enable download mode setting for sm8650 which can help collect
ramdump for this SoC.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 62a6e77730bc..eb0f20160822 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -371,6 +371,7 @@
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8650", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
-- 
2.7.4


