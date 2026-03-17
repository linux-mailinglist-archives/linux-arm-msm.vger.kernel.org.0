Return-Path: <linux-arm-msm+bounces-98074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GTCJgTvuGnflwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:04:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FE2A4329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 858D4301A2FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E492330B11;
	Tue, 17 Mar 2026 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKmBR1JV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dir+BAT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B237EFE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727491; cv=none; b=Z1DIYC+QvoOe9e33CpFsufFK+YG4kkFZeO984ADdM9k8jt37tWTwfX2epO7+iFgb0cFESNup8bSSlbzYMPl3J/7ZBA+QRtqWPORTZuf2IZq+rQ/PjTI9uCJc237hllH8fWnPfr4a1GoqOJs7DO3HMl10aw0qcJ7ZxL2VQFmxmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727491; c=relaxed/simple;
	bh=GEL+TA7V3NdHVj+Mv3DZJSo4L1+dX9066zDxSvGYUJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+b17VMmwyhjxlxn4f6DIjxhqGg8B9NIbjBtwZtw6OFmMiaGnwjBKEQ1Hu7uirBttnLbqDECWJ4drqar6zLVUi0j5ogFlvnni57LdM/8py1vFakqInUTT8NKJT6FH1iahX4kXAxUe3DryDTly6igFfbWIrO0naynPk1x/h/o0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKmBR1JV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dir+BAT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H0uKSw795536
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DERtt7TyXgd+g0ZMZqU+Y/Q1lHxmbzjGdT7GXyAfz10=; b=VKmBR1JVBwkWnsOu
	DoCpY7Z+gZjo4zMD11LDcNEaMcRJ7yoAzUBsJmy3HFGmLTVcQ6k1tvu3JIRB3+q0
	EOwDrPZIxhoUovn/xRAf+ciS37fmSjTQFowhUdbE2RjuweQXVjKq0buw7rkNOoBY
	HXzsgQ7i22IZR7FwQo7d3aG30YdkoPZzUqkScRSUmBBbisPagI3lP/+P9vzk4xVe
	1PLT1+rxag+IdA/EjN3CKbhBACle7VVK6ktHDVzKBkaJnTZkRQBz4jaMX1hqLmC+
	3r8hEdmu5P1iR7uCZq47MnrCCPEywRkFarCkNTs8CoiASxiso/v7yHm6WiLR58Wo
	DmNoUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm6d2mt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab017c21e9so32844995ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727488; x=1774332288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DERtt7TyXgd+g0ZMZqU+Y/Q1lHxmbzjGdT7GXyAfz10=;
        b=Dir+BAT6FKLdJ0abZG2mDXNoJ396GFHklu5VjI5vpo9LYrIb3SsDHpexSrw75OYwQE
         mGYkGKJ2QhZFnswVSNHZX8SQVOgWBD2vuyc0UkMJHlkldGbLo2sBLWuq1VbD9S+US2Ly
         Dcos2NClyIazkukVlFrUZum8ZnZW3hMJdnYvweYBc0QDDE5voWeJzx4dSzsNuJPZRq1D
         coP0vPcbP7feFCyWHzi5BCC02dsNYP6lbtJWhYworpDyPJlqWCAnen9dmtgR/ucO4QpC
         LeQSsIX6DzLfUOk7iXa3DrSnbotAh99CAGaQZSF5OjwED/CjAChB1H+W0gMF+nfJ1Cq+
         +yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727488; x=1774332288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DERtt7TyXgd+g0ZMZqU+Y/Q1lHxmbzjGdT7GXyAfz10=;
        b=aQSxaqdPJqgiLKrsXZeNUMsXlMYVhM0T3qT91DKkos/wtb7zwQ/m2DFBNiDzIkbCU6
         qOJ7v5+zQ6mhpSH//74uTE0LqDxFAFLMArCAX/TsgVbpejp2UGGy4/XUeQLLHNAmENRB
         lZAgVQilZ/cXOgo+/Oq0wNHQV/3qD6b+kYg8vBBGV53qmjhhdhQ4ReTuU3aj2OdUzqVO
         0oRksPP3lvzHfs3svRkfSszyj4q/s47UP6HDOjXK4/XVfEuQFv6jdyputtg5Swbl6b/o
         rAnAurQahfLG5w+jSDrswv9F08ai1L/Or7chwcYTgtvuWTxJIqrfSYRiKuk6XvlUWQR+
         ifsQ==
X-Gm-Message-State: AOJu0YyA1zyoYRbg3wX6GxQ8qNF6PI6gGV+IPN/oJMNbRQBOs2caRurY
	GlzcWhnd9aDVfRbI1sS3NLLf7svjCZmSvDWyBD0aP17OJoOceEK9oWIk0LKS+rkhFc5sMZjZAD5
	AWr1C9gc+vX2omJ/Ft/BbrSIAzBxAf2LGoPnuHVD8E7Eu1bpNvbjDVX8ORp7n3Ba9fGE7
X-Gm-Gg: ATEYQzwSh3SrHxy+qU4QKoWGsQ3wC4eptrPqyqv9UCrpPo59U+NXgVBZNM+KCq3BEZ9
	QjKPq0v2wCEK9ZtLu86OjkiP0xpTc46Cq+D2k17EjmvMsPLO2k5KyMxJGb0kePdQZT8Vo7nzNDu
	K3kFtpKxKZiF+ndk7FSwfBySfYVwZXqPB6grCP0rG12mo7u+XY7Ygdq4C6h/Z2clh+r0InqJ1NC
	oPc5zbTO9Jeoh83YTwkdtstkA9o2U+X3HinYdFvW8NNQd03P5KhDtLMH8XmNE6mUmXzowyXcXGP
	wUTzMMrdcEzskb7ksyYBESVW/WnRUcQgGAWillUNSVcVUuXRh4g5pbKOihG+Lthv692+kCELmEl
	IczuTFUDDdg7dc76kc/FcMxgVxXAKr0MmQE/LKqfLIadLcivZkJEBlSPvPb01+iqJxog0Gvbvyo
	Tm0CojBlDDkd9ayNw46SThljfiqFvOBn/p3pjNI2hx9g==
X-Received: by 2002:a17:902:e790:b0:2ae:89f2:902b with SMTP id d9443c01a7336-2aeca8f374emr110172815ad.2.1773727487651;
        Mon, 16 Mar 2026 23:04:47 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ae:89f2:902b with SMTP id d9443c01a7336-2aeca8f374emr110172615ad.2.1773727487133;
        Mon, 16 Mar 2026 23:04:47 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05db37a8esm58125785ad.29.2026.03.16.23.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:04:46 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:33:57 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-lt8713sx_dt_for_next-v1-1-8195fa931ff1@oss.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
In-Reply-To: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773727478; l=3877;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=GEL+TA7V3NdHVj+Mv3DZJSo4L1+dX9066zDxSvGYUJw=;
 b=xdHWSUItY5wA1RifoyHqnyiom8sEpOKbWdtLgC4994XqFTKSXhqBYUSnai1Eu/dW1+ChAO32D
 g2aDpAB7AoOA1jXzJaErSsov0kXq0QBDFlTdRmX1/h5oUPThelOv+9l
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=c7+mgB9l c=1 sm=1 tr=0 ts=69b8ef00 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ov8SyQ6_pS9HVYgZQC4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ry_txEOGmouS2EZe2BTpRNn35NavVUaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MCBTYWx0ZWRfX1ghGczsoNSBc
 Pd6FSBqbvu8NqAdv0DzvABxFoBhV0REkr7aYJAc/7JBIqrEakUYxoRuC6MUh0pysKFu/xmdJKAY
 dSFn3PtIVh89NsPpV/ICMW4ZqlxkpGu38TwTDuzdStEIN097eoZMguucoUbl2HX+mAUkXnCa2bL
 tLTydSlGTVX0yY0XkDj/gE7V8/cjMPRNfWNTDO7+IUHw/ggqUcln8Ep6sm+GxeiXdzTrb/JGOGX
 aWR9prZ+37fVg/nPoORgJp/WznDPAkLG4513KOH3qD0gGU0J7tuCqTdHNqFUAFMMt2mKOcEEBUk
 1y8s7RAq/HeRHf0RNY9IP9pgC03Lx4hyrq42l6gjXfK78EcLRFOL+/mMNzOrYPg+x+oWXkoBBxc
 b1QHnKtn65wckv3B2eM0apH6VHUznYFtBHHjOvZEUH3+0H1+SFmCPK/cUqvRlcPs0jL/mxQpD5f
 f2zUmiiI/2Xoaji8VRA==
X-Proofpoint-GUID: ry_txEOGmouS2EZe2BTpRNn35NavVUaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98074-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,f100000:email,4f:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 860FE2A4329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Monaco-evk has LT8713sx which act as DP to 3 DP output
converter. Edp PHY from monaco soc is connected to lt8713sx
as input and output of lt8713sx is connected to 3 mini DP ports.

Two ports are available in mainboard and one port
is available on Mezz board.

lt8713sx is connected to soc over i2c0 and with reset gpio
connected to pin6 of ioexpander5.

Enable the edp nodes from monaco and enable lontium lt8713sx
bridge node.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 0b26cc334a69..0ca5615c996d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -52,6 +52,30 @@ dmic: audio-codec-0 {
 		num-channels = <1>;
 	};
 
+	dp-connector0 {
+		compatible = "dp-connector";
+		label = "DP";
+		type = "mini";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp0_out>;
+			};
+		};
+	};
+
+	dp-connector1 {
+		compatible = "dp-connector";
+		label = "DP";
+		type = "mini";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp1_out>;
+			};
+		};
+	};
+
 	max98357a: audio-codec-1 {
 		compatible = "maxim,max98357a";
 		#sound-dai-cells = <0>;
@@ -355,6 +379,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c0 {
+	status = "okay";
+
+	bridge@4f {
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt8713sx_dp_in: endpoint {
+					remote-endpoint = <&mdss_dp0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lt8713sx_dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt8713sx_dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&qup_i2c1_default>;
 	pinctrl-names = "default";
@@ -483,6 +543,30 @@ &iris {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&lt8713sx_dp_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -531,6 +615,11 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&qup_i2c0_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index f92fdb1cefa0..5741cdbde3f5 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5893,6 +5893,12 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			dp_hot_plug_det: dp-hot-plug-det-state {
+				pins = "gpio94";
+				function = "edp0_hot";
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1


