Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7692D49CB91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 14:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241798AbiAZNyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 08:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241755AbiAZNyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 08:54:39 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161C7C061749
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:37 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s9so10099734wrb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2AlQcw7YPURwldrVvaukxQ8r98RMSZ2mTDIQmeR0c3A=;
        b=lnZD/BpopUIRmH3UKIpN23OznB/ErRjRYyLier/ToBusCVxCIKm9OgE6eCqa9RGcj3
         QTVgMlJJqDUZOZ0z5/7lmXIRJc4CsmBDoCzeQZuEei3t7kMrNZoTzRaIp1MfqBwPOayE
         MTLXq+8cL2pgMRM6EUnQqH61OfzuGiYDGwL3tTtHtKbK7TGjiymmZCJWWQsk/2PXdvNa
         TBVU/Vd82TuEAGHYFcUi1KuIQRTjLCxRazJbpCxzYa9ZoaDEIlCd0fuQf5AZSu9rQFxt
         67ynmfHA8n2kpduCidgzFnnZ04Kh+f9f7zLt1P2d9LfmyFekcz2RhTBPiUGbaa5DpMeF
         gu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2AlQcw7YPURwldrVvaukxQ8r98RMSZ2mTDIQmeR0c3A=;
        b=bacUDDC3PVhVjUJoGF6Q4lQc9Dtd57gF+4F5AjwuMqWCSPg8F3ptfZ60gmNMdVzWA3
         nxtUyKIrFzFIGnYX0El6J3K00F4DTIQMlDiYmAv+73RqXHPZEkQhJN7nlgOwzKXSn19Q
         IZx4th3HoYg67t8lgilDHCE9yWTKZ32KGBKjKH64F58AJctF6Lph9SL5Dahx9750ZZU2
         4NyJmgMQQnV8TRzpjeZHefQ97K0kH+O0UZYMHPlf/KrLHntDr8uYlPy8Y3wth6ZsI8mm
         zawBzhjUf46KXemmeXsS99CZUgZ9tz3sBfMD+IQ6gLXIbtVNEAkVctZr4xtF140e5dPH
         PHCA==
X-Gm-Message-State: AOAM532CjOZUgD8P2nLhjzEtLgowJJx8ytz52bRGx3MljzZzJR/I3/90
        GhJYzjZWj00af7JLryt/to7OSg==
X-Google-Smtp-Source: ABdhPJyQgkm80ehmV8uqjA9Quoi8Qp5GVpOGXVMVhLM5u/DiASoStA26HaXwTZdSFj/nwB5Zpsa9EA==
X-Received: by 2002:a05:6000:156b:: with SMTP id 11mr10489924wrz.223.1643205275748;
        Wed, 26 Jan 2022 05:54:35 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id n15sm3356593wmr.26.2022.01.26.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:54:35 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 09/12] misc: fastrpc: Add helper function to get list and page
Date:   Wed, 26 Jan 2022 13:53:01 +0000
Message-Id: <20220126135304.16340-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>

Add helper functions to get invoke buffer and page start pointers.

Signed-off-by: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0090085bfbb9..1c1815bed2c2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -832,6 +832,16 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	return 0;
 }
 
+static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
+{
+	return (struct fastrpc_invoke_buf *)(&pra[len]);
+}
+
+static struct fastrpc_phy_page *fastrpc_phy_page_start(struct fastrpc_invoke_buf *buf, int len)
+{
+	return (struct fastrpc_phy_page *)(&buf[len]);
+}
+
 static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 {
 	struct device *dev = ctx->fl->sctx->dev;
@@ -859,9 +869,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		return err;
 
 	rpra = ctx->buf->virt;
-	list = ctx->buf->virt + ctx->nscalars * sizeof(*rpra);
-	pages = ctx->buf->virt + ctx->nscalars * (sizeof(*list) +
-		sizeof(*rpra));
+	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
+	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
-- 
2.21.0

