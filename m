Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EB627991F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgIZMwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbgIZMwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:52:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B2EC0613D6;
        Sat, 26 Sep 2020 05:52:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so6823908wrm.9;
        Sat, 26 Sep 2020 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffJxais4qGP0gvCu5GJ1ov8h/Ob+gH0ZybsxZFb8CJU=;
        b=izIYuruDFNqXltczjPsA76PTw+n862sTor1TddTJvNUgDDa2BvRL9Vzs1uzG5NOhTM
         XoSUS6FGEBarLJWx/a+UBeNjt0X7+XqzUZ6CQrW0tF1uTTrfFHRg93otdCE1Gl0SVzbO
         SKLCRHJujWHhSuPVTpjE/nfqWcrHs+1ijjGxJ4gdBfZIhBty8Lt1wjH9TGS8hq7NIMu5
         xh8+1vVgqorRd8aW40KfrnAsviUQ3DSjh5+R4CR1pBd/oG2d+DyevmFHrX2/2XgmljIH
         b6QEB8NsrIE0VAnMIQniDcWcUGNrAQTY6b9pCC4NjAfSmMAkz2COsWcUHU23C7N0gE8w
         suqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffJxais4qGP0gvCu5GJ1ov8h/Ob+gH0ZybsxZFb8CJU=;
        b=leK7Fjrel6KRJ6hoKdN5o94IuD45HWBpje4sOD8E4WDchyDc97pIxR+b6KKiK9f/om
         L5mWzZ3QvZwaTrX06dR7Dj9/q0ZmxKgVnwgFV3KxlacfHBx30hC13qU4ZYhmTHFV9/nS
         0eLcy8yNciWlw1gpCOWTn1Y4SRFutMdTA4rhjCGvS/MHU28c4CnUhaUd95qZ9ISraTpe
         3vT+gG8n/HnAYQdxmPhTLLwe2mhPga+uj0CLvL+yDCMFOlmI4VAQWSMwGNJ9Na/K6BvW
         jcr7SE6Xqpki9W6wIjtggLGqIxn5WzUbP29zOquJY5bUlkKnulW0x6MghQVwpyKIOZTo
         j9mg==
X-Gm-Message-State: AOAM531YtHGGyvjFvYnDO4ZrJ1wLaSaloW0yibnxPgbnqbIV0XvseM8z
        Bq1eug+weoS/fpWFmCnLOQHh1hoCUqIapg==
X-Google-Smtp-Source: ABdhPJzeh/cPOy171Ct8PCqoVlJxp4O7WFQ7ahtAhPDNX1aSK65lu0g3sgP+HxnGbJxVLw9sVIPkPw==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr9997979wrx.164.1601124720185;
        Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] drm/msm/a5xx: Disable flat shading optimization
Date:   Sat, 26 Sep 2020 14:51:45 +0200
Message-Id: <20200926125146.12859-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b2670af638a3..bdc852e7d979 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
 
+	/* Disable All flat shading optimization */
+	gpu_rmw(gpu, 0x00000E60, 0, 0x1 << 10);
+
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
 
-- 
2.28.0

