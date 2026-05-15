Return-Path: <linux-arm-msm+bounces-107714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEGFHN6yBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:45:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412C549B0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AC53302E8D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F833659FF;
	Fri, 15 May 2026 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeVeAtJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128D36405F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823776; cv=none; b=rsjZ6qX5mOAVkNNUdPH33iJw6Ge/2MUc1oX4eapV3LDsoRVG8L5xItZXtnIcebJwF00Z4tTq2pLjC3VP9uuXt7YSijI/LR9UoLhzbQz3CqFF3dJmDHbe15AEWClHnDbFjohXcI++9bx/3l94A6cai5+CGJtKC7BP5QuwYwT3u1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823776; c=relaxed/simple;
	bh=GnGzQTNG2sWXCYiVIHV6PxxXdvgI+nP2hkQMIdexBZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHbQRml67atL9cD1NpcKEdCPwBec0asKXfN7YC2BUH20n9jRLAlIezJc4fPPT5S11kQAZMnggNQKre0Xa7zPMzW8sj2uwkIZg2cZBjiIO1mtAdJjS9Rop6x22C7jFkJQwXBdonBe8brogGR88nDa0Da7khwRPKbd/cLYOkr8DUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeVeAtJj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3865376a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823773; x=1779428573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu8r9w9o/+B86iBJC+fZKkUwDRzmjJF1xgahG3OvjQQ=;
        b=IeVeAtJju4/+vUQAXwnjDov4VYTPkTmxzLXBJaqJ5dVcHLFzly+VOfRY6jY4kl3Vut
         YZ0uFVkIJw3/0tH6XOb1c+lxX+hBBjL9+0/KqENkkcLYEwsuMnvfu08U8ujHWh7UZtGF
         vhsBZoNinnxsxp6z87QiRL/+Z1lESdhyAaztjtDrjeHLmLbOkJvK/DFrn/jBrORl0Pjk
         zceUQdWI2nUx3Ggi5khpRYqAGOtwpJvpfgrDTQlx2Sxr/02P0mPDXBY+98IeoAA4d4dI
         BIZwurFwOZs/Avh31IrqaImqDSFQFyby+ItLgMY0t1fpfxXbCnZRVxMLyw+LHRK7oCA/
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823773; x=1779428573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vu8r9w9o/+B86iBJC+fZKkUwDRzmjJF1xgahG3OvjQQ=;
        b=k20o78ZFSU6Bn6pcpEAN8uMQ4sp2go7t5ewnh+GLYcwzoT+uAGtCC9zaIAj5bjEd3J
         UtaWovH2YEERfJRIHcC6FXRjpZOFCinJPxmY0iacEwv3vdDFcNi30FvniX4UQ6gKZtZe
         PwBxXTgLFoD05vSW4kDyBzncoqDF1or+vaA6GQS0ZZkn9k+GxKj+fvk5iqvWRDgLoXDD
         v3OVOeABB5VpbLPf8fuCbNyUQraJEjbt+JAklLPi3oDStuSzAbB3+hLek+fqFKxAHUUc
         Jw6qvlalD8WBjnw6jZfY9AvGKlBz66whFoxVBXIjOeW0H7L8GqK8Ex8i1u4Iq34hkexF
         2MGw==
X-Forwarded-Encrypted: i=1; AFNElJ8SnlsHEiYcdThZT5L4UCAH7YE9sWKrp9J9RNW6KLL06nCgxcxcRAxqMsUAgnMemDlRurNWtTdzNJy5OBIS@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaSy3/b/D7WgjaL+JKCYtflAlnD4Sw6asYr92eoRqKzjy4DOp
	EL24n64o6w3+/3gB80hrOSJrC0uEbTgVlUxEqL3vpaDD8idw/hEj2En+
X-Gm-Gg: Acq92OFraRyFZimG+1UicSArLReNgfxboxvIE8O7yAqqjQmmB4wg+syw6ryImXWvHOY
	rWQqgc/yCWPK82Vj0dfQcvBNjUMgGH1pqbU9e9p/8Gp1ds/3umNUYnv0WTy34dbwdct8JxqylET
	qYCG3JHv9shtjGfDWR5jKn+X/8CrrkiSsc1R4trFD0Bj9qDgXv62LSDPqWSRlRXFbwsRP3fZgej
	KQWqrP+qr7t1wRu8S/C0uXNRjyq52TiLDY6CjUL22SIAoQxtoJYdM9vFHtk03wvfA0C0YAjmFy5
	MimCrYdoEs3ez8KIlz6mbKSgp/BRRJ7VRwYqZvL2X2V0NRhVJbAhf70APxrw4wfBzFAnlPI6+Yu
	FQwc+2+gD8g0r5+0ER2Vo6u2gh/KdgruT05SdfYoSgZ/nJnQAoOUHfQx7dKr0ItpazPgfG520K+
	iX7UGH8afX8GEVCRrbTWvmdSnWPWj22QVKx05KlXrnU1W8+gmCLtM3I5J91mrqTIJU5kM0u/fBe
	3Mv8zhobIGWwYFn4nY5WDItVx4=
X-Received: by 2002:a05:6a00:ace:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-83f33ba720amr2908112b3a.8.1778823773353;
        Thu, 14 May 2026 22:42:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v2 4/7] hid: Pen battery quirk for Surface Pro 12in
Date: Fri, 15 May 2026 15:41:49 +1000
Message-ID: <de275cc63e764d2acddf72bf3f50e89f307f41b5.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9412C549B0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107714-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org,suse.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The pen setup for this device uses bluetooth for
communicating battery levels and status instead of
reporting it over i2c.

Without this quirk, the device either reports an
extra, broken phantom battery, or hangs.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Acked-by: Jiri Kosina <jkosina@suse.com>
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


