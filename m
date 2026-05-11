Return-Path: <linux-arm-msm+bounces-106960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EoPMjftAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:52:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E415109B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF594305F935
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6DF3FFAC9;
	Mon, 11 May 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+kui6Jc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785113FFAC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510531; cv=none; b=n8JcuQOPMxLv4qnvvxkTHXfMOufV7uRlfeMrhoq1JO+h0ZHiMyVJr4dvFLhS9d+Cq4NPtVInTwFtINCF3mqBGUH1K+bt20r5irZv9xOVxBKQGqRe14QEnDPoYdKJDZAw2xVcp3JohknvSiMhpzunUqXB5sBw8vaUtTTpskUTJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510531; c=relaxed/simple;
	bh=S3PdCabnSrFoUeTyBVHTl40IeEnbtsQwr3e7rmq5QOk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJx8EZ6oHSdlg1SxR2B3EChU22ZCcx787IVUuRe0GrpQ7dNgC8oQqwvbumDzZ0F5bHGHzWSgEE6p7iG1RFTqvUMSbb3k0CyP93E8TOsbTI51ljNRXMk34p/6uQ5HSOq8elDxz3dkIBBWeSPjJpJskSxLHVU/JZ95KUK/jbXDavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+kui6Jc; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8383fb7143aso2028784b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510529; x=1779115329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIhyE/GwzdxlerouNKloxYd+dLgQAeLKvtkm5THrDBs=;
        b=p+kui6Jcf5M4///AXlQe3VZbX4kSNwFH51g5MSLkyPmp4OaMtqnZZQ6gyI485wvPRQ
         NYXGUjrASWRJPGf0lrnqU4npdDg3W9153kOrm2SOixnmxv0zkyaeGrGsfG97jgTc52ko
         94lmyvnWvWB0xD5KpB0Jzccvogy8v2/SZJXCd0RpaWxdVsxrjvhucZFSvIF62K/kvMG8
         onnGS1DVtsXKYoE06ISi8JFALnXUkiq4qarJ8NHrFFkPj/hIIfHVmQxAh9ilyE8oEgzx
         R74EgrO7layLnaQ1kk1tFddBrrFw5SayQZV64adNWg1sBpbFTLpXo0HDCRoQDsOnsKTU
         5w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510529; x=1779115329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIhyE/GwzdxlerouNKloxYd+dLgQAeLKvtkm5THrDBs=;
        b=BCmAi5w6yx546Iqg1vwRNaQtAJzwQeS+SskBFe5BCWK8L6NIp5KdJmbW6y+NQYtvmA
         dc+WNoRez2GifiDTYf1H2rligMw45vP44eU6/OmCNEEMd8KxaQEoS98Fp+g5glznkfWZ
         YnCo5gZbOKDQXzkTYsrdtfx/VLIJHDgxpvlxrYBBW14+IdBm0jztnOW/PT9H/Kn3A+i+
         Nn5NKc6oXZNoQJWXb3nzA6fFW6t9eHeNsZREAelHitiMPztKOiz6DSLzXi0ZgTiYtqtl
         cZOv2biUaqIHKq99JyRv3Gcst1LV+NF00w198wP+DSHj95clFKslBEKvttqSvvvhuXk4
         gDxQ==
X-Gm-Message-State: AOJu0YwpSq1rzkZ51EET4LAtDA9htrMdzOGx/V7NbOicSvnlcN+y9z9I
	aWFLMHdNnNUFAfaGnNgX/0TPlWUqmR7d7+2IwLUmRdM1y9e9gDbcv5zjN2cR88nb0mg=
X-Gm-Gg: Acq92OE0dI2IkcQf0FBs/OkIUVRYy0GxNOcUcvVFNfTCAur4fD0UKjqIxmB0PoSLF4U
	wDIilJaR0wnBe39EF9KX/h+VWYet0x6OFYF9Py8SXxV3nlKUw+mpmaRwXK61TWxDX2W6O3jL98M
	K/kVfnDCEsWD1RWwbtnjhAlCO3tbI7rGQtNp1mdOGW24VAfY0qmIt2XucIGy4ZrJ72RUeriaKgZ
	1oVjk3XUJ+Aor9i6pTjJz1sSdR9pZ09XzFdS20VenY2aANSLEkBKQaEpbK9HEweJZQDhJ9QExCV
	lY+9N03IJ8+DbtWpsF/4dQyZHg14ILlviEj05WSgimVkz6w1M3Ne16kMFM5fEQWKTHbsk7Xq8/N
	lGiAtECZt+vqUA7ODd5/6OnhptZfrvL+p8/HKSFLYPB4/87ZVDuzCUwjRfpr6umkv/uwdAqFO0L
	lUv0ZlV67oyyVI0TJOZLadKhQDdAjAtunR6r7ORWGDdnwW3HaDWGvd98lW/eWaaQtiS5NNt6wVY
	gwcLPVXCstYXA==
X-Received: by 2002:a05:6a00:8103:b0:83e:ccd6:2dc8 with SMTP id d2e1a72fcca58-83eccd62e1bmr2441380b3a.27.1778510529332;
        Mon, 11 May 2026 07:42:09 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:42:08 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] hid: Pen battery quirk for Surface Pro 12in
Date: Tue, 12 May 2026 00:40:54 +1000
Message-ID: <2702fbde567457ea0835ba12cc29421590e688aa.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C9E415109B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The pen setup for this device uses bluetooth for
communicating battery levels and status instead of
reporting it over i2c.

Without this quirk, the device either reports an
extra, broken phantom battery, or hangs.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0cf63742315b..d16f55479786 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -459,6 +459,7 @@
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM	0x2F81
+#define I2C_DEVICE_ID_SURFACE_PRO_12IN  0x4376
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d73cfa2e73d3..61ecd840d0bd 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -395,6 +395,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_PRO_12IN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	/*
 	 * Elan HID touchscreens seem to all report a non present battery,
 	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C and USB HID devices.
-- 
2.53.0


