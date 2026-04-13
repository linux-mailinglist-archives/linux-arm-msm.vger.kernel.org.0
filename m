Return-Path: <linux-arm-msm+bounces-103003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB/JHfo93WmqbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:03:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E809F3F2651
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50DC5304240E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8D13AC0C4;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtTLeEbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0564391E41;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=fOwCNmFOD/aIkt/B+7nUd9IXNA9n0EVuCEgwtcSmjHi8BJzyxvM2zuzDSNg2y9DXZXRhSGE2XkkjZqOlBCCjEB6jJmNoAwyu65oAEp7nTcVecbvziudNcGrXghe31q1z9S42z4KxHBor64iS/9NqJIt1AHiHQr8YQNV0CWJ+jSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmN7s5WwfPaKYGLCWsVB+USKmFSuBaB/P9itANxFMoCXKCOsCEvG55pTdrt/wO8NlVczedcS1XS7rbno2CFvy1T6fFXGcJJ2a0fO0kt78oa4JgIu1tXHmJuw74++eJMQcJId/3YtdElgAlszCFmc04OcO5KF2ZxIRxLP3RYbzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtTLeEbL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46E59C2BCF4;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YtTLeEbLoVwJKghdvtSvs4zywEo+R0x6WPZEHlTK3RdL73/B0la538Ca03P2Q5L4X
	 9egVtuETFYLOVJxaRh1JeluDaqOX1YmxkM+qwFqNCngE/cl6bs+14RT1VZM9xALRxl
	 JUo6rR/uXM0TKayYXUOcNUVp7lQGf0vkUHUWvYJBqoRwAxb+Wt0URiCxv80oWGM+v2
	 vj0NI2L/vwtSfkK1NkYEzONWodWB2hhTgft1oQ3SYTndNXu13pDatpMlc/8GeiAzv2
	 n6mrruM0hc6WDbb5UjtLOzwK9dOS+9t/uw+0lZMaXXKWsnqbehXsP2veBahI7sGSWO
	 wy32aWboWmCMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3985FF531C8;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:31 +0700
Subject: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1065;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=lm6L9ISuVUk452Tk3hf1nHmfNzhGhKGjXfsugz6Twlw=;
 b=fDOiKCmxII9TBBmEZyOMDLtBo8m1W/ylFd4VudNQXCovL0Rb1P/rj8jd+7rGdKaIaA0DF1nV+
 BDaJU64aOPRAJWm3b91jNX4oy2r4dBmIqm/26N/hREfE7hyCwt6yaR4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103003-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:replyto,smankusors.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E809F3F2651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add support for the "qcom,rpmcc-msm8960" compatible string to the
RPM clock driver.

msm8960 uses the same RPM clock descriptions as apq8064, so reuse
rpm_clk_apq8064 for this compatible.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/clk/qcom/clk-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197..601f60274113 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -502,6 +502,7 @@ static const struct rpm_clk_desc rpm_clk_ipq806x = {
 static const struct of_device_id rpm_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
+	{ .compatible = "qcom,rpmcc-msm8960", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
 	{ }

-- 
2.34.1



