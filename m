Return-Path: <linux-arm-msm+bounces-65676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E7B0A7B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470E63AED7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CC22DFA26;
	Fri, 18 Jul 2025 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7ScUeNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F322DCF77
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852741; cv=none; b=fHXdSaC34E/sNaNS5JroY3/iD1AjG8Ll2+tux3SH5QW0kpxRWV6NELoGEiPoB97Ao6e31XdQgfluA+/Co7jKHcGqazA4vn8oTXuYSlnvNZNWslMjWdy9nxf3A+lRMpofQ9EQrlWow2ZI7lcHQviVoNSZZBa1yDAbqaLd00kQaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852741; c=relaxed/simple;
	bh=1De67kCy8URfztxKyr/raL7Bg9/P/WLNdrwWTrPtkxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THyMGaZ+V49aq98M/r3qA+KSw/Fpsn0T7esFqck9w2jOMFvzfnnXtaUjBxk+U6ABDqIkAp1wPH2DAsFwJIvLJcI8RZ9V2T9J2rUgMRWnAWNFgDuaJkmVf+AHh2o7aEAS75DFL7bRaaLGri+iV27V3z7zKINySYp5JSk+2UHi4xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7ScUeNy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFUbex028060
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uv7G97OIul7rO6dcvJJAbppowFCFlWCEEc9IoZH0x4Q=; b=e7ScUeNyNFLIkoqW
	B7r9tiYVueJs0ANGPThJROuGmDaWWTK2+ZAvHrdTpU2JeFuPqxgiIprH2IfYN2aY
	qerHtnKhPNMUU9hWVJAaogoeoCgUJJIg9ksWmeOB6kWOpjNgEJdKteCC0uIPUAFs
	KLmskZySVg71NNb3UOxsKw+2Xt4azJXR8tnbJZC3yt6JC437fBDaCYnNLXDPLcJD
	k2aUeFlj2GYlvbSG2RD44KwD9PuiQKKFkuhv1+1ZLyGdQCpyg+xiCScjJr8WL//Q
	CQqAiZTGMZufHkTNSBamdrR/3l1HqEdP/q1bXpQs0qInJBSh/qJQwgYsWeSC5uqY
	DFFbCQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64av5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:32:18 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-73c874ac31dso2150233a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852737; x=1753457537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv7G97OIul7rO6dcvJJAbppowFCFlWCEEc9IoZH0x4Q=;
        b=BIb6B2w7JfEZA2CALkcmyAwoqXGsRSn87+Y7gbeFmyFOmAMG+DMU56MWmMnjjRD9/q
         EAVyNMeCPOQIISElPcLkfjZbvvO4NN+Ymsppi99kZN2/KwlpVJuFyqROzfXSNuHAjNSE
         qsgKxh/sOL+yV6JifN4ApAN7BFo0F2iGLmJPHvFkknRrBV7HoZH/tMTBkwmvgiPJb+SW
         JDOIWOKPlpGyskLvzdR6VuR2Xuo8KDGM/RneKsrKz69+ccFqNUrr2O2jeRvve6a/2rlH
         l70T+9sZMKYxew4SenerRJMIw3rMT3MET5RBGHmuY/VsF8hF9NKlWouQucev33AvB45T
         uuNg==
X-Gm-Message-State: AOJu0YyORkuKShFv365PPzefSJbR1c5XBHziOVBo/gUfmnSWICMoh7gk
	JxDDCLtH3jzTpejIfjlmorOYxKRyX9o9tefy8cvgMH06MWkQSPw5omi5W2AioZSudOA+OzOp+xD
	EA8BBzb/wMgtRWWeFj0PXN4eYrFE4gd4+tJdskzyNRjnbf4FbD9ZETmnKA6GQIgwoaAmH
X-Gm-Gg: ASbGncv4sZLoZYuHpjrUBtjiWRrAbvOXDp4jG07fsSr6tJqIdjln1Xt7NGAPfGlibw5
	EXS9v3/m5OfkgUlsrv3k0FEim5GAh/zaDzuWu/sOTGunG+r9KC/aSuEX5NMrl+SieGI1qwEEqRl
	OAfKSp2S3DXGNti9risK0KZDJTwda/Tx+KPA8E2JoDXbbRT6JC8oDZT2INQW1beMHY5fxMf1vK4
	Qm6IbhhnpVv5w56Ag3wPfWftoplrmdNifHa4Vdv2Cp6/xU1Au+XoNhZScICb19/gm5KsHD7wqDW
	c/zh6Of/hD55n440bzTt8gK3TF8FjScuFbsm8Xakk5xcFD1SOQwUua7x+AR2PZBzeePTUW075Y+
	q/tNBJHBgjiuF0SwbFvR3qH1R4R+CZTByka+BEyRXUyJldrce13rE
X-Received: by 2002:a05:620a:414f:b0:7e2:19bf:4e01 with SMTP id af79cd13be357-7e342b43fb6mr1483107385a.28.1752852342489;
        Fri, 18 Jul 2025 08:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXNJSKWpVZoMoVHi4t6o0RfQNPL9fdUuEDcWxrS63N1vsmlqqt5W3qdsSaF3AqQyjZUNxjyA==
X-Received: by 2002:a05:620a:414f:b0:7e2:19bf:4e01 with SMTP id af79cd13be357-7e342b43fb6mr1483100185a.28.1752852341817;
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d994csm2466821fa.84.2025.07.18.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:25:38 +0300
Subject: [PATCH v2 1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain
 indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fix-rpmhpd-abi-v2-1-0059edb9ddb3@oss.qualcomm.com>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1De67kCy8URfztxKyr/raL7Bg9/P/WLNdrwWTrPtkxg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0ZVetGFGK5Y1o457J3dDlxHjtW83zHj9ax3Qkn3k3KkV
 GztLeM7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCR65vY/xf5Hw0J/inR+q/a
 LH6166ZzOy8HcMglXT7R7pRi+jF+YVP98WeMW2YF63zaUnqcLffkw40MqaFqn+vTpA1y/8m78r+
 ql658URB9X8mJVS/8af0+0Q31rNqKycyS2uIXGHOvm6g1skeFhfv0nI3emfvMbtH/P9c+9fz8Eu
 qncS+Ee8bPuX7tP88JmUZaz8xyO8BdfaCXzzz584W/9nN2bg16ZSGtnXrj6rGm5/qbjU5P2FUS+
 jAh84y7zLxbGUuXvnnH+i/s8flWrZ/GyxP8Xau/sPhEJzHVncr7snj7XdWuaRvNJ/10sGXOrMju
 fLBgjs+O3OxyXcvqqPeia7nf3uqLrs5NFRdmeuKxxzAOAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a6902 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kgFMI072Rb3UDlC8HFgA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pLtVsg6_OymmSRpcEN1Eh7aEqZb_jA-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyMCBTYWx0ZWRfX0OjyBMu8JDCH
 koTcbyVdzK8M67cZYiPpcdLuU7pVP0w6aW5/RwHBQM1gcP+7m1zvsrLERS+WEvJLehC9hAe/MNK
 usPUeVwpOGGC0jIbt/oo7Sj++Kp+2ljVi/vBz5yvDRce7drD6cKn1l7tOA++v8PTIHfFWX/2fw5
 +8KWggw5DmRbyyHbBfNZWp7lZl0i/0Ae6F2OrOrA5fRuGnJlA5mOsDXz6rThEGm1dpAmj/EyKbr
 W9J0ROd3x1poPOcJPOVCdPCUlt6bb2+zEXYgWJYIykcfd1Tj3nGabCjSCm2Mwh4gm7ezxDE5Ymb
 5A1u7SoHrzZRHIvPLzm4bnJRo3Ge0XqHd8AQ6Ksqqivw6MuGILJEfBnB18ply8vh1w9DYU6VYtz
 +9J/nPQY8dHI47Vbpu42jipyxvqmIz7DI0hq+sshtcBMWbCKVfUfHUQ9Meev8HZyhAbjmdYW
X-Proofpoint-ORIG-GUID: pLtVsg6_OymmSRpcEN1Eh7aEqZb_jA-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=867 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180120

On SA8775P power domains device doesn't use unufied (RPMHPD_foo) ABI,
but it uses SoC-specific indices (SA8775P_foo). Consequently, all DSP on
that platform are referencing random PDs instead of the expected ones.

Correct indices used for that platform.

Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..214e2c0e74ef53e8bc57acb8ee88901ef1006298 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
-#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -6055,8 +6054,8 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&gpdsp_anoc MASTER_DSP0 0
@@ -6098,8 +6097,8 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&gpdsp_anoc MASTER_DSP1 0
@@ -6239,9 +6238,9 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>,
-					<&rpmhpd RPMHPD_NSP0>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP0>;
 			power-domain-names = "cx", "mxc", "nsp";
 
 			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
@@ -6371,9 +6370,9 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>,
-					<&rpmhpd RPMHPD_NSP1>;
+			power-domains = <&rpmhpd SA8775P_CX>,
+					<&rpmhpd SA8775P_MXC>,
+					<&rpmhpd SA8775P_NSP1>;
 			power-domain-names = "cx", "mxc", "nsp";
 
 			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
@@ -6527,8 +6526,8 @@ remoteproc_adsp: remoteproc@30000000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd RPMHPD_LCX>,
-					<&rpmhpd RPMHPD_LMX>;
+			power-domains = <&rpmhpd SA8775P_LCX>,
+					<&rpmhpd SA8775P_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.39.5


