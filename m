Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C175B1CE074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 18:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgEKQ3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 12:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729463AbgEKQ3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 12:29:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40334C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 09:29:37 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f134so6532866wmf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfKRBxYbb6m/b9/QgIvfPiqDsDk95S9RSARlHkl9An0=;
        b=tpbbUDaAZgNrNk6b/o76dv2RwUJW97IOxe00ZbkrdrnRmywGmfAcFgQsKy7HSDdaBz
         /JuMTpwP917IjwDx1/UoF8IXmuR8N6LsfGGfA82Zq883kkxmCQqnMi2yy1Gsdv+UFSZ2
         LJ9IlGoDv1nPJ7moHEYnOXMk5cn9lsFdrx8ZQSYmL3QKg3XHg59cZFcmMo1uylKQCTBR
         Aa3PGblZ0yHOFMzKC06F8+MmwdlTZ2MSLPe+k+6QTiyuRAuT6msI5rBhwnPEmnKNPcEf
         xLWqAndl9jaaFYKI7YBsyKH7LRsbFawTBChG5bQK3QmmR64ux4F4z04VizBWJQVX8qgG
         e8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfKRBxYbb6m/b9/QgIvfPiqDsDk95S9RSARlHkl9An0=;
        b=H/ayBVyp5KQNiw9VJntZ4MeyXO6DKFXTWk256C/U9xmFmYU6LF3piej3UO/+W+8awY
         UeaFCA2EIc21Z2MZQPdfH8fyK0FL0CW2ky3NCDPy9w8PFxQyZuNIQ3W5ZTH1vdySZuR5
         RQPlpOfU3p6W/4R8Hr2GkIoAroAFceY4zcrQVJIYRnPjOUJ9yX4InHbOTqZEHN/YH3l2
         gTosTX7suAXL3X8asy84xQhJrYIASF4prlsO4DawlgIq5eiVF/6s4quTNPPgX9B9tIcX
         0uibehxhENe1SeYIChW1yUtA9f3Bm5sHDd9EgH6vgu/AFeAYyj7aNp4k0xZAYu3zfrXM
         Ec9w==
X-Gm-Message-State: AGi0PubgWM94NooRx8bFDqHzB5iPQUgl4xL5J58tU4KnO7GRe5BuEfmL
        jCuH3C0c8k/s5j4duxWTkYfj0w==
X-Google-Smtp-Source: APiQypKnL7Dw9SKRhLpoN/UNhN4ri2w0wkwrh/2jeR0e6yW4+wkl3lNIi1z/67KMUeRls0AE2M5Yag==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr18700616wml.117.1589214575942;
        Mon, 11 May 2020 09:29:35 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id 7sm20448844wra.50.2020.05.11.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 09:29:35 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] misc: fastrpc: fix potential fastrpc_invoke_ctx leak
Date:   Mon, 11 May 2020 17:29:27 +0100
Message-Id: <20200511162927.2843-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fastrpc_invoke_ctx can have refcount of 2 in error path where
rpmsg_send() fails to send invoke message. decrement the refcount
properly in the error path to fix this leak.

This also fixes below static checker warning:

drivers/misc/fastrpc.c:990 fastrpc_internal_invoke()
warn: 'ctx->refcount.refcount.ref.counter' not decremented on lines: 990.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9065d3e71ff7..07065728e39f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -949,8 +949,10 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	dma_wmb();
 	/* Send invoke buffer to remote dsp */
 	err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
-	if (err)
+	if (err) {
+		fastrpc_context_put(ctx);
 		goto bail;
+	}
 
 	if (kernel) {
 		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-- 
2.21.0

