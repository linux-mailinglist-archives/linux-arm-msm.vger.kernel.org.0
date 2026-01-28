Return-Path: <linux-arm-msm+bounces-90892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAsNGPWDeWnGxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:35:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD449CBC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 409053023079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F62330AACA;
	Wed, 28 Jan 2026 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOaFXmDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF57261B8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571306; cv=none; b=DITYvLa/keWFXX7HVwQy7/8SEV/6AIQPM/sZJ9PhnPpfdxViDjEK05cuOjvIgJm/Gi0jPlx3RCgD6Cb+bYztuhuZCCQb/lrhmaxTm3rHSoht3WyE+wyFJ4cCI+ftU/fJC5Zo+MH+v3XUDUgwi4Tde2cI9/+Uyvg/AA5UazoWmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571306; c=relaxed/simple;
	bh=Ou+KR5KL+jX67jdhCMT9s0zKv0nF8rlEUrDRejVIUAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MO+mTb/rBc2KsxE8aM+zbN5McsOjM6S/5O+42PTb2XkF/plTewSMKJKsikQ2C26gjFQu+kFrKR+SwfS42YdPGCzFRnhFBKsKt9uJaSveExADwUmLVoTFycst9V9tZWSWTGWbMunNhDRHrm8sShhCHf0tgEvHB5LEwokrDDfEDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOaFXmDX; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-823075fed75so238836b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769571303; x=1770176103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHsef8Eavky6gF12HHQo8VAwR8PkAm6f6g30n7mS7sU=;
        b=dOaFXmDXe0fHy7SYQUHn9NfCqqeNWUUsuzrqVRUujzDoDee/w6KK/y1Dqb1hpv2iIW
         FLa3ESylHgRvC9Jk0OiaaB3ri3fZwd87DUl/I2Tdhv+yR+Hn0wMGe4X4Z6AfpoeuUslI
         hzP8mflefeY2pnFeAUIrV1WvU+jte8mZDHhA9B8xH3ah0amd1pJJbgIXgpHx0dMuynEe
         T81MqaLvwz2Zx3FUiItZBjqlsjuUt75k3gyLimNz73n2YLDgLj0TgwewG26jKrwp9qYR
         8V2TTGcg50xT2Kr1n/kqpLHBQDrozSzQCYSMa1FsZd08pSJ/89JwEnc6Qwh7zxZNUwWd
         DD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769571303; x=1770176103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHsef8Eavky6gF12HHQo8VAwR8PkAm6f6g30n7mS7sU=;
        b=iQ1VOmJjdlwpnxLOUiYXLeFsz6kXVjbmr/8ebgO8pG7S8G+vzgAMvmv0oG81sQgwTv
         FtOCn0PnEsamx1xAdp5YYBhLZv9mMSBw90x7cKKkrLzfVMtJbEF9A+mNzVayMpjeLkrg
         ni/fpSBOeyxDEKwnyRVfnif0yvLTtUFggoK9aC6g9q0PLJNLaDS/Ii9S5AJqmT0m+UN1
         YlKHJf8KnA+Rrcl3siveWRj3wvxNeavs4iDck0NmRMUHTsHUORyD5ezOrOv4C3hAmc8G
         SVfgaLYMPgpUOT47P3S+mf5O1MfegdoCOT2nhV6GKaZ0XnhiXXINMhvkgccOoD5l5wXO
         4E1g==
X-Forwarded-Encrypted: i=1; AJvYcCWlUYOJP7FHF8T57TldeHxVbVP/leL7QUH3zGgM4fF/592Mo6O9BygVyyny7+y2v3EITay4FYafrOK4PV0P@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDmxgYLjMfCbFsf4oVo4oSq8N+zFcjPZLraobDZnS1CGbYEAI
	xwIZVlQ/yh2bLCoyxBK36l4yRt55dfqBk5FfXugROLUojqB/NBIRdQP4
X-Gm-Gg: AZuq6aLj+WiOpBydjH+CQPqZi3+55Xsy1NoxDTC5/YtKdcNPGhxKJyGJc5yX8w126Lo
	oNohXXWPetUqnlrvvnznbvh8CE+wbfhUXo/22iL7dwD45YY0V7ljJnwKL65mkjP+fKC21E8pbAL
	LRAoZctBMAqhiWjG62gG84ZKrqvEGBqMWOTFM8meFNIV0vlFwuOVAiki0tHMky4luyFxaWb+JtH
	ppKKCr0DiU84Nkehnz8V7/V/XgqEOI8gQ/bxgykX+rhIgpECpxtJPK4LSAwnrYHqZwut34uwXAF
	W36zooAwcaFAojgnFfBFF3CKCtZ2TREcU14CHHoJYrKX2b0cTv6a5CQaDPr9askR4ZbqtnyVUzP
	1MojMS+KcDgRH9CDImiHs8Ftz4w8bWhKOr7dVkZe1+oRZDeIRAEuMDPOWzfWtvpTH5BcX/PPkIv
	mXQIYtyKmjfAeOtXVLO9Lp5kCf5fCa6l8=
X-Received: by 2002:a05:6a00:886:b0:81f:535f:b48a with SMTP id d2e1a72fcca58-8236a14b4a7mr3625497b3a.7.1769571302990;
        Tue, 27 Jan 2026 19:35:02 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c226afsm948671b3a.49.2026.01.27.19.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 19:35:02 -0800 (PST)
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
Subject: [PATCH v6] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Wed, 28 Jan 2026 11:34:54 +0800
Message-Id: <20260128033454.2614886-1-xjdeng@buaa.edu.cn>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90892-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[buaa.edu.cn:mid,buaa.edu.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECD449CBC7
X-Rspamd-Action: no action

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration.

This issue was detected by a private static analysis tool.
No actual hardware testing was performed as the issue is purely
code-level and verified via static analysis.

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
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
 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..8bac2216cb20 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1


