Return-Path: <linux-arm-msm+bounces-47715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E7A320EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9531889ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E009205513;
	Wed, 12 Feb 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hNMAYRfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93914204F8A;
	Wed, 12 Feb 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348605; cv=none; b=NYyA3DRKwd3zjIoBHGIUbQXs+0EF9lX0iFCzdFdHZOZcNfWujwXT0XQJ8d9I4Yf9jrgWFF/hxHN4wJ4/Rv/q7Q8YBUsUBtlSWtmpwK1fpSZRK2/3oEz/7YVPhNCvF/3k3gwnhWkps2hsrvUudVozk4ufvLBenbHxwbgivH3D0/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348605; c=relaxed/simple;
	bh=vmpf02CVVjPWtl6ZfSHmTrRC9aOMAKZm4jwhHVDmpIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UxDDnQCMMJrI6iu3XHIozGtOrRis4AlegV8pZpInhwaCqkuNANnZDEAlrgylClTIBShnDRwJSvNn28oiPD/eRE/mpmahfwDYV9VAsU10wIwItfh2RX5qZOwzlFGw+GQRp4JH1pHlWLch84QYr9zZrNP2FaIa5/rr5kX8F/iNvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hNMAYRfF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BLaE7f011796;
	Wed, 12 Feb 2025 08:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ji/gu4FnZscMok83GZpQCXjQzfYUmEvXJvL6SkN0t88=; b=hNMAYRfFMX87dz7a
	t4mwn/EZ6X0HXCK+pSvP3erj2T071xWsq1IcKQpkDYkWoLkE0ltejkj5B7ila+lt
	m4Aq00bSS5PgNFHty0COgqnRDO3Duz/A8F+/LKbuBCCJzOEp/xxtvjrO9gMCCC2d
	0zXfmlZ8IwB0MNwhMCSNDfcoqisrAjNQnkEYOdkgnn88l8i0J9gY0K0Mz+y+XBxB
	W3UUnOzR8/D9qz0nqg74pQdgc/rYObgPDdeqvkVuIgYZ7Ti6EUWe2lW43YwgMseK
	N+aCZzyvJ7qLxrX7a87CpwyTawyqXbNFwplcfBrZgrAL0MaiBiHSTaBxR8ik8su4
	KaFklQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh6vmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C8NJtU007759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:19 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 00:23:14 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Feb 2025 13:52:22 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-lpass_qcm6490_resets-v3-4-0b1cfb35b38e@quicinc.com>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
In-Reply-To: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gaVLH0juE_mi5VPYpE22Mtxx2iuaCnuE
X-Proofpoint-GUID: gaVLH0juE_mi5VPYpE22Mtxx2iuaCnuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=923 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120064

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..057bbb187ab35a7e6cca9cff6a3e4569ae045fe2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -986,3 +986,8 @@ sd_cd: sd-cd-state {
 		bias-pull-up;
 	};
 };
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};

-- 
2.45.2


