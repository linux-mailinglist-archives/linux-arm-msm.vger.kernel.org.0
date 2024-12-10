Return-Path: <linux-arm-msm+bounces-41249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA79EAB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4830169A4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392F52327B1;
	Tue, 10 Dec 2024 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WJe3n5QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80C23279C;
	Tue, 10 Dec 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821914; cv=none; b=Il43KaVuDMSfE8llMhB5bxCKw1jECAaRgo8MsdG+nCKO1EiI7HK9smjU4hw4yXxD+MCJx3yIh+w5mVSzcSRYRlmX2QGvtSTsydFsPlD6eO+S65BdPXN3dwu3g1PM9URCotFC2h5nv9+UyO7aDnB14XgMyqZZRhNfr9M/0peiKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821914; c=relaxed/simple;
	bh=D8PsF+RtzIfY7cNNm8iF4+5iJbPhNo9HTmueH723E14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qCsPpvzU7VBB3yipQj8cd6OvrxOTl93jV8Yt3xihju7S2ZE1TB1kboots8iF0jfUXQ6LYtA3Qi5vsSiPs0tjAR95xP/XD2bZmYOjtORYCzxxC5+HtCnMhx/6sPomEFTY4gSACXCiZNilHyTyWAQARZ9BLmNVn7eVu87HcoY4BLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WJe3n5QI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA8fXjs014664;
	Tue, 10 Dec 2024 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCysk6a20BpNRzQutQ/mS+KYwubiNDqWonoVAB1MurA=; b=WJe3n5QI20Z0OyBl
	XF5Db4vb8wBeB3sThGcudCdpT1EZIQnfUgpurfXle6as81F7WZY3E8uicfRhOhXe
	Q/n9VtC71FSkBpczwuK1OK3N1yiUvAeWbdt7PWcsiv+7yRW65+mM70qd/yVB8X3C
	x6OEdkxgvcPPewQkuMrKCROMpSoew+2+QyaQc8v4B1PqYo6TOVkYd4SXQTswZLH6
	fppUMgK7iIbLNnnLMa+XdG4SBvVv8HCAn6kRiIgjGZZmeBvCqZAYGLm9pkQzDG5c
	yAF2p4eGgFMdaM3sJQSyqZzL89mHdrRes5x8rUaMR3ce9Ovyv/9KIqWcKIudXuYg
	tz4LHQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dy8tuchd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9Bmbb018610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:48 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 01:11:44 -0800
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Date: Tue, 10 Dec 2024 17:11:06 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: Enable DisplayPort on QCS615 RIDE
 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-add-displayport-support-to-qcs615-devicetree-v1-2-02f84a92c44b@quicinc.com>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
In-Reply-To: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fange Zhang
	<quic_fangez@quicinc.com>,
        Li Liu <quic_lliu6@quicinc.com>,
        Xiangxu Yin
	<quic_xiangxuy@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733821897; l=1374;
 i=quic_xiangxuy@quicinc.com; s=20241125; h=from:subject:message-id;
 bh=D8PsF+RtzIfY7cNNm8iF4+5iJbPhNo9HTmueH723E14=;
 b=OTix6su9avP1KN0gGztiGs4Jqg/vi+9Jb1D3q5XWe4EUOXJ9POzAPoa1S3E/QpB6364aIB0y9
 S+Wv1SZRms4Ac48sk/ilhIQl5htoGV3ymjEih7RWCKItPInJOuhhaov
X-Developer-Key: i=quic_xiangxuy@quicinc.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n_xhcOaEq5a1Is_eKcvoKSI58IH230r4
X-Proofpoint-GUID: n_xhcOaEq5a1Is_eKcvoKSI58IH230r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=779 clxscore=1011 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100068

Enable the DisplayPort node, config related regulator, lane mapping,
hpd-gpios on the Qualcomm QCS615 RIDE platform.

Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 694719a09ac46bfa2fe34f1883c0970b9d0902be..0ac543577ec1850d6e4f19ff1d64252b00fffae3 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -44,6 +44,20 @@ dp_connector_out: endpoint {
 			};
 		};
 	};
+
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "DP2";
+		type = "mini";
+
+		hpd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -291,6 +305,22 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <3 2 0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss_dp_phy {
+	vdda-phy-supply = <&vreg_l11a>;
+	vdda-pll-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


