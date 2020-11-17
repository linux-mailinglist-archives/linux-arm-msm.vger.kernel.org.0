Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E192B6473
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 14:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387733AbgKQNr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 08:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387725AbgKQNrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 08:47:23 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164F8C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 05:47:22 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id q5so20300334qkc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=viLHKc8a3d3lX6KoyTITkukZpyuIVB/pcP2R7QEguMU=;
        b=EMg+icpS0V3k41YQtK49iZlqVjzspufUju4x5jODYnd0mhH5J5EVPJBx7xJUXmPlMZ
         AirOETSM+7lQuaXpQdqLfAsrwJqLA9/Q/yg8X/QngzhWK3ZkYVPXyI8d+JQcMxJfHCdk
         He8fRgj/JrWnypLHpbAsCU0UmspkAqvp0u0sBlEoLThhQZo02Cvz2APW/VacvZ4N2t9H
         GqdCN96qAzc/7ohE2niMvV3mj97cBxErPWIL4kjeEspwn/qDL8NALFYuJGdOJUt2/fs5
         jyD8KNm4w0e1cEJqu/eixfWOx1S8qx3WigTWN5HoaecU/S6/wjEVll+R3vaGPszlTe5o
         FSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=viLHKc8a3d3lX6KoyTITkukZpyuIVB/pcP2R7QEguMU=;
        b=JD9mbWhy21jmEiyWcK2PRXfT2e8oJylgZU9Np+eGiIQPQn+SA0GqV4ewrCvKb3h8h7
         5QhzQdXEZsM4VE2mrD9UCO0++jOY/5UJn8eLAiUMwx+H4lHkSuCiGZyBHFJCORgKcr5X
         O7ggkwzFWCjsdmAmsbXq+mxzimLw9AG9EhL/UZA8jr9TSYw2wrTzVRxIPJsQN7FtiSxN
         Ogmz6xaw7QNMjOs/aFnY3CSuhnCx/G4+nc4IaA+Yby/+9R7wV7+KDo/sIUdbrmkZIfre
         vHGy/1JdrlgaZk/+jF3ZQi1Su+2cRMcsjhq+C3KTnD83ybCwNGaVdgrY64LN3C0D8YRs
         qAwQ==
X-Gm-Message-State: AOAM533optMbYkxHM3jU5+38sozB8kOGs7HuFqRonaKo0dCSKkw/jEbc
        pyYnG5kOd4INdwoUYOY1eDMqjQ==
X-Google-Smtp-Source: ABdhPJyUVg24bUGBBdwHbWdUiJC7RDIAp4/ry5pgYm4QOustac2fgOjaf+2YxP1aVS0APm/+u/or+Q==
X-Received: by 2002:a37:6307:: with SMTP id x7mr19306358qkb.195.1605620841250;
        Tue, 17 Nov 2020 05:47:21 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id t133sm14607355qke.82.2020.11.17.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:47:19 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 4/6] drivers:crypto:qce: Fix SHA result buffer corruption issues.
Date:   Tue, 17 Nov 2020 08:47:12 -0500
Message-Id: <20201117134714.3456446-5-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117134714.3456446-1-thara.gopinath@linaro.org>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Partial hash was being copied into the final result buffer without the
entire message block processed. Depending on how the end user processes
this result buffer, errors vary from result buffer corruption to result
buffer poisoing. Fix this issue by ensuring that only the final hash value
is copied into the result buffer.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/crypto/qce/sha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 87be96a0b0bb..61c418c12345 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -48,7 +48,7 @@ static void qce_ahash_done(void *data)
 	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 
 	memcpy(rctx->digest, result->auth_iv, digestsize);
-	if (req->result)
+	if (req->result && rctx->last_blk)
 		memcpy(req->result, result->auth_iv, digestsize);
 
 	rctx->byte_count[0] = cpu_to_be32(result->auth_byte_count[0]);
-- 
2.25.1

