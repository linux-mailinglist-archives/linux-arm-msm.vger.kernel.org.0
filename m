Return-Path: <linux-arm-msm+bounces-38301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7099D238B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 11:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4AA9B2596D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922281C9B9D;
	Tue, 19 Nov 2024 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BcgRNs5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5761C9B87;
	Tue, 19 Nov 2024 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011840; cv=none; b=f3kD1igdBz0CmT/PNQNmp/onOlnwGXaWvoVUijC+vGGPq2qgu8rCNZMAFgwkOOZqctwvGlRNnLpNN6uYtp0Kf2FUzIOC6fXVkinW+w0Am8ZlxPgwvVMN/fGlG5dT26yDB/TSBntRFCXmet1KjgsBXU5oQnmCbKKDchuN9dN2uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011840; c=relaxed/simple;
	bh=tLs5bjkzFZzPWrdjncAEAQBFNtEk4VLgMIPy0jKHJ5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tabdbaBZfsI+6Wh93L5MXfL/QW7HYq74tqqyCF2x+n4yfvoSCm/AyG7FeIOFJ1AsyeUJw7q6WPhNo0pm45RJyjPqSN5bLSwPMxQLmTwjHwna/GJ97uE5H5SCvut17DbJWpdOz4LXxhqYV/Pk8T1/oNNL/Tm2CfOQGiIjSvQkQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BcgRNs5F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ74iOc005735;
	Tue, 19 Nov 2024 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmWNqeDjgf10eeGqVzFHRDCMbF104rlo3rm6ULB/FMU=; b=BcgRNs5FuG8dGBUl
	FWBhyB8wv12SX3AR7xfpHFMXkDvk33+oUyGKLvrzP6j6P+oSORBsUsXojhbQE2WL
	tmgpO3rDP350bX47+8hEUO2BnzVLck34O524g8WOjcesXK+bgi/DA/gMKUsXCgK0
	I9CAtNDm/Q7QSFf0pyaCmSBqPB/J5ZMo7V87SHOYDJPUnd4OLw/O4VD/wZDeGa/s
	ev9GHyLkBgn7TMS1msUH4TB4iNs4bei0EafjXHhJTwGkUvjTPCbDmAKdlKTTMWlI
	LTCi8v5Fa66W01i7G3ULb1iHt0W5nTqPdcnefny2Fq0GBpFEgfR82fVT7tKk/Chg
	KwtfHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y927fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJANs9V023784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:54 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 02:23:48 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
Date: Tue, 19 Nov 2024 18:23:15 +0800
Message-ID: <20241119102315.3167607-4-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
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
X-Proofpoint-GUID: YuaRKrFSJsfv4kLWLBlK3LxLeZjfPl4-
X-Proofpoint-ORIG-GUID: YuaRKrFSJsfv4kLWLBlK3LxLeZjfPl4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=977 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411190073

Add watchdog clock on the Qualcomm QCS8300 Ride platform.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c3..3024338bcfbc 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -265,3 +265,7 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l5a>;
 	status = "okay";
 };
+
+&watchdog {
+    clocks = <&sleep_clk>;
+};
\ No newline at end of file
-- 
2.34.1


