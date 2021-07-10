Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DFD3C3708
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 00:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhGJWW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 18:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhGJWW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 18:22:56 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8A2C0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q4so15191319ljp.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
        b=cOc6Ro8+IZ9NK2jzMEfXuL0RvCQr+YtBZrXCJRrlOd8yeuhqAvDjMeBZmNtIUL94FS
         ZHgu3E93HjkeB2ixitQxYNOm4WskyFPX6cb0FnYAmuqW0AaVwvHhUcwTatbD4I87GYq2
         8S4StzXwPNPqxF+pKYnZayK2zkr49ydEeABBtw6kGYH795lK5o6bdNIVpbYdLXmVM5cm
         ZrXjEDF0wu0gwK+8JJfigTWbLY4MBtJvZ/wc6JqBB3tD+oE7nCmJmzijk6geLZf4QoRk
         0g/oCL9G04b6LQCz81yuO6QcJCkcvFhGiAVHEKqSebVKO0HElq1SdmAPJAI3RXrz0G3a
         lksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
        b=ht3EfANPIMPT/UjPf6Fs0jK72iHY8zOPxz15o/Fkl467Ws9Da5OeYT4qgqM6xSIS0q
         SF6Ru2J9r2yg+KkYONIu/DJa6e+YjCuMbCzNOLgYi+GTlgpPObE2DbmFs2BBYdmBVj2W
         i4hiY4caIOANEi8lDuVAVBTydq6RPdLMOvaGrEDrnuH0ccerodu73cetFp4ker3UTAXG
         JH2bYwKXpFlAxbTpeMG86xCJ1wBEJvsewuXPdbMs2moQv15JmOqgolcFsCw0Wi/DJ2Ad
         /2xD8iS5LNJvNjnEFPXdAo5FAy9aWO3hoRyJZF9QyOcda5ejOxTDrmq9PzRU4oX04VgT
         n6Rw==
X-Gm-Message-State: AOAM531lhGu32qb9YqcS7h7m5/tvDcjBQrtZSufDR30RCWeOQe/R09VU
        GYks+CRoOr3tTnS45yXauS3+sQ==
X-Google-Smtp-Source: ABdhPJxkyQKAg3ovIJyXsN8xCqX0lw2DojpWbEvMFfSg4GrCOLycySMYHMREuR7o5+RP0Mtrovqy5Q==
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr18914747ljn.14.1625955608208;
        Sat, 10 Jul 2021 15:20:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:20:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/msm/dpu: add support for independent DSI config
Date:   Sun, 11 Jul 2021 01:19:58 +0300
Message-Id: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Changes since v2:
 - Removed Reviewed-By tags from changed patches (1, 2)
 - Changed more dual DSI mentions in the patch 1
 - Added msm_dsi_is_master_dsi() helper
 - Rewrote dsi encoder setup function again basing on review by Abhinav

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage


