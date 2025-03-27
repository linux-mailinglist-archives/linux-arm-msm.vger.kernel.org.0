Return-Path: <linux-arm-msm+bounces-52581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D194A728DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 03:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDF0189BC74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D277F1B414B;
	Thu, 27 Mar 2025 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA3/Fd9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B871B043F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043801; cv=none; b=StW+nYCtjxnQvf/DtIIyoVFnF94ESPqGKvdaflFqOxOJ/f0pz1LolMfjRj865aBkfpX8o95YJFiutRzr1wVj/oern+1Oztc8GhsLVJrThsZ6duvYYPfxiuRp0RhhlT6uEQ3eOn5Uo5op9KkFgu9ezrt82eIudMWRZkuVkqYkKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043801; c=relaxed/simple;
	bh=USOkd1y4ycHMowXJ+u5Y9yR9NhJuLmYlCUcma8AFsCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtAjHi2BTd4bCcFFVyagEgXIISGcpD1Eyp8yIs46gb2w4jsTFLM2SgDGP7RDh9iT2EBj+O0Y8HpiaH8fxGtsB05y7ZfoD8iZ1H2wq+f17bQqlnYlQYneU5qhGHw2ePo2ho02TB3pGAJ+2NmVFzxplDCgwfXzNU6pIG6KZEx7134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA3/Fd9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFP2oO008933
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QD71Ni1FveV
	VZof6qkP0cuev2m7lS02QbhD8vpJivU0=; b=aA3/Fd9cHaTbugi6ubuknnfO/7V
	LjqIaMo1JFB5Fvw9DL0iQLoKUZQDahrzzQJCxLmrUmu7QJLHS2cTztlYlDXgRlRL
	dosWV+NcROOfLlKh6gvt6rBeITag61lSp6G7PQiEemtf6eY2nxDE2TuLoTJPpVak
	oEeyxt2wVo/Ml+7/nzn03D5967k8CXOPnmfhlTeUbtagG4aPJgDPAI+8s3V6xmbo
	t2yo/2tskW0nPFflyC4EYr2G8rmWHYe1TgXk/fwRztvZohKG+acXAVHsnr6B68i3
	05fGlVFpUlqepSLso43wOoDqwnfKY16W/pwgh1fMPKEwBPpg4+fSj2p6d2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4q3e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 02:49:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223fd6e9408so21347585ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 19:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043798; x=1743648598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD71Ni1FveVVZof6qkP0cuev2m7lS02QbhD8vpJivU0=;
        b=D1M8NsJiHOBkhSgs6aQXj/MJnxcv3Z2yUFHTg8Djs1MIarcxTsj12i2U1FN6y50aPu
         MErkqYL6C6HqD2NPePWjdeP4eLjJGpwzPgL6vDvd1M5zV/pCrcg559Tpj5SdPGOj++Zw
         /qmOfq6/Y7wlDoZ+9ZbakDKiqlo4vAHjJIld2ss7UCOkvcCppAavfALnbXC0gPM2Lc0w
         /KfGpX5p6s+OTvFwbeZs343+PHW9zHYMFffnuKxF14pK/GtR03V2fxjWiko/ce4ncc4s
         d2fkGKdc2nujmh3DrRCp9buHWukJbV+yNsWZTst5IXcOxfvaV2hulUnMoO5h50kHYZ38
         Hr4g==
X-Forwarded-Encrypted: i=1; AJvYcCVP+uVSclT0pRcVXDgpkuaCqemJlz7QaHGrOpNAeYJODiZUzipRyd7dgNTjBGq0ZRon7oE/qAa4WchaKMoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEj5wgcweq7y2L9gdH9tgDJzITXpAqRmlezWamBpGryHnGGF4
	KntRpVNp+IYYW2Shv94qi6XPca99wlJNkUqWDYMvf72JzHfDeF/bZZwhWDjxOE+QBeDXgpCIKCo
	FTmRGNXiyS8Nm0Yp0S3XO9jcm1y3k+6u2rn76LqZf24KIaqTAEiaJ0X34hA8/rdTm
X-Gm-Gg: ASbGnctR15+6mrhmnsfVCHixNV1hT3eEjdRXupGV807tsW1N4cTxZGiXdAllRK81jiy
	DiunqfyfoTQleD7xDJ9qp/8ZIFiCg4Ap4eh074t43lYHPLhn/Hk+rtxtj6BFINcNhZ3qx6TX7T3
	b4fS5z+pEcQi/RHyj12YuMbXw6pWQiYMuIf0sHPTMBbv7kFrF1stxH6dn7um3rkgjXFbIJJ4lfK
	woEvJhkxcmOocpFQKrWne2OAq5V+FQ438tjeh+bbWIGZPeBJuGHmZyjqKwhw2u7aWeVCslA1gXA
	o9fdizG53lutqhY8GUJH4ukXpsK61VcXrr/Ab6mLp3Vtma6hsqK7+ZdaeS5kq9wd/MVSTf13G/Y
	=
X-Received: by 2002:a05:6a00:3d4c:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-7395150171emr9107934b3a.6.1743043798172;
        Wed, 26 Mar 2025 19:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqgDFWBWUHHujpcGvf8Zk51GgGNpxoy+ZAlmzYdSYb4mPJVtPeBRnRTX187a1MRs0gTAKK8Q==
X-Received: by 2002:a05:6a00:3d4c:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-7395150171emr9107894b3a.6.1743043797621;
        Wed, 26 Mar 2025 19:49:57 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615874csm13511878b3a.143.2025.03.26.19.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:49:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
Date: Thu, 27 Mar 2025 10:49:43 +0800
Message-Id: <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Tj74L_ck3k_YoLLTAeUWpgyEzpr5IxY4
X-Proofpoint-GUID: Tj74L_ck3k_YoLLTAeUWpgyEzpr5IxY4
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e4bcd7 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iat8tipS0Inmowy2WboA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270017

Add CTCU and ETR nodes in DT to enable expected functionalities.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 037cd366a09b..17a799e6f55e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2146,6 +2146,35 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ctcu@4001000 {
+			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x04001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x04002000 0x0 0x1000>,
@@ -2340,6 +2369,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@4046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x04046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc@4048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x04048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04c0 0x00>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@404e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0404e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@404f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x0404f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04a0 0x40>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@4841000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x04841000 0x0 0x1000>;
@@ -2769,6 +2914,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
-- 
2.34.1


