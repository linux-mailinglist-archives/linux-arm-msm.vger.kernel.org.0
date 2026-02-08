Return-Path: <linux-arm-msm+bounces-92142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPthI2/yh2lWgAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 03:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4182107A1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 03:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 610E63012EB9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 02:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E143019D6;
	Sun,  8 Feb 2026 02:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlxxVvzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3813E02A;
	Sun,  8 Feb 2026 02:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770517099; cv=none; b=MUe3OA/fRUphrnm7qJiQ3CzYtlN1hQkMq0ANjqoDOmjaJLLCVdFgNkB+WK9DilXc85uIgDk8d5vk7LE4ZF3GgeRDYkmMEBx63AjWUSouwt5simS7Op3gBiJfmrotfIMlaGmdkyY9++EuUcycvR+cBbd6O3uJHOdikZQauGbuRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770517099; c=relaxed/simple;
	bh=IobxCSyUwmCj5HVUsqw6yAml2nCsNHFhjH5gVz6dt4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ouh18g4pv5isUnjrXOykR5aUAg/loEzLQbda5Bu9fYCbEQxDSweHDLTjiP+l59GNPg0txoQHOjY4THFX6MJPTbvvVsD7ucGYRYJLaeCYzMCYDek+KrU3uZUWLhRMYmcB5Spd+LM8MYRdnXwpxedqrJeBq6DyQV2+eHfk75zN0Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlxxVvzX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B042DC116D0;
	Sun,  8 Feb 2026 02:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770517098;
	bh=IobxCSyUwmCj5HVUsqw6yAml2nCsNHFhjH5gVz6dt4g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OlxxVvzXsp/d9KziIcEBn1O1H9AbG6or7eoGbCXmlxGRkTjtNyLsnY7d098hzMYDz
	 2jRmzuyBlfcztgXZZrdZj8X9LmJGtTnWyvht6Gkk+EBpvktMnGuTERGNvNHfIygpwW
	 oXZVrCl7LxBV2LUVty/ZN3wvL7B7yLtrBctqAHDQ6iA1A/qN3aD1GyxGZdUOyk3ufY
	 OQOCM1GcbPe3rVMdg+sx7RcJlaEA10DeBuZGrnvbUzWwt31oWZcemdu3GY9SSmqw4n
	 bu+VEzpROTf5n210WS4F3v57usDO8/+7ZlbC54NtF1lXNVfqwM1kOvcsmim/53OM83
	 QyoK8cb1lY3+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A36EF06E3;
	Sun,  8 Feb 2026 02:18:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 07 Feb 2026 20:18:17 -0600
Subject: [PATCH] arm64: dts: qcom: sm8550: Add UART15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-sm8550-uart15-v1-1-d8ccf746d102@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNz3eJcC1NTA93SxKISQ1NdyyTzpBQTi1RzE/MUJaCegqLUtMwKsHn
 RsbW1AIDYp4hfAAAA
X-Change-ID: 20260207-sm8550-uart15-9b7bd48e747d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Molly Sophia <mollysophia379@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770517098; l=2180;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=+xWn2WhENfNTFixOvMZt/E1OqwTYGEWhm9jN/K555L8=;
 b=zsCsd4WBYCQ3ad1VdrolbnoKVsVFbum74EIONdI8W+uuNw2jTQRJAPTixw18xVQ+TKSvD2Lhd
 fEhjj/F48a5CvoECb62xOgC4H9MVzRkaO8R7j3swTzrk+cPP15Fppkl
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92142-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9c0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E4182107A1E
X-Rspamd-Action: no action

From: Xilin Wu <wuxilin123@gmail.com>

Add uart15 node for UART bus present on sm8550 SoC.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
This patch was originally submitted as part of a series to support the
AYN Odin 2 [0]. That series stalled, so submitting separately.

[0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..ec172c22d928c4d73313c7b4980807760995ecaa 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1251,6 +1251,22 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart15: serial@89c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x89c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart15_default>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0
+						 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0
+						 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
 		};
 
 		i2c_master_hub_0: geniqup@9c0000 {
@@ -5095,6 +5111,14 @@ qup_uart14_cts_rts: qup-uart14-cts-rts-state {
 				bias-pull-down;
 			};
 
+			qup_uart15_default: qup-uart15-default-state {
+				/* TX, RX */
+				pins = "gpio74", "gpio75";
+				function = "qup2_se7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdc2_sleep: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-sm8550-uart15-9b7bd48e747d

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



