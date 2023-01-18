Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B07A670F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjARBKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjARBKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:10:12 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477A83928F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:31 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qx13so21217657ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
        b=c4+IadVG1v6vHRVEIM+x0TcO5mn4FPTbnM6tL/hFLXlB4bn5l9Jbt7wPGmnFo3/XKz
         p+QXOHjMYZJTJkJ/GcMtBujS33aBr91rP6k8IMjckb/EheH5FEhZQumwetPqeuca5YWT
         Ci+r1VlRqYvw+E13V+qulLZ62H7kYrbSy8yQbF92bg+np1w/p6mz+Qizp4pJ7Q10c26K
         FdenHZCzjdjK4OLvYw4pzb49HerHMNoLRfZm9fMkt4HhRWoggSyABRGy9CwHgQWvEWZs
         CPu+tzZiHf+bahsjOXrmt4eqzvv0hd2iRdJTlA3UrFD9uO9sg2Gl5W/wNlTQWTCFhpPZ
         8TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
        b=rk3I/1/zyZV0SXtPOcDhb4CefwUH1g9H72aB5/1mynvoyg6lb6BtD+/27jzds+c3ZS
         Xcy/CcE+EhuN9uctddRu6bDELYP/E5DVdQiK+SaUOK/w1FQF+2GYKkBa3gP3AqZcqktr
         J9EH07QOqDQ27Bhca2QQTBFFSvUNR66Vjgi5N1KvEnmlW0t3WudKmy3+dwvF3djUBGv8
         b6O/8ZLb574SmPJE/fdt9z+6uPY1lGsLxGe9JNsU1FtOWONazdFKhWqAKDPoAE+usb56
         6W9tITvxDJRESY+EtNZ671k8xRPgKHLizPYPYuHpzkmW+vHy1sHM3i7eOnwAx0MyAe5c
         Z+QQ==
X-Gm-Message-State: AFqh2kqiDMgPNjsdme/UhKjBal7Ypod/5idzhs9na9do+B8DQje2oGf+
        PN/zv9eBLhsYriqKxTg9Hr3lnA==
X-Google-Smtp-Source: AMrXdXsbrX4whZyE4W/TN4wre7PGGEwiXJsJa0DevP/1mPPa3o9ayYPR8cCbC9sb6CWX7aeHGhqkew==
X-Received: by 2002:a17:906:e24a:b0:86e:ec10:ed15 with SMTP id gq10-20020a170906e24a00b0086eec10ed15mr4124318ejb.41.1674003869883;
        Tue, 17 Jan 2023 17:04:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 17:04:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/mdss: rework UBWC setup
Date:   Wed, 18 Jan 2023 03:04:25 +0200
Message-Id: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 92bab9142456 ("drm/msm: less magic numbers in
msm_mdss_enable") reworked the static UBWC setup to replace magic
numbers with calulating written values from the SoC/device parameters.
This simplified adding new platforms.
However I did not estimate that the values would still be cryptic and
would be C&P-sted instead of being determined from the vendor DT. Some
of the platform (sc8180x) completely missed this setup step.

This series attempts to rework the static UBWC setup to be both
manageable and hopefully easier to write.

Changes since RFC:
- Merged sm6115 fixup patch into the main patch, since only the comment
  was incorrect
- Moved reading HW revision and UBWC decoder version to the error case
  only

Dmitry Baryshkov (3):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 198 ++++++++++++++++++++-------------
 1 file changed, 120 insertions(+), 78 deletions(-)

-- 
2.39.0

