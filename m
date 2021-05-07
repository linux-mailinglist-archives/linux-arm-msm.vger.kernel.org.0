Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510F2376BA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 23:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEGV0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 17:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhEGV0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 17:26:07 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF9CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 14:25:07 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x188so8796940pfd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 14:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
        b=ReDI50O4p6XG7KYhP06LRbAWuvZbFoPiydm8iaQ0lbFendfkj5D12q3t4o8Tjq3+XQ
         45Sn3Xz3HB+4fOLjk25u0rJcdrmMMw3B5OOy77dyA72ufIy0vXm1BWyyIVy/kto58mO+
         9byAgPEYPR1V4rWSn2F3s39QJYpw6TrbM5SZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
        b=TRpe+ENT5u77dAFsyAEnEW0RaD+XjiP358GY8uqU8CKufYPjPbIZA3MabdNhtFQUiZ
         hOsUweTxOc4kG5SUsiVndlm/Emept+f894b+yCWOeHPgPlCmsG6DwAUmRCP3I5h3nWQs
         X2y/yZCTGlcM5CZUGxpn9uG4LyOJZ/MSkmLTy/kjH/MUP/qLoCWd5KRECapxRnHU3pgS
         epSrQ1dx3KxSXJ0dVguJaF6gpPmSaYyaykG69UAfSkZVm34ZCu4qZXKKURhEKQ9EB32K
         mOMigO4DCXTKDZXG7fUyrhanZnZjAzmCTtwF5GeDPWvsN20ghfvS4MEzRDoWQDYUmJX5
         hSbg==
X-Gm-Message-State: AOAM533g3kECnSzeWqbIEE7rxGLQj4WAwiNc3eJhBrb0FVq2AfXRxkS1
        B6kJ5gevCoH9Rzt+MF/QbrU6eg==
X-Google-Smtp-Source: ABdhPJxXqi4S16zzZRUDmrs4PpXoCn4oLa/reeq8qjeKTY4CE/QCv/tBLRMZb5MLVWo20hYp/3coDQ==
X-Received: by 2002:aa7:8e85:0:b029:28f:2620:957e with SMTP id a5-20020aa78e850000b029028f2620957emr12473932pfr.40.1620422707177;
        Fri, 07 May 2021 14:25:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
        by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:25:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 0/3] drm/msm/dp: Simplify aux code
Date:   Fri,  7 May 2021 14:25:02 -0700
Message-Id: <20210507212505.1224111-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a few patches that simplify the aux handling code and bubble up
timeouts and nacks to the upper DRM layers. The goal is to get DRM to
know that the other side isn't there or that there's been a timeout,
instead of saying that everything is fine and putting some error message
into the logs.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>

Stephen Boyd (3):
  drm/msm/dp: Simplify aux irq handling code
  drm/msm/dp: Shrink locking area of dp_aux_transfer()
  drm/msm/dp: Handle aux timeouts, nacks, defers

 drivers/gpu/drm/msm/dp/dp_aux.c     | 181 ++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
 drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 4 files changed, 80 insertions(+), 113 deletions(-)


base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
-- 
https://chromeos.dev

