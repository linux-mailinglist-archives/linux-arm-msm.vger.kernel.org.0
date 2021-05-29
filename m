Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BB739497E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhE2A0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhE2A0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CABCC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:17 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e2so7365891ljk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
        b=uGbtAPxEvoyvx74MWS2o9kIhLaCxR9NZQ6OmOv9oc9hu1TLxHNNAPYn3gzlIIJmx3h
         XQgbiB6FlZeDbiJJbKaKLSedqzztcCnXFEcc95yl3p1abMg+6eJOXmw/L6h4R+IV9o6C
         XQesOeUmZMXHiEWXCfniwHipBZ8c/7VZhLxfplhdeg+Gi+VCzAEeSV70U2Whz/KT/gff
         aP+9LDkHVzzE7Ssm6TA3El5AQEnaKCe0sgboENoAm609RhU7dziYGl8A8KtOC88joMS1
         7iUtAC0eLTUnqx0D7SRsf+FnZbjq25dNJ4X4UWLyV/5j5iaNw7aaITt6uCukQEazBtei
         OTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
        b=oN2VLN1vnjsHXlNYQ1FeyVo8wrCcKdUlNnl+3TnxorSfJF2SULZNdD50ZU00pIq7pS
         dOlBcQVtE5TqgURLBHo1z5SDStbyG8/e/uNfZNCqBG3x+2JB46pyGIF6DW0AsBHz/0ER
         EdPdXVBAeGCJ3eWWWuFh3ZhSrJWeJqKzX5J/hiM4YzonY8Rf2a9V8s17At8cyTuy0Ax9
         aan1XkAZUzRPOvaoz8/51DkarknwZngmYx/bRh2Z3ZY++F4+49jrXoh7kwxfvkKFbsxY
         5mp8fuB6YAzkcWRzZdE5xdZcmvYiO5DDPG2grlJd0TcR5UdPK9IUiWPLXcIpGgOrpk0F
         JmmA==
X-Gm-Message-State: AOAM5309DHxszXmvT7PWoVghjK05TLw6bucN/6c+B2/s+IG3WGQ8jT2m
        481aH9JU7eP4Alvb7ry2Lym2ZQ==
X-Google-Smtp-Source: ABdhPJwjvewfZRMsnIYRlASELtzoZFUlolzG/MKKgogWsG4jMl6ZWBKnxfp4ESok53GK3bD6sdVxMA==
X-Received: by 2002:a2e:7a17:: with SMTP id v23mr8274083ljc.99.1622247915928;
        Fri, 28 May 2021 17:25:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 0/8] drm/msm: split DSI PHY to generic PHY subsystem
Date:   Sat, 29 May 2021 03:25:00 +0300
Message-Id: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchseries is an RFC for splitting Qualcomm DSI PHY from drm/msm
driver to generic PHY subsystem.

Dependencies:
 - msm_disp_snapshot fix at https://lore.kernel.org/linux-arm-msm/20210527220330.3364716-1-dmitry.baryshkov@linaro.org/
 - Patches 1-7 from https://lore.kernel.org/linux-arm-msm/20210515131217.1540412-1-dmitry.baryshkov@linaro.org/

PATCH 8 from this series is quite big, it might be split further if
required.


