Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581B249CB8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 14:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241782AbiAZNyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 08:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241766AbiAZNyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 08:54:35 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56FCC06175C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:33 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u15so25948625wrt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zs0E5gUaoruQJ3cvVtoptNZo64os9iwjHdiVALNxOr4=;
        b=wKtTYdgoKS4YdUkgnSSv/91lyaiD39hzcOjJGllpmzOWgF6COeYRWEUOkKTfcoR3Vx
         E7ZIbKOh3J9XX+ny0VMmWyglPdecWqV1XFzsRya/HPdPw3LN2QFIYpRHxBzxWBJnmx7w
         d6mEo49zL/h+xBYKWCKed8IftTWCYzwMfknijh37/JydP28QOB1W38nPr7AP1BJHwT9s
         yxT4MFB125P0RnsbC1zxg0s0FA8igzNVUyLHjx0548bUVmlSH8NVb+W5kDLSsGLog3Z/
         sqBeavfiJunAiA3YaLyxnCBGHx7EVL0o5973cWe3f+M68y9GU721NvwClgArts+69v7K
         LKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zs0E5gUaoruQJ3cvVtoptNZo64os9iwjHdiVALNxOr4=;
        b=bNq9vEwtJtT6InjSwQeGOLjDwR5DQszN2hNJbFeCq4JvjrvSLYgdzFSHAAdKgaov9c
         xGePZL3eSnxxwx1kC4KFrrfrc2Vqyp4ziwFlSvRxmAMBpawljiuo88pjApcyI/Ag1IUg
         V3Pk0mQ40unV5N74JVyJlFqpc6igqwGSVQO6qYHY/oXvomp8dzm01wgFZbhCWLuucZAq
         7qGg9eyowqwkiAl/kajhSh/CQ1qLGrVr0v4dcN+oPDilohLWEaVvsFFrPsqjqZ3iH49U
         V4mvxHjdlOC5SrHxVODh1SBh6WNje3kqrBGKex5W/8jAHTEWXvfUG7UvPqqY33YwR0uA
         ol/w==
X-Gm-Message-State: AOAM5331kzdjnkpSRCwj3HnT7YNKSP4Xrig9pHO1mRRhPDq84iFexFGw
        O8nmqAivR/gnUPt23jLU4eyRBA==
X-Google-Smtp-Source: ABdhPJxKg62TfJnWibTrVuqUbQxrbH2rHYfToqzIo0ek+w8ZseYSjA78Je9MQAq/fy/AaXlM+fRKDg==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr11621086wrq.37.1643205272298;
        Wed, 26 Jan 2022 05:54:32 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id n15sm3356593wmr.26.2022.01.26.05.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:54:31 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, Jeya R <jeyr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 06/12] misc: fastrpc: check before loading process to the DSP
Date:   Wed, 26 Jan 2022 13:52:58 +0000
Message-Id: <20220126135304.16340-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeya R <jeyr@codeaurora.org>

Reject session if DSP domain is secure, device node is non-secure and signed
PD is requested. Secure device node can access DSP without any restriction.

Unsigned PD offload is only allowed for the DSP domain that can support
unsigned offloading.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 33 +++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h | 17 +++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9eadbcf451ef..8e780e2d5d9d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -243,6 +243,7 @@ struct fastrpc_channel_ctx {
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
 	bool secure;
+	bool unsigned_support;
 };
 
 struct fastrpc_device {
@@ -263,6 +264,7 @@ struct fastrpc_user {
 
 	int tgid;
 	int pd;
+	bool is_secure_dev;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -1051,6 +1053,24 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	return err;
 }
 
+static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_request)
+{
+	/* Check if the device node is non-secure and channel is secure*/
+	if (!fl->is_secure_dev && fl->cctx->secure) {
+		/*
+		 * Allow untrusted applications to offload only to Unsigned PD when
+		 * channel is configured as secure and block untrusted apps on channel
+		 * that does not support unsigned PD offload
+		 */
+		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
+			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD");
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static int fastrpc_init_create_process(struct fastrpc_user *fl,
 					char __user *argp)
 {
@@ -1070,6 +1090,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		u32 siglen;
 	} inbuf;
 	u32 sc;
+	bool unsigned_module = false;
 
 	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
 	if (!args)
@@ -1080,6 +1101,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
+	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
+		unsigned_module = true;
+
+	if (is_session_rejected(fl, unsigned_module)) {
+		err = -ECONNREFUSED;
+		goto err;
+	}
+
 	if (init.filelen > INIT_FILELEN_MAX) {
 		err = -EINVAL;
 		goto err;
@@ -1279,6 +1308,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
+	fl->is_secure_dev = fdevice->secure;
 
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
@@ -1947,11 +1977,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
+		/* Unsigned PD offloading is only supported on CDSP*/
+		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
 		if (err)
 			goto fdev_error;
 		break;
 	case CDSP_DOMAIN_ID:
+		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
 		if (err)
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 7cc9d342078a..f39edac20305 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -46,6 +46,23 @@ enum fastrpc_map_flags {
 	FASTRPC_MAP_MAX,
 };
 
+enum fastrpc_proc_attr {
+	/* Macro for Debug attr */
+	FASTRPC_MODE_DEBUG		= (1 << 0),
+	/* Macro for Ptrace */
+	FASTRPC_MODE_PTRACE		= (1 << 1),
+	/* Macro for CRC Check */
+	FASTRPC_MODE_CRC		= (1 << 2),
+	/* Macro for Unsigned PD */
+	FASTRPC_MODE_UNSIGNED_MODULE	= (1 << 3),
+	/* Macro for Adaptive QoS */
+	FASTRPC_MODE_ADAPTIVE_QOS	= (1 << 4),
+	/* Macro for System Process */
+	FASTRPC_MODE_SYSTEM_PROCESS	= (1 << 5),
+	/* Macro for Prvileged Process */
+	FASTRPC_MODE_PRIVILEGED		= (1 << 6),
+};
+
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
-- 
2.21.0

