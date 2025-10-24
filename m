Return-Path: <linux-arm-msm+bounces-78658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754BC04238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC9463AD151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCD025CC6C;
	Fri, 24 Oct 2025 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDgVR0li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F071A9F90;
	Fri, 24 Oct 2025 02:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273454; cv=none; b=cBnCMlIgxJWMav3XtOnXgCoFYu/bTXua0MrWwkNEK8f87Ks7P3t6kAozL9oAbFms7HI2Pj0p/6gUZQPyGem9jxkGHefOVG+j3FlxpJimrSivlc4hHoJq5Qpqs5K05w8id5x8vkm+Ks38sJZDQZOfrxIPA6bdOawGmA5KZVxkI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273454; c=relaxed/simple;
	bh=RjX32rxPSWfRkNl8uUDNEsb4MGTynBMm7XIbNzbCK/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2c4NJkfNo48zjNh7914OxzfyOCHi8EQVsy9c3hdSqjEBMNzUpA55C5iT24qjTrcyqRsKlVUQxXmfObSYNMlVDnj86nLRIRk1C3JQH6cJsgFDxcCBbeAXpmVcHcP8+H4b8miprsegYA8ElfGt0HZo7NXbb4wFMOT7N0jEWcYjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDgVR0li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEVF5W004461;
	Fri, 24 Oct 2025 02:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nJFTOxzEwgN
	3rm/H++bupG0IqsRKhq3viBqrGd6Hd/w=; b=KDgVR0liktZ9cpGgNIQ1gKmd8fQ
	CJbHJg18PKlx0DXRJMMJ841mdmR4SG3oKLfyUQsnn4NS20Ef0716yjSmA7tUikpo
	Q9SnlfRgDchqCv0q7xL4dVtE37byUl+vUOW+3D5YKZk7IEDKTJMbsHGRZp68QCOt
	0SQRx+IPJibO2DtxhpiYfIm3ZM5Pj5YTGS+WLgno0+pFglI+ZIAtH8ecG831KDsq
	DhjQy7Zu6iXscVL4oC4ncotot8fTqxyDXMd30q7eldt8tFsn5OxfdZNaUZia+B+j
	FCc53FDhQSZHRnHwviVj8IGe2DrEYjkQbOJTPf4HC7lqMYiBaq4tIOJsylQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k1sm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59O2bR3r010725;
	Fri, 24 Oct 2025 02:37:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49v3ymn6m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:27 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59O2bR4I010717;
	Fri, 24 Oct 2025 02:37:27 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 59O2bRIu010710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 02:37:27 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 2AD95222F7; Fri, 24 Oct 2025 10:37:26 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1 1/2] arm64: dts: qcom: sm6150: Add gpr node
Date: Fri, 24 Oct 2025 10:37:19 +0800
Message-Id: <20251024023720.3928547-2-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX4Oaq4XFRROEe
 WLQwprDmTgwjJ7aUNNNC1Ev1ripGw17wO0Mj+DobXnfxwwM78GBuaPaNYwxIS+V97NuIC/73BGR
 7T9DYmW/YDoUAqMi/T43YtUcs42uDo+vnSpjO8LMfAuUL+1P7iUompxvIZQ0Sd/nMem+KU+GPPr
 6MV1qMSu5A5jefOhrvd3lsf4XUgz8EBdTzZPpnjqc2pj3dHmSMkBmbv5kdkT3Q8z1WGfb8aFLi+
 kgy90Kjq0fgblUFqPvL684gy5gTlGuUG7ez6UXLnmC7+kd4XL9R7ZX1VYeiVSC0ACHRlwTPCUNN
 IQEMzMWenK5EufUQ1harBAblvix+dn90FReiyvmubmH87d2konMz8yaL0o6A6ZgYfrndyUeXQTk
 X3hJEHCV63flExKzFWAu+Ewmm8yyOQ==
X-Proofpoint-GUID: Gs9ybgd5uhfctkOBfvNtnlKAjlejqCou
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fae66a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UhVUwdw8r1UmGneQsTgA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Gs9ybgd5uhfctkOBfvNtnlKAjlejqCou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b62..ec244c47983e 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4246,6 +4247,41 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1721 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1


