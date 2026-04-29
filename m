Return-Path: <linux-arm-msm+bounces-105106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O9dO8aH8WmchgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261F48F224
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA40C300ACAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF2B38D6A9;
	Wed, 29 Apr 2026 04:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2/Xp5mO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1OGuCx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6B38BF9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436595; cv=none; b=WW9jMz7SYI1LnuDGdLSnE21mu70F7lfmwITrtYsnyLOu3vB7pwd/5f2XemVTsrCnCbtm9YNhdfHlkhmlS57lA2Ak0COszv3I3bs8K/83TTvsyFJtd2Both+Ikmyr/gefq6NnrLMGvU+WzsZXsZy/7JDv/bzi/GnSNr26Bt8cf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436595; c=relaxed/simple;
	bh=Od3ZwTtQdbzBvs50T5pyXtz3cBqHTKlOz35dqlKRPvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmmFXCe0jO8ZyfS14BlJycY/nihZ+613d5J8aNjwYIPdh2yRxKJum9OJ4+DcGRH2t3zQwg9Kl0+MZX3g41ghiKw5AURIQnQiPlDDyjOTclUQY9t7+PYrlaQ9O3qVT2xia/SUC71PhGD47Bbs5IWf1fTkSf40NSo/Q2OOsQxcRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2/Xp5mO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1OGuCx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3Yb3T017747
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXzfs6q25ToiACbxZcaxpEL0TnFQ1btzx5ESJx3d+/E=; b=E2/Xp5mOHfZqkt5i
	gQiCVcwXliBk4HGv0wvRY0mfHuUCk6ehrC9GHqeOVWNTVb0eXCuZx9ybXCVVsR9u
	VEehBoLTG3Xi/Vng5yi/hNkI366A8jyhSvbyuPh8d3dnHI1JcZkiNMfXut7gnFQE
	dtMILgIs6M7KbltgYn8hC+CcQeOjNaWmd7J9MQx9MSttTVua4q/yZUtf3qAdRX8O
	QceC/qwEekEhpsf1eZXFO/AGROcUUePplptBFr1TXPoOH/Pk00eefp2lAWRggjFO
	893GDw9BDubOeOlj2t01lMP+Md4al+bmpFhViVgosLC4y3L6niTeD6E7ZbFuCPwA
	zbD0FQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1ee9vnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f896eb6faso12558967b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436592; x=1778041392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXzfs6q25ToiACbxZcaxpEL0TnFQ1btzx5ESJx3d+/E=;
        b=L1OGuCx+y3mJmHGXit73kfHgswHxm3eLGiDUXJqpw4QJrDpSepwhxQGFpmBuMgBut/
         DJynEn5b8BWFaJ8Qr4WiAMjmBcqHUqjU+4tVceaEBdH5XiNHYac+8yjU+i9OfQZ0tnhP
         io+D4TjWeKuBglmnOPnlcEFgJMqRU2Z4jRqEtavnKL40nT9jEEhZ1VzXfmQCpLo1BVpa
         F/QzFQ/qnMJ8IgfU8Noe4760zS8UVXzU+VgFLlZwlF4m+Rngm89RrI9/mwNIMX5lBxk+
         Suss1wPujd2qmUi7eoILxff42n+57z4n3BvyS6aCGLohL7G3VYPDaa4jnnT4wI6+f2u+
         tfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436592; x=1778041392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXzfs6q25ToiACbxZcaxpEL0TnFQ1btzx5ESJx3d+/E=;
        b=VeuYNme9w3yNlQeNtxqY+q/CcjOM/x9S6d8vRgAdHPSkA6dLv1S9vtpxPoGPVB4ksO
         ls8no/XdT1WYfyodJjS3Y004mfLpTtCMxCiFyo3/Zknf7Tybv9BMCXVNKgAUr7gUW+yJ
         YsNffs/jnh/YNMhQZTLK0JyjZmPoeinCu/zkCVA+3miXmWWgpysobVupGB/3eUz+0shs
         w0hjy7h9lVcWJuA13m9EKiq8+7OMyuacKJJFOkrSDYLdcUcCwXXmcKC882okdJjJ26mK
         PwyarBj51Ar2GLvMwIseJHt02JBRcaIUZwmozicBmDQ5W0V7lW0VfuVIPuN6jhtU9fD7
         nA6w==
X-Gm-Message-State: AOJu0YxAb8UXcJ4mzIJch+i6QfgAyWxizyPgRyigs5HzUm0u5at6APHw
	cWlZs0kYnlZRrLQl5a31Q0VLjdYQSGYmamC/XQNJ5BZc3RzJPAOJGnv4b9O/bIugdVi+Obdjrj0
	+8s9l13+9x4M9os3NxoDvNThhPa61ZQFYI9327TjDKj7t6vweSb0s3hFmBTQYkIZoY+8A
X-Gm-Gg: AeBDietmSa9Ps3VvZDjRdamVTp5ObJgcWcffUFC1mmaTMqejhiI7LtuiOrouFPby9/m
	TQ9zBIfNRwMdrGVMjm50DLMr6/c+QtdyUDV606w6UAXFVFHmu4xI7KzVJ1lNplSYDUgtRL9jqST
	LkfY0dKFSeRLoh/mFuZ9B2q2muXwZCERrMTFy2G669EYhT40PLN6Jvhzw9sNsuEgJyL+9YtK+o9
	NTePEYz+Ts+mVvF/jXgyyZK0e4FpH2r/Ejmkxvyi4o7KIceQ6qszvxQi8aiMnV0B+WQmx6cxOaG
	U/4B7tO1bJFkGBNCf5l9Zk5SYqtkbe0T3t6IdntakpQnYNTkHvYWLpSgrOlq9Uq9uElygpT0cRF
	0ff06AbuZM4FPVUD/bDeaY43Gqx32X604dV2M7tb61EptIMi8Brv71WtoBuN895nONN5t
X-Received: by 2002:a05:6a00:3e1f:b0:82c:9126:31e3 with SMTP id d2e1a72fcca58-834ea66f475mr2073117b3a.26.1777436591662;
        Tue, 28 Apr 2026 21:23:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1f:b0:82c:9126:31e3 with SMTP id d2e1a72fcca58-834ea66f475mr2073086b3a.26.1777436591218;
        Tue, 28 Apr 2026 21:23:11 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:10 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:43 +0530
Subject: [PATCH v4 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-4-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=3181;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Od3ZwTtQdbzBvs50T5pyXtz3cBqHTKlOz35dqlKRPvA=;
 b=BTqEppcFYP/2x6aC3E8WoATyYEoG5IxVWs7rmObqC4zlWLKsX/1bhGiR22QA9o2kfgEFbmpa+
 DjR5e9dSZFbBfEvmS4JLrOAmctAtVpwvQY6jQqHtMBSg0RDw4nIeQtD
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f187b1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=oMVJaGz166wJ4grX:21
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX3unkGykh0c5G
 eGivbS3khE6GCnxBo6dRClXdyKoYRpbxTD1oObAks2SatfwIIbxfv1XvRSRuVqjZ4hLcCgtfjDP
 RsMlO/2jql5q8fl7TPcb6D2cZxSoUFmJy1Z9BIgPIGtJkNdjx3/HT4lHKFwTqnK1CdMS4RSkBe3
 Cq4y8L6LCj6FVMLMtRReUGCBdnruqidD+XpUMratONnCX20hPSZLX+8+XomaNOxA3jf7FYDWCAH
 TUhgvWY4zFN6toHUtZGAN1todGzVXAiatJbCNa6Wy5xJwhOkwiuYiYMMhycQWms6wC1WrPS7Ne2
 TM4KFfUzdH2ucw370gU29XRBSgRh618jepMM8qShkjsbeNJB1HeFXzdFOs4WEcFfKRzfDK17nse
 8lLCWgOA2LdECKg29+UoW728naG+/JY5ZStzn+Kah+aGct3lj13c1+MWl3QhzkMps1rZ06vBH78
 LsvFlv1ckKtWRV7opCw==
X-Proofpoint-GUID: pagRwKB6yk78_Wp6Qa-akV86vzW6wu9f
X-Proofpoint-ORIG-GUID: pagRwKB6yk78_Wp6Qa-akV86vzW6wu9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038
X-Rspamd-Queue-Id: 8261F48F224
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105106-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.47.77.96:email,0.139.197.64:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..4b67b3401615 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3682,6 +3729,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1


