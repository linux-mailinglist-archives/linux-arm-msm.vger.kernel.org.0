Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED852A499E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgKCP3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgKCP3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:14 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026E5C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:14 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b8so19026742wrn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zy9kvgUXs/WPiYKzqvxC32aSPHbLNGyZHTHYNq/v11c=;
        b=eMhOrS8i+lVW1jzQLtrtzjA4g8AI7gCkFG0NYQ1En62uDk8769Ni9OGWuNzARl+sH5
         C05u/onYjGMuEqCURs1Ez3eH8beNmL5OZDkO83kq+x1oAMrODLUcabO6fnski3vAlGO6
         m9sEoI67smeYYnzmNz6QDZ8DW6rb8jjvURTz0up5I8A4RNM5bbmVOaH8LcBuAovVerqA
         GOjyoyWYC97JbtSxqqjZ4NR4jHkt0+mTY4km5avSVu15tpk2NHQK8K8migj4l48FBqVH
         Bb/tVPmCVrp49g8auokkn6gfX3ITL+WfHpTFCC4NKqBcLxg5+1KJadn+Js++HdBMyh0M
         r9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zy9kvgUXs/WPiYKzqvxC32aSPHbLNGyZHTHYNq/v11c=;
        b=DEWiYJzysno++zDPy1XIWm9btuGz90UFPK7RJfquP5BpUah1HO4HF+Kyaa7sgqtsHH
         aIeCJkOmIMdti4XYXCHrt8hFvxkk5HnZ8RWXWGhD21P/PgRuX72iBilqWBzUodmYa4rx
         k+J01bbXuJQIZRnrUZz968N2H4C4Vs6L3WtD5Lgti6t9mx9Uw2Ij+YGQPx6THaXTvqgw
         kAmUeJMWpyjFZ+Aw3CRPXEetZ2i2CzP5xrR8NHxVU8ckpjcvRP9D3YGjTR+ld5gYiMqL
         bPqNq1nL83GYenuOAoObcvV6YkDNKjdxzRPjHo2b6crec7lz8/ttPW2ZLApGdJWuA88u
         R1iA==
X-Gm-Message-State: AOAM531c5YrG4rrONJrXeahzM1UIYRXUrGmiXmkxxslKiQWz8RDE1b24
        Qom6nPpZB7b8YqW0dIOthPAzFQ==
X-Google-Smtp-Source: ABdhPJy1tik0u1PCJKipwjUPaAlnCTpcl4xx8dB4MnHlJvvyMldQ/bfvYWoBOq4BzOGK8XRJ0BEnIw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr210269wrs.377.1604417352772;
        Tue, 03 Nov 2020 07:29:12 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:12 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/25] soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
Date:   Tue,  3 Nov 2020 15:28:15 +0000
Message-Id: <20201103152838.1290217-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/qcom_aoss.c: In function ‘qmp_send’:
 drivers/soc/qcom/qcom_aoss.c:228:9: warning: variable ‘tlen’ set but not used [-Wunused-but-set-variable]

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index ed2c687c16b31..83589756cb1f0 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -225,7 +225,6 @@ static bool qmp_message_empty(struct qmp *qmp)
 static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 {
 	long time_left;
-	size_t tlen;
 	int ret;
 
 	if (WARN_ON(len + sizeof(u32) > qmp->size))
@@ -242,7 +241,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
 	writel(len, qmp->msgram + qmp->offset);
 
 	/* Read back len to confirm data written in message RAM */
-	tlen = readl(qmp->msgram + qmp->offset);
+	readl(qmp->msgram + qmp->offset);
 	qmp_kick(qmp);
 
 	time_left = wait_event_interruptible_timeout(qmp->event,
-- 
2.25.1

