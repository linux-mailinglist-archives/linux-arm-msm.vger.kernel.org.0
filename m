Return-Path: <linux-arm-msm+bounces-89827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J/IBFVscGkVXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:04:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E251D79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F1E5C8842FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD9042847E;
	Tue, 20 Jan 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgpO5/Z9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B76428465;
	Tue, 20 Jan 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911869; cv=none; b=l45Hm6jfqhY8lsehdF7lOw+FkDBOhSWdxWhBf4p7SSUYVot2wjtHYy0wK+sG75qEdHXoWig/jwOt3VpvmxbjFU+8Jhr6iphg5lFlk7e8pcG1uPQqICe08fC9K/azUlzD1Ouf1qYE+yyKRRFeX08npSTO1E/eqMQmOD/UlesdnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911869; c=relaxed/simple;
	bh=+GDS5Ka4JfFFRKo4XCI1kSJvUGwb95jXYoQGI0+dxSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELEJh4Ke1TXHlNAyMVXPBCb62k39HDdZcjfMncEWBUwaBfLo816DdVU1zhqt3UJUGTmEp5Ve9Eswt3Z6GlA/VX8yOVpb66guJ2mNFQSQvtfSubycSqJw8XyfaGT1c0rHcGGlU6OhupON0MDSkW+vAZElFfWF7EtvDgAFOZpyZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgpO5/Z9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E081EC19423;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911869;
	bh=+GDS5Ka4JfFFRKo4XCI1kSJvUGwb95jXYoQGI0+dxSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YgpO5/Z9SJiB5t63rmDwcdZS3luwI95ErpWZOVZ6hC/MBlzd+kEKU3beQ8GaTjGQV
	 zGOO10d/0tpUEpPd7aHQ/vqdwYttNNqYo5GP+NthNSGL7TowvNu+T6wB3swvi6UOIS
	 wOBjSEO/MjYE6GzmmeurRTX/uH9A6CgHubgAS3hUNxdHz5n6xcVs4c+Hqf2p+VY2V1
	 TErJ8oVSRZt/iKzWaVH5lYRw5QlirY7gB8OJNUEWFGBB+yA5a9ZpQQU0MXlR0oZR/b
	 3PTVK3PuQ7a/ouJ0HTZ1jDGKMXpHr4COMl5ApO1xTTXGACUHYYJ42MjMu7BHc/R83c
	 3aH2sMk1RDKwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF64D2ECF7;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Date: Tue, 20 Jan 2026 13:24:24 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Correct
 uart instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-akatsuki-uart-v2-1-867ee7f042d0@protonmail.com>
References: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
In-Reply-To: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911867; l=1043;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=Uiq6uInCG+ev6OjtV0dsVw/tbeOLla0LBEDxIr+Q7H4=;
 b=e4omXnaL5Zccdi2Xe4Z3YKy8cyONcP6HQcIYvPqEfKP8xEGBIQeumy47YRbY9jMwZfGPleZHv
 JE3vDo2Jts6D17GMBp4qKxYzOzXTwji+UGHmpfBMzqknx+nfEd5oPFU
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com
X-Spamd-Result: default: False [1.54 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89827-lists,linux-arm-msm=lfdr.de,petr.hodina.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,oss.qualcomm.com,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[petr.hodina@protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,protonmail.com:replyto,protonmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 773E251D79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Change the uart instances:
- uart6 is for bluetooth
- uart9 is for serial console (available on the uSD pinout)

Most OSes assume serial0 is for console UART. Bluetooth interface uses
UART interface. uart6 is standard debug console and uart9 bluetooth on
SDM845 devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 7dc9349eedfd..68841e036c20 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -17,8 +17,8 @@ / {
 	qcom,board-id = <8 0>;
 
 	aliases {
-		serial0 = &uart6;
-		serial1 = &uart9;
+		serial0 = &uart9;
+		serial1 = &uart6;
 	};
 
 	chosen {

-- 
2.52.0



