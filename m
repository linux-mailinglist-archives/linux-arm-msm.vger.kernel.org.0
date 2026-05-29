Return-Path: <linux-arm-msm+bounces-110207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGcjLXjpGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A035FBEED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94515304912F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442ED1C3BEB;
	Fri, 29 May 2026 01:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfDc9UsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E6356748
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017421; cv=none; b=DEOXjRoQHCyixuzfKKx9bfm1HbEBjv78kjg5ZDoZknhJBnU7abBZ7F+iHB/tPHzOL68dlgHMJNDiPGUNSOpj75oSO6i0ZrsJbsVZYywG4jxS8XZGur9uZBDDtGZebH5xwu35HbsH+7AEC9Ta+JG+8WEptNxQ8flUhQEoiJ5zn7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017421; c=relaxed/simple;
	bh=CxUfExcfC2j2CyFdQwOjQt81avvtetK+adz1mptIWzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ff/Y3FWrFivQuAi9K2h67WxEmvS5UtPR/g+cYtl/VgrsrkzIWr0i1gp4xKdE0d1oOlKlHaeGweC1RJV9gMTFvZaebfe3wXowCuuRtPf1Hqws9vBvLkSS5jtNEQUvUXxQADAsZDW5EkYSw9OR8W9GHR1H24f2xr6e3183VmWjgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfDc9UsN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba928852a5so94060365ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017419; x=1780622219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTrHHzkteJU5+guTlUWUv7sIeJXFzgiaro9Wp8NQxuU=;
        b=SfDc9UsNygQ6PZda3h0h3zgrgHD9hTRT9/cWQdzgv9/U5GhSJWla5FetRuFUfcW/qY
         AfoaXWt5Bac1/hN7KQ665LNA7RpqLeMjNb9lrCR2kveb2d0qeNbCN00FFREYOgs4st+1
         Z1jwrkesGyfH7MU4rVBjR2+2cML5wxO7sXel5oo059R5UW96eNJEDv+u/PGLa8E7C+o3
         XjYkmOnrm38OWWvMz9tyHKPzCQfarMKcrEs6cUmmYmAGncen7BzdBPNdMQMQlhQniR/0
         OlHjVEhz9FkF1tSnHcPQj4v5Wc8t/kimmpo9jd5OSFneCftcIqoAZiwrpwXlpQd6SqD7
         riiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017419; x=1780622219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTrHHzkteJU5+guTlUWUv7sIeJXFzgiaro9Wp8NQxuU=;
        b=Z8hRHFF5OOO/LNtz0+x5pakYnVIUqNzoF9N9UxFvPd4aAp85Rgi7VQ4cwKqXQ+uGcO
         n55mIe6gH/a8ALzyQUjxic8JIui1WypCJv4BmJ9udlDOQvdWtzteQW7pJQddWB6n7VKx
         Bt7GT0u8urG5mM7VGpgui5x0tU8Jq3FiXXDC2F2LLRABeroC77PLsUPZIeCuI6O1kAlu
         CbxTJC/FShGctGwxVaOjmvBnVgs+fpoKtG8tyiQZdXKUjhLJRV8UriTlxNh4DlIsBexQ
         7YQ3XQpz2/4PCvzkwRAPDjdwKqNUHYpIhOPIEA10fNQ/W+pEJGD3TrdZQMiFdjq+xJym
         EPWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+ljaXL0pcv2yUv5gAEJcMGlLG8E1gt/fAN5zrBk3QPylxles1lRWHAgX8kzS7TwjTvWoRltieDr8jIDr+@vger.kernel.org
X-Gm-Message-State: AOJu0YyTadFe+O0JYhZNy8DdhaO1FLNLa98NS/V9iHht16JWbCUEQ1Rd
	lqnMu6ExbBs88p2I8A+3pu7++1Q1jkiOA4JG2icx4ap6+5YrVSGXmVfNZZz4XDGbTtw=
X-Gm-Gg: Acq92OG+mg4ptQOupW+pXtFMb652NuiXfkYde529CJoD9GsPm67rMTMFQ7DS1U+3LZ6
	fYXkuCDUPkwpi28h8uD/z/NRXo5DG2P+n2T3EqtM2TZ6PIAoq0BX9PH74PtrRXdffMJ9aKk7NFW
	iXzfMIH85vWQIDsLBnGPt/SMLyssrf95fE7pOm6vQjAXDVQnFbtMFRrj29I1zh/D4GvPB/QUk9D
	sFVsfggHMDgj+h/UXhF5SJnj+Yw5Qnxao0M5tG98vbU1r+xST6MzmUHoiliJW6gyjrguBzzwf7e
	mo7p9TqbpH8svwnVvUT3wYJFTx9TsUDddYVseOQ/0bhXgnJf1kzCfqiE+HO87R1uXzG+WL6Um3W
	V5BKi2QmRu7v6GHPyOYUbbF+2RYbYMiKQfC9lsUxYdwQ5pivWaYix2O/U6dzdwhdtN4aHoW4XEc
	f6fTUCH7nSP6wNtePGs4I44bnPFV4jped8rQ+dXZU0iTxi0GhPkCNAUh4F3aKQ/poV72h9e5gU9
	zArXVYC9D4iJHQLizfhHT58
X-Received: by 2002:a17:903:32c4:b0:2ba:de0:1eea with SMTP id d9443c01a7336-2bf20645efcmr10040375ad.18.1780017419264;
        Thu, 28 May 2026 18:16:59 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm389235ad.4.2026.05.28.18.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:16:58 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH v3 1/2] hid: Pen battery quirk for Surface Pro 12in
Date: Fri, 29 May 2026 11:16:15 +1000
Message-ID: <20260529011619.9586-2-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
References: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110207-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 70A035FBEED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index a1cfa436344a..c383778e241c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -463,6 +463,7 @@
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


