Return-Path: <linux-arm-msm+bounces-117229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XQ+GOFTHTGqLpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:31:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948A719CCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UPqZh1pT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DNazCfPH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83BCF30B49C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B148395AC0;
	Tue,  7 Jul 2026 09:22:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F5382287
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416157; cv=none; b=KuYqA/W8REjP9H+ENWRNAg+mKk9NHr1oDmhl9ed3wTXLr7B+J5eBO6bsQC7MjxZJmHgcJf/cKw+7eUZ/gw99i2E/vfVlwpV6RKjXH87nFf9589D2rzazhjyPFKEoSMPpf+xed5KY3TWXrbF0NeLTIA9vfHb8sXf89PkD38W/3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416157; c=relaxed/simple;
	bh=cN8N0s3wfZnVtSXWfIvesMbsj8jLnjCIewkTaaMq05s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2FwVNDFPOOIxVrmtVU+tH2ElzlYEka9/Ba5wfOott/3eX/IkpIlixJ3oy5pRXryzorq/ctl25Y+T0dOE4OIbxokYc11AHcj2XwEvK88L5gh+h+MV0HVxotSYIomLV6nRlOxlDB4C4B+LCTOi+6UtPr6ScoGjg1Jtv1EF8I4M+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPqZh1pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNazCfPH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EB8K3231416
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=; b=UPqZh1pT6PdZ2/yA
	bcSkEWzt9aJPuyTuqeO2gXcBRefeGMgAn50iUVlRfvDyB4cE5YqqgddRGGxZ6CoQ
	u80tt5DuN35ylHgPU8WQLVqfQ1K5GrpNveT7AnWCx5Azp871nGh08VMZg4uYV04t
	BSzE4esIQIt1uEcC2pt0re8pwrVfTdRlEwXSqQv2/ZNkz3SmzngLOdW0VY6UMDpS
	94FA2M304g/6o23ubKA6L6qNQWZfcaaOrgkIe5orLPvf8wBcx4G89a3xnbnrETIz
	Z09w4WYBMwT0Pv0us8pw1xMY+kX7vPUuGfBX9tvdAghQA2MfcGNGQXP4gHwnoP+w
	DvNA6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79pv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:22:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so3361962a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416152; x=1784020952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=;
        b=DNazCfPHvtxm/kev6lQg6tuuGr+zeS8JD77Rx4mjTlfKqPSt25N3DM5l5o8q3CDh/Y
         qcGxIzh3b5mbrZ874SHzptkQs+NHc35+9XplgH3619A7ARychMbuIHruh0lkXJIbiozM
         SH49BUxZAi5S06T5Ay63cZISCFAdbx5EIBwXoMf1Cey2TXfDRvS9527tkPMWAuw1qzdC
         JE1ZioRdjDVt9D/K3jGsa2WSXFKvWXdaJsSeLbBleHxJQWbGNJ4HQ7xp7+MPoDJ7WbEC
         jfZH/AARvP2h7CrqTpfRgCSBL36ljNDMZdhyaQsyqSMANOK6upxWrLi2ktqYFhrYU+Q8
         KpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416152; x=1784020952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SboQGwIa+lEBpfNS3S5MUaCRQ3VKMM2yisHZ8K5+Gs0=;
        b=UpimEOh1YMLwa2uZUcPELvPQ0omfiQcHGUbcZ0/R3gNhybqmk2Z7e8Gy30dUWnWE1a
         hPSVZy2xkr/V+4cS1eHhIGkij8bnKN2vGpa7o7K6uPg0x/MfXpZSIACntlswjQahAIek
         8WelIyUDXNdkNqMa8zB750Xa0IX8g8hBGZSngeYPz6kgObxaR2s7L7euzX7wv0SQtj8n
         /TmU0YfUZ4AQgZPe0Y7+9EFr/ue4jySUZeU3DgBpPcBUCosoG9XsBbKDwvKVQcp7NFk6
         qyCL5BdRSdKHrXVar6Fzrg/KBfY/AGE9DPDI1yyyt75MNVzqIknGpplApoV64K+TCj+8
         uGRw==
X-Gm-Message-State: AOJu0YypbTjZdyTRCRhFlucu6Tl68SibG9pwEMcfGHNWYweMfUgPMzyR
	h98jniYgCPNmRnxAyHRRWAOx8YwM48D3EYqxwsHLDi82VviVxizi5W+b9fBh/yW97mRiRASq73e
	aKlR/GHOJ4Xo1Nv7NqhZiSYSZKlYQ+/Miu4HJXo8CUzEFE3BflQlAXiPSK2a40qKfH09C
X-Gm-Gg: AfdE7cllM9pNheVPtAFINWr9PgDBUwYTI7ffUw2bjgimhJdos65poVKFD5u3cby3RCk
	76VaDQA8oO37ODXCygBzbpt5n1VhIcJFkzGmdaQUjQvuF7mypa/BHFDBwOov1fxRI+ijrEJSOqw
	pQoYxGKxHVYGwNqWeE4bIlLdjbpsOm0XBMtDkbPsjXuGeng/h0I7ImpBg73XU1V9xpWTA/oWgNB
	TfKGGjFL7IH9Z/503//d5bGoygCaB1Ql08bwbQ5tA72aLOeDAfDKCmSc3rgKoGJXy8cvdXx6xCJ
	OnmD+6Z8/IDNF7febW06pMaZ8BAisb46B3kQjaWrIXcmcVzcaOkZdw3+4xdtIcNxF+fAfEyXSi/
	6VsRguuH3OqPqwuGnfDnaD+EiHa63qEyapvS6YrQ=
X-Received: by 2002:a05:6a21:6e83:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c08ef2d3dcmr5131314637.50.1783416152515;
        Tue, 07 Jul 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e83:b0:3bf:c2ce:972b with SMTP id adf61e73a8af0-3c08ef2d3dcmr5131279637.50.1783416152075;
        Tue, 07 Jul 2026 02:22:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:39 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1403;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cN8N0s3wfZnVtSXWfIvesMbsj8jLnjCIewkTaaMq05s=;
 b=CAr+DY7WXcRiVJyl742yxP2g/IsJG0A+rWDtHuvOTccclKXR5LAWqz4OHNmkiu3U/A/wBFQnE
 RRHVIohVjaXDeIzej5mfLG4mF0KnUyMBYgI2C8iMnubefUTyLGeAm2b
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: afqg8ccceWryEieSmLM3AHv2ly3hNoTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX0fGAGtCL6ePJ
 O5OolPWvlIN+z5PwALHRFpn51TkY5ZRyiqDdzp2fWeeOXsbHJ5q5zVBVaUyPoOYvMAhDo9LIwEc
 nCr6YI1gGvA//Xpiz8SFMFXmdoQ4zgufaeBXEH4uEvyKKa5UlfZXXLZOHEWcGfenCXNM/fkHSB3
 J0WswtwG1mBm3WtIUPkIKP/PwfFjKW+WTmR+Q4RX8gsJhmoRGo93uS4gzCdWoyNkLI0h2CQEaQq
 HbioM8WX9zHZn5qidcCBEPWRfLo58YtKppojp8LHE7NYmO2mAhQXGxXpU+6nM3vC2e8rFLYjlqV
 2PEbeDaeGVP4FjeBvHJf95WcYY2R8Q1dYvUu4cCpdWDqKF4xQyzEWA3tDPilMGdCTfB2zH+Ducl
 vRhksCfDBxmXmEbZi1gLPEagMhpztuJ0XHEfX7s2PO2R3gpR31oaXz0tM/aUe866Okos8bWRBlu
 FqnihEGAZprVN0+CjaA==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cc559 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3D0eEgOWis+F
 wz48+eYxy3xsyKhsH6oxL4s1YpaqL8OURgYIO4WWD7A6CG9/XlMyK7e+aHCRaAOCr82JvD2J2wQ
 Oc7LA0Gfh6uGeDVPIclExYy2WTtwnTc=
X-Proofpoint-GUID: afqg8ccceWryEieSmLM3AHv2ly3hNoTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117229-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7948A719CCC

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Update entry/exit-latency-us to follow DSDT for cluster_cl5 idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 054f9c4ad192..933d81fe7841 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -299,10 +299,18 @@ cluster_cl4: cluster-sleep-0 {
 			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000054>;
-				entry-latency-us = <2200>;
-				exit-latency-us = <4000>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2500>;
+				exit-latency-us = <2500>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -461,7 +469,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0


