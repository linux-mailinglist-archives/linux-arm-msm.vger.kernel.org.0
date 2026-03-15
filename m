Return-Path: <linux-arm-msm+bounces-97735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNAEB0oAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:54:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 782EB2921BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 751CB3047061
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC65637C0F9;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu9zAYsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5137B3F6;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=pO/4Rcu5aUz57qZt6vU1SC06nCe8PzIL5YYZnSSIBZlQtUDKBS3WS99p1Z5WXp50wWBW49k1UmWNOFlr12JlGXiacmQve9yfUWGc530b3wE9R5R1uLLwTzKq90JCeBODbpoxr8NT8HQ5K10MkSe9rs22N8RYBonGxDvLBbgDDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=qua4z1+dduswjPIAqw2Xaw9gznNNtYVooXIHVFd03DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amQJ6WwSk0IzHRrCsaQITq0Tcbz6m8SN2IH6D7dm/EEYP0jwq3m7mzXOceVFuOnyiGcG4VhUZY0X95q8IvUvHolX5t9Y1fyQYoLs8hL3nVToVRPsid3XY3okFufR2VeA2AtPDYTY/yBeppsgsgfvp0mE3UzEXve0AEACgiY0BL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu9zAYsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D4BC2BCF4;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=qua4z1+dduswjPIAqw2Xaw9gznNNtYVooXIHVFd03DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mu9zAYsAmWH3q/tekgJujaeA7dI3wlszIc9DBz6N5F3G5aNGtvZLkCWkt95qbscT0
	 x8iBPfD1uu8DtQDQKkVrrwW9WqFodijpsoXQDxYY9u07BPq7zf4CP2VKan200Ha/Kj
	 blJQOiF1/gMhVDti8ceDWZqhsvbzUSf/CCsTmnvIzy8DRYicw3bxJ0hl5bqYHzedwD
	 OYUPGFXhIGVkL16f+kPf6jRr8j0dFyllHmg2ge8z2b8Joc6fT1n3qrZ+wjkSlmp8MV
	 +Zc/a+TtGYgx3xXGFW4tzzOENw1uvrTLDrOmjpuO0IgzaNxtQBLnrmN6k9F4lIWc66
	 4P2ao1vqdq35g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3933FF3027F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:41 +0100
Subject: [PATCH WIP v2 05/11] Input: stmfts - disable regulators when power
 on fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-5-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2qW8ngTjzm302YCB/fjirEd8lBZHppTYTL/irHDu0sU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/53lQgPZkVE/1ff0MlL4oM6tmmzYpj7LZkM
 I5gtNehdp6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ckTBD/9d4Fas9MuxGRDBXkRc2fYIYSoRcXx3TcyfKoIpKrnKUiK8rzfIU0SlAg599HVJq/cpPA8
 t507y5DmYEyhyMwSGAFKUnp366aMbjBfX68OV3Zd1ofuv/IpqFwITPliK0N7EuNo/RSQZCBo6m4
 n7TqvPnXGYBJdg51oS9ZYyFhfvmRYm/JMuHTv9EE/hlgOEMS0h40CbticIBAnLqUGaRIxCJNU2L
 Ita88L14n5Qj7eKV9XF08aiVVC9jfT5WPnNmMZFkkYRrQA2ux729GVwUJc7dywNMBl5c8cMjfJR
 hqAOcTfglNYc4X3LYx8p+HrWv9yEsU8X+qyztoXxay7qriMRC7uwBXLjUnpGTg3XE5f3JF0j34u
 /uKRr5zUPrL8805QQF2HKlEXb+Tl2ldFi7ZrsIKivSpuVxSkOOkK4B4g9jlIcRsmT6MwqcWGRMa
 gVS53sC9SIrVRjrAXzw7DSIfjijn4seWDo1QMA5u1zsP8ST2iK2o7MqUphqIgldofokB4bON/v8
 lbgb3wImj5mUgeykHlkU1IkqmlKtBMF4Vl6ATvDNjAw3u3AgXDwAVhtwU3YGZi4fGym3hnG0XNE
 ugj0bO65jbRvjTbAa+LtkKMdq0uOylPQrE0W7tAYp1GJgUfhAtZk52ortLkepchu4YQMZofd4wu
 dPGniMVnb5dUODg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97735-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 782EB2921BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

We must power off regulators after failing at power on phase.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index c1c9570ddea2d..bf176907177d0 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_read_system_info(sdata);
 	if (err)
-		return err;
+		goto power_off;
 
 	enable_irq(sdata->client->irq);
 
@@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
 	if (err)
-		return err;
+		goto power_off;
 
 	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
 	if (err)
-		return err;
+		goto power_off;
 
 	/* optional tuning */
 	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
@@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
 	if (err)
-		return err;
+		goto power_off;
 
 	/*
 	 * At this point no one is using the touchscreen
@@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
 
 	return 0;
+
+power_off:
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
+	return err;
 }
 
 static void stmfts_power_off(void *data)

-- 
2.53.0



