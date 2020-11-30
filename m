Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB682C809C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgK3JKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgK3JKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:10:13 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDD3C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:26 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw4so10172169ejb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=rc35Q1VlEBz4DZkEUhnETxh4yN2ILIjRb8LpyvVldHA=;
        b=zVmRhdZ9DAHfRencSfuk8bOn0/LL/W9E05KpXxESrjcZhAaaojgquk/wI0J+LgexGM
         nnzsuXir44wiShKdAYzSHHXKvb5uLftkj0YD1KLJqVZKNSjxi16DE1PCoSVgxESz1tSd
         N3pk5k7qKkm08QCBZXbjsJ8zaYbo6A9puwM2siZTO4Uvd2R3FE4qS9O72lx63rJGs9Ql
         GI43lbfVQp2yn0ut3wbeCAzVa2+5vs5mgefmFAEy0jX6hMpmSdsHb6FQNl56+043ayb+
         0IfbYEIHEmbhl5wJOMfi8T8x+GSp89AQtw1VZ7hyQR/fJGuNyYkq3kTjvbJralPhqAds
         FrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rc35Q1VlEBz4DZkEUhnETxh4yN2ILIjRb8LpyvVldHA=;
        b=tmMy526XRR0nUIOFiUKblXw3qhjxnO2tALX+zIntx0cG0iAwizyCK8ikOspJIbKJ9p
         8/Cn4fq1OtkiR3aCm8CEhbaXM8VC3asMo5YU8U+BuhoQCs8cZIoRcsOAdqwNFFDCbmwH
         YXQ9KTWCBr7ZmWOxmqEIoVyKfYpLjM0ZKKd8yS2ClEam6McS+H/hsru2xv7zHpDjInmj
         vyw6eEpqYu+F8+55f/eSANk3O49E5A5qIZezPcE2YfKwg+5te7TI1ODqR+AqyxvdVeLA
         P8uCz8NGr+k47LoYJRRl84UZlDTXMX++nHljcJ4Ru46aHxjDJkAw+rypNjTs+jVVAE5h
         tJew==
X-Gm-Message-State: AOAM5330jkGR+CyIBUQGUypvAmhSjZ98X1oyf0T2/SrCBZthHKZIpkS6
        52KI8Qu7qojUD7VzZKatasy5Pg==
X-Google-Smtp-Source: ABdhPJwh7uqsomhMMnphV+iHF1nwrU/n6KDNVu4tpc256pnwRQZF9gu3pvy/Z3LbR46acyepDo6xlQ==
X-Received: by 2002:a17:906:dbd8:: with SMTP id yc24mr9159869ejb.313.1606727365646;
        Mon, 30 Nov 2020 01:09:25 -0800 (PST)
Received: from localhost.localdomain (hst-221-92.medicom.bg. [84.238.221.92])
        by smtp.gmail.com with ESMTPSA id t19sm8239101eje.86.2020.11.30.01.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:09:24 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] Add random IR and AUD encoder controls
Date:   Mon, 30 Nov 2020 11:08:55 +0200
Message-Id: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Here we introduce two new v4l2 controls for encoders:
 * V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB
 * V4L2_CID_MPEG_VIDEO_AU_DELIMITER

The patchset also includes implementation in Venus driver.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (4):
  media: v4l2-ctrls: Add random intra-refresh control
  venus: venc: Add support for intra-refresh modes
  media: v4l2-ctrls: Add control for AUD generation
  venus: venc: Add support for AUD NALU control

 .../media/v4l/ext-ctrls-codec.rst             | 11 ++++++++
 drivers/media/platform/qcom/venus/core.h      |  3 +++
 drivers/media/platform/qcom/venus/venc.c      | 26 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  3 +++
 include/uapi/linux/v4l2-controls.h            |  2 ++
 6 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.17.1

