Return-Path: <linux-arm-msm+bounces-105306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD+CE/0Z82nNxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A649F92C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 363E430055C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C083FFAA0;
	Thu, 30 Apr 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZQ/v0ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mh4VBRHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF533FF8BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539559; cv=none; b=uyK/ZaVIYlEtq2PqrDdkb2tvKhs6h5oPs+90tJwPFu61XjQkt0hlVD3vwz0seSk3TV0yQgmzzKTbu5j3iH+QlzvdnR6Ns1rKDL9htm+IzAGWJ0aGlKDFsbkQogtAE0AtBv4aSaZkAs26IzYKx/cxMyHZIXo6qa6vUazHPg9/nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539559; c=relaxed/simple;
	bh=bjspg4RGlRRJ+lWkvFxPGZiaw9MGEJLfXMpLoztY8ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bvp9KCnYyaXQ1Mm/hg3EoARuQSXOhVcq99O+CHYiX/F8q9FO/TUi5Cdk3ASUpwW1F1STdHnp33FEUF5ewg1aj+SGSDFUDCKjHvLG5sTFn+UzYeQZewfeYbiFV8GQDqjt55svxQyrq2SoyVijnTQsyqK0jmDMvYecybbi584mQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZQ/v0ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mh4VBRHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U755Zb830496
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=; b=iZQ/v0ZQrkmA1dPI
	IEIkmvEjQo4xwD7JPOuuo4kSP7TaQdodBztKonek8nIHyUql0Se4vlwVH92uhyqH
	N+iAMYJOfzBbEy2oj15C3NHSaV1027LZ5ctltwIU9wXnyLPZaCx/LBss0cdk3drw
	qUkZj/5hT501JftpMKZwovzMA37eKXRHlb88duY6ZGQvLKC5n7H1CKy0iuIsvTGM
	nf9qmAiAa7CmpAQQsJXvybG4DDomuBbkekbhiz4fqUmmjQPRQRzYraqr0P/OhOeL
	BTuiqJ55a7OpZvnS8AnkuT2k032EAjtrDrdLIX/h107qTgfpotJIm524JlJMBGUB
	WBQWWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq0e8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3649e59f0ddso740451a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539553; x=1778144353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=Mh4VBRHUwzTSG2Zjui8xZGG4AmMr7dlNtuuPn2OSlSNxA5hPMWqOf/5rIyGKmIJShJ
         On9LsxbHQcpXklrx9unxO31vk0qn6IIpxzJw033KXZ9C+yciOniXLbdDPC/O620iOYFI
         cQgsHxbVTpGiuK0qZ897UWXXtmYChpDbuZ4xELQZh2NSOjXaRIMCay7fgPhD0zRnkgff
         6iKnBSJ3mP5aTOhEiS4vlYfR68X+v878UV6n0KBFIPACXYOgsMw80wZZp5HypqhgKzkT
         CtROr4+pwvfaC39Z+M0wj/j9R3baKwSfYMLKPZbid+CiS8W75IV9I007SnogRCQ8YaN8
         49WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539553; x=1778144353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8rVeNNET+H6LFlILsmBsQMscHlKkjKdcxsQZkuhylw=;
        b=P+OXhLmxQ4Cd1tDfX5SKcJOI6BSq7TLwYoWwi0D3IZrBlhkEATM8ZL4cnI9v60exRX
         KKAI+2ALSfX68zlGL82J8TfJuGxeioLjvyyUXIqMCzcHVs1WaezpMxvcs/mgpBsE5dkU
         QNDiBzCSppMjk1HBqch6QVN3+aFRG0IfRPQOEwjMCswVgHbbfDjmsVL4YEmYUQZ/rEdv
         1KEjSj4TR9jTbtd8n7gjNvukJBrh9FKmm+6LWvO5iqnvN9khbhxNFkhXb1+Nk6glOk1T
         BCCPJtirPdklLlINWRNAv30JsaPNddPq+IGtoYSUJnWt+ClrfBFaF+9ed5WPpYt0SA1t
         DuHw==
X-Gm-Message-State: AOJu0YzPVrpulqzJ+V73qI5g+y4ZzkQngbpBK/d73lr1R1pu3TzjIk7F
	FXxCs32UBEVhF66sdrEE+hgaN2sBuKxJPilLLIEmrZI4k4XgcmwKYeiHkmtmaUrLlyFxP/iUbMZ
	nqVIJv1w2j5du32F6V8olfhnbCXvwWgtRGoko7OEQlI3yABVjkB+qJz9BVJrgnbSODMxe
X-Gm-Gg: AeBDieuAqVr0XUsFfyUaOkqzzlLkZaNgWgY9Jk8rK0ZaXn3OtkxNbfFF8hzwrgPMcN9
	L4IwLGJKjQDTtv6rUagLQUWfeW2Ll6VQ/pNuvkfv8olxNoRZ18e63jCuArW+s0qACHjjo51Aktb
	t96slYcorjLddkS2OsUoWXKqbqPueayxP2jtPcMpZ9fwBWcmiGhlvejXT2AAkieSWzV8mFJ+QYk
	gF7XSk9NPc8tr01ecoJzPkSEnr7Mt7xybH4fuQBxksbTxtl25xkc7CUvxBY+1YNFE1kJ2JlnyU6
	CEAM1NjTIi9dX398KAt67SfBKIwynKfa4QIXtmJIe2HGr6ZQTp5SS+IcWFXY5md26MUN69GzcqQ
	SVrrgZSYS+kLIizHADOZu0IOM/bkmaShDt+W0ZWyV/k4wtydMoOQ=
X-Received: by 2002:a17:90b:2742:b0:35e:5ae3:2993 with SMTP id 98e67ed59e1d1-364c30e2c5dmr2029565a91.15.1777539553156;
        Thu, 30 Apr 2026 01:59:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:35e:5ae3:2993 with SMTP id 98e67ed59e1d1-364c30e2c5dmr2029547a91.15.1777539552746;
        Thu, 30 Apr 2026 01:59:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:12 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:58 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-3-ab2bb40fd490@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=2376;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=F/Dag6hAiI52pCaHDtbl8w7fY3rlU7H+PFfQz62PGaA=;
 b=2o8KVBQ3iuFtrNMgNvWwQesgdqfN1gosy1D3SdG2S5+LUxNLtyYuPQfFovwVICQODS8wrUm0D
 I05R1YnYgjZD4girptl4N4E9eD4yE5jeqxer6s4dTxQdgnA0pmBNaXi
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: cGcR8B8T8ybyfzJtUbfNiQgGvrrVfEip
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f319e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5fc2j9ygtCN5jjOEnLIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfXx3vdAtYIwnPN
 +uooPxiZEsh2RNlUG0bB+QPA7vAiqIlOphQSYwmRfnUILVZslhq8Dx6wSRMJCSIj6TqlZ65f5mb
 RzbquBQ7mIgr0gA+YzhOui439jFeo+Fzvh9CH3gD37gf2JKu1WtvknD0yZuHk5jRsF7QM6clJge
 /fxl7g0qMTvy4uOt7T+2qeVXcL0lwfp+mwyekuUBYQRwrECC2ab4iUDZkfRgNG2bXjxzmN+8I8N
 Y74wBL4L3Pru0fW/RvJ9eKcX6WXexqKuHxwm41KHvpFl5d35XlbiIHsh+kN4WXHHGBjlD0qi3lR
 Jen1EuSCePD0E3E0Pf3IteaQKnJWjXzW5B80x4X6Bp2qG21Jbxd+R0ZfOl+bzsSsdq/tV1GeJEK
 CaAZUakB1ORMV2O/N9Bi7fHRm6oGDV4AHs7q+bx5nicdQHKDXFJB8fO7PSvinigI0mldayG1auc
 hRs9prwve1YmDh0c2pQ==
X-Proofpoint-ORIG-GUID: cGcR8B8T8ybyfzJtUbfNiQgGvrrVfEip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300088
X-Rspamd-Queue-Id: 4C0A649F92C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105306-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.915];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..232bcb942b54 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
@@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8620au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8620au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8620au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8620au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8650au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8650au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8650au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8650au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0


