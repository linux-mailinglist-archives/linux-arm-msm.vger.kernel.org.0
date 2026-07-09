Return-Path: <linux-arm-msm+bounces-117936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s7ylOqZtT2o9ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:45:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216272F177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:45:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BU2HS19U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=culeqtfs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB8F4304000C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3845E3F1AC5;
	Thu,  9 Jul 2026 09:44:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D93F23B9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590277; cv=none; b=SMIsk69YPXMavEviYPCZsJMQevgKPet+G0JSMFwIu81SowqZwcuidXVyUF3aBxo6OAJMGN4Wmz23J929foQUGMzgKOPLqUntU1bBeocy89s9ZSbHzRuU+WLx4zNZB3zQU6GUEfHqOmtp6ShvIS5uWgzgxzileJMYP50/lGpy0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590277; c=relaxed/simple;
	bh=JIZogu9bJnT/zFiHz1aiwXu4faKX6URoW/DHrVEJlbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AN9XkvuWmZAobgsS/sx0q8snMo6LGa8c4JtIOdalt3ESRMmJZsI+HARPKVOieJ4pAJU1NGfDXv27J/YEFUbeRciVgwz4b0perrynMdzxYu7mNI9PCNS5osN+mJeRYIuVdTTEAI13Fwx4AWC0nKZi4x0dIJRqfMO2Wt9uElMEIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BU2HS19U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=culeqtfs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960E5X931900
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=; b=BU2HS19UFxA9MIYl
	huX9cmg4Zwe6xxydgr97yh6cnsILo7EOspPHzEzR17y6U+WYUnNrvXvDpP8X+OZe
	ppAtAHnFTz/coVbctArMEc3f/DNgIN4dmAXS+qF0+7wuaPWQ+gco5+8Y71NYSiyy
	Jlhgg4AXri0pum7OdfPvimhSu6rGYfsQvNmTh5XaKNUeeSE2IfIpHFEs6AOntLN8
	w8MU2xOi+m+Xrs1MTxkpwGtPkl3Szg7+EO5skU6p0qzrjBlw+Ugrfz7QO9t0sE7p
	IYWCFiaPir64Q3xvs3iE4GktpnLe2xctPeKBcr61aIbc3+6KNJ8/CAr7Z1EnUcOk
	7n887w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsbj8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:44:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484739a9cbso858563b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590273; x=1784195073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=;
        b=culeqtfssQAfNHOe4Y1Pejf5+EWFoXldDy12ICD9zMM1EC4pz5tMQkt6WunvdElHOH
         8cJ97XNk5pcCqp821qgUPbzq3QVY12S8jwIrtTWJBbKYDkaIbaJcosdbjdLxagPVyAHg
         O1ONpG4JL4ZApR73xUhbFbWqQbq32v0jhh1xzKoes8ElW9UmQqUceQjJHtQMrXLP7BFA
         gfVBA9TDuMC45JQNnBeeoNuKNqFDXDfZUx0pUVjkWUUtfteVZ3UwWKYvHyDjwyPWxU9+
         VxeILqks9gl/NVyyrQqCpPz5VEeDaHhXRBfUtlcajqGKr3oVoQ2iamwnoty0sfQow+bn
         Kksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590273; x=1784195073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=;
        b=qMI5jJXWPU99on3JHkXr8DoZr0ZZdUszlTuV9KvXPOp52xH4dHXltGhsUlykoSUUiD
         nmiAxfSeUvUOZw4NuOzKPV78Um3YCoEpqsXvujRS06L1PCp2dZdAMX0UpMaHSaWa2c+D
         +bnVY0ZZoT07XJ3GYLUlmfskjNf/lgEQcwnnxbjMyMD3cAb6lXKaXkSv3LGJTqpFnaHK
         52LgbjIbCRTyDkR3VCKwi+df8Q8G5hFrZPwLv979LX8cLHVrUms93KXVcxh7qsgi87ly
         UC82v2bQtFIS5mmmxQaEO7YAcr3DX/2x9qJSDuoZtMvkC6JEN5Sb41r6FQX4j8seOovw
         xOZQ==
X-Gm-Message-State: AOJu0Yyg2fA2y/ZAr+SQy+CE7Q1IJH6TaBGovtrt3pRZvLAH/mVA/h9O
	lscX01/cr5ZGESiEZWq9WX0UB1dJjPu1pkuHi6cEvSK3fsTsDPGWvtMHH7NsNe7kb7Yu1Q4xLve
	EtrkrQyEblXYiYtGCC+7uXhr0yALX/RaoUNU9/uhy354JzPfmIydkJud5spSDQ55cSzTk
X-Gm-Gg: AfdE7cnGvvcO4hq+eXoAXRgC4qnLR1y/g7T145yj9TrXDWhIdOItubsrmeiMegFuTsE
	x2zczA4FEoTVk5LV89+a+IQ1ZnGck/WDfQadRAOMUldDf9klMoGp8Ap4CqcCPOBlRgGJOSaFGtJ
	2QWAzmFNN1lhu7RjAsiWuxPy1GqT3a4CyiyKiBBfGIPiZ/YoKa+2Qh5f3bPz8645kXEM1WH/Qs0
	TU7WSIkz13+OpTx8dE4/FcCNd2cn0TYxIKvODMXrybyCPLCDKKaxNdYSYDDG2TVgqEe7frvslou
	2W8ql7HIuVKOi0mOXAOnezJs3HdJ8r0XEwZnQKG1LEbvQGDbrr4g1YyB17zEnZ9bmTEpiwF7zlh
	ZATUhoKaZ/j7O9N4n21rtmty+wpt+Rg==
X-Received: by 2002:a05:6a00:3d52:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8485a9caea4mr2268329b3a.4.1783590272855;
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d52:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8485a9caea4mr2268294b3a.4.1783590272290;
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:02 +0530
Subject: [PATCH v2 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3233;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JIZogu9bJnT/zFiHz1aiwXu4faKX6URoW/DHrVEJlbg=;
 b=2Er58Ot+Fy9YELjJqJL/G7MtF5JKO4NwTogGe7DD6uY6XvAq4KFgt9HM78yBPjvyyY8AGOnSO
 MhDoZXmYQqOCz5AFkv8wLURTMMy1XwKLexvm4nbqapdnndtuxkQJ+JZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MiBTYWx0ZWRfX2NPoByt37tbW
 1x5s97dumBTKYLMZ5HJ/2IUqMb1DMtkFcLNa605U6SSbIb6KnK67ryv0gVZuvYZatjEyxQ0/zNd
 phxiSl+prinLADDV2ZD5C64hcxws5Vo=
X-Proofpoint-GUID: axvtrSxt9lKWXL5MdT4mUgFsFmKPU5Ny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MiBTYWx0ZWRfX6FuX9jPEG4fy
 +nTt3rU4hDETUZ9Ng/H+O/pt+NKZ/Z/qQ4b3hJ01+/gtyOMpSNaqpM8QbUvmb7U0DS+aa8FqLp5
 XKFfjawYVxdwZ8vy4+x80PWGu/ezVsak46O0FeqFhI4c6xAClReNl15FGxefXKIeNvUGkxPGfTi
 TdltmNdfQtFyJ29jxddTx1lltcmm8V+59HpdK9BLBNz65xxIPKpmfmDZjBNSYrBSYL7Z/l49F/D
 n9nQGNSY/FFC3PLymzQT5wlVg1bLC4t72HAzk56HkMGo1Yd95LtbzCyvcgsBB7QZCwZc4bVH3c7
 +um5Q+ki9F0vpMYwkNsbv0crR0jZIV6wrU0g8W2F/neBaDl0/eU6FMcmzRdDbm9AfI0CWKnXabN
 AUzG6D0eX+/O4cBBAF50jFL8Oun5nR08j/kovtScFiW7Y/6WAsJeY/TWJfj7KmWzYrEa25rvL6Q
 suV7MMFYtb2axC2s7wA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f6d81 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: axvtrSxt9lKWXL5MdT4mUgFsFmKPU5Ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6216272F177

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..62f101fe5353 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,36 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +95,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0


