Return-Path: <linux-arm-msm+bounces-91344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GvxGIGnfWk0TAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:56:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25337C104A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C63123013890
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 06:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379C432939A;
	Sat, 31 Jan 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLHnadnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4A78C9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842553; cv=none; b=gLKQwoPHqrTnMO6KEHK05JB3+WWRJdQwMYp+V7PYKaOfaico7a/t3kp2Qk5+E9Qsb5l7R+Cc+tdtpDnfrwtmYQFuSYDnX8ZBlNDo+xuk+EpGcEOzaYiMve1eKcdh+/gmaXIZLK9X35QgOACCqkmE4UQFQMeUw5I9sERju+LM1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842553; c=relaxed/simple;
	bh=5BmH12YbHKMwJRnWZOYAXW3Pk9yR76BehzdsGZW/grE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SththUWMpvPK7+n5A14pQ7gXwgogFZujPqsA7iM9V+ITMA04AOAh3ydfcu6ij1BuNwZUprEMsRjjE2F332SUJbUtv2eKQ8T8W43qM520ktXgAAhDauP1eE7SqA1/2peMnXu21XONWDABAtuWJB5GBVjaFuGxwf1tJ+wY9QVFqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLHnadnT; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a12ebe4b74so31309755ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769842550; x=1770447350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDLJXl3kO9WYLHYaAYOE8EZpw5zllMbrwjKTsjUtSuU=;
        b=QLHnadnTnLxIX7gRLWW4pI+261VDu9j+czXO4MmuQiXFnXFLuLlZBqnzgkOy2TNJRJ
         jr+nSXC5oWd00y5jCdabX9RF/4bQXpoSe40wf1FcIUEQ8GvP/wVvMklJVpGRKlfAPPzM
         IN39zS1vSeUqTc1O2vJmYrM8bhpPZnNWZfIKxZLsmrMtvYL93kJEt41Xh7dHTNJbmU7S
         MGCeSk19nKkEatiIibmBQhiZHDoG3DAw6tN2DY1FCtnLMOWbxYxoUAW8Gaf4sTU0nZOe
         tkYN0Ca+jVLHQ5QbvHVxROAz+HbTEn0NHAJ6JM4cKf6QdiwaClJ2PiUaXiT751c8JI1W
         9Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769842550; x=1770447350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDLJXl3kO9WYLHYaAYOE8EZpw5zllMbrwjKTsjUtSuU=;
        b=weG+FWtd443Z/xfD4b/mNt+5IBu/+Vh5iUTZ/ijUKIwtMzxPm2fbs4I1qSRQ9VryA3
         +Y3CeHX398ViHioezZ8zRhJNhibwRL5vXeGF28ZO8AKVeuZS90kRYFRF57A2ihcQhGrC
         87mBV01p9MDsb4gB/39XwU1psQmowMvT4/6bEMVqWzWHEC1xcrXWw862hQIf3PUiBbG3
         7TK6vvP+l1hOJ6FrapYrA5JuldeCjOAXPIikWXcPw9PytHR0B01YGImPy2oIlFKvymY4
         GXwes1VGKxGyWAGjDK4fQmEukKdfwdQkWVRgNqNqCHTa1vNIT7ioLZTcWGsW5Y/cA9nd
         y5qg==
X-Forwarded-Encrypted: i=1; AJvYcCVEXojymrAciN/QL4vdZjraeFbVF/FYi00YaN1tsmsy0+5OH9nVt37HcPu3xsFARiw6LTKNKNqMnKdebJXM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxok2AnBW9HZ4f5MWZBtR3H24/wx3ylWe3Rf/LQPGfNMFQRv/7Z
	biaQARsanntGGoX/cPM6SzUN/AMyE/ZdKFT9gvsu2+Irz9uV1hD6fesY
X-Gm-Gg: AZuq6aLSdp3dNHdgFqSaoWGakDGNPVuNSS9l4ukwxHpENjnKHa4qba/kjXzAksbUdGa
	jtDZBvDE1KFPYBjnik5jL7gCEpGi4EVKUibpxzypEa56uv8Z/SdgSLGSpE0wQT16H6ncRH5z4sL
	VMrQOJv+LfokLzZO+RWb7EkETQs4eLtGUXQAvOGKZ78CDkBELhGPkRgX0Uw37pkAtaU2bpHh/Jw
	PgzLFDRW7dxojNEMnL9C7ZSyeRxscRJQaSJGT/I9XnFC8ZdNSelS1zkqspqyN911+xFjhh3+6uR
	TXXHPFgLSk33eLhqa0eHKQWQsVHXaCTWiM2hzZ4q5PfAjaV58BsuEh5Q/z7w3uXoul0kPNUISOL
	bVxIqaCyvDzbMwDRldanncSQI5/N6h8242b15SaJkdGYD80lSf4tI1aRCowUbpV84ThfvrZjEqZ
	18lz/PxXaCs+pD9/efbcqlKWATt7g289T2eg==
X-Received: by 2002:a17:902:ea11:b0:2a8:3707:d79f with SMTP id d9443c01a7336-2a8d96e3bfamr54830685ad.26.1769842550031;
        Fri, 30 Jan 2026 22:55:50 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d9a7bsm92571725ad.79.2026.01.30.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:55:49 -0800 (PST)
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
Subject: [PATCH v8] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Sat, 31 Jan 2026 14:55:39 +0800
Message-Id: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91344-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25337C104A
X-Rspamd-Action: no action

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

This issue was found by an in-house analysis workflow that extracts AST-based
information and runs static checks, with LLM assistance for triage, and was
confirmed by manual code review.
No hardware testing was performed.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v8:
- Remove the redundant brace.
- Link to v7: https://lore.kernel.org/linux-arm-msm/20260129233703.407404-1-xjdeng@buaa.edu.cn/

v7:
- Add the detail description of how the tool detect.
- Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/

v6:
- Add description of the detection tool.
- Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u

v5:
- Squash the functional change and indentation fix into a single patch.
- Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
---
 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..a669e4b2bb35 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2337,8 +2337,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err)
+				goto err_free_data;
 		}
 
 	}
-- 
2.25.1


