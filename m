Return-Path: <linux-arm-msm+bounces-82068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 592ACC632E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 10:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7243AB9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843663271F0;
	Mon, 17 Nov 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDYBwVoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYolOzey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691083271EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371919; cv=none; b=spdXPY+HmSnrwiwzDjtGh9jSpOmvZ7cKFUiWyVhBbdG46wIr2q0XWbWeVw2DR3GTCqDu1wYJql8jNfGfbg7Z59eWlGYutt5KppRtkNTHLnGd0IK4P9DKycxdwB4aEbWx6aTPWCi0T96i+rseOgy8smYaGHgQzwVHAKhyEbj9s/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371919; c=relaxed/simple;
	bh=GOP14jDa0hsU31zPD3/bsMx2iXw35r0rAxbfPHHNLCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wvgj/TEbP7oOorifvylzZy5YjIszIQsqfB04jJxHmNfv8zXMJx4Hwc2ulYGJ0mf7yNmptyHT9rhLnCGR6g2QRPnKdEmLUyIFPJAimCgX0/EuKOVZuq/4S47zWhhBvTLPQN63Vfb++P/TcAUmTmoygGtjEqWC9YTgI1YXv43p8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDYBwVoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYolOzey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o54N3189685
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fsur7inmpfTVNHEZV2Iuhi
	2M7owvxiOcnenoppk10Ps=; b=GDYBwVoI4Y3Q2fQHMOHaUOb3sAg7Vd40/fZVfX
	2WyeWbJS7k7wJURAZaTEzpdoTrOb5Hr+tHfUT0A5JAVUDMeQjdSVe9kEMHt3vZTK
	IRV74FYQRNOjQepQZ+3dz3m+dUQBqs9VFhgbtxwsgzTFH78/e4PonfHD5QdBfQPs
	r4MHQKFvgnjPlZRaLH/DCGBnyq/+aa4opuTaITqob9N/ggVxUEwvmUicPKVVU/y9
	570C/ES4ONkFjmvHM1N7tLoXsCBPwsYBmG+QEpHv+VbFTj9fGUjYlU4apruLdViE
	W+LOqq3eU/xWbujGyChpSJ507PXingavnrNfWA9Vc0JwfWyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmc4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:31:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so47338385ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 01:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763371899; x=1763976699; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsur7inmpfTVNHEZV2Iuhi2M7owvxiOcnenoppk10Ps=;
        b=KYolOzeyv89D4cJ9JozLyrUb1LkCXz6MsTNWNw/swMBgfaT0z8oSnF6ZuC/Jn7SMLo
         bxU4PMTSYIlbiNRKi4K39g8DbqqOon2XvtJZiIS+fhlf+NUZAPbw2E2iyUrksln6aQCt
         pok3CCTWaxJn3fuYuVbUXTOC+zpe9BwQX2kv6YsICjUpBtlHqxpCXizVhr0Dq9GKDb0M
         6cnVQIJxL7P7v2QQvHN9QOFV5GwHoxhs/BWN02mNWBxA+Iah4l/D1vf2i0fKafRdzaIL
         D1X2QPkpOflS3fzu9L0d/vLVfsFNh0O7/CIKUxNu1bX0GNHahLVd8KkoSId7nM6R/qmM
         eTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371899; x=1763976699;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsur7inmpfTVNHEZV2Iuhi2M7owvxiOcnenoppk10Ps=;
        b=slgQRzFaJJpvSk1SpnKhTv/1zO/6d0p5xanhKwIBYvGmVld45ZQ/5eYV8HUm/p1HMn
         XfCEcKoLDTVzDxqKXMHFwQtZgMcL4QAV4SCdkrjvOhhacGlmHPP/j0S6QkPMUhKO2msw
         zzsU5T6pUv9l5NtDHc2ewSguXstjs2OizUwYLHma7nI9w8sGDagfzBLgdxc4vUtr03uc
         8Niw51nwnyAt9DBrwNmV/bK+PjUxTe3eLEKy35t0LyZpi8z2G4kApewelUgTSrxgv+h7
         EE3mHqFGQ75LgWFbajDbAB1nekECgXTjdil3ZWOquM1si5ljGckI+/AUjkjZ8KlP3hDg
         IrWg==
X-Gm-Message-State: AOJu0YwxA6VAFqFJWpz0hFP6CNyrgieRZcwfS0Cqu3U8+Xk2uJR63CQo
	QoSOzDf1xJiZ7UgvjaYHQbE7ITEOq01exrLsl/NUtEhFOUFeAISoYaKxKcK0RUTt2zLZVuFRMIg
	iBHv8AQsgW4ICPT5UdTpXSIIq5leyB7Jg6oNXVFXD2ZjKhkP1sBshs++ZCNqsMWjYQo33
X-Gm-Gg: ASbGnctIWVOdSbsSqLzLZc/YrH5+Nt/M4MXLemYtqhQMqgu8TMWT3ui19UTOxCnXj9t
	QiIvHKfxTZfP7FqaOKVAjfzMCAeeLZGkPEmxn3JoSIVmfaWENrVKVV0zD507WwwLhFNrtDrMp/N
	xnx2GzdY4oUuTXKwItrf9vuMq9rOWmF/eQdO1MZxqKnskCBsT6drDo15GtqGQmxgWNUVWKphBbW
	5WNriCQmptMRUw9ohn2P0j0rLS9WAew04aqOubEWYjq+v7xUxWxAKzCZqlYQoEggFw6aDdnxSIl
	D4u1GOf7u8E9Z6iyhELPez96He7XqiLy6EH4EsZMVdbtWP6ouqMNw+j+BL9DbhmVOdd9yvGJFmT
	ezGuyUziawfL0BbJLmho5RJ76ELOKsW8NkV86ibAFkLcikAw2Np/xYqus3Flr6Q==
X-Received: by 2002:a17:902:cccf:b0:295:507c:4b80 with SMTP id d9443c01a7336-2986a77cf82mr140358515ad.61.1763371898577;
        Mon, 17 Nov 2025 01:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc6l4uzLMrOudgt4wCyb3q+kFuzvkup4/Df/c155evzn0BpZP5g9sQko70vmj5eyg2pJ2mpw==
X-Received: by 2002:a17:902:cccf:b0:295:507c:4b80 with SMTP id d9443c01a7336-2986a77cf82mr140358165ad.61.1763371898017;
        Mon, 17 Nov 2025 01:31:38 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed5asm134038365ad.88.2025.11.17.01.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:31:37 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 17:31:20 +0800
Subject: [PATCH] arm64: qcom: dts: sm8750: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGjrGmkC/x3NwQqDMAyA4VeRnBewBavbq8gOoYkaNlpJZAzEd
 1/Z8bv8/wkupuLw6E4w+ahrLQ3h1kHeqKyCys0Q+ziEEEYkZszVxHXdDiyVxXGphju96E2YhhR
 7njIluUOL7CaLfv+D+XldP78R4LRwAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763371894; l=20097;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=GOP14jDa0hsU31zPD3/bsMx2iXw35r0rAxbfPHHNLCY=;
 b=knJwfi1uandjFBFXVbP02uVkxviEe0lfyRj97jaskI2I4UO1Rng/T5ltjaDySeT0IcTEYGtam
 oCrgLadJpvLDgLEOY9VKeZzbQadzZqxJhGyQa/mrGPonZZfPVaBy3ow
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: mXjEPXjtC_NnLngnwHy-QkPo0M3Vpkjd
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691aeb86 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cBs17hJA0ggXsJKGOPcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA4MCBTYWx0ZWRfXypA/9B//JVPr
 YTOcWf/rVklM0dPr6Emx0BDvOqL3aKafAJTGqCYqNFALjv3c6PtThfSSRsI5ixw1IQtNmKC6PeL
 b5zlTS2wj/VVLSMhA5sYxXFqipUaD8dpoJqchtcuVZ+38C92lPGeLOzYibRtf4rZZzm1rk5WyJL
 +N2yPZ2AGVbU831ZSmYtoSg/qsnCx+a176RnuJwGkZkzr5GRRnXYLXSvld98Yp8PqutWeJNgFmA
 4Z9kFqwX07kjf0aZv3dNLcvVoyU9gJ6D5xtPjLe9CDtmRT4ZM4ykAWeQexIIw6mHu8vAMn+gqcH
 wywl5eFfWsomYCAMyEey1eN+YjDt0DpoOch3GuZ3uxYQlk/IjraytWVc4fsmzu0Owm9dBHwRjib
 V+VKB4o9QJEyGHx+xYQlzXcYRKgILg==
X-Proofpoint-GUID: mXjEPXjtC_NnLngnwHy-QkPo0M3Vpkjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170080

Add CoreSight DT nodes for AOSS, QDSS, Turing, and Modem blocks to enable
the STM and TPDM sources to route trace data to the ETF for debugging.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 981 +++++++++++++++++++++++++++++++++++
 1 file changed, 981 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..56c2605f3e0d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3313,6 +3313,948 @@ tcsrcc: clock-controller@f204008 {
 			#reset-cells = <1>;
 		};
 
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x37280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
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
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
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
+					funnel_in0_in0: endpoint {
+						remote-endpoint =
+						<&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10800000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_modem0_out: endpoint {
+						remote-endpoint = <&tpda_modem_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10803000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10803000 0x0 0x1000>;
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
+					tpda_modem_in0: endpoint {
+						remote-endpoint = <&tpdm_modem0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_modem_in1: endpoint {
+						remote-endpoint = <&tpdm_modem1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10804000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10804000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_modem_dl_in0: endpoint {
+						remote-endpoint = <&tpda_modem_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_dl_out: endpoint {
+						remote-endpoint = <&tn_ag_in13>;
+					};
+				};
+			};
+		};
+
+		cti@1080b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1080b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@1082c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1082c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_gcc_out: endpoint {
+						remote-endpoint = <&tn_ag_in17>;
+					};
+				};
+			};
+		};
+
+		tpdm@10841000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10841000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm@1084e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1084e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_bcv_out: endpoint {
+						remote-endpoint = <&tpda_mm_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@1084f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1084f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_lmh_out: endpoint {
+						remote-endpoint = <&tpda_mm_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10850000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10850000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_mm_dpm_out: endpoint {
+						remote-endpoint = <&tpda_mm_in2>;
+					};
+				};
+			};
+		};
+
+		tpda@10851000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10851000 0x0 0x1000>;
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
+					tpda_mm_in0: endpoint {
+						remote-endpoint = <&tpdm_mm_bcv_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_mm_in1: endpoint {
+						remote-endpoint = <&tpdm_mm_lmh_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_mm_in2: endpoint {
+						remote-endpoint = <&tpdm_mm_dpm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_mm_out: endpoint {
+						remote-endpoint = <&tn_ag_in4>;
+					};
+				};
+			};
+		};
+
+		tpdm@10980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10980000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_turing_out: endpoint {
+						remote-endpoint = <&tpda_turing_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10986000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10986000 0x0 0x1000>;
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
+					tpda_turing_in0: endpoint {
+						remote-endpoint = <&tpdm_turing_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_turing_in1: endpoint {
+						remote-endpoint = <&tpdm_turing_llm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_turing_in2: endpoint {
+						remote-endpoint = <&tpdm_turing_llm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_turing_out: endpoint {
+						remote-endpoint = <&funnel_turing_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10987000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10987000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_turing_in0: endpoint {
+						remote-endpoint = <&tpda_turing_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_turing_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		cti@1098b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1098b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@109a3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_pmu_out: endpoint {
+						remote-endpoint = <&tn_ag_in29>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_dl_mm_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a6000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_north_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in26>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a7000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a7000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_south_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a8000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb0_out: endpoint {
+						remote-endpoint = <&tn_ag_in30>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a9000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb1_out: endpoint {
+						remote-endpoint = <&tn_ag_in31>;
+					};
+				};
+			};
+		};
+
+		tpdm@109aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_rdpm_cmb2_out: endpoint {
+						remote-endpoint = <&tn_ag_in32>;
+					};
+				};
+			};
+		};
+
+		tn@109ab000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x109ab000 0x0 0x4200>;
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
+					tn_ag_in4: endpoint {
+						remote-endpoint = <&tpda_mm_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tn_ag_in13: endpoint {
+						remote-endpoint = <&funnel_modem_dl_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&funnel_turing_out>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tn_ag_in17: endpoint {
+						remote-endpoint = <&tpdm_gcc_out>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					tn_ag_in18: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					tn_ag_in19: endpoint {
+						remote-endpoint = <&tpdm_qm_out>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_dl_mm_out>;
+					};
+				};
+
+				port@1a {
+					reg = <0x1a>;
+
+					tn_ag_in26: endpoint {
+						remote-endpoint = <&tpdm_north_dsb_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					tn_ag_in27: endpoint {
+						remote-endpoint = <&tpdm_south_dsb_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					tn_ag_in28: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb_out>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					tn_ag_in29: endpoint {
+						remote-endpoint = <&tpdm_pmu_out>;
+					};
+				};
+
+				port@1e {
+					reg = <0x1e>;
+
+					tn_ag_in30: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb0_out>;
+					};
+				};
+
+				port@1f {
+					reg = <0x1f>;
+
+					tn_ag_in31: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb1_out>;
+					};
+				};
+
+				port@20 {
+					reg = <0x20>;
+
+					tn_ag_in32: endpoint {
+						remote-endpoint = <&tpdm_rdpm_cmb2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel_in0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@109d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_qm_out: endpoint {
+						remote-endpoint = <&tn_ag_in19>;
+					};
+				};
+			};
+		};
+
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in7: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_aoss_out>;
+					};
+				};
+			};
+		};
+
+		tpda@10b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10b08000 0x0 0x1000>;
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
+					tpda_aoss_in0: endpoint {
+						remote-endpoint = <&tpdm_swao_prio0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_aoss_in1: endpoint {
+						remote-endpoint = <&tpdm_swao_prio1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_aoss_in2: endpoint {
+						remote-endpoint = <&tpdm_swao_prio2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_swao_prio3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_aoss_in4: endpoint {
+						remote-endpoint =<&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio0_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio1_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio2_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio3_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
@@ -4239,4 +5181,43 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	tpdm_llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_turing_llm_out: endpoint {
+					remote-endpoint = <&tpda_turing_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm_llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_turing_llm2_out: endpoint {
+					remote-endpoint = <&tpda_turing_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm_modem1 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				tpdm_modem1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
 };

---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251117-add-coresight-nodes-for-pakala-65620d8ca6e9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


