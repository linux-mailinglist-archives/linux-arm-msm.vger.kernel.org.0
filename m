Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40BD313FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 21:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbhBHUIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 15:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236643AbhBHUHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 15:07:53 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62DEC061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 12:07:13 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id f18so1443413qvm.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 12:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eP5/j98wp1t6sAqe5tfFmscgonRv+nQeEYYt6nNWAig=;
        b=zeKbPy4n3j+GckYgfzXgy3Jrr2u0TvsWN7EM6jmh9pZO27kf1AMRJ8hE5LWnec/b26
         6xzSTJlnmAjgEYi+f7SgeEyVERKXSduSd7w0B/MkglpXE5/c3OrcUCOVF1BRPqXuG846
         ehnDG5c/7/FIz1cZbEeChApXOFgrNz0BQXel62qTvjkWT9XscOcDWDwMTv2YgVBFDcef
         25NSdQq7PJ+SdvWqPKYDzdh+PV4Jycu90J3dy2xcQ9p9BB1nUMlxGvNsl8SgypctOgDg
         FC+3QcqlsKSBKjYr3z8oe5BJEOeUW7YIccMubT/oq5RvyWkL/EX34aENm8kaqT4plxMx
         WRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eP5/j98wp1t6sAqe5tfFmscgonRv+nQeEYYt6nNWAig=;
        b=EYluR7KSHk3OKV/mBtLJHa+V3Cw3JMjzjhSWLQ/Wdi2bSLCJx7V6V8i/9Sf/EbUjcv
         +/Saf7YWJOD4K/bMI570MD0f1u5f4Gmif91uTr6YE5NmhkYUaBgHSwsLzWhiGQeaqw0p
         De0pEtFXKLsbEj41f+gE8MbxaTGA3Okf3HrUK1wi0d7gSDvsQG6PJmVoFSCIB4RtPHkn
         IaHIUcwRmvpL+xFD528oliQs2yKUM5TOo/KmzFnP5YpKBEXpIIGpTWD24fK+tnsDgTK3
         uTFEvtba2Bm5m0uH7e+txaiOMVF4qTfbNPReqPirXk07albwckHvVmS7BUvMOeIOhcW4
         3RIg==
X-Gm-Message-State: AOAM532uMF/oLpOYnCZjOHglb0Rnv5/1Vc+1qvfIIvZFlHqDQrYxa/Hb
        ejuDDLlIwe1xTlAYWuKlPnzPWzx/PTdJIj8d
X-Google-Smtp-Source: ABdhPJyFOwdUIUyn/vUcIKbnbe01w02jVSNywGAvgPLr+K2tbQLcPm3G+qBjJsRptWcL06Al3DzeNg==
X-Received: by 2002:a0c:f114:: with SMTP id i20mr2404071qvl.20.1612814832641;
        Mon, 08 Feb 2021 12:07:12 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id x63sm1847433qkb.22.2021.02.08.12.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:07:11 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] misc: fastrpc: fix incorrect usage of dma_map_sgtable
Date:   Mon,  8 Feb 2021 15:04:01 -0500
Message-Id: <20210208200401.31100-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dma_map_sgtable() returns 0 on success, which is the opposite of what this
code was doing.

Fixes: 7cd7edb89437 ("misc: fastrpc: fix common struct sg_table related issues")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/misc/fastrpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 70eb5ed942d0..f12e909034ac 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -520,12 +520,13 @@ fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
 {
 	struct fastrpc_dma_buf_attachment *a = attachment->priv;
 	struct sg_table *table;
+	int ret;
 
 	table = &a->sgt;
 
-	if (!dma_map_sgtable(attachment->dev, table, dir, 0))
-		return ERR_PTR(-ENOMEM);
-
+	ret = dma_map_sgtable(attachment->dev, table, dir, 0);
+	if (ret)
+		table = ERR_PTR(ret);
 	return table;
 }
 
-- 
2.26.1

