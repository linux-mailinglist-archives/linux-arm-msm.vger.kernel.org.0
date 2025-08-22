Return-Path: <linux-arm-msm+bounces-70359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCAB3158A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD0BA009A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08BA2F6195;
	Fri, 22 Aug 2025 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxZXdlU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F611283FD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858634; cv=none; b=QEhCT2kN1WXlOf1VVJaOkuFPNvcn9jDFo0uipdl91aH+V1ndWJiN6Ads7gAXWn87OFxVctR4OeopQntXeEtJTE39Jc9alRNUKjgLfzZzTYYhKAY4+92hetr9FIfo3YSt8F64N63SIasSWpuAQonQX/qyVVZCpcMQD8vwOXYl4no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858634; c=relaxed/simple;
	bh=qiYYWeXGyneC1KjiHAMmCpDYJ9k3K0y9ORAAb4EGCAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E9tnhDIRfEgtBIrVnD1QESOKshpJY4DqsD8w92mizmwfI5vawvxIK7Qt4ivOTVOLK8L/Dqwh9EE2NmnHvN7WgFeXxNN+OWu1M8tptg2Z1A1O7Nr45D1RDHQjAL+VZL77aEX1hVTW7zAkEwcrdpsUoz3M7/yhjgmZaPEaXzAn7wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxZXdlU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UecS006729
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k13K1y4W7bk
	1dVHjpu6PSFA3QeSZb1Ld64NLLZxH3z4=; b=fxZXdlU398nJoHhnBD+wib2T1JM
	+xDw6l/rmrEY/qH5C0NBvJ3mYED0mjVRYXIC+QAq+1YavoNkWfvp0rnsRkf4BQWH
	DROM7bT6kiFZ1ALKbDktAD8EZUw9eP/1nkiM6aWa6amMtsPs8MER/sB3reDVH8li
	HbmMbgzbDGdMoVFUQ84pWn9baxNiYHYC34SSiz27cKugRZIkhKzc7x8RwSTntmUE
	WBv9tNOnOkI7OFgPebc3u5RAoCq8QrKVXhKfFr0lerGWihL3C9T3LZjTMN3Jt5SY
	nUo93SAp6J7OXcqNbrQwJvkmtKR5v5Sbj8KABjyTlQebbl2KBMgEANNY+Fw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drsm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b49c816817bso111660a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858630; x=1756463430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k13K1y4W7bk1dVHjpu6PSFA3QeSZb1Ld64NLLZxH3z4=;
        b=Q/XKZTRbDDtg5as61v9Pfhpp+Bpei0Faiw9YED/60EJNb6ShylXLYfVtpIWMH9z2NJ
         BIh+pvjsO2uDHXKEa7RlJcs05spACmx4bbjz02PFGRVmChUhrAll+CH3aNoAgOUh3lXR
         6KKN/JAFFXBUBQzn1z+2QvpEo3zCFKALwykpiWc4AqmkyhibcRnzpNUWgkQ+XpSQm42e
         riXFnfj9Lbjchis9BDMMRHKHAzcXj9LHGUxn3lfy6kS7XrI8h8qYmfi3vJfInv1Z4iWO
         ZPQSoNbfONw+txoBaAxvLb8hrD6/83dy/aKMCLtnNSTbXRDDHmKpG/ArEkimrq+5U0Fo
         3JOQ==
X-Gm-Message-State: AOJu0Yxumxv+2fGQkfZtffKyrTDgbFJDaUt9xWua5dsuzMLSTqPOynF7
	5BTbWTysnSwxqG9ZuYwRdi4m5sgehQRAxCLoljgyPAjuHuQ2F8wm7NhOOHUqMfXRzPiu62upbd9
	aerejzHqOdD2p76kHNdjKAFj4FOtHsvHyZcBOJ46VHTcD73/fzI7KAc+WzIVDHMSGRqhh
X-Gm-Gg: ASbGnctJqKQAZYxGoVanx6TlWCczodIN1BcONiFCRhAMt4pmfzG6+ENKIl2wo0id3PF
	+VutbppIgJr6oupZ633VelCFUMAiHXoV3dGsoVBK7UyrWeIiFbA3CDMSg2la8uJdTUZLVTFYiwj
	/tHN9IQoDY1rDWsyjEQ9XPZxLOohkXaf5yf5q4arEEaztz7UoMxkeQKtc8yyp7WNiDzSCybkAwJ
	hi7xGpeFhB8OH5ozCkI7sM7j3moPl3TJM3Nhu4b44QroU0nB7BNbCy5Ssy526DDuU10vFTHXtVJ
	UyrfVcwuM0A9qrFFxdrwpfYNUsDxwd7uXYBFT7t2y0wKGG0S0jD4amexGMo73H9/91t7EfoTdos
	wOz/Fw407tblSwPzStLtE
X-Received: by 2002:a05:6a20:1594:b0:238:3f54:78ec with SMTP id adf61e73a8af0-24340def5fbmr3825806637.46.1755858630398;
        Fri, 22 Aug 2025 03:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVlMDlU6sV9lQpDsihzPt7GlkamAV4d2zA9RgA04+j3Ibuouglgjezu/LoQBnFhZnLmMuvHg==
X-Received: by 2002:a05:6a20:1594:b0:238:3f54:78ec with SMTP id adf61e73a8af0-24340def5fbmr3825768637.46.1755858629955;
        Fri, 22 Aug 2025 03:30:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
Date: Fri, 22 Aug 2025 18:30:08 +0800
Message-Id: <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9hrfdrG2pNX3
 doAsc0DIND9SLDlIkdmmC1kkH38ArYiwLjxcYti1WWc0v/elnSuonv5AzfEZZwMwxOIB4nxNWKQ
 y0xFxXxi9S+0MusrbmZxw813UrNO6nYNhqFVmvCx+N7Rz/5krMDUq9xYSvFCZALCS7PCT6Q0jMP
 SudIAkJ01ofNB68sH43GeQQJQ+QIgxFVySMvVUyUvoepNqNX0OvbNy1TlFj5odkOt/d5nl/3oZF
 2xs9AVNIOdG93rTahjw9Da/fXbA0Fr6af+XSqvj8GDxYgNm76lmQ1fVBdlQ29Kd2ohnYvnjEHSr
 LJPnFfpGfwwo8jqeJI/0uJKH7RdngD+cZk/mZ3a6mJT4ExLszncHAL8JkKSEzS44YEGjgcK81c8
 3ofKfHzhisWRyVUMJZLv/Up29bH5qQ==
X-Proofpoint-ORIG-GUID: U30kYN-IgDRT6aCDKVjFn-v7VTw2KvOt
X-Proofpoint-GUID: U30kYN-IgDRT6aCDKVjFn-v7VTw2KvOt
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a846c7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8Krfq1_MhNCW99YIMDUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Enable static TPDM device for lemans.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 64f5378c6a47..077e22b28279 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2959,6 +2959,14 @@ funnel1_in4: endpoint {
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
 
@@ -3116,6 +3124,60 @@ etr1_out: endpoint {
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
@@ -3388,6 +3450,35 @@ aoss_cti: cti@4b13000 {
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
@@ -7578,6 +7669,20 @@ arch_timer: timer {
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


