Return-Path: <linux-arm-msm+bounces-110650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO12Dp25HWrKdAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0C622E24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A902A301A33D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B0D3A451E;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oq9ifSA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403736F8E0;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332950; cv=none; b=UnjIIiUkUkHQbj4n1I/H9Dno9YsqWv2IAJ/R7FT3mN0A1GZ+HGw/TScfVNTFHktM1UwDBpneuNGe6IX9FJ9Dt4RqrAjmKZSyq0/YnI2BEA0A9MNMclQL/bVLB93iLaQVD6xXvIF0kDXHrbV5RcJqFuB7iFxorKYpm+8Vv/gI9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332950; c=relaxed/simple;
	bh=D7mea+sVvWgr4rVvw9qcM4R/RiRsHw1X+E3lNQDTdFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYlOkYS4WkA9/nnZSsKQHCPU8Tm+/wPq1pIkm0nq7gi21TCmJcuC7Vigw5JYo6Pjimn6CVAb6/UTdHzGGCpBzhug8KBZcj3Y2Dlg9BtcA34oPO3nO1iszdZwChl+wBmGbCYYn1dGUgjxB4ae8sHEOzWBA2nF9aXCAotAT6lSFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oq9ifSA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17A80C2BCF4;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332950;
	bh=D7mea+sVvWgr4rVvw9qcM4R/RiRsHw1X+E3lNQDTdFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oq9ifSA/ATTGlLJPoQ0r1NhC6pA5rwFHI3NWhD8a2ARAedYKAlqmNarLd2v/p2Uoi
	 NI/eXIoBwwOPWNezyRn/ugHKGR8xhWNvIjsVs9m/ozfe2iwIgDZPTi37CpsPEMeGqY
	 WKbolmUqKuW+i3ilKsDiPJAZqT/Nm+AcEJPAy69EYWud9T0wOyUFDGg5rV+ABbObRL
	 V1yQtJhhRIuKUgBRxhzCmhD6MiG9Te1epK/8JfC8kfDb63xlij1bYxWgtc6JyxIC6U
	 rDzo7u12LwMrVcdwYVZc4ayvbfZUkx1sk5RlzzLKX6cQU60vOcJo7Gs2FPb8AIZopi
	 as6of0Tb2B0Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10974CD5BD1;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Mon, 01 Jun 2026 18:55:36 +0200
Subject: [PATCH v4 1/3] arm64: dts: qcom: sdm670: add default uart pinctrl
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-1-c5d51dd96ca0@postmarketos.org>
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
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
 bh=MsvdWsmedbXe2xM8qbb5uDnLO53eFeUuF5Xokz2VAkA=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbmUf03GeJ/3yIuv3nvPczLqp7UK/MvxOYmaU
 YLAC4o9WieJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25lAAKCRB6NCVl/2Nf
 edSlEACHmBAsFUqll2MWoo+6IyaxmTYoo6KMEeAG0o/TnqkMK98buvx+igWtzeRHmwdgnkS6vSo
 mIsTtDfvUPjEZmGhtZxc/aWJ0Y0xgemD5PRN+0ipi+gdHjf0v0yJiiG3fPs4FLAjkpHi9z8Woht
 eiiqUya3wA7cfcbbsXJzBFR3qGPyAPfPpGO/ijzNfHsoaai/zIK+Su9FKYO9WoluCtGbtFvRWM3
 eVhrRof/lxJfHWK7w3yLUdouIpOUo2mu0cco/nMp7Q0eYnrO8uOqGcKLAlpSJl9CIHtYbSS5t0r
 bnKOOeF22laWHIgsjYtlcXkzrVmIf7VJ2o4a5Gl2579LpLMt08RKJ139gCUG44/t3uzykmF9a1F
 pzVAg5SMZg4DMLB8JSLRVxjrQ8Qp3BKm8brO1MATgthzav1u0J2GgZ1Ug35UwDGMvvI7F0aPzH3
 RVDGnjJPTDR7QqbHzzo+lHiFFh/vCcN7R32gpnz/lb/o3Dv7VK/6phS3aQk/qyLOlx4M0W48jWT
 UiLhubJJhywu6GxWFfWiYIcdxeAYltcq8BEkpq+DNn7hxZuPVnyP7RJYKkoDRpAEc9q64xIv5f5
 ng7SYioulwjHw7MEOJ//M0jrcfxhNdZyaPXGdExX1qP5CYdGNNycwcn9L7PvFcdvheSNFqMwsWj
 k31NdlNqYZ27Wdg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110650-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C0C0C622E24
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
index 30844b150c80..1c6c18a913a0 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1343,6 +1343,198 @@ qup_i2c15_default: qup-i2c15-default-state {
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
2.54.0



