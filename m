Return-Path: <linux-arm-msm+bounces-101378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK9dNKxNzWl6bgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:54:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BF37E3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFBC93029A67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8228F47AF4B;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEVg22fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F247799B;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062309; cv=none; b=e/al4hokTeipcZ2/3YvTdBNkJN7B0rZH3cA9UUMwn5tcT4joNq3gUufScsAqJrB6VmNlpGzOqKiQckDRPV/NHtpyyyBbvuW8nvQK6j6vD53tEYv1bBKbYrEKRE/mn2mNtq4hai8AoXkkeeedK2je8AAayAepIrMsarxdpLQv3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062309; c=relaxed/simple;
	bh=FtFaVNDkJs2SPnJxMPfTI8IRK0PD8X/b0KifLpl6RwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9iGuPYbQT5LMW0llauLechD28FtNGXsgispcK9D735R6tIvlKHMv/oB08M1qIQZXz3XQz+MQmaqoSz5VELQRSn/+Yp1C0gXVpcj8IRb3rbZNOHuQBJlJJGCFfbKbRYQp2n7/ZXIw2CdGpIpUEirznY9RXMKFt1LIaJ72dI10H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEVg22fG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26F6DC2BCB3;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062309;
	bh=FtFaVNDkJs2SPnJxMPfTI8IRK0PD8X/b0KifLpl6RwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MEVg22fGi3hBS6OJM++Ox91GuHiQ9xLwUGaOf0kLoj95JeaCP3iFwBDDrOM9Ct2Ws
	 ICEV5vrA2Jd01t5s3Vujyb1cpHUdtOtfVVpPlhDZu7o6SiumqTSplHsFxA60tbjZpA
	 k55dHfEqORgcNI8824PRs7d9ta8TR/jABD4ZUlnazKCwnYV+xOeb8AczVPRt2MOWEA
	 vhoDXr5dZniWHwiHRuLlmkkjIENKZkDqMXukt7ESjXghgYTl0eXolRURu2kLgSONj0
	 4Lz66Z2wU6CvGyGtzcpuXRAarn+Weigp5Ag2C8/Wzn1PSRQuonXfd2auzE+jpLqGoF
	 lge+uwEF6QdAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2BE1076386;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 18:51:45 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-axolotl-misc-p1-v2-3-f3af384bbb50@ixit.cz>
References: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
In-Reply-To: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
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
 bh=kWUIRVV0NAuvQ6Bo6NPykpz1en1rcDGhEumQ6L7rv0o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzU0jnpCeqkPJO0zRg8gy4iKH9Je3koYkpEgGy
 PtQSNcewbaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac1NIwAKCRBgAj/E00kg
 cly/D/4yKstwMM7NYhMyZHEEQAB+zMR5kmA5/ejF4l3d0kU6t+CLEkekAp4GwbhpUFWSpeLscdC
 EHHuitgYOGfraC+99MfJgVJ9I5dh50ZAQ7H19VEsQeaigq1gtWo8U5/q6jqNCjVg10a+/14FAzp
 gOAAPHaFJD9p10eV/FNwDfZZnVyzq+8ddkK5Hc0jJrEhdK3tlX2fN2Gxf+ryaowfr6Plt8pVpFy
 MhEXb6bYzohyLAskpsMviScR58MYf1RH9NU8xiWAWlWQMt2vgL7Zih7RNLngUvRl+QSwFX/bQLs
 G+DBOQoCWcRJsDqMSSwm4kEEGZiYdGYHlKXEzSI/TPh1EB3uxiC5xL6QrpXgH3bCj2ciC5kFD0J
 iE5QS8al1D+ndmdzxZcOcxdH8QXVJh4VjSjZiFQC2h8LnUwiKmAuy+UHVqqjlx69/bffgXeOLRh
 DtCzcj1TP3p1qdrbbuI1drCqQijd3uX7l4lUXJjD47EtQEp9ryYJvzFsH00BxGJwB6iRVn31bfW
 Q2rqfGHIgN6Nq5vRbPGe15k3F2tDZdN9evMvBjDH1yAru0JXd7v/Oh7WFRhjU2WFyf2PEOyx5k7
 0dxyxcYjzRv6W1rK3FmAc1UX545/Og5fhgFq89W212j+5i7h7wzgizMrc8XMrInK5WbbqnMvVaP
 Q5mYy07CfQbRUJw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101378-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 4E4BF37E3B6
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
index 181c61e8ed748..393eb865a71d3 100644
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



