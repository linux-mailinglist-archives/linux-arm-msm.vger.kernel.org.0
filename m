Return-Path: <linux-arm-msm+bounces-102366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDR4D6PT1mkoJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5A3C4577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B578A303AB62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDCD3A2548;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfXedMLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A34337689;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=XKmivci2IyTZ4uu7GWJKvJUsI/tNOSS/I+4lyyNCXg99DUztZg5AkGtTjmVuHAmZqK4WREsUl6xvQlQqtfyy/SQ0VZyLMsP7Zq9XC8EZyYmC6VWp9OjYSfXOOtbrVCSblOnjuPSq09zLcJu7yUt5aWALlrvGPrLwgkqbOIYeElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=denZNa2pe33zmfsBlt78CCTctUT565Jw4aDwOLwwftk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQUjWNGOn2gK58pKndudWuRkOBbivNar/LQuh1SZ1dRJXWBO98Z4DmcjsyADClWRrYFOq8OL2Jx+06TlyyZ+3Jl1/4JE79nH5ygEJxepjKHBT28vD63jRsJsTP07vlBuVRqyVS/4nkdjwRxJDueA39M2wNhx3VzxEJkU2TlgxXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfXedMLV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6AADC2BCB2;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=denZNa2pe33zmfsBlt78CCTctUT565Jw4aDwOLwwftk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JfXedMLV3fuzCYxrDPksStrohsokhB/Tr797VNHnv6XBYDyHVWTPS/8MHInzYXf3M
	 ecobb3dA78fvkZZTUBv5hwRTz1csSFOpjymceL7v2TJF7Ym4KntBha6C+0YWdknraA
	 YzW0skASp3LxMwLZTn+mPhT444CEY9/bOw2S1dK7j6Oo66a9a6val5t+DXE+lgODZq
	 Pk3aPrOH55F+uKL5H2Nw/rocGpo2PmD1fUIqCJS28CIMxy+hgvZ+GkrsGZLL7+DPeS
	 WDwLh24PIvSxMAqlQztcdlItmnoodHaStx29KmVspghrHxogOSKg9fm5Q3huy+BO8P
	 JUJurVUD0sf5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E8A10FC456;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:45 +0200
Subject: [PATCH v4 02/11] Input: stmfts - Use dev struct directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-2-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tDcuGFSTfadOXIkwoSMoRncuEwaVSpDmbusBAFubYco=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSOL84fbWTOyFbndLfcvZdqyMiF4XrwH37Z
 iGw/ob+K3qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cn24D/9In+35mgtiyFLuVeCbOYXr6G9vhfHM3/pB0mLOouiItk0OvQe29Awps6whdhLiVs/lmB2
 Sw9h0uSPjoJd/uZDCymi1GfHxtiKI5M4ICLr6eA221VmOLq78Jt8QCPAF06E2mc3awd/Co6BtKC
 6XEb7/xeGZpLjuZSjzxI59JKIDzC6aI7ux2VSNW290azRPHinn2B6JsQ1r3sm1xh+oTKEikqhDv
 YeDsluoU07szD8X6u+PT5/OmghbOYe3HCB0jZt6OicqRDZDbNJtyPoIdwki7ziIjybMddYa0SNx
 vSIlITGxNs1Ls0A5eUdvo9aSyTo/4QQ61iHU+rEJRBKRb9Azv4lGvz6Rd5BEL4GJHEa6JzFAhXf
 BZ3uztdTgZVHz+QdHf4kHpmrl2uPFsln/tVIZd65FCZIZwJVbPPIA4EYIx929XPaDvfIUw3w6XG
 D6Tt8CnoUaIBh/Jr+DSQvMqe7JgeqtazZfvmBnxVT/4sBNJMweavOWmIyQY0CT1VBswxwM4XJhx
 TLrCRW3kjDFU2BNbCN0Qded06OItwUANzv4kY+qAtoUqOUkB+8N2x0lyxM36eL6Lv0hA27GabVN
 f339RV0iqw7IU+Nofl5tVx3Jvkbuu8PrTR26siXMZ1Nkf1ypQcBxDgmCbMil/zQczO0IooSJDnf
 xVMrRpjQrtUcQwg==
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
	TAGGED_FROM(0.00)[bounces-102366-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2C5A3C4577
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Makes the code better readable and noticably shorter.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index def6bd0c8e059..7b1e975a85668 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -619,6 +619,7 @@ static int stmfts_enable_led(struct stmfts_data *sdata)
 
 static int stmfts_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	int err;
 	struct stmfts_data *sdata;
 
@@ -627,7 +628,7 @@ static int stmfts_probe(struct i2c_client *client)
 						I2C_FUNC_SMBUS_I2C_BLOCK))
 		return -ENODEV;
 
-	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	sdata = devm_kzalloc(dev, sizeof(*sdata), GFP_KERNEL);
 	if (!sdata)
 		return -ENOMEM;
 
@@ -639,13 +640,13 @@ static int stmfts_probe(struct i2c_client *client)
 
 	sdata->regulators[STMFTS_REGULATOR_VDD].supply = "vdd";
 	sdata->regulators[STMFTS_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(&client->dev,
+	err = devm_regulator_bulk_get(dev,
 				      ARRAY_SIZE(sdata->regulators),
 				      sdata->regulators);
 	if (err)
 		return err;
 
-	sdata->input = devm_input_allocate_device(&client->dev);
+	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;
 
@@ -664,7 +665,7 @@ static int stmfts_probe(struct i2c_client *client)
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
 
-	sdata->use_key = device_property_read_bool(&client->dev,
+	sdata->use_key = device_property_read_bool(dev,
 						   "touch-key-connected");
 	if (sdata->use_key) {
 		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
@@ -685,20 +686,20 @@ static int stmfts_probe(struct i2c_client *client)
 	 * interrupts. To be on the safe side it's better to not enable
 	 * the interrupts during their request.
 	 */
-	err = devm_request_threaded_irq(&client->dev, client->irq,
+	err = devm_request_threaded_irq(dev, client->irq,
 					NULL, stmfts_irq_handler,
 					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"stmfts_irq", sdata);
 	if (err)
 		return err;
 
-	dev_dbg(&client->dev, "initializing ST-Microelectronics FTS...\n");
+	dev_dbg(dev, "initializing ST-Microelectronics FTS...\n");
 
 	err = stmfts_power_on(sdata);
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(&client->dev, stmfts_power_off, sdata);
+	err = devm_add_action_or_reset(dev, stmfts_power_off, sdata);
 	if (err)
 		return err;
 
@@ -715,13 +716,13 @@ static int stmfts_probe(struct i2c_client *client)
 			 * without LEDs. The ledvdd regulator pointer will be
 			 * used as a flag.
 			 */
-			dev_warn(&client->dev, "unable to use touchkey leds\n");
+			dev_warn(dev, "unable to use touchkey leds\n");
 			sdata->ledvdd = NULL;
 		}
 	}
 
-	pm_runtime_enable(&client->dev);
-	device_enable_async_suspend(&client->dev);
+	pm_runtime_enable(dev);
+	device_enable_async_suspend(dev);
 
 	return 0;
 }

-- 
2.53.0



