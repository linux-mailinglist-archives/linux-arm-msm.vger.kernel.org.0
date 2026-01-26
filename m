Return-Path: <linux-arm-msm+bounces-90482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBnpHyAHd2lGawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:18:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4899846B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3840830115A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 06:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF2926980F;
	Mon, 26 Jan 2026 06:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePz3t3Xp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212E1F30AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 06:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408139; cv=none; b=WKx2D/CGoJBPyTYLykVzaP0kX6kUMDTWoirw2TarOwS2MKhyKQx4sVwE1yIo1PZdaVSHG8V5H+rB+P7R5vOhfSdJJTGHcCOMOPhpfkbqzzJXakotiB/6jilivvXHkjKLYdQlNOmGsiwUg015ZOJrY+/gJxGAhHAxeiQuE5G4TTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408139; c=relaxed/simple;
	bh=ZIKmF0boRd4aQJJl1kSLxxFnc1ZN3egassPW/w/Ka1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5lRkkNfbDuXxIOa8/cEGvpU9v2+SOtnR6IdtwPY8bRyj6BQpEeTXGYd8mg2HiSr8CaHhv8d9X12RaZghG5b+FBaSeBuhh2Nmoa8JJKL+alaWXllJ2xB6Lj4fxReGLZn8C73eXWIDgNGX/9s/rOdiKDZQyXAgi/uDWsjBZ2Jx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePz3t3Xp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8230c839409so3188243b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 22:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769408138; x=1770012938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo54aCp4Rf+yeSJL/ASA3fIY6d/5SoKgWC6QPgdGIz4=;
        b=ePz3t3XpsoCW3unUG4QE7ulZAfDt/gy/CiyqimHC9orXukghWZGZKQL8kZM3EtFHjl
         GhjAR0ZkAzvPP2nfvXkH8F6QNSn5WzcQDtQSi7PaD5f7LGP3PtjKZn5YkC9jPkIuWYGQ
         7OXg/L1PADtEEeCBr08YGgiZxbpcLIPRrWqvPKNr/oVRfA3mBU/91DA/UV/8P1biWfTN
         J0cngKfDDswaRpNrlJpOxnWXR1QRd4u67mKsiGeCfaOVn/2KDfw+m5hA6W+QSuOCrAY1
         z066K1C5ltGJLPzS10BjLVuSlPUHKvyvk0mb1nz0VhAd5zL7RIW7bmB93O2c/yT0ZfrH
         H69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408138; x=1770012938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo54aCp4Rf+yeSJL/ASA3fIY6d/5SoKgWC6QPgdGIz4=;
        b=EfbaVlgAmrNo3xm0UUWsBHAy7i75hanTf21WX5jTKtSdenwh6F+1W/9N0UN4j9nxNB
         Ytcb86E3Qwz7EWlthyciDk3JdBDzHSk32CC/TkJrPs2cvkpL7HHrMYr7Imq2XS3x43XO
         ZPj9d3T1Awfxfp0V7hSp6mKbEmlFxYu57yl1S41uoFXU6EjNkMiVg06BMnBezPidtxpK
         eAZRpTSgDSWIlMlRAhpwnCDGbnTw+Wx1i8zbrAdGLJJztQKAR5xzdogN6+bpTouyTRls
         UeO5pxgI7pFRcXsHyrT2gGzfzuHW6Fm5AhbCMOxo6S8olbKLS2qcPq8aAN0WE3M8w7Xt
         e+Vg==
X-Gm-Message-State: AOJu0YwQfMPbfUWDDZahW+/StdgrlHtTtSb4wUd54hLZKQo466VYh0wL
	a0GfvuZPvIBTsCp38KsYLp69/oxxshLGKubx+3bBTVZykL6F8teIut4r
X-Gm-Gg: AZuq6aKPLm5a9jpf/1blSRlZx2UTbJ/uhNws3BGR8uYunqgFAwSNC4l87zd9b4OtuZq
	jsGqQFEe8FXB5xWciQ/0x6ks1adPxNb4qCFB3K0uPE4tAKa0H627B5Uft7S34Bb5qzqGJrG0UG6
	EroNKEkGL8dXCB0NxITuH2Vhzy7JljfuRXuvawRaL3As+ExqEU6JUuAmzyWba8BqxSgIPuHPIQx
	5lyDz+WdXb0jwo9uvLoxznVkzqmNxN8xL4BJSZ+JvPO5EbdP6qUIM82WhCq3Wl6+sdrUqe/ygaq
	vNrp2MIvBUFtcHAJxJqeAif5n5jp9w3Ioe8AJN9uiUL5VYqLRmTD8N/RsSGPm1KVLUufBN/6lRl
	dUP2XqWgeUkZQoQJO3jtHrp2V4BZI83/kdw9FAnYyNueg0lgPUY7/5+Wf4hVQ0D2EcVCbTBuU0e
	wj2AM/V9di65wb9pXYWyCFITR4rO3sqA0ltdnm
X-Received: by 2002:a05:6a00:3e11:b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-823411b83c6mr3630070b3a.12.1769408137739;
        Sun, 25 Jan 2026 22:15:37 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:9b36:8e2c:6fb6:590b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823187716ebsm8543796b3a.66.2026.01.25.22.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:15:37 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 0/1] media: i2c: ov02c10: Keep power on and use reset for power management
Date: Mon, 26 Jan 2026 11:45:27 +0530
Message-ID: <20260126061528.63785-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125171745.484806-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-90482-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4899846B6
X-Rspamd-Action: no action

This patch is a follow-up to the series "[PATCH v2 0/2] Fix OV02C10 camera
pipeline lock issues" sent yesterday [1]. It addresses the remaining brownout
stability issue on Snapdragon X Elite platforms.

This patch completes the v2 series by replacing the "cool-down" patch
(Patch 3/3) from my original v1 submission [2].

(Note: The separate series "[PATCH 0/2] Fix OV02C10 camera color and
stability issues" regarding Bayer patterns and remove() race conditions
remains independent and is currently under review.)

History:
In v1 [2], I proposed a hard 3-second delay between power cycles to prevent
brownouts. As discussed with Bryan O'Donoghue, that approach was a workaround
with a negative user experience. This patch implements the proper fix we
discussed.

Problem:
The RPMh regulators on X1E80100 platforms lack active discharge, taking
2+ seconds to passively discharge. Rapid camera cycling (e.g., WebRTC)
causes brownouts because the sensor is powered on while still holding
residual charge, locking the internal microcontroller.

Solution:
Instead of a delay, we now keep regulators and clocks continuously enabled
after the first power-on. We control sensor state exclusively via:
1. Hardware GPIO reset
2. Software reset (OmniVision register 0x0103)

This reduces power cycle latency from ~2300ms to ~70ms (including a new
50ms stabilization delay) and eliminates brownouts entirely.

Testing:
- Validated on Lenovo Yoga Slim 7x (Snapdragon X Elite).
- Performed 100+ rapid open/close cycles with no black frames or lockups.

[1] https://lore.kernel.org/linux-media/20260125171745.484806-1-bjsaikiran@gmail.com/T/#t
[2] https://lore.kernel.org/linux-media/20260124071751.5885-1-bjsaikiran@gmail.com/T/#t

Saikiran (1):
  media: i2c: ov02c10: Keep power on and use reset for power management

 drivers/media/i2c/ov02c10.c | 119 +++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 50 deletions(-)

--
2.51.0

