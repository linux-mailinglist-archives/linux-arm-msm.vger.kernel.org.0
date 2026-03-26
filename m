Return-Path: <linux-arm-msm+bounces-100025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDJkLPS3xGlf2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BCB32F1B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0590D308DD90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A20533372D;
	Thu, 26 Mar 2026 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9586yUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBT/LDH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A26364E88
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499638; cv=none; b=QOlXtoQgFZYiBFmSUVZ0sMj8sMnkOX7PIofUSLGyBRtwmPPe+GjEuI7Z3rSgdYpYvDsJPP2TkYBrvnAQZ0FwnhOeNn8gG1GPkGd82BqXMsfuDWBVSdMYTgD1Qhh0nIUciPPKA+dzyq5dhmHBDPTCuQPJd85Q1a3JNA3WoYmzR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499638; c=relaxed/simple;
	bh=HjlPUyMlex4k2VRgqs0fNuT1B7Qwy6NuN5AW7pzKve4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P745JMgY3aQnsN2pDf2h0tXS3318vVq7v1twk1zQFjdzPaUg/kFBz21kiHCF06tDL4GCgO7XZmKenbl5guR5qXcCNsUGSsaWpxjn/SAyCg5GUJWyrmdUVr60gPJF8SVKSrYYpYOibKh5DHx0WoKSFZutBQWz5L1yTJdQk8wUSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9586yUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBT/LDH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0lHBD3959048
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MI1Cks8bUmL
	+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=; b=U9586yUS0zpV9FBSBJKHPp3kzGR
	i1UpGQ9J/6ylpXYc/D7d68Fu37iBX8iRAYrP0eQLXwRIR8O8VapYsjSAJRCiNyZc
	+XwanJoOKEZx1btobF0YVTXucimMh+SKVrvEUvECmGPPjG/OQ+qIRSMCRj9IHnmE
	59DU0UV7fkqBUEvEGbObemvxghSqw6GBVeRWketPBavI8MTkcLzVSekcpbXODZCq
	yPsLE0lh7xvlYDOCrOGuJuHF3kIWEnf/PVgSe6EhM97vqMZiK5rTJvs5bXlp/vDk
	1FHLThGTzliA3dv04zOuiIpNeD1Azoi5x7wUOuE8cIrmuzZIcw/XT1Uap9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjagjjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0554888cfso8020185ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499635; x=1775104435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=QBT/LDH6ILbvPDJPbn4niWKrsLIVgHGDYzoYQ+WHXgKB7E9sjp798/NlT7eYGucBlj
         ovd20LBt/RuaJt4wecnsDaRCQQ7fG+dGAfN870pfqDZ8FwuBwcEID+5FWt11701VCsIx
         uiRSdj2kbg04GygiT7WCegIDL+FyG2WRG59aI3Lc0Q0MqXOF2EPXL/FLsyNHT9+u7oXX
         xq1p7yLvBQ/a0wGN3P/QAdQXHJa+nIFlcNidkXWqpdcEJ1+wB9lLDN9cTIK0SBuk+8M4
         OiaNuTKDcw6No/pfHy9EdhP+vFqQQExRvxznsAxfshJbuLpVZ58e2uQZeHqJa9hEGtgS
         JurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499635; x=1775104435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=A2UMuA1eiM6c1DV+3K3/yk7Z9rY2xkQ8JF5Z2XkDwJE2TGTSrU8I9N2nM8rLeJBrGM
         b8JSigp/6nW252EfdI+EHr40WZlzXqJwkWo8bCig9J1suVVNSLnr1feFux+kzVJASIjW
         PK4VZEmk1QsdbfJsmR90TjI1WTfDTCNpqaRz1fv10hAhAB2Ph/XCZvv1UyomHr4TZVsU
         A8blGXm9oXRJLNF0hp0h2F05B6wRipykbtwSJLAwPTupV3K67elDEA1zK32EBddyj4xP
         6GSS8yBPJWAqlTqtQbl+ejMVhBliRSc5rgrQCDiStfEzv/BZproVMahavq2gipqyhFgw
         tgAA==
X-Forwarded-Encrypted: i=1; AJvYcCUki0jD6nr14lEGmw4vNJ49sL+uNiP3FAD2NlWwm6HEd/hdyXZy0kd420WhG6YthLZeJhc25AAj8Mflv8qA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+PI1hS/NgB1jtaQxrohswnuyxTz17tCdOLvrZJLAuIOFt4+u
	Fn/u7B+52/WwryaWpQLy2r5YA65GKCrGhbJLhTK9gNjFv2mKpZ9kzdA2iE8DZDxo/78yYd1pWwT
	8KcIyTyb5M3mSFRbWuTt/DJ+iDFkO6SsDkhuMTRPPQnOwIqlMAcYg8zEHvx19wAAyQ/Lx
X-Gm-Gg: ATEYQzyUAJvO84u7VHNZtoRwJbczAmq/0DZ8Uq0OY03BdKaGH4aoXSX2aSXv4dsUMK2
	tNa0kI3412taN7j8cTrzmB83lcli3teAKAlK2eSV2PttYO+V3TzjT81rf3Ohj8FeuA13ZK6Kps2
	Il5s2eXTwzgCa6+ZNkf4vG88y5iOS+DZoAFgT12Ao5ku3eFOdlUgwL82903E+KbWBhysee5KLok
	Qbc/oK74rTSbuFBPtl6wpYPnsWEL14T7PUk4Cotq8hDGLaqWITRl/W6afTOhSuge/2KAElQgs/x
	uBrXBWUcke7wscIiGEed0SaPRAhFZUoOaiAyXUq1Pn3YrBxBnqSvCNScQb60rpFBmBimKz3C0Sj
	k4jyb8g7wPqwCi03VzxuLYwmvxWbnH9MYrBAimE5Ze+/cqblTDw1uWq6nby37P5qJ0CsbIXODvU
	EmOiM1LGuBkjlJewn+FEPV8MTULst8MiegmaeMkpVvYXVqOiP1lKo=
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718605ad.30.1774499634584;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718235ad.30.1774499634101;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:19 +0530
Message-Id: <20260326043320.2507890-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7yEpUG7D51eyYLrAHyCe3UmCEZAIke8n
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4b733 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7yEpUG7D51eyYLrAHyCe3UmCEZAIke8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX1EW3L4t9r4VR
 Lid2qp+wnaOhw15hvJCp8pFCYPVzINGZGC7ENrvK4sqYVJ9vPMF8PGlPE35xQ0bRAA/8RC2GzKP
 gqk31Ovp4lvl+UD2wXqdtWlOQ52Pi2dEkhx6S4vrsOExqlXPqZKR3PZOTusEaf9tNuMTtx7G7Qf
 DSJGiJRTb1+CmetAJELfwURwrV1z4FyEHmf5U7G3Ubhb974P5p7qmQEkbv39sH43TXBy3c5dOwM
 yEoYzZizJq4xmfHSbZ/wxeCxyv9cHL2eNVgHKOKDnlIsDJgU6MVmk9zYnLwNJtZ0SDFBqQsJGdV
 FJPOeHrNC/qNYYzS8Xiy0e5DiqO1u5D8b4b9zotStmHKNey7WyIRA1zkTe5WL+9qqlDhmbuvHHd
 RL+5EbM8FnRe0d/0gK7n5/hFd9OXkky+qod3HDxaMd53mj1Uy1QzB0et9I+KG2bZ1sFLWUo96QD
 X5I2hQGt9zESBepS1bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100025-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72BCB32F1B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..2173f187ed9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -619,6 +648,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1


