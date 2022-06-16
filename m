Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4277E54DC5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359454AbiFPH7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 03:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359354AbiFPH7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:59:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9F35D664
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p18so1036129lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
        b=R6yYKIz2gRn/9XFnfJ6HAeSMHE/8mqsxA9v30IH5IMAq0K++b1MK3dXPzv5/VpnALg
         GIn2vJuwHOhZ0glWMi1lbZyh2FuJEYLlt8u7x3w4WdP48EbLgDVqoNDjrLhozwPCPT2S
         YJKxE1Uh642O0+IJLViPp0Xdokds1+OgUrOBmOb+efaky50JigRWdsO+/EKZdB37PxD6
         3yxoNg60N8W3YGPML9iXHRWSEfvLnsmhGKytCT4u8tOENinT4Fv4p6Hiq3tFyKmjzu3k
         0fGxJqmUkYzb0XNvJyCqH0r+bJYLxsT/sNybTKOnjBVVUzlZe1cPR9oU9VxmcK1jxwb0
         r0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
        b=dqfkUIjaEc4P82prQ8qGaROMcsy80pdm9q/OczKx7jckCipMhbF51+PgbYfa1Be7l4
         IF/uOshiA8j2YUuPkTGyz0CfIjG181mML+4Q9RBfz4WHJv0kP+Hmi5TCTxsEX2ED4sVE
         4LFncRlPLuZIMi+2p7EYbVul/JBEs50VOwhp9OhKHRaDr55q6puryQAmyFfsmmLrAe4q
         Z4eyTEtuK7TBkQyhHtBau3TpKSSnkme1FZhZxuv5Rd+Axu4C3UpPUnGMBduPRS4LRaJM
         WUErouUkfvQB14BkS6Wybve/1xMPxT9S1dVu/mxPj9lao7XD0mx+jnq3mHKUnNWMBkjR
         BP1g==
X-Gm-Message-State: AJIora/g6X6/1g9l6DK/tb4YGPa1ZIF/NQjOikJHo8d5+HKfPXP8CQ91
        rW5REjvxn7M2+AZG1mjeh0RTqQ==
X-Google-Smtp-Source: AGRyM1t/tOw1DPACc+e68hWUohcZGC3Sd9M2XhBUf5GPvldHD1/RJ196vIyEJIWk0eUCMlIDzqTkPg==
X-Received: by 2002:a05:6512:73:b0:479:2674:f1b6 with SMTP id i19-20020a056512007300b004792674f1b6mr1910376lfo.134.1655366388609;
        Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/hdmi: move resource allocation to probe function
Date:   Thu, 16 Jun 2022 10:59:44 +0300
Message-Id: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Dmitry Baryshkov (3):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function

 drivers/gpu/drm/msm/hdmi/hdmi.c | 298 ++++++++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 134 insertions(+), 167 deletions(-)

-- 
2.35.1

