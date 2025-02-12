Return-Path: <linux-arm-msm+bounces-47706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD0A31FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38631882458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 07:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976BE2046B3;
	Wed, 12 Feb 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FHuxsoN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973F20409F;
	Wed, 12 Feb 2025 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344566; cv=none; b=agL1MrPp46eQn7OVZNNHhvknFGaKSXi44E4am5wpVuNacv/Q19xrbCpz0hu3rF9lakCcBPNoX42yK7+CFmIZ6WdJFb1Oxr5CTDnsqrKKcvHD1Dglr1rurecFUjyHq4HRqb9UnvCBinhZyABcXZhzVhfFtAjz5HtPs8DxKoGGc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344566; c=relaxed/simple;
	bh=i5qxzghiObgnfgP7s3hIV1doM8HkGQ6bZe5wA3GtJy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uG9UZiaTk1fHJZT0vQxTiHjghbSk7Dcs90JcFOlKSasKzzRNghglcPOL50aogSMN89kZe2NxQvjWXGxOCtP1viY8qhg4xKMz9OoTpjuDkHkBwaRjrZz02QKCkYei1IeKKOZtm/Wcs4vIHd/zhunNWC2Tp82Vmh2h4lztDYaxQ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FHuxsoN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BIsUee023550;
	Wed, 12 Feb 2025 07:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtxMYbrmGm3Am6NCss6g/K9ylYMpqOw8phPMywkaQcY=; b=FHuxsoN5PXiUJVnB
	7BURrw7o8mjPEJWRozQEaRdAvnrNt+xB33qE4b1L66Ky0f4jlWCIXEBpk6xeQHSa
	nf4JSadYyMUEWDTazBaTcUmnHwfj43me/cSUtXJ7rGQR5NmnUcrlKEqCOzg5XFFC
	kgL+ASYzrMPA3Zn19fRwZqIY+0+Gv9qTdmBOdVwYKFSMYF6ypp0C3gUN73WHWQVe
	zEEv8wyMz8O9lZJeZmeoljPJCW0AoW3cKVTK9timtfusT2/DoV9KPPobcPCJBehX
	bANlGWJzGw2O9vLiZxgN/yiaAw/lohEMv2fMDohbVj2aWfqzSBkqsxGudhfpkaIh
	TtCdOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r4b5u5tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:15:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7FrJo005638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:15:53 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 23:15:47 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 12 Feb 2025 15:12:25 +0800
Subject: [PATCH 2/4] dt-bindings: display/msm: Add stream 1 pixel clock for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-mst_qcs8300-v1-2-38a8aa08394b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739344532; l=2551;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=i5qxzghiObgnfgP7s3hIV1doM8HkGQ6bZe5wA3GtJy0=;
 b=10GYxHZJILOA27lgroDksU1EHwwit/dbsfKcgOMLTGVMu9VCJWaEId7Lodg2SegpLK7VbIDyt
 xDrtpA3hn9EC5/iVzzgljaA2ARZv+lmbYh2jd/Uu3diGa5WBjFXtscD
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rDW8kieGBc7um8VC6JA7b7bYbMgoFmW4
X-Proofpoint-GUID: rDW8kieGBc7um8VC6JA7b7bYbMgoFmW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120055

Support mst for qcs8300 and add the stream 1 clock support in the mdss
dt-bindings.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index eb7f36387f748793ebf662baded4a13a61b3ce39..610742ceebf8ee5e140a409bfeb92d9f43085214 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -53,7 +53,6 @@ patternProperties:
       compatible:
         items:
           - const: qcom,qcs8300-dp
-          - const: qcom,sm8650-dp
 
 required:
   - compatible
@@ -164,7 +163,7 @@ examples:
         };
 
         displayport-controller@af54000 {
-            compatible = "qcom,qcs8300-dp", "qcom,sm8650-dp";
+            compatible = "qcom,qcs8300-dp";
 
             pinctrl-0 = <&dp_hot_plug_det>;
             pinctrl-names = "default";
@@ -181,15 +180,18 @@ examples:
                      <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
                      <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
                      <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
             assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>, <&mdss_edp_phy 1>;
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
             operating-points-v2 = <&dp_opp_table>;

-- 
2.34.1


