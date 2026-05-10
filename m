Return-Path: <linux-arm-msm+bounces-106828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fs2hMtTeAGptNwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 21:39:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921250604E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 21:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 108283005EB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 19:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9629A9E9;
	Sun, 10 May 2026 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scNHJwCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6E2494F0
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778441937; cv=none; b=MxlnZlTJaEiG5ZxZXpemIqlymMa6DNb24OeNbsMJmUMqZVQilYlZknPPBOaZjlGI1o541SDDBb4YG7vpDl5iSLKs96rQkTY1N+ic4Xe9n/r7d89MGHUyLjjupXmzp2GWQcDN0qywbCYgM7sxfZ+nZV5tIrMp6qzK292wnDLdr7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778441937; c=relaxed/simple;
	bh=fMn5BL/kDpncEFDdsHt780ZqcUMza9pM1FyS6/L2/Zg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XrM2wkSZYRrU6T89iG95eN9V+x/RWiIXmq35TJstrY2WkhqEGOyal2yYtWtvw1x1Gzzvar9d9XOh85UOD3zNJPT1pLYVp1T9mB58iQsBG7Wot8nuOUc6bNrLGx1yOdID85xpNdgPRazsx4krpizjDxyqto/eKyQ4NkdubGz/9UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scNHJwCE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80170db7d6so1245018a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778441936; x=1779046736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MiCyFvIL9olbFSlvr9anwsrzwbbo5yoa8Dy2mX/Tsc=;
        b=scNHJwCET4WGd6SZ9Tfw7mFfO5jc6OWkdz5wjyqeui4uKIPAS2KQdrDWPbKNsd5Lpb
         d6D0xsLxNqG1yrI8Gw86SUlhcGxsRg84n9KPQe/Up2N7I2gE7R1xW0q4x9LtU+RXdcbb
         AOLRCuU5l4yO5T3TO0kJD9K5DNdOTC8v/Gy5a8E3fIpQ/1nE0c4qjRHyZusS15xL/zXO
         Zy2+LnD6abYz8UdUAzXKWqpaVCDY5Lf6PBGgyHJzp+pe6hMfM6t4jnEWNwRFqVT+FtKP
         E5CzIIjE0t1Kde61exo7wMV8emBbZ7w6PbJSW7pgpFq5s1wLW7a4CV2E2lIKJfcvzRT0
         H+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778441936; x=1779046736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MiCyFvIL9olbFSlvr9anwsrzwbbo5yoa8Dy2mX/Tsc=;
        b=d68ldS9z1JTX0KwoN4weZC1MAsQwX6sF5tHEYj9AsIh+tsxAvnRk5rN4iKD4bptWu6
         6z5yJHUIOMywko+2bkqr7dsJKeNGkXPllh+9Ly+q0aEgdbBWZzk6ykhCnHn2oavMO/JV
         BtM7D3E5J7gyx5y2nhNJpBuBtS37EFwrndGzdcKHH4XniGW7l4pwS8QlIY/caLTbnirc
         0gg84YOagCN66ou+SVsy9z1+iUGqUER8D3kJ752kN9sg89TY4mpFSUPI2PC+5vDWvYRy
         NVRUyKcKNakcNarjjb1h6RZm8W6Ko25GJSZ9zzWaQ6yK+pwMeop4M+b9nEyCLITpnh0h
         t30w==
X-Gm-Message-State: AOJu0YzaVaXe4ygZWT7zJLGC0cPyOaCM5o4QRCHgTT+fmM2z2M0EVF2o
	BqW244Z8XcZQ2cC3co5SNOeZd4Nh+5KqdhGNbB3e7EEc1M3tdtUARh9N
X-Gm-Gg: Acq92OGHxwy9jM/WdEzROfWIv5fa3YqRW/+HAANbPOu5KnNwaU0qp0y2nXjhuggV0eQ
	FSDpkJmMkDnhUvzxPvnqClewHH/nqXgaZkhPBVLMoBS+Od3dEp71+NqfSOAgAetRFi0ju4ZUoUQ
	LkxE6recglJrDr0cs9vVlbal8zO3ynV8OEt4Fjy4JPkMIue/dyVcvU2JHpwRGr51kr6K+vbAG4i
	QSbX+OkHAOEv8cDILRX0XjLqM/t+hnhDPdcDo0KBpifhXpTNIHWSzDV8f0f3umt3x74MSHXio1g
	TMVDEb0/DPJJz5DnMTn59j6UEn0f3qYjQxmDA6FnkrBVI0D7Q3+dv4/O9MKBpFTVrECbKmhsRmD
	EF1wUWaQ4JML0javwXaEuVxDrA7YYt6cbinIQGedRsnQXoTwtQp4P1+fDheytidQaodI28fjXVT
	0Bt0l+8AEfbxlpKtWtUWjDSBtnspwi2blLP1CF
X-Received: by 2002:a05:6a20:6a2c:b0:39f:24a5:3065 with SMTP id adf61e73a8af0-3aa5a72c4abmr22908504637.7.1778441935561;
        Sun, 10 May 2026 12:38:55 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm9031143a12.9.2026.05.10.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:38:55 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH] soc: qcom: cmd-db: use C-style SPDX comment for source file
Date: Mon, 11 May 2026 01:08:40 +0530
Message-Id: <20260510193840.59156-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3921250604E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-106828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kmayur809@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Action: no action

checkpatch.pl reports an improper SPDX comment style for this file:

WARNING: Improper SPDX comment style for 'drivers/soc/qcom/cmd-db.c',
please use '//' instead

Per Documentation/process/license-rules.rst, C source files must use the
'// SPDX-License-Identifier: ...' form instead of the '/* ... */' form.
Fix it.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 84a75d8c4b7..3f1eee78438 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2016-2018, 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
-- 
2.34.1


