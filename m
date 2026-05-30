Return-Path: <linux-arm-msm+bounces-110407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLD+JFYuG2oLAAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:37:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926F6121B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A54C7313B3DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B71E3C73E1;
	Sat, 30 May 2026 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBNXFwo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFHIyg55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FD3C4143
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165710; cv=none; b=c9Sy9Xlci8KlQl4PeugE4E77BTxW+qxmqXtD90bZ9LOJ6KA0awgQmd9V0seYmK1BmNh7/UyYQxgmanUJX1KeizVf4onaYfKwtiBzlyWIqrl9b/x5hF2DKyAo0sFfwx85u2zKE26yo9JgFmv/keTzMAQcMKddxhbsVMvbgNS/y2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165710; c=relaxed/simple;
	bh=szx38dk7eO7FpCFIXCdeBV79GbDa6G0K3KhI7GR7yMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfJfpIxdkPyAiomLTqdKLaBIlQqPrKfNX/EtifIT8vt+Ms+Ylb7zuYCKcLKsbBD0G4HpK+Cmjdji18fgz1F10CmGkVEkukPRDDz+tfMPupn87gKOyTtqpKTNvQqDKCRNTv7HpeKUqV8bIpgJeGrYZ/DM8BA8aM16VQyq331cQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBNXFwo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFHIyg55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UIOTT13608380
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=; b=YBNXFwo69NQ7hhyT
	itWqKqjTE3E74niXyVWrZJHbnHE4jQeUUOIUw599BXqXfw2+AoMj/leboxsvgfou
	UqvUxDFs826UMvOqOlVIR4BofeTtfq9wd2MTI9SAcBht+ewK+6fn0toNIXyMXC2/
	Ut4TsOieWkU5zAIp7+YInrEDxZFtg21kuEXbNSLv1je0vSzFdjCupzkgNx9DDt/H
	xo+nL22wla/8a9ltrKmJlbrvfeRf7HkAb6fJHwOSZb0prSHt5gAh7bon2DTLQzZe
	/JjVM8R5WZsxFmQqn5cQNqIEEKRMHKVuclkAR08dp5GR3AHLJimInQrsfk06hcKn
	cHcQAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7rx19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so1369915ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165708; x=1780770508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=;
        b=OFHIyg55piYopCdpL5kihM9APrW1Qfq1m2U08M4r1YaLxftmBDj+Z4y1TB3L2oackc
         3NK6pDR++wQ1tWMJcWSSei9q+c1cVyryzn26/QIu7MI6zLcDCwZ9WvOtC5l+A98GTWJM
         PO1CukXWQ4OBJW/TuRJAd4tB7AE4g85oh9n4kQOVviW1gFdXdf3qxzvcVfJ1hE66CkE9
         FwNxC1kJxHaktD/H5ikj6Tj0w0T9dIDkpjDx5SF+g3MnsAq3/tUFpomxYGG494Ti7gNJ
         N8kPn/xg4vmQd+SAe5VT2u/wRoieyuycjMUb01Ymw6db0prNg2pjVmPgOjb/zwlDd+2j
         yBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165708; x=1780770508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=;
        b=SPIkapPcL+pI6Euo3TO2FIYl48ZNMq8Pqs9sivueU5V5webTxIqMgQaFQE649ekYUB
         +zMd4k9J0uRAoEXvBtak5FKOxX/Q6ijbH8uJpE+jGxA4ftP0ZI1WtEU27FjY4J2U7mGq
         SRfHSc0X83UqdASnc2nzQAT6THs1KeYepPqtq8Er863cXiP0rioOwERBYpy309g72KLk
         EUwLlY/o8k9pY7b6qOg04NuTh0JkXYS7b5xaTDU7GKJ8xUy14UZFivafczTygPnhX01B
         2hqLM237vepYAUaLQZpc5k0i0ADqWbGaRjoj2JpFRET3+vixa7UFd+jPjg2Yu5IT+Mrh
         Vt9Q==
X-Gm-Message-State: AOJu0YxzYCDhl77atn+AwyN6p9FkYT04e0CorWO9hS0Qc2aG+pVAv+uW
	ayL1SDfrEWTrf6scvcdixYbVnBVSkgBCWSn8jL9ybHHT7jjp/OChA482FXAac84iPRESuAaKEpS
	1W7qcZwOvPkT9ZFjhhdPW6p7yhnh5ti3ExKdJm/PlAjRlDrfrGlq0PUFHXwgj/V/9tPJs
X-Gm-Gg: Acq92OHw0kKJwsUqD56V46ZOKmjz3ZI8LheYyi6Xca2RGn9bg29Zz6pWCvb9tIzyS0G
	fxo7p4yUxJ/SVwW/+0modYyTGBbtlvVZ1yYWY+qX+kKleCyDkZxIS2LtO4FCp4nRpCGmZF9ddiI
	AdmSV3nhN0T56b/BRHb29B03qWhavIwt6B7wHdKpHM18a8erT5iZDjJeKhI7tx4rvG8AZ5BRy05
	PPwhIMHwrP8ApCJTFKYJa0wLI3utjVWdwC3TgjWOm/QuWY25Qxxzp06Yx8nRiZv7I5Cbg2Gd5qg
	/cbCHO5+aCqg3ilbvDbVKzSgA1U6U/M6zAfV+beX3OG6t36JnqQGGbT+4ERbCYRsdOfjwjkhd/D
	CrkHJOgxKa8a0q3jlG779HevDIiDTSZcRSTt0FU85BFAuKUM=
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr56498575ad.17.1780165707748;
        Sat, 30 May 2026 11:28:27 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr56498415ad.17.1780165707285;
        Sat, 30 May 2026 11:28:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:26 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:24 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-6-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=2211;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5A79pcddnRcu6d01V9L1rukvuSe4x6q+6eyE6jTLb9g=;
 b=r7bbRuyLvwN1pjchzJaul7Z78pPorFr8QoDVS2AY9Doxsz0i7SAi5DjpHc1SFm4uM539uvC2k
 4VRZtRUKUAuCdm8N6xAnXzBVs2q6zK+gLeLPOdJvszvxQYfqbHicGfP
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1b2c4c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX+mDG8IhoDSr5
 CsClR5exUwYEZIt4hbt9Qrk9qh3qpnaAHSl1irerRk5JfqUrm0Qn4d36xsEGr4usKsxA5b6duN+
 GfFIFo/oOJN54siSt+75LxsBS2ZsssFFyrZnH4YERuecXn0JdfzqHRYgM3plAelfq1ocWpgX9iN
 EFkc0/+H36zF5JImhNdbCtJarpHI2XbW6litcR2O6BMmMGpdUFYBDs2jsFNKrwXdmbzhNNQ1bE0
 D/fgPnzke2nHJOLdsxbAUSgWF6jScMEsP/yStJEcsc80YArvg/Uj92USkcREsrDheaJV1snQN3L
 0BXFpyWOu7odGVKTU/YlO3KSYVZ4uuVh8bWmhdbEPPBiI6VcJF4QKZYFZ8loBCIJ94EUMjQ4N4l
 EP895/hgcAt3lkiNQ6dv0XAOOgS++oJIAPbOG0Xg96T6LOV3v4nbEH1zE7DIDMl0DabxrdcXR5b
 SzIoSvZIJ8e023LcTiw==
X-Proofpoint-ORIG-GUID: cY0B_MvisyJsJE96FD2P_ISxKJvN21kR
X-Proofpoint-GUID: cY0B_MvisyJsJE96FD2P_ISxKJvN21kR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110407-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,b4702000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1926F6121B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c0cfd73cb70..10a6e9f3b5a2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -413,6 +413,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


