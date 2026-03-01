Return-Path: <linux-arm-msm+bounces-94752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBGsBqN8pGl4iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:51:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2C1D0EBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62A730166CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4008337BBA;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sp4Mjfgg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4E1C7012;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387479; cv=none; b=PewTD44FOqK/6sxOqw4vsg8xvAjgL0EQIfP8kl6wEhQ8QVhJ91KaFPNJoYaN7blcJstaq1aYoTuacGYavzpF0eL56uj9Tnt7MCDSueS5CnE/ERBOlvNnGHU0sBGYTFIism8C8YYquk3r9NlzGxB9zs7fvcAamEJcX5lFkpw3uuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387479; c=relaxed/simple;
	bh=n23ZcFkmyPNEvO2IkqQ957PDqVWeO4dI1IFebDR/vt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8ey2xFUB0MOPmMaDM9TWN8BSsW7UXhCxaSq0sJm+qr4ieceHkXpXBxfRaelX1lMP+RR8/JLTUeiKbuEgKc3ONk8UdUtw6AczopM8F5ElA4oEWqbFUOaIjShWVvPHtp4nWN/iMLBnxVZbkJJtd1wyKuri/zmxOLP6Jrv8shGQLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sp4Mjfgg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B6F9C2BC87;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=n23ZcFkmyPNEvO2IkqQ957PDqVWeO4dI1IFebDR/vt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sp4MjfggG+nw8htHlPxq+Xi5qN3fZ+0/9AGUstqO/BykF9za20Ok3VwQU+80HvGyr
	 tn+HJQ02bAuQrO3m1A8B9n8MC4WvQUdf/LuWuj765/Vwwf63q5hmXii6hnSP/Lb1TB
	 xmqQOGpj2lKXLPrzysiPpidJN26qP46I7KNuLzpOZN+gLDZ/3s6Cu+qyq4ngMlEmGT
	 vsNUYKaoptZWZ/V6v6QmazpXf/32okUsDnLd6jWAbKNRJ+uvRh42fMDKPvB1L6NVlo
	 5G9F1GvXnpeYjBFKXe0VXuLOru6ZmCVG2yX9CNX3GcoEcjC8Ow+T3eQDB73da7pgeJ
	 aDatin4/FK4MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516DEFD0071;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:16 +0100
Subject: [PATCH 02/10] Input: stmfts - Switch to
 devm_regulator_bulk_get_const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-2-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
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
 bh=gp0Adpeb0dgRnIzbTX0yz5VA3gvM4FK6mupYKoiFMj0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyURAP+6GmRBdj1YMjGOxEXecCpiSaiwdK38
 nv4OmVUw1SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cuMlD/96F1ggG3DCx9p28DKIQjERz38LjXqEcedMM/S+1ZJUHTM4uyM9XUaHyO6V9e1/UUxuD1A
 YeTodQ7ny4ouLM14vM3Vo24MD6EaOJxpVWPLm4IxLESagvS4gNalrkbrf/Y4v14mXDw1kXWpQmw
 M08g7WifVWBuHyOLnZ5EHQ4ueDqhDnGzoXvR1AxUCxZoUa7dZ8Pr49Uy6M7ZQKPY1SHVspziZ0p
 A01pQkrJoCZbXvvOY6oDBV99mnx94lydjM3NBbyQAi0fzooZEbUtvjYEEgRtdNlqZIMqhO6QnlH
 oEciiUverffQU3Nfx09m4BuyZNjFpkWFunIGuj7C4Q2bJufTQTtYv72FkIIGzvLju8yodpEqpBG
 GRkkLCRg9NQh1uRL3DxNkIrFFfqohEgb+BGzaR6OwXYeRhu8+AN8uiPoVevSlW+rvz6XRUBFlWV
 fGbsCL4Q0YpRe9BcnRw++lj5nB3Y0+Kdp3pNlh0VRYCFWexu9P8CtrQ1u1QHNPdLbULVDqANTaC
 M6yxpV0co47vYcmJroF9Pe5A9H49Ybv5B3Ne1zIGtyNGYc9d8yFX97MlY1y2x7SVaW4y3Ceu/Iz
 YMENmGjWFOVfy6PHDlXcknxLtc3HYQOqt4TiDXL3dSPdqM+faTPtxiJbGye7WEmtgSxz+zEFVi0
 xga+b9htJMYCDaw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94752-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADD2C1D0EBE
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 27adb139fa0ce..7c0f94ba49464 100644
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
2.51.0



