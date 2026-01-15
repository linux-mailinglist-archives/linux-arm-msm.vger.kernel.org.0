Return-Path: <linux-arm-msm+bounces-89109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A7D22A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A832D3014D6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BF52F691A;
	Thu, 15 Jan 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8xq6rvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ec9jVfHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873AF2F3609
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459768; cv=none; b=puDOsRR+4u2wxXeks6xxU97aTS5pZJX301gvtGSfUwl3prIV65lrAFKymv0k/HSWJlpZhesmxNg9IuAu7HXGivxq4mKPn3v+BXjiDG+d2sOjS2N7bhaD5tVIgSmJXC/wlg2kv8Lp2qtZNV/XMHydIH1KX/oP04hjp7RipqZNTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459768; c=relaxed/simple;
	bh=A5hAMQwqJqVj2zp8HTWJqmahVh6zYqir6Iz+YEG5VBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agQPpvG6A3JjUnFq+eQf99L2AvclUsGdbQm1z7UvnVMTvOZIGBsuW3eQ/3j86Vg3DIhA2lezt9JHAkkvV89R6Az42+C7cs0jqW8lmhHXkQpO46C3psadEg9OCrDMaGQ8EszN9pvHT5rtV6c2knhWVWv6zF3H2iEHfMJXkHO6h6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8xq6rvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ec9jVfHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g4ii1692803
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OM/kg+C6h//mYQ/pY6FFfOUZ8LoObTM+mFA2fBnZg1w=; b=O8xq6rvHKmWe4bur
	a6y4rMvfFVAyWZ0UqhgvNs8btUrmZfCfYn9bV0DqyyMTchLaByHBsZlUW5GcT29e
	zp50Sywk3ZrbIJODP1MDJajjc+t5YG3tbczXCdmnVvyiI3LPz4jjI5JY/Ek2Qew8
	xCbzCugOIxNVqQ64UQgeStwXugntaGrZBjvhyCa6A24tLzJndkLjwgdK87qjv/aU
	M5LbT72X/Lwikr0NmVPVa9p+jaet4QaQesR6PYXhme01eib7zSjiqzt6EHTTFDQL
	czj2BxLos2vMTldx2IRp8+cHRVSEP9gtLYSwaBj/7MQr3ZBa6FwcmvBkdE2+LV6E
	rKpPzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931km21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac39bd5501so656391eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459760; x=1769064560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OM/kg+C6h//mYQ/pY6FFfOUZ8LoObTM+mFA2fBnZg1w=;
        b=Ec9jVfHp4Bu5kLkKLU2Y3ynQy0GR70aifeqQjQa1HrHlnjEip8QOoOGji5vXz06uiv
         tioRq5xA4if5Q5u7CORiViyeSbETgbuXSNmkmg3+jJCWb87tYlbP4fyGIpSwnLs2Rwt0
         apLiCzzto70tbzP+URuGVx2U2WmwVVKO8ecZrq1tMUoA237RDfrOFwa6BjKogCcv3YiH
         nIpInEcftLgugUZ3fWzXV5X0plW1Q6hxmJOrw0lV+ojxlqJwddg1InTVAfNAQNZpUWq/
         Kgtgv8iGSUv5tjzcV59G5p0cUDrMw0ApKqfQmjah7vgMyAolkVJXe3KSJy9eyQ8HUPcu
         o0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459760; x=1769064560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OM/kg+C6h//mYQ/pY6FFfOUZ8LoObTM+mFA2fBnZg1w=;
        b=hq2sGW4L2pq/sfSfWVPSICmuDuYN/p2ydw1OU44vXsKv2SiRZa1AerLO/yNtoqSlJ8
         H7crAUkviYm9/ciLA79h09cvGzxevbVmWA1hQtSVpa7m5Ah5TrLn1aHzrjIEVRPhlebg
         NIQx4kvg5czTl6KTU6L8bwBFT1rKU50sg0WuGoFV66Ty6Q+m+/U03ZJPwpUWOSR/y8XL
         uc03v81J0O2ipJ/2/tAvfk4bXJ/aurX9SQSUq04WxbKiQ9oKGpyYGyzGBQzkkILLdx8p
         DO4SQb2xaf0b5+1j3A5/QP1QFc819cOVDgrj6vmnpL9PYZ9Q9KoSEokzvZSTbLt5hYBx
         Uepg==
X-Forwarded-Encrypted: i=1; AJvYcCVx8URwxYi5XRWjEmXZ1P7bhkiRCw/J6sCkZzKUbp3OVtTYxb7YUtJq7MmC/5PPwLloFWFj3/qH5aLldQ7T@vger.kernel.org
X-Gm-Message-State: AOJu0Yyve6PZ90+8a5T72T1xt0HuMsXKDvqGETOiP+NgIUMsSS4Gopnz
	o/a3IEk1KuO9ELeCrJvIAJmDYFehobixDVL5yeESsplEfhfGjMn/hTGGU7VAtk35DH1sU+2e6aH
	BtFivIsK9EAc6fi08gMvJYDraYhhACbCCNiZe5k0LT172ffJpcszKYGwA7dk2TpoSqGKt
X-Gm-Gg: AY/fxX5kyVp1mtq4akvUZMZ70pLNvfYfjby3ROCfArlds5jAiKWNCcRTDBYQeg0mhCh
	E47l+WTAp+uGn2kzLvhOEkYYT4kBph6eU86ww71C1SvHu5/yHGO1wx9P0Z/9NxnC8cLXM+qT1K0
	PCytHVPhnCs1H2OyEfuUBEZuuAL6rvPSN7f2huh3IL5LDsms+UZygEGkBU6ZctFBDCZb2r1tem9
	WJnLLxQBGZ5sNvQlZffOcAUlV2B3RTUWYd5QXlhimBA33k7/S+G0WbjcUvJEZ0cyOsWLsPupOT3
	le3r6ZIgqzjOFRmQrCNu3lPI2x7qj9uV1Ypm/gkkdd2jl9r5ZVtslmtgs4iBqfUhL9NDmBOng7A
	jf4+03owv3ABzqK/N+K5M+20twsTktDFAMr6SG6Xxf5pbPFFWSYAQhMarIteN
X-Received: by 2002:a05:7300:dc97:b0:2b0:4f8d:2f5 with SMTP id 5a478bee46e88-2b486b736a2mr8406102eec.2.1768459759569;
        Wed, 14 Jan 2026 22:49:19 -0800 (PST)
X-Received: by 2002:a05:7300:dc97:b0:2b0:4f8d:2f5 with SMTP id 5a478bee46e88-2b486b736a2mr8406057eec.2.1768459759038;
        Wed, 14 Jan 2026 22:49:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:18 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:06 -0800
Subject: [PATCH v3 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-4-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=10430;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=A5hAMQwqJqVj2zp8HTWJqmahVh6zYqir6Iz+YEG5VBI=;
 b=yS5QojumR0l3nlJfls5HdrbUPSnk9drWagmDrrx/jBJp8ALQRDm+mCHcgEQ4LS9Zta2i+Uu6f
 55LohL7DLyeAOX4ew6g+PyQcNsqsD1pJYqvhuf5Z9X+1G89u/byYLCq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=69688df0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=83lr82qfAJ5rTnltDyIA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ePYyJG9j-8SviJQe7Vl--dbsC6aNb8hp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX0NymGmf4LRou
 7Po8v0hCe7L+3XizJ7+UtX8U2oRshBEdI4udvWbe+j+IlCg5EAEJJAyBL3J/ccIv+lR/KEvpfag
 18jyHDbhLQSvNOj0m8Y1VLhIlc1s6zBQ6HKoWrLS4spVpnU5XLeVJNHn04RHE3hkv7GxiUoN1Vh
 aIURqZxo++bw4e2uGiWLizjB67hhB56htRK9Qjt0eJog40LMQNJozgFZh1zDgRRqWEW+0J5Xgfj
 +lvxvUARKnGePvwCQuZbFosDkDm7LUHzS8nWBPLuARtBU88cQLS57nkRx8uNCyRfTBaH68RFnsi
 FOAmmoly4PAIMHceSTnU0Z4cVO10vMilJQi8aF6QV5yhqScdq2UPdp9HXnuPffYrykeMoxHufA7
 RWGC8QKjSLURFueAqQHmmKydyez6AiIm8WyaOo9Kcjxrq/M6fNUfy6dyYLId3+Ic7Mt9cdDesj7
 UY2o5p3js0R5MfCyrXQ==
X-Proofpoint-GUID: ePYyJG9j-8SviJQe7Vl--dbsC6aNb8hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150042

Add remoteproc PAS loader for ADSP and CDSP with its SMP2P and fastrpc
nodes.

Co-developed-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 351 ++++++++++++++++++++++++++++++++
 1 file changed, 351 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index c736cebbf597..d344eb376ee4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -443,6 +443,95 @@ rmtfs_mem: rmtfs@d7c00000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <435>, <428>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_modem_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_modem_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -2478,6 +2567,111 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_MPROC_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				fastrpc {
+					compatible = "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,kaanapali-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -4760,6 +4954,163 @@ nsp_noc: interconnect@260c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@26300000 {
+			compatible = "qcom,kaanapali-cdsp-pas", "qcom,sm8550-cdsp-pas";
+			reg = <0x0 0x26300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x19c1 0x0>,
+							 <&apps_smmu 0x1961 0x0>,
+							 <&apps_smmu 0x0c21 0x0>,
+							 <&apps_smmu 0x0c01 0x40>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x0c02 0x20>,
+							 <&apps_smmu 0x0c42 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x0c23 0x0>,
+							 <&apps_smmu 0x0c03 0x40>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x0c44 0x0>,
+							 <&apps_smmu 0x0c04 0x20>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x0c45 0x0>,
+							 <&apps_smmu 0x0c05 0x20>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x0c06 0x20>,
+							 <&apps_smmu 0x0c46 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x0c27 0x0>,
+							 <&apps_smmu 0x0c07 0x40>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x0c08 0x20>,
+							 <&apps_smmu 0x0c48 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x0c2c 0x00>,
+							 <&apps_smmu 0x0c0c 0x40>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x0c0d 0x40>,
+							 <&apps_smmu 0x0c2e 0x0>,
+							 <&apps_smmu 0x0c2d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		/* Cluster 0 */
 		pmu@310b3400  {
 			compatible = "qcom,kaanapali-cpu-bwmon", "qcom,sdm845-bwmon";

-- 
2.25.1


