Return-Path: <linux-arm-msm+bounces-32460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99727985612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 11:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FBE31F24358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9D6156661;
	Wed, 25 Sep 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wp6jtN2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844212D20D;
	Wed, 25 Sep 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255239; cv=none; b=tAz2qnGHSXVSNUBm31QT28r9D9LKK0AU+ijWzAeVb12AO9kTNGohIRBx2a7faHHkgAp9vcBphvsNZ1HFlGZY/3/5CW9Xjl3G1tkSDP/k0Cbxnn2+YaMpGepESdMpC8SvkY4vBpRYYT1veE5u7A9/L1JZymcJV5J1oZZZu87w9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255239; c=relaxed/simple;
	bh=kES6VBN1NljvQbZDMcvTT+f9VfdLXE0r+xGDKiev3fw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tU9psgLHhrIkmgpQ06Xx8wKRaVH/UJfosqgLMfmnOJ9DObESFq50UZjqwrkQagj38AUy3wRjS5mjkWZ8mHOLhFWfy+RciN6D09bcCbl4jU9FUmpE5e6zTNY878Z6kus9JcFPclmn42VrbWdJgraKLOgMUryCne99LFd7ZYbTqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wp6jtN2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P8Nm49005416;
	Wed, 25 Sep 2024 09:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2P7zf0h8271G9c8uj9+9m6
	5W2uDQEJvoZrE/yBtWvwQ=; b=Wp6jtN2rET+/xRMtav48dsOekqzIluLhENDLFU
	1mG+8hin7CMC50A/eBw1schp5B6tygPg8ooIMaW127ICHVKqIK12AEW+M1vhXgd7
	jW2IYTQXtVGKPiZz0VrrMR0WzAupFYyAy6AACXXk0GBGQ4JPyZtm5Tkk1M2jaeOd
	hLdEe2gh7I/qeRilg1fYYR1bHsLs+HSikaGjHLCe2WDx2f+KEzQ2Z4d104UQL1Zl
	A0Teeg09SltMmkG6IG5w4TbJRLtBZMAmdVbLgG8jjoT1AhcLyG9MNV6NXu2L+mfG
	GxfqC+Lglxq5aMCLb66SRcjI8IjugTV4pTyYMk4rn+/rGf8w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skueug7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 09:07:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P97E1P014714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 09:07:14 GMT
Received: from hu-bpothuno-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 02:07:11 -0700
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable wifi for qcs6490-rb3gen2 boards
Date: Wed, 25 Sep 2024 14:36:50 +0530
Message-ID: <20240925090650.26314-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.35.7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w9bNEcK5dk9IJ2m6cW8rJu3AcK6Fv1QO
X-Proofpoint-ORIG-GUID: w9bNEcK5dk9IJ2m6cW8rJu3AcK6Fv1QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=555 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250064

Enable the 'wifi' node for qcs6490-rb3gen2 boards.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..21bcfcdb5e46 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -792,6 +792,7 @@
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
+	status = "okay";
 };
 
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
-- 
2.17.1


