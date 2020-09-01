Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98B62584DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 02:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgIAAeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 20:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIAAeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 20:34:13 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE5AC061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 17:34:13 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id o5so653582qke.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 17:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLafwiC2xQNKUVCHdLUQQvDtsC6khh4yCLYOGaMsDWc=;
        b=h4hzz+LL2wmWO8VdqfAqx/UHSd1YE5o9wpRi/+hRRkQTNduf7/9zNCMExEk8b+xamH
         bZ7M0RuVDaXOFnhujxEqPr7ZD8EG5xtzl/rMkN4+dDTj9NVbWTY4ag5ddyL/fwtmFCZM
         OERDDO7JFtLGWeSx9VPlC+Fw+GrJzDeb5eG4JNPFtTEgPh0U4bBUGkjQBMmR8GctTMrL
         lbdUAVUQDlQ0xy5SxNeY41orwXKRCy4fRzvXiXV4ggd9t4X8DVIm1LOwtzTdNKv0HPdq
         QQ9B4CN+uoau2pc5Qpdie8o0F4DpQR8Zx9EwPGQ2+Gr+/h3XT9OiLKod/fc0C2+8mRGm
         Vmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLafwiC2xQNKUVCHdLUQQvDtsC6khh4yCLYOGaMsDWc=;
        b=kQkk5Q7IraZskyYpb+5lMrPQigRR6PchuB/vWY70/5HAvGAuy+9b4ywfDahhSsVn1o
         dv6iI3x+64/D7MbOyoXIQZcBYPjjBCanJR/bLqK4U6uDG3kqcknC2G3e7E6UKO0sAQkt
         HEVhHQzAMUAlOSFe+79uLQLqVabUjVBylMUDA82/bT98QirBlSn+tx5juJ+kes9IbSfn
         lTmtHZxlq2x2oNWid8ht+OP/m1dMgHs9FavMu8xfMZMdVLIJrtbhHEQ68MQkW6e9sKqE
         BSIzkCVoQ+ekf65c3VTBk6pEJ+wqGxLxGhpSH4V/dl/tdmDKCThEkO+NJWgoadOjJfab
         +yjw==
X-Gm-Message-State: AOAM530nidABS6LhLJkiglY9NKJnAQAQiow1WvjRg9pk3d7Xca1FPTaK
        231CBXNOFRmv6f5PUmtXIm3MX401TJxr+m0CFTc=
X-Google-Smtp-Source: ABdhPJw9tUjyIucH5cZED4lzBJee/JgSOGBP0NzmRVA3Y7tmYxKdfrwyxqGClPCje078VfJuMEc6uA==
X-Received: by 2002:a37:9b8f:: with SMTP id d137mr3922530qke.459.1598920452229;
        Mon, 31 Aug 2020 17:34:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id i14sm12189491qkn.53.2020.08.31.17.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 17:34:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
Date:   Mon, 31 Aug 2020 20:32:59 -0400
Message-Id: <20200901003300.11985-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initializing sensors requires attaching to pd 2. Add an ioctl for that.

This corresponds to FASTRPC_INIT_ATTACH_SENSORS in the downstream driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/misc/fastrpc.c      | 9 ++++++---
 include/uapi/misc/fastrpc.h | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7939c55daceb..ea5e9ca0d705 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1276,7 +1276,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_init_attach(struct fastrpc_user *fl)
+static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
 	int tgid = fl->tgid;
@@ -1287,7 +1287,7 @@ static int fastrpc_init_attach(struct fastrpc_user *fl)
 	args[0].fd = -1;
 	args[0].reserved = 0;
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
-	fl->pd = 0;
+	fl->pd = pd;
 
 	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
 				       sc, &args[0]);
@@ -1477,7 +1477,10 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 		err = fastrpc_invoke(fl, argp);
 		break;
 	case FASTRPC_IOCTL_INIT_ATTACH:
-		err = fastrpc_init_attach(fl);
+		err = fastrpc_init_attach(fl, 0);
+		break;
+	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
+		err = fastrpc_init_attach(fl, 2);
 		break;
 	case FASTRPC_IOCTL_INIT_CREATE:
 		err = fastrpc_init_create_process(fl, argp);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 07de2b7aac85..0a89f95463f6 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -10,8 +10,9 @@
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
 #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
 #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
-#define FASTRPC_IOCTL_MMAP              _IOWR('R', 6, struct fastrpc_req_mmap)
-#define FASTRPC_IOCTL_MUNMAP            _IOWR('R', 7, struct fastrpc_req_munmap)
+#define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
+#define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
+#define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
-- 
2.26.1

