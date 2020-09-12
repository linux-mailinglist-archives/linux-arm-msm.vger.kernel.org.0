Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B839267980
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 12:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgILK1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 06:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgILK1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 06:27:20 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C125CC061573;
        Sat, 12 Sep 2020 03:27:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m5so8161052pgj.9;
        Sat, 12 Sep 2020 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDZ5tcssoN7AbeNjNp+bLVbRjIJciCMr92xa5Hx/HY4=;
        b=nNZi/QPOo0AwKKxuth4gfBStBk+2tlBba7+k/2APtcsgykjdf9wSvxxN3TQLwVmlOz
         figSwPN80C7NwjRwMaZVyVYCRZyAS0QTEv/r1woDUXTcxGX2NdsLZmL5lXa2pRDQa3K8
         oIm/XR7pFMYBFziXhzpNimhFax9cD+dqmaq0YVqoGzs9qLigylhsDMJib5J3MA6+q6sU
         X7mMzbx5NmFWjChZhaoMopScwe5HKKM+2JzAiMeo0KygmJRdKZPlliieCQF7vAzapiGk
         8MY0vhND/ectdugWWQQFdoiWvbcmisZxkXHLjvxQ7JwE0BRFVilm2ZnYmDTrzbsXKcd1
         ZLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MDZ5tcssoN7AbeNjNp+bLVbRjIJciCMr92xa5Hx/HY4=;
        b=H9PaVVgl2LCTeWWy7cg9djcmEhULXNTjg6tRUFJfkHZEpfzxlkrql2Kjkjh+jHUiX+
         t9u9+zQX1S1zANxAkMksex/ssERSP3enyRkONKvJZd6DOUH/ZJqEyubwhjW6U1ZGEiWN
         sLlmBZG1TsPczi25TrTYUgE2iy6k2EGCfp7Ib0nKufP+cVv7jsvqTJBSRrgcVaJ/EDNM
         YIzXOKaKVt7TcJB0arlbrwQU5K2e4uU1+7YEA8RH+gTZ4S3pHCmdNY4vGxqYL2P4XWIZ
         n65ex+cG0JpKcT5odFOqeSwK6b5PVWAbBKJ7UfHbYvPrW0TxLyPlTwoNvnNvgzHAeFGe
         aDwg==
X-Gm-Message-State: AOAM530q8Pi/06g9QTjWCk90rmG/ZsQZr0e34z79Uymyl66EtXqxzm1w
        8J+wcvxgZxn2fvL53307BmrndjwXkqo=
X-Google-Smtp-Source: ABdhPJxxWnEKYjAbcCapguCSGmEUGdBpDiFLyNyEkVyiOZddIbZLkp/S9efbYDisB/iwqK5b/ZRk/w==
X-Received: by 2002:aa7:961b:0:b029:13e:d13d:a140 with SMTP id q27-20020aa7961b0000b029013ed13da140mr5964208pfg.40.1599906438045;
        Sat, 12 Sep 2020 03:27:18 -0700 (PDT)
Received: from ZB-PF0YQ8ZU.360buyad.local (f.a4.5177.ip4.static.sl-reverse.com. [119.81.164.15])
        by smtp.gmail.com with ESMTPSA id g21sm4910276pfh.30.2020.09.12.03.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:27:17 -0700 (PDT)
From:   Zhenzhong Duan <zhenzhong.duan@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, smasetty@codeaurora.org, jcrouse@codeaurora.org,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH] drm/msm/a6xx: fix a potential overflow issue
Date:   Sat, 12 Sep 2020 18:25:58 +0800
Message-Id: <20200912102558.656-1-zhenzhong.duan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's allocating an array of a6xx_gpu_state_obj structure rathor than
its pointers.

This patch fix it.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b12f5b4..e9ede19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	int i;
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
-		sizeof(a6xx_state->indexed_regs));
+		sizeof(*a6xx_state->indexed_regs));
 	if (!a6xx_state->indexed_regs)
 		return;
 
-- 
1.8.3.1

