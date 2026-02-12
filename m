Return-Path: <linux-arm-msm+bounces-92727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNTGI8kCjmlf+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:41:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6B12F898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC499301B909
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FB635D5E2;
	Thu, 12 Feb 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Viz0zh10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C70E1D5147;
	Thu, 12 Feb 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914493; cv=none; b=mVICmtmhGm7aeXidexBbeRi2McpaySDiRew1Rs2j1F8WCHh0vNS2kEXlb/Mi2+dacps0vUQSgF2tRdf5rU6G6oXXnXkSgodZFZ6OuCtR/Ed5paTnMvCUN8Z7t5GPDwpXe9P+7MlxZzj2S8K/0cANtCWedSEnOIWcavb9TraLq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914493; c=relaxed/simple;
	bh=ZZIqZvO+cbHwWRRln2LQYDho2ESFfBuyDF9/EYjv+0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G9doigIp+4NpO9qhD33rvG4PMZqBRHgEsJydM46nbs0nR73CEJgOc/fAlDwGrXhA3Lr/EA2v/hftctANPiYzHrDomgIGOjAat2YfH4dT5bDVn/+Yj8oJNKnfQz3lsopPqF9lQ9wIfBRDuOz3btMBWOHw+qlG1Zy0oJH+ZJ6k+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Viz0zh10; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 447D3C19424;
	Thu, 12 Feb 2026 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770914493;
	bh=ZZIqZvO+cbHwWRRln2LQYDho2ESFfBuyDF9/EYjv+0w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Viz0zh10U/tDI0iG0hoVyMEtvEzSb/TIdfafb3bo77+11HVjP9smwmW98yBeVyRaV
	 +UKRxKpbHe0h5VKIKRzM7dHRKSBsZ1QfFD8RGIoPy6RLcfGSNkYVUH67wTrGms3S8e
	 SA0CFAVsrbxux/W+O29HdgQAPnHMcMkfs9mShid7fL2mz00fVNlr3ZAed/vOELcHAW
	 2CbQXLTz5QUgDFe1oxNieHY4rkU8N+0GmfAslU93g9TCps519MbWkm96fjVQ4Yts4s
	 QwtZQAPRvPYYcrfWhku8Vlox27Vw8ofRvcs7y2OxBAwUDTKlMCuBSuxMHfjUmhA7B3
	 ih0hCABgAPcpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281EDEE36A1;
	Thu, 12 Feb 2026 16:41:33 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 12 Feb 2026 10:41:25 -0600
Subject: [PATCH v3] arm64: dts: qcom: sm8550: Add UART15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-sm8550-uart15-v3-1-b90405f94bec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSwrCMBSF4a2UOzaSmz4SHbkPcZBX2wvWSlKDU
 rp3046K4PAc+P4Zog/kI5yLGYJPFGl85FEeCrC9fnSekcsbBBcNF1yyOKi65uylw4Q1OxlpXKW
 8rKSDbJ7Bt/Teetdb3j3FaQyfLZ9wff+VEjJkTlnbyqpxyMWlGzTdj3YcYC0lsdOIv1pkbZwoN
 XcelbF7vSzLF6rTw8/oAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770914492; l=2588;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=mR3/JRYkuGO8CBqOJAZJw6sx5dxfOUEZ5hawmrAeEFo=;
 b=aJx/b4n2h90yqY54V5mcmlCBuCfHejlMSqOOiBQPfP7/OiVeqMfSxHKS6XuTbH+o/eXOGYe+e
 WHBxjMNT5ybAF70oCuuZYYKSFNCnE1UA7pn7RFthPmtrVnoGEkoCysF
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92727-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9c0000:email]
X-Rspamd-Queue-Id: EAA6B12F898
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
Changes in v3:
- Properly pad reg address
- Link to v2: https://lore.kernel.org/r/20260211-sm8550-uart15-v2-1-bd23a0de18bc@gmail.com

Changes in v2:
- Use QCOM_ICC_TAG_ define in interconnect paths phandle third argument
- Link to v1: https://lore.kernel.org/r/20260207-sm8550-uart15-v1-1-d8ccf746d102@gmail.com
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..eebd5f9663edcc91480097aa39e9ca4dc3592dd9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1251,6 +1251,22 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart15: serial@89c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0089c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart15_default>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
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



