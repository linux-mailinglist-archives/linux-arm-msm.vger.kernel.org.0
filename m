Return-Path: <linux-arm-msm+bounces-72365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8366B4638E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B69A43429
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350522773ED;
	Fri,  5 Sep 2025 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwJCAGjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573B27F00A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757100250; cv=none; b=opsU5WViBhhDxY4ep59ITwa1snGvBFg1+7Tf7xIZQj7MHPEzrc41PNWTQvUVJAAd4OST4u34x5l6zuR4HcNjwvWwQ7wJHDYYUwDCgM/fUjnFje+WOLldRzMtm/nJCnfWYNKCH4dr8btgsY8w24YpJl6QDqiC/kvV9+ZL2DcBwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757100250; c=relaxed/simple;
	bh=YqiZVY/P4h11n1YmoIH61y5tP5iX1W/rqinOGkDAsXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fj2zEVoxxSH3dc4jtN0wme5kfSKmtt+a7cmbunIyIe8Aet8ZC7Td/MPh3Cw0er5rjzt8U5n3Zi+4ZPsz/mguIHjcFm1g3JtxcMfcYRk7jUfGdj23FIAjGP9iQ26TP7R/QmnWSV6AWNlxC2/XQZblouP9HUGN7qICIvrsCMxEwgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwJCAGjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GVTgN031352
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 19:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C6tu2IKK9J7
	3Tb0vlq0onDfqNFgl91nLHdqPT79aifw=; b=PwJCAGjFNduF+w1QfuOyuYr/b1Y
	+Hb56TzTTZkSOk93H8JGaYq3qIcxte1cLbEr/iGTl/SFcJd6Dkw6arQnGNfPmb6V
	YNEccW0ANW8jL7byK1AvAL4UcQIk2u9qzLG3U73u0p3d5k0OQ7Wdglo8A2u4X12R
	vEtXMGkaUiA7LIZia6TFBFSrvnP46wyNErCughL8Cw6jgjfR077UQjsPAZ1uhC6z
	MDyfhYQwrNiC1qdZN0pbsMQeV2Hr3K+mbsjt+tBcGOPVIHnaTPHOZYAdGUWVqL+Z
	U83XT4yY2YEmOlCeF88kKfmTK1yjugXNI78zsO7ZbrAD7Vae93UftgNbz3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4903ev0j2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 19:24:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24aa59e366dso7600485ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100246; x=1757705046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6tu2IKK9J73Tb0vlq0onDfqNFgl91nLHdqPT79aifw=;
        b=bRE2kTQ0+1I8eNc7x1xjnCLaqpRniZ33VjA/2j8YIve7x+Fjv5lNoft/zfwt834wNM
         AVHG4rZYeSNaqKvbir73+4zFj2AWxweum4jREnmyZ3V7LZOkYyh/sKhEAwuYbR2eSyGr
         r9TZA5i13WF6wCU+sfBpgE+ypLHcVT2LwxntnZsmqp2rETtov+H3TRWh9I26te4VRkQB
         3wLaR2Tj/hCJkCFPbUD0TsSvPhetllUSFcKcF2E4ql552y16j0IamGZbI/+BWga9TKmZ
         P62hCRojgCr4OaJVo3WjDLdAI4mStphhtoxFOuu4GlLQBCnkMRClEVr2tZw91Yqsuo08
         RC9Q==
X-Gm-Message-State: AOJu0YxWJq7ET2eh4sxZ2oM344LXNvmi3c2YHNpAeVsOzrEirSxsS5SW
	VyJD0hiV0FLV7tXs0+7SIXTLIYZqYY3cV8YSm1in4AButGQvmhp3exQSgtQ1Un90aHw2fK5/xVN
	u2Ivd7AZCBM5VpR4BkAwj82pe2naQ9SenRG/17QhgvlSiCEhlMRkJF9Bj5VP0AbxejESW
X-Gm-Gg: ASbGncubRk6Md51D200Zerk1qOx4VSDIc0PRSpDFmKYkKIKKKCZT9/KgyiSGaWYsILG
	v+h4iNjwBBvEuxvF6yMlo64/XkMWIMJ7VhpxqzsZUNO2bw+J1m13zUBQ7iFMnZ5ZQKLlzlgmTeS
	mjqMc+BUht5vgklr05PE4VRD1uRUa86PU3bi3vNhflXR0D26W9fDNiX18O2fTjMOcqngcba06ll
	y0CeWJUlXuSi30H2ZyI5Xgm1dS7v2YKTQ+KSBvg8trZjXX0q+oTPDZfAQ4mfTw/Rt79bsxp/Av1
	v5CB7ZrPIop9Zs6vrmpOqu28dMa6KsIfSRj7Zb8nmFAdQKJu3vTeyvO33MTejtf8Xd8x854=
X-Received: by 2002:a17:902:f685:b0:24c:cbcc:b7ae with SMTP id d9443c01a7336-24ccbccba1fmr47886155ad.6.1757100245876;
        Fri, 05 Sep 2025 12:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoJx0yV9ecXAM7dTdlqqlzkTwUnZuQQ157sQUdg4pT7k4YQPWllhK9a75O4rc4HuN8GCcwpw==
X-Received: by 2002:a17:902:f685:b0:24c:cbcc:b7ae with SMTP id d9443c01a7336-24ccbccba1fmr47885965ad.6.1757100245298;
        Fri, 05 Sep 2025 12:24:05 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc1a82a34sm52397055ad.151.2025.09.05.12.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:24:05 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v4 3/4] arm64: dts: qcom: qcs8300: Add gpr node
Date: Sat,  6 Sep 2025 00:53:49 +0530
Message-Id: <20250905192350.1223812-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE2MiBTYWx0ZWRfX3DaEzyx+D4r3
 Lt4aS5gpt0ry7Ou3Rfq7doMN8fTCnMQjB9KmZms7VcjYJpqt+kRZUqkHH9D2iJ+e6GoylZ/ZqJq
 ZkNtCiVl2j2Xr/37w5P75mpqnwRxzuYlF0j+6FpYpXTz027npavz5Qz+FH2qbf6XcDNiI4lVyVB
 qRkASw6f753LyTkYSUEfbd621NuJd9SvZjlpqazQS64WMPICfv48DO6FNUp4j/icJzgeHnAouMk
 h5vGlAFFiIFFV22v34JB+KFL/RZmWv3rvJH8HiJ14hq6b4H6WgMwO7FHkK/E1Qc193qwmXvpJ0k
 Pn6BzkGwj4qKnKOn5r4gOnBs+zwaQCwYdY5nbKG4m7OBr4/z2/coTbJNxn422z01+rycH6peyQe
 0ZCXIgmr
X-Proofpoint-GUID: TUVk-6DfB2LJm89Yq349rigKOyylCkAu
X-Proofpoint-ORIG-GUID: TUVk-6DfB2LJm89Yq349rigKOyylCkAu
X-Authority-Analysis: v=2.4 cv=drbbC0g4 c=1 sm=1 tr=0 ts=68bb38d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YnLsFFvNRNnE3KoHtkEA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509050162

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 5edb137d1471..8ae843567ea4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>

 / {
@@ -2427,6 +2428,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
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
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x2001 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
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


