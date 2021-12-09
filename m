Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2680146E810
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 13:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbhLIMKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 07:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbhLIMKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 07:10:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3D9C061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 04:06:59 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so3931262wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 04:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMAxu6THltYWLchCw9nsHQsbKoxrZaVufwyt4Anj+Rw=;
        b=pvhVgdgJNkG2YC0mg7aQCaNoBF3wZYpj3ZrcvXlKvxJoKmff8WgVu2Yf1/LtYgXn71
         a1yDRI7nj+91hDcEfm86joqMzl677CEun0CRUsVP8hnh2P+5cVrWQNnfViUQWWoM6usz
         wsGGFNq8+RGppBNPRJTMj6RYmHKXwMr8HtnebW6LaeYUCOIkAaS0/61jOMdGRVtQmBev
         a3jajhfjp6Gel54ZqjzziUsgSTMp2tV/YzZyIZy8fwzKM4cs8m2TNljEK9yvsrNhGqa9
         BCJr5kmrJD/tch13KtUUnsrRoecuKzGZySsVtLmjr8i92PFeLzURK8t+vT2C1ZM2ekuM
         XkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMAxu6THltYWLchCw9nsHQsbKoxrZaVufwyt4Anj+Rw=;
        b=BBbr1Gh3VyJQgcVC/oM1/PiAoGt7j7KQuYuEp5WtVe1U7pVEOkUsCX88VvKfhip0wt
         ZhlOjzqvaS3y2AcENQqVJFQiNB56LodQcW3Fmg00WEayZgwZ9Dcb3IBRgC572FN1Noa6
         e8459JjkGyR6aKWNpB1IiOyIRQZAKST2sxOsHOa6r87zYsof+YdBsiBmXh09qZPskF9H
         Lv/smL9ORk5QS5fk/+PeE6BAmt5DChuj4gDaFrfCYm9ZvoY0JBtmDXv7lXwx8Y3bq6E+
         kh+YOuv3Y1n/Ps5k1SaAiyS3lTGyvylFKBH0M4JVrvRXA6Iah5dZVcJQTUcJTxuHd/q4
         NVKw==
X-Gm-Message-State: AOAM533HWhdqaVMW0i9+wg6c8gumRMgKXvp6satktrv9lmPK5+jxpRKs
        7UfvjsuVlt81jfo3aVfko2EGxw==
X-Google-Smtp-Source: ABdhPJz4cOkVVHWdVQ/CEluKwx9VmaZDIJ/8mfQwZiNQ/fbsKfXNlqPrlMxig83e8304dt+agA5vSA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6612045wmc.39.1639051618381;
        Thu, 09 Dec 2021 04:06:58 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 4sm7513289wrz.90.2021.12.09.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 04:06:58 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/8] misc: fastrpc: add remote process attributes
Date:   Thu,  9 Dec 2021 12:06:20 +0000
Message-Id: <20211209120626.26373-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeya R <jeyr@codeaurora.org>

Add fastrpc remote process attributes. These attributes are passed as
part of process create ioctl request.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/uapi/misc/fastrpc.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 0a89f95463f6..b74407d19ed5 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -14,6 +14,23 @@
 #define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
 #define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
 
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

