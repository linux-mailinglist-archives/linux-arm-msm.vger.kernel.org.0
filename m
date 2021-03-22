Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFDB344074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 13:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhCVMGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 08:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhCVMGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 08:06:21 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8269C061574;
        Mon, 22 Mar 2021 05:06:20 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id i9so10167373qka.2;
        Mon, 22 Mar 2021 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBJ4mk8tWYLUMjPIwRJW0iTCZ8TzYegwS1Rmxpud8ns=;
        b=fneby5oySa+iQmMjwqvA/8Zy9ZdeQ95LMmiY9BaZXP+rHq+ZK2whvceaK3VdZspvpZ
         p5L6NwemEzA9YnhA6Y52/Po8XM8PzIoUvlahUeqdTMvZk2olmFrbjKflx++dgyP1j2Jn
         S4NwW5eO2JTkGGttDQ9+wvg5INZDLWGWHUkWasQfuKSEy19Tu3QqAvlNcb45pG2XhYo5
         9RZVHoAfHTeDy4Fm+5+IVFDA5e6Z+R7las8y6t6IE2EXZGMz+NWFIPclRqaDZZnSjVZb
         579RDTKS0sFOpf2RUFtf60Cyq5uQUuYCUPAy1RlIXMv5bmQ60tpqA9Vr149Y4n5YQrDd
         YWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBJ4mk8tWYLUMjPIwRJW0iTCZ8TzYegwS1Rmxpud8ns=;
        b=fznEblUpcTiJIzBHwMKKcyvCkGAp6c568Wbr4OgCfHioh7dMq/77wKN5h11yxUqtWo
         2Dc/cFxctIiLIW2oyHAwwHX4NAWhTXOpCYgxq1b3AQHMc/2KarmF15ZaeGCblUgreVZj
         ZlIDfgfRtBUEuTwkNQcn8nf3sAiPsvV8jUN1cEzwgXINv0yUSR+w9sbJi/0YKyH5YpvT
         vNrTzDbKvYD+x39OdP8XZe9OaaW5HQxHOFYZPW634VLElCYVUHnmsQPmUl0bkr83rYXE
         lsRLzRM01JIi2BBbbfA40W8j4SW/8kaUOs9dNbHrAeYtgk3BjnVNieiQE4Zkd+zfZI3d
         9pYA==
X-Gm-Message-State: AOAM53373k4p8qChXudweLQ29FwgJZ5viYcosmZKJgDIJjrgsRN9cDHu
        1l84HuNCAz+7hqjIlFHOn2o=
X-Google-Smtp-Source: ABdhPJwhR3Rxo+499Fg5WOTkk0H6k+NnyfKQY5fnQs+6kyOvMH1K1ZTw9vhEl5ZylwjFkA+h6BGXDg==
X-Received: by 2002:a37:a211:: with SMTP id l17mr10673818qke.195.1616414780127;
        Mon, 22 Mar 2021 05:06:20 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
        by smtp.gmail.com with ESMTPSA id n140sm10677702qka.124.2021.03.22.05.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 05:06:19 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, viresh.kumar@linaro.org, dsterba@suse.com,
        eric@anholt.net, rnayak@codeaurora.org, unixbhaskar@gmail.com,
        huawei@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] drm/msm/dpu: Fix a typo
Date:   Mon, 22 Mar 2021 17:36:01 +0530
Message-Id: <20210322120601.2086438-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


s/poiner/pointer/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..a448eb039334 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -258,7 +258,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder);

 /**
  * dpu_kms_get_clk_rate() - get the clock rate
- * @dpu_kms:  poiner to dpu_kms structure
+ * @dpu_kms:  pointer to dpu_kms structure
  * @clock_name: clock name to get the rate
  *
  * Return: current clock rate
--
2.31.0

