Return-Path: <linux-arm-msm+bounces-12106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB985ECCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14743B25595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C2E12E1C6;
	Wed, 21 Feb 2024 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MdSJs/NU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB43128386;
	Wed, 21 Feb 2024 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708557570; cv=none; b=lRBGLAdKDhcJ0LYLrcA/+5Se/78LD2XHB1te4RgZ312uy0WizxZ8z+6UD8eNp5FT4PW91Yf3Q5eFxwWa3ny6ViZIT38BRihKO6SeqCFLfYHOoA6cJC37UEg73s8SgrQnIKu+hjbWT5XuHATOjh7b84pGOYzpZv/lqsUJQjueEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708557570; c=relaxed/simple;
	bh=VL34t8qklVew/hOjrCZqCUsAirrBBOvh5uaAOY6ZK6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dtZimWat6x8wP003Y2NOYh1a2dw02BPKKv7LxK8qvdac7vNuAIXBYXXvAfPZM5SEb1WBv/3m7Jbj9YSMraWnQAA/JjrCVzZvJoZ9TYMTetYzxdH7CYPxNW1KDS2lQRJxvDHkAA665inln1pgQLMfdx0x0f3+LF3XTQCGpAddsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MdSJs/NU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LN2mNL026263;
	Wed, 21 Feb 2024 23:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=qAXUNrbphgVX1nX2HaaiJEh0N9ojsbXCmsSio4EY+Tk
	=; b=MdSJs/NUUA+1/CbDXtWmLr9Mdl8LQBNTc49Yv79SMtP6og5AkQ4kd8Z+iw3
	5sfgLjsNZ00bIWIISgETYaaAcCmF7ArDJsrYIb3xsqRsw0Ity5zunqBskItEMado
	/rkGfr7retcsUL0mGWgciQtLSd99Qm+7L1d1OhlojJjRKdToiQ2/BvmbwQ7TDiQi
	VZMdcAA6KEHtHyCKzA/0tycbMq9ac6/QgPeZG/HJr2PHAAIVbsiSi//ubkcMs3e6
	qM6T48RIbT89Fd2H4PfoKKPIevq0MzpQqrpiqCEls3N0OQjXxDBZr7Zi5YJOzVcQ
	4hkXmUycuC9YyT9B0AJnPNQAdxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdfm79p72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 23:19:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LNJEKQ028446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 23:19:14 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:19:14 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Wed, 21 Feb 2024 15:19:10 -0800
Subject: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708557553; l=1486;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=VL34t8qklVew/hOjrCZqCUsAirrBBOvh5uaAOY6ZK6I=;
 b=EZuf+5W5l8rsevilqPZ95PsdtIZFPpyjxdrGWkEgYcpSz86nb1pBMKe370GsyR39ivrFhTNIx
 Ekzkv+dI0H9C3nRbEZNmyuxGQalOdGttehOFB7HdKgAf1UySAjMePwn
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kX9RRRCDA9cWt8K5Zgapvmg2BzEA_Dxz
X-Proofpoint-ORIG-GUID: kX9RRRCDA9cWt8K5Zgapvmg2BzEA_Dxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_09,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=820 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210184

The newly introduced mechanism for selecting eDP mode allow us to make a
DisplayPort controller operate in eDP mode, but not the other way
around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
would not allow us to select DisplayPort-mode.

Switch the compatible of the mdss_edp instance and make it eDP for the
SC7280 qcard.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index f9b96bd2477e..e339b181a9ac 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -348,6 +348,8 @@ &lpass_va_macro {
 
 /* NOTE: Not all Qcards have eDP connector stuffed */
 &mdss_edp {
+	is-edp;
+
 	aux-bus {
 		edp_panel: panel {
 			compatible = "edp-panel";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 581818676a4c..a19c278ebec9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4513,7 +4513,7 @@ mdss_dsi_phy: phy@ae94400 {
 			};
 
 			mdss_edp: edp@aea0000 {
-				compatible = "qcom,sc7280-edp";
+				compatible = "qcom,sc7280-dp";
 				pinctrl-names = "default";
 				pinctrl-0 = <&edp_hot_plug_det>;
 

-- 
2.25.1


