Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2631F2DF4A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 10:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgLTJdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 04:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgLTJdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 04:33:33 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38694C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 01:32:48 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id d17so9368873ejy.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 01:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jklOUP9ssYI5rCKfQqUWTyc0nST/IJQQMgqRWUIHnaY=;
        b=fPIzdur7KvtXX2fZntnE0EcI5FcOc4zAS+Z2K4tsC7H9yoEuX4kCK7RejvMUm10Tyf
         iC+G8D7sM4MSMNnstHIM88+vwiDXh7UbTvGILykhEdsMyNZyPOoljj3Yp65fzI3/Klln
         7Qk0yOi1Hr1tDvu2oB6VnNv1bDFPdnW0h3cLdZxuz+v+uRvDxCyEZm7cIEPsm2BQLpkz
         7uZ2uIEFh2eiofPhQ3eZI0QBf3btaRDWKsnBGeMs1kRVTr0P5sALqXK04/1yxTsEeO9B
         3TeMzPx4I86g+2OMjRBIq44NAnQxFKgFcoRckX66IoWA7WJCn3+pgUhSHwWSby28iqnP
         p++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jklOUP9ssYI5rCKfQqUWTyc0nST/IJQQMgqRWUIHnaY=;
        b=uW3693KPP1VVc4l05LWiWW/wvPFyTox3gQ9wGCC9f2pwg8VU2hLd9DFRZg6L+3Cf4V
         hI7zKJLNJRELnhOh3XPIWDp9geF6UCzzEeHYQ6NLTjZWn9P/e62MmI1Vdw4sXkfzmH6f
         Ai71aZFDD8lJrd1u0xYXq5kjKfKOSHqkOCfkaFgfGb+96IEKvAoppwwGzkmAtfkVcgW2
         PDnGeOMbaDDuQTtP8hiRWoU0Z7GQ6hZSv0yxWcX09LDYDtZnDFFW+y38dgqVLy2MSaKa
         V56WZcj30gM5v4jqUOk++bMfWZVaOldS4cCDepYrs2FIXv05T9YxGsnmQ3Z/qfc/++0J
         HBPw==
X-Gm-Message-State: AOAM532f39bIqkWAQJpZ3xzvZVQuTmGoXechtPUiD+6XsqpBgu9QiF0y
        f54eVC6m6m2fi9tyJMaoOzmXMB33zczCrs/i
X-Google-Smtp-Source: ABdhPJxQq5F0rTvT9tIkwiwbtVBwaCKhgp6mh+xz5rtq3xE/1jU7AJz53f1h9lWSIXUugJfBzss1qA==
X-Received: by 2002:a17:906:1a19:: with SMTP id i25mr11104489ejf.206.1608456766811;
        Sun, 20 Dec 2020 01:32:46 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:46 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/5] Venus dynamic resolution change fixes
Date:   Sun, 20 Dec 2020 11:31:25 +0200
Message-Id: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v1:
 * In 1/5
   - clear next_buf_last flag before session_continue in vdec_start_capture
   - on event, flush output buffers unconditiannly
 * Added two more patches from Alex (4/5) and Fritz (5/5)

v1 can be found at: https://www.spinics.net/lists/linux-media/msg177801.html 

regards,
Stan

Alexandre Courbot (1):
  media: venus: preserve DRC state across seeks

Fritz Koenig (1):
  venus: vdec: Handle DRC after drain

Stanimir Varbanov (3):
  venus: vdec: Fix non reliable setting of LAST flag
  venus: vdec: Make decoder return LAST flag for sufficient event
  venus: helpers: Lock outside of buffer queue helper

 drivers/media/platform/qcom/venus/core.h    |   6 +-
 drivers/media/platform/qcom/venus/helpers.c |  15 +--
 drivers/media/platform/qcom/venus/vdec.c    | 110 +++++++++++++-------
 drivers/media/platform/qcom/venus/venc.c    |  11 +-
 4 files changed, 93 insertions(+), 49 deletions(-)

-- 
2.17.1

