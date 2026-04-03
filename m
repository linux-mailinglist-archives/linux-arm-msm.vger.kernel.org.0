Return-Path: <linux-arm-msm+bounces-101702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HrJMor0z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:10:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51664396D85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A89DF304BDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB86036D9EA;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSgRASLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851153D34AA;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236117; cv=none; b=MDztWBlVcff/KuCmgkvhTEpPuvEkcjcCmEL0mqoJYXda7ITG3pOUpovCA0CaQTt/9mFTt2WnssgdP4Uue1E4y7VlFoFbYswopbP1xzOis2vyYButwhfKnhN0hh8Vc/pqQ6EVf315KRm1e1LA5YmvY1THbwhSnTbkpzW7e/3DEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236117; c=relaxed/simple;
	bh=VugrxAEpcoaq9VvpeVHYFFo4mzyAFJTTi30xWQb6Pkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWXWMGUXpKCsiLAuhDXb38eXM/JG56ZP5r7TPPdKsuJZ8a+CdgvV/26uFwjrqx6QcI/YbrgvzwvafIP8qPGuWsOgGFKJSIVt/BK4DenRgsqumd04L8xOhshx97MQWAKCgNcLOiJmJBJnSjgGS5Q4TOBxDGqzqvDm8Hv/F9AXZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSgRASLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B943C2BCB7;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=VugrxAEpcoaq9VvpeVHYFFo4mzyAFJTTi30xWQb6Pkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cSgRASLPiRVA/oV3HW7cmHWjSLVrL3kjoyEDx2o2jGxmx09rdrV3fWaYe1FFoS3il
	 4n5YCPav/M91yckqhjtlup8A+2Tkp11INp+AjO7eCG+/dKoUmyx44kW+YmL9SmeeA8
	 zzWpeehbWSXFfMRpVOnYtOnyOtJud5V7Jl9hgP/q+EUpGnwaVYEbhAPQPAb1h8va3E
	 sD8KvRUb7g9+7yX3hr9N4VGs3EB7Xy29DPRz1fbttorGGEp0xURU57Q8eUPyOXdSfv
	 tIp4AaKmTT2yxIQxl1sNBJCd+L0o6b8NdPUOxR5QnFke4wDbWvCpHIuvF/VRqj/0sU
	 rP7Gb1kxaTSaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE69E85381;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:32 +0200
Subject: [PATCH WIP v3 03/11] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-3-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=FK/zsREY/XInSNUuszAKmQ33vgOOISGuAWF3OsBIumA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPD2ciMWJ5W+1zF2xkDZIGGRF83cEso5lTw
 NeazdGU1w6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 ckejD/99QJLselfRokizkZ/pMTbIr9CjqU09O+JTSttC5Rt3992ZxD/Mcr/NWpwIMQYBVM+NTHL
 POB3ms9p9TFdnbnwhqJC2cNBgEi1lpq3YPktMrJq9HBebt7IYlQECm5zGOUAZBxjt6lO9wXgBFz
 EqqBkQ0k5WoSQCbjprXFkUu3C9HH9xs23mVTa2y9FBzP6xg9aKzb4SZZPaYeFTXP62FvhIzt+B7
 FmXb5cM31no4wpXv5yixEiFqISK/il3glthQxRRZUqCMuew86F36OONsaFojTwiu4EyJQbyzlXq
 3Irf9S9njO5g49Ep4kBWwH5V+tEpp1gwpfsUP1st1yeX3KZ7KlO2i2ms9bMHQMEDrmcijV4PEhb
 g4lnEtu+4xoy42mACK44vNrODmLI3ZG11ahgnxMZfySYHs/64BYOvYvv7NwPMREcaaj8Oa+C8CP
 k0Bxx/RnW+reTU6R9byrrl7KHSHm9CU57S3eD41SZ8Shi60aSplAR40CSQ/+Ae4Rt4tCQPfGMv/
 R7Sr7BQEXPF1FKmMjAp2CFeeWwtHgiIezIIyBsDRXl4PcDNUsmhBlzzJh0bU7oWFGD4f86hVPXB
 53P+CQfw5i5pUeQgnrBE5dPT/SFN+OsidbjIZcDZn2zsaYTcv521FrArgs/FBEusU6kGEy4imsm
 Dm5n0VJeV6y+P1g==
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
	TAGGED_FROM(0.00)[bounces-101702-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51664396D85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 7b1e975a85668..ff884e04ad4c8 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -69,9 +69,9 @@
 #define STMFTS_MAX_FINGERS	10
 #define STMFTS_DEV_NAME		"stmfts"
 
-enum stmfts_regulators {
-	STMFTS_REGULATOR_VDD,
-	STMFTS_REGULATOR_AVDD,
+static const struct regulator_bulk_data stmfts_supplies[] = {
+	{ .supply = "vdd" },
+	{ .supply = "avdd" },
 };
 
 struct stmfts_data {
@@ -82,7 +82,7 @@ struct stmfts_data {
 
 	struct touchscreen_properties prop;
 
-	struct regulator_bulk_data regulators[2];
+	struct regulator_bulk_data *supplies;
 
 	/*
 	 * Presence of ledvdd will be used also to check
@@ -523,8 +523,8 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
-				    sdata->regulators);
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
 	if (err)
 		return err;
 
@@ -589,8 +589,8 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
-	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
-						sdata->regulators);
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
 }
 
 static int stmfts_enable_led(struct stmfts_data *sdata)
@@ -638,11 +638,10 @@ static int stmfts_probe(struct i2c_client *client)
 	mutex_init(&sdata->mutex);
 	init_completion(&sdata->cmd_done);
 
-	sdata->regulators[STMFTS_REGULATOR_VDD].supply = "vdd";
-	sdata->regulators[STMFTS_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(dev,
-				      ARRAY_SIZE(sdata->regulators),
-				      sdata->regulators);
+	err = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(stmfts_supplies),
+					    stmfts_supplies,
+					    &sdata->supplies);
 	if (err)
 		return err;
 

-- 
2.53.0



