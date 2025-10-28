Return-Path: <linux-arm-msm+bounces-79155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F1C14047
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3EC5B4E43B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F0E306498;
	Tue, 28 Oct 2025 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/RUqVnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962B304BA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646344; cv=none; b=ROWZkazPCPDgUKPWp447eL/wle771F8P6dB9ue7a4HVAL/q+k678G1ZmYhwXPWrSi+MwiLPzEwOC0EJHIWcoMwgoJtxQgWUE9ZxF+VkOWcDYMd4kVrdLt/agx52P/HkUR0PmHbmtNwkzgr9u9aSiGxVG7L17nEX9pCejGMX8IH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646344; c=relaxed/simple;
	bh=/rV8b02lFbRn8hnY0VJDTTwq6M9xJWBmQ2RE2hCI1Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXPjxiarTO4tN8L34/4P5MrfvY6Mcl2DDqhM3YMyskqtDJvVA8SW+TEw3qoT9WATiSlVtN5igiBeg9Q1y5EZFmDNxwBcDM4quIN5WBZcnYuvH8kZZmEvzvcFu5IHLNwyIjQdpW4hRKCSL3UAJcnQkOpVepv/nB05AZcinSLgTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/RUqVnX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA33sC1237835
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AOYj+NGGeRZ7Yqf6v29L00+UqblIskONx8KDUVHi1Q=; b=e/RUqVnX6twUu1R4
	1SL5Y5v3qcICnszJ+UT0irCp/VoYOI/uNdB77jwr1x8hk/C4xNMnXfajzfuQWigr
	GR/Puw7ZXSjPVmMCYY0LWRjNN/s4REYi1Z9gBalYzlbtMkEABjCFWpalDhuenWJX
	SqTm2vS3LaPUv/2Un9ugR0IpIoxG6pWrkTizgHpXSO0DvvKTqnjXBTwI6zMHpQUj
	1OsDxRZZ5P5wTwwUqDU8yD+rq35+NU9I82sHItgLJPMB3KhynBWSNyb9Th5RfN0s
	jjm+8du6e7Jfy5iGZJCVK8TQIhhAkGkpNAkvxpSho0JtLVXGNMwJhx7XQ30WKjDV
	FmDAnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3g0p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b63038a6350so4267537a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646340; x=1762251140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AOYj+NGGeRZ7Yqf6v29L00+UqblIskONx8KDUVHi1Q=;
        b=gZKrItmAaAPlMqd5P4dp3GyD0RYOI5SBqtWZeusDgZ7mXd0ldybbLbubCyrNAAOrdc
         8WUSS9XaHYrNai89lFFT7sJ9CK7RCYDR2xfHoBoTHJDrtC/F+RR1JzQGYwdyxdNpnqCO
         7/uHKIvA/6kw3JOm7oloT2O7n+G0xl1HnYQiro3kMkItyHdNyG3UYBt1wg8uQzrqCZqi
         BW+6OixWUIKff0zA+2iMd947RNaDFOg6GqdAA0f+tBMuqRlgviWut0gRhFqYzB3knw3q
         XrAj2d+cmMOipTBLHUEcojEBhzBPZ5ctR7FPit8eOY5CppjmBw3tYoBRhG8KCnMMZpqf
         /fyg==
X-Gm-Message-State: AOJu0YyN/ztNbdS8mmGX4sS7kYOyVKfmlWjo+h1WLg6lQxLYvTTZFktP
	geo09PAGz2VT20uJvC08kuw8zOwYlliO2O6k2hJmaKuxoZgPaww76rRFtKE78455S4NGqZADWiD
	XaO9em0qoXgHJQSCVb7Ff/lPMmx7DaUsCPoJ1nyv53/incMvb6CDOxjrXivRZRrYWOK8yPyGoBa
	psz7c=
X-Gm-Gg: ASbGnctlZZeSHqaAoTxq/aQ2o6fOrZZDP0/DIGCbt6a72JPujdqQ4nRCUUxjb7Z+Ydc
	/ZS+oI95AwX4rDzGw8D5gUVvwyD0TKKxqe2K3DG9OVDsiT1dXleNr2NpLoPg3rjCTito+adobSm
	PwlVzNf7hn65EqkAJHjFLBm6IL6EPsvV6rRvxoM9oVlYTqKJNl3WURz46pM3IBXogseSFBVHMdS
	gr1BqoYL/86u8Pk3N2ROC2uMpU6ThzCv4EKifMOvE8dwevGZNFbrw/lBJ40UjFnZHILZbDTf/9f
	qHAyU76vde8nCBaevRbsS35RFotsj1GZ/+N8nFenlE4bmr9n2pF7OnHXGneSnZByuj6bEyXYnF4
	5ZFj4ESpAsoF9vc3ltHnxYUSut1m3QCUNYrMTxQydybwKHVFKtM4ozPiogMEKqA==
X-Received: by 2002:a17:903:15cc:b0:292:b0d0:2ef1 with SMTP id d9443c01a7336-294cc722b29mr32133055ad.18.1761646340548;
        Tue, 28 Oct 2025 03:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcK2UoPhoEuKHRrlWuWBy8+oO5uc8TBTCYd9RSa/HN7HmGG2vRuqfaewpomWa5UmuaODLLg==
X-Received: by 2002:a17:903:15cc:b0:292:b0d0:2ef1 with SMTP id d9443c01a7336-294cc722b29mr32132545ad.18.1761646339772;
        Tue, 28 Oct 2025 03:12:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:11:42 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: lemans: enable static TPDM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/rV8b02lFbRn8hnY0VJDTTwq6M9xJWBmQ2RE2hCI1Ho=;
 b=NW8JrTq58ErqSr16wGg0PZvUE6ItBGloVWbTHohKLxaFebf5hWosb78ZE7f0jF4wGUAcuYMie
 pZa9rUTi8emBz2PUihhD7npvKKnpvnBjjSlHcaLEb4CU6TqJMr1/yvC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX9BXTgCoaJmjm
 bumgxIi5I0RwdCrlFVnO97tQmeHTbXJ/CT37X7bRl42vMZAKePwzKdaiFU3nlCl+Z5TFSkPv73X
 JgUoUuJSuNFKKkjxkYy/QhYP43tzduEmSbxHDSUscUAwhtnwKVmgR2tRr647U27fYXUQ5khX25g
 4cFNmjcf5/NDjDWKF4G0BU61MnAsf+4nLLpDg9cwA/SzuUO95RKzojod98cPNRE87IPPh34Sv/b
 1f75iExnkPf5fvaya8E2BIQWsSFhrrfQNoiy38SAS5ZNRq5tn7awLDRZK8w9+iqNB0LCE/rG7fr
 bppWxPEqXY2V1aOqmAnLGEdBEjALboxsnTo5/IHgtPks4L3Xb6ZfCaavJYPKAxIUi1tnJi34HHU
 tpk8eXhiNSq5fLcqw1Ox3+co/yD3Rw==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=69009705 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: q1BqWhGOPUhQIt9ZDpf_XtsboRsGsvCV
X-Proofpoint-ORIG-GUID: q1BqWhGOPUhQIt9ZDpf_XtsboRsGsvCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280085

Enable static TPDM device for lemans.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..8a93b353d11c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2961,6 +2961,14 @@ funnel1_in4: endpoint {
 						<&apss_funnel1_out>;
 					};
 				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel1_in5: endpoint {
+						remote-endpoint = <&dlct0_funnel_out>;
+					};
+				};
 			};
 		};
 
@@ -3118,6 +3126,60 @@ etr1_out: endpoint {
 			};
 		};
 
+		tpda@4ad3000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x4ad3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@10 {
+					reg = <16>;
+					dlct0_tpda_in16: endpoint {
+						remote-endpoint = <&turing0_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_tpda_out: endpoint {
+						remote-endpoint =
+						<&dlct0_funnel_in0>;
+					};
+				};
+			};
+
+		};
+
+		funnel@4ad4000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4ad4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlct0_funnel_in0: endpoint {
+						remote-endpoint = <&dlct0_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlct0_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in5>;
+					};
+				};
+			};
+		};
+
 		funnel@4b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x4b04000 0x0 0x1000>;
@@ -3390,6 +3452,35 @@ aoss_cti: cti@4b13000 {
 			clock-names = "apb_pclk";
 		};
 
+		funnel@4b83000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x4b83000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					turing0_funnel_in1: endpoint {
+						remote-endpoint = <&turing_llm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					turing0_funnel_out: endpoint {
+						remote-endpoint = <&dlct0_tpda_in16>;
+					};
+				};
+			};
+		};
+
 		etm@6040000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6040000 0x0 0x1000>;
@@ -8269,6 +8360,20 @@ arch_timer: timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	turing-llm-tpdm {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				turing_llm_tpdm_out: endpoint {
+					remote-endpoint = <&turing0_funnel_in1>;
+				};
+			};
+		};
+	};
+
 	pcie0: pcie@1c00000 {
 		compatible = "qcom,pcie-sa8775p";
 		reg = <0x0 0x01c00000 0x0 0x3000>,

-- 
2.34.1


