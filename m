Return-Path: <linux-arm-msm+bounces-102367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IeOE6DT1mktJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B768F3C455A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64CEC301727F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9BA3A3E93;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQPzF6Vn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312AB3A0B2D;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=SNTXR6cNkhExnL5pWHdUGWBGBGXXeI0sEcQxSEWbuNCOJLppVsBCNutffSdesF8SajIAUjJlHNjJV3lD0J84u7SumOmVg6bbvyhxMII6HCcwp6DjgfQ+Hja3i5B96pS/0Qbb1h8S2XdbmI58MwKu9o7edSFqOHRCG8geSMmVmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=VugrxAEpcoaq9VvpeVHYFFo4mzyAFJTTi30xWQb6Pkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rf6tXPHLpOPs1Ey3RW0WITZW6t7gCgjXBhdXvWIesjs05NnHojn5GHFpQkT6dP9sQ9LVPLR6EyLrYr/RzEeE4vxMjAZpdxEKyD12o3IeJWp3QxICYUXyP+qtGK9dFTG7+trQjc9/glJU4J31T5B/GysGMAxyUx1Q19tQj6O+3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQPzF6Vn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C97B1C2BCB1;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=VugrxAEpcoaq9VvpeVHYFFo4mzyAFJTTi30xWQb6Pkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aQPzF6Vn67pewcIXCtxfCI8bXpJvqQJ5JQxAxBOb3hbSRy5i5h6kwpHbL5hsVR9tC
	 wWC29n9wAz75QquVv2X/qzPGCCxowEKDBVUiYpYPtODWwSlsRKsYlOotwpu4C7AG/a
	 58GxY8/68QdM0MMYCCM0MI7qZfzrfLi7EyVuoDS+aGVHJLziwsnu5ZIMxSx+GXZ+5A
	 8o5Nn325CPBgDsB4w5I2mGDPwP+EGCs/OfEWRHIFOQA/gaIa8x8W8gaL19xntR+y2F
	 EgTBRi4fa4VUtvOBuB1uV0hRen2fHWPn67jawmQQuVs66ovSkEivDR0tPtRdbyRHGl
	 dhphH8YYpA9uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814910FC45C;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:46 +0200
Subject: [PATCH v4 03/11] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-3-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOS/t9Q5M2mBMugd7+B1QN2+hFxl8CFpy5AT
 r9wo8bBUf6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cskbEADD0uywNEE0C4Qby+S4+XcDg8r/GbAfO73ZJ/s7X57qvmjMTkGGfXcMP19sgrxkJcxhY2z
 zrrYel32XiQtz+OCps0jAH+zm/p3d4UUrKBOybWVORZnRSG399kFlnZcOItbNnHNPfEy+NFfqFS
 Jel//UoxSwOzXV3vdHyc/ts2NkKN+D83pJGXDhBMEeddrtlqySPhJfPNzYSotEGXac1ZLAccZln
 gxvoL5opp2EAq47kAQE7L12qzzqxGLxW8g8zxGmyGamabjlGjqDQe05fi7x4t9UsyDGEE5cPzko
 7zbjOk+YJ4JngzfvrKYbXU5iWxz0BDJxwnjXDDNIH2urZhM1C0e2BWMFxIYqFiW1JIsrGsAAgZg
 b8VdNdMtBxaO710QM5TjtJzUpHekWBtTQwl5ueJeQzXdmUurfzaNPW7M5ViP7BI7qUSV4k1VYA6
 plOTN0DmqnBmOivHy3lCfFqFWMODLtZ28gJcYPQB5EvO1BFcoa6YU396qSbRIa2ftw5aD4+KXfX
 FBw/qmyyZ2iBn2u+5VYO+7vf7aqDXjW1wVNNJwqGqeEB9ivdFJSU2KyhSt4qZ0S0FxwT9KeBoWX
 kXx06/kok7uLh7RiD62AwdGAmxepAhN5Q1NqsK+RXRMLoGyslXwQN1k33nqxlXYLcu67w0xXan7
 Ib7gBUWLHXj/tdA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102367-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: B768F3C455A
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



