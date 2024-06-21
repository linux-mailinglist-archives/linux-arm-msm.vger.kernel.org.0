Return-Path: <linux-arm-msm+bounces-23577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1BA912479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62D08288B49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBFD17BB07;
	Fri, 21 Jun 2024 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kDTs2kD4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CD17B519;
	Fri, 21 Jun 2024 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970502; cv=none; b=qAvJc5aDHFdjeOZc/NBxin4sC+XKx1+AIS2FrGYIlr/mUyRBEO74fI3QWgmvpyiiIoHq2J688sQ5E4Yyn7Y6OFnthRI8oF5U5dZiY8Xsq6XCvcFQKeef8ZG8b1toGksaOfE1RZuSUVGysayLbylsk3lmgwDJv57cFt5wJGBUPHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970502; c=relaxed/simple;
	bh=4ThxG4B9/lcQXcObSmePLWGFVRpY+4Dt3/EF8+OZ/1I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rA5APL4G4ClUHXPTQa/vikiZ6LSxKu3qKSNPxC+7G5muRw+yNgpBWlH7GZkNXAPV3PFLQK5++5v/uydGl4YRIL8Lx9EyGW3OyERJTZp411KV85jbJjF+8YggJ1zuTu05/o7H/ENBO8fuOLcaWCzioFHXwpyOE9LycNK4GEBRNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kDTs2kD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L6SmGq003415;
	Fri, 21 Jun 2024 11:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVXXgAAPP/RxXHmRe7ssW/8pMeOFZQceWbE2BV0xYBQ=; b=kDTs2kD4rC5ZWG32
	I/8y/TA0zoZSza5vQQHTe6WbxEjw0rCc9og+ZAwuXUXYmcsrGmipEJd6ETwYB0Or
	94wSAZpgiTEUQGbx/B3iJViUj1PDNeAJZAfnONbJ/IBOM2lDQ2CBcit+K2TcWXTw
	VjOkd029V72wSzUwwX5CXCEG2kVtKPe37d3vC0lLcPXTU/kvpi/ie9hj0VcGZ6tI
	e+eNQwoGoXgzoZB9VZGOrKaRgQ2keF8/tZ9bYHU1WXblZLDHVSPi1woBqDJDbSil
	0FttgyDsgI0HH55ZWWhrUAdKRtF/QhxU7XqfBLuhktVCEy0lpRpqRM6njKpX9gAI
	h1Rzzw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw49eru2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LBlpos023998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:51 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 04:47:46 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
Subject: [PATCH v9 6/8] dt-bindings: clock: qcom: Add reset for WCSSAON
Date: Fri, 21 Jun 2024 17:16:57 +0530
Message-ID: <20240621114659.2958170-7-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vKNudVhT8xQ1UMVSi0dUj9ZtJryZqioC
X-Proofpoint-GUID: vKNudVhT8xQ1UMVSi0dUj9ZtJryZqioC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210087

Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.

Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
index f9ea55811104..e47cbf7394aa 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
@@ -381,6 +381,7 @@
 #define GCC_NSSPORT4_RESET			143
 #define GCC_NSSPORT5_RESET			144
 #define GCC_NSSPORT6_RESET			145
+#define GCC_WCSSAON_RESET			146
 
 #define USB0_GDSC				0
 #define USB1_GDSC				1
-- 
2.34.1


