Return-Path: <linux-arm-msm+bounces-111085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id phedOYrEIGrq7gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:19:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF263C07F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UP6HcLXA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111085-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111085-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A4473035F1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2A21F3BA2;
	Thu,  4 Jun 2026 00:19:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9E61DC9B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:19:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532360; cv=none; b=qTv+5XoU6+qCG7wXaOLI8IRPH1U1NV83hNdJIpgKtM0qKG7C6EATds17HfH3+n/T0pC7de+4Chhn/SNol/mEHTxN7luhCdOb2Td6DWzIkno+DpPiiMLGzPY9UXuBTGMfhEoLaePP4UT4N1nM7JxcIOd1QalKWeS6nBi8I+W6E6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532360; c=relaxed/simple;
	bh=RoZxAhgVGfG73eFwtofeyMeDcsLxCMW2oDD0x5o15LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YrPqB9bkocikjnW1e4qnQtgmiczVBCXjfd+p+sfZ98SW25d7+JP9uzhAmQHeSEpGGru/wWmsSVC4rkRi7GiR/tJ3CBzEmQVcBW7BNSrorRq5McWDI1bH3+ZxSjYbMqyacdGs60PSLy1pQBnjm6qqzvtksPiT5Mr+hp69iUwgw+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP6HcLXA; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137eb0d76beso724805c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780532359; x=1781137159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z17zQzK8RwGzcJwJjulDGUCdQtyWeu3u7YyL1udHTck=;
        b=UP6HcLXAq4mh6lp1fg3zqqe5QoqNB8Hrl7accTh8oNGNOxVb8C3h/sinKXPzFQPmt4
         PhDplfE+61F0EB7wCAZRlWiFZLo/gc+uE0mbNqwbx+KMULggoOuutj8yjGaNT8FseF84
         LFWZ6WZw9OKC0E2E0U2JgIp8Hn4mhlyebynIaVKUUTlq9SOkFbxstC8kQXOFVhRgKVfD
         zqpflfgafkNccOD4oaesRVcPm+mUhQhQgMw8yKx3JgBJ+3jKATFjo5CCFZSH5P6s33ZZ
         Bt3jr09aKvaazJZKDBA488mfUO0vIQHIXV2XAWTV4A96VKf1wR6gBVtaBODdkPmKng/D
         yQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532359; x=1781137159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z17zQzK8RwGzcJwJjulDGUCdQtyWeu3u7YyL1udHTck=;
        b=ozghT5C7z8BBhQHLKFR5h2IMcAEuZKq6EempPZ6IZ9J265h7lzm3/5p7FnkD5NIsAk
         /nODtAg0ScpMeSasDO0bAXgwnACOhXWLlM3fOB3E/g3sczubrsmFDXDZYQA496Z/e0KE
         xg4ZWAG3oQlbiisI059qJHbxL/N8UX4u+zi0n6LVIS0mWdQ/DQqGmb1zRDes1Naf1gdY
         7DyKbfHk5EmCU7gAmf6xXyELApYdhn5mS9GuInPp62K19lxvwiFeJLWLeWfrEi+HDe2e
         s3wDA1Hy26L7NvE3Biv7xOE3RtORZCBrA5N0AS2PI8+xbLzuqaLXhDED958EzQrsU08c
         DPTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ig0JGOX4lMj66D8ESUv5S/VHBIzPP0a4wOvjFbNXkmYoOCBt/CXKcILy0HJ7GRMD08s6DT0hc/iOnkIJK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrqss0EVcYvHtjTyYqMoahDlAaTIznvv8itgBKN8C/LdjfB8d
	mEux/ZzcK+s9c04IrKZvPPt9dHjFXL+JshHvzZUwPjZBiiu45m6cixIY
X-Gm-Gg: Acq92OHKEaFsFV0hKuRjwOehh4vw6GnDiDlTSfKqq4YkIuapnJ9sAZfKRt6ZmwkDpY8
	lDvhU8M0ex0aB0o8F4hAqtYplqXR2HWSg0qqXu8NHmCawTP09wpDO4Qrgsj0WyTfRNvGX91m3bJ
	2921QE3iKqfXxoPt34kILK987NfLV+j0iMefHzD6M0qnBBShYs4EL6weKbvVoSglZS0ou+ThX4v
	ssegPCtaHV/PF5p78bPJ5h8i4rUe7Sidj/vmhJz7fNzjU3l0VuIqQxA2crD+4YRMMY/RpWca1/x
	erhw7CaWS9hfHiriTDkWXxUXuajyGx3ID03/yD0D9EWKpMqR8lxgNK9oPmUQjA5krlL5+Vo+tfJ
	EC5+JS+ZLt8BtBMH7bPsClDCeuzdNOpHqgQeXoOpyt8BP/Rs1BZqhLi8Es0PB9Ez1uOtoCTSU26
	7asxRVpkX3ULForJPc3jK75/X424NQs0nISBohjAm+YBMq7/u//yMRKrHD870/UdiPCw==
X-Received: by 2002:a05:7022:ff42:b0:136:4bbe:9523 with SMTP id a92af1059eb24-137fdef3661mr707766c88.8.1780532358571;
        Wed, 03 Jun 2026 17:19:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm3064540c88.14.2026.06.03.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:19:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: venus: add callback parameter names
Date: Thu,  4 Jun 2026 00:18:59 +0000
Message-Id: <20260604001859.33353-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111085-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AEF263C07F

Naming the callback parameters improves readability and resolves
checkpatch warnings about unnamed function pointer arguments.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 47b99d5b5af7..5c2025c5acc7 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -690,7 +690,7 @@ struct hfi_done_handler {
 	u32 pkt;
 	u32 pkt_sz;
 	u32 pkt_sz2;
-	void (*done)(struct venus_core *, struct venus_inst *, void *);
+	void (*done)(struct venus_core *core, struct venus_inst *inst, void *packet);
 	bool is_sys_pkt;
 };
 
-- 
2.34.1


