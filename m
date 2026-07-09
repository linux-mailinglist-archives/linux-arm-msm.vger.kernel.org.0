Return-Path: <linux-arm-msm+bounces-118067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8MswJEjWT2r6owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4276733BB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:11:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=CA6KugSv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0C031650B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 17:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E45A437111;
	Thu,  9 Jul 2026 17:00:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5339E19A;
	Thu,  9 Jul 2026 17:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616416; cv=none; b=VlsuCKtZa2ZEqQNe35jE+yLP5U5+p0vl2/9JJ/a/oN7K/1JvWp1QkvkPbmjcPzK0L7cq+P0Jd3mJHlXLDWLc9mLqMWEhL9Ac/2WdStCO+xO0PYR1Om7O/pO4MMGn2C02X38HX42VM+cuv3NJ4FDwUab9dnFBiS+W3DK5ZsUOQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616416; c=relaxed/simple;
	bh=BgOB4cA8VuQ/dZ/q/j/sqfbK5UXDzkPMDIFs+OghEXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CpspIsBLhholBL+rdFjX5A4ta2jtrx9YWY6FPcWmcg7hoNWTkJ26Szd3BQTUoE4gw5eeCyDFsgimbgJOy36Pyg3dNxvw6EbbFRidEwX47naxll91TLSwIPdy4QhgVBcasTWRgHkpgcAu6wLfBQtAyQpxcjcv20guaXIGRcCJ3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA6KugSv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD88EC2BCC6;
	Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783616415;
	bh=BgOB4cA8VuQ/dZ/q/j/sqfbK5UXDzkPMDIFs+OghEXs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CA6KugSvuBiMMvCTNT+U5g/sSPhmtle69wQhaiev2x/1qrq+5UOKL29C7WglUxzpE
	 URXKx7uYkPDoQchilFZ2KpiTF0hSw6RaCTScqB8q1N8yHbiZfYMfSYXnihG05K+KRL
	 PRcjiv0UzgUvs/FsVZ4elZmchEgBvb3w/MpX3TMzd1eDMdDEcJg+yYRmBeO6psBPtz
	 qSYzjDCopmEAJ2fXN1Q/flht1nsiD/Hm3jab0HuczHFGz7J9+BdXel63KIJzZATA3i
	 ooncOiQ2M8i+sAWeJXWC6HanlikCVMrBoWzyMVr7wEJ58WDLTkEc9oz2sO5KXwl0VM
	 6IWnIre8e+FIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F95C44501;
	Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
From: Federico Amedeo Izzo via B4 Relay <devnull+federico.izzo.pro@kernel.org>
Date: Thu, 09 Jul 2026 19:00:10 +0200
Subject: [PATCH] slimbus: qcom-ngd-ctrl: fix ngd register base address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJiyjgVYyLtox1TCwyg4SEc
 HcqLN9f/AWUhEnhViwgNLFynzLsqYDwcikScpcNpSmvpjYtDqH/YIodCkXWkQS9U8Inz+gubW3
 PzjaVbyAPvkI57/P747D+/JvC+D/Cum5SVOQHfgAAAA==
X-Change-ID: 20260709-qcom-ngd-register-base-fix-a59713a184b8
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783616414; l=1498;
 i=federico@izzo.pro; s=20251017; h=from:subject:message-id;
 bh=YJ5NoHF16uL+S0+ruF7CdiW1W1Lj7X20ZzLrfsWs2uc=;
 b=6GKaN8cIpOR7P8+3A1ZUNjECNDVngPPRIiPIxLZutcAZeSce1HTeKWXEVgcnXYLH/hxn4qBbg
 QcvpdMOTAjfA5cvKg83OeN5nGnFp480VGzyArEMjuTzRhtT5iQzGZbf
X-Developer-Key: i=federico@izzo.pro; a=ed25519;
 pk=XfmNfpH48k8jLbId5NKrp0yoKoFb/uLjr97qIxBImBw=
X-Endpoint-Received: by B4 Relay for federico@izzo.pro/20251017 with
 auth_id=544
X-Original-From: Federico Amedeo Izzo <federico@izzo.pro>
Reply-To: federico@izzo.pro
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118067-lists,linux-arm-msm=lfdr.de,federico.izzo.pro];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:federico@izzo.pro,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[federico@izzo.pro];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4276733BB1

From: Federico Amedeo Izzo <federico@izzo.pro>

The slimbus controller register base was calculated using the
controller ID and the register size, producing wrong results for ID > 1.

The expression reduces to ngd->base = ctrl->base for controller with ID = 1;
but for ID > 1 the other factors produce a wrong base address.
This bug caused a crash while trying to bring-up the secondary
slimbus controller (ID = 3) on oneplus-enchilada with sdm845.

In practice, the correct base address for each slimbus controller can be
obtained from the device-tree, so there is no need for further
calculations.

This was validated by reading the version register from the WCN3990 slim
interface on oneplus-enchilada.

---
Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 80877e951849..91932f8d021b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1547,8 +1547,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->base = ctrl->base + ngd->id * data->offset +
-					(ngd->id - 1) * data->size;
+		ngd->base = ctrl->base + data->offset;
 
 		return 0;
 	}

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-qcom-ngd-register-base-fix-a59713a184b8

Best regards,
--  
Federico Amedeo Izzo <federico@izzo.pro>



