Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF22261DE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732388AbgIHTn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 15:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730879AbgIHPwh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 11:52:37 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2223CC061243
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 06:11:33 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h6so4008896qtd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hUrb8SCFg6HulXICTWjB5J3dJa3WsyRvIUrd/Gj8E1A=;
        b=Btgln1DzqOK0Ky5OmfZSVznH+IIFskFJhEUd/6L+2EzexX2xFdtpBjfG38nIjkpQK2
         pmnstu3GxKex83ZqJBTGKEoxQOsaa9ej1y1DmAcjfKwb+0/WbK2LcBN7TCMlSvkpWo6l
         4QtbYzWr29/ZV+fKFkKIj68KD1so+1Scelu9baU+Kvw3HAAudlLQf80AutQ5xanEeCsL
         R4JT/89nxaVd+kfU/AIPwxL7uteIXQwOK3LtJdgLl82r3LjSyfuC3lv9Lh8VmS1z8q7H
         +QwBvwk4vlWlHa85UZOoF69Ob9wSq9wKPzlP8O+GJkTsnX4Bf2jVdcigwybNlpnWXA/V
         MdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUrb8SCFg6HulXICTWjB5J3dJa3WsyRvIUrd/Gj8E1A=;
        b=eH+lZkartg38+XrZ2tYmoyH96+Cl79eh8mI6LUO0Grq9CXQ7nuo0RhbRpCOyUa3KSY
         fCK2T/vHJt2UHvaIEOGoFUfI2iIQkzPZQSARipWOgHq5eGCBoKcaREv0HYrkqghtQQkg
         TaofQ+4dsr5OWXVZ8xDDUIzPsw0Tb5OSB68XrEj5ZJiXpI9rONvsqDNy6N4awHKmaZue
         +Dqv99Ng6sTuuJf4kjurlY805vUmfvLajS1oHZ+GFONn9+7TfSFR818ZjoONi6RuWxHJ
         lxQI4Ng7CDa9e1trfwpbpqSCcF0ASIXIM2rwTUqCYMHhRHjMEsgycoHfc6Sb9/tqxucr
         MYlQ==
X-Gm-Message-State: AOAM5303x8qObV7jdYP7FxvTm+0gE6sPHh0vFBZaaoAOkrHJIusTpjoe
        NYECwSkqnVKNqD5DI3gC4qfXF4xNQTBXsHcl/9o=
X-Google-Smtp-Source: ABdhPJx3qjKvLLDxptFWyk2taGV4q+N24WetF6P4vAorl5llo7bW4K8NDUDihiwxftcYS6HUZPP72g==
X-Received: by 2002:aed:39a1:: with SMTP id m30mr25310181qte.39.1599570690288;
        Tue, 08 Sep 2020 06:11:30 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m196sm13394069qke.87.2020.09.08.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:11:29 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] misc: fastrpc: fix indentation error in uapi header
Date:   Tue,  8 Sep 2020 09:10:09 -0400
Message-Id: <20200908131013.19630-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200908131013.19630-1-jonathan@marek.ca>
References: <20200908131013.19630-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use tabs instead of spaces.

Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/uapi/misc/fastrpc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 07de2b7aac85..de31f0bd4779 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -10,8 +10,8 @@
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
 #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
 #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
-#define FASTRPC_IOCTL_MMAP              _IOWR('R', 6, struct fastrpc_req_mmap)
-#define FASTRPC_IOCTL_MUNMAP            _IOWR('R', 7, struct fastrpc_req_munmap)
+#define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
+#define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
-- 
2.26.1

