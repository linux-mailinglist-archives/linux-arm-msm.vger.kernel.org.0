Return-Path: <linux-arm-msm+bounces-80499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8601C38C65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 02:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256A31A215DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 01:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4703624C66F;
	Thu,  6 Nov 2025 01:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmMGN/gk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk1nEqwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B122D795
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762394277; cv=none; b=NNnQeXjqXenFhclk9J9/uH200aXMtWXfDnlCFzYOmYY8wTXHjQ44HqCRM77iuxBznQcPFMmzmOXj8paU958qHO4W2RkUpRjqoXxA32VdYxRkq0GeUdKR+LuW4JcPPQ31sDtxndYeU9Mo2TaDXRr7+yNJBC8cVnzuQxCq4oUNyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762394277; c=relaxed/simple;
	bh=7VSD4rZhCzv8NdJ8v+27nAr+/WtZ4IGwF8g9oS/Ek8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BchHEjwza6vckaNGj3qLhr2XzuXsJMCnPXALAZjWL/ycz4RK7dWWjUgNDeaDF5+mIj1nL0ruG4IzHITaPZhrd7aFkIbZpAeRPC53TTk4yaSJS4uYOdZ2SIb4j04kvexf+PdEXYH5GGBX1udwtJBxgI1mdj3HYhF0QsyGy91Tt0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmMGN/gk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk1nEqwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF4SX1784983
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 01:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=; b=pmMGN/gkSNpeK88B
	kSQ/dL8SCuBFIM4feuq6o+y+nqZgxbKLExhojQBusMKDXaH/msiicV3GsqDEmnaZ
	bz0VBHNmt02aOq9cJUAf6gfMIZ6mM5z2CuX2PUf7OwC4yyJA34MBVilSLPBKG30L
	mbVsvvg9WIXYrigR0YobO5EyGsy0Lqny0hiHnWTtOqh/tuYRAorxilbSrnNoDUCK
	JjvwBlvrUsxRN7KNSb4b/n/XKFzuyuQbFr9GS+jj1vM/ZbpffgQjrcAjjnJ1Cj8j
	cykZGTLQevxIGR3rUSxVQBix0L0hICGZuz1tlgG8hAH9Vvv7Rp5hMy30dPUoE4m5
	TWm7EQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx9cfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:57:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2952cb6f51bso11923805ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762394274; x=1762999074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=;
        b=Nk1nEqwJcnY0wNxfxrEkSgQLlwMZTz2eooBs0wkGkepPr/u+9p1ruGWPSMBgYbS/S1
         oaNiUHD0+xjTFqspQxGexYsnKxZJ7503KnX9d8vigFmQKwHW/8yjYPxYA8eDrY9kEcP9
         5swOUv9xyAx/mkPCpHrOfZJfyOeOvf2pE87Pmqtg4+yny5i/NK6RhZjlpzc1fywz9JFU
         NRQrcQkRx2V3i5F2FoCBuO+T6mvhPI0auWHHGV14X8ZI8jsz8MQXwABrTXCsxlL9VxVk
         HSH0sOtszRRh1KTx1VXssl00x34msKY1UYgWj/8z5cqcITOcf5IWCG8ylrmfVw9LPiBe
         SI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394274; x=1762999074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MkKiRXBbE3lf0Fpqo1FQcvBm1IsA+kYRCJdRWEmlHo=;
        b=sB+em91+Y7sYciPSTkV99fevLmW03dfRmzLA7rjQZpfTvTJxQdv7/Wzefd7tZQQvCe
         0h3N7Iii9h5x4KJc17+B+OlAsRVni4Hlsgl1K/vowrtlugLAh1+DQLiY+VDctWPkdhAc
         ZcJJbOJEzxc6FA+HnhNx12UqHxpc895ZOiq8RWpaWPrHc+Hb9MupLSq95YTCvIbe7e6Y
         SNEYZdhdcTeUQB2M2oifqW+dJU+mXzWIRqiD8B7lLKsRi30uBwfwWHS3tdFZqNlCtSx3
         KjabCpKY1eovJh4B/c8urgDnj17JDIDmzOXmIUBGZ7fqYICmnTCVmvWdMybu2di6OoEc
         IhZQ==
X-Gm-Message-State: AOJu0Yy2WixQp/fuEyTSMyIQvjjrdQYT7oWBfANXw73TBMq+8BQ9iYTW
	Au4BzjAg0R4bvj4BPYPPZWI1OS/EJ1G0/nXLyMRGAG54GZmbqDdNh1F7vFUy7WpTCyif0bOplAr
	CbqxigwMTk97hr8JCGQqmAX3kDefHRjC/ODSD1Rs7n5sjQG5sSUMUd7EvIaIVo0+w0e+svfjxSZ
	LfBx8=
X-Gm-Gg: ASbGncvSNfdoh0RPcOQ17KQwOKwH7Hcud4veIQXKdmDGPHwg1LChgZoAFXEd/Aflq+w
	5Z372aV+3pe0ZRjJaskPflKyaasFhhMvxREcgM7caTVsEgaaJEN1/2Iqyo+RUd4Hq0DXjhhcA4B
	eVm37E4x3vHLQl23101s2hTq2abAe8R+nm2S8wFoKbPE4HnlV4WeFK6G4PU2Ay8y0hsEBcFgC/l
	u3liq4mqFleDHFFyYvlW2W2WSlNVTbXntkfniQKYsxSknQ9ILCYNbv0GYdieYeDqk1wxoCTK+hG
	m0UIrLvUFcj3Zri8Rt5iVRPE3oTOQPTnZ2AFc2K1zknOyO/jFKozkw/1WhP3nbpqGrKkypQ//X3
	rp7K4POwu7NQqTGfbdzlxCxjYajY/5kvVmFMspaJpugKRk7c0xDZFIC/6aChE6w==
X-Received: by 2002:a17:903:41ca:b0:26a:8171:dafa with SMTP id d9443c01a7336-2962ada5a6dmr73325895ad.21.1762394274072;
        Wed, 05 Nov 2025 17:57:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg3zuB8jhhHQtF3i/xJOL1T6MX0TBIHHOix2P4rEMcbSwlF46A8Upq6h35Ggl2Yj74pIMVyA==
X-Received: by 2002:a17:903:41ca:b0:26a:8171:dafa with SMTP id d9443c01a7336-2962ada5a6dmr73325515ad.21.1762394273606;
        Wed, 05 Nov 2025 17:57:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm9115725ad.81.2025.11.05.17.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:57:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 09:57:26 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-enable-etr-and-ctcu-for-hamoa-v2-2-cdb3a18753aa@oss.qualcomm.com>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762394259; l=4204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=7VSD4rZhCzv8NdJ8v+27nAr+/WtZ4IGwF8g9oS/Ek8Q=;
 b=ZuaD9B46ChHvo6NySqR+CnBN7j1JzBkdCBeITt/n2oe7oA7RO5Gxz8SOPXD6rMdjZkEJLQbQO
 K3zkrTeM4kXBgrhlRXADkWVzxiIJy9RD+vFpE7aCw8KwdYKbKSsyCBe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 5rZyVZtcUvCYExpPTGLAaGYhPqWRe9fQ
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690c00a3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxNSBTYWx0ZWRfX2BnwGQTHl6BL
 RCBms7R2BVKyqNbUYJ80CnZdkQ5hvYrnOcv66ixGGlbIIQYVp9n+WRuS7A6K6JTMNCXyH+CKly1
 dXsJmcsBDCEhOj6aLNhOOz27ql6bnLHYB/FdaEyW3Ox7qM8H1/kJt+H7p3ZMlA6PwuDT9mJ4NrN
 i2Q49eR0lUhGxDPfrMxdXoZbkWFX4gHuOZyp3lmDz8X4MFucG9XSN88i1aq99sf7ZJjdDq1H4Ds
 8XLCkqoFs6coeAfyMMuoem//YEhhS8E6Xr+hZ1bDkinyRbZlYZaVstAanyHHs9jdvGKPewEy3Z4
 m+z+NWv49D4pp+2oK7Q3IurcHiyTR39PIiO+n1ncnL8riQ3L5XQW2XLNkIhqpD5EQzceK/B+jrU
 VkmnN8PJIg1ui3kneMmadyNaeFYKQw==
X-Proofpoint-ORIG-GUID: 5rZyVZtcUvCYExpPTGLAaGYhPqWRe9fQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060015

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..3b90133da4e7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6713,6 +6713,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
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
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6927,6 +6956,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
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
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
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
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
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
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
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
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7240,7 +7385,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


