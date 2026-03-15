Return-Path: <linux-arm-msm+bounces-97733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IgFHSEAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09616292162
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B37F7303A6D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E4237BE60;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEnxPrqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5C377EAB;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=q9XMNRmwkagGj1ZliTMZwEDHVvmojYelZWwYPcYuG8FtPdvooKPsPq1CSOgdsMCLWWT525NAI56ZURtYJl/eAd7wOP24ng3Pm/pJ35baeDT/V7km1qUtAchpqiFzrqjviZ5yovjplTzbI1oYDwZNWG6nqcDixDG2nWYtqBgp2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=OE7OWzcPJlqAT8CVGaI6jsGmPjH4innzyxD+QaIrWJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHiqAjENT7vpuSizdRwe8axBTLlG5eUiuKTggFjYCY+7iJWX/4+jqBQ0KZi7d0y65BuAfHCo6MApK9REhD7ZK8o/keEAu2Calqd1DF1XnAsm5yAUyJSLMvTQAeRt46b8LyeqMB35T9przA/CwuXXz9SqwzdVDRv8SRBPMnkqWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEnxPrqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 194A8C2BCB7;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=OE7OWzcPJlqAT8CVGaI6jsGmPjH4innzyxD+QaIrWJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MEnxPrqhdrYlKJtk7xYxcvMKOx56Uunbnnup7TiMizDyWCHveGywNKzgivKmzw3pe
	 2jU8M6gVDUe+EUTD1svZYMHXwBvpJyvJxzNs4ajr5o9YNXG/mW1LirFY9K2jCEWT8f
	 psPLYCGlPk7oqthGCHqqtd/UWV5UPCbt0QBPGxNVKStxGFDhY0CLPmytwKC0Z1tJPO
	 nH92ypw9wVvdAq74pZmhbV/JGhjB+YqR76f0hX6dYBqMxEp516nRVgoL7zr/lFhZ+q
	 3NHvJy80o5Tee6b+8XI8wRuyNILkVRBlMe1hUmYN4m3mAUQjBGHaGkSKWfHgEarfKc
	 Gt/hGW5poqAfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269AF3026D;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:39 +0100
Subject: [PATCH WIP v2 03/11] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-3-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EhOdKhE11+x/Pp5ncOXOT4yvdqq55rY8mq2n8Z7WQXQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5Z0FSf7Q5Fkoy2OoYxQlrp1GW/MAjaXRSu
 qRAdgEszneJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 crUbEADDJzfQ/RrknL5YGGGN/5biUQ99qOYqmj67VlRALzcitap0AlkFGa6+xUGoclxrqkZbNm/
 Jq0MzLDu86twESj2MUT0V8/5mAM3Hi6x/WpRcPElcPqaujTWHPr89MzXmMn5iL4IgxySSWLfLnY
 yZU5hzG6ORcy/qWusAOWs4Bj4Li8AjbMAa3LWsQMsz2Db0JLwfc3IOhD1sHP7n9QSDErZFHsIrZ
 9cBMaSeZmEl7ec8enHj14dL/QLSmQzawNByxDeRZcwJ+tvpVT4v5sJxTTfZBBSk6EH4GZk7gWAs
 cSSCtcP/EvPKD9uIiuz34xerrMfEe9ZKhMy3KQJoKBSolL73NlUPoYpy1vPmgtGCjYTU4eAdFhz
 88fpvOlztA/ownZFC105QVy9bsFmRWPFqoaXoOPLabmcSC+K+dnQPLXq6X6vG/Tz0OZQ2b084JU
 rk8v00OU9N371bJLFwIHQVANvxFIwffm4HOqezDli8B/uAviuq7esHK9uIiDffXmRNvtxxk5M+e
 Dc7E5pLovqzI90KourodpuGIs1mTPYKCZmmc8qEuH+1wEJQGOu50DI4wqYPYV3EVJ3l9lZX8k4l
 Gl60GfSWCWrPlgNXcAGRxZjrp9SrJ3+u86XxeMhaMwx/xN2XX4p3vVF1lc7GakbcuWnQ/6YLb4S
 lN+A+31X3hKjM5g==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97733-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 09616292162
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
index 1d63f63e43d48..a9f240bac201e 100644
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
@@ -524,8 +524,8 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
-				    sdata->regulators);
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
 	if (err)
 		return err;
 
@@ -590,8 +590,8 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
-	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
-						sdata->regulators);
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
 }
 
 static int stmfts_enable_led(struct stmfts_data *sdata)
@@ -639,11 +639,10 @@ static int stmfts_probe(struct i2c_client *client)
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



