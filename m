Return-Path: <linux-arm-msm+bounces-101517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPZ/JIU+zmkImQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D86043875F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D17D3024D79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3F63E2756;
	Thu,  2 Apr 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBV1rY8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6F3E025A;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123649; cv=none; b=JGYVMphrE5jynDUO/Y8UTo6vFZFdxtvfpVV9ClV5xCOxxiym2UFwOyUmfZByLKjTIPPO97/MSz6brXCwwMRxYb/HB0NnNzRWvlfFKRDuFaGnRP3cAL7QiDuTw0FDn63zQ/oZ6zNw53zGQxQajJnyixdS9s7xD5M1HpWiBWL/VeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123649; c=relaxed/simple;
	bh=j5OlzKptvN8u5/K4ZJFqd4aGwQnSIp1riZZ0iQazIj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFEymAnoTt6+DedW75MSFUxoTrjqk4eILRkKKrCGVlcbgJTqTdBvWPPf8Q3eAB7TfYVyk6dLanVFNbNa4m60McvA7CjbW+TPOG+2GcnAqBYTvl/bzUCkkkVsvHzr378kxWl4pymDfWjNJtWsNPNcO/SsZEcfWbFrwMVneCowBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBV1rY8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93C58C2BCB1;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123649;
	bh=j5OlzKptvN8u5/K4ZJFqd4aGwQnSIp1riZZ0iQazIj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OBV1rY8ToYV8u+Jm5FfsNSJafhRffvdNR/7lSud86NoFDxUlUPElQAAUFaHwjtAk5
	 azes2YHFnRJq03IkVlq+1xAr27BGBBMoKCLxSQyssdCHv/o4lD40LDEsjn7XbSyUyM
	 AqZlEJFinkt0zXKmW/H8SDbVvEdcn/aFnqnpnQwMGstsy2NRRdSLOJHyPbBdCV+Odz
	 uV1JZVUD/RZKLH3gDEOcIPTuOT8nnuJpi5MS+5k48MlQ+d6Z0C18ltiLCMfq4JuIDF
	 dVrdr/BRGi9lP8lRXMgkAE96R0QjXj0DKc1rCs10Fz8aoq0d84tE/ozRZ0pW6GemBO
	 xbgALR8Ic+KkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C4D39406;
	Thu,  2 Apr 2026 09:54:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 11:54:06 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-axolotl-misc-p1-v3-1-8934e9db6831@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=V/gyVRb9byz8QAK00Y2utu0dDrgjEkYddluW8kKLmCI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzjy/ODMr9JJWu8/h28lbADOj7k6TlOFsmgBlC
 UTHKz3K7KiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac48vwAKCRBgAj/E00kg
 cg3gD/47qV6iwykb7g2169k9tBKeTaX8ux9jAVV5exnXWBlUlnh1iJ5HoaEHvxATqNENLoMtyQR
 gAGlApQ7AWZxwmsQK8rojwv1PONIk4c9rI6McTrO77b5shBOvVKx/D45S03FpSUds/EghW+Cbx7
 Nk+OYYjtwET9G9m4QV+jb7wz/p18KMOQLO9winY1FoKBqT03w16RR3W/7o6IVf2FCmIv0XAGg9r
 tr8vrm2fgBEw5kUMXVHrCGJAqnB8nSPE5GAGS3nVIrUVMEB2KDXCvnIe5cSil2Qf9BgvYDsRAaZ
 fHUvNZIhOJPjLdB/Pqb2HyldrMEADF3MpisS2Vog/aW1dw6ueUc67lbJGHTGml2Q6Fwn5YBj7t/
 OmANWoXdSGJzzhqRoP8mOsHy6xw+9PowYF/PEj8huUfsWZ0zxANeVkkKZ8cMpvXVmcuI7Z4QauQ
 0JiS8nsqJMqH26GfnrmviAulBG+i7IjbGsIAee2Qysir05t+F14yga2uUOp2XszfHCzZg03UQJc
 oyeaFW8HF/KWZc74UiuHMGsaQdDq8J2xLpCmkWhYl0RI9ptXZ2H0wxCCafjnI3YePi7WdTEIcS3
 /3YFeKSOZc8WPnUxybIbTdzdup67uSMhYo34a/ZZ3+pcL6+EwgIcMk1lrUrhi1di8rpcV5VP7tu
 vK46/J5IKbiFMJQ==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101517-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: D86043875F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

The SHIFT6mq features an sdcard slot, add it.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 740eb22550724..b05f04a621e5b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -600,6 +600,24 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	bus-width = <4>;
+	/*
+	 * Card detection is broken, but because the battery must be removed
+	 * to insert the card, we use this rather than the broken-cd property
+	 * which would just waste CPU cycles polling.
+	 */
+	non-removable;
+
+	status = "okay";
+};
+
 &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
@@ -609,6 +627,32 @@ &slpi_pas {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio6", "gpio11";
 		function = "gpio";

-- 
2.53.0



