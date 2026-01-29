Return-Path: <linux-arm-msm+bounces-91218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BWbFD/we2keJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:41:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D3B5BFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4631230022E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F698376BEF;
	Thu, 29 Jan 2026 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS0yJ21G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B733F37A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769730108; cv=none; b=t8Jc7EITRcKvcw5y+UuqZhOcReDLUIgp3BER+gVBmA7RO1CQzCSu95OXDP9a6XA97mbpqpIReOz8p0E5a3Qz+Pyc/DcFoqERupjE9co4t2+DpXk+W8t34F1U5iKyuPmQEQHBnolM0+ATOBvPlJKHek7n1JERIF4JO7FgWewnpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769730108; c=relaxed/simple;
	bh=QH1FbRZ5O40aoaT0YcL+3+LXNJuDKiXP0TiGLPkfKQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lkk0s/TIj+eMbbvUKaZF5XLUVfTKDpUYQAPNtoJaQ08hL3Z/2JNyMD32h57w/eNcofpDJPigsHrDlvRXq5zqwExwz39fF/Fml+T8KukzCOo9mG5ZmlIoCs+Y0flhycioHAgq9e4oUlZoewjbxuUJZxl9kSKe3znFLubSkl0Cs4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MS0yJ21G; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso969741b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769730106; x=1770334906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98ySn8T1ILY+Jx5xtFPY1cgInaA1UDWQE/WcppunKN0=;
        b=MS0yJ21Gj1xy0K4toaQA8qYQx/FIpyUIe+Yu6JG3mk4cUtrbUxr6ODn3Fc6lKvM+1F
         e99euSMISlZsmIiBCuewRNn2jdZa6toHHJZN70fRHQCxVYjfuk7SiY0mgkNEchP6/B2i
         H1D5mKB/TKdvD7S077SrBHX5SV1+xhjSuAtE3ZpiR1t/OF5H7aRK4mD+ReAs5b9CwgDK
         D97TtcjrL90VskZEHqrGia5rE7bxm7Az65lSAO/ao/yj+ZlmH6qKEqGIrl2QeeVwCoSc
         1BjCTOvbPjvy5STVmUF56ij08BWv44oI/X3UsX/0dOD5U0XzolKnovL1lXkVL/EPcOOK
         pNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769730107; x=1770334907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98ySn8T1ILY+Jx5xtFPY1cgInaA1UDWQE/WcppunKN0=;
        b=spK51EMU/g5FfMn4PxbZ8cK/8FdmOujhURJvy51QuM3s19x38t39L+WO5TRGD1QwUl
         mYiP+0GdGc/jXT59Lvfx0WLM0Pfq71E1B/rsEXyTIlTg3+/DiLmUHUo4gmRmVPgQisL8
         6Rl1FepYb8x0TBb3xw705xNfb4wFcebyeoth9XZ73zYV7gYrDUwLZ50nShaA20QtylfM
         bNCd4q/Rytz0oC1EXWY86tR+YOZd1kYxKEYLf+mRwFdsQB0i0kYBIjgE2Iuq05/K1qWy
         ayhn7oWkW68QDpyZWvIpCiJpC42/KTRYfhjWHXbDSxxe69hnpMHOScoiMZgqMF/xwl8r
         H9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRM7DHPcSbr2Il93bs3aJ5MlWgjrCOtxDe+9sL7cdl0vmh0Y8dCYBaeJjwBuHVjnZfp/b/piAamT7C1AVG@vger.kernel.org
X-Gm-Message-State: AOJu0YyqpaSk2v7CKYXBSKw8hvfP8GiqvM73oslLJX+AlQbrxODcpgyo
	fyKbtWwp2GUueHY/ppldo8LQ/8I9zv8JqLC+nNMwFbfgUBf6c1cNSZMD
X-Gm-Gg: AZuq6aI0PiXMMSRcA0g0vvGBFM6RscZyxE6rQHAk6UYnvwBuFjcRQL67XnxnjiDhvvP
	KArZFNYnNFaq0D5Xr57OrbfXh8tTm3Hir9FbvQRBmytHhxzATJSRcP8yoVge5Oj7tWLcK8wKq3I
	HAwtnt5mEMk7/8cGD0k7i81w4uG8YoQFlpFub1wBg1WnWjc1xpibfUlhJxW7MLTFkf6jwdarYbG
	d4dUh5BfsoEb9q7MgWYf6Zc+1HYLOMU2C+Es+FlJmQH2FxMOI2cKWb4SvxeWtFRsKA6dFRxAVla
	hGeobTML9k2ikAkCVHI37U5+/2DhwtSCQ8c0sbvfP73cKOPcuM8sXmxwZeU7b+KhztXmm1cRkG0
	X+833tpRNpwNbWnP+Dp9mFreiR+Boq19s4EqXX1w71BJ51831MHfmxqYFTknwF/ZsXSXyRur3nG
	49JOxsnntVBhqAby65IhakkBfscPLgdLs=
X-Received: by 2002:a05:6a00:39a9:b0:81f:be3c:37e4 with SMTP id d2e1a72fcca58-823ab67bc4cmr780481b3a.27.1769730106458;
        Thu, 29 Jan 2026 15:41:46 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54d4dsm7397903b3a.67.2026.01.29.15.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 15:41:46 -0800 (PST)
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
Subject: [PATCH v5] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Fri, 30 Jan 2026 07:41:40 +0800
Message-Id: <20260129234140.410983-1-xjdeng@buaa.edu.cn>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91218-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buaa.edu.cn:mid,buaa.edu.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F06D3B5BFF
X-Rspamd-Action: no action

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

This issue was found by an in-house analysis workflow that extracts AST-based
information and runs static checks, with LLM assistance for triage, and was
confirmed by manual code review.
No hardware testing was performed.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
v5: 
- Add the detail description of how the tool detect.
- Link to v4: https://lore.kernel.org/linux-arm-msm/20260128042600.2641857-1-xjdeng@buaa.edu.cn/

v4:
- Add description of the detection tool.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260117140959.879035-1-xjdeng@buaa.edu.cn/T/#u

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t
---
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


