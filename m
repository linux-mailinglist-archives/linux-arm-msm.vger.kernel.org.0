Return-Path: <linux-arm-msm+bounces-107637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PdPJoTYBWoncQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:13:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677D542DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03698304FC4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33A7410D19;
	Thu, 14 May 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1pI++AU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B58E40B6C5;
	Thu, 14 May 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767765; cv=none; b=NTwiiIcBEonay9z4UuoKXpkXwGT2/9/TqEnyJcj47XUWbGpmXa//7LVXjMMbEGPFWhA/Hw56Yc76ODgdbgDF7eNL+EXc/3TBsQ/O5vh6/glRRx50SQf5qhGKRbK3pA9hXJRaOgC+sSrANBYouszWFGzf/tsWogU4STQdSVy2Roc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767765; c=relaxed/simple;
	bh=vrnATAN3+lVD+dHrZWu1YRbolbPciScbSaHrT34pu7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcQ7eNql2eKMHXgr3iYEW5N/QGW6igFw8OF9mgObrv+n654nAL0YIctFzx1KMtB9hnID/zf6HdrEMZZLyUFMFNwWTXSZbeBjzci2qcIo7ZMMctoE9lqjjRv7YmH8bRDLwbj6YzudAJTsVedFDtwFTjXSClisrfSUIUux6gM6rS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1pI++AU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8386C2BCF6;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767764;
	bh=vrnATAN3+lVD+dHrZWu1YRbolbPciScbSaHrT34pu7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H1pI++AU3N2GP1NQtUqUpfUWCoy4aCU5pQTmmT+uroE3boab8/Ke98ir8nH8cpL1W
	 h4777oOR1K1p4rAcjwuXKW3I6o6j9DMI994kEWVChHwD+tmtbRF+wfXrkR1PxKYdVB
	 SCGWiynlFN1X7eC2+A3jo9+KWZk61zgjHIIeEBAul8eMZZ7hsQsbQOkY8Vt+nLqOy1
	 XJ0pWnLKqwzsq9M/yo7I/KsGvcUUV0NwWicbhJVSlrrFjEazTKUfIa2DI2nIQ4hvLp
	 U0ZkjXWfd/IZ2MiNH2QLAvUh/304VipO3o1ySaWVeVp+WjV8SWdX/zwO1ZG+gnb8sl
	 Zb+X5D8OiMSyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C642DCD4F3D;
	Thu, 14 May 2026 14:09:24 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Thu, 14 May 2026 21:08:32 +0700
Subject: [PATCH v2 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8960-wifi-v2-3-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
In-Reply-To: <20260514-msm8960-wifi-v2-0-7cbae45dab5e@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767762; l=915;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=AgmB2laCl0GbrLmySaaFvH5zEfoQVILWo5cDVyOQJOw=;
 b=dW9TPkeVXwEXImUIL0KUpY4QC7ZkGE/qqNjWjSlWtluazaBbai+c6RZaLhStzTOsh0iV2OPdZ
 Aq1XtDNLytRASQepKRL893Ll8wJgnnqHzUTCPamQYugTlXMk1m/PST2
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Rspamd-Queue-Id: 3677D542DF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107637-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:mid,smankusors.com:replyto,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Antony Kurniawan Soemardi <linux@smankusors.com>

The msm8960 RPM resource table is missing the QDSS clock entry (resource
ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
Add it so that RPM clock initialization succeeds.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/mfd/qcom_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
index 27446f43e3f3..0defb3279af1 100644
--- a/drivers/mfd/qcom_rpm.c
+++ b/drivers/mfd/qcom_rpm.c
@@ -324,6 +324,7 @@ static const struct qcom_rpm_resource msm8960_rpm_resource_table[] = {
 	[QCOM_RPM_USB_OTG_SWITCH] =		{ 205, 119, 82, 1 },
 	[QCOM_RPM_HDMI_SWITCH] =		{ 206, 120, 83, 1 },
 	[QCOM_RPM_DDR_DMM] =			{ 207, 121, 84, 2 },
+	[QCOM_RPM_QDSS_CLK] =			{ 209, ~0, 7, 1 },
 };
 
 static const struct qcom_rpm_data msm8960_template = {

-- 
2.34.1



