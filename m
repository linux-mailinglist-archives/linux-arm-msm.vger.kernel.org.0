Return-Path: <linux-arm-msm+bounces-66518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EBB10A0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 605C24E48FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B46D2D2393;
	Thu, 24 Jul 2025 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWm3Wxez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D72D1932
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359834; cv=none; b=RyNgFO63RXath4TQJJAe066RGfSs00tgx4AcTcnG0yBXz0HcJuuOtjnahZaj+7hxvA3XHhR5fOTnFH/hu2XsT3wsqWBSmn7wDXiB4tweycaGcz2BiURJTsyMjFdgfS6HBi8w8mGZfcdZabGUo430HfI0+fohDChsegdzih0w1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359834; c=relaxed/simple;
	bh=t1fsoomQTdKHmSYf4YNAzfz/bTh0dXQlnOCdV3nTZWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhSPzZmdHvBM/z83Sbt746IRctUOqE/U1osQuMz3+5twu4NN01KW9fW8xcUOtyM82yGypp/vp9g3Hm9rfZsN3gprlsu2b0z1K7f3BW8XwMdmmGSzMOqrMbbHjKoz4ENkEAEiUMysmv4RGYsPVjunhIZQ7OBedqnqgw4F5TZcYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWm3Wxez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9w8Uo014995
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mrBehtJzY/E8cbjcCxObAePzEBB0bFtum/6QBLPRm1Q=; b=SWm3WxeztrB6nlHE
	UG9jowCJc1VqhG6aGoYcxlgib2v3V6v/OTaftCMoH4RJCw/5ZxzteeHerhOJVrZt
	Gb8PCKSrggYl8XNa/uaaBl86DN18bAWEr80Uz7sUgXibbbPfsd7YdcDyauFSJnrm
	wLwK6Opx1jWSSpIPC+kAaTy7jjHevcI8GC9mRDmMsXx/LmxqcmSfbltPKCWSzJC6
	SnXGkX7/l7CLZznaDi07Sj2vFEGkJfGmBrEYJAv0PQgCUxwHx0jav2Z/nUPGULRM
	QMqkblYqtzIoHeKYAloZ7b20/h/A8WD0HqujBS/ckHD4k/87XLE6I9QB5/PeApbp
	PgZU6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379tu03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:23:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2e237fb4eso166136185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359829; x=1753964629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrBehtJzY/E8cbjcCxObAePzEBB0bFtum/6QBLPRm1Q=;
        b=cncJVWpTFDamhVnIKCJz29A29ZDko3nJUmG9PtPKbXg2kX76TenRkl83z0N9/JV3El
         YxKqLVDB5C3GF28nIXOwn6j0xCsPK3kuwRD3ejx/T4WRaIVDKW+/C4t830GVAEOMgzWe
         u4K2h345J1LHaHuQx+gfHsidL+halVKn1qHMxUPYJpLMpFh0za2fGzHXwec50CIebqkG
         lWNYzexD9GMiD6U7PlQdJ4x37OliTOB2Ht9flqjExiX/KqcMRyemG5Zq7FR6pEafNo0D
         tkt7A11Du12KvW+R1QYZFK6vdSRH7m5tOkepnn0vUpvI5pV/Sa1zbNb7B3ht9V5rfIQa
         5hJw==
X-Gm-Message-State: AOJu0Yw5YPz+naak01+JcOc2ivpf90LMC/SGzKDQc8kMPICSP+KolbLY
	+M2Ftz3WW4bH0OUvoihRxkOgFC5Il5Oyqiy88sCO+VkZijchUg4JT8LgebdbKLolO/c7ciABVCy
	32RVOMTcmikH6vKWCtxnscF9hSmQC0uSlsJQW4K7mK5VvtRn/2xWMxUV3MYkV+NWYSes7
X-Gm-Gg: ASbGncsKkQeRmVqCWucHy3pHzcClFEstDWLobL/FBSaR/vTIujO3TWqJ9ySlO9J0sMU
	G2c8q6cTUphX6jM+uUu5U92wEzyCse8kUgT9K0y/JavaFbx29NUhkyPUAeo+zVY44bOc1Gu4tBt
	B3N4oAgNgo2csRd91ycd+mgTjaYzUq+L+SXFaUHkbLl/sl5uJi1nGZ1LBiE6/gu2C0rd+5o/7mg
	NsLLsa2vthV6/tL4XYUhN7Hppk/9yWNS1LLC+t1cOPTRdCwWmcSu605hEy3qk8ewIxqlPh97yyJ
	YjFEZRJb2ikHdfeNf4U2ug2luGQGdm+0QKGp034JSV4/zLQbpobSc14MxhnHM2xGUzX289o0+eI
	SrOt4NLY0wg57DLS9l9hjH2j/BjFYGkkTf2ICKmRiYR71K7gTnyzY
X-Received: by 2002:a05:620a:148a:b0:7e6:218e:ff2 with SMTP id af79cd13be357-7e62a1789femr609657185a.20.1753359829109;
        Thu, 24 Jul 2025 05:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsm5NDVfEGrqe2Xi+OqgOl+HBQ8Msm5qkz+/ct4ELlxn4Qw8w8TGfBwCuhKyruOT7ptUncZA==
X-Received: by 2002:a05:620a:148a:b0:7e6:218e:ff2 with SMTP id af79cd13be357-7e62a1789femr609652285a.20.1753359828439;
        Thu, 24 Jul 2025 05:23:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c83978sm327389e87.126.2025.07.24.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 05:23:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:23:40 +0300
Subject: [PATCH 2/5] arm64: dts: qcom: sc8280xp: add empty mdss*_dp*_out
 endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-move-edp-endpoints-v1-2-6ca569812838@oss.qualcomm.com>
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
In-Reply-To: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t1fsoomQTdKHmSYf4YNAzfz/bTh0dXQlnOCdV3nTZWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogiXPmL3Pgb3kEr/G9OsjUqO+tljyHFzYLCTbG
 2dc59s5LUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIIlzwAKCRCLPIo+Aiko
 1XgLB/9c07xGFrTH9NEkheQDPq08FKWHRYacEDD6QGUhkej42MgsJSX/AfIcWT2xsrxCFdC4Uv6
 7v2AZvYe5P3x8aKUaumyA9TG8g9lNCcSuUALoebGRykM9GcRrTgyNcTkn04p1txhyMjwLaW3ymL
 Obu0oyy7aQyee8rYtm/AqRgUy7S331j8ZdUevBdhR/IbIOFrmySinnkECSI+IMVg7gJLLZrHjuI
 EZ4MejTE6FSXMSvDzwQDj7FwfNLco3EFeo6UinIt8510oFitom2kfz171CAKUZgJi+5OceyOa95
 EW6P72rxt1aVZcvjO81IfP9eptV2pNOOQIQ37q/htds6XVpe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FhBwSPIASY0UDsTl87TThkU7WI__tAYr
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688225d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Jj94Sfu2rptiHS_jDOAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MyBTYWx0ZWRfX2/5bMFyeu0yK
 ZYzsMxKLkoQsl0IQNsrCkq+R/yak+C6sO7nlRinLsrM0bG28YEJtbHJg+icsSUbks5dNwteIfMf
 qzleeUChF3yFiKoZJyODPWAU87wJGrXRiRwJRIr+Fw3Tr9FaXVgR5T2Sb2Z2sve9xptzioa4fH4
 zFWuxobpn9ex2/69sTXxgEeob7/qHZamROYwIee60s+8LxJIYqsTzt6y21AVCRuFMvLhiG698t1
 QrWU/7ar596hhkjiGSEQ5EHYWC0dLn1AOX2RZszC3CPpQ2Bk+Dy69EygQSgc76ZkTxGBG0AMMx0
 MbswZ5rDkazde7lwMBih+2+F1eL3SsE8wEqnlo6SG7Pjj8JMnsnNg7fWWJ/F8RpYw5zlxY87plQ
 UDps+G2bYpiEAaCRNp3mxTpXPqAQWm5QP+jOPNjpB6EzEB2WGItPY2h2F13b36Z94t2ZwKvj
X-Proofpoint-ORIG-GUID: FhBwSPIASY0UDsTl87TThkU7WI__tAYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240093

Follow the example of other DP controllers and also eDP controller on
SC7280 and move all mdss[01]_dp[0123]_out endpoints declaration to the
SoC DTSI. This slightly reduces the boilerplate in the platform DT files
and also reduces the difference between DP and eDP controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           | 78 +++++++---------------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 11 +--
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 11 +--
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 13 ++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 18 +++++
 5 files changed, 52 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 2fd1dafe63ce7a4f409d19946b9f10ffe324fba3..d5015ec4b23d00b5a51c81c99ea46f7c57c3fd13 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -35,7 +35,7 @@ dp2-connector {
 
 		port {
 			dp2_connector_in: endpoint {
-				remote-endpoint = <&mdss1_dp0_phy_out>;
+				remote-endpoint = <&mdss1_dp0_out>;
 			};
 		};
 	};
@@ -49,7 +49,7 @@ dp3-connector {
 
 		port {
 			dp3_connector_in: endpoint {
-				remote-endpoint = <&mdss1_dp1_phy_out>;
+				remote-endpoint = <&mdss1_dp1_out>;
 			};
 		};
 	};
@@ -63,7 +63,7 @@ edp0-connector {
 
 		port {
 			edp0_connector_in: endpoint {
-				remote-endpoint = <&mdss0_dp2_phy_out>;
+				remote-endpoint = <&mdss0_dp2_out>;
 			};
 		};
 	};
@@ -77,7 +77,7 @@ edp1-connector {
 
 		port {
 			edp1_connector_in: endpoint {
-				remote-endpoint = <&mdss0_dp3_phy_out>;
+				remote-endpoint = <&mdss0_dp3_out>;
 			};
 		};
 	};
@@ -91,7 +91,7 @@ edp2-connector {
 
 		port {
 			edp2_connector_in: endpoint {
-				remote-endpoint = <&mdss1_dp2_phy_out>;
+				remote-endpoint = <&mdss1_dp2_out>;
 			};
 		};
 	};
@@ -105,7 +105,7 @@ edp3-connector {
 
 		port {
 			edp3_connector_in: endpoint {
-				remote-endpoint = <&mdss1_dp3_phy_out>;
+				remote-endpoint = <&mdss1_dp3_out>;
 			};
 		};
 	};
@@ -364,15 +364,10 @@ &mdss0_dp2 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss0_dp2_phy_out: endpoint {
-				remote-endpoint = <&edp0_connector_in>;
-			};
-		};
-	};
+&mdss0_dp2_out {
+	remote-endpoint = <&edp0_connector_in>;
 };
 
 &mdss0_dp2_phy {
@@ -386,15 +381,10 @@ &mdss0_dp3 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss0_dp3_phy_out: endpoint {
-				remote-endpoint = <&edp1_connector_in>;
-			};
-		};
-	};
+&mdss0_dp3_out {
+	remote-endpoint = <&edp1_connector_in>;
 };
 
 &mdss0_dp3_phy {
@@ -412,15 +402,10 @@ &mdss1_dp0 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss1_dp0_phy_out: endpoint {
-				remote-endpoint = <&dp2_connector_in>;
-			};
-		};
-	};
+&mdss1_dp0_out {
+	remote-endpoint = <&dp2_connector_in>;
 };
 
 &mdss1_dp0_phy {
@@ -434,15 +419,10 @@ &mdss1_dp1 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss1_dp1_phy_out: endpoint {
-				remote-endpoint = <&dp3_connector_in>;
-			};
-		};
-	};
+&mdss1_dp1_out {
+	remote-endpoint = <&dp3_connector_in>;
 };
 
 &mdss1_dp1_phy {
@@ -456,15 +436,10 @@ &mdss1_dp2 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss1_dp2_phy_out: endpoint {
-				remote-endpoint = <&edp2_connector_in>;
-			};
-		};
-	};
+&mdss1_dp2_out {
+	remote-endpoint = <&edp2_connector_in>;
 };
 
 &mdss1_dp2_phy {
@@ -478,15 +453,10 @@ &mdss1_dp3 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss1_dp3_phy_out: endpoint {
-				remote-endpoint = <&edp3_connector_in>;
-			};
-		};
-	};
+&mdss1_dp3_out {
+	remote-endpoint = <&edp3_connector_in>;
 };
 
 &mdss1_dp3_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 8e2c02497c05c10a3a5a43a6002467736a3b7f95..bcbd668f562fdfd3558e7138e98ba21987603162 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -548,15 +548,10 @@ edp_panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss0_dp3_out: endpoint {
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
+&mdss0_dp3_out {
+	remote-endpoint = <&edp_panel_in>;
 };
 
 &mdss0_dp3_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index cefecb7a23cf579b1f62ef6fccf9a27a6ea92ac4..0b479e98ba387de8e9d5b2bbaf43e2ed083fb94f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -761,15 +761,10 @@ edp_panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss0_dp3_out: endpoint {
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
+&mdss0_dp3_out {
+	remote-endpoint = <&edp_panel_in>;
 };
 
 &mdss0_dp3_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 812251324002b50f3b48845b6c244f692d42b9b2..29efbef5ef69263e9a59a43e27d158ae8e793ab8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -63,7 +63,7 @@ dp3_connector: connector {
 
 		port {
 			dp1_connector_in: endpoint {
-				remote-endpoint = <&mdss0_dp2_phy_out>;
+				remote-endpoint = <&mdss0_dp2_out>;
 			};
 		};
 	};
@@ -602,15 +602,10 @@ &mdss0_dp2 {
 	data-lanes = <0 1 2 3>;
 
 	status = "okay";
+};
 
-	ports {
-		port@1 {
-			reg = <1>;
-			mdss0_dp2_phy_out: endpoint {
-				remote-endpoint = <&dp1_connector_in>;
-			};
-		};
-	};
+&mdss0_dp2_out {
+	remote-endpoint = <&dp1_connector_in>;
 };
 
 &mdss0_dp2_phy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 87555a119d947dca75415675807f7965b2f203ac..421693208af0d5baeaa14ba2bbf29cbbc677e732 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4526,6 +4526,9 @@ mdss0_dp2_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss0_dp2_out: endpoint {
+						};
 					};
 				};
 
@@ -4598,6 +4601,9 @@ mdss0_dp3_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss0_dp3_out: endpoint {
+						};
 					};
 				};
 
@@ -5701,6 +5707,9 @@ mdss1_dp0_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss1_dp0_out: endpoint {
+						};
 					};
 				};
 
@@ -5773,6 +5782,9 @@ mdss1_dp1_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss1_dp1_out: endpoint {
+						};
 					};
 				};
 
@@ -5845,6 +5857,9 @@ mdss1_dp2_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss1_dp2_out: endpoint {
+						};
 					};
 				};
 
@@ -5917,6 +5932,9 @@ mdss1_dp3_in: endpoint {
 
 					port@1 {
 						reg = <1>;
+
+						mdss1_dp3_out: endpoint {
+						};
 					};
 				};
 

-- 
2.39.5


