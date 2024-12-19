Return-Path: <linux-arm-msm+bounces-42722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0E9F72FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 03:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A607C164A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 02:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335E278F51;
	Thu, 19 Dec 2024 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZreK0Kfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC567A0D;
	Thu, 19 Dec 2024 02:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576763; cv=none; b=joE8MgdhfFC//SQN9rFb87fQuMLJ9Y2SPQ2VID+uzZ6C6MoaeDzgmcaNZhaT1A3Qc3OX1M3CcpDn53k6bKodbqeXweLDwzDhw13MhlYJ5tmff7IjIOTZ4qO4jhP51XrRLujzHF5J8VhtnIm5F9UXfFY1JtaP03msAj512SytjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576763; c=relaxed/simple;
	bh=x6DZCHoIXiXbsfue7MgqTYDG9RK3IkbEC5JX08dsJiI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRLkrVlHZ3vxQtPj73P8p1+t9m/bvXd8xxCTmzV3CwQNQMUK+qB1YNV++AwnVdjD76tcQb12vQirpJUK10yFfNUqGhNdqiKotPm55N73ECLC0W+mCQ2xLW9xJAsGlpok3x8tvQ71JuqmVTiFgS39r3PM7wzSLp5aRuQwxN7P/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZreK0Kfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMrkgQ012017;
	Thu, 19 Dec 2024 02:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D4SnHSW6LQq11ftKyaEW6C
	aGsOfF5TUS/cmHgOCf3/s=; b=ZreK0KfuVNynXyxxKfG6WyRmWH7HPMxBZV/KNM
	HPYb1i8phY4ZNfBJTUFenVTtuSBRF+hGTvylbGz0kSpSOVyOLNsT8UUC6hB7pOM1
	zdYvDrplM0J5uos208eyLgz20HTfQn+TWyi9QK05+4q+rKOQxXUukVaUPmjS8vG5
	yJvhNCJd78ZeVVVK+TNDa6K5icq1mgDjHsEsmwNRTLasdNxi0+RCG4UWHIVjUqLT
	jWVPR24qQWXvsUYHpg1weLccamjwtXlbQsyekOeXIJAOAHrITNY0GRDVTfDgpYT1
	3kmyr1XyyRGSyGQe1oy3bRZ6gV1u2V+aihUAXGLFyzbClLkQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7ka0dxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:52:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ2qcWS017661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:52:38 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 18:52:35 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sa8775p: fix the secure device bootup issue
Date: Thu, 19 Dec 2024 10:52:16 +0800
Message-ID: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i1u01H6X8Omm8FSntr3pn7wwo53jL5l7
X-Proofpoint-ORIG-GUID: i1u01H6X8Omm8FSntr3pn7wwo53jL5l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=764 bulkscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190018

The secure device(fused) cannot bootup with TPDM_DCC device. So
disable it in DT.

Fixes: 6596118ccdcd ("arm64: dts: qcom: Add coresight nodes for SA8775p")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 368bcf7c9802..9da62d7c4d27 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2440,6 +2440,7 @@ tpdm@4003000 {
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
+			status = "disabled";
 
 			out-ports {
 				port {
-- 
2.34.1


