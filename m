Return-Path: <linux-arm-msm+bounces-48595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F6A3D06E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF98C17B8D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0261E0DCC;
	Thu, 20 Feb 2025 04:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GXToqXG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7B1E0B86;
	Thu, 20 Feb 2025 04:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025409; cv=none; b=UGuIXpUyrC9k8gXwyxQ/FCOn4QrJSivd+eFU7f5GPTWzGQlud1TusuDUIXGIwkjVN65mvzu9dfHft+Fp0cWruD86eUGhUzTpTHA8WT7Rxu0x7AXYSYLqs2GStaIC0e7X93F6Sa3verfGkqXfHQLS8ldGwoKTgzEc1m8JPv/Nkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025409; c=relaxed/simple;
	bh=7pUdGkyigLIQ5b7acjzKcJ+ovM1iPNIfCFi6Y+LkWLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jaq0NvQhtKY3WkqDSMyXG0JICbG1FNYyWSBCqoPjBiSMumP4SHp8sqVCfqGsHOqKv0cvIRmpnsmkLhPpO1NY3TKIIe3sjsbgUjmeFd/vinrlEauyVOQzlumt9P9bo2T+V3KUn1/7BSvIUGbVzg1Y+V00PQrTIrb6dzxmyF69Ckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GXToqXG4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGEOYY008280;
	Thu, 20 Feb 2025 04:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	daMk/d3ipNuTU1GnadS8NLtgdGSDpu6Cyi7fmzmGgvY=; b=GXToqXG4oYvwvJQ0
	Exp8nj6atk7ZZKMwJZRPUGkeJOYO02VGaUgh5pcLpk8iRevwKVmQ24pJZ/vK7Vqs
	XrhozdGb2BOxWyHO8f174Sa2RSAzHwiXz34ukVa62MEeLTHq8bleK0AXFbYyJ68j
	EDVJ/00vzIWUORctRJeZBp2VJFYo1IJ/TFW4OBhM9/WfgOhDjXJRxpoeHhdR6SYc
	JM88SRGwGb9dga4y2f7n9nPQSHsmhwQ9wWB0Gypj9BgPCOutcmztAnhkW8ubK4Q8
	w3WAGIi6VF2cCXEpsWkGFRgyEVGHgpqC1Jdmw+9K04fHYQ+Uw6uG+hgRdB+MfnxQ
	y+dP2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3cub3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K4NNjI022819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:23 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 20:23:19 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 20 Feb 2025 09:52:52 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: qcm6490-idp: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-lpass_qcm6490_resets-v4-3-68dbed85c485@quicinc.com>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yjLdG0IU4YCxoCwjR50SyMFBsA9ZsRAJ
X-Proofpoint-GUID: yjLdG0IU4YCxoCwjR50SyMFBsA9ZsRAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=966 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200027

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCM6490 IDP board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..86d58f625d0e16a1eccd9925609b496fbd066051 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -759,3 +759,8 @@ &wifi {
 
 	status = "okay";
 };
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};

-- 
2.48.1


