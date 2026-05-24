Return-Path: <linux-arm-msm+bounces-109529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO6UDIpWE2oT+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:50:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C49545C3E5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4028B300612B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6E331F986;
	Sun, 24 May 2026 19:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQlsBWBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dU4GDoG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED173290BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652215; cv=none; b=YDyRxF2A2YXe+X+yGoicRPA1KLm6klgNeL+vGiZqNBGh17KSA0b/nS1RwZTj7CPX9SqznFZPzrs3sn/yH3i9ta8DyoRFS0Z5SkOcJaIAyzoNWO4eAB4V3hsJrm3wKyr+PgXLSN0705o+pwdS+DkAqtS5MnN+ohhK9PPjm25sw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652215; c=relaxed/simple;
	bh=eQGr0nkxcoWjn7QIUaXrY1By7FGE9D1ix6Kr/LwIqbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBIXNMc/KEnBXSexhW3cA37wYzFN33LyrNsZu3Z3HtDGs5AFEaWhcZ2ZyEcX4XqUQ4skcJ6QY0EtVcTT8gJMFI5kajSwwoyklc1nke5Tba5BosAmOnSLxvJmIeCyQr149c11XL5cb9ruxj5nq24Y6MHoW4ueYezlOPcSXj6LFtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQlsBWBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dU4GDoG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O6GWiM930452
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=; b=bQlsBWBL6lf9jRFh
	NpgOXp3ErGLyyp113rnoPJ9T5TgpkawPDVgEZePtRussoLXPG9RisWQpjZdPYfDb
	nMKTzXhJDI6fQMXmsOsY9Itu456O9U36V7Ow75tw2yy7cABWM1vdbWK3yTqFEuqI
	aLEJjcbYkHjKsIN4jSneP674FQRAZsVni+M6tjSg+petDOAB5hdyraCYrkhvzuOw
	PiRJHJKcRxCa0Zg4pTkm6zKlmAqwVl/Va5mIf/SKawpOr0tqT/7V4BxBA2TJYN35
	y7WsCzj4zXQ8qcXGKxQ0I+3mqxlwTFKS7875hrVl5rHrbz4TOqns2ksLKURvANEX
	2B8Utw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fut49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so5135864a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652211; x=1780257011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=;
        b=dU4GDoG1SvrV4xEDcM9i/7a91saxCnksqiCyB5ZgqY7cbPB98tCrMvcgHGKJwJ0fSq
         2x7WhgeT5+2X36KbHn+p9MeRV9JVUEyBk4Rg8nltrzDqpMgOzksdmEpgUElzaw58fwtL
         kcCu41IbidE2y1r3djonYj/F51dAf3MdMaI0fywqqZPKdDs8IpqX/X58jSlGAkEJCobx
         TBGwmdMC4JoHtYKfoIjEkJxYSP6LqG2quIqfLpxfD1ZwLqe3S0t9snnMSGPPjOeEt2Iw
         9aAqiYFY0IoXXIy0aOlpyMI/y6NHzLVBQuEM5OAqsU8OrZkGpBtkkZAcgaYsci3ba/QS
         3S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652211; x=1780257011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=;
        b=HBgbVWt52m8IHRjC+6TFvwXjpabyN1iYLe/3G9yIpTfNaGzAA4a52RKBG+5O66eKRS
         665B6XaQeMpEQ3oErTlA0zNZ+kTXZooXMf816oVM6s8EOGqWMZfT3ashzqy7smXR7G7z
         ls0g8vxTDTmcRDXv4rz7h5ssEBLIpx70XOcQv5D+bpjDWes8kYmnerbKweggis/McdgT
         tfCA5VzhOqiBi8DAHi4wahw/k7UeX0P6YiT0iZXTeoSAVl/Oye0QxLWb2x0Iv6mjqtTZ
         bsW3RdXCs+/5h1cBtAQaSr0TAMbZWbxEtr/3FDAqV3lR2l3bujELuGBNUgBvNFfwwvxj
         W+wA==
X-Gm-Message-State: AOJu0YybyzsWOsTE5BVxBMfHyAI2yqOji2525fOw61wJQ7kDbfCYRuah
	4O9fNj6y07tzLPQicNGBIfGr+A0OQ/5M0j5YlASXXvWkDiHcbW8VSn5ZUlQpt0Jg5bHxB01uvUJ
	+VDwQS7/3+ssIYKEUi6ukH5hY1//Dmwc7X2NdvcNAqYQbgTvGranUvN/KlGeyANhL1U22UIUBf0
	3J
X-Gm-Gg: Acq92OGILdS+vJFIXOm3064Ynlm+n1duXv+Z7egQmn9V/X6/eCdY4buGnCTjwmji2G7
	kBFYPC9g4RMxwXc62Ah7WV1wuKRD+mQ0t7Dzi0Cftzn/ePkoxR8LNk55q5zgiKl9YQLS46EorMW
	8lCMCqXbBWpNzSCzB/mEXefdZA9XSahfCZrXUJsKU5iW0Q7RMV2ZGvyal2gyMeoQpfo+cNTyaHS
	w67aslurj7FL7nT3xhjhciOsUPOlEe12GtVewuTmxptj1/Id6nWCxIs1wRBx8qu0eZMGlRc0F1o
	sLULaQ4HJbZdMFkC4fXBkrlh9ZzV0L+buSRq/9/oJ0LmBtb1mOIAHcFJw7nPtDsvU/ujwyPA6UK
	bQBNzjRB8ouPIb7iEIDCBPpjzU5M9V3fY7mnJ
X-Received: by 2002:a17:90a:d886:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a676f061fmr11575582a91.6.1779652211025;
        Sun, 24 May 2026 12:50:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d886:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a676f061fmr11575568a91.6.1779652210422;
        Sun, 24 May 2026 12:50:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:12 +0530
Subject: [PATCH 08/16] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-8-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2211;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=a1F9RbX56fPOp9nyo4wHXXAYQfLg2aWQ/NsEbswCS6w=;
 b=HgxBQkgSNaAg0p/OjKCxSjohsKWoLpkpFORRD6Z1A402t9dXxxfeErjc9p5S4wOD2yqqBKcIk
 1jrSPPL4M2ID3/2kFAP40bZVC3z+xcVwcoopmWtv0joEQd7X/OphVs2
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX0DFFPiOH0lZa
 ML0XoecV9XmlcKP5YItkQ3XgleBsEsGFoJcGliF+Ugl7PEJwnnIkdSQwVI2vtsGneHQhHwP/kU0
 tRKuaPe+d3eAw/9eQrrtw3k8OpMezs2Ypgm3GnsYB051XWCUKpTKXeu1nErjEk/+v9vD48Mel/B
 t6Qpz7GcWrUv4jLNnkZM97FnqE2M5teweEomaoijTqG2SONH92X1UphuaCoyrvyxtyLj3Yg+JVB
 jxGjC3nuwXY08KMgiXvnE8y3dzWMVLn/AHtDfyacLoCxVMEXdQeNVE/rMpNQgrBQxQoFDfVnNpT
 TA5AciQP6ttSzPOgeBKTLtq2C/vahZCzy6HacNBo9MNzb9LOTiV1yOmw9ZbsZpEtBd1ioN/g1ng
 bpPrnTHE3PfTN2gAiLwXbMBysYpBiBkGkKnWH8YWIZbL7RZdRsZgPXuhaHp7e+pGmxcZg636NJU
 NCJ2jWRB7IPnNzBO/hA==
X-Proofpoint-ORIG-GUID: zEFHqBr4dC9QlXEU_duZDElVLQDbqJQx
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a135673 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zEFHqBr4dC9QlXEU_duZDElVLQDbqJQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109529-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C49545C3E5A
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
index bb1821e95248..2ea35e4442ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -412,6 +412,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
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


