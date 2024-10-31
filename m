Return-Path: <linux-arm-msm+bounces-36526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F739B7521
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334A61F250FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 07:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D461527AC;
	Thu, 31 Oct 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RKvZX0fD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9E14F9CF;
	Thu, 31 Oct 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358919; cv=none; b=a6fk0OwtJ7Ai5AXPkHDEXdWWn9CuCnCilNn0TkQYNNLnATnKX270TAYGrjJjhAJEmO4LORxooV30zJTkBrbnx/oBLNAK1qprfWYbKnikeoZ5EawrQgZi7FjLFyQtz6tObS5IUAVS7lbGRAvnYIUCzCiJly52bCu70NCg4VKAKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358919; c=relaxed/simple;
	bh=KKADGg4fhP70Q8Sv9Ts9TzJFOLVMeaGzC3aBONqd458=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Nj47NJAb3wBVEu4Wk7zRDRQHEVwCcm/QraTVIlgnZ59EAFlD5OY+Ut399BK9TJ5PBgMLa4HJqhf6aO0ZwwB7qOleesy7Gx87xKCF5RnLrrPt5FSV10wNhSE+7DQSf8zp4yrtKTvCk1ipcI1pl2+/YWHBSzAI0f466DGWg5GiFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RKvZX0fD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V49mG9002953;
	Thu, 31 Oct 2024 07:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLXiN84XlWpoiOzk9GoclO/n8YC+gWC3SFMTyLbC9BE=; b=RKvZX0fDDvWADTBX
	nZYbcsd2TWBCP8R5IxqyaaR6ZeCEa0TZBgRQw9DrsW21HUJKFnEvHODsxR1k9F2Z
	Hpt0eV2Ii9saV0iAAritHPB4V2pLAWZ6YhntmKG0v9Q687TIw/Som3UK6rUEIHuw
	n1B8RDEbP6nPkQ1tnZYUS/gxxm2F0Wqmi+TkTXIM46UPTct/wH3p4bWaAGxwQbi+
	6lcBjUb6V+/cWqIZAd8Nb/IRGEVaX3o+3M0JXcURDisElKeqzQgez6XnF4l491uo
	DJ/QejEmyNG/KZchCUlQ2k5h+yZJMqdSuiYc0C+5d/T5BWmyEpLW2+nlwVMaeAUt
	N2o9rw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kns3jg5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V7FDMH014210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:13 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 00:15:09 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 31 Oct 2024 15:14:38 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs8300: Add LLCC support for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241031-qcs8300_llcc-v3-3-bb56952cb83b@quicinc.com>
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
In-Reply-To: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>,
        <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730358896; l=1244;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=KKADGg4fhP70Q8Sv9Ts9TzJFOLVMeaGzC3aBONqd458=;
 b=Ouyzq45V+bVjK2ZWupWQqwwqS+CDQt5iC/rTKyEK3RFt4/4KXwryW2oZdmLfPn5Wmd7PiHnao
 C+qSe+fwPB9BmWQoEvBSyJpKP+BsDWrSukTfGT5NKZybBeoemx6QaHo
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4RrFyLbE1eoYJqUOKuMhE7QjfrhbaqkT
X-Proofpoint-ORIG-GUID: 4RrFyLbE1eoYJqUOKuMhE7QjfrhbaqkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=611 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310052

Add Last Level Cache Controller node on the QCS8300 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..811c926c94f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -882,6 +882,21 @@ gem_noc: interconnect@9100000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		llcc: system-cache-controller@9200000 {
+			compatible = "qcom,qcs8300-llcc";
+			reg = <0x0 0x09200000 0x0 0x80000>,
+			      <0x0 0x09300000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x80000>,
+			      <0x0 0x09500000 0x0 0x80000>,
+			      <0x0 0x09a00000 0x0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
 			reg = <0x0 0xb220000 0x0 0x30000>,

-- 
2.25.1


