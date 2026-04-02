Return-Path: <linux-arm-msm+bounces-101520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP4UAaE+zmkImQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:02:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CC38763D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3263130411D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C3E3E3DA2;
	Thu,  2 Apr 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTk/nOnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFB3E2747;
	Thu,  2 Apr 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123650; cv=none; b=L0yyxwtZp+qKUpUsxwJ9jRrSySD+GTu1kl4O0aKsGO2laTBhI1spkYI+sfjlnOT8bbu+3/0UhfWjWOYce+VqsDhvt6MUYQrXBBmwLSb2a7m6oOxyS1qte7+bOkqyvtjs/rDNuULlUeE2LTGp80+pNqVp4kaeEM94nN+TOloLOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123650; c=relaxed/simple;
	bh=NoZ7PGTWOVR+0jHtvhI4clP5Zfpg6jucXXmbKq5WJuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DzravVVSY2PHNTp3j13r1gdpqsiNMvvLow847out8RqtPgTh1gFe8y/ksrIOIVsgl8dIKX9jQhOtdPfQfjODSO71uuZLOmSkv2EsNyGl/JiVIBGWN9CtxTA9gpzqAOiNASN6bPHxR4cfJFy1CHtPKP3UZ6//HihBmquIYzU6d4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTk/nOnp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6591C2BCB3;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123649;
	bh=NoZ7PGTWOVR+0jHtvhI4clP5Zfpg6jucXXmbKq5WJuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oTk/nOnpLmaMYGwZl10APJdHhtwz0U6L/RlWE8+OtZRyeh3CgFvUe5yYDCX1H7lOx
	 1WxprsxnBIUj+bLI7EX4w9ihA0zxtxybVBwrp/0fncLS+BuLbzK1w6l30NLSiKx3nv
	 zjhuQ5F+OOCwwBLUFWXut/XAmh6vXeuDEHj/jHKNLSfQbzlG/0M8Bmn89/VFjbxJvT
	 n1kPq+98CEuNPH0LXJNZsGIQ+JwKGqCT0UbrBEVyIHlf6gMIRm5Ojj1JvBKycPAICV
	 NwbtzdFbLQw87V+hDqtGkZugq4N/RNP8QsBDbSPXeGmQMKkGuYN2t3tNr/HX/o871B
	 VV7HIFBOda0HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E34D3940B;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 11:54:08 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-axolotl-misc-p1-v3-3-8934e9db6831@ixit.cz>
References: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
In-Reply-To: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=/tLVCDMeEyd1l4XS4gK2AEpm3lRrSe36wHl8GBumRLY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzjy/UCJDjV9x3+R3aAu7WmjW1VThG7KIJDH8A
 XtyRUdHwPSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac48vwAKCRBgAj/E00kg
 cjiaD/9CRnzArTwe+BEjDI349N1KrFDtNd67osObrTnPgTU0xnzfkvFd2sZVXPX0LZ3F5X0uReG
 qBbsOS89FBJgpB8l2o5YVU6adBFufp7TwpMnqqw2IwqH1qWt7p/sZpYq4PtNmxQiVJM5eYaZ8od
 qudSOGeBycBJH4oDAJvavvaDMaVmQ6+ATP30EIHxRgTLrDU9lTUSgDrYjtjUousK28RfrEhnvDs
 GmnWrLT0sO5UslWy4cA4CwcO2lizcY0CJ+WlSbLPi1vVXrsAwRfIc7vX+Wfx5bJX4jWjEibxSol
 LKiLgxxSiDtltYVWJySy++p6IxgL9fUStbd/FaRFG60nToFy7GReYOqmQMuFdfDln7VdlNWgWPF
 ik17n2heKgE5KAlFmhZ0XNxWTzDH9ppl1bp/PgDC8J1bq158ckMob9H0xRJEskIDHVar0GNGpQ2
 GknWomPuDxWN2Rr6z2qrWKAOJK5Fvq6eFUyPxK+2b3nI3BEKhtDXAurGewde2Dyq+6HdK/U8nbr
 I0Ie4GXrL10pbIW4B1GxPw0D2ew4ulHc/DMe00xfgSkgtC6lf0u/iVjbkH0jr3jc+YvlGwsp4oj
 oXHz3CEx3BrRREzSOJDSBzEfmXzNiuEMvgl0NuFrciBonH2b/eUJ8UoxdcF+KsxI/tcl8G7lh/n
 nuZvOZHRjxJYjQw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101520-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.34:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,shiftphones.com:email,qualcomm.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 954CC38763D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexander Martinz <amartinz@shiftphones.com>

Audio amplifier TFA9890 is present on the board.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index f26079398e07b..7d81198bc499c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -459,6 +459,19 @@ &i2c10 {
 	/* SMB1355@0x0C */
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	audio-codec@34 {
+		compatible = "nxp,tfa9890";
+		reg = <0x34>;
+		vddd-supply = <&vreg_s4a_1p8>;
+		#sound-dai-cells = <0>;
+	};
+};
+
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;

-- 
2.53.0



