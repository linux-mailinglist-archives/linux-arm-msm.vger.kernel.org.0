Return-Path: <linux-arm-msm+bounces-88670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25552D16E8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80000300F6BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D6C368295;
	Tue, 13 Jan 2026 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1V/+C4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4A369225
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287257; cv=none; b=beIYXrfRRKzzByr+B3Fb5I5F9nFD8/k+yj4Q2imaUz7jB+fg7nhb2LrUM23Vl1fIhherI6lT8myGmw3/ShGJXa+1ZR8ahakPlJ8ksz/tEN86nPNBIAAau6NKx/fGjAOkH0HCO0hNezeQI8EjXz7KU1K1Xv75UsScF0uaOSxgv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287257; c=relaxed/simple;
	bh=nHYszDD+ywPWPZrhip3EHFiPWxNpC5GNQJadfn2y+hA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LIT0AkKtsGVcb0IwXYoCCKLqdT5EFKLgEpsRj6gDtuBlg2y6PWJn0GL8ONBjN2Qf/U5t+ldNGpSyweFNtkTyRGFyi5BboavNpDru9QNalsoIkGpEPULD9O8oVdYg3QQipzgMo4f0FoxZlY2iRbXL42SRt1yK8okcwtwLth9zsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1V/+C4c; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29f1bc40b35so79524085ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287255; x=1768892055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRJ6lsAItfikKn1MBzTEmRqrNF0cYsS87q/1cN7JBMU=;
        b=H1V/+C4cRvtLfV8Vjoin0JR1WZi0JHxMPZClE++FCqs5wR5qJfsBPrb2RDaNNhYDRA
         o9EXcqWgV5+3+CZBmKy+Ri5VxaB0/m/Hy6mGhMZ0tayXRZQDCsxJWLTZ2yp7UjQzx8AK
         afyyzJWMJA9Z667PtsndXFLI3EQSK/mUCBqq/gnrItBm7XnYiDDSp137MWnfwDeTIBC2
         C1S+h/HfH0onBhW6rR3cFYf4Cc7nBw3K/1tdvlvB2yay5GmR2tBe90Sl34lpYYb/cGW0
         4Sq+7PWOYpt7YBvhD5lod/2X/uXmtMpbrMFygf6N29RvLE9kkR8kBFh0/lRz5lpGEUAw
         2nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287255; x=1768892055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRJ6lsAItfikKn1MBzTEmRqrNF0cYsS87q/1cN7JBMU=;
        b=Ri0+5ODxLa48U3zN8dnQ8YDgryDixoLP0IoBZB4F15WQ37RjlaCDIgTdIZwalflE3W
         a0bisXjq0hib5C/9Cj+nAWODDSALhNOyqd0rqX2pv5DwQVd2L+HVgZJthaSBb17n260I
         Bf4nNv7cbFkUhBL/SMgU+NRM0fY0XzlgMehsOGoe6tWQYPtIEDIVpc+Egs9H3P/A+W3u
         gNFbsnYpalpaCyq0xxyn4bymxhoLvHwom0vYyT+gj1QPQw+xJljDwWvDxeaRa4qhKfx7
         OauTps+wU3sw/y8SAK/8woC++zkN7pT9NRlVIg580sP/v9t6IUF1OjeflUqwCj1yKYaR
         gYkA==
X-Forwarded-Encrypted: i=1; AJvYcCVr/VEP8xi4PJs8KAjVUwKNDfyFZSW/JT+XVDdoD7vf53G9IyUXRFPZQaQd92cAks9FRLw4ywAluMmNLztA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZYTBN+YXl3bI/qqMDcDbpl/AwPPcRCX2y7X4+O0hcRLklvKA
	ULv/63LFjaodcreeBzrJu2vA0L/ukAJ+xO3vshjDFP1XN4birY1tXPgZ
X-Gm-Gg: AY/fxX4W335UqfVA905BBCLOcnri57YB/Oh0vqPCgiSx3a9vyUGidjBd4XDDQNLxHya
	eUbSbf2A9yOx2PN5dfAYOp3ZEAnbjZoGGkc/Fgz69ui41YxE8eFuLsTotn2S8DympbsCD2HULcg
	Gt8m4Nivq7h2W3CNjdZKXonY9TxtYIT/rBrlOCYCx5TO3g62SXifNIgZuGAZvFk66ISzKNpLMBC
	3pCCOl6FHo/4i6DSczbKzmPvND6M5elG1AHKDxI+y2+fox6w4x7f3skO6osVZkStCnQLeAidp9T
	VLm5LT4wjwBSu7AFqww171Yt42xJ52E43vSFHsvn7JR05oi3osMQ3PLokTVfuqXbrQsOVQsPkt/
	HdcBYkBOdJVq8AJb4+W2sjQj/m8VsDCImSqr6Y0n8rf2rejH0oQIDkwoq5Lu7SYwK09As2MaWbc
	qa6ec7KUQfcDaY4plMsU2O4dE=
X-Google-Smtp-Source: AGHT+IEl8mWcf14R+R1N1r18r3ZYNbSVCi3ZGQ2zfLCdVzn4cVwqUz9XkTjq8OOXiVwcvCsPgML89A==
X-Received: by 2002:a17:903:1acc:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a3ee49b5camr221652125ad.48.1768287255527;
        Mon, 12 Jan 2026 22:54:15 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a311sm195102635ad.19.2026.01.12.22.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:54:15 -0800 (PST)
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
Subject: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Tue, 13 Jan 2026 14:54:09 +0800
Message-Id: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not
checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

---

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.

v2:
- Add Fixes: and Cc: stable tags.

Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..cbb12db110b3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+					res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1


