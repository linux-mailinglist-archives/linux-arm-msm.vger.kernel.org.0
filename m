Return-Path: <linux-arm-msm+bounces-101709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC2TB0L1z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:13:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B0396E0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 275DC309533B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6353D6461;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMS/LStW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE83D5640;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236118; cv=none; b=OS1WCxIxer+Qfc77aqym+TLI4Pf5T+RZ4igm7wVSkunF9zxDMe1asWVqWaGFEVAA1MshF2gXYruf2TFaIGpqqkpY7isWzr0pswAbhq0GgsmXRovBnrls5BPcXUh6GiiA35VdqlP9B2SBIFw6/AQ+nWIrCBkQj51TZuV/beZsYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236118; c=relaxed/simple;
	bh=d+ARGBhmSS1feQ02HmwMqT1sf2I+Idqa1hlgSMCw+wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2P8kFBvfgTC39eP3HPfO9bSaE8CQs9l9DlubUakfJ5kGoqw0ntx6Zt1I+cP4qUuKkzO+BkKZR3RjzSUxma9K0hj5iV93dMHhY0Os66jRrC0MJ3gnV248mPqNxvW4YZnfr2iYVjtYWd6l+NDB0tX3IjYWhoNxhVd10+bUi42eRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMS/LStW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A9D1C2BCAF;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=d+ARGBhmSS1feQ02HmwMqT1sf2I+Idqa1hlgSMCw+wc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tMS/LStWBo4gOFXiW44pmwT0S0+/FX6+K4VgabS7gk0ug30FEDXNXUHTxYeStwUDt
	 LndPGFik8yIwu6NUy3yV2Z3IA+uX/gx3he6IjX2r8efiS9dbMxxO9pwr2kEBFprzbT
	 H8R1Yo/Tnjty3sAGhXZIFqDd1vJ82Is5NKisqapHsrbhzsuPxSZpX0Dxq3HpE0R5zb
	 GuuSRBJgqIyXQgGbALST7grsURN+N/f05AEzoj5GQrUergC3w6g83OlCNvOozIl4ay
	 IISu6RsOh71mGOTBFuM9rOlr8V4b6/2ZWpk/cAVZD2Qp/FOwQWceucgLSOf2q7jEhR
	 dJdnirOsPlErg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF4AE85388;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:39 +0200
Subject: [PATCH WIP v3 10/11] Input: stmfts - support FTS5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-10-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21864; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DwFQVFz6c+XqdPGaOSwEaeIhlImNKzvM9mB03yWcjUE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQI7nl5K+Xn4HuMqf1Kzgl7USnPpzHWLG0+
 zh3PtoLTwuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 ckttEACPTgLCEpR8NT/FahpHlLwRUtd0NpvIWJGCpLLpBDR4j2bJrxmDhaUwiqJGbXeHfQOKuxq
 a85YgloIV6iw4+lP2AwhAI7W7ZsyGU7BfSRS9GOqYajKBG8sU/RwpeC4JSh9Klzgq9Zaxi+oMjK
 5hAOPPyXj+bOvV4Q9jgEo3jl/+NThU8qFb0wUSOHEcynW2ki1EbjyU7iImR2aMOdu6V1U6+pV+P
 yyLfi3iGwwaLgFBTAfAHFgU2zkudGL3+4kACof2g8r8nqVFbg1eTTFLdpMjRXM2Jrurstdmj5BU
 uI0Oa8IJhsNOTICINWG578Fe/xAMES/YN+4uXS2f9k3FlhRRghVCBcLHIwcWFl7cN6hedo18gQm
 LopMWr8CcpAnwrmvwxKef4zPrjoQFP2+BvpvYdvTCz5YNRDKUFTYqf2mawEiCiYhcjhydlVzDY8
 EUHlWUJHZOu1hX7mdZqK6TpG2QfyqT7suHiamcP44JCYSCprvy8jzeIza1ar1CAAHWVjnI3PAZU
 4nLuxovr+xDkCqN7TEfhp4yqf7nDRW27Xy5pfU8thxBDQpLMr0neN8bRw4IaTxgBoaIOX9Fm8cO
 aMvvLRh3iN4KI/inkU0KVf/rsmDBqt0J57YZaUnbhcPCpAqTqecD9El5RxxrSeygxyMDnIx+hwj
 +kcsnfF0waNLFOQ==
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
	TAGGED_FROM(0.00)[bounces-101709-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email,protonmail.com:email]
X-Rspamd-Queue-Id: 9A4B0396E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Introduce basic FTS5 support.

FTS support SLPI and AP mode, introduce mode-switch GPIO to switch between
those two. Currently we can handle only full power AP mode, so we just
keep the AP on.

Useful for devices like Pixel 3 (blueline) and many others.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 481 +++++++++++++++++++++++++++++++++++--
 1 file changed, 460 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 04110006f54a0..e0fa1c4af1987 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-// STMicroelectronics FTS Touchscreen device driver
-//
-// Copyright (c) 2017 Samsung Electronics Co., Ltd.
-// Copyright (c) 2017 Andi Shyti <andi@etezian.org>
+/* STMicroelectronics FTS Touchscreen device driver
+ *
+ * Copyright 2017 Samsung Electronics Co., Ltd.
+ * Copyright 2017 Andi Shyti <andi@etezian.org>
+ * Copyright David Heidelberg <david@ixit.cz>
+ * Copyright Petr Hodina <petr.hodina@protonmail.com>
+ */
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -12,6 +15,7 @@
 #include <linux/irq.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -34,6 +38,7 @@
 #define STMFTS_FULL_FORCE_CALIBRATION		0xa2
 #define STMFTS_MS_CX_TUNING			0xa3
 #define STMFTS_SS_CX_TUNING			0xa4
+#define STMFTS5_SET_SCAN_MODE			0xa0
 
 /* events */
 #define STMFTS_EV_NO_EVENT			0x00
@@ -51,12 +56,32 @@
 #define STMFTS_EV_STATUS			0x16
 #define STMFTS_EV_DEBUG				0xdb
 
+/* events FTS5 */
+#define STMFTS5_EV_CONTROLLER_READY		0x03
+/* FTM5 event IDs (full byte, not masked) */
+#define STMFTS5_EV_MULTI_TOUCH_ENTER		0x13
+#define STMFTS5_EV_MULTI_TOUCH_MOTION		0x23
+#define STMFTS5_EV_MULTI_TOUCH_LEAVE		0x33
+#define STMFTS5_EV_STATUS_UPDATE		0x43
+#define STMFTS5_EV_USER_REPORT			0x53
+#define STMFTS5_EV_DEBUG			0xe3
+#define STMFTS5_EV_ERROR			0xf3
+
 /* multi touch related event masks */
 #define STMFTS_MASK_EVENT_ID			0x0f
 #define STMFTS_MASK_TOUCH_ID			0xf0
 #define STMFTS_MASK_LEFT_EVENT			0x0f
 #define STMFTS_MASK_X_MSB			0x0f
 #define STMFTS_MASK_Y_LSB			0xf0
+#define STMFTS5_MASK_TOUCH_TYPE			0x0f
+
+/* touch type classifications */
+#define STMFTS_TOUCH_TYPE_INVALID		0x00
+#define STMFTS_TOUCH_TYPE_FINGER		0x01
+#define STMFTS_TOUCH_TYPE_GLOVE			0x02
+#define STMFTS_TOUCH_TYPE_STYLUS		0x03
+#define STMFTS_TOUCH_TYPE_PALM			0x04
+#define STMFTS_TOUCH_TYPE_HOVER			0x05
 
 /* key related event masks */
 #define STMFTS_MASK_KEY_NO_TOUCH		0x00
@@ -75,9 +100,12 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 };
 
 struct stmfts_data {
+	const struct stmfts_chip_ops *ops;
+
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *mode_switch_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -101,12 +129,24 @@ struct stmfts_data {
 
 	struct completion cmd_done;
 
+	unsigned long touch_id;
+	unsigned long stylus_id;
+
+	bool is_fts5;
 	bool use_key;
 	bool led_status;
 	bool hover_enabled;
+	bool stylus_enabled;
 	bool running;
 };
 
+struct stmfts_chip_ops {
+	int  (*power_on)(struct stmfts_data *sdata);
+	int  (*input_open)(struct input_dev *dev);
+	void (*input_close)(struct input_dev *dev);
+	void (*parse_events)(struct stmfts_data *sdata);
+};
+
 static int stmfts_brightness_set(struct led_classdev *led_cdev,
 					enum led_brightness value)
 {
@@ -169,6 +209,7 @@ static int stmfts_read_events(struct stmfts_data *sdata)
 	return ret == ARRAY_SIZE(msgs) ? 0 : -EIO;
 }
 
+/* FTS4 event handling functions */
 static void stmfts_report_contact_event(struct stmfts_data *sdata,
 					const u8 event[])
 {
@@ -204,6 +245,157 @@ static void stmfts_report_contact_release(struct stmfts_data *sdata,
 	input_sync(sdata->input);
 }
 
+/* FTS5 event handling functions */
+static void stmfts5_report_contact_event(struct stmfts_data *sdata,
+					 const u8 event[])
+{
+	u8 area;
+	u8 maj;
+	u8 min;
+	/* FTM5 event format:
+	 * event[0] = event ID (0x13/0x23)
+	 * event[1] = touch type (low 4 bits) | touch ID (high 4 bits)
+	 * event[2] = X LSB
+	 * event[3] = X MSB (low 4 bits) | Y MSB (high 4 bits)
+	 * event[4] = Y LSB
+	 * event[5] = pressure
+	 * event[6] = major (low 4 bits) | minor (high 4 bits)
+	 * event[7] = minor (high 2 bits)
+	 */
+	u8 touch_id = (event[1] & STMFTS_MASK_TOUCH_ID) >> 4;
+	u8 touch_type = event[1] & STMFTS5_MASK_TOUCH_TYPE;
+	int x, y, distance;
+	unsigned int tool = MT_TOOL_FINGER;
+	bool touch_condition = true;
+
+	/* Parse coordinates with better precision */
+	x = (((int)event[3] & STMFTS_MASK_X_MSB) << 8) | event[2];
+	y = ((int)event[4] << 4) | ((event[3] & STMFTS_MASK_Y_LSB) >> 4);
+
+	/* Parse pressure - ensure non-zero for active touch */
+	area = event[5];
+	if (area <= 0 && touch_type != STMFTS_TOUCH_TYPE_HOVER) {
+		/* Should not happen for contact events. Set minimum pressure
+		 * to prevent touch from being dropped
+		 */
+		dev_warn_once(&sdata->client->dev,
+			      "zero pressure on contact event, slot %d\n", touch_id);
+		area = 1;
+	}
+
+	/* Parse touch area with improved bit extraction */
+	maj = (((event[0] & 0x0C) << 2) | ((event[6] & 0xF0) >> 4));
+	min = (((event[7] & 0xC0) >> 2) | (event[6] & 0x0F));
+
+	/* Distance is 0 for touching, max for hovering */
+	distance = 0;
+
+	/* Classify touch type and set appropriate tool and parameters */
+	switch (touch_type) {
+	case STMFTS_TOUCH_TYPE_STYLUS:
+		if (sdata->stylus_enabled) {
+			tool = MT_TOOL_PEN;
+			__set_bit(touch_id, &sdata->stylus_id);
+			__clear_bit(touch_id, &sdata->touch_id);
+			break;
+		}
+		fallthrough; /* Report as finger if stylus not enabled */
+
+	case STMFTS_TOUCH_TYPE_FINGER:
+	case STMFTS_TOUCH_TYPE_GLOVE:
+		tool = MT_TOOL_FINGER;
+		__set_bit(touch_id, &sdata->touch_id);
+		__clear_bit(touch_id, &sdata->stylus_id);
+		break;
+
+	case STMFTS_TOUCH_TYPE_PALM:
+		/* Palm touch - report but can be filtered by userspace */
+		tool = MT_TOOL_PALM;
+		__set_bit(touch_id, &sdata->touch_id);
+		__clear_bit(touch_id, &sdata->stylus_id);
+		break;
+
+	case STMFTS_TOUCH_TYPE_HOVER:
+		tool = MT_TOOL_FINGER;
+		touch_condition = false;
+		area = 0;
+		distance = 255;
+		__set_bit(touch_id, &sdata->touch_id);
+		__clear_bit(touch_id, &sdata->stylus_id);
+		break;
+
+	case STMFTS_TOUCH_TYPE_INVALID:
+	default:
+		dev_warn(&sdata->client->dev,
+			 "invalid touch type %d for slot %d\n",
+			 touch_type, touch_id);
+		return;
+	}
+
+	/* Boundary check - some devices report max value, adjust */
+	if (x >= sdata->prop.max_x)
+		x = sdata->prop.max_x - 1;
+	if (y >= sdata->prop.max_y)
+		y = sdata->prop.max_y - 1;
+
+	input_mt_slot(sdata->input, touch_id);
+	input_report_key(sdata->input, BTN_TOUCH, touch_condition);
+	input_mt_report_slot_state(sdata->input, tool, true);
+
+	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
+	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, maj);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, min);
+	input_report_abs(sdata->input, ABS_MT_PRESSURE, area);
+	input_report_abs(sdata->input, ABS_MT_DISTANCE, distance);
+
+	input_sync(sdata->input);
+}
+
+static void stmfts5_report_contact_release(struct stmfts_data *sdata,
+					   const u8 event[])
+{
+	/* FTM5 format: touch ID is in high 4 bits of event[1] */
+	u8 touch_id = (event[1] & STMFTS_MASK_TOUCH_ID) >> 4;
+	u8 touch_type = event[1] & STMFTS5_MASK_TOUCH_TYPE;
+	unsigned int tool = MT_TOOL_FINGER;
+
+	/* Determine tool type based on touch classification */
+	switch (touch_type) {
+	case STMFTS_TOUCH_TYPE_STYLUS:
+		if (sdata->stylus_enabled) {
+			tool = MT_TOOL_PEN;
+			__clear_bit(touch_id, &sdata->stylus_id);
+		} else {
+			__clear_bit(touch_id, &sdata->touch_id);
+		}
+		break;
+
+	case STMFTS_TOUCH_TYPE_PALM:
+		tool = MT_TOOL_PALM;
+		__clear_bit(touch_id, &sdata->touch_id);
+		break;
+
+	case STMFTS_TOUCH_TYPE_FINGER:
+	case STMFTS_TOUCH_TYPE_GLOVE:
+	case STMFTS_TOUCH_TYPE_HOVER:
+	default:
+		tool = MT_TOOL_FINGER;
+		__clear_bit(touch_id, &sdata->touch_id);
+		break;
+	}
+
+	input_mt_slot(sdata->input, touch_id);
+	input_report_abs(sdata->input, ABS_MT_PRESSURE, 0);
+	input_mt_report_slot_state(sdata->input, tool, false);
+
+	/* Report BTN_TOUCH only if no touches remain */
+	if (!sdata->touch_id && !sdata->stylus_id)
+		input_report_key(sdata->input, BTN_TOUCH, 0);
+
+	input_sync(sdata->input);
+}
+
 static void stmfts_report_hover_event(struct stmfts_data *sdata,
 				      const u8 event[])
 {
@@ -251,7 +443,6 @@ static void stmfts_parse_events(struct stmfts_data *sdata)
 		u8 *event = &sdata->data[i * STMFTS_EVENT_SIZE];
 
 		switch (event[0]) {
-
 		case STMFTS_EV_CONTROLLER_READY:
 		case STMFTS_EV_SLEEP_OUT_CONTROLLER_READY:
 		case STMFTS_EV_STATUS:
@@ -264,7 +455,6 @@ static void stmfts_parse_events(struct stmfts_data *sdata)
 		}
 
 		switch (event[0] & STMFTS_MASK_EVENT_ID) {
-
 		case STMFTS_EV_MULTI_TOUCH_ENTER:
 		case STMFTS_EV_MULTI_TOUCH_MOTION:
 			stmfts_report_contact_event(sdata, event);
@@ -298,6 +488,45 @@ static void stmfts_parse_events(struct stmfts_data *sdata)
 	}
 }
 
+static void stmfts5_parse_events(struct stmfts_data *sdata)
+{
+	for (int i = 0; i < STMFTS_STACK_DEPTH; i++) {
+		u8 *event = &sdata->data[i * STMFTS_EVENT_SIZE];
+
+		switch (event[0]) {
+		case STMFTS5_EV_CONTROLLER_READY:
+			complete(&sdata->cmd_done);
+			fallthrough;
+
+		case STMFTS_EV_NO_EVENT:
+		case STMFTS5_EV_STATUS_UPDATE:
+		case STMFTS5_EV_USER_REPORT:
+		case STMFTS5_EV_DEBUG:
+			return;
+
+		case STMFTS5_EV_MULTI_TOUCH_ENTER:
+		case STMFTS5_EV_MULTI_TOUCH_MOTION:
+			stmfts5_report_contact_event(sdata, event);
+			break;
+
+		case STMFTS5_EV_MULTI_TOUCH_LEAVE:
+			stmfts5_report_contact_release(sdata, event);
+			break;
+
+		case STMFTS5_EV_ERROR:
+			dev_warn(&sdata->client->dev,
+				 "error code: 0x%x%x%x%x%x%x",
+				 event[6], event[5], event[4],
+				 event[3], event[2], event[1]);
+			break;
+
+		default:
+			dev_err(&sdata->client->dev,
+				"unknown FTS5 event %#02x\n", event[0]);
+		}
+	}
+}
+
 static irqreturn_t stmfts_irq_handler(int irq, void *dev)
 {
 	struct stmfts_data *sdata = dev;
@@ -310,7 +539,7 @@ static irqreturn_t stmfts_irq_handler(int irq, void *dev)
 		dev_err(&sdata->client->dev,
 			"failed to read events: %d\n", err);
 	else
-		stmfts_parse_events(sdata);
+		sdata->ops->parse_events(sdata);
 
 	return IRQ_HANDLED;
 }
@@ -332,6 +561,25 @@ static int stmfts_command(struct stmfts_data *sdata, const u8 cmd)
 	return 0;
 }
 
+static int stmfts5_set_scan_mode(struct stmfts_data *sdata, const u8 val)
+{
+	int err;
+
+	u8 scan_mode_cmd[3] = { STMFTS5_SET_SCAN_MODE, 0x00, val };
+	struct i2c_msg msg = {
+		.addr = sdata->client->addr,
+		.len = sizeof(scan_mode_cmd),
+		.buf = scan_mode_cmd,
+	};
+
+	err = i2c_transfer(sdata->client->adapter, &msg, 1);
+	if (err != 1)
+		return err < 0 ? err : -EIO;
+
+	return 0;
+
+}
+
 static int stmfts_input_open(struct input_dev *dev)
 {
 	struct stmfts_data *sdata = input_get_drvdata(dev);
@@ -371,6 +619,28 @@ static int stmfts_input_open(struct input_dev *dev)
 	return 0;
 }
 
+static int stmfts5_input_open(struct input_dev *dev)
+{
+	struct stmfts_data *sdata = input_get_drvdata(dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&sdata->client->dev);
+	if (err)
+		return err;
+
+	mutex_lock(&sdata->mutex);
+	sdata->running = true;
+	mutex_unlock(&sdata->mutex);
+
+	err = stmfts5_set_scan_mode(sdata, 0xff);
+	if (err) {
+		pm_runtime_put_sync(&sdata->client->dev);
+		return err;
+	}
+
+	return 0;
+}
+
 static void stmfts_input_close(struct input_dev *dev)
 {
 	struct stmfts_data *sdata = input_get_drvdata(dev);
@@ -404,6 +674,23 @@ static void stmfts_input_close(struct input_dev *dev)
 	pm_runtime_put_sync(&sdata->client->dev);
 }
 
+static void stmfts5_input_close(struct input_dev *dev)
+{
+	struct stmfts_data *sdata = input_get_drvdata(dev);
+	int err;
+
+	err = stmfts5_set_scan_mode(sdata, 0x00);
+	if (err)
+		dev_warn(&sdata->client->dev,
+			 "failed to disable touchscreen: %d\n", err);
+
+	mutex_lock(&sdata->mutex);
+	sdata->running = false;
+	mutex_unlock(&sdata->mutex);
+
+	pm_runtime_put_sync(&sdata->client->dev);
+}
+
 static ssize_t stmfts_sysfs_chip_id(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -484,7 +771,7 @@ static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,
 	guard(mutex)(&sdata->mutex);
 
 	if (hover != sdata->hover_enabled) {
-		if (sdata->running) {
+		if (sdata->running && !sdata->is_fts5) {
 			err = i2c_smbus_write_byte(sdata->client,
 					   value ? STMFTS_SS_HOVER_SENSE_ON :
 						   STMFTS_SS_HOVER_SENSE_OFF);
@@ -614,6 +901,41 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	return err;
 }
 
+static int stmfts5_power_on(struct stmfts_data *sdata)
+{
+	int err, ret;
+	u8 event[STMFTS_EVENT_SIZE];
+
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
+	if (err)
+		return err;
+
+	/* Power stabilization delay */
+	msleep(20);
+
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
+	/* Verify I2C communication */
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    STMFTS_READ_ALL_EVENT,
+					    sizeof(event), event);
+	if (ret < 0) {
+		err = ret;
+		goto power_off;
+	}
+
+	enable_irq(sdata->client->irq);
+
+	return 0;
+
+power_off:
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
+	return err;
+}
+
 static void stmfts_power_off(void *data)
 {
 	struct stmfts_data *sdata = data;
@@ -623,6 +945,11 @@ static void stmfts_power_off(void *data)
 	if (sdata->reset_gpio)
 		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
 
+	if (sdata->is_fts5) {
+		i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
+		msleep(20);
+	}
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -656,6 +983,7 @@ static int stmfts_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int err;
 	struct stmfts_data *sdata;
+	const struct of_device_id *match;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
 						I2C_FUNC_SMBUS_BYTE_DATA |
@@ -672,6 +1000,13 @@ static int stmfts_probe(struct i2c_client *client)
 	mutex_init(&sdata->mutex);
 	init_completion(&sdata->cmd_done);
 
+	match = of_match_device(dev->driver->of_match_table, dev);
+	sdata->ops = of_device_get_match_data(dev);
+	if (match && of_device_is_compatible(dev->of_node, "st,stmfts5"))
+		sdata->is_fts5 = true;
+	else
+		sdata->is_fts5 = false;
+
 	err = devm_regulator_bulk_get_const(dev,
 					    ARRAY_SIZE(stmfts_supplies),
 					    stmfts_supplies,
@@ -685,34 +1020,80 @@ static int stmfts_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
 				     "Failed to get GPIO 'reset'\n");
 
+	if (sdata->is_fts5) {
+		sdata->mode_switch_gpio = devm_gpiod_get_optional(&client->dev,
+								  "mode-switch",
+								  GPIOD_OUT_HIGH);
+		if (IS_ERR(sdata->mode_switch_gpio))
+			return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
+					     "Failed to get GPIO 'switch'\n");
+
+	}
+
 	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;
 
 	sdata->input->name = STMFTS_DEV_NAME;
 	sdata->input->id.bustype = BUS_I2C;
-	sdata->input->open = stmfts_input_open;
-	sdata->input->close = stmfts_input_close;
+	sdata->input->open = sdata->ops->input_open;
+	sdata->input->close = sdata->ops->input_close;
+
+	/* FTS5-specific input properties */
+	if (sdata->is_fts5) {
+		/* Mark as direct input device for calibration support */
+		__set_bit(INPUT_PROP_DIRECT, sdata->input->propbit);
+
+		/* Set up basic touch capabilities */
+		input_set_capability(sdata->input, EV_KEY, BTN_TOUCH);
+	}
 
 	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_Y);
 	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
 
+	/* Set resolution for accurate calibration (FTS5) */
+	if (sdata->is_fts5 && !input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
+		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
+		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
+	}
+
+	/* Enhanced MT parameters */
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
-	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
-	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
+
+	if (sdata->is_fts5) {
+		input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);
+
+		/* Enable stylus support if requested */
+		sdata->stylus_enabled = device_property_read_bool(dev,
+								  "stylus-enabled");
+	} else {
+		input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
+		input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
+	}
 
 	sdata->use_key = device_property_read_bool(dev,
 						   "touch-key-connected");
-	if (sdata->use_key) {
+	if (sdata->use_key && !sdata->is_fts5) {
 		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
 		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
 	}
 
-	err = input_mt_init_slots(sdata->input,
-				  STMFTS_MAX_FINGERS, INPUT_MT_DIRECT);
+	/* Initialize touch tracking bitmaps (FTS5) */
+	if (sdata->is_fts5) {
+		sdata->touch_id = 0;
+		sdata->stylus_id = 0;
+
+		/* Initialize MT slots with support for pen tool type */
+		err = input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
+					  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	} else {
+		err = input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
+					  INPUT_MT_DIRECT);
+	}
+
 	if (err)
 		return err;
 
@@ -732,9 +1113,11 @@ static int stmfts_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	dev_dbg(dev, "initializing ST-Microelectronics FTS...\n");
+	dev_dbg(dev, "initializing ST-Microelectronics FTS%s...\n",
+		sdata->is_fts5 ? "5" : "");
+
 
-	err = stmfts_power_on(sdata);
+	err = sdata->ops->power_on(sdata);
 	if (err)
 		return err;
 
@@ -746,7 +1129,7 @@ static int stmfts_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (sdata->use_key) {
+	if (sdata->use_key && !sdata->is_fts5) {
 		err = stmfts_enable_led(sdata);
 		if (err) {
 			/*
@@ -790,8 +1173,47 @@ static int stmfts_runtime_resume(struct device *dev)
 	int ret;
 
 	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to resume device: %d\n", ret);
+		return ret;
+	}
+
+	if (sdata->is_fts5) {
+		msleep(20);
+
+		/* Perform capacitance tuning after wakeup */
+		ret = i2c_smbus_write_byte(client, STMFTS_MS_CX_TUNING);
+		if (ret)
+			dev_warn(dev, "MS_CX_TUNING failed: %d\n", ret);
+		msleep(20);
+
+		ret = i2c_smbus_write_byte(client, STMFTS_SS_CX_TUNING);
+		if (ret)
+			dev_warn(dev, "SS_CX_TUNING failed: %d\n", ret);
+		msleep(20);
+
+		/* Force calibration */
+		ret = i2c_smbus_write_byte(client, STMFTS_FULL_FORCE_CALIBRATION);
+		if (ret)
+			dev_warn(dev, "FORCE_CALIBRATION failed: %d\n", ret);
+		msleep(50);
+
+		/* Enable controller interrupts */
+		u8 int_enable_cmd[4] = {0xB6, 0x00, 0x2C, 0x01};
+		struct i2c_msg msg = {
+			.addr = client->addr,
+			.len = 4,
+			.buf = int_enable_cmd,
+		};
+
+		ret = i2c_transfer(client->adapter, &msg, 1);
+		if (ret != 1)
+			return ret < 0 ? ret : -EIO;
+
+		msleep(20);
+
+		return 0;
+	}
 
 	return ret;
 }
@@ -809,7 +1231,7 @@ static int stmfts_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return stmfts_power_on(sdata);
+	return sdata->ops->power_on(sdata);
 }
 
 static const struct dev_pm_ops stmfts_pm_ops = {
@@ -818,8 +1240,23 @@ static const struct dev_pm_ops stmfts_pm_ops = {
 };
 
 #ifdef CONFIG_OF
+static const struct stmfts_chip_ops stmfts4_ops = {
+	.power_on	= stmfts_power_on,
+	.input_open	= stmfts_input_open,
+	.input_close	= stmfts_input_close,
+	.parse_events	= stmfts_parse_events,
+};
+
+static const struct stmfts_chip_ops stmfts5_ops = {
+	.power_on	= stmfts5_power_on,
+	.input_open	= stmfts5_input_open,
+	.input_close	= stmfts5_input_close,
+	.parse_events	= stmfts5_parse_events,
+};
+
 static const struct of_device_id stmfts_of_match[] = {
-	{ .compatible = "st,stmfts", },
+	{ .compatible = "st,stmfts",	.data = &stmfts4_ops },
+	{ .compatible = "st,stmfts5",	.data = &stmfts5_ops },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, stmfts_of_match);
@@ -847,5 +1284,7 @@ static struct i2c_driver stmfts_driver = {
 module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
+MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
+MODULE_AUTHOR("Petr Hodina <petr.hodina@protonmail.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
 MODULE_LICENSE("GPL");

-- 
2.53.0



