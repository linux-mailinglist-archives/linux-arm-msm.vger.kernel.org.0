Return-Path: <linux-arm-msm+bounces-55709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E234A9CFFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C33FA00FB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AED221550;
	Fri, 25 Apr 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H50Jsck4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBC214A60
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603251; cv=none; b=jpqcl2O94uXCo/TXz9vuf0zcCSUkrE74CUZZosof2f43aabF+NDqL45MsnHvHUyAr9+N6o0u1wS5FwIHXjAktcYPKqRs6oFDPo53BmP+aoVxOT7DjjMTVofEurrjDhoQRMt3ZQtL5+Ug/p6JUj7BBB64P9VWtjGomlwpqMBQDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603251; c=relaxed/simple;
	bh=jeIMQed+uhzxiHzwczupq3qDXNwJFo7QnV0YFmtUdKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNUiJOOj8AYneUBLsvCOFdBzLqeDslM1IjoBwEc26kQujm3N/VHldmtfqYSOhSLGgSIMFkFpifOHdTd45XhNu+bvfpQ/2XwnbbHA8eXUlnWdcN/lq6mOjX1HGNToIecaFwCvd3J++x+dP5YcHSFLShSUWLtvCYkS/8QQx+oXVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H50Jsck4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJutE024751
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=; b=H50Jsck46/XBOyyH
	2uTn9Sg1nnIR+OX36sQ1VNWz76D/kIRmXa1660ZyZN7YM6RNhh9aoqIC1w7Sd+D8
	vKBwQYRLqz6ESuP7mCxzAfUWvqAC4ZIGd1y5bBQMGS4LMIgJtG4oM8SC7zkQTzQ5
	vg7BA9XspWQJiRosugXxYOycvh0eRGWlqSE3FIdF8OKTR7Y//saWMUTmuZuvmFOt
	9DoHs6BGLu3qFLxZ8HS55CMHqA2iZQVhexgoLdKCAAh52b4BlitdPWkFtXSGmP5G
	AH9IvJgWlxOZOcpJ0zsGhTmo6PmqTRHLZcTiFfpojTj1IcVGwCv9vkTgFalMlwJG
	L7ad5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0srf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so711394985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603248; x=1746208048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=;
        b=IwD+IGZ6AgALdyXEmD7sVksHG7BkyfMoXVIHwcAmsPX1ZE96ADUQvf5Gv0dqNds7c/
         P7CYXaVtFfP8dP1/w3oIEW03PxUg3lVI5vyBm8m8RtGEtGmPdOv2gRfMOyF6SlrobrBA
         3qPNWwAVRXLct2rChnsbbMxu1kiEzmkcytSPxd+ShA5EoVRh/Pxs0vQ9lPjgEX3Kc+/z
         te5HdcbqRMOHR2NC8T8jP2GJbXIyY9b+BJkwiCAD2KiJlj/JaXlvHztiEzYK3ROtv2ow
         e2VEphYA6+Y0t8fa2DtABVptRdLZUVAcv9BgMNkA2noZnoozqNjgmtR4F7AoVYFziG9g
         bINg==
X-Gm-Message-State: AOJu0YyVBDVZ42BHUbd3KZSml8MN8Tq1z9I0xcL/PoISzTexIm+cbBOt
	y5D4PbN4yD8RJV+oYAFPqRRl8JF9SK4FZMjIJUZXpZLhVYpQg12M3GDwWokLmJ+j1Ttp7t+wzp6
	To9dZACw/lP7BgPdBLDSbHNlvRlxwgfSiQpdiMSfa4Q5cW7fMw88kHa0gBnD628Jt
X-Gm-Gg: ASbGncvwOe/5d+TgZkRfwqIWEphsPjEYlmiRUkjYUID3Tuc0fEGZ18xBMrA4CryldFB
	0Z7OBmzA5qKvDf0uSJioYrmFyYfDphv/8QFKqEH0oOBqBWQGnMd4Wbu2z7PmXPsf3mlHdbRJJqs
	ZdZpDzf/1l+kHhsag9X2nLeQp+RgaPRJdyIC7F6IsLLR7UwsatNyUeZunK/ysyAdPkjQ680huOr
	YGYTiqhdaaiRf09F4GyvbK9R61veNTNOKtjt/Z1mF3w0OXPcypGbZmj7JEdG/V00N6vPafmoaCD
	DlrWMO1P6jBD5E0sy7kIyVk5g0u3wzmtowHsOMLCYVLQmC+OzeLzwZyioyeIeO3FRnTi2IHwT10
	8njqzzj1HxReEVDObdQuG/trx
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74049285a.38.1745603247881;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3trC1FSJEN/SFa9CDGpvg4Ez7sMdjuNRyKbDHpwzGHtEBvX6Pm+yI5Y6p6KdyeAWMtca/tw==
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74045685a.38.1745603247520;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:11 +0300
Subject: [PATCH v3 11/11] ARM: dts: qcom: apq8064: move replicator out of
 soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-11-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jeIMQed+uhzxiHzwczupq3qDXNwJFo7QnV0YFmtUdKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbXu1dfN24xb8xCz+9ApPZBycXaRbf43SfV
 NPq6v9WU++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1cx+B/4tqUNcdPfM9qIM50AHK4Bh5wV2y38lX12TL74q7WhA69pbPY/ng1rmKHkq+xlaeam2QQ0
 Ut9y9dKOd8NDsoRDf15MTMxT7Uo89JpRyzVWMDx1KmsGOaBHMtDxti6rQYQ71iEQktw9z8k6/Yh
 czOdGxtrFF5dGQyc4DTfpnSGk3FgCvi6WMN10fApn1WmDhYu+rHFPSURkt6vYrjjfr6bJjcLlPc
 bWwVk8u3QVIHaeXtbMVIq0quw5ROZT/b4LFcRGG2ycPvY5ZSfVup+RNFy70p4N8abSUjKx+UYa2
 5917GzZUEO8I/WhvOcUANl9c0SEVRie6YtXoS+zzUUx3QHUd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iGSi7Q559YvxxqntgA75zq8_BwE5FYFG
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bcab0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LFh-nz-jDHZ_m6HcgWkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iGSi7Q559YvxxqntgA75zq8_BwE5FYFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX38pPJRpMPOZN by6SBT5xtpeUB5F1t//EyXom+xsay5s3boF6MriXhrQoq9oMR3gICdLpbNPCjxUAFB/CBAoZYoo BH5GJhmEt/A1XUOGE/ptOvXI7S4bMpmHGwGbghVOt368+FifWrui7BwVRWcteLShukEBbx7v5g1
 27yknF4CJmdsymGcKWjcTy2DPzPB2Xtss1aP48I5H+zOJXF7cD5X75NmGZoIs4Mb10gy95aZkS5 6lE+vZKF66TMsBRNygYSl9wz9NYKK+8m/vJsBrIlesHGibl1YlHUaZr4nHbOcULGlnQrRaavlVX yuuiB556hWviyrvalSc2MS6mIYIRQarhKr7iYlx270FPdxApKPpWdul6heQGF4GMtJQLdRztkB9
 Dz36XMZeuqk18XXklhqopbsX6PpMGISgZCSy1Lhq4EJORmi9/9hfRae24JHWSLsKBsCgYI81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=948 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

The CoreSight static replicator device isn't a part of the system MMIO
bus, as such it should not be a part of the soc node. Follow the example
of other platforms and move it out of the soc bus to the top-level (and
reoder ports to follow alphabetic order).

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


