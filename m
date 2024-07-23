Return-Path: <linux-arm-msm+bounces-26849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B30939C4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042981C21AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 08:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C57214BF85;
	Tue, 23 Jul 2024 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nl8a/fs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289F14B96F;
	Tue, 23 Jul 2024 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721722483; cv=none; b=fFEVqF8tJd2R5oZz81VyWrcjDjoEAXU57v+P1t785YeHZEJMzn45/ujF+lCX7X2HuoOfllAlK6kjjmvYHffQAK8F0QJmNBhBP2rLb959/9shanWfYciqXPa/N+0AKkZDBZzmelWNWcGlCgnh7XKVtsGuPcpOWppVUGNfEZxSQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721722483; c=relaxed/simple;
	bh=jeICig5dzhjUrVZ04wZ6nyfaq3SPDH98DbepZMC95OE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q6hrPojzY+ZNKAB8BS6mE4x/h1++kJRGbMcHt1KmB7exFyEsWYj9gFRrJJL27GbVx1MQPwIngtmLP6CC7r89lgyU5o2nMGa0B6tIJduTm06CNhGOPwak4xOFyQhtH2C1GdehuAgO85Z22ef0y4i4YWRyZw+aH8qq4EJQRFsPbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nl8a/fs0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MMP2H6002530;
	Tue, 23 Jul 2024 08:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rq4b4l5TcA5skMBNUgpwX3
	W49lKhUo59UwYwvAKlYUQ=; b=Nl8a/fs0i0uHRA2Y6dvsryRgT3NJp1VsxhSpos
	UoRK8X0Vp1fA8nFgmx4gqCb3v2TveT+cdopKS16ofq1p+wXlhdsZCWW/T1K8ft0Q
	6YtjplrZru+DnHWquOxDT9BKnsUexDbQAz+WKMmXHeUVG+eH8h8pfLJtIliKXwJh
	mgu6/Ch67hMRrSa7LgufdRzgFKe0kd96nPNkGEXWthaAS6EV4XgNBW15cgPtKfNo
	o1JpCKq1Mq3xM5FzexR2K/RpOXcoFnJ9Y5yS33mNAWfdBWhF2GrCmUBIZpqWxntR
	fGrDUkM+JP6H4GjZsQUjdS8EkLMHZa30fS7jaWN79eL1asTg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40gurtmt6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:14:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N8EaI8021626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 08:14:36 GMT
Received: from hu-rjendra-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 01:14:33 -0700
From: Rajendra Nayak <quic_rjendra@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: x1e80100: add rpmh-stats node
Date: Tue, 23 Jul 2024 13:43:57 +0530
Message-ID: <20240723081357.1521942-1-quic_rjendra@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zSIpH78PIBQEdLm8PQL3N7oPq-wl3oU6
X-Proofpoint-ORIG-GUID: zSIpH78PIBQEdLm8PQL3N7oPq-wl3oU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 phishscore=0 adultscore=20 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=679
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230060

Add a node describing the RPMh shared memory that can be used to
retrieve statistics for the SoC low-power modes.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7bca5fcd7d52..e94ae22d68f3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4618,6 +4618,11 @@ aoss_qmp: power-management@c300000 {
 			#clock-cells = <0>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0 0x0c3f0000 0 0x400>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,x1e80100-spmi-pmic-arb";
 			reg = <0 0x0c400000 0 0x3000>,
-- 
2.34.1


