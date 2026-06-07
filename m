Return-Path: <linux-arm-msm+bounces-111576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JvGkA218JWrAIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:13:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A263650BC4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=u5uDXs8V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883B6300C020
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 14:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535DE3AC0CD;
	Sun,  7 Jun 2026 14:12:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9073A3E87;
	Sun,  7 Jun 2026 14:12:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841545; cv=none; b=q6RjdSx6Rnbb+YGgNBcnjS5CJlfhbQQjDG9zhZH/H2uE3plwovQ546ZMr20s1bmfARUNv4LMzgswGlnhWRNFUL3Yq3wigzwq+9wbG5Z18OzBXoPjBuZsryg8aIjeujetMOFnXK6KmY9D4Hajz8Khkoh9QpGWICHY0Mx8RtGDUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841545; c=relaxed/simple;
	bh=SN97g4eXmK1Hw6QJTh1ApmmGZAS7U+3aXMC+FoGCjRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fP7YMajImtd5p6RcQTsEgfb//q08qovhuNTcTozllGHTtLbwrEUj6a9nljDTOd4yoFd85/h8tQrs7WGPVDrIrxYNo/466GFrRoaeEfl9OukzTxdqJHxQoTNpMmAdNjvwVA0qHA1pjuqo/9wqS/Dcny3wiqrOhHaPkQTHFP2zYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5uDXs8V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9BE1C4AF0F;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780841544;
	bh=SN97g4eXmK1Hw6QJTh1ApmmGZAS7U+3aXMC+FoGCjRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u5uDXs8VpLexFz7o/Ag0XgxDye+FOSW/O2qh3ES3r+KD7h/AEDGqRzfVd3QWMR342
	 CZe6MQT7fXEK3L2whYo01vuE+AMkXeQaiMtils3+V1iT5D+qcGiM7wbJSV9ZfCZKfo
	 MP4qYRnMNl3a14DRjCjujYvbcQ2gHbt4uuAZTCMQyErHfA02/eZBqmaRIawvbGSytu
	 8oHCn7yQAFrNXQd5iVBpOc86XjT9av4xePdyWXZSzvFuZXHuZqNWog7SO4JUtliYvP
	 q9sWAwWLk7gJIvJ5KBYTy/p43eZjkcyqgO7zeUMbnWtaL+vYomz/mlxJdwK8IjxZaw
	 p7CFPFr5H4naA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FDDCD8C93;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 07 Jun 2026 16:12:19 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb to
 use memory-region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
In-Reply-To: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KULJnC5wByyrnpV9Tcy4pepjm2js9OMamuzNs1jvFiw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqJXxHV05wOdRcHomRxte6SsEwkVlVexm3L1A3r
 K41sA2c14WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiV8RwAKCRBgAj/E00kg
 ci1aD/9FAbrqqMFNKChm/jOstmzz0OHZbfhSVn68fHxoG0vfQW23HyiIMl2uT2gGhcmnznposgG
 zhH+dq3v5Ff1vWMxMAjPpDoUONsHn/+bYcq/vzx73DFPXVt3nTrB78DGu8sbu79VSniIzfh+2zh
 8aig2qI+KEzZ+ibNgEYNdIHaGaYwBnaMwkEVWnRjkfdJuK1ZOH/DIp8aHnBnEdFvTKudbXvahyf
 iX60Cq71rdVEinMTlCltmcEZwmv3NYtYJR78ZSTzOetHJ6Hy7+r0+EcOarUV4rUpnt24vad6xTz
 AkJ0+DqnYxsSJFf4ltfDSbeelHNjCnYg78GmFpnp+RNU8yIC6oxO2MkzMVRCAmymBaKyrpra1Rl
 PUW7WnMUQni+oQD/BcWj21SE7Rwa1KkoNxmKKIbm3fDI4wZykfKouWG35FgnxhWhPJv8vCORuet
 LsAHnFsJpiZDF+GB8o2AvPODYysoJ12Z6pwZRiMfcQQxHRy7y89nF+Hmmy1B/PMSLlJTGczpLa0
 zU5vUi61aTuphxyrXMuDOeREBYIhm2btiW2jHiEXqDB7HvWnoT+9r9KDkbhpit12HtvhLmI+wfO
 zuDmxXUmiyXZmeLHLmawyDXXmK1LzC1KYMeYsGiG8VorqUKrDle2UD+h86Qo0xynOcf5MYqHFdV
 urBtunVbbFjGECQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111576-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A263650BC4

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

This fixed mismatch of the node naming (0xe1000000 X framebuffer@a000000)

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29fd..4ca0e93ed63ee 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -35,19 +35,19 @@ aliases {
 		serial1 = &uart7;
 	};
 
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer0: framebuffer@a000000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0xe1000000 0x0 (2700 * 1224 * 4)>;
+			memory-region = <&cont_splash_mem>;
 			width = <1224>;
 			height = <2700>;
 			stride = <(1224 * 4)>;
 			format = "a8r8g8b8";
 			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
 			vci-supply = <&vreg_oled_vci>;
 			dvdd-supply = <&vreg_oled_dvdd>;
 		};

-- 
2.53.0



