Return-Path: <linux-arm-msm+bounces-48846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C748A3F077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8084A7A983E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC23E204C18;
	Fri, 21 Feb 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sni06Sj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78996204F83;
	Fri, 21 Feb 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130540; cv=none; b=QdRYysN9mKmFJgDxzMZ87KfiGmHBq9QO8ixU3q1N57+XbK0sImlHrT4IRYwTHCFv5olqxESTyI4iOObA9579O+BpB1vMoevqvr7920zsa8YQQYO/ZmTkfUAvWJshZDGKL6cB2o8E6PRDndtYylMYARiMy70zu9RYfF/jVQoQbWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130540; c=relaxed/simple;
	bh=SIqFecEHospCkHyKG6BlzidyZqiSRNM6DGhG++0sbtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fJJOEG0K/7FyqV2WMNeyNELpiq5oCqfZTGhD+zSweYtnfvWeMYDhG+5by+ZkUU37Z+KApf3uOykSOi+Cgm/Zi913ekjHsZunnuUwdaQT3iudgHc08KosKls3F0dS+84YQMcjYeehMzAkEXkZpb/aS/NJb6b5BeF6hfxVEN3NNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sni06Sj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8m9I4011928;
	Fri, 21 Feb 2025 09:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzsS/HunT1Q6K4CVqaHFiEqL7NHwFvmZmgCArZgmHaE=; b=Sni06Sj31UsUxLEF
	bRThj/155s7ngUmVkUIFzhpGtUoakD8OUVd/jLn7pjf+DkXMXEmV6wHdN33oZZqC
	eNxzhtDHmY5dizsHDMQpKqJZwJ4CJ3yiyDRVrp/GBJS8U8n+6hys4bwR7UuScRKv
	UJdr77vxhBoBpxvN6/JKFe8XVpZ2RobSsAGtxhH6o7BZEcHfYJRp4qOAU9StPTcH
	lawmo/IiqFNtPwLTziEDA0EiIA2CDyrzWw8XXgmPiXsUBuouXrepYQJY7wTYKk6t
	cTrWSI8UP/mUmRP+zsI345RVyF8lP7nXhYpKSb17fZAEkCgePRBsicNt+XIDd5O6
	zmP/VQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbbnc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9ZZsQ008744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:35 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:35:30 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Feb 2025 15:04:57 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-lpass_qcm6490_resets-v5-4-6be0c0949a83@quicinc.com>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
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
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dtMtdPd4We3iqXckoPq32TpZ_yHi6j_1
X-Proofpoint-ORIG-GUID: dtMtdPd4We3iqXckoPq32TpZ_yHi6j_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=953 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210073

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
2.48.1


