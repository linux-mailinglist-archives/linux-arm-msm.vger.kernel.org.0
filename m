Return-Path: <linux-arm-msm+bounces-102371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMd2O+PT1mktJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA13C4645
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D85F307AA48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22043A6EEA;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8Jz0gk6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070A3A3E70;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=CcuucfmTZDTciZe19wicu4QqxTKdOKXjjq1blywfRbyoogu5/fnwvAYATxuzRfZv3LCfu/vahSv6+bX0NrtlEI9MbQr+DdTELTHlWBra9opwIdMmgZ5xDJmrKrDguWsA5hnaEkD9NTtyNbV99eN1JJYcTlALCyzuwrlYFCtFGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=7t/V64Z+l0jfwO+WO/MM+kjGDPqnSGczz1lucqZyGuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIUcJ2dj+B0ikdT05B285myB5fM32mkAnpGf8xtUNqqyANzZ4K5Y7ijHwjeC7a77x1vmoYEoHn0n7j7az2tgc4HOjdGThQ7bsOhQ0FueETRLNe0rnt+YeO95JZKm8tf3mlBIt1lQaJtzIljxmvROhGWtk3sDwGAz797jYPV+/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8Jz0gk6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D3FEC2BCB6;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=7t/V64Z+l0jfwO+WO/MM+kjGDPqnSGczz1lucqZyGuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P8Jz0gk6Jg1XTEapnqS4d9L5ywthTdgsegiux9/6LdwiNl90NpgzJ/M673P1Ozp12
	 ve8qpgFp6dDrlBbkrSIFKjj9q8wGM+Ms3U5uT0TTbGKPO/PGRDDRk1lBimaW6jEPoQ
	 Jvh+vygbWp6elAEvJh+GgWZbbwIm+jL3r+JNkU1tNaZ0PKooPxCR6LpVwFC+f80s9i
	 TDUsn3E9uqQtivIQ1NOBEV9tq9lusT8DjIqoe96IPagKWMWXKT0+fk+c6lfE1W0u3Q
	 rogeQhh0p8kjFTuSSjfZ5gvE7pVjzmVIE3NWIEaG9OxUwGUEnmwOaPqHt/ueA/+Wfl
	 mwax4lui6BRew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100AF10FC453;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:51 +0200
Subject: [PATCH v4 08/11] Input: stmfts - add optional reset GPIO support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-8-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Oxezv3LVWvcy2a3O5okAfGZrVzhTs38AJC0Tf+JxgKo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOS1d0dXj0iC1bnB2PUOAopZm69S/9Tys0l2
 OabmP/9zpiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cq4tD/9UxMKbKC9JdKOG/RwoIBh3Vxa1qrGkKMKNGVETPPjVe0qRqV9CZrtO5PUA2/wMgWabwqv
 9gCKoiUUNMtQeU1OQ2KMrE1dC5970Sqc6Bos4Z5fYXgWRRYAgsmb+TjUy1eVi7yaH5PWLPdSp3p
 cFRkmNnw9HcN8WF7hO2Gdnja0JZW7suYSRkmI2U+OYXzg2zPF7jcZ4oLmsWligdKOD96CM4hTlg
 HrD58ZCyJGR3ldncKB80ez/jAGud3LhSzsdehGDeSVqIHljSdcMI8smlpeRn4l34wCEzlgJlsRQ
 s37y00Hoi8gTYrAUHQt+q45pWUIe6NsMrWphr/dBt+snDeizP0Y91uXeeNJmDnp0F29rz13FQQG
 1o6RO3JW7kvveZrrZhjB54fFWtIMHlLdXnEqQxLxBB738pvbNOEww38g3ra5pfXXtCxgvowIL0a
 DQZPXsv4MG6PicmdS9r0RLeH0WHHqrwFYsVrehRO4Nd5mMJ7LnEtVSpTof8mvvpmPMm1UVc7Yhf
 KsY9xWEsG5eohoFg9XpUQJfFoj0NNNe8fiokWDt6jYswtnaA1D6ZyvmE2jtoOiGFh2zhsiQ4g+7
 KTcwakKTqhp8k9dKjzpQ4BeoU7FbrVcQBcZzveCKEHVh3YDjbzkvkAJj4x8qyK1v42Y6QxIPvrG
 jcUSG7Pr1w3fsxA==
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
	TAGGED_FROM(0.00)[bounces-102371-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 49DA13C4645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index b61a19e954296..1e6d9a287cd0c 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -77,6 +77,7 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 struct stmfts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -539,6 +540,15 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
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
 static int stmfts_configure(struct stmfts_data *sdata)
 {
 	int err;
@@ -599,6 +609,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	 */
 	msleep(20);
 
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
 	err = stmfts_configure(sdata);
 	if (err)
 		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
@@ -612,6 +625,10 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
+
+	if (sdata->reset_gpio)
+		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -668,6 +685,12 @@ static int stmfts_probe(struct i2c_client *client)
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
2.53.0



