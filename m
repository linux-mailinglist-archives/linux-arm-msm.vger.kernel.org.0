Return-Path: <linux-arm-msm+bounces-97732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHnuNRMAt2mbLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6B292128
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F2DB3029240
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2537B03F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPqmzh8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B437186D;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=JyScwMflnLOUYPwfHSm7KbiOpUa8vkJ/EdUnqSe7xSLzOc8AAowTLU8SUqKg8UR/bNytYeTLZZ3uGKNAXFRpYfJ4O0mY+5y1Mc45Y5KFb0tERLH7H4N8rKBtYozXnt1sgTZ8s8P5615VmH/TbALFEHYPICwZYo3llaVcRwh9NcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=bpoQ6IKRn/nSvcKPsUyUF/0JXmjhDnP5GYWVeoS0EgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHf33fxvAA4N/C2bhtIWN+d5kIuihXvoIZKLflVS+WKLKkFQVuPSt9SYN5U0MnH28tC1ZzHGCpPSI6PAu3khdsZApapEbNcVIdyvC0SxxT20q4Nj0SxWCja2k6qbK3UixaQfiV81ynFWVwZakDturLWRgMe1VEm8ne6w8I0jIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPqmzh8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7752C4AF09;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=bpoQ6IKRn/nSvcKPsUyUF/0JXmjhDnP5GYWVeoS0EgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iPqmzh8U68Hm7Y4tB4oFsmEvDowG0+zf//hpvsUrNnbehswQc2RIUEJeQvmZ9rHSP
	 UQORJGs+WkyT811DmRbdR46XMtk/Cvq1vFt2Odi/ibiaxrfyfwQhNrUboQOdZP/WG9
	 +0QkquFhas0oq8jV2Fp1IiASO4bALaHRNzN/9rP+/iCG3RRKvgpMZ3C5vxZWNzDuYo
	 6y9H6nU+V/RQTBKEWNe1KxJ2lxmtM4jn3HhIRqxh18EAsJeRc4VQmo3Tu0OxRftQrO
	 2XOi+pR/evBTi7E5pG6v55sxkVne+htR0IrMhHBZmmJeho1bwgd2bY2lGyAS1Q+zsc
	 Y0uie53wPKObA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F48F30281;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:38 +0100
Subject: [PATCH WIP v2 02/11] Input: stmfts - Use dev struct directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-2-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qhTFo7x1eamQnc3/H+5w4SpN3nDelhQhEumWc7k2sMo=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBptv/5Yr34vjKy0xgLLgkBC0dOUx3DaiISzKFsn
 GzkYMtkz2SJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cvQjD/dUpVDBUYUofQaoDk47EDAEsI2f+XX1V1uQdnNjhz059wkVp8lYqstPIcTC+b+vQMF/yY4
 G6VNezIC2/okkeDEyFXpg8WxIJUDftQZ4qqEnDeV50T/j7W/A+9xHnVt2/KLzxxKaGzkCEQUhuR
 x4XvUaNZj4fL9ThLwAnLxq3naluVRvFv3VwJT5wbJS48l/ZbmceLpBbKnkqoAk85bp7s1NNCcu0
 rp7XzfesUiOlttRBNAaj3kYY1vZuNBAnbli+xk+SNJZWD5ZuccH7zdBNwQ3HJJrbvaSI7TjP5oI
 hjnUNq70Mb1pkHJlrudI1bFL+555wTcanGVgQPDywH0ETKIaaMIT1QvYz6j4ZOUTCMZ/bdtA2Bk
 6uXhGEo+OF63HOsaNbFeNA7rfNzghE6eUGxWpS+KCDygaoiJfPGHMGSJbW0oVkC2s8BWkFOvZYc
 Qy5J2FdX0/X1V5nr2dYkATsu1PJbKCdrTr+FtQrniuqPEOhVwLjx5xmapW53SoHrZRFVxKtYelb
 2fDPHqq78TynzV53fRN8foRYutV1cQeAkEF0ViKH48spaPbyDaAKiv0h/H21qdq03+ANqskYeT8
 uFd/CM8cg/paqjKDunUEKnpLMTZW6WvK/0S+ZcBvRVL+ZqySctYZpv9qtWmTXfqpZaZkWlX4sp7
 +53rUohKjjSTX
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
	TAGGED_FROM(0.00)[bounces-97732-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: 82C6B292128
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Makes the code better readable and noticably shorter.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index d93ce68feca51..1d63f63e43d48 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -620,6 +620,7 @@ static int stmfts_enable_led(struct stmfts_data *sdata)
 
 static int stmfts_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	int err;
 	struct stmfts_data *sdata;
 
@@ -628,7 +629,7 @@ static int stmfts_probe(struct i2c_client *client)
 						I2C_FUNC_SMBUS_I2C_BLOCK))
 		return -ENODEV;
 
-	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	sdata = devm_kzalloc(dev, sizeof(*sdata), GFP_KERNEL);
 	if (!sdata)
 		return -ENOMEM;
 
@@ -640,13 +641,13 @@ static int stmfts_probe(struct i2c_client *client)
 
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
 
@@ -665,7 +666,7 @@ static int stmfts_probe(struct i2c_client *client)
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
 
-	sdata->use_key = device_property_read_bool(&client->dev,
+	sdata->use_key = device_property_read_bool(dev,
 						   "touch-key-connected");
 	if (sdata->use_key) {
 		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
@@ -686,20 +687,20 @@ static int stmfts_probe(struct i2c_client *client)
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
 
@@ -716,13 +717,13 @@ static int stmfts_probe(struct i2c_client *client)
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



