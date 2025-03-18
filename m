Return-Path: <linux-arm-msm+bounces-51733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5AA674EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC4D67AB821
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B44B20F072;
	Tue, 18 Mar 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljnAu7tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBE20DD51
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304161; cv=none; b=ZbqnaglfIPCcoJtco/4+XpTnvc4RJlSCPh8BsHOPl+IiHigD12fyIINEz1GaDZJRmbZHN3Hm/wwpsLSAES3HxzV2oRm9GDfVUoJP7MW3bepApBOgZiRv8CG9ieCaQMfR9/wdkPFNrGt8EhuYq+Qbhy0bPW6G5k3lwR2jY7s29Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304161; c=relaxed/simple;
	bh=YYmo07roKcW7ib7dlxEqOnCz38XSWKk8QyvkfSaIp/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieS8dhyc7Hc8EnY2KM/zfC1XnFvtuZ6kl9cnV79EjR4FUaeByBzo7yO6QmqRKFGEVgumqSOX1isWFnqL74YQR4uC8q/9q6Apei3NAaZInQUclb1NomrCHte0p9ZafjLpIqc5Xycj/02JNIF5hweerW6jnc98GBAzRIg4olJhiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljnAu7tx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8YqLA004568
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rV1IlqnHQ/o0RgJA1eBMQdA9vXcN4qMsDFTtrI79Z6Y=; b=ljnAu7txJ66WqqTM
	V0qJfcvAC9VpkTlWfI8L5i02WfpMIBN8s7eBwzNHS/Kmj7nKO5XfdQCseY6+C75Q
	oICWB3uuFf/ufluwrbzF40xFhilu2pCi9X+xo/Xi+4IgnLsxBuWJUcZbWKkfoupZ
	y22q4gMCRgOztpmOgUKlN20cV6/HSFcjMCJiofKCOtoS4nHX0kNXAqN0vqu0XzpP
	/TMmmkzA5SmSUR/UacTi2qWfRZ4ATT7nD7CUnPylQ273KZweVi/j02MJui8wc3nj
	pxtK7WaQrGe6/PvOXC3MNQQZzn+VKY0jZv8pR2XCXh/+ZUWYt5mKJo7NeTcVHqgC
	ExabAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbtjku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ea277063so143043626d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304144; x=1742908944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV1IlqnHQ/o0RgJA1eBMQdA9vXcN4qMsDFTtrI79Z6Y=;
        b=hY+kyaqh96VlGfIqQy0w0vokjFXBOgdwVb1lG1+Y22xvrLPj7HhYE5TSAQzeWye9TY
         WWMwhyTchj0NZldq8z7A1TDoKS7Mzmm70WJ4oiCIuMNlXoRZ49/Ui5B+3O/OLrbEfyiJ
         m3/njbd6i4lCUYkW/HtXxWPhYaYOeoKCb7Je2vcp3bVr8UxM1OtLQs+pn5nsRFMCx3fY
         aS0z3yFXBXBXxu3wPeenM2pgnzbJ0SpJhXUi6wwCPExbhJZwzeAEcSE07AAzLLmTzCcV
         F6sre9ql5xkYtyXHGFo17n6LY81RtuA64rfw0bi0muvVbZY6yUcl86pnBv2GzH48W/pb
         s2Cg==
X-Gm-Message-State: AOJu0YyqB/Z/h9Saj6Z1dpeEpp51B2ZDxsysI8FSlFPi9zlrvbvCU6HR
	lQj3cawZJ0BLr11m4IWFjq9KrN/sAzUFCMpZIGuKcWvKMVQ+nqRytxBWNb/7cfyZ09m+55DLBBL
	Njm5mZkxMMC/CwS6MYp5C/DZlzizT32Py2ohpUX5k2FH9qBDHG4p9FIteQwC6wb64
X-Gm-Gg: ASbGncuS1wGMO54YaT0vbX+JdU3QphN4Q1YniVnHMJPuLnlgzgAgHg6I3Xu377wOm9O
	mE0BIuHonChwN+pUMM/STYfXTr3ow8694CwMb8kCtBGF/upCm6vCBcNbHAlvWTRm0TlzybvaBSE
	e9GHDlLfVR2Dp+6xYbcXkTTnPjb462VKNKJz2nH3hnFpa1D/G/WpoweHIw8A4z6zQ5E7+HKy1TF
	JXwmemxYLxw0V+Ht74UDxo13gs95qp83HD8+J4YRKQKRGlwoFM7H7K+qwZNXfKMnzF9JmSoiMlV
	GOQITZw0V7yehYlawDnQeTXaa0UNFxPK0nKYWGDwRiNYHWrb01MuQcrSB5Ud8Zi0eBf+fGLhqel
	1FvmDVHCVufjeJtWji2iOhaviOu5q
X-Received: by 2002:a05:6214:f28:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6eb1b923b9bmr61022486d6.36.1742304143807;
        Tue, 18 Mar 2025 06:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT29uNdkPTC8hLiSVJtVNM0J6OKkSWUgcwgv9PhSfYfcfwdVm+rFQt8CN7Y3i8guabZwOiLw==
X-Received: by 2002:a05:6214:f28:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6eb1b923b9bmr61022136d6.36.1742304143454;
        Tue, 18 Mar 2025 06:22:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:03 +0200
Subject: [PATCH v2 10/10] ARM: dts: qcom: apq8064: move replicator out of
 soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YYmo07roKcW7ib7dlxEqOnCz38XSWKk8QyvkfSaIp/I=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rN4rJlBtasApm/mjKF2LnuXGs4qqIg9kD3B++9H/NTh
 TI7ztl2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi13XY/0dW7P1w8e7+Ovf/
 ek8PxHXZybRLznNQdPzAsKfs4O6o/dJC2q1KC7j2sjc+eVTZs2Se+R6tt9nT3JIDTgQwB3cWO4g
 HngxSOO73x4xlQtnq+qmzU0RZjPZvlLm1YwtLmxfrm9nVzNrlEryTFblrP5XyV0yJ6RCbb8ZWPV
 E42dX+xT7eM8nhMfbyL7m2Gt7MKJ2t+yGCR1bR8RTrb643Xea5Zwt2bg90VRTaERjpK+3dN3NuX
 NiNL/frDnlrtJgf+uX78n4E3znpEP+lslGzFh65wSq489v8+Nbs7IBkxmsdKzIN/DYfK1yzaJ6E
 3xK99EtqpyewbE626Nhy4ppY8bX/uxc4iK+Zs2H/jFuhAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Atyq-c6pP-FvZxOkq3aaL4YDP1GvRrU9
X-Proofpoint-GUID: Atyq-c6pP-FvZxOkq3aaL4YDP1GvRrU9
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9739e cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=LFh-nz-jDHZ_m6HcgWkA:9 a=QEXdDO2ut3YA:10 a=B72P2sQ2WZ64KWKWCyzG:22
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=915 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180100

The CoreSight static replicator device isn't a part of the system MMIO
bus, as such it should not be a part of the soc node. Follow the example
of other platforms and move it out of the soc bus to the top-level (and
reoder ports to follow alphabetic order).

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 67 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b6533630e347c8fc5e3f0791778cd05760b3f3c8..b02e6739ccb20a287095d8c3e212040e4ac50fdd 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,40 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1563,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5


