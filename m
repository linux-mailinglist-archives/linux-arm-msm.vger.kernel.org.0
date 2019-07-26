Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 587FB7645C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 13:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfGZL1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 07:27:53 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43570 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfGZL1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 07:27:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so36843688lfm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2019 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQH4GnL/y7NNHvqjapmVG2NpS/ejAHj8nLLRQ4EYloU=;
        b=MeM/PtQCEY3Pof5+eaMTAWxOiKj2b/a9tQSd91Y3IuzC6dgUIHxOagN/qoHqAHA2rs
         Jkr2mriESm2QVd3Bx/UMF4Qut41yjn7Vn3M4jDMaSnxQlZOfx+P0EOR0E5piucx7sbw+
         AGAtaFLkRXdpa4uKjDiXEQZZtdqBMD1XnDbZfF4aflyRQsHFJ/lNAq0WE5+jKUY7Iuyi
         xKzL5883lT5fmNnJkIpB+OrR1rJg/xzD+lJGlw62fRf5G2FpiEQxZyzt7sj7IQg87xDp
         X8YA9i+Gmtmy87qydkMAz5VMETa5mpEiMWaKMBmoHYggHLm8A92JgRnRNdCTkyGqAsH0
         9DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQH4GnL/y7NNHvqjapmVG2NpS/ejAHj8nLLRQ4EYloU=;
        b=MTmYcF6cLeDe+6K6rohthuKqq1qyF+ungNqOJ8E+7ro1U7/I0DreLw99oL/3tmb5iL
         7X8n9weHAy0CKv8DU4ftn6MedpCfbpXndM8MDVprYNSBi4Pr1x8UgFStFTP3OHFJokwU
         sF4p//UZ0CRfp8/m1gc2hbpav868XXOPjzQteQkr3K4N5vRth0vV109bn+yTzmh1wTwb
         eHkvccJODMlAO8DiBcOvdtWIMv9XREfS1Y3MWGxBEarLMVDNwGm8163CKazuXxri3blI
         VlgmFK5LEdxZuUvg9c4cCDDKtc2fC+dbErcMNlj0+Ru4IbqiQl5YSAKJoKT3zj4CK0wM
         030A==
X-Gm-Message-State: APjAAAX0bZA1/ASfK0Mn7lGxzoQqYtD/5iNj0DR3XLztXf4TIf9mzkgS
        cdM/ecXt6pwJ2F4jlWvEvJyPmw==
X-Google-Smtp-Source: APXvYqwK6JAGM/+6Ct9HQ9Y4iUiOBdPg34aJqKTvDsITvAa2v2OhVhvNW4jYAPzRSo/1lIt0KkIM0Q==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr41706584lfn.52.1564140470939;
        Fri, 26 Jul 2019 04:27:50 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id m17sm8218208lfj.22.2019.07.26.04.27.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 04:27:50 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/3] drm: msm: a6xx: Mark expected switch fall-through
Date:   Fri, 26 Jul 2019 13:27:46 +0200
Message-Id: <20190726112746.19410-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When fall-through warnings was enabled by default the following warning
was starting to show up:

../drivers/gpu/drm/msm/adreno/a6xx_gpu.c: In function ‘a6xx_submit’:
../drivers/gpu/drm/msm/adreno/a6xx_gpu.c:116:7: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
    if (priv->lastctx == ctx)
       ^
../drivers/gpu/drm/msm/adreno/a6xx_gpu.c:118:3: note: here
   case MSM_SUBMIT_CMD_BUF:
   ^~~~

Rework so that the compiler doesn't warn about fall-through.

Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index be39cf01e51e..644a6ee53f05 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -115,6 +115,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			if (priv->lastctx == ctx)
 				break;
+			/* Fall through */
 		case MSM_SUBMIT_CMD_BUF:
 			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
-- 
2.20.1

