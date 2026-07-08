Return-Path: <linux-arm-msm+bounces-117462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RrmiM+rBTWqJ9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:20:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40C7215A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:20:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ThF/qAC0";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49FE1300E27C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 03:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C579F32FA2B;
	Wed,  8 Jul 2026 03:20:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D21364935
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 03:20:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480807; cv=none; b=ROs7Udv0S64H6yZ+P9aqzZ4h8vKqUoFwWIAGkJG4HbuAsGP3fzahcXEVjr2LUXf6Nt4QJUPc2GzLkkEuY6df2YCY3DrhSvQ0rXUU0Xthy5PjQWahbh56KpAukARz1wU/FJ0wRt+fHuuOLi0GxMhw1frfATvMucBPtZbaq36eDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480807; c=relaxed/simple;
	bh=SMysq5SKCcRzHJEh5Evu6BjE73lj9wFcJicIVigH7Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0onowRaoo73ZzuDP7fqYiKIjsEBOmKl3dGKXnkaX8C3cVq7gvTDeS2vgl4q7OOwuiWn8s01sjtM+QM/OXzEARP1gel2IB4UzMt/zh+u4fnNvEpEI5941+CmyK23dsNp3KYrHkEh0wn1y8qfx0e9L+TliAeWSPBRQjl9bVAh6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThF/qAC0; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc84e77e78so2002885ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783480804; x=1784085604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V00ddkGI/KEE26qqT+p1sjeQx+QG7PWUpGKZprTz5GY=;
        b=ThF/qAC0c7Y9GOM7Ovx6iPBV8Zl5lH2Hy30Mm1tv2bfgXEfSY6CvZLE7vvHT6TB+YD
         nPaNv9ZssSPJMCE0MaAl5HV/84r1cP1NZ+F9WdZmlBKKwMU2ZK5T8i546pGvBuxdt1HF
         +In+GyN0AffhHXqXdI/c0tzVX/PdW0upjFTmkvdvz5PoCTpb7V0BQg7lqDw1ClSQUigO
         oB7JyeVVJaW74AZZBugkhLnYUW5wINqNhb6lT5wLNL5vCqBUBAMhW8UAafTqGyUk3pqy
         aE3wssf/2JWobAh8bnYeDnPaR5UOM5A/ghTkgReougMJhw5MzS+9Kd5x5fzqE6gvuw1B
         MuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480804; x=1784085604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V00ddkGI/KEE26qqT+p1sjeQx+QG7PWUpGKZprTz5GY=;
        b=s5mLJ8Lr0fo1SkSedqo/KJ/j8xVvK+D0mwsAUvqV9adyagpog60cpN8RlU2lzZ5DXo
         bcGsIyH3vcBlGPIZ58Op6CVa7TeEPuvlWnBr+w1iNGb19/TfjIbgMTPjQ+LCoOUYLiGe
         lV2zywfwF3lRRSfzBKtk3uynRohChtYq5HoM29UwnMYNE91kgjQ4k84Z8yf22+b2XFhs
         MkZgRsxfumqe8lKuYFhjuTjeohFU2hR2Qunto4gS5kSfWQkt2R4t8N0kcpoqHS4gmUaJ
         qYzcD+2GiuWoSpY3z3ANtiIo7PyZyfX9Ia7xZWbD9PDKKBKvMpPdxw0k/QCgGI861dLA
         geVw==
X-Gm-Message-State: AOJu0Yxy/C+1v3ThktqXGz+8iAPVGatXLZY0AYAlwOM7mz6F4AkUHk3f
	mi9LGLk55BK7sDOkE8X1Cu8UYq1x0gFZ/dK5Dz8BwiRH5qyojlsN/W2a
X-Gm-Gg: AfdE7cmN1zHJF1zICtPCardRmUuSHr/xrHD9Ng1bgTDxCb3Wff+cHOkR87qQojFrHb6
	4hntjUCZZCWBmGqV8Uuu3XOJViBsksObc6yV3rn7FrxzNLzGnx2NgYjGq4zJW1RPi03P1NmRtXG
	MddTVbZWIiI0d9QUfbFdEdTKMDsOcM24Kb7vcpcmNKFF+aYoZ0ss0X9P+fMGMIJevn7y5QtYSUa
	1dTeIXqL/jb8Ih7JAQMukO0T3hQ6aeosCSl06EGefeHSW9CNZu7iHJnM7juhKJcGO7arfalLU/G
	+CaxaQLVSd/3d/DFyjpLGDj54U4ZlKVrbAmMGRGVgEO3FO7KuZDoMJ2nEAvlR1JX+OY8pDZffPK
	SaPIpF1VdRerb0BivwuR9PEG6j0JYWNFX7VzGZj8BLiwc4ewUkP285ynpdv/RGHdm899/9OoFIQ
	WuywBbF+gR70cy15tcDTzu8Qc9fWLZQvE6gcsX9+OcpaR1
X-Received: by 2002:a17:903:2447:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2ccea3c0f1bmr7181735ad.17.1783480803608;
        Tue, 07 Jul 2026 20:20:03 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e914sm20421655ad.50.2026.07.07.20.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:20:03 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] accel/qaic: reject BO sizes that overflow page count
Date: Wed,  8 Jul 2026 11:19:59 +0800
Message-ID: <20260708031959.966009-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117462-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alvinhuang0603@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alvinhuang0603@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvinhuang0603@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F40C7215A9

create_sgt() receives the BO size as a u64 but stores the number of
pages in an int. qaic_create_bo_ioctl() page-aligns the user-supplied
size without an upper bound, so DIV_ROUND_UP(size, PAGE_SIZE) can exceed
INT_MAX and truncate when assigned to nr_pages.

When the page count wraps to a small positive value (for example a BO
larger than 16 TiB on a 4 KiB page kernel), create_sgt() succeeds after
allocating only a handful of pages while the GEM object still records
the full size, so the request never fails with -ENOMEM. The temporary
pages array and the allocation loop both use the truncated count, so the
backing SG table ends up smaller than obj->size. Later slice operations
validate against obj->size and then clone ranges from this short sgt.

Compute the page count as a u64 and reject sizes that do not fit in
nr_pages before the narrowing conversion.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
 drivers/accel/qaic/qaic_data.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index ef0351b6dc9b..4d55531bf1c9 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -15,6 +15,7 @@
 #include <linux/math64.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
@@ -455,7 +456,12 @@ static int create_sgt(struct qaic_device *qdev, struct sg_table **sgt_out, u64 s
 	int order;

 	if (size) {
-		nr_pages = DIV_ROUND_UP(size, PAGE_SIZE);
+		u64 nr_pages_u64 = DIV_ROUND_UP_ULL(size, PAGE_SIZE);
+
+		if (overflows_type(nr_pages_u64, int))
+			return -E2BIG;
+
+		nr_pages = nr_pages_u64;
 		/*
 		 * calculate how much extra we are going to allocate, to remove
 		 * later
--
2.43.0

