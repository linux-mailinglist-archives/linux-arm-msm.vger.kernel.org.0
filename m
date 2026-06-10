Return-Path: <linux-arm-msm+bounces-112430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v8VqJVdOKWodUgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:45:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD04668EB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NQkonQ6R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBD0E3076163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28880406814;
	Wed, 10 Jun 2026 11:44:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E09404BFB;
	Wed, 10 Jun 2026 11:44:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091859; cv=none; b=D0fh/WfKKdRC8ZMgiMgU+OAJrwPmo4eeWH0l2rhocLEZenAm5Nq54VRAxOHgqfFECIDuf9e1xckM9ZDhKjExz1CyIxs/pTdB4xU+fqB91oBAZqzNobgNTgt4fKetkMRBGDotAai+yRE7gBDT0cMf8WfofDPKjbhIHlBWncQEleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091859; c=relaxed/simple;
	bh=c9zVqc+Dg0vMNXViG49tyap+X0Kh/Gcx0gmpuuGB2S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntnbXdbkz6VQUD2AZaqNBOHUSO9R1q1AKfAn/V96/B6mwcdsKZPPNK5DsOv6jw69Y5iy0Z212VXy5RfflVJsAE4rySYFcFNbpTSfxyiJcYC1/6uq/MAZGrcHAyiP65j3VMUQAly03+DnEYG39tFnnjiGkt+OmhtozugU7sVxsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQkonQ6R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A61D1F00893;
	Wed, 10 Jun 2026 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091853;
	bh=eRJvBOXJ/Qv5JJo142rYyyMf3WPgC0W2vX9VVYiXlhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NQkonQ6RlavGI/5D5JoMtQ++jj4sGflaqKGJqQJiZ1k3QkbFXcXVB/437qK5Wwy8p
	 NjgxTUp2Iajww3c3ptVtURaB57bQCfm89gsBPRjIu/oL8mHsYc49wpzl+5t53ZZq5N
	 nZFamnI1h3wKcMBWEN3JpILiO47QOXwFnUZzNydJIzhM12YrBxWU1xmNVbiuul9msv
	 iWJfOOCg+W5Sa1LZuC75AHW0dgVXKf7vzJejrPD2RewjNZkAKUB1uzv7bN9IEl6oUn
	 zF3yFG3Qw36EmQPULMQyuR2MPe9ji7YXfkjMjfPoxYd1FRAT7VoQUNnd49HI2ipCkB
	 upY3XLWfaY0kw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 13:43:50 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: talos-evk-som: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-june26_dts_fixes-v1-5-2e0c953a6c08@oss.qualcomm.com>
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
In-Reply-To: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=752;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nEE1IHsqEXA3r32tvW6HQEnG8rfUgsSym0NIWAlgBVw=;
 b=eyrjCyRKRKpiC7v+2JPST/f27erblO+cPk9F4WL77EakiK+a0gUAsJ7RdnsgdtdUDM4Z++ue7
 l4qENEMKncLC8Wp9y5TNiO8allW189SYzVA4erBTUfU+2vdSYhjzTSh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:luca@lucaweiss.eu,m:ultracoolguy@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112430-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FD04668EB3

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..93e08e141dfb 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -527,7 +527,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.54.0


