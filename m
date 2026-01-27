Return-Path: <linux-arm-msm+bounces-90839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFLOI+DseGkCuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:50:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 233BC97F6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E95F300CC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1F3361669;
	Tue, 27 Jan 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMSbe1ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095835B63C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532634; cv=none; b=OYOGoHKn1lYwWAZTboj8Nc88GbNap8vEbXhxPQXatPrOnBdO2J3l2Tv8AaZTbgnUWLjOoe6vKHL+0USUgIKuA3Pek+bC49kE5kNLkW8FJrOzSfzpLOk+o6Z0sGiaswFyVAYshPzU2oq+En8g882VhvFj207AVpfCmqqMouLDBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532634; c=relaxed/simple;
	bh=aEx3pLBj8gvBTEDpyhyp7pqHwhzZ8IHrcrqz1f12G78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ja0YiJmC2uEIFAnUPvS5p/47d9UBg3rVOQPNhK8KzuazrcSJULqr7N5f+WFxCtZXOJhv7Z9Nj3zBqtDE24/ZKliKE6YRMKiyex4J/PkIPuITF81Mx3tXtJIY4IxFX16nHNphT1S8GWg6UNNZiTz2IkYCOnQZdtIPlUqwCKGGalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMSbe1ef; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f102b013fso53692365ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532632; x=1770137432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFUtSxTOqds6zm0elI90Vt4eXQm0HV+4Gibl436HNNU=;
        b=WMSbe1efUxlmBC/tnU21vJTuWfsil+HIYKpxT/azzzuEmIcyfPtyjQQlsXwyuyBuMM
         p6ccEVf6oRO0FQ2l+h4sKqxCzvXfQkNt8i+8RBOxzcNR8Kj4uvR3gq79slGU1CPD1zRO
         eHWkSvNm3KXveMrznxiaTQ2d55fN0xzDEh2II4+fOdQPbf5xfBIsNS9HXjAjc1US/zSv
         PNIQNaRB96TJT6nD/YCGnEmwAjbqg83IEyKHf79zQRldZ1DYZxJ6LASW1AaQiJq9xFD/
         BzzRsczNQdjp0JhVSKRPPqG/zqE/NMmfPu0Q+t6iYPI7Y2q5BSM+yCqr+2unZVKtlvfL
         bTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532632; x=1770137432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFUtSxTOqds6zm0elI90Vt4eXQm0HV+4Gibl436HNNU=;
        b=lGlkvJAOgGVTZYq9iwy/SxZX2VpIXguC+vBM4yyJzLUoTxoDFc0OnijmPveBsW+oL1
         Ify0OPjRKc3ijmYHq7YM0daV7abu1csHB5ByfloGcKsSw32nvLrBvH0xkmuWmRrvH8Lf
         kkj3i/ApP5EnXbfpdMy/NjyYXCS3n4CGb77nD65nKUlRqp+Pe3Zq2y4mCFpxr6sBIGWC
         IQdndjKcaFM0ATBWChGrpVm7eAeXr5yp9uAR5JpMmAQ67R840JczAQT5gkzPJ/zznz06
         MnYv+ak2rH+TI7x60qweRSg9SqiN7LLok5PZNWhzqRCXN0Zo1NdI9TLMiG5E/clElbyK
         Bxeg==
X-Gm-Message-State: AOJu0YxasN+2HClJBRR0U5E6ECv2XCYLswL5jJUDzhOq/fHq5dKQH0xd
	+pc2LXoiqbCI/bJpfFl9W9ufkwcym/3qYfUlizWUy4nlxHKkz+sXBwqE
X-Gm-Gg: AZuq6aLr00oN9ui9BrGFOjx93lEBJB9/LF5wSATnTVi/7jEyTwlZ3erINeMHbmvUPHF
	Tf1KH1kwpCoiuaLefEiHk4tiRjiYD6SJTfdnT3AtIKaVzkwg2e5hwVqnKq4XNts+p9n9lhRRFVf
	2rZTsrv0EIOo9McxaSzpVB5/GrIpG5n+sP+xHCnnfHBPKOUwaYKPn0zikbJFuVz7l2y3puWxABd
	AG6quAXS955Z7oAwicvi4dhBDwVsWBN2rBU6NyxtlFXlQddTqk1uEpVcCTVVc1YzSL1ZTjmrvyW
	AaN4Ko6n76wJhlK/xmY2cDjK6Du+CRQwxyVPta/DCWnu1g9YazIxvTtFuMW+DMXoyW8Roxg6ggz
	OtNxMIbDeG4ECkUXa1DdaHyI0b0S7Rips3PLfA8+Ha5Km8ehy8nYUryXPCE/LyanlIWekK0tdQX
	QDBMdF26rxlzk8AQvU6XNGomb+IvRG27fuLe8=
X-Received: by 2002:a17:903:1b10:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-2a870ddda67mr26361515ad.45.1769532632328;
        Tue, 27 Jan 2026 08:50:32 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa46fsm120318675ad.21.2026.01.27.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:50:32 -0800 (PST)
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
Subject: [PATCH v4 0/2] media: i2c: ov02c10: Fix race condition and power sequence
Date: Tue, 27 Jan 2026 22:20:22 +0530
Message-ID: <20260127165024.46156-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-90839-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 233BC97F6D
X-Rspamd-Action: no action

This series addresses driver correctness and stability issues in the OV02C10
sensor driver. It fixes a use-after-free race condition during removal and
aligns the power-on sequence with the datasheet requirements.

Note on v3/Brownouts:
The "Autosuspend" workaround proposed in v3 to handle regulator brownouts on
Qualcomm X1E80100 platforms has been dropped from this series.

I am pursuing the root-cause analysis for the regulator discharge delays
separately. The platform-specific constraints (2.3s passive discharge) will
be handled via the regulator subsystem (linux-arm-msm) and device tree,
keeping the media driver clean of platform-specific workarounds. I will
continue investigating the underlying physical discharge characteristics
and PMIC status registers as requested by maintainers.

This v4 series now strictly focuses on generic driver correctness:

Patch 1: Fixes a critical race condition in the remove() function where
resources were freed while the device was potentially still active, leading
to kernel oops.

Patch 2: Corrects the power-on sequence to strictly follow the datasheet
timing (T1) by asserting the reset pin for 5ms before enabling power rails.
This ensures the sensor enters a known clean state during cold boot.

Changes in v4:
- Dropped Patch 3 (Runtime PM Autosuspend) to separate platform-specific
  regulator fixes from generic driver cleanup.
- Modified Patch 2:
  - Reduced reset assertion delay from 10ms to 5ms (usleep_range 5000-6000)
    to match datasheet specs and maintainer feedback.
  - Removed the software reset (0x0103) and extra regulator delays to keep
    the sequence minimal and compliant.
- Patch 1 carried forward with Reviewed-by tag.

Changes in v3:
- Superseded previous "pipeline lock" and "brownout" series.
- Added strict power-on sequencing.
- Added fix for use-after-free in remove().

Saikiran (2):
  media: i2c: ov02c10: Fix use-after-free in remove function
  media: i2c: ov02c10: Correct power-on sequence and timing

 drivers/media/i2c/ov02c10.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

