Return-Path: <linux-arm-msm+bounces-98960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIZPAeh3vWmt9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:38:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A16832DD8C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E20B324C5D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A393D47CF;
	Fri, 20 Mar 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzPvF+t3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335A3B9DAF;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024148; cv=none; b=RP/1bSuTqbj3OeihnDrRIYucQNijbO/vo+qhIPcurZ51J+HH8KweXHqr+R0fg7i8G3te6E4LGEK1Ad03HGxKoobjqQ/Ss1LfIIxCDFcuZVbvSHB5cifwaAa9v/fsNl1URansNHpPWQJ8APxF+O2FTzxef4DB9AHsiKeSK39syQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024148; c=relaxed/simple;
	bh=5IoENo0r76kvySKZgQ4pj+AgWv22shhparIZZTVfqpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqdLDBx1JFofg6CZDO01OjMUt9Oajl/js4/h2D0xA+DJwIFmTVrPXENPU/BWkmlmHlG+ffapb27KYda2/eFkwpJDgxLcM1/nf1dg5AQJi2VXSOGPF+rL8ynSKkSUnFFFfyE0oppbHcmfpDYZvCt9KdjJTju2uxyNVAKK0ZFsTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzPvF+t3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74A81C2BCAF;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024147;
	bh=5IoENo0r76kvySKZgQ4pj+AgWv22shhparIZZTVfqpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nzPvF+t3HF9T3LSypu1jpPjuMyzhl73qRnhO1UpFz1KOtPDs3IWxdj3Weylwqdjuv
	 jTJzYy8g2uB7kvWWysSa7aEXfClJyR9m18wISOxatMzTa56deM+1Iv2Rc0HgnML4Sd
	 sUTOmw0t8DFqw4p4XihQrezd8rtbx2HAALOmcvp9YngsUrwypBbREVAhusXTHEy1PH
	 2G5ormkb8GUCYUaeJa1ZUe0hjdIiq8atOhXI8h+Pz9vmN+lrSXrFYSHN+NsVuCp5H0
	 TxZPNCKxL2L1VLnSN9X6RWfQbfTTaGnUdPD+xSQdpIRPhhHOjD6fU8BMEwUSEdw0pb
	 HQYHP5h11Xx+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBDA10987A4;
	Fri, 20 Mar 2026 16:29:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 20 Mar 2026 17:29:05 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
In-Reply-To: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=jZO6RkyutFnu2NFrOOzkyEjsVHSpesifd5WE85Z/RmE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpvXXRdYH4W+qUXzbbUndVRsatOwXb2a309gCvv
 zqPM5oESviJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab110QAKCRBgAj/E00kg
 clUlD/48j1vAEhcWFXyxiu/UVuPgCrqekUX4DO1dS63Tn6e2NYb1oQfFFN8b2/xqGHFAVPqS0Um
 7wL1AGSKToVdx7JEDCDMoZ7VYui9FRb857Yc3XxSgpCgEJahc7MOOOt80AIsL595vk7ssPsB+gK
 NR9waaudEvul7DtLTFcVq5zQlFNcqdpfnRXxcVM3bz2mHGZeQO7qptjc4bXEKPFW/j8Y9SUsjWq
 Rpgye1oI248d0GaFJheG9pdeGGbIxL/ZdoDi9xCOM86dWnCMeS+zGbMmQzd1rhGkoZcn8TZJrvl
 FzJCPjVRAH+5lgmuGoKEq3LEeCMd0tvxrS/lNo3Lkd3kcjsVjHmDRJbcErFHt8YNMUjUkp0R1mV
 O8u9Paw/jB2Wbkga4AopT17YQpcPS2LC+d4ql5U0/theUzFQN2rfqEUgqgWBlfKfi9qyTnc0Qcb
 UOc/xDtPjG/JUQOGf8dgz7BijLD0CZEIsFxiPLCFZPeR0jmpONT8DfFU6+sq6C8V3V8eoBAtquM
 wjsiC3rd2HFUrkksLXdN/NsjKyeTg0P/XfBxdKjatpkoqfR8hqhQqIfQ3rE7PPnIKOoJUkMVVXt
 eNMNoio5yq3P1+Fb2+MsfwLyhFNCxZPGrzm3SFZsV4c2R49cO1vbHnU061XNCbLINeuUVGGoMfy
 FjKYKvgRLnY945w==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98960-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,ixit.cz,linaro.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,linaro.org:email]
X-Rspamd-Queue-Id: A16832DD8C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

The SHIFT6mq features an sdcard slot, add it.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 43 +++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 51b041f91d3e2..1f21da310b762 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -600,6 +600,23 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	bus-width = <4>;
+	/* card detection is broken, but because the battery must be removed
+	 * to insert the card, we use this rather than the broken-cd property
+	 * which would just waste CPU cycles polling.
+	 */
+	non-removable;
+};
+
 &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
@@ -609,6 +626,32 @@ &slpi_pas {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio6", "gpio11";
 		function = "gpio";

-- 
2.53.0



