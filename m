Return-Path: <linux-arm-msm+bounces-115639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id acMLLjXsRGoh3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:30:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB06EC291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EtD2x/Xe";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FVkPmE49;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0018630376BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8581D425CEB;
	Wed,  1 Jul 2026 10:28:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9A421A05
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:28:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901725; cv=none; b=sk6lOM3IzNQKwYRsMz3oddo84BFKHd+7JOSSk8SlRKgAGxJ/80Awdo7FhEqsQRFmESM4NWh5s+h495nAiW1e0HX2sMrcC2F/tovdblPRH5/mMiEZfxWPwJrTOhVRKv/JZmJ3w392sGbPNzy4DkWy/Q8xLzwfOTmFbDv4LoZLOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901725; c=relaxed/simple;
	bh=XbWvniqK5aAu6rfptvx1k7eiiq//LDGyrr65CL07e9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ndhur2S/B7ijXGIKbWNEqMQm6jRX9wqwaaU+ScEuXgqj9Qp3c7tDFU3d8CoekK0uFl9I4tE1ixd7In9qYaLxPPk7QDwR67Reg3XmYVw9LpQhXD8hLSNgsQK5kF+RHpw2FKY746YUMaZEWGPtBrncxFUmMJaAz/BFxgzwSHyWkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtD2x/Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVkPmE49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hNC681729
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=; b=EtD2x/XesWdOD3Pd
	WwuiPpHROrQylbK+kgQTd1C85hRES6AVu6OJXnbivHFhnCVCZu1GRAdisBN16Tbp
	1PmsWA7rBYc/BewdOtK8ySrcStC4ped4fh98EOzVcySjedZs435MT8t5HWhFwYa/
	cYH276VwPC5eCl78uXmr/KUfF4W/LwLVOv12QtK/o2b0jpHg201D8Al/aTEqKlp3
	KxIdB9Mxezd9Ear8BDjoCHtphe8j39XCnpAMAq8oYTi/JoYTop1NWyFot6JpWe7D
	448uzaEMCJUBtAXR5rhk8pKSDsy7I9NxagU9ZCLP5PLpePUf/Sxgv0ov6KW93puP
	KcOuaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sknqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:28:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so786055a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901720; x=1783506520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=;
        b=FVkPmE49R9rL6OoxmFkcChai4QKlEkRADRNCC4FjBz1taXSM9zwLBiG9Sj2dEj7GAD
         ThPA0l/Mi1ooRTcpFpvyer81kq2uBYzzLx6AXxNdf07tD86Ts3KuFGKRo/EuFJ4hzfcx
         JMyTyG1a3xEVwjKGXWPqHMDJ7h0Or+mLelf8f/ae/620y/HdlfeBcpiQZMjtJikCk0ES
         Ar7Sls+c4lPvLNs/ghqGPj5e+eqsS/FdhrQTdpe6BhDS9rZmLXMGgIQP/Q+Br439vB58
         TIAM3JV3i64DsMnT4JqHzrYqxasuutua3C/sdx9rPY2FQUhdsB2qo/yy8Vedks87e586
         5FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901720; x=1783506520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=;
        b=TurQdTkRiJKzmNcQ2uWmQNd5CSG8FETO4rcN4+XNhQDHh0FcVdsTqSzrgEnhjfsZKz
         yrRF0aA5qVS3y2c7PoXeU4K4eFTeLIuvIT6tSKVpcq+8ZZNzojTfeXxdwkp1dyceykFD
         DayNsCPZ3aZp5W3TV6zqiYj8Khj15ttRdo6u+BTz5uYYkrq6FabIwPgVHWC9RmY7vOzo
         y9HhKid7YmVUYm9pMBDHJmAuq4jSUAhzNHe1R79wBpDFl9WjpCujh0vp6RNtVabmV9Fq
         r8J5s/GzhqvNEI2DHD0FW4ghTvP1PIC/vzxdBBM0g+/6AVO5KgUdJEuQsuFW4yyjuCXX
         7EdA==
X-Gm-Message-State: AOJu0YxLeK3OM3Dm+A7ShcLbyWykGTBXGWuOo8eED9l8Pqad8DzzTYRf
	DINzbVCuoKGuA6tDNgA83FMqk0XJ7fZ1czMmV/+Zdts6fXoKkA3dCwETYuDb3eQU47DGusHZcsH
	gsqDsJc4Lq+4QUfSTZOzsYJtKtBhjZJyqDwYsnjkrAtkpjLxOGFnSGeGLLGByWeRc+WQhFsL0ma
	Q=
X-Gm-Gg: AfdE7ck8MMlnNKcedmGxiPYgq8BtS87AaOvG4ya3eV8v91nnGZZRGAvvhFgekqrBlP+
	aEkqnBpRNi/2aET4Wqk1j+/+elfPNu/xknDekQmrMQRvyHt1uJaFVp49SpHeBhNP56irvujX3iK
	Ea4yPs9f8Vz6fbEY8hf7AyOmcrQsIw4g118iChqWpeBJdL6M8ytogUfK32wA1mfyZujYAYbb4jW
	4imMnJOBHKMktPbDyquP5KusuCmhMIKDo/p+U5Y1B+ZJRFoJ5/KtGET1O8D/xCAcfcS+cDmq87i
	I1RGVz21GWOzgg37Y7W2/DJf4XV2YfT5FT76DjgGtbAdyl51C6sU6e8r/9xwkPX0Otqzhhhy5jl
	R5IyjDNbMVspmAr5b7QPnfiHJ/sY92CtX4FCrMUXg
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1094905a91.27.1782901720466;
        Wed, 01 Jul 2026 03:28:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1094877a91.27.1782901719916;
        Wed, 01 Jul 2026 03:28:39 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:39 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:58:05 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=2118;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=XbWvniqK5aAu6rfptvx1k7eiiq//LDGyrr65CL07e9s=;
 b=nN3MA+CXKlKbMfwqHM9cHSjQHyL4Q0nAw7uGZ2Yfw9Y2vGOwsEed06/BehPsC/3IUgtjpH8/M
 JSM5/F54BgaDNumBf4W6wT6nHMxRCDnOpSTr6XGTaPkzCe08A7U+aoL
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: JEkoFdn35Pwj_kXLErUqQgPHaAvXGAU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX7xUfrgeyjvD2
 VGpOrtXIJLt+79FJ9W7uA6j32IfkDhlJxi8NPOAoaDw0d6bQxRMYWEA+eiI0VCsx683KjhqRS/q
 ol4JYZmysDU8w27Smjhv/QFLbYyVnvYB+yWjwgEKhFzFE1zb4vq/cRmyS/XwqgS3zj0PGdZvaLd
 tQE19SLD0PVhAyCa8892g1u+dSu///VQ0C/FwEfqY/BNHVhztzPJGFDFAOnXvutsuQIXnQPuCYf
 DdOUfUsuTaIJPAT3zog07QfknALFDVMPOiBx6Y1deFURIXYWs85neR4jtpZaxD0Uav9XxGsO1e/
 7Ax5wMlHvHtgVgSeAYJ5/XHbAWW0mm/PazV2o/7ly7ht8fWHqqP/FUYhF8E4Nfz2hyE+IH1VJgW
 A7Q5Xt/m3zbgYwZbln4xdqAOKoOHKONc1eHJdn0+oEpIzgKaIHBAM3WJwJgQGuH6pHSenG/o+0I
 K6mrE8PtZ+hRRBthPvw==
X-Proofpoint-ORIG-GUID: JEkoFdn35Pwj_kXLErUqQgPHaAvXGAU6
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44ebd9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MBrZzK6-3DAqsS7rxpgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfXym+waPHVAhmW
 ufLm8hFTPj+HiY+wE6eN2IkIB3CUSkoiACNnGzfktzcx+PUraukXZ8j9B8om7QmxA4bgZrJ7iIH
 C7kGTVidIVihqojTkLkzsxKuH5I/iQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18BB06EC291

Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
constraints in qrb2210 DTS files to use microvolt instead of
microamp.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -37,7 +37,7 @@ pm4125_resin: resin {
 		};
 
 		pm4125_vbus: usb-vbus-regulator@1100 {
-			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -235,8 +235,8 @@ &mdss_dsi0_phy {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <4250000>;
+	regulator-max-microvolt = <5000000>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 4ace2d6c06ceee74ced7c8cf9b341089b689f703..3cb8c3c090fff2524cd3655affc012d714629138 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -433,8 +433,8 @@ pm4125_ss_in: endpoint {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <4250000>;
+	regulator-max-microvolt = <5000000>;
 	status = "okay";
 };
 

-- 
2.34.1


