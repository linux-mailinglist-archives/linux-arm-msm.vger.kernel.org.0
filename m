Return-Path: <linux-arm-msm+bounces-104866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD2VEOs28GnsPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 06:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4847D5F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 06:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C802C301BA54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB3D322C73;
	Tue, 28 Apr 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUSPYKAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74857E105;
	Tue, 28 Apr 2026 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777350376; cv=none; b=T4BiJIePJaRxEaKGqqO2kMc+mNEaRoOmJvlJKc1Xio6K0Fl0XMQdX32rdjvKpUb+1x9V32HQUK+bA45UCwgqOy4o2RBT+h5FdyWOzxM5uL6M+LjODyC7P+/fAYLpCHU4wc/l0wTv+MswVvjSy/jhNCG281ou/tyM0yLuPwgxEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777350376; c=relaxed/simple;
	bh=a+xsFHmLNY9C3gUwlJuvhvaffSIkdXuSXtQYPaAYGJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Za7FTyHiRyS2H8BFELM1UdJZNoMcr4wBnH9v184UfaWoqTi3q3UZgQQjT3Zlx0P68XsM0gGzGqY47pAqPeQ6Epf630f+kDLnR3RlMbxRPxo9DlK94RAVOfXsoMJiz0cjfR1ehUTTiT6h7qybGqJHyqKnR1wTtn/93r/Kw+ZvFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUSPYKAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89CE2C2BCAF;
	Tue, 28 Apr 2026 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777350375;
	bh=a+xsFHmLNY9C3gUwlJuvhvaffSIkdXuSXtQYPaAYGJY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HUSPYKAvMHvm4nMqUHOWPLWwUwvADoV9oekPXx7P4sTW76IGeGX30BHwBTBTOL7wA
	 SDVM72aZBvNMOlKA4jl15VPCLud6K91rVXkD0Onui1Tprwpul/icdIlUu5P/LRg2zR
	 RqSeuVF0rPR5H1g6rpvqRwtdVixSCbGu2lxNKg5MGD1LdpSaQY0tQzGvxXhFUCVmYX
	 zWiVB5jTFqKIwvTrwaoOGGhNb8s4GN+mOgqtN2TroP9eA1JXppKdOKrV9bByIQ28+K
	 Gr/tfCmjY+1VZ14EVpL1632jQPq+QOspxuXZXsXx/93PPL9lfn33JBOc7Y8VDU6d7u
	 EzG1I45PAiKHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F669FF886F;
	Tue, 28 Apr 2026 04:26:15 +0000 (UTC)
From: Prasanna S via B4 Relay <devnull+prasanna.s.oss.qualcomm.com@kernel.org>
Date: Tue, 28 Apr 2026 09:56:13 +0530
Subject: [PATCH v1] serial: qcom-geni: fix UART_RX_PAR_EN bit position
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-serial-bit-correct-v1-1-9131ad5b97d8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOQ28GkC/x2MSQqAMAwAvyI5G7C1LvgV8aA1akBaSaUI4t+tH
 gdm5oZAwhSgy24QihzYuwQqz8Buo1sJeU4MutB1YbTBzx93nPhE60XInrhUpTJTrZtGtZDCQ2j
 h65/2EBUMz/MCME1V9mgAAAA=
X-Change-ID: 20260424-serial-bit-correct-f5314b627718
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, 
 Girish Mahadevan <girishm@codeaurora.org>, 
 Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, 
 Doug Anderson <dianders@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, stable@vger.kernel.org, 
 Prasanna S <prasanna.s@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777350374; l=1216;
 i=prasanna.s@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=92DZEPQq9gzbYu7wxhkrplbhyodAhccJZR/6Ys8Jr0E=;
 b=DF47/MZOJAkYmbFDkpCZ6t2dylwkyIF5j4bIvczMVo4KyYsJNj6KNfuEMpzXss606rJZzzhSG
 S0SN8xMx2SLAqD39rCyJMDR1wjYT7CE36RGrZiwcm4TIdVZOlgMU+FF
X-Developer-Key: i=prasanna.s@oss.qualcomm.com; a=ed25519;
 pk=ECtn3EnrN+3RY2I0/e72LjFYKGNLhhH+6UU2lBNO4+k=
X-Endpoint-Received: by B4 Relay for prasanna.s@oss.qualcomm.com/20260428
 with auth_id=758
X-Original-From: Prasanna S <prasanna.s@oss.qualcomm.com>
Reply-To: prasanna.s@oss.qualcomm.com
X-Rspamd-Queue-Id: 8CF4847D5F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104866-lists,linux-arm-msm=lfdr.de,prasanna.s.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[prasanna.s@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]

From: Prasanna S <prasanna.s@oss.qualcomm.com>

UART_RX_PAR_EN is incorrectly defined as bit 3, which triggers false
framing errors (S_GP_IRQ_1_EN) and causes received data to be dropped
when parity is enabled and the parity bit is 0.

Define UART_RX_PAR_EN as bit 4 of the SE_UART_RX_TRANS_CFG register, as
specified in the reference manual.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna S <prasanna.s@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index b365dd5da3cb..5139a9d21b2b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -50,7 +50,7 @@
 #define TX_STOP_BIT_LEN_2		2
 
 /* SE_UART_RX_TRANS_CFG */
-#define UART_RX_PAR_EN			BIT(3)
+#define UART_RX_PAR_EN			BIT(4)
 
 /* SE_UART_RX_WORD_LEN */
 #define RX_WORD_LEN_MASK		GENMASK(9, 0)

---
base-commit: dd6c438c3e64a5ff0b5d7e78f7f9be547803ef1b
change-id: 20260424-serial-bit-correct-f5314b627718

Best regards,
--  
Prasanna S <prasanna.s@oss.qualcomm.com>



