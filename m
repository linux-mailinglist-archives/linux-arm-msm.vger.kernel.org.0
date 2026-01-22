Return-Path: <linux-arm-msm+bounces-90257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAyfA/l8cmmklQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E96D1F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF9F3024177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAF53939B3;
	Thu, 22 Jan 2026 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZGaNzFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF03859DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110484; cv=none; b=MmAxjgMOqGf0Zf53fL6wLfdhOLzaQ+/aRhNstKORTk3IIpKTH0Q2cqYIu+yU8KJNzhZhzwsG/AjeJvh6vIzavkSfu6iPsAuxJBN0nlDda3/D3pi23K9ybAPNmVPwHuNDyePyk9jYA9asu/HOmdxKAbcTx1ZEr8CrUHKU7iWlFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110484; c=relaxed/simple;
	bh=X6qHzd8lT8x0AErfaNBQf+vdTTGsxDiQSJb4vl7S558=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rm6OEXcwId3aL9Xj+gT91S4VgdO81023arz4XHBpUhZ0mF6p89xNbFYNQdPZul7YqudI4ufhdUErUo1kE48IsG0+FEg+xw9Q0lH9vkvS0loT/pVQHJnptb0LgVb+en+DX5YQxYqNq8KnBez4bBz7df4VcxR2Soy35TVPXStB4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZGaNzFD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so10697295e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769110473; x=1769715273; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r19cOw46wdNPFNu3JtRNNQTGlWmZYB5Ebmc5Kt/KBwU=;
        b=PZGaNzFDBu/Ss1WEZH1MN99BA0XBHEadvePWq3IMKOeeikFrPbPm7r23t2umXEPXg0
         1BcqWdg3V7RFpaPaSNYLnbkUtWf/4ZPSqe9PaUXMtlWzk6ZdVuqlucllK8e49d4p/kgO
         onf50nSUT8Lp9l2vlxDoWygh+NELdghAtBBva5D+jfzJqvPB8sujf8jZN9RsrJW2rkCv
         DK/uzsnEAgtvNRncvBedQ5GSqpljLvauO8KbP88g2U74yTBXWzQE9LcpxMl7UkR926e5
         lirC1xFaQrxRa+MseRSz1aTa95gnVCYhZg9GA1NoerrNSLPgE1ZxEwNhlze7nicuWc2C
         ZsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769110473; x=1769715273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r19cOw46wdNPFNu3JtRNNQTGlWmZYB5Ebmc5Kt/KBwU=;
        b=T167poUv5BwXQs2+kdQeueaw5XbvR5GIEircG0vq5wtUO6x2l1VBVYXMQWe8NDkNwx
         5pnoUoi2FEueRIycN4fAUmj6HbLrhEogQkjIEm58jCSwycO/i04I2f6G+GeJcX4q04yT
         DVKYEGv6fxE/ZO7jGfAMqivu2ZwqKk9DIEO3EzbTnGULFc6A0OcNwMrnSnRyl/4Fuuqm
         T71l8YMashrtVq3GKUcxmDCLdTbNCLXsGKjEWh/cZYbNJUg8Sw6+AFAXebbYsNlj2UBB
         bdstAsCvvAZlCXPUwZD29xD9jAYmgmVKHfRAStWSLQmkqxv6ZDy8z9UIN+C7L7VzD1ag
         71Mw==
X-Gm-Message-State: AOJu0YyOV7eUqkxsvaEsDrjLib8tXAcZzoT6i0XJdm/HungakK/OTkpw
	yJsiNxsF9InYBU1yLEL2kQaAXDrgEwuHRmoJXP5HEKxVGog33iF3FVAPr47oBA==
X-Gm-Gg: AZuq6aIK6mKoGb8lqUBYG2rMzSuaD5Ts8mzejP8kl7cR387khPoNSwt1XAVbhsHGWSS
	1UbQcR3FyNgD1hk0hTfFSYSb3uf+iL7I0Au9lwriqn3Q2mtOq6o/sreXSCZoCdBYWmzICJ7HQfl
	9DrnryS+izuGyBS+UmB1bWpcaPMnveXhY8nCBowIQIKDUhrkIwt0VmII3LHQ3vI4yt5n0rGKzpC
	U/fLwOcPrMMtjJu1i00Ctg/W1FU5Bo3sexAXA3pLPZz/4xMO7uoLl2MBNMJJEO95h3v6JlCKuCh
	62CysZ+gQ4IWiBsS8Bzekx4YLi82qz1hYXmmuc4bheWiQhuQf8YlaWvXQLPViyEhNiFnkzNyw6A
	fv5dk6xqlI6mqMcS+mPy73m2o5Zs+hEe4M6ztzqZtX+E59D0WMtqbaWZD0Gs+Ayn1OfJK3Ndli8
	ak6bLk1bavQX/Ni23Y9EoBEN7jb1yhuKLvCLvjrROc
X-Received: by 2002:a05:600c:8b84:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4804c95cac1mr12610375e9.12.1769110472800;
        Thu, 22 Jan 2026 11:34:32 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm853240f8f.5.2026.01.22.11.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:34:32 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] interconnect: qcom: remove some duplicated defines
Date: Thu, 22 Jan 2026 20:34:21 +0100
Message-Id: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL17cmkC/x2MSQqAMAwAvyI5G0iLuH1FPEgTNQertiiC9O8Wj
 8Mw80KUoBKhL14IcmvU3WcwZQFunfwiqJwZLNmaDBlU5/B0+4Z8HYIss3qJaLvGcE1VSxNDbo+
 QxfN/hzGlDx3acaRnAAAA
X-Change-ID: 20260101-icc-qcom-dupe-defines-2971d60480ad
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-90257-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A09E96D1F2
X-Rspamd-Action: no action

The series consist of two small patches to remove some duplicated
defines from the 'smd-rpm' and the 'msm8974' drivers.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      interconnect: qcom: smd-rpm: drop duplicated QCOM_RPM_SMD_KEY_RATE define
      interconnect: qcom: msm8974: drop duplicated RPM_BUS_{MASTER,SLAVE}_REQ defines

 drivers/interconnect/qcom/msm8974.c | 3 ---
 drivers/interconnect/qcom/smd-rpm.c | 1 -
 2 files changed, 4 deletions(-)
---
base-commit: cd796ca8b83be6bcab7610e420078539fe67ea03
change-id: 20260101-icc-qcom-dupe-defines-2971d60480ad

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


