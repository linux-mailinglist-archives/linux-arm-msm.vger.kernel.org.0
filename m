Return-Path: <linux-arm-msm+bounces-94757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOQ7G9p8pGkkiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F21D0F59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA3583014C07
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA533CEB9;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOt/J5uA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074F733ADB2;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387480; cv=none; b=qZWjm+BQzfbT0hSMDmAeh2FtZVojqeH9MIIkh4AOLXrpuUBUeGQN5JcSNiQ//ClfZwO7f6NFoLIBQ9XvKMVtx/mPo3qAt2CPrEl9KX7IlkjRvEWfPxEgOVxiI5ZT79ua7LbyEFSbsgvr0R8BGNcnEt3vedQXPAXdHdQBXBdfDxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387480; c=relaxed/simple;
	bh=yY6HMohkzo4ZeIoq6o3ZwMoP3nLGiLYGmwXnzvxtDXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLtvG9KWU5glmhLljlW5xZX68rfn9VJJL87m/GN663TVMtBrkwcxv+v5BJulgqM99JkwuMM08K55CWPNSU7P9sqWHWYyYK80Gb5dlSPz14Cy5HU24FIEzJXsB6JDSxnU6m/r0s1B2SmZFaemjOnEUTxyj6ZAm6g1fAXU1DLrwCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOt/J5uA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF9A3C2BCC4;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=yY6HMohkzo4ZeIoq6o3ZwMoP3nLGiLYGmwXnzvxtDXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KOt/J5uArC6mg5B7q+15QaHzAM94g8fGP7kWisv4AGrhShgw4zOXI5/awMguFB359
	 TYOnanb2C5IE7vRwuLp66E+U1ZI+guwe/OvAdVggCig8LO4oc94SukKb9W3cQ9BeMz
	 dgbHC0BB14kDiV92l8FPcGPXRZXPZugmmJIGZcidQzXZavZyrfm1LVNICJ3hDiP/Gs
	 cezJpjvQ69EzOo+hsyf3nQnxloZLAuGrDCYOjHpGJ6ulYbkn6E92UMoLgLwaV5nIMW
	 QOio7qy/0ESxmU73TeeQ0vCY5JiauTF9YVK60HEXumXqa1FBYdlV+RHrLLcq2k/S52
	 sDWEa7McjAw1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2277FD006E;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:21 +0100
Subject: [PATCH 07/10] Input: stmfts - add optional reset GPIO support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=daBviKrwdNaBon25+W21BV0l53Jhcl6A1asMOmlUHP8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVl29wFOXwqGmWw88xHEwXRAdEU8Cr60aAt
 Q7pe6uFN+OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 ct8PD/4l2VVdFOhnFJ2dH/degpVL401NqhKnFc6/SpzMWFv7jHx7K0ZjOB09th5pZYh5Zbka73w
 O9rLXubm0PRi4fVhOTAT68wO95N/sq5TcMuPLefP4p2qN73YXjtk4RFoyE0HXw8VXcN9SXdJAAa
 7btuvK4ahgeEahRM9AsiaLK6cdPEy2b1F69/09NJJCFQi/g0d86ovQj70Q0J71XRHfHiTuSptEm
 5T9F7z6XxrOo1sZ6NVco3s//1Yljjvx2xIU0yi9k+4dztQWsBzDuxDTZgvyHsgKwZf4YyTavce9
 ScoChG4Mxoj9i/B58foc8AAtPGoj/eL0j8+kYXSPmTrygUr05bh7qnLO6DXviUB4Pjqf73vvid7
 UWu95j8KvUxGnsxoCYJXMl4L4u6TknuVXvzI2/E+FzDgSVU5XuQin+uhWN7wmO1MxcAddjdTJoI
 lfDP6MyBK1FTmWB9O/yIpnXq060pzqyUv2y323DeG33ZYjGtlIFCvYs3o0mJgMKGpqUQYQm68pp
 5aozfmaFiIr4qe6yEd0mu9c3GfAMAf0kfERrPkjkk2/9Nm+pCBuBc0usDin/CCOyvpz5IFb/5HE
 3prMd8KBg+aGKn/vL31zMDMfVRgKVxMOws+gARdnL4ZtU8OMuEvgFa9L5KpecHY7peiV3IlhTid
 QVzIyiNFfLWfPQQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94757-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF8F21D0F59
X-Rspamd-Action: no action

From: Petr Hodina <petr.hodina@protonmail.com>

Add support for an optional "reset-gpios" property. If present, the
driver drives the reset line high at probe time and releases it during
power-on, after the regulators have been enabled.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9dedccbb183ed..a4d8e81aba275 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -77,6 +77,7 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 struct stmfts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -540,6 +541,15 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	return 0;
 }
 
+static void stmfts_reset(struct stmfts_data *sdata)
+{
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+	msleep(20);
+
+	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+	msleep(50);
+}
+
 static int stmfts_power_on(struct stmfts_data *sdata)
 {
 	int err;
@@ -549,6 +559,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	if (err)
 		return err;
 
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
 	/*
 	 * The datasheet does not specify the power on time, but considering
 	 * that the reset time is < 10ms, I sleep 20ms to be sure
@@ -607,6 +620,10 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
+
+	if (sdata->reset_gpio)
+		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -663,6 +680,12 @@ static int stmfts_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "Failed to get GPIO 'reset'\n");
+
 	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;

-- 
2.51.0



