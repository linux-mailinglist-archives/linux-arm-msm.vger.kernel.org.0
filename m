Return-Path: <linux-arm-msm+bounces-73094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C3B52D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7653A807DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041682EB5D8;
	Thu, 11 Sep 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqcB+gBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0D42EAB66
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583464; cv=none; b=XiDe1LmnqcCOqnk+xxI5YLqw3T7asX9SbMTiJ3lohnqaY8oVT/1RWA/QlwpxGc7oy/VOeU0ecjmBhYUvsOr+CKBmBLdxJP5zJX6GyQb4FGGliTJmhARmg8DiJUAZ0QnVDnXfihH8BOIUJa4YJU4H9JHlb1YFDCzwwyn/rajQfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583464; c=relaxed/simple;
	bh=L+PwKAgWtbu8sGdlpwaIwc/cd28U0PqRE0W3q0+fCYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQ+tbOFqTq6CF7Haxe8PnbSh+UlwmdNM4WfRIFtKDgTo9PW/vaZMhKBn774QEDMXG5r+I8vnKbVLkExDGSvlwbKmW2w+yTLRPK+nMrKJ9YT38VVj4Sav53WrTpNhxMh31TUgEcle5zHif0UBOn/bvhkr+UklW4G4zvneaZat3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqcB+gBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2JNjX003526
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3UHXqdgFCGeqIB9S1HebNikF2UsfUnlUORJJ/kjR8w=; b=UqcB+gBeJWzGfWEp
	2xoLMKNsvtDEBHy5j0vC9yjv1TxcrgdSsqH281dQe5dTInW1Cp5EzyxAenbUIs52
	8zjKMspG2m650NJARK8kovTnmrnupT4huzn2dDc6aPFEHtplck6XT2ctL12iGZ/g
	gHcdeEAcENoDW/FsVHSD37rk3FT0p00stNjI+mWLo83AkIcjxIFg2lkwok9OOEyW
	Y680QfIb/SF9J2QTPZFkTuPFAjHn/PzrsXp7BaQVLYRzaGRCif9iXSUHbu3cYPOf
	MwiCJORpl+A3ZbH5wf32OZ5iWR4I8i49J13U3vgpB0NZptWA8ooB0AA1ji4N+8y6
	27VsXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8q5p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b522c35db5fso421436a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583461; x=1758188261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3UHXqdgFCGeqIB9S1HebNikF2UsfUnlUORJJ/kjR8w=;
        b=OrbJksTL+52JPE5FDLESb+DvJaSTaG68zDo0r828ar/1DOIHp+/MWpc1Ksz6zSr5Yf
         qXCB2uwrU/2P6q2OXi25zGqDvg9FXKP4qyLCyn5ibMxOeXjQGAD0v5FR1yUqUyATXwHD
         /w45O76vviAjH+55HZNX3+xgdmGzeVNYMlu0AiPyoenKfhkl1do7RTKLo42ftxIXgRLh
         BxOkHw6RngafoKBZOHTem1whSWplvomleRn9Xn75tHnhiWVSsPbMH0ZSuM5Y5qCb05Ct
         gPGY8jdlApLxw6W4BrgDo4O3RZwn3yeiPpTOhcvjyjLENrf4MOnc60Kzd3sjiygAeDT/
         oxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDi31WNvz1z3XJQFW60YhZ23ySpZfWigAc2BWiQzgtcdYAyedQ8rRwnBmzLaEASq7HKkbTER6/MHkm74eg@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYq6FPD9EiWmY1ed5B+f2ITtL+St0ELXbCLbH80ZAMpYRKO5W
	3f3ysWCEXJi9Ly1NZ0yQuJNWAb1vQYBAWK6gdDrtE3K6obPnAjufZSvfMBmDrETIuH1K7DYapMK
	8cVmeWVg8lkJ+MJnXrLia/kn1VCNLmlAnBztViY4LCP6T6mF8AiDHLAimE9TbkrFxPRnU
X-Gm-Gg: ASbGncs+wnnVy9mVHxclOAtbKSe6VAlBFn6QR4RPnIU1rFWQzpsCrtrmG/ROPRAJI41
	FDi/ya96ttzxBExQkzy5VjQuvQaR5pz8Pp5fGWZYadzEfWOlQyZIVDjERoD3lmRVEsCeo3DHoHC
	cvHoig8G2E1YtdFyJ64xGlXswHqGWRuQf5z5TMt0Y3qm8OWQtCKdXK9v9+g9/yUfm9ijB9rtyl7
	xA+/FQTlGJbAvpywPNNwylP8CeQPCSJj1PLei2r2jJioxH6CMHn4XsM24DVWGjPVY89enOga4bJ
	PSTdD9sYagfnV4sa8RX3udK4hXHcVATTkYiSZ9kdN6n4f0a8UszaGkIh35d2rxzCo0QQTUOgFqY
	0GqdZshFwFnMXAlWTQmTSMDxNDI8=
X-Received: by 2002:a05:6a20:7fa5:b0:243:f797:fdf9 with SMTP id adf61e73a8af0-25344415f91mr24187334637.47.1757583460648;
        Thu, 11 Sep 2025 02:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu9YOZsZOuJnUdWvgFgmY4PYUBMxZZD9lcxoU+0WLLvtqymvqPqUK59rKHJULHd4TVHHP4NA==
X-Received: by 2002:a05:6a20:7fa5:b0:243:f797:fdf9 with SMTP id adf61e73a8af0-25344415f91mr24187289637.47.1757583459997;
        Thu, 11 Sep 2025 02:37:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b730sm1512930b3a.15.2025.09.11.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:37:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 17:36:58 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: lemans: enable static TPDM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add_static_tpdm_support-v2-3-608559d36f74@oss.qualcomm.com>
References: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
In-Reply-To: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757583439; l=3216;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=L+PwKAgWtbu8sGdlpwaIwc/cd28U0PqRE0W3q0+fCYg=;
 b=JcA0QLGXWHd2kmediDYKM6VhiPirq95RmC0532BBjaR7LcUdf+hREFHNt+hWn626tRjkb4ZK6
 EItpJudDx5sDOWxLvv/Nf806J0SaxvcxjE58x9KfA2eIAviJyDz3W1l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX3PcVhOUlCY66
 YdkvYWYjc/WWuoDWEo3RzjskGZCOsc3F+Pa4CSH/O4IIXi40BfSlX3Bok+1SGMj5g+9MrYj5OEL
 xo2RDtFTiE35qn4inXS0Skm+VV1XSqqAAJdJQiocbaIsBKu0bmThXcKNY6hj+WXOQMnXpmM4LyK
 aTYxDv30ONda1XXhYS+zJ9RspYF9j68oSEt+xs1m7Q35TvFXXc6pA7zIfulFrvI2OTc000RTzJh
 femg5W0QP5TB4/B/fNXWaAPVwndiOy5IIyz/JjUEK4PAkUSqOOe6h6/PAsZi4q38Fl838LlZ7Qh
 pTFAZgyidH+YjLQBcaSuar7mDX7L80zcXFazHuNQbewcvsIcMz69eWepO/l+j2tOl6CfCEYPQx+
 RjvfwkKg
X-Proofpoint-ORIG-GUID: tYTWjoXAX1R0v3_o_O1vyMp9bT1cEVEc
X-Proofpoint-GUID: tYTWjoXAX1R0v3_o_O1vyMp9bT1cEVEc
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c29866 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_1kJojZ1I3LL_-Zbm_IA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Enable static TPDM device for lemans.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fd6eb6fbe29a..c3de6e295af9 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2960,6 +2960,14 @@ funnel1_in4: endpoint {
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
 
@@ -3117,6 +3125,60 @@ etr1_out: endpoint {
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
@@ -3389,6 +3451,35 @@ aoss_cti: cti@4b13000 {
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
@@ -7703,6 +7794,20 @@ arch_timer: timer {
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


