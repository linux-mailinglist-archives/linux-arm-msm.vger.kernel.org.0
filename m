Return-Path: <linux-arm-msm+bounces-62719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56373AEACBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 04:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30FC07B0C22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B83642AB0;
	Fri, 27 Jun 2025 02:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ArVd+/YJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4DB78F2E;
	Fri, 27 Jun 2025 02:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750990631; cv=none; b=KPPf8Fs2eu6XZbCwdjSDCPLG/AtJxhuDirkb0dtwqDrDbNXVnipeRQ/pqSFEUVKxOAp3irmJmlU1YkMHxXyjIK0LSDJdl9+V+1g8cXx5cua5NW2036hoojLbupzfvf1PnxbGMZLYqwKVIKIft7i+oYNQ6IRTRiSSWndbxwWcAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750990631; c=relaxed/simple;
	bh=y69knhQjyqFnndBIw78Hms1l+Xk7SVjkc6Yaj5+r4QU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mSb8z0IVDPhlN3QWOPelnKy8xsLQNnX7f3XVWbyxmIRNeYA41tfek/skB+smmw3OswRmMzfXuxzRk8FaLCCdBq4iOIfrqPN6f/YAHze8gb5f48g0GuWtMuPD5gXGD03Or5V0gIiAaHXXGvDziorhoYoTCiSsyMNSdwVfvidozes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ArVd+/YJ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tc
	/BQSujfSpTkh1XCLZ71AAIXQedB9w+B7U5bWFPNho=; b=ArVd+/YJjqOEl66hJG
	eLqr/NhAjPpoMnBVbPy7zUY/D2/tgh9Rqy0NZ/Ay5INPWCn0b5GFR/2819UYOXls
	M9xtp6ZYb0qWku2buk8ocLTfrdIx/Ap6IIgc+Pp4ckf5XmXPs+bMzJXPmwvX5LvU
	P7LsG8zERshCtfvqRcSLT6tdc=
Received: from 163.com (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCH50IR_11oSw1RAQ--.45226S2;
	Fri, 27 Jun 2025 10:16:51 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATCH] drm/msm: Add error handling for krealloc in metadata setup
Date: Fri, 27 Jun 2025 10:16:43 +0800
Message-Id: <20250627021643.58426-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCH50IR_11oSw1RAQ--.45226S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWxWrW7CFWftr18AF43ZFb_yoW8JFy8pF
	W7Gr1SqrWqvwnrWw47Aa1fCFy5G3W8Ww45CrZFvw17Zw18KF1UXFWqyw40yFy2vFy8J3Z2
	van2kFyfXr1qyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEWE_ZUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiNxB4vWhc+8Rt6wABsu

From: Yuan Chen <chenyuan@kylinos.cn>

Function msm_ioctl_gem_info_set_metadata() now checks for krealloc
failure and returns -ENOMEM, avoiding potential NULL pointer dereference.
Explicitly avoids __GFP_NOFAIL due to deadlock risks and allocation constraints.

Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
---
 drivers/gpu/drm/msm/msm_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f67..993502a86d0a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -551,6 +551,7 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 					   u32 metadata_size)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *new_metadata;
 	void *buf;
 	int ret;
 
@@ -568,8 +569,14 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 	if (ret)
 		goto out;
 
-	msm_obj->metadata =
+	new_metadata =
 		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
+	if (!new_metadata) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	msm_obj->metadata = new_metadata;
 	msm_obj->metadata_size = metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
 
-- 
2.25.1


