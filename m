Return-Path: <linux-arm-msm+bounces-105305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKnKAvEZ82nNxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B149F913
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D832B3006B79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E6F3FFACC;
	Thu, 30 Apr 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGNGUut5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3lP/njA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203E3FFAB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539555; cv=none; b=mAL81vWQOWSbs/yqN/7HWm3Wz2v1TdMOwjhFxr37ZwzaoR5BL38ueN9QAu1j98yu0KK5OVqCykIbOPik8kGscidOvVeiCSK5zz8uO8Z30yGJcSXo+7V3S4mkVNcrxG21F7LsAzcLOO/XDOd+Tcgc30ivtUdd1Vt367eINb9q0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539555; c=relaxed/simple;
	bh=lFu4IuT+IKrrc4jReWmTy3bMVs11TEshA6L6oqNRmmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRXy/S7bdZHLd4vhsGNE1TlfT5lxp3PHe9eraes8fzS43T4t1VxbTAz821sA1ETcqGSS647uHLWZTsrudaDq4bpwI+BPAgphnpO9vMZVmZ/ro39mZBX3mhRacBKtUs+hnBsxhbv/hhMFST/NjV5mSFWymb4Zd3oWA6R/7a/UNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGNGUut5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3lP/njA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U75J5X831278
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=; b=CGNGUut5RlwjUPsc
	7wp3V2H+PAsWSToA85OhmJuHRHiTpmwo/K2wiPKvSyaPb6owM17+xCEdrzq9gv+Y
	vo1QArfWY8JnuZRjHfrYqAL198MYGmIbNj/mC9aTK1Ir5u4sfYkrhhtKFUpDLLeG
	Il9tb3l5P1t7ABJAi7ggp7B7U6/62BYDcpMeHrt4mqk9hZG9RIeo/5W7zYo4FSc1
	YXS/cPd2unk3N0XVf89XaGUzMJRNvAGkLJu5QHR4PjqNRapDFrluhreARt4ngZ49
	19NAwjN+wUppE4Re9jzcxnd0n4GnuUPi/jsrIILXWb6f8ImnRWX7e/ZzJ7/eGtKE
	HD9mlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq0e81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e59791605so799938a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539549; x=1778144349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=Y3lP/njARQOGDe3Hw9BrwhQrhGWT8ev8AP1ipBSE4ve9kmByYGovdIAK0B20k8kU4J
         iQBnEBTMl/a8Rb8slI8rmZpu3XKmE2ucv0wScpURoU46gtiU3Uyzp0SkkUCBnsnT60nM
         PoH/832l6uCqG1pjwUGKBK6sBatRSBWcGgo1n3jM4NmkxMDQiyj8VmX6lJ4g4m4dIN7+
         VpQk21oHCdUdvPioOfQ1cADhsiiqLcAm7xZ4v7PcRer0R6LEmeCWfShMndwjewRUJa8Y
         prPGXpjp3QjkRu5ORFk9khKq0axeTManmFdxgK96bUSxp9N789WSjIi9bPirtqnvmbAx
         QI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539549; x=1778144349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=icnFvSFvtVFZ3onxpYAXJzKvgf+hvEW+0THFWbN8WerQOBOd8OxkVXwKcL/ez7Z5qw
         WETvQoXpRaptRQqd46sMYY8xe0dFvlgaasXaAs2S8y6OEy65IzVbbpD/RZpJ/9SiSmyh
         TZ7z0lQ7GSIsknlvDd5mRtxurjjjCodyPsaN2SrlgsL5oXoHDVmEv1OyUMQh/I87wIb+
         yiicOS+0EliPfR0hTL0KulGdRzoN4Pj/+QKdf5v/lYCgoH98C5pqUdyZQPWdD1/T4+8s
         6dvg8lv9EZ6KWfsEYSVAksURztatBy7aoZUTz90aWxiofknBVFOpYKZc3Xh87TjH17H3
         pAEA==
X-Gm-Message-State: AOJu0Yw4hrF9+qSlP8Ot5OwRZNLQ+fbgHPwhTSA9V+LoeHZTo5K+r3iB
	Jdb/pr/1o377H4VeaK5bnfeXIeeB1l36CpOM672FUpO9Q/ALXX/f63E52aOAeuTwmXXn2qVXIm6
	NMqc3wB/ffXGRMNEq+soeBL/yoVIOjv9FWSqoKUIsv5pYfyIzmBp6c5qRpK1vu74ayO1v
X-Gm-Gg: AeBDieubehdgQt6rEgG01DVSt4rSH8HBF0Vqd2cblg8IOWEVhqbrBNEW2evo7zrrzzp
	6jNCjn77nkzlDS/MVGmOUgIxLMRwoYvErXaN3DzxDB9DZWQyYj+WvVBYWUn/7qT4BxEigCpTqKs
	f7cyuhKw/lt7Xcj/ezAvKufDh/1aIL1MZqEFi4LwECG2XYOIcdQ8CkfMZ3RMfHE0h+v6IDE4cUD
	aoQRLoFQ1UQCp/f8+G09mgRZKEd/6PMTZBTXdB6iPqdxsYoVxmZO6mtC0uLET7Gz3OJ3ngCfkhI
	Jeo49fqRvGwtwyvgZAu9w5jn0uoP8IWEqbS7/yH+6+R9ZrrBfxaMDtmRwro05tNqgu/vWEdugpd
	i02qSSXFh0hatiua4FjHgtu6FJvyTSWp8HKNSNNnFu67LSENkydA=
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr2077663a91.27.1777539549355;
        Thu, 30 Apr 2026 01:59:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr2077636a91.27.1777539548898;
        Thu, 30 Apr 2026 01:59:08 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:08 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:57 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=4659;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=UveLLaFbt4LGcQy2FaHPB6oYAGE6xjTtc+YtJb8zYHk=;
 b=GC0blywW9vzsZ/L//8nIw08utZuUMmb4neZ+Q+UUj8bEp3Dr5xSxrKnbOmn/57QmEpkfdMrjz
 pMXZKUMxBj7AQilu5ZvCW09vcUq/jK8dsTzFgqf83fQqIQjvzkBpudf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: vmjFGs0UvzmrXuyNDzCFs-mWavVO6aH4
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f319de cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfX93qM29nuLJzH
 wYqLbPVsnig2havsmNeZgDARl9ClYxd6OpOS71lKIEyiUoC9WLMLkzNgUeiFr15RhlPhpDZO/Sg
 4Io8/6jZ3KSCAwzUxY1O1LIPp+NDuTLZbTRj5x3SkHYkqzHlwMfNcgdU32XrviZGjulB4d5nK3Y
 Ma8XqffoSNlz+gcV45h8bXtJN9qS9bOC+e2Xn3CMGn8rmK0vcN88IO2WHlUW6+uzAdKrpK96fLT
 JyG7vtzGCXJOJ7BAw1+iZDDlvhmMC1SFCfB4X4ptb+z+mZhbro/3EPYFRnpysnB5u4YDtnZaxe9
 Gvzir7xhXbsl2AnSIXUcZb4qOuSMdT7WVhfdSALGA656VnKHOoUvC3zaVH6k/tSHw/1/Ad4DjPh
 NO2F4kk9vf2/nDJU8v+kQtx/X0HucBTFATcgRUqlR538mAADjiga0Swp8JvqAxiQs7k8Yx6aQFb
 eJZqYQPp4ZR14IdXgFQ==
X-Proofpoint-ORIG-GUID: vmjFGs0UvzmrXuyNDzCFs-mWavVO6aH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300088
X-Rspamd-Queue-Id: A13B149F913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
pmm8654au_3) on the Lemans platform.

Each ADC node exposes the following ADC channels:
- DIE_TEMP: PMIC die temperature channel
- VPH_PWR: Battery/supply voltage channel

Also add the io-channels and io-channel-names properties under
the temp-alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..6caec3e4df4b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
 		};
 
 		pmm8654au_0_pon: pon@1200 {
@@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8654au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8654au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8654au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -176,6 +200,29 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8654au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8654au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_1_gpios: gpio@8800 {
@@ -200,6 +247,29 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_2_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmm8654au_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@48e {
+				reg = <ADC5_GEN3_VPH_PWR(4)>;
+				label = "pmm8654au_2_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_2_gpios: gpio@8800 {
@@ -224,6 +294,29 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_3_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmm8654au_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@68e {
+				reg = <ADC5_GEN3_VPH_PWR(6)>;
+				label = "pmm8654au_3_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_3_gpios: gpio@8800 {

-- 
2.43.0


