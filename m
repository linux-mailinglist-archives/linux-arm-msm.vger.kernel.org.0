Return-Path: <linux-arm-msm+bounces-117930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mT+kMItpT2ohgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BBD72EF2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:27:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=HfKXjrK6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E30A30B043A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71956401A08;
	Thu,  9 Jul 2026 09:18:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359D9401A29;
	Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588717; cv=none; b=Pb+M+tNrxZ6BvHXQIwyEr3SV8R0vvrh5IZuTz9zg/hZT6Frgx/Dt+KoqZOEc+Q/jjF6VnCo3gc1jncYUYiGwqGaamt2NPmOo8926iRSgOMoX/Vodm5pUENHEybtgoAtg+iHTeLo/kGyQGNKK8KasnNyKH2MZiK03WLbNaYKyf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588717; c=relaxed/simple;
	bh=JqCXiscIog4kZohcOHEPHuzfiLGUqD9PxagctliMr7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLC7GXBg/LFuTMwYon9qr/Xw9UiIcBUCcJEIoTYABbhn9mvezepEvZj1K95bSRsGwYbQyFnN8J4dMSPGpYQXmEGo3K+sooRQ90bvR+lwEy74gS/Ku+YVwxdVSfQ0bEEJX3QR8EK6zdOLsnk++cODhPMlL8wq1LNo7/wrRKQUPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfKXjrK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CC34C2BD01;
	Thu,  9 Jul 2026 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783588716;
	bh=JqCXiscIog4kZohcOHEPHuzfiLGUqD9PxagctliMr7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HfKXjrK6446RDNbM7MxPkHJR6nRyO6E4W4NP9FxsDoWnneZ9JxtoElYQFC5tqnY7V
	 J4erZFRxKb4IyqeuNrcEtHU1xwu8AU7fCGxnLmnGqgq7K00qTiJd5tKRcxNs4czQtA
	 WMuMJdFbTHLvKQld5pIA9dIX4qsH6EHDtHC4pcezkg0+L6525UQOZ8ioMxtyhLa+qH
	 U+OR5nR8OWrpfu1ctqa4+ivN21YJIOWAZAhtKlOI9HWLY3U/15z9Tq/R9GaleRUtR5
	 8Z54rhXxKjv/HZd0B/z53j9nIYUmG1ZEhvcOT8pCTHl8y1DHxDh7qeRCulQcS0xAvn
	 g+Uh7p6lQgT0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A67C44506;
	Thu,  9 Jul 2026 09:18:36 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 09 Jul 2026 13:18:31 +0400
Subject: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783588713; l=1135;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ymJvkEJnDShOUP8UxN5TyZg3+NjK0WZUomZnujMqESc=;
 b=RYY8skanotxliOrV7roe0ikM4OLojv53aWcRD6phI/hhClq9Vonk38JCmUCOBpbH0Uwfhe3LT
 liF6nLYmr4xDMXkyIZ5aIbG3FJfkIJLm+qzVdNR8dXc4y4CmyeQtz1X
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117930-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:replyto,outlook.com:mid,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29BBD72EF2C

From: George Moussalem <george.moussalem@outlook.com>

Add node to enable Bluetooth support on the IPQ5018 platform.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..8c252fa3ff5b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x21000>;
 		};
 
+		bluetooth: bluetooth@7000000 {
+			compatible = "qcom,ipq5018-bt";
+			reg = <0x07000000 0x58000>;
+
+			firmware-name = "qca/bt_fw_patch.mbn";
+
+			clocks = <&gcc GCC_BTSS_LPO_CLK>;
+			clock-names = "lpo";
+			resets = <&gcc GCC_BTSS_BCR>;
+
+			qcom,ipc = <&apcs_glb 8 23>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+		};
+
 		sdhc_1: mmc@7804000 {
 			compatible = "qcom,ipq5018-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x7804000 0x1000>;

-- 
2.53.0



