Return-Path: <linux-arm-msm+bounces-76940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E164BD19BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 274611890A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 06:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75A72E54C8;
	Mon, 13 Oct 2025 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWimpRKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B02E3AF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335916; cv=none; b=KeOKIqAJ3S+flXVrkleEAcpOvP9g+aSz8OOJ+ejKpGfvy64kWnhhk73iW0uCDUq2zybRFTwbvud/6Pj9t8GI7ORMPogMK3EeTQN4Gqt9pceCygQCZzEJhxo0Dt4p8EWPamBocUGErEQyMznQaZaPY+uak02ZvgR5vYVri3trNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335916; c=relaxed/simple;
	bh=cM+KsUjm1CT8Q4hIp2dfJ8uGxYpJWqBu6GWePVipu+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dI1uvLg6b3pIvnMy69XCZUa63c8g1wat3FG1TgFn87zdTQOO0Y0Y0I/C1DJzs/AwB+OWG/TIYRSaspWLkc3ED3FAz5oJgLI7p3LXvaymz+8aJRUBvUqA1NUMdroncEPCrJknecCfFikUguc08WOcsq6JXRs4fV4pYKZ8SS0LNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWimpRKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nJ33005298
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oBQudR/weydsEbe0yzzrN3yEVj8ux7cDJxdvM4KdKg=; b=pWimpRKNPYoaq5Ki
	rCJvjWA8Az/60IAUzdV1kM68e/ogOMfoTaEXBtoYctFFl3z6hoW53KF/8k6nvl0B
	cgwC99TASopYeJN+9C/OYIMYNmVV2evvUy6qNCPtcsFLVfZpXeZQ7zKXXqvoHYE8
	l3HEqIn03LBK+HsgKpAJ88Nsm+IXgFilV9pnlG+oV3QWexLLNQ4VmL0CSHwtaFBG
	0ikkeHqeS3Mhkkgw1aNODZHwFL+A2Nep3ebGP+oALwBrl7lKOqGKI1C41826Uwy3
	BLHoTk5vOtb066geC7dbY+dlijMLvPuCaW3ocRlZ+wrEAJ8DVyhkaoKIdRQ1rRk9
	1JS9rA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs3e8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28d1747f23bso80095675ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 23:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335914; x=1760940714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oBQudR/weydsEbe0yzzrN3yEVj8ux7cDJxdvM4KdKg=;
        b=N3miJbHynBcwT//9ofNM9HKQgGuEWih/HtnNdGRfgTQq6tt1UrTUGHW/AAWU2kcJDw
         P1l1dn+aWPag3J8S2yJ1MlT5pqnNdTq3J95P3G+pSNo6Zd4AtPsIuxY8zWTgs9mRrdQX
         rDNNTNxGtnkJEyN7yF1NXm0wRbmi883+KpOaTAPb0eABuoKkcUYV+N1JCWtOQkkQntbK
         xqX//DCb40jcjKTQcstwABcrB6+4I4guxq8xN0SjRFSy7MdUMroRat3YSFkcR1iI0km1
         t4Rm64AL1E8plg3OvFrM0qZTS3vytEwYmbRME3w8k1GnzZIC1x0A7H36kdj/sTuXYo9q
         wBFw==
X-Gm-Message-State: AOJu0Yw4JhA/wwSUhG823FLG3X47CpuLibNGLUSsPgsTsnSGH8GLcCML
	jAuwr+8ZfKE/PusN6kIUxhRiLhbj8WrPFXVfDRvYkRFHPzBUQ1PQdSnsD9siiQA1vVt0wPWN3Z9
	Aj4g+XjPzz4ONL9rRnZHLq+6QqWcp23yxACQprmii/DcYTim2FvfbgeN2a4yFa0xc0TPg
X-Gm-Gg: ASbGncsW2NKH8f/eu7LnUaJ8uz6OpBRhdVO+lRlZbsDUZm2B3T3dZlhvpLXN0+ZVxgF
	JNk0aD7o0sybzJStEO7Ax/Px0qAD1H1IoJ1s3MvGWa6G/yjCDB4/2XejTIHx+jRqJLRKN6XEQsv
	hg4h3zV+zy6+i9Syqo+s/j+rBQDtTf60M7NVnXm/Ar4hyMyDv7+KDK49DFt45XXEsO24hg4PJ8l
	vbPaqy/QLHIGdEd/N8h4mA/ITCHgFX8/UxbYNf+GJM50PC7MjcXL4k77djK1V5apfoq1QvfzsVX
	BCo0SOKY1GmbAQWL4W6hfMYQ/taNqsBMxSeMbL07teKkevmn4lsj37aWVA41vOkedOG87w/PiGK
	igY+ixZzUbuK+01oRm6CkagwsiNw=
X-Received: by 2002:a17:902:d483:b0:28e:78b9:5780 with SMTP id d9443c01a7336-29027402cfbmr279748535ad.47.1760335913642;
        Sun, 12 Oct 2025 23:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/7dHhAvuvDyMFASfG1nV7vjlwqk+Xg+aNfMfNBr1eV+CjzlR0oXaxFgm2QBXq9baxEEAPCw==
X-Received: by 2002:a17:902:d483:b0:28e:78b9:5780 with SMTP id d9443c01a7336-29027402cfbmr279748195ad.47.1760335913112;
        Sun, 12 Oct 2025 23:11:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:11:18 +0800
Subject: [PATCH v3 3/3] arm64: dts: qcom: lemans: enable static TPDM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add-static-tpdm-support-v3-3-a720b73e83db@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cM+KsUjm1CT8Q4hIp2dfJ8uGxYpJWqBu6GWePVipu+s=;
 b=niUZtQK2sHWXXqAzI24xd1rCBjQ0KFEZ2P9GaHcYMlWkrf7WJmHFusVPyMcgZ2lb6bdsDJ6JF
 AnEHO6sh9GRCNJov/G9xDJJ8KLy+DDPZ/lqDpjSwep6tO4oqFqjL7d2
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6zw5WKLWnEIF
 ej339BOAIqeIqZzfaSMqNv0MIgHxnsfTh7WL8T6hQ+lspPo315T1SDRKIrvJZlwK9xae8C+XjGQ
 h4FXpoOK7b93WJIVV38wElPFGVZj8NUnGiqA0t8YVbrSYdGdi4Aycew8z8SBe4OFHyi36A3AHP2
 oRz+G6ysnOz54ssAQVV5jK7ZFGnUMmO8WEZIaEntKHL0H98qr4pLvIve5wU09WZqXLr7UXgFiU0
 7m3JhhlsPoQvJ31YSzl/DlNEf530SuVS2aOCpji5peircqYYg2aE4i0/OA4v31FRtKGU8YuhTB0
 jlXaDUE472fqpkELKE3KeOakbtfADYrlDJi5vT7VRgE38iJgRNs6DeY51zsR1MjG9gOMCl2vfc4
 sSQOybLEeiame6XVSGqOod49OfO0HA==
X-Proofpoint-ORIG-GUID: rzr0uVyWkJcVtFXTw3XOD_p6ovvdzkSl
X-Proofpoint-GUID: rzr0uVyWkJcVtFXTw3XOD_p6ovvdzkSl
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec982a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Enable static TPDM device for lemans.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..3646e2347068 100644
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
@@ -8256,6 +8347,20 @@ arch_timer: timer {
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


