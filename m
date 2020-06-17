Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2814E1FD66E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgFQUxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQUxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:53:25 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39577C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:53:25 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x207so1730150pfc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2vFanbkC3uvjUoe1v3YzWZWXnFy1tDZVnwieI4nd9Y=;
        b=U1vB3FFXCBnFJurQB75heRhAW7lMV3f4bkk1rZ/IrcNCPafx08mjlJhLOcBRbKMvh6
         UW+tkU7o/v3J9aEa+zA6BqkttVnr42asCTQMjKL4vQ/LmR4xM+dGsZI+vhseLnhBoKha
         qQ55Vc6TJJE1qTzsoTkNFpgmFrBQHrY11gowCx7PmbM0rBZBfwrj3hQ5/F9IqZcvwdh+
         t2yXOcOiqIgY5Bc0qxtlfoLNBGI4y0MC1a86lltnPbJ34qY1OP8TMcMlUD2VI1ndg2RA
         AQCtYvKCqXTtckfzYIQpyl803MP+SrpWF/SjyUXqpDbVn6aBd1z0vCXxLslDMhEvBEtH
         CSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2vFanbkC3uvjUoe1v3YzWZWXnFy1tDZVnwieI4nd9Y=;
        b=rqL02XUZfpTCFTgHuY2JiK5lIMuS2xFYEdkmNJ8xw9pQ6TUY72Ycn/7cvTPZvpO44+
         9G4HymylL+IquuK0WkLVGmmjMQ1LhRn+kY/uvsG9d/llneVSd3ZIcNpiMbGaf1n7Q5ML
         qkQRJF5i9ksN0CCCfpZgfe6JLdRsf/KeNbCDy8ZvpAtF2lK++3PM9dHGJuGPgF3Op0r2
         aUClpSS4jOKhoxj+37s21PnWACYGtwIfncGUeTmf1LIWWh6KVJssoEGuk+W/smYMz7EG
         GyzV0rMphuJrPY8VSQPxPTfnzsoMF1txVTsWiHzj72zstvc+5ezbqpx9JN26g1HbCy5/
         O46A==
X-Gm-Message-State: AOAM531xtD1Z0KQhea7Z8PTzq++3fLCGTgVE+WeMdhJ8ldYIEP46NkUo
        9LVgAFLyxR208HojxbkA8mebOw==
X-Google-Smtp-Source: ABdhPJztQrP4O1BHPZxdSGgbABHzOJqmU7cZUuKr3wGa1+knYDpG0udKd8LAT9RleSRBWs6SNIbsmQ==
X-Received: by 2002:a63:a06b:: with SMTP id u43mr572047pgn.294.1592427204507;
        Wed, 17 Jun 2020 13:53:24 -0700 (PDT)
Received: from miranda.anholt.net (c-73-11-63-120.hsd1.or.comcast.net. [73.11.63.120])
        by smtp.gmail.com with ESMTPSA id ca6sm392454pjb.46.2020.06.17.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:53:23 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/2] drm/msm: Fix address space size after refactor.
Date:   Wed, 17 Jun 2020 13:53:09 -0700
Message-Id: <20200617205310.2183722-1-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Previously the address space went from 16M to ~0u, but with the
refactor one of the 'f's was dropped, limiting us to 256MB.
Additionally, the new interface takes a start and size, not start and
end, so we can't just copy and paste.

Fixes regressions in dEQP-VK.memory.allocation.random.*

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..5db06b590943 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		0xfffffff);
+		0xffffffff - SZ_16M);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
-- 
2.26.2

