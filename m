Return-Path: <linux-arm-msm+bounces-94068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAGIDUnEnmkuXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:43:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC18195369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C273E309AD59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5E138F22F;
	Wed, 25 Feb 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODDKQZ/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsYR6vTv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7A38F220
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011931; cv=none; b=R0V5EXOJ//kC+bkqtKAasa/tIkgKtmA5FIPRKwJHOhllHAKzqaEpo9l9v2tqbKlUf/wkzQBo/lLRY3K5oicfALl9+GOg/EBmIWSwCsBNZ31wRytlq0B6VfXk/L7NiBMsPucaPdAJBE9xjdJUtZaP0SlLXmRCmvvNOYRrm5M2Nx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011931; c=relaxed/simple;
	bh=lLBpDts1o38Za+LSN6KfO5EWJQisSld6C6DUE9yG/AI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RI7FMS8tIF00oxC923GTorjTShualel/6FDQGvgxPLAtTbBoXfuCU/CWIoV4vhWemOdOfXccjERMRlzH9pMmq8wRmAP4Ls+uAqAYVSc0VxYmlaMpuUU9ICrlIWDc18pFqA7Kg5cWnnZcIquH6v4lmL3a59GBRcHXuiI1dpQFy+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODDKQZ/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsYR6vTv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TNwb583431
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W0DGi1Ef3do
	KA/ATdIJD6kErxzUZmo1VjU50a8dVxNo=; b=ODDKQZ/qskofdPO3W8WCu/xQXmK
	ayqzfU9fDTajOt+VWTrwXO0kDZ49JpAsTEB8FxfWZsudoP0XDcw72i702cyRh2/S
	ybuqOUUq5zIUTaLEcmiHkJUNJRFJk4Qf90RSWsySKincuUQqEOa3fb5gsZ56Ixb+
	sB7FZgl1hxRK5BN0X7tc8IZ/rC8jRE9olNbm/4gWr4/2Wl6chwsfeqISHxN7hugf
	xWlw8lRSuN0+xY8Pu8RYKYrP7NgjkOFBDXXkZkEqeoN+sWX60rQz8SqggJ3vIeTd
	7tcfRvHqCTaHjtU/0keiT1mW8G3ZAfgat+x4vOKVQlM71pz1zmmzhz3n6xw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjb53g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82442b44d94so2792011b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 01:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772011928; x=1772616728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0DGi1Ef3doKA/ATdIJD6kErxzUZmo1VjU50a8dVxNo=;
        b=FsYR6vTvJovpJ+9Z/Tn3f6HhMRN8C+5Upx7rrqcyGXvgdvGrS0kqGpbN9Lyiphg1G6
         kQIk+yzzHf+grKbTbU0zKfbHTUakaZAClU5OJY8R6pgsi9GQUlnDTpXv5pRPotZAitvs
         0TnA/Ke7Fpn/4TKncMyYb8SiBsoEHc+HfjS88TTkuGBAk1U0ZcpU5NWxJeZu4gyRwH9x
         TuBL46EUag5eCnVvJDW4ByQTZWtYd/YS7/GdnNiQOhT2VPJ0Vnu2Mejc+nASbxm89aRb
         FLifePg1q5fMFwr7eLoR6htig6mZyDp8YJjLugCXCB1f7cLwDbw3EI4Dpp7/UV37DZtQ
         llVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011928; x=1772616728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0DGi1Ef3doKA/ATdIJD6kErxzUZmo1VjU50a8dVxNo=;
        b=TGfy3AyxmXjaisAbGG6uCe0DwI1OCfbSzOzBoEkDm04MHh7/kz/QmPr102Ck3Hy2iJ
         Jhzt8NPI0h5FQvIiGETROZZzk29IJmFSHzUA1CFRN29TNFmJpKPxVShCdQAHP8toIXP4
         7m2Ohibag1iTfu1jhZdcrfLHpUFLwm29NQ+cKHEB3A5hPGtta7opFAXO82mTevLPE3Tk
         DWKPTxjybMIW0AgzKc95nh6oIGqOPbPdciWDFIJiJUBZKZFznteO4mUWFN1PZjBANHcd
         h3lFoQX1ZSdqz3qR7f89OrPamYof9ygLBipPkMkZb8ElkM81VBzGZ8KUgS5gCnwl6AZf
         nuqQ==
X-Gm-Message-State: AOJu0YxX0/+0yLe8rMCsOsnrvy0FANdQnvuUCE1E6wZpAlVk9XkLTXTl
	lXNh99zdo3dy+PKdn95jSS0G6fBieBAywuOeiPehZ58NVoZnr4mG4Y8aybh3r32zPv7jpOV/XOM
	iIlqdsZVkjFdFjm9j6K1gU9PIMRxH6+GlFdZNp6X/gaKyuYO7Uxy5T5hWwudQ/9LyUoMXrsGAo5
	0S
X-Gm-Gg: ATEYQzzsqZAkMIqUI19gkq1PIOP5cYqUJnnKVn9ccNQm5auG1rKCiOlzetckTKm4T0q
	Wa1IgRPaDxPmcT30M4AyoL5/djj2EigdccYMMPxQu4sEEwLGn/tshiGh7LUgzv+Syotl89M397N
	SOGZrT1j4FrtYUqEkrTVVlPxHm1UHvg8xZnsg0Nu4NW8Ohojq8E+0vzGQV58GEvXO8AtidoLu9z
	BbvG9lFpDnvRBi2wV4LLlW1g0rDPh7W7KVhv9WOvaPS2wj9dohsfM1yWVC4Qh/A4UJ53xhd++Is
	vrSzM5CiHvuxkxE0cwyfYBXml6zl8mQ6uNVgvNiki6r4m3qN8grUh80108MwcibrXC6fRZZm/D9
	V2VnCyKJ9DSJk/FDsjm4UOLINRstlDUEO/KEREsJA4rofmtJF9JCaJ6k=
X-Received: by 2002:a05:6a00:94c6:b0:81f:3c5b:f437 with SMTP id d2e1a72fcca58-826daa0ce9amr16109885b3a.35.1772011927936;
        Wed, 25 Feb 2026 01:32:07 -0800 (PST)
X-Received: by 2002:a05:6a00:94c6:b0:81f:3c5b:f437 with SMTP id d2e1a72fcca58-826daa0ce9amr16109858b3a.35.1772011927437;
        Wed, 25 Feb 2026 01:32:07 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm13628098b3a.14.2026.02.25.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:32:07 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
Date: Wed, 25 Feb 2026 15:01:53 +0530
Message-Id: <20260225093155.4162177-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699ec199 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0TxLVs8cyrv-jLPu79IA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: AUYp8WaNpPyE8SQfwPwzuzE5RERsvszg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX7ip/pm27trbc
 s1WU0C/swP4xhUxo/svvJRrVp/qSRLfQiz1ti+aFu1ETVYS4WeCZuaCOl9r0FR2/ISDJO6JQytI
 wkJ7MBhKdN7BE4YDNh9CdT/HYYR4XvpYk1gnwTIeSLlQUKnp6+/m/kct+vxh5ZyLhIXQ5sXUzPz
 pkZZwPGeEnVlysbDImLD1+JePkpvNNFKVj5Rtnr2l4n2E7YD1Aj6IT2bUAokaAZouY3Orp1LsJA
 Q0hGBYrIjOQR7X/K6aui2lhSy1OdsNz5YbgVSermcuoY0sZCxppjLqNTDiar33H9q+HlbshDl15
 r3SGK42g6eB3gdCmo0PRWEQ/1YMEtNe5FlqC1fUP3RnyC2QvZdxgY0TqfYJ0b6KzmIO2piBoEJs
 5B2NQifaMa6Jl7ByzSOUTO/qOrYG22AtLlgRIoLhjhJx2zthUrfK4V2JQ/KOYqbZzl4pS+LEyDP
 q0trOF3waFlVzurVZKw==
X-Proofpoint-GUID: AUYp8WaNpPyE8SQfwPwzuzE5RERsvszg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.39:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.50:email,3b:email,0.0.0.38:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FC18195369
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..397052394930 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -546,6 +546,11 @@ expander0: gpio@38 {
 		reg = <0x38>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 138 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
 	};
 
 	expander1: gpio@39 {
@@ -553,6 +558,11 @@ expander1: gpio@39 {
 		reg = <0x39>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
 	};
 
 	expander2: gpio@3a {
@@ -560,6 +570,11 @@ expander2: gpio@3a {
 		reg = <0x3a>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 139 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
 	};
 
 	expander3: gpio@3b {
@@ -567,6 +582,11 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
 	};
 
 	eeprom@50 {
@@ -804,6 +824,30 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	expander0_int: expander0-int-state {
+		pins = "gpio138";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio139";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio39";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";
-- 
2.34.1


