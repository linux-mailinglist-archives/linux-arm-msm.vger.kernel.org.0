Return-Path: <linux-arm-msm+bounces-90600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uByfJ8Cld2lrjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:34:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFAC8B876
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434F0302795C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C8734D3AD;
	Mon, 26 Jan 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHXpl30Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B334A3D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448893; cv=none; b=fljhmj5iBDCP5VVsmKLl2vgDryFC6S0+QFybsvvsa5i4O1E2466J/CrrjMAY1LvGNhuUKCGqeKPnt1XR96XSzELIKx2/0VekKCPDjbgsncG8tJW4O+/WFa8dXWsY7aUocq+VzjhIFOKheIb3uKvwlsWO46V7zFm1RDxvoSziMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448893; c=relaxed/simple;
	bh=h0/ub/2a0CH0c01bv1YE6IT1oluBRPkEI00u7f+PX50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4R5+ECo72kb2jcz2Bcrjf8nmSMlB/wRIu69fh7tfx6QpY5TRvlT6YxofY+TPG51NKFjlZk698A6B0I9otbg0+vFnuVoAwMuwgRXgMKN38n5MP/xQ8az5qLW4gkcDxuW5f+38aVT8KOWuQ6uY+EPGHW2i6MW3EBo/ziTw9BW86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHXpl30Q; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c61342a69b9so1646385a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448891; x=1770053691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjv9fu28bLwysGYF55oXTU3CWsx7n76bAr9kUcIOrhg=;
        b=jHXpl30QutwixtbLbABlv+tUAZiY+krcW8bp3F1VDwy5zyH3t07w1xTt+yg6HvAuG9
         s3VZZdsD0qs0DWhHjpETeqRHjaDV3gLcMtAICBmcUM6x01bIEXWe+Yok3pKjsxO3+8+r
         TXwUdMh8u8FzBI+PaKN3q/aGGkiSbq0g5nZ+6ljBYdhwdNBCPh2wyPYHLaC+EV2w9/V7
         LZGYza7ykHIH1lXl5dEQ/T+WrLc9Pr7h97fvOEx2+y9WoqtonpymuvF78zrltPO5K6n7
         KGcikTUDnrtYpR68XKm9Oz9Obm9/ePInqf8POm4Q9vlXJR/OKZwehqzhrE8mMEziXoqN
         H22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448891; x=1770053691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjv9fu28bLwysGYF55oXTU3CWsx7n76bAr9kUcIOrhg=;
        b=Z0FPQK40YUB9OvFYcS/t3raq2fDzvU2VzZiwgpShgNmNxvPiU7g5bNj3lgCkWw/8Lh
         EUioILl1s2L8o8/CzgckNylN737xZUw8DJtJT7xTX+HsBSN9rO39FD8A0o+G53UfAgGD
         mnWhfUtGZW+PtTOgsSwIcSsfDMKApi/L3F8W6672uUClQ0W5oyaLJvlJqvwjaRrPb/LQ
         bSTseflCL3cXA0X9RbT9sgf8y92ahZRslhF1iQqGCsAaEtiLhY5Y8splcjb9Dr6UccRP
         8rpbJ0+mhKa1zHynqiPneYHUBor1Nf7zPx2SI92wtGqAc91rHO/KhfUj7GW97985WrAf
         8Y0w==
X-Gm-Message-State: AOJu0Yxyo3hacXxUa061H8sOjghQcb8PpMIaWiEfzawpP8YfzAXZ4CH+
	z2MKsr2S74Y61LqrYAIyd+TwVXOaJkRGFI9d+u+bNXKp/R93pDpCOt06
X-Gm-Gg: AZuq6aKOK3cbyJAlvDJMj7eos0Q3TKvh0TAHqgtP68ABOYnTA/GANdjfvAvnDh9s9dJ
	RT2IkBZ/RdNm4CPOWHjnhgU8fR3FNWohaNpFWrtqe9a9TwBqEfRypzelum3O6ylO0LvQHpW+h/J
	YVMmKYdll87ul4kovS9Pwav5obgWM+imDKFtoG8fJFpLIKzSSyEDBSAdoGeP8mxxPdoHlpMtejd
	720PBFAqJf6NtC6fGPp3UBZGVZc9NLO1eXJDnbXhgHg6/PPU7SezAyvyWHLIEADf8l5OdoJtTtX
	1Px8fxp4qJ7DyvMxri+ndhV8kwJDwoLg4iQZMk1CaCIy+Iuqnh/TDkBWjj5qyeLNcNxXNaWPjl8
	7khP92s+b+EOlTWXc+ADVMOh6KHX8E+nCZcuG03uuXM6SlOAwpi6hhm95GXovPgZWjpntpK6JgU
	xm5FhfqwBUDoFoIsCqzmTB6I2YlMb2OwXEICUr
X-Received: by 2002:a17:903:3bcc:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a845323587mr42365825ad.61.1769448891061;
        Mon, 26 Jan 2026 09:34:51 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:34:50 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: ov02c10: Fix brownouts and power sequence
Date: Mon, 26 Jan 2026 23:04:41 +0530
Message-ID: <20260126173444.10228-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-90600-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BFAC8B876
X-Rspamd-Action: no action

This series addresses stability issues with the OV02C10 sensor on Qualcomm
Snapdragon X Elite (X1E80100) platforms, specifically the Lenovo Yoga Slim 7x.

Note: This series supersedes all previous patch sets submitted by me regarding
OV02C10 / media stability and cleanup on X1E80100 (including the 'pipeline
lock' and 'brownout' series). Please disregard prior versions.

Problem 1: Brownouts during rapid cycling
On this platform, the RPMh-controlled regulators lack active discharge, taking
~2.3s to passively discharge. Rapid close/open cycles (e.g., WebRTC checks)
re-enable regulators while the rails are floating, causing the sensor to hang.
Previous attempts to manage this via open-loop delays in power_on were deemed
incorrect.

Problem 2: Incorrect Power Sequence
The driver was not strictly following the datasheet power-up timing (T1/T2),
potentially leading to race conditions between the reset pin and power rails.

Problem 3: Race condition on removal
The remove() function freed resources before powering off the device, causing
use-after-free errors if userspace (PipeWire) accessed controls during removal.

Solution in v3:
1. Implement Runtime PM Autosuspend (1000ms). This prevents the driver from
   cutting power during rapid user interactions, sidestepping the slow
   regulator discharge window entirely. (Patch 3)
2. Enforce strict datasheet power-on sequencing with ample delays to satisfy
   maintainer requirements for clean boot. (Patch 2)
3. Fix the remove() race condition by reordering cleanup. (Patch 1)

Changes in v3:
- Dropped the "always-on" regulator patch from v2.
- Added Runtime PM Autosuspend support (Patch 3).
- Added strict power-on sequencing with 10ms/20ms delays (Patch 2).
- Added fix for use-after-free in remove() (Patch 1).

Link: https://lore.kernel.org/linux-media/20260125171745.484806-1-bjsaikiran@gmail.com/T/#t [1]

Saikiran (3):
  media: i2c: ov02c10: Fix use-after-free in remove function
  media: i2c: ov02c10: Correct power-on sequence and timing
  media: i2c: ov02c10: Use runtime PM autosuspend to avoid brownouts

 drivers/media/i2c/ov02c10.c | 70 ++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

