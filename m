Return-Path: <linux-arm-msm+bounces-47708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97756A31FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B455D3A3364
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 07:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4D1204C22;
	Wed, 12 Feb 2025 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Db8198oC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9144A204C18;
	Wed, 12 Feb 2025 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344579; cv=none; b=Ih8KPfR8FjyjLyTGCRD93cmUfTBZbYgG92E72xMq1xOAQ+WhTZ97+yweMK26CrWxYvTqHrGhrfI9tKR3NxJvE37ED5Myhkkzfdi3Dsk8FFDeDjZUpbRbvnwa5RXRZO3FL/F9zOyrlr7d0lSNHajGLdqaZuua5FUluXn7EOGaO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344579; c=relaxed/simple;
	bh=GNTH8pHgqWxfD+S9tpEYVyPK6aZBiwCm51fjST4Cw8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ezUnOm1Uqdcx3xQrTHykFM2ooLGhc6B6kKrAAiFUYDlz0bp8y18GBL3AsLDxy0QVsIAF1LdE3QQakthgANXRG+dH5qhJIyuOuN69xjD9GFYYCqQhXXKqtHiwJuFVOlmzZyUi9RFP97/EVknfkLnTbad1zYuiYUUhopnSr64niik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Db8198oC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C3IXqn010299;
	Wed, 12 Feb 2025 07:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKdCxBfv2lMbXsVO/dbX5oXVc6EO1oBLGX5fenO7Krg=; b=Db8198oCQRKxWT1P
	KK6GOJ8/JURiBUXOYXngTU9tjqMWZwrjm7wdEeA1sTif74IuXjF1XTE7YCdNU/QT
	u+fzPDUHG7ePatndQEBsAL+xqCz6lsNXQhN2zoig8cAr9LVrzWzzmJ5C+0mkpWB7
	I1W9ynkmUP2yQ2vd+1+qtkyeZFUWHAAby+zQQ5nWj3Q83YzzBiUHX9jah9mmDnLx
	3DOIPkfx8aIEnSi8kdsrxBa/WzRzc3B84joM2LFfETUgUteK/yfLq7R0s8NLG+Y5
	qK9GszeRwnvFLcZ9ZoIGQuffBdKiM1D/DGh2V+qy4dXx2a9JOF30V9DDNchabNWC
	B/iiTA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5ey6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:16:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7G5aS014438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:16:05 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 23:15:59 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 12 Feb 2025 15:12:27 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: qcs8300: Add support for stream 1
 clk for DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739344535; l=1761;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=GNTH8pHgqWxfD+S9tpEYVyPK6aZBiwCm51fjST4Cw8w=;
 b=x5GebqgIdLYwWe5gSZKV3jJv4StgjIDGRq2C3mAYoMWodWBsyFPESzMkOjcCzbsAdk9MZh/tf
 T1Gts7ATDflCRUuHVpYSXRa4D5UvItLPyqManOpiX3RuBXZAiqZ70gd
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HVCbnmQuxLo7clZrm2AdKbIyBHXwk1dp
X-Proofpoint-GUID: HVCbnmQuxLo7clZrm2AdKbIyBHXwk1dp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=742 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120055

Add 2 streams MST support for qcs8300. Compatile with qcs8300 dp
controller driver and populate the stream clock for qcs8300 DP0
controller in MST mode.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index e10db7275accf769500abbebf57a6cbbbc4bf167..5166686981617707ba19245723e9215a53300392 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2865,12 +2865,13 @@ mdss_dp0_phy: phy@aec2a00 {
 		};
 
 		mdss_dp0: displayport-controller@af54000 {
-			compatible = "qcom,qcs8300-dp", "qcom,sm8650-dp";
+			compatible = "qcom,qcs8300-dp";
 
 			reg = <0x0 0x0af54000 0x0 0x200>,
 			      <0x0 0x0af54200 0x0 0x200>,
 			      <0x0 0x0af55000 0x0 0xc00>,
-			      <0x0 0x0af56000 0x0 0x400>;
+			      <0x0 0x0af56000 0x0 0x400>,
+			      <0x0 0x0af57000 0x0 0x400>;
 
 			interrupt-parent = <&mdss>;
 			interrupts = <12>;
@@ -2884,10 +2885,13 @@ mdss_dp0: displayport-controller@af54000 {
 				      "core_aux",
 				      "ctrl_link",
 				      "ctrl_link_iface",
-				      "stream_pixel";
+				      "stream_pixel",
+				      "stream_1_pixel";
 			assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-					  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+					  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+					  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 			assigned-clock-parents = <&mdss_dp0_phy 0>,
+						 <&mdss_dp0_phy 1>,
 						 <&mdss_dp0_phy 1>;
 			phys = <&mdss_dp0_phy>;
 			phy-names = "dp";

-- 
2.34.1


