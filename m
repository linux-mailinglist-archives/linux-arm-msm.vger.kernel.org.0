Return-Path: <linux-arm-msm+bounces-80224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E9C2F65F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED2123BF081
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EEF1FDE14;
	Tue,  4 Nov 2025 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhecz425";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbtxhwmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF715E97
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762235315; cv=none; b=pUhNXLyQGs+v7SFp1WmZ1zK30NjbfHt4u9dVGBAGNqHjfdaggtDWTszNsyDSr9eMJFdpSOrKbxJ/kGxvS+tFkqZccF5BmMNCo1ke7ZWp0OUWG8k2NpoKGGKyEhIv8Lqq8CUCjj6uMyWpjtchYwpFYlADO1YXq1NEQvLR4CNZ/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762235315; c=relaxed/simple;
	bh=FlW1aOjTf4xl2BlrTW76ulryeTqWm0fr1UPtIBcdtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FINqSYpTm0eN9fS1DhRqV/R35vgWm8bn8XH0NPwWrMoplmEZOTgEa4TF4jGbX9WeOsbLYWHOkbtA79zZUrIEj1XBXyH44n4zU5s8Y7ScL7+MCwbTsaxI7bMcwqaNhz4qLg8/oARTkBlfEIcf+7JvVLlAItBXOFqYEHCjBPrhkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhecz425; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbtxhwmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43BTqD3667725
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7XUgbGxUeYfwMdWobN+mqv
	uwwkFaVgsaNY2NkKT3Euo=; b=mhecz425nJ77mc3i8VDXO1qWsflx3O0wOAeOkq
	3ar8YafcGYETFA24cslEEZjSW5xJlno7jYR0VZ/hwJIUcpJf1h5J2ouxgOC+n/1x
	W0dMrJjPj4IoQwGCiBdJKOHx80yfRgOJvz5da2vP8/vt4OCm50MT4hXbjBaq6/Pw
	3S2FkPiKeOLGB18fC6iDbDeyogKWvuBsueoBaoWB87jXHb/leXJo+MWcFJBR7oCP
	G2FjK9tiAeATUUb4j2aHrIa8A+rZjtANTxIpJtN2v2evenZI8+Mn8SCaate70/YW
	nUdQ81l/j23JtBizllTozLagwVnZgKtiMQGLA9xQydPhHl/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffhta6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2952cb6f51bso97366555ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762235313; x=1762840113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XUgbGxUeYfwMdWobN+mqvuwwkFaVgsaNY2NkKT3Euo=;
        b=dbtxhwmdVTHx5IgogXc3A9o4hj/BNQqKJ1pcMWTTd6xsly76cUJ0JMvjQQpzLiUvzo
         p6HSTgO7zrBgvPtE65LoJj0OBh0CiwOGm6yrbG8bRDn/ZsVj4so3kqptRBokoRTbDuQS
         97BxbAVcxcuoWI/jzhiEWX8tEs5D4ssY/8GAOuWI6EefXddm0W2oh4IOYgX1lAEwfoP+
         DIPtVS9hr6rz6tGuUSWlVDI0vcEjIYheA7mKxWS3EQSmsjLp1djW+lnI481bpYRwuHPo
         q7HuYn/f9cIUvldbauL7Iygs3U7JoerY6m1bF4yboAU0IoKlae4K7tBGLOvS0WbNvkAF
         Jxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762235313; x=1762840113;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XUgbGxUeYfwMdWobN+mqvuwwkFaVgsaNY2NkKT3Euo=;
        b=M9RWC7fbnJLGKTVcE0QkqoxEWAucfYFGofi8cRagMsTdoQ5I4OJFTgZuNhYTMf9Tv2
         YMUoLPE5eu4TnGK1PW9avJSObomHC1x6oM3QphsqMGwHtt5qBmJteOFiPTDUNQsQPXKk
         TZTXeS78OFOTWOdq/iGXpPoFpngfUpbtpg6FFeJHNTe8IchsIBmIHWTIJTUJc4SvB7LQ
         19U51yh/YnGh6tsP8cVWpe3A/PXuCkI55zU2cGLynHKHPV7j6sNR+BFSnZYiZF/hRim8
         LHGdDcd+TnZacYfVR+X37dNusaxBu9RzLFNCk8fmIo+bXOWq7wmk0yJPj3dpa2LdWFmA
         UsRA==
X-Gm-Message-State: AOJu0YxyBD863Ob65hu+/qphWGYqpqogKypc2pLBmy83TUnUspn4wrf0
	9+T0zJH7RaaHfGnLk5dWHefs6fxBuZUt5Faoq2jZjnEAfT8PwR+QOLEVikQjBA9wYK97Dg8Cgdd
	Gqw+2fkUNjKYQj37q+dWrZQgnx+N5EsJNxd+warym1vRY/eowTov0wio2Ja3775jaxq0K
X-Gm-Gg: ASbGncuCLIE1LPsIejnxdaww/IWRYcKc37jS/bX5FyaUbtIwQpECcSXYTMMIHdScI41
	X/gAsyY75RoqBWqCB1SRRsMys9EQHUUQFFctAevasfkKN5iFvtc2U4xaqvcyW5k+jtLFm/tUS8G
	7B9WJUxIw0k+aA/vtLnDWFEjTKTaKpwtoIRmdX372W1TB6z3e1oRKayaIQE+IRAlYUTIuqB+WIH
	8OFItlYJJfyHfdfyraIVeJ+XsisSEMPW2v5OacNXvT6PfnWpGxdJHbqP08y26oX8jV/V9cYA0G0
	qWIzsle2Wv19X0dCdXnw2QnlwPPEY4F+2mhvGUEvmUFX7xVeT6+48/35zZnt0FW+4MWvH6eYNyh
	nEjiSezPoF3wveGta1xP5CpbMBnc+5AXOxdebub565Gdyi5k/csd7WTrRUzMChQ==
X-Received: by 2002:a17:902:d4c4:b0:295:a212:1c26 with SMTP id d9443c01a7336-295a2121e1fmr79205265ad.51.1762235312684;
        Mon, 03 Nov 2025 21:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtqKC3au1pCzSB25j/AdeQ54H4U/Wlk6HavEUNOzlE0+pVxgRTNfJSmpsTmWOKiEVLsU257Q==
X-Received: by 2002:a17:902:d4c4:b0:295:a212:1c26 with SMTP id d9443c01a7336-295a2121e1fmr79204995ad.51.1762235312096;
        Mon, 03 Nov 2025 21:48:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d174sm11895345ad.77.2025.11.03.21.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:48:31 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:48:14 +0800
Subject: [PATCH v2] arm64: dts: qcom: kodiak: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-add-coresight-nodes-for-sc7280-v2-1-c67fa3890c2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ6TCWkC/42NSw6CQBBEr0JmbZP5gBhX3sOwGLsbmEQYnUaiI
 dzdkROYSip5tXi1KuEUWNS5WFXiJUiIUwZ7KBQOfuoZAmVWVtvaGO3AEwHGxBL6YYYpEgt0MYF
 gY08ajhr5VhHapiKVJY/EXXjvB9c28xBkjumz/y3mt/6tXgzkOKq1M9ahbi5RpHy+/B3jOJa5V
 Ltt2xdqeACo0wAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762235308; l=7628;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=FlW1aOjTf4xl2BlrTW76ulryeTqWm0fr1UPtIBcdtYM=;
 b=o4quE2QbTzMhXzeIbV7aT5KruYRVvH0kSVoca7ZArut4HzUFbMkY6Ih7h+wvNBGeg+tVi943R
 L34tnvVVPjbDW2nS/uYTof6BhBve8nfRHc49T53q0xdrHiLre1CtMcu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=690993b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CTXohUMGNYBRon0rOZ8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: P9fVOJ3QQjmeeQmZr_5Hcrqd6DkmDD3I
X-Proofpoint-ORIG-GUID: P9fVOJ3QQjmeeQmZr_5Hcrqd6DkmDD3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0NSBTYWx0ZWRfX9lw4/Y0k8UDe
 mDjZv+z9GXyS1v5Yz6NtsiAUU3UB8sQJkKqfXq1zoNFR9AE1sTI97Z83wTwQSaBVVKiY5hoVhGq
 3L/BDLejY5e32mOEKIF1FXuKWhFkmQue+LHu0CENvxlk3BrVjLM7Sk1GerxbffVKws/pH4oMUk0
 4QdQD9xNgvKeIazEAKKcaKtArCkSo6fhO80udGPh+HofBD305IF/1wvTpXzIpb8XYDGXf5iTigK
 3n9W3yptw85maeyuRyeWzlUnR7nWPJ7yvNrakeh78nqW105h+WD1++x0Amglh8L0qCHpQXenmVW
 u3ThLmSOiBFU0y9bQsZSldVL9W/a5AsnlBynMAOs8hKsggaIYcz3qSkDxTedozIomKAd7bZB5vq
 uPf2Sg6BQB2itrnZ5TVn8XvfM/rDwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040045

Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
blocks.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix style issue for the reg value under the port.
- Link to v1: https://lore.kernel.org/r/20251103-add-coresight-nodes-for-sc7280-v1-1-13d503123c07@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 292 +++++++++++++++++++++++++++++++++++
 1 file changed, 292 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3ef61af2ed8a..ccbb57f77453 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3338,6 +3338,86 @@ stm_out: endpoint {
 			};
 		};
 
+		tpda@6004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1c {
+					reg = <0x1c>;
+
+					qdss_tpda_in28: endpoint {
+						remote-endpoint = <&spdm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&qdss_dl_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@6005000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x06005000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_dl_funnel_in0: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_dl_funnel_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@600f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x0600f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					spdm_tpdm_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in28>;
+					};
+				};
+			};
+		};
+
+		cti@6010000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06010000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		funnel@6041000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x06041000 0 0x1000>;
@@ -3357,6 +3437,14 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@6 {
+					reg = <6>;
+
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_dl_funnel_out>;
+					};
+				};
+
 				port@7 {
 					reg = <7>;
 					funnel0_in7: endpoint {
@@ -3471,6 +3559,38 @@ etr_in: endpoint {
 			};
 		};
 
+		cti@6b00000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b01000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b02000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b02000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@6b03000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		funnel@6b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x06b04000 0 0x1000>;
@@ -3490,6 +3610,14 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@6 {
+					reg = <6>;
+
+					swao_funnel_in6: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
 				port@7 {
 					reg = <7>;
 					swao_funnel_in: endpoint {
@@ -3548,6 +3676,170 @@ swao_replicator_in: endpoint {
 			};
 		};
 
+		tpda@6b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x06b08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&swao_prio0_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&swao_prio1_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&swao_prio2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&swao_prio3_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&swao_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&swao_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio0_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio1_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio2_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio3_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@6b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x06b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		cti@6b11000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x06b11000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
 		etm@7040000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07040000 0 0x1000>;

---
base-commit: 20e1dca0f0d16ca3f0937a5969a789addedc0f29
change-id: 20251103-add-coresight-nodes-for-sc7280-60ceb4dc274d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


