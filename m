Return-Path: <linux-arm-msm+bounces-101780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGgSDGMK0WlBEAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:56:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C239B23D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3943014BD0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 12:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB7D30C606;
	Sat,  4 Apr 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Pe7GKaDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944526A1CF;
	Sat,  4 Apr 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775307340; cv=none; b=UnKEpo3e1ZQkAoiGTWpoDB7Lady7TuBYhb5DOl2EId6ul9MKETR+O/dhhQ2z7MAIsz7wFTMQfzDtuCTHz57PdhVUJM+gB3Q4cy1H/WNv9/NUNDIWsUyC1wseqtRVc8u7ivujRu+Sapxw8VBARdGeMnVxVUOyY5Es2ZNNiaoxySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775307340; c=relaxed/simple;
	bh=6lCzzmT04bUXxFeCDCTdNr4L1nRMzf4mXgZ5vVaXvm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfuUlQPrFZO0fO1V9CLQc9JQWDoOtvilxSTvSOizOZ1fCmTZg7HhMNob8becU5gTWXd5GiJ7hdX4NBIiwLBGlRodjSMwxmFr6sZepns6YnWha0x5TPgar1KoKsk37ASs/wg/j77M/RGxLt65uD65LkkEpBaMh1KEbj9XqklwFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Pe7GKaDb; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775307328; x=1775566528;
	bh=yN+ZowQkunJWeqIT+q24edOeFG11gt12c7AirgxSOfM=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Pe7GKaDbfMZ/MH+QlPfSY7gsUGjAkyBJc0ox2Q3jzaVp62iRVqAGd0M1Jt+IGIZam
	 ePjhr6wQznMab2s70embFmnrYi/PsE5uZ1I9P6LeViuWISR/lJca547flpmtSLpFY4
	 JRVH8JCR6X36qDy430jC+mAKqGAKcN1U8W21cUQIbsLTNAHds8Ly0b06BW24IYTZBs
	 teEC65ii5GxHXAfpdLJCFhOM+lAkUX0yt2E8PMnMwxQWQUExM+L4n8ncuBSguRY6vL
	 sduCJ6TDidplxkbXK7vlBjn1vHjnC6loajGiQSi+rptN0m/aUQ2f9ifY/0Ro877UYC
	 iC+KlH7QBkKTg==
X-Pm-Submission-Id: 4fnwYW0f3Cz1DDWf
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 04 Apr 2026 14:55:16 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=6lCzzmT04bUXxFeCDCTdNr4L1nRMzf4mXgZ5vVaXvm4=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJkXucw1CxalZp77dFKnRn3J5ZeTAk89Cp/entv5quyT6
 gerfqOzHaUsDGJcDLJiiizdf76mdS2au5bhusY3mDmsTCBDGLg4BWAiUgEM/+z8306Oz0lkeCB5
 uC4rZNH/nviWed8b53r7Ok/1Z7vmpsnI0Dh/p/iPKQkb2cXv3r8jGH34vurHF+94/+WIsb9jfnH
 vMB8A
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.44:email,0.0.35.40:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.23.212:email]
X-Rspamd-Queue-Id: 846C239B23D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
Register address of 0x9000 matches example schema for spmi-adc5-gen3.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be472badea502a916cdbc9477e9f2b..cc69d299bc356d90aa1483f347f5eee43b853e45 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -218,6 +218,32 @@ pon_resin: resin {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@3 {
+				reg = <0x3>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@44 {
+				reg = <0x44>;
+				label = "pmk8550_xo_therm";
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
+		};
+
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.53.0


