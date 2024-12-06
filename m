Return-Path: <linux-arm-msm+bounces-40697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEFE9E663B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE83163C67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AA9202C28;
	Fri,  6 Dec 2024 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A4HVd2u8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE29200BA4;
	Fri,  6 Dec 2024 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459608; cv=none; b=oRPoF2vdn/x0CpdJ5ZALcy8HI6qfJPvervD0bQOLkE1Jg+ihuSqG6tOMXuisto94S6KCvZa1cFpkgPqg71pAiEsl+VnAkE6l6O8kJ5tV/c4KMs6gUJOAznaMUIl72k9G/C/+GIHWPrf7ZM1ckSnQLTNjqrCPLN4FTpJ3bJn0LTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459608; c=relaxed/simple;
	bh=eh02OmOf1hr6hb8JXrs8CQPXgD8N7IqUj/J/8cgH8e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S/X4GFrQjjHBao1cTQp6yYG/hsX4dmKVKwKyDwbckBKNgTMJPOf7NM2sQ2y2Iqo5+lcw4vEeBuMWzchhAngSvy/OlY7iF67jYGYYUER0ev/RdCMLPhnDxvKnlMpjHbfJjQNBVMQ6ehkGDCQSH7b2exwFaWQYd7jb2lm9pwCEBbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A4HVd2u8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNZV031107;
	Fri, 6 Dec 2024 04:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oq2Q7JPgk/3swJNYq3dYXaoVc3je+DazXfRjaLQAH8=; b=A4HVd2u8htKNlum3
	K0CKH3C5CRBe+QmONtEo6+VTEeNZ7sJzbgH0JdgiTHU3uldsMYmgmbmNUc5Clflk
	EKvD36jkUDSU2vCobe+Mez1EWtpb4kXAPHguvXQTHzmAKO2gf6+l3T4xzw5h+/hv
	JdXp9IuENy0YkOS1dQo1risEzAlFZ4tVgFoKlTnmKNIuiXrrXzpobeRJeSMkuybS
	O8VCmFAiD+F44c3X965XydqnbioaUEV6uaFjx5DM35cgpXhWVOKgq9fDWkuWEcCc
	DiB38kVzEEUtmNE6DZeZ/xwCPO5mogNwt1uhPFDyUeL/+JC65uSzbX7pvn8P+HSQ
	PexO7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171vmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WneH017302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:49 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:49 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:15 -0800
Subject: [PATCH 44/45] arm64: dts: qcom: add mst support for pixel stream
 clk for DP0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-44-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=1726;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=un4hA9ddN0lRnZFIY2HnxtENaoFat7W87QwL8lcEOQ8=;
 b=QPmvyp/XqLohhcgzKVLPSHjlJ6E8fvh5zu+HjvtvJBzaKLvWpXvbfCgq/BlQWVaLg0cKopi7z
 A6OL9ioks/vAP5u2Hn18Sv3E026aBWiqyoc/Od7t3q5vgylUOcuIA6Z
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ArVTcdMw8R4-Ihq4rmiDnIBXKj2jsF2j
X-Proofpoint-ORIG-GUID: ArVTcdMw8R4-Ihq4rmiDnIBXKj2jsF2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=811 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

From: Yongxing Mou <quic_yongmou@quicinc.com>

Populate the pixel clock for stream 1 for DP0 for sa8775p DP controller.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 0dbaa17e5e3f06c61b2aa777e45b73a48e50e66b..0150ce27b98e9894fa9ee6cccd020528d716f543 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3944,16 +3944,20 @@ mdss0_dp0: displayport-controller@af54000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>, <&mdss0_dp0_phy 1>;
 				phys = <&mdss0_dp0_phy>;
+
 				phy-names = "dp";
 
 				operating-points-v2 = <&dp_opp_table>;

-- 
2.34.1


