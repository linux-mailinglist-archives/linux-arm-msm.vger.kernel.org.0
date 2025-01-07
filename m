Return-Path: <linux-arm-msm+bounces-44082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E761A03A2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B443A5643
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E978B1E25FF;
	Tue,  7 Jan 2025 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JGN20aPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0425481C4;
	Tue,  7 Jan 2025 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239751; cv=none; b=Tn+BuvJsDN9mAJLszAw6ZloGlIvRq3MsxCDzTL6MOyQmGIlsfpS30cwxFzJ6nYs55kqNuy6h2OhlPLmp/xdmImuHMYvmv9CGx7m2rdSlIsEzz5itRhQGzfbays2bT98UjvRjfvBDk8TwKQjVJRhxU3MHUo9OG1dZr2rYTqAzhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239751; c=relaxed/simple;
	bh=R6UIKGBtUQlx/3/LJQ1ajW3n/ng0uVZ2C8EM28vjFWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jCfkAWEmg22y2560qPwdo2F2XuYyMDt/KHg/BOSZusu2i86mBUsWxOgQYlkveAQxODTBuvoWbD8p3slMPMpOIikqRhDBrOFpvSOpiYDr1DVp8VyV2HQUOfvMHu2VuKTvVWRLystGf5Bo/xRlAK+aG6rYcbPaIMmzO0xANO2wF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JGN20aPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5074eV3h014425;
	Tue, 7 Jan 2025 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B1hMH6jvjoHwXDZti8JhNi
	dBmVeFxvzJLNc/eVz7MdY=; b=JGN20aPi9gDss1fs0WxFIhFDEG4OrGFkFDLP+k
	3k73PYwpllfzGr1+OLNi2Vu4j+aP6lHMI/KSpx5biH/xiDOtIh47ZDfT2zfkSb91
	qRqqnaR32rPVdvJFJi3uamuDHmgX5UflTfE5pTs3oSAyNbN1xXvW2zZj7pFzPHPv
	CTJhbL/r01R2qgzVd7O2z+kBzR64n2ATdC1bKj2Afn7IJPQWy3a9HvkJu4BF7Yri
	EzQEC/WcObZJSi5Wp704JPTMntT78lPI7RxBmPJfZ4Ca7entrxhMM5sdHCbSek1d
	5VnDIselXVxwFAOkpyLxUvqk1EpQRvyquEuPrINvgjMLpb+A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440wex0gu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 08:48:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5078mvRB016467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 08:48:57 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 00:48:50 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Tue, 7 Jan 2025 16:48:26 +0800
Subject: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFnqfGcC/33MvQ7CIBiF4VtpmMXwb3HyPowDfoBlaKtQiabpv
 UsbHaqJ4znJ844ouRhcQvtqRNHlkELflSE2FYLGdBeHgy0bMcIEZUTj1NZKEgwJ2wEbq4S24I1
 0NSrkGp0PjyV3PJXdhDT08bnUM53fd4iSdShTTDFTWmkuJJW1ONzuAUIHW+hbNKcy+8dZ4eCZA
 AX6bC38cv7hklDCvzgvfCe14V4ZDlCv+TRNLyDCVMkoAQAA
X-Change-ID: 20241209-sm8650-cs-dt-ad649dcfa5e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736239730; l=4866;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=R6UIKGBtUQlx/3/LJQ1ajW3n/ng0uVZ2C8EM28vjFWU=;
 b=fkL3WYjGR5qpJltPG1n6OBDHGc97vWvaTulnjHZMD8r0NMRk365YH5hau8i/30/DkZtFX4qG2
 IklTCVk8OjRAA6p1QiiywwCpJMJZe3ksDCrJ+zQzO5DhuCnOWhzIWBO
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4EmgQLeC6aoTr4UUxmV7wWe-itYpDAhj
X-Proofpoint-ORIG-GUID: 4EmgQLeC6aoTr4UUxmV7wWe-itYpDAhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=1
 clxscore=1015 mlxlogscore=946 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070073

Add coresight components: Funnel, ETE and ETF for SM8650.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v4:
- Re-sort these nodes by address.
- Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com

Changes in v3:
- Move ete0 and funnel-ete to /.
- Update coding style.
- Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com

Changes in v2:
- Update compatible for funnel and etf.
- remove unnecessary property: reg-names and arm,primecell-periphid.
- Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
 		};
 	};
 
+	ete0 {
+		compatible = "arm,embedded-trace-extension";
+
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				ete0_out_funnel_ete: endpoint {
+					remote-endpoint = <&funnel_ete_in_ete0>;
+				};
+			};
+		};
+	};
+
+	funnel-ete {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			port {
+				funnel_ete_in_ete0: endpoint {
+					remote-endpoint = <&ete0_out_funnel_ete>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_ete_out_funnel_apss: endpoint {
+					remote-endpoint = <&funnel_apss_in_funnel_ete>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8650", "qcom,scm";
@@ -4854,6 +4888,138 @@ data-pins {
 			};
 		};
 
+		funnel@10042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10042000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+
+					funnel_in1_in_funnel_apss: endpoint {
+						remote-endpoint = <&funnel_apss_out_funnel_in1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in1_out_funnel_qdss: endpoint {
+						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10045000 0x0 0x1000>;
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
+					funnel_qdss_in_funnel_in1: endpoint {
+						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_qdss_out_funnel_aoss: endpoint {
+						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
+					};
+				};
+			};
+		};
+
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in_funnel_qdss: endpoint {
+						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out_tmc_etf: endpoint {
+						remote-endpoint = <&tmc_etf_in_funnel_aoss>;
+					};
+				};
+			};
+		};
+
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in_funnel_aoss: endpoint {
+						remote-endpoint = <&funnel_aoss_out_tmc_etf>;
+					};
+				};
+			};
+		};
+
+		funnel@13810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+
+			reg = <0x0 0x13810000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_apss_in_funnel_ete: endpoint {
+						remote-endpoint = <&funnel_ete_out_funnel_apss>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_out_funnel_in1: endpoint {
+						remote-endpoint = <&funnel_in1_in_funnel_apss>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


