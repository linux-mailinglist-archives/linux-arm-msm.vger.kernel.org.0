Return-Path: <linux-arm-msm+bounces-117937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snfXCq1tT2o/ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:45:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D472F17F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UwYpEmxr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DyXtXCqq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117937-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117937-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E739730485A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E390B3F410E;
	Thu,  9 Jul 2026 09:44:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0D3F44E2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590282; cv=none; b=QgMIrhDSBoOep9tBmPRsb64V+mCJKwWt6z4H1+gSUhjLp9jr+zCJHBv7N4vZIH1k00iK02QtdiJreMNosT3h2gJG1wFh6PC2aUKiH5AIPF8+IgxvP9TvPDgLMzJ/OckPspQCuDhlz8l0zOIUUqjB/EC/q3NdmjCwFcV7GmzbMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590282; c=relaxed/simple;
	bh=BQGgbLfMl6tLJ37KwhZa1C5lBH005bZDh0AvDOmBwW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyiuG/1svzOctUO5n1j4hMsNURDBLF7XeBM6WYuCZl+rui20UE5dbBKOWyRAjNJh6/NG1Its2QtosJerLJRavcPl3xeiJ7FsYQx/eFgloq5QPGEHe7xlMxoC4KnHzNgypI9sS5ocm+349800wYDNnKcKXPRuc+GWEJeyY+7KUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwYpEmxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyXtXCqq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960PZm784608
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=; b=UwYpEmxroPsqOZ+P
	UjVhHpbtWoURnrBOmDZmcFSsKuqc0sqnKOLxO8VdWgycacO378PwFxflt9/xaF9J
	AKUr9iCqnn9nMamkYZ9WWUWnDZaWlAzUGfNiyoIEcbdECQMOPHxMsDR7T/vk07GZ
	7kpvZbtjf+t1gbyI3bjEd3LzjXhT8RpzCpp/3+CR7yoNWOCPiFOfFHQQzNkJ0/Uq
	pcwzN8qRFP0OyQ2kUtyv67RYvnjoxGCDot2EvLzzvePbPW1dgC1X+BMqFzJnauLX
	FKrLnO9UJ9MusD9yps/Xs5JXDbkh7ml2JouPmiJnxSlh2Fg++d+SIpU6whtY3bzl
	CXyE4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u32gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:44:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2586919a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590277; x=1784195077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=;
        b=DyXtXCqq2zp/NdeISjhgz5yJ94oW6kEkX146hY6gCWSoKDEUKK1Q01xU0sEXP7oh6y
         dtqDZw7rlCHybUWHz/p6m48XJ9alP9m3abtLp5MrhnH5nOVbW2Zb+lZ+5Fd1LAng4i/3
         wnmLfbjzvFVj6SV8EiqNXYhQdZXY82acsrpUCqmXQJHfcGoYk0IrL7a7UFSVIdf83eNu
         TA6gmRUghyEJob9xPzHTzl/o3jdAVEhuarprYjRqUwehkCYTeQIWH9QfzYKkNBKL6v+P
         GGW2QDtuuPVA3DTweuD2HnKLL+TV14mJNExTGUOMwZ7sYDX3rqR5Vq+CnNjiHhB1aWhS
         2LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590277; x=1784195077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=;
        b=Ck2MYSydsYkUFokp75YNeOqCmbJpJU5uVJ6GKSe6JGh0eRuUMwzJ3v84nlVaUdglL9
         BrZekQPoeq/oLeKsN7cY4F2RREbezZ693JvWq9mKyE1w+hQlIBwNdn2EsTge4gInzJhs
         jvkm58GXOeKtDfPVvqRNxCXCS4u/7tHK2aVCQ+k5Ye/jlWbv+08mpDSI/E2JHU1bdHCv
         VTp6cpxR+e0RAiq+zOnwo0BBlaAYp4zFpMckxvwcGGDzyAqFs3kkCICeEHqyZH1SiGMw
         aWNhm2XdtYM5PY6Pu2HzgCCqN9C92nqUwqdq1yxtjs+GwM/Bgy0d2NK/TGIiAuaV0AT5
         B5Tg==
X-Gm-Message-State: AOJu0YzD/SWh/exnst3LtlSbxPjzxRbJ/ZvIJMcdZQZehahqdRp1D6GY
	swrpIv4jrXMHxqocDMEfCY+51hir9UkfyuScC0XAZYj7D4qXfL8ek3GyyuRcpf6lQ865a6OTY2P
	A58tVB1fOTCqgd6TpowcUFLqIonzjEQIm+cLGyM9V9VihEUD2AHko2/q2SLxgjoqO4Q2zFn1yUe
	/o
X-Gm-Gg: AfdE7ck0WRCtQJPZliWA/9aJmvPjlQo28pQW3fyhFNQOZx/f43LLuRcVS05WhqvkvRi
	RK4KuB83zw3eXuHYUhpyQWdSmnyLxiVApb7Brnaoiy7+WVfIDdi0OWZfYRoLssbvxn3x6Rnz8m1
	cFxSanvuOdlOW9m/VAbpDpbol7F7f+ReV3tdnW836JSaqZXRpIRWgEdTkZta8sL92OnQhKoFWgr
	TjowoZSGpA+ezTbutuDIqI5NLy5MUddzOMKJhSo4XRgqQeerpNMb+ecK3Pw6MzSLHJPV0mI3hgK
	978rcn70gxhCPcNL/JMg5xIVubhwealFHQ8ppYWYzF2vssiuS0ipEr5EhNQUzRRaXHGVIZDX1+u
	gnn0IeJdYMT4WcLvP0F9MBsCdNFuT0A==
X-Received: by 2002:a05:6a20:748a:b0:3bf:ab02:439e with SMTP id adf61e73a8af0-3c0bd0420b3mr8101006637.27.1783590276660;
        Thu, 09 Jul 2026 02:44:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:748a:b0:3bf:ab02:439e with SMTP id adf61e73a8af0-3c0bd0420b3mr8100973637.27.1783590276223;
        Thu, 09 Jul 2026 02:44:36 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:03 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=1774;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=BQGgbLfMl6tLJ37KwhZa1C5lBH005bZDh0AvDOmBwW8=;
 b=xan5S0uM4StAUrcbTXNTn8RpJ1fpKHZ+kwNYkdmIR/KlwSeeeniVNpNfo6AUinaf0OTHGCA/b
 MoerxZQ3XLTAGWhX2OSW19rrOfWLa43u7YJHkw5n23Nx2uY3aCdZPXa
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfXy/VK5g7VSM41
 h3VWx20HF/fAejppqj2JG1Ip/Y2K+mj8eawrOA4gYTy3Z6bmCcQZUh8MvYQhxteA9lVZ0CJR2cw
 +2ZgjfUdwp3uB2uqceF5G3ur0clOI+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfXx3UCyzXynx6m
 M3LMMASiEK9LlbeNkZVyICykkWxK7fJkOoFC9xlkOTX+Uf5OO0B3DvHh8XCN563i+bVa7stdDyR
 YUX0FablyJHOvT+RsbJMdz27KsPgEiGjTWpdXgBYAWTp7c+85lP4leyfqvQYTq8vneh9/bqQHSK
 MWm3TGwstbl0LspaMBGvRUWBxs65G1m3Ckt+OmaMkhh30frj2IjMbBFs/XGB/t4baGE6QLvIibg
 j/MYR++JdXRH4gL48FCBt59ieeGtExfqG3w3UWSoQfzSl51benSmBbQ0DkBD8wL3jC0UktaMfvF
 hYsQvNORJcG6jyrN9pe/FigSEy7CzjpKRnBZ3TmBOTQZK7ggMtNkqD3O6kHYi0hmiPWhf0dRyE9
 Jc/fBofmO+8L/tjZXRS5nuvvmcl2hrazUmqCUH5gUGMCpLiv3Tyv1urzBZ7KaJ0YhBWy9JV0uVD
 kpsNSbFbrK7I4LLlf+Q==
X-Proofpoint-GUID: _o7nYOHdEeRf0cBGjx0Vf834p0Uj0k17
X-Proofpoint-ORIG-GUID: _o7nYOHdEeRf0cBGjx0Vf834p0Uj0k17
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f6d85 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090093
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
	TAGGED_FROM(0.00)[bounces-117937-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C95D472F17F

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..051cbde20983 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,36 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +41,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0


