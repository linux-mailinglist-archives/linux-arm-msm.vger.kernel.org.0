Return-Path: <linux-arm-msm+bounces-115006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1tbxMhJbQmpG5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:46:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E36D99A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=HuDAJGgs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD4C3152275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C63B9DA5;
	Mon, 29 Jun 2026 11:30:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1882AD16
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732653; cv=none; b=m97KbE69+q+MqrbwE3KMVvo8IG9JdculBPm8fKAeROL/wwJAdqxiPDE6YJglw5rP1QwfQeqFG9DXFRGfPLDb90VYMV3LiXdDDMXsng6axXKIJ8OUDyFbXjcniKppG0U+eKfnfrZGsS6cOkhTBZOtw63xeqJyd+v/hNhG8C7Gduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732653; c=relaxed/simple;
	bh=tLCipdQXdvk+X54XG19H4WEIV0LYjVmOIozs8kbuuLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ej//HbiSBZyoBWlzx8NYzHBsXMMXcryDs6RqL3xxVTnqIEVO2IvZtNshO99sT0E2uo7wFqZySDRc0Y4P6tZcvZSHS1pwJnHLNbjphkquis6nBoVOeWYHoi1gZsk59U7AVvmVmS5PMgKsneixfhZKmztdhwxrm8WRgoW8Mhpt54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HuDAJGgs; arc=none smtp.client-ip=209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb17c2564so848699e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732650; x=1783337450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk3k4V5ThSK0Ndvgs05PXxcs1Go1E6a1gwU7BLVejWc=;
        b=HuDAJGgsJH43pXvVoE/pxaIcw6a7dsGbA7NTUgOu1eF6sFF+acXOl4+IeyRpqlIjXO
         tJHJi0y2jYi3iPAtYSO3Ey64MCBFVDW2O4iJJVzpT46Ay9jTaz/kPR9/bMC8PsDMiaEE
         dBEt1VX090luz8nXZojvm2BRXpUrIXr8lFdGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732650; x=1783337450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk3k4V5ThSK0Ndvgs05PXxcs1Go1E6a1gwU7BLVejWc=;
        b=kwYnumJX0tiM8v0LYfIHef+k+pyfzX73LFvf4DTSBCWDaQWLvNuyOVjkPh9SqRtFZF
         ItXalQoyz28nI/rfPH/DZtiksZPARNOSM6Clpvdvf5oXTD+uuoVUt7sDg+c5O+P0dYmx
         kt/NZTbZRV4nZNKhRUYm0+7wZ2vqptTRo80cTMYCxtigeYxUplc4NMjCGtUvopjkwnDQ
         Er6kjFWGjrJj2rSzOTCNdVTTSrixcA1xfE8/MfRyOL6UiqQimZA4r7Z78Uegsa0kGWVi
         a5je/D8lL6tkzdnpvgmsuVnF++fez/vnMZz4LEZaTgBuXz6OjWL+LBWOlT3qoYt07678
         bI2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaCf1WYteKVkEb6n8J1giiZsH10TrLf3cqIEiS/5Z2TYZhNZjDu00oKFvU8O7gxNr7TJ+ldGCzCNOMRySh@vger.kernel.org
X-Gm-Message-State: AOJu0YxNcIWy2OT1NE4ZmiTiI8FFf0THaApZWlnGjDAn+NYGiIYygmc5
	/Oy4+17D+MYZZSCSIfxNFEHRDWm7bfJa0/SfrYcrN6ejcEvua1+VhxuWavC1ogIK5A==
X-Gm-Gg: AfdE7cn/yNrGhzOSgHiUvqFB230Oz07n6QOHoBycl2IpLcO4M2/SRZnPE633rjVS4oj
	DZRMxV2xOKY4wkH6e73wmLY05fB9145tpEzGLW59nU0KbAfDTAI1Xy1pZ8wm3SwNBvhmjro6lU3
	4K5xiRxDbdI2yI7Czl8eO9MAFmvACHN0p1HRfaOvh2gdnoxTcF78pQF3qs8+XC2Rki/rKlL4kcx
	tybnZUt7O+h4SpOQifyORyDwooMyGjzVNjFJkX06RLooluDzc2xn2r2lZJ9/O7S8shYqHrwfOv0
	9DpI+TT5MZfLLqBLetN9Z3h3+6h53VXQBBkdJpzpUjx0FUkS0NWDrZBY5JesP89Kqf1FG6XfrHx
	34IlrLU1YOoUUB2+iEJMshRYbQJUkQE++ufMXWC+tCEkQ86iLGP3amg/FnkNqsi1mRAe997UNfN
	hmJ9sNM8Nz3Eh+2u6bM8bLGEvKlxFeqIJHQd0/szWnOxJkmI/5NOev2ZfkZEUHvu9wdNtk
X-Received: by 2002:a05:6512:4007:b0:5ae:b981:3393 with SMTP id 2adb3069b0e04-5aeb9813418mr839912e87.42.1782732650359;
        Mon, 29 Jun 2026 04:30:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:42 +0000
Subject: [PATCH 1/9] media: em28xx-video: Remove unneeded semicolons
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-1-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115006-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E1E36D99A6

There is no need to add a semicolon after a switch statement.

It also makes cocci a bit uneasy. It triggers the following warnings:

./usb/em28xx/em28xx-cards.c:4085:2-3: Unneeded semicolon
./usb/em28xx/em28xx-core.c:635:2-3: Unneeded semicolon

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 +-
 drivers/media/usb/em28xx/em28xx-core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..133bc1082d57 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4082,7 +4082,7 @@ static void em28xx_check_usb_descriptor(struct em28xx *dev,
 			dev->analog_ep_bulk = e->bEndpointAddress;
 		}
 		return;
-	};
+	}
 }
 
 /*
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..d4197e37f637 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -632,7 +632,7 @@ void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin)
 	default:
 		dev_dbg(&dev->intf->dev, "EM2828X_SVIDEO\n");
 		break;
-	};
+	}
 
 	em28xx_write_reg(dev, 0x24, 0x00);
 	em28xx_write_reg(dev, 0x25, 0x02);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


