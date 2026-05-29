Return-Path: <linux-arm-msm+bounces-110206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGh4DjfpGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:17:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7945FBEC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61E40303E101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC67352017;
	Fri, 29 May 2026 01:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3feYz0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC301C5F1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017413; cv=none; b=Pk83uOxYKst2YfRRK84SBGJMhUSclHcPS4TrnduixGwokbDhQZZmQ3gulRJB+uzF3MLrRZg0kmOtXgarwV57npWM5QDRziAuOCmeHohOZ+ph3esARRyv7ycVCyCq6yLPtRticrO2WJESc0j22aj832jC0inQs11IgIsS7IidiJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017413; c=relaxed/simple;
	bh=sKg6xoqq2s+ZZcuSNKhLo4WCT4rISU2pWEoW2HBRb+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pGn7X8ctj/iOnulFZKX1U+w7x9VDWr+CRDMhv1dwF78HR74S5uE8aQreq/aqLzeMI8fNozDlTGKM2Zle+SKXalUBlkNikidJwKgwD4SBs8WAWAoPRYdlKLoFrdg2V2kdKv2/RcTCcy7zBz5ue6ds/vwgYWSqJMF6kGzi3ecEQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3feYz0w; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b941cd869cso87005085ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017412; x=1780622212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDATUkG/OtxlAUVWKXX5mKstzpi/LS1mSaHeR98JWp0=;
        b=o3feYz0wg0BP86kBDfLGCOfCBFcdqHotfqStAeNzeC72X7lwjKgka7e58vHi727QyS
         74bipmcYMxQP39guIeScFgk7aXnz7ThSmZ1Oh7j5gdMapyrPJqbl89lo86+r4GXPqykl
         uMcFBg9NAqnj5DguqbjWuB5yIegaCUquCluh1mCZSt0zLz16NP/SPHDXM0MiZi/tsmKy
         fQXbBaMQjm7r/pLDsTI9qB4j/MIbgmUzmK8mhp8GUimYswcxktMl/IgExHkZI7T7GOUJ
         UqwSOxYYxN0eQAzKeBKf9mfKfcWBgppCibrCVpd6bLS9loQYbzg4aCwXlKTvukff1DRQ
         /oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017412; x=1780622212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDATUkG/OtxlAUVWKXX5mKstzpi/LS1mSaHeR98JWp0=;
        b=AOxod9q1SLcJbVR70Q5KEMNgL7WHA8ZNdVxX++MWraxEuRtZHtq0DIDinZ5RqopZHl
         1Hyh0qa9CeuxkOpi8bV3yvy9eo5b/oAnjUhhGXK58frktNhQSFCZG+ReBp3FALMSrXTS
         +OItg6BBU9yqVFDNHSkglkc57gGD8OLRMAiYhmCEN7twkHh0bPY/YG+CdSfwTsRcKMS+
         UgS09vUcbS/aR+Hip1KjQt97rT+gkHJ04cobLJO0nYglCKzcGKBi6+JVjKehk75wdGZp
         qNnz2kJ2aMFkPwSLBSnflRN52ezgIN51590M2eL4/jz+MioIFHjnHTEvIE6CXMccfK/a
         Y+zg==
X-Forwarded-Encrypted: i=1; AFNElJ+ezx6bBZHJyjmjXF1O3Pd6N7xpCNZc7igNVaQxjB94Grk/xfFQBpF2UBrvGNAvoRr+TNj28Sa8Z8omjpDf@vger.kernel.org
X-Gm-Message-State: AOJu0YywEGQiAOU5liwzVRfHKyoi432hTpWbSurU+/1mAQlc3nNRvfFK
	6NJf65ZQ8Ee0QFdtYMkVpjm6q7E3t9u9q4f9foJ5V64N7v2EJ2kdD+d3
X-Gm-Gg: Acq92OFev9e+8iFApDkPO8vQmJGguPVnH2Z5LEMyX4r66JZjMfj7xANwMymcG4uYU02
	TjQYzQSY8yc4oSNhjgvg6rSneDpUpeFexn2JKgJX+BRBEVFvQx6lMGwV1BEqRTgNSbAEYHjCQch
	obogJm1vMO9LNgIFw+0bR3G5mbcpKSXsyBNHNXuA8MTXHzdiBHfZ+Bm76fyi6QkjzdK86iR2fqd
	KdWEjGjjW13wqdRvyS+KK7qZQsSBquvpjn0ZYeRTro18tIgHz9s/IPDgk8+94YWHRNp4vq1HHS8
	7Mh7+Rn+RJHUoA0U0FAA4B4m/wnafR0Kt2TCyCq/QsKRZcu3FMnCfE6BYBoWDUP743hKwIVZi5X
	zZqaY600KuCSpTyb/d70wtOCMV9ZTgo5hYNJqEwGdxy6MzYAnzBJMZySgfqdht3HYekiqOGybXE
	aJllThpq4zJ9AsYDVJkpVULkYl/Sf131GzSLWRXSjaP49mEW5cyrg+V8fGGfgC430dieBOIfnD8
	dJU9EhMi/hOGSr2P3cwD31p
X-Received: by 2002:a17:903:196b:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2bf209a2d71mr9668965ad.29.1780017411611;
        Thu, 28 May 2026 18:16:51 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm389235ad.4.2026.05.28.18.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:16:51 -0700 (PDT)
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
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH v3 0/2] Add support for Microsoft Surface Pro 12in
Date: Fri, 29 May 2026 11:16:14 +1000
Message-ID: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-110206-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AA7945FBEC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v3:

Rebase:
 - Rebased on next-20260528
 - Removed ice device tree changes

Device tree:
 - Fixed C++ style comment in &i2c9 to use /* */ style
 - Flattened mdss_dp3 port into &mdss_dp3_out directly
 - Whitespace and formatting nits

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

Already applied:
 - dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
   (landed in linux-next)
 - firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
   (applied by Bjorn Andersson, commit 667d05a09db3)
 - platform/surface: SAM: Add support for Surface Pro 12in
   (applied to review-ilpo-next by Ilpo Järvinen)
 - drm/panel-edp: Add panel for Surface Pro 12in
   (pushed to drm-misc-next by Doug Anderson, commit 02f48ffdf96c)

Pending in this series:
 - hid: Pen battery quirk for Surface Pro 12in
   (acked by Jiri Kosina in v1, needs a tree)
 - arm64: dts: qcom: Add Microsoft Surface Pro 12in
   (reviewed by Dmitry Baryshkov in v2, minor style fixes applied)

Will be done in future patches:
 - Camera support (pending purwa cams patchset)
 - IRIS jpeg decoder support (pending purwa iris patchset)
 - Accelerometer support via ADSP (probably userspace)
  

(Audioreach/ucm2 changes for audio)
https://github.com/linux-msm/audioreach-topology/pull/32
https://github.com/alsa-project/alsa-ucm-conf/blob/9577cd31121546b288759097901025376141177b/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf


Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/
Link to v2:
https://lore.kernel.org/all/cover.1778822464.git.harrison.vanderbyl@gmail.com/


Harrison Vanderbyl (2):
  hid: Pen battery quirk for Surface Pro 12in
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++++++++++
 drivers/hid/hid-ids.h                         |    1 +
 drivers/hid/hid-input.c                       |    2 +
 4 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.53.0


