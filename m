Return-Path: <linux-arm-msm+bounces-90895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GESNJfmPeWl9xgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:26:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8E9CF64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D308301B92E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3980432ED40;
	Wed, 28 Jan 2026 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESlOEIx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8432BF47
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769574369; cv=none; b=g4JjXGP3zPDpvieOnAAJiEdO83stq+DYFm+rfPKyO0LByd//W+dzqHVAwS3Sy3Yfm6WfAqidxVvny/IorRQF2GlAdeSteYvsrngOiIA8cduts0IjEEXjXk5cAkGFxqozlaID9zBAQD5fE3d4UVc5H9+HVYDl8sZdPGywPd4FuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769574369; c=relaxed/simple;
	bh=+nhvf9VJGB3rMOQrfwfaHbp/0AStjgC3+BDQirmfu3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QMTeDmg9bpor4ghh68dHMsP8YCvfRQJ7/eI1ULtueYVcn/NnahWQ1nUxB6qIjEdAHLT8U3j+bU6PeJmTjs28ltLrr24m/Aw1UuIrKWRQNnAFGLTYfp6Uwc1ttrKGroh2hnF/R90+1VKgrA9FKTCCQeMgALhbxNCJdnDMyYhss7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESlOEIx+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a76f90872cso33440045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769574367; x=1770179167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qewCajV2v8f+DolPwnEJpeH0aZGojL2p90D4oi4jTS0=;
        b=ESlOEIx+DmUZFOUJyAXQ2K2D/RL6NZQ0n0iPodvsMKAoQYCYxuia5t7a6OBhfDhgNM
         GwYIt52H0Aj13V59DsHBH8k/AbPEqt28oqJfRw3mQyw+r5/hKqWdwkQ1R2viHyKF9naP
         qkRO2GrgBdGpHJyo7n8c7jRA0CT7e04mBo1pZcRed+w88XhspnzSi8WhDiQz1YGY3WuL
         8XEv75hYTqrrB9l0M7SOldMOp9N/CaopGWrAvYpui04BbXdvBYQ3FG+hFYmbzvehcu3/
         0yy6VrAtm+rKp8zhKbE943HqyrM1PhurkQ7hFaDejsSLd/qUDv1zAJri6bSf8bGlhRRL
         +3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769574367; x=1770179167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qewCajV2v8f+DolPwnEJpeH0aZGojL2p90D4oi4jTS0=;
        b=e7KOGOv400Cr2vkIEmywLVQodaP7NP6tDqHOPVYNtNxKqMFO5U2TXxm61/eeKubz6W
         UBCHHXlrHvFMV7aYkUpnOlm4AccI0zriudCJ/eaEDvC49fpeC0FmdwT+Ipw+ZJuwb+5/
         +aFPUT1xSXrTuOtaaKDLDMB1GCo/dhEbybiy+EaTLr3zAkM7T7V/h8a1a59oBKPYL9Zs
         Q/TI1V0BoAb8/PxunUkbx4/Z0OAk+fcLRmgP595bEC24iXbiPzPZNhkMl1gr95NIzt7V
         54kWKOLKEQkR3+/ZiPIAYMldzd6wQJ4YF1QThaSqAKi7yf7Lbo22VrXMPbV7ectpywrw
         yBiw==
X-Forwarded-Encrypted: i=1; AJvYcCVMPco5QBZdORN3rnuy1k2ZJMTxaNiLXBc8XhqQwStKflY07Jp+4sXTuJZ53t5gqeOMlUxcx8QFr0Z/T3P7@vger.kernel.org
X-Gm-Message-State: AOJu0YyARz6Km44pw5xL3wNwxlmE+loK81ZCXXWwOonyOZ6t1v5N0rRV
	eXNgDl2BSCKNO4kmZmykKOh3Z4rGs44x70+d2rO9FydxXZtVdg1Ff9md
X-Gm-Gg: AZuq6aLm1N4zUYFtTppHFBABa+UY/PyD+O90hoWhPUh6sfl5XNZB7eOOFRPJJTCMoCj
	l2dajctxAdV/ya/It6ToNmCxVNuIr+f3oNNG/Pr/pjb5+ILWpKhTLZQX2lraln/iQk1DdxezkAo
	B6VcCDKkxMEBTyYkeHfzXstnaNJN3YSdzBGcUGpYaUtuWEqSLXQfm9r8hiHbieJepZ7lS5fNMlY
	2ks1pVjTir3C6vuV5HSvAReKnYXPlP7duxRr97r2yb+3GC8Zx5fMB/jXZMuSr6c9zqTSfVS/DKw
	xflURlx21bVsfL37x4G9IiZYWLHVFE7DdY5oj+A0hmeJzihhaA7EXZ+mB1UGnx4JXSapMaoxs5b
	TFWfb45P9g1Lq4ExSPf44ymAji5/JsfVc50AtPBz9tltLNY6ws1SAiIeTgxcfFWUQvc8tTc9Vrb
	VWpA6CmEO+j0WNhjb++go0dj8v0NAXijw=
X-Received: by 2002:a17:903:350d:b0:2a7:b8f9:5a5e with SMTP id d9443c01a7336-2a870e00597mr43973195ad.46.1769574366709;
        Tue, 27 Jan 2026 20:26:06 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414cc7sm8455115ad.33.2026.01.27.20.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 20:26:06 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v4] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Wed, 28 Jan 2026 12:26:00 +0800
Message-Id: <20260128042600.2641857-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90895-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECA8E9CF64
X-Rspamd-Action: no action

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.

Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

This issue was detected by a private static analysis tool.
No actual hardware testing was performed as the issue is purely
code-level and verified via static analysis.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v4:
- Add description of the detection tool.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260117140959.879035-1-xjdeng@buaa.edu.cn/T/#u

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t

 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..fb3b54e05928 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->remote_heap = NULL;
 err_name:
 	kfree(name);
 err:
-- 
2.25.1


