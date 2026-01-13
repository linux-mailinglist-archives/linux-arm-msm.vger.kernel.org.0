Return-Path: <linux-arm-msm+bounces-88655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEABD1656A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 03:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 196D6302B757
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7971D5CEA;
	Tue, 13 Jan 2026 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzJSVUGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A518BC3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271930; cv=none; b=Yz1k5Vy6IvOB6INt/3O9x/s1nx2T4dyJCnuRqxHLiPKpv8vRvkYXU+DcLMLeuBkYWPLajk0B+7kEfkAGxfYmMfDbvwQehHfXO44978KScuWk4ehPy2TjQbDoJB4uhAaWGd0U3Q8jgQPa7WnHqgDUl61+G4XmByxO0bhc2M0S8fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271930; c=relaxed/simple;
	bh=Dx0pr7PBlvHCrcUw3Vab+kZTW+IOFxvrhGBGPEy92ZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s6mzvJ/ZEZtbwUvHnsiaMhoHB5POm/TwzzPO1MMHXZ6E7Ch1x45yYvnv/p0cEaMIGZcF0PGyrwcuUSP/6Sw6vebK88ZPv30Dto347NBHuwaU8nnGBbCYwNJ/VTO0gGXyNwIHX+lU3Be8AF4zvDswHmRjprD6l6MJNfZ6kK9NPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzJSVUGv; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so4610140a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 18:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768271928; x=1768876728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyucI0YH7MG3WfHl/qzA6deXC4xj1ffZFIfXjqoMq40=;
        b=HzJSVUGvixbrj8Z6RYzmzjKX2uUE60mhnU08jrIGUwl/5jXGzGttHKFCJg1rh/2AtM
         EdL/BI/Povc7ybfGP88tRvi4F5sD91pv4rw9FhW8l38ZmyIrpYGff/vhOdptd+CmCSga
         knmgqu9fgVNC3NJk2rzb7FRrssBTYdO1aPLvtcLEQVsfoF53OF7RDfSpG0doBhU7iyb/
         TN8qHL+vuUqP71bEQgqpjkwIsxQZG75m/xJghBbwdB/FMWbEk94LP5OMWRmXimiWk3zh
         B55uju3CwgKZGO/kt86c+wDRGCLfzxXUrFFATm855Si/H1iyzdA+775dkTgwsM66xat6
         guXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271928; x=1768876728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyucI0YH7MG3WfHl/qzA6deXC4xj1ffZFIfXjqoMq40=;
        b=WZ4ueQ55Z4Om3aaXdqWNpBoG8JsdQE25eFqQTcYfyyWMFQoDVx7Vst2czgKrxFW/hH
         IL1rD7NmCHxm+VFFi0VWi8AJDYv7Kt7USf0vpW9G81trOhc6sgGBuHDmbOVFOYyiCLSh
         G8M+psVPRj0b5szpqyIdx3x7MBZlalR45BuciZ134+36ToGQjJIpIFAvUe4ozDpXE3o6
         ePhsm2wPzAGooyLcntoOWuCMlxFLwcoNzl9paZZeFBwDhJE3wHplnQuT18s3P2Epvu99
         u5xC9l6rwhx1kUVrdATwyc+kKtx2ekhWGMAWds34VUykJ9DW3dRv/MB1zGhFd1F1DqHi
         p38g==
X-Forwarded-Encrypted: i=1; AJvYcCWX0WNTYoxDJsihD8VKhxXqm+D/11L2fmytiT3RQugAEoHz095AN3yI/a5BpWKIvG+qwpx6frlxUwSaP5BP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9drBYo4fpZlEIyCan+hYwdvc48kKmMgYWxEZWhVbEEfrVJmsP
	AlatMfoEce7PcPjqVIjzl9cSCW/tGY9/4uU6ke1OT1f2xjghX1LoqiOY
X-Gm-Gg: AY/fxX5laHxUIPLEsTZuZO68nWfugODrvNRyvLbiyrHD9cz9KL/h6wFQJL4BJ26wfw5
	bfgvj/QwGcdFpM34WzOKdqZv+vapCxwkYLWjEJE5RCTPAmIsV5drqcSHR/QPKpqtRbGkINrFb5H
	jnVR2MJ7rrNlNIQQAGRmtx8icf/3vJ+YpOGRqmCzk57+mBD3sDDs0VzPNo2syo+e5GGSJ3uyNz+
	J/YlTrvh1PA3VrQq6fZ0OTCjbzcwfek+64eMqtfrP2f1H4p0hydFShgcIXuLZiUS36iC4DgJlOc
	xgdmZd2fiaSYYU/TBm3eKlG9JFjetZ3XhCZ6kklPrV5Pa/eWQAa+bxrf2G+KyUjrzG4E/AoT9Og
	cSs35gFQl6wIGZBl1X2T2t+G99mWtsBPW7RnrmEDSI/oRPR2Jt9AsuFSL4BLVWROBoegwzqSW43
	SjKF4MkplLjSU/Ihk0KA17RZs=
X-Google-Smtp-Source: AGHT+IHRJPGz8XR3WjiNhMWGuhhCzTmijR2cafO3T+hWG74VDUwGnsCFbiMo83oXcnyoYAY+ItE+Zg==
X-Received: by 2002:a05:6a20:6a21:b0:35e:824a:dc57 with SMTP id adf61e73a8af0-3898f9915b4mr19710567637.37.1768271927906;
        Mon, 12 Jan 2026 18:38:47 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c57a50da1a7sm7819559a12.36.2026.01.12.18.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:38:47 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Tue, 13 Jan 2026 10:38:39 +0800
Message-Id: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
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

v2 changes:
Add Fixes: and Cc: stable@vger.kernel.org.
---
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


