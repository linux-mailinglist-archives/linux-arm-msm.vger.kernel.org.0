Return-Path: <linux-arm-msm+bounces-101377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a9VJIalNzWkWbwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5337E3A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DFE3301F17D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5E047A0BC;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SS36wtHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAA477988;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062309; cv=none; b=R56sizVzvH9U0AggNI2DyS3RQ/YlmskWWPrFDLS0CTcHmsMeZcEb7A7WvL3szlPGXE3q/jNVj5En6O1LAWpJQDOTyBFJ7mIgbYpb6IGUZ69bt594DX1x7XXgX/wqv13bFNoe7iAkE707SgRQdJFDo7TQqYtm5Bl2aqPZUwrw2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062309; c=relaxed/simple;
	bh=oXZonP5j4c0O65d4B59yS13ja3zzyHaHSOtaUNSb8BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Irmwg1qQHpjXc8ZFT/hPgYVGzdvRdc5q/egxx1XsG0A/ytoWHKdk1N8Clo0a1cwoAGnGTVi9Mp7KFgP9OdOMWOXwWRI1uDgqmGBlvGBG2l56FMK9Gnvma20ZkEKashFIM37N0P709dnrTwtIZV6WceCa2bO7c2TvYbYcHDWI0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SS36wtHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CFBFC19423;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062309;
	bh=oXZonP5j4c0O65d4B59yS13ja3zzyHaHSOtaUNSb8BE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SS36wtHlQbVLkRpfq8PwHy5bZ0L2reC//J5vS+xcv5aDpV/f6UAQs6GMvz5x0SeKp
	 6qPeex4APahRDiP/H2vL4qPye7vN161D9/OrWLdeH0flLXzEnopLxsq4xJssY76ogo
	 VuIsWXgqyKF2BVdVCJurfolyW0WcqKggTjsdtYJLsZJUCt6fF/4cLtZ/CMb6frp4Ui
	 olL1xSMEnKoBKpGNJphGJfXgJbbVOrG6L0G3RvaIsbjLCEyWk2ULAaozCx6TffE4IS
	 cKamTPc+g7jgvUAjtGA4RA6PPCoCpYaXAJpVduV2HrPIq/ZioLBJ3R+h8D+xIuVf31
	 V/P+pnRRELLew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF69AD35165;
	Wed,  1 Apr 2026 16:51:48 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 18:51:43 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=aZdwStcvm+sP0/bffqiFYiM4zgFWPvHavag314QPrS0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzU0jT7/hxZAeWt3scy/df6V3dYcWoYPRU+h2T
 9fov0vKJ9+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac1NIwAKCRBgAj/E00kg
 cglOD/0dGUViocQ/HGt1FG9pRpZRjK6UR7xNAWdv10rQ5ScXXVxYF6bLeIcIeIDCmOPU+zQwR8A
 xfR42u7WkQl3mSAtbRwtQcs1dZ/ys5f/V2nzHOZR3jYeboNB0VHaMun/ViulUzzMku039fgPvKh
 LgXhxNHqgoPJcUinBv1gX+HpCtTY2pic31B4e+41kNVbm+w/8vhBlpTeiiDTS4HieXSeirp81Lx
 KCVE4d7R0LHrshAsXzL/yZNnZRIcC4XGJDnkmAgVb+a4t74SgXErQ3SYQYmH79PzqM6FD9ljkFM
 uZmpquC7WEPtZ9xogfKp7T6Vj2dC6VGT8PyHD6hg75+Kn6rROLWZ2smAykozlrNQdN+3n5iGMz+
 LtAggvVxDmyiuHJKAPd43nHrgzlzWEiMa0cW/6ElVcy7S974fOw33XvERJAuVoMnGdIe92VXGYn
 sqBN+zFPm9RNCdlXiDhzIB3Rn3xM3n7R2X0+4eiWbuNYRY0GrtI94O/cNmkzSX6Uqt5TyD86LNt
 iZI9aWbmTNEjcHc8j5x+cE3hjs1aiJUC3cxTNUwOwiTF7pNbFbEsFK+h0qjlno0aWS2uWgvRciO
 lJL1bhGROezTm1QsYxjWUQ3g7NlNCHxXnnoEP4wCoPAv3j98eRC3DB1ImkQVR/478ujLXsCh8Q3
 owvkhFrh11Oue+Q==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101377-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 35E5337E3A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

The SHIFT6mq features an sdcard slot, add it.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 740eb22550724..c394350998c26 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -600,6 +600,24 @@ &qupv3_id_1 {
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
+	/*
+	 * Card detection is broken, but because the battery must be removed
+	 * to insert the card, we use this rather than the broken-cd property
+	 * which would just waste CPU cycles polling.
+	 */
+	non-removable;
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
+		bias-disable;
+	};
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio6", "gpio11";
 		function = "gpio";

-- 
2.53.0



