Return-Path: <linux-arm-msm+bounces-100553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dlTOEPVayGkxkwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:49:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE201350244
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B707301C94F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 22:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9AF34A789;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VF8k6Byn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6E39FCE;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738157; cv=none; b=WV8B0QlSnS0HWXkC1FLr/rTOG5brc6AVKEn+iQmWZ35UfobvT4gFQFDI+DRq2HAJXETZjALmiAiJNq8lFBj7XZ2hTH1w5zY4caMQQdcY+oIo6eRe1M4/SEE2dYRFX/geOecu+acq6Cuc/17hfiJiNSVSKuwZyWv+Q26YBiHqF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738157; c=relaxed/simple;
	bh=c7q27+5pV6seCz6fw/OaZXueVh85YipuI8NB3yehnEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jaO6kzIo1axPTVOXlJ+yUtoy6FZULFVnJJo354gIPgGPGJdJm2EHAmMKhVST/VogEFOqS25G6fUZl1yhCboVNzNLf5nbh3Z0zDyIIg1RxBkj9r3W5+tXFBbCXiWLJpUEIptyZyQw7/x69D+2YGbCZOQKS89gRnmOoTN49KelmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VF8k6Byn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 248C0C2BC9E;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738157;
	bh=c7q27+5pV6seCz6fw/OaZXueVh85YipuI8NB3yehnEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VF8k6Byn548WP5WFdiZuZ6IQrkTAEGiJgeBLUraMFPV/OE5g0AJmAh7sPwCIYq2zp
	 +sj8c2PZwMc25VxdmQVli4keTdC1UAGiDc/9PHx2gEvOf/grQrWI3Tcp5pbNu/oVYT
	 4Y75vg5ZZrJ7c/ex5/D5uc8b5iE8n0cPxWIngo6tnPFCqXcd26ItDO+YJoxSo3dIHd
	 tWMj0+KRO5nClXSU0UJo+Fdo2iGpDuSFET88gxaSk6U1CrbMu+s6OJATK7Ta/QOQQf
	 PuafhpMC2KGbQtcKiDbHkFcxts4TfuQrsPp0XX4IsCuOmpOi6blbydTkzaK3IZnzF3
	 enbIHN6OIrn9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1385110D148A;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Sat, 28 Mar 2026 23:49:14 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sdm670: add default uart pinctrl
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-1-0babf584acdb@postmarketos.org>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4680;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=BuzAL9B0hzH8sHOEbYMQsrlBM+zPhBYp09xz2YwAGlk=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyFrrXpAQWTb7W+QjpHqobvCh2SmXr+x2hASSM
 eHTxJCvyRWJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCacha6wAKCRB6NCVl/2Nf
 eYNYEACDSCce1l06Uf2MXaQx1x6krS5VxHLMDGSD+AN3gKorKSJIheioX2Ji5yYVWUeSGK/yDl9
 fh7UsxT6/14IfSh3XuIPwpLg0qCZBh3PSspqjGMct0ydHl6IXE1ZIbh5y3XmnwAYHvXrJTPvWwk
 WObmnoJ3CRhNjUgpDlIQwERE3N1+1qLoQlq2PeI0CThb9HI+3hYRYGH5CHcHFCLQBHKqRgDdLi6
 +14V3kYNYsWZHnKVz3RVEMlpJWQr73cKtePNMNMdYlSdjD/jTBgZ6Asf8rDO+x/AjczilX49mem
 a35wLdz8osduzlFF9ssx7Uq7lzRsdTHf0RaMwcQ6xhB+7HiZWxXD4gKNzoDNB/PLFc/lxioHvtC
 DnXvKDS+P/M0A0aAJyL5+wEWOJkZBJyD+QKV8PNnIte4+fxJwB1iOImqm16jzmAW9EQB0zZCNk7
 zBXX9VAafy3Blgix6lnGP90WdpyU11k+OgjwclRgrPpLb2VlKj7epO74oiULg+kfZE2HcsdENci
 qEqjv26LQatsC6bKaSQo4FxMCPJVM4u09iOAV49JFwUJPh2k9ZTH1Jy3Lg6gO3WzqGE4wr32DBy
 KYmaW9tFls07sMGiEIO492GCJUGRSCxxsHj7vtlf3VuwzeU4ft5mfFIrvMrn6Agv/Kd/1rjT3BX
 gSDqoX/qkDLZrfQ==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100553-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,postmarketos.org:replyto,postmarketos.org:mid]
X-Rspamd-Queue-Id: DE201350244
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

This is a pre-requisite to enable UART in sargo and bonito. Values for
the pins have been taken from sdm845, and cross-checking dowstream,
where available.

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 192 +++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 6b296ceaebc2..3e60ab527a42 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1352,6 +1352,198 @@ qup_i2c15_default: qup-i2c15-default-state {
 				function = "qup15";
 			};
 
+			qup_uart0_default: qup-uart0-default-state {
+				qup_uart0_tx: tx-pins {
+					pins = "gpio2";
+					function = "qup0";
+				};
+
+				qup_uart0_rx: rx-pins {
+					pins = "gpio3";
+					function = "qup0";
+				};
+			};
+
+			qup_uart1_default: qup-uart1-default-state {
+				qup_uart1_tx: tx-pins {
+					pins = "gpio19";
+					function = "qup1";
+				};
+
+				qup_uart1_rx: rx-pins {
+					pins = "gpio20";
+					function = "qup1";
+				};
+			};
+
+			qup_uart2_default: qup-uart2-default-state {
+				qup_uart2_tx: tx-pins {
+					pins = "gpio29";
+					function = "qup2";
+				};
+
+				qup_uart2_rx: rx-pins {
+					pins = "gpio30";
+					function = "qup2";
+				};
+			};
+
+			qup_uart3_default: qup-uart3-default-state {
+				qup_uart3_tx: tx-pins {
+					pins = "gpio43";
+					function = "qup3";
+				};
+
+				qup_uart3_rx: rx-pins {
+					pins = "gpio44";
+					function = "qup3";
+				};
+			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				qup_uart4_tx: tx-pins {
+					pins = "gpio91";
+					function = "qup4";
+				};
+
+				qup_uart4_rx: rx-pins {
+					pins = "gpio92";
+					function = "qup4";
+				};
+			};
+
+			qup_uart5_default: qup-uart5-default-state {
+				qup_uart5_tx: tx-pins {
+					pins = "gpio87";
+					function = "qup5";
+				};
+
+				qup_uart5_rx: rx-pins {
+					pins = "gpio88";
+					function = "qup5";
+				};
+			};
+
+			qup_uart6_default: qup-uart6-default-state {
+				qup_uart6_tx: tx-pins {
+					pins = "gpio47";
+					function = "qup6";
+				};
+
+				qup_uart6_rx: rx-pins {
+					pins = "gpio48";
+					function = "qup6";
+				};
+			};
+
+			qup_uart7_default: qup-uart7-default-state {
+				qup_uart7_tx: tx-pins {
+					pins = "gpio95";
+					function = "qup7";
+				};
+
+				qup_uart7_rx: rx-pins {
+					pins = "gpio96";
+					function = "qup7";
+				};
+			};
+
+			qup_uart8_default: qup-uart8-default-state {
+				qup_uart8_tx: tx-pins {
+					pins = "gpio67";
+					function = "qup8";
+				};
+
+				qup_uart8_rx: rx-pins {
+					pins = "gpio68";
+					function = "qup8";
+				};
+			};
+
+			qup_uart9_default: qup-uart9-default-state {
+				qup_uart9_tx: tx-pins {
+					pins = "gpio4";
+					function = "qup9";
+				};
+
+				qup_uart9_rx: rx-pins {
+					pins = "gpio5";
+					function = "qup9";
+				};
+			};
+
+			qup_uart10_default: qup-uart10-default-state {
+				qup_uart10_tx: tx-pins {
+					pins = "gpio53";
+					function = "qup10";
+				};
+
+				qup_uart10_rx: rx-pins {
+					pins = "gpio54";
+					function = "qup10";
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default-state {
+				qup_uart11_tx: tx-pins {
+					pins = "gpio33";
+					function = "qup11";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio34";
+					function = "qup11";
+				};
+			};
+
+			qup_uart12_default: qup-uart12-default-state {
+				qup_uart12_tx: tx-pins {
+					pins = "gpio51";
+					function = "qup12";
+				};
+
+				qup_uart12_rx: rx-pins {
+					pins = "gpio52";
+					function = "qup12";
+				};
+			};
+
+			qup_uart13_default: qup-uart13-default-state {
+				qup_uart13_tx: tx-pins {
+					pins = "gpio107";
+					function = "qup13";
+				};
+
+				qup_uart13_rx: rx-pins {
+					pins = "gpio108";
+					function = "qup13";
+				};
+			};
+
+			qup_uart14_default: qup-uart14-default-state {
+				qup_uart14_tx: tx-pins {
+					pins = "gpio31";
+					function = "qup14";
+				};
+
+				qup_uart14_rx: rx-pins {
+					pins = "gpio32";
+					function = "qup14";
+				};
+			};
+
+			qup_uart15_default: qup-uart15-default-state {
+				qup_uart15_tx: tx-pins {
+					pins = "gpio83";
+					function = "qup15";
+				};
+
+				qup_uart15_rx: rx-pins {
+					pins = "gpio84";
+					function = "qup15";
+				};
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.53.0



