Return-Path: <linux-arm-msm+bounces-113682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z0UBNcwQM2o+9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 23:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDB69C869
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 23:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ld/bNQh6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113682-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113682-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5537F301726C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 21:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CCD44BC92;
	Wed, 17 Jun 2026 21:25:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B01388E45
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731529; cv=none; b=KJYTRGQPhgCP8gNhAVSOFYbxFgujyd/AEPgfh+KdVakVmZa7cWku/J9vxYW+bhDFhgkpSVWApKZkYE7czZFW2fBgxBPgzifdUNDs8/5vtmGnxpLi0S5BJhHggnx+VsxwJzqJZx2qglQYVe+Bl+9R0q23N0z8NOM9w2AqaWVOyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731529; c=relaxed/simple;
	bh=WSPJiZMPFSyI1hcSe1U5oIp1id5G8DlgDxgiKvPvims=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aV7BzRTJKbDYkeQ8gtO3/b944DVA7XeUVjSVayb7oSpGhuNhgDSUcfVSHaPyLIaC46PbOWvjr2OQEqEKY7mP6YIjd/CctbcYxiQ7/kMqDR7UovHRjCRX5GfsyD0jrd4slg/r05gTSSJaN8CQ3SKqipVtBypHf1sRmcTC45xDgnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ld/bNQh6; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4923139e940so1056885e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781731526; x=1782336326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HAtfWviJA5Ta3x4TaRbQCu1oUr0pP0uRG2VDuoJPUNs=;
        b=Ld/bNQh61KbXoJIa0CmruBReinbOR4yWNPvbQ6dBDvLZyCzMnSuRG0JJGTFLyKJ9cJ
         fwvp2AVIb4k7x8VR2CFHGzdcJ8QfBF0hO4tZh4clAfRh6Tki6JzedRa1pRGJ1vqC2R4N
         gmuzgWbTyhwdftZwJc27fZYoC0mkSgao2SwrslNO96qZotrIfAmd+52XxeKcQi8PbB0R
         J5LrpyF8YWpLf9BuIWhjtQtDRdumJGqpfZfFPeB8U6TPJF1iJAyRC3hh1s0Iv3ZuEFja
         PiET++gGES3GS4qmEmU3hcaVUewiljDJuJ8y0s8Yu3UrxEqbwYAioH0+KQb4zWXHOrdy
         oIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781731526; x=1782336326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAtfWviJA5Ta3x4TaRbQCu1oUr0pP0uRG2VDuoJPUNs=;
        b=WcxxJHd7dspRoz81jM3A5Gw4fYfinKS4heYJziC+YKnNWZD4kAjBUgc9pV32Cgh/eO
         Fa7nOslicpr48or51kh9lS+ENhuRoQ04yzC76Y5A/4AfGCcQHWIaeQQXDLLHfqiAgxzS
         DB9aT5fVRyJSZWnyIOhkH+ciTb8swb+OSjeiX4yFi7vwAEMWPi8UVimx2fXMdyiDOrwS
         VCn+ZloxaDu77brpeXvHNH2GGN0jaOIRFbbByTySV4B1dqKwrFZeVLjsaUZs5pCST+yX
         us576Ov6c/wbb3ALu7jwXUT6XiUa76C2pY07EL7bdhgjq7YBZjnbVvxlkzF7Bx6LtWyS
         VFZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GoWCJJTw+RnikrfXOHN4rzG4YA0+3vyeoG0Wl1CS6nWY8EXfPSuYlaTY8cqcIsNDeIuaExUfJAQdP9p0r@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBlpTPDs40JJxBfTNps4W1cF6H41oY6nT6THRPTN3sNrDrQ9v
	TsGXLTVG6s/jfDewCZQckfQjo7bPegyODfhMLouWKcjNd/ELvTTEaaAAC932kA2Z8eraTg==
X-Gm-Gg: Acq92OFjd490OesmKOAASnoXdsbf6bi8hUweWmg6wF7MVfPyjWlljpL43Nm7c6O9LQk
	pbEvfMgP7RwFpZAeLmdJ1rccpQBgWB7LMpj96Nn1VGA22xKNNluFpMRFxZDPuFBBb3JDRjndHiU
	Iwpgqa9EbfRU2efdwulohv8gbB8vvWqBQeR6ap3d/Y0wHmnS2H8KHhiNAdnRm+xjvs8/IGiJm0Z
	1dlnhKjo1OS9d6IZkH2wKVI4Fn7umJRiHkgWEpDwSLY3xWfyuHGltnbk7S5/ufPv/YcuJZps4Fo
	9ALEH0pWXADiN59MC8YWBlZfR2SoEm64QYz0gSqIZ4ZB761nGKk1rMQ0rI+Zqt5U4U27EXgSPtz
	3oc7u7wFSxq4SyhkMTv/cdXUhKVRzM/Vn5HFkMNGBRcyo6Nqsb5a7pCfoQHpvWX2s1WlPMdxuZw
	JZR1n2fzKLOEZ3AiwWiDPHl94v4dI2oLwapuorTURxTTLmnphkV46FGPvETw3RAV8=
X-Received: by 2002:a05:600c:21c1:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-49234103867mr52477455e9.9.1781731525964;
        Wed, 17 Jun 2026 14:25:25 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e6a8fsm58396109f8f.37.2026.06.17.14.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:25:25 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jeff.hugo@oss.qualcomm.com
Cc: carl.vanderlip@oss.qualcomm.com,
	ogabbay@kernel.org,
	dan.carpenter@linaro.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] accel/qaic: use sizeof(*trans_hdr) for transaction length check
Date: Thu, 18 Jun 2026 02:25:20 +0500
Message-ID: <20260617212520.59801-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113682-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:meatuni001@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[meatuni001@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BCDB69C869

In encode_message() the per-transaction lower-bound check compares
trans_hdr->len against sizeof(trans_hdr), i.e. the size of the pointer,
instead of sizeof(*trans_hdr), the size of struct qaic_manage_trans_hdr.

Every other length check in this file (encode_message() at the loop
guard, decode_message(), etc.) correctly uses sizeof(*trans_hdr), so
this is an inconsistency. On 64-bit builds the pointer and the struct
are both 8 bytes, so the check is correct by coincidence and there is
no behavioural change. On 32-bit builds the pointer is 4 bytes, which
weakens the minimum-length check below the 8-byte header size.

Use sizeof(*trans_hdr) so the check validates against the actual
transaction header size on all builds.

Fixes: ea33cb6fc278 ("accel/qaic: tighten bounds checking in encode_message()")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 43f84d4389602..4d4e789d5fcb8 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -786,7 +786,7 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 			break;
 		}
 		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
-		if (trans_hdr->len < sizeof(trans_hdr) ||
+		if (trans_hdr->len < sizeof(*trans_hdr) ||
 		    size_add(user_len, trans_hdr->len) > user_msg->len) {
 			ret = -EINVAL;
 			break;
-- 
2.54.0


