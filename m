Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41152AC257
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 18:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgKIRcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 12:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729814AbgKIRcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 12:32:16 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA54C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 09:32:16 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id o9so13469379ejg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3GbLYzMwvp6EZcDPr1mAsVCZayr8g+ANCOELRW9x3oI=;
        b=lD9EKUCy7oUECftLGz0pJuJXfWUST9vdn8zNy7aZ0sJ1i2+htwpMpx18p1su3Hvqa7
         KKWbeffmklr0iutDQZf5HVJhX6zpyJ2Jtfj+SlbscdNWWQBZETnFK6oabvbul+7HyWv3
         iqUV4WCq2d6jBbBPdL2h+n62FPZ795ybRj/Y/LQI7KY47A9dPPFcXf/xEWuafxfJUew2
         6z9mwI/ApECmiPKdiVDemmddiR07Flf/AF6B0urxkpX+RC0nobTwavyHBq3qIXOZ5yQW
         qxLrdxpOe3XjZFBWgbTmhLWEOUUcyTxcJutA/lpOyZDJmL2/sOzN1Wbmdx3JTEQncVs+
         IPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3GbLYzMwvp6EZcDPr1mAsVCZayr8g+ANCOELRW9x3oI=;
        b=V8Q1EXg0xbtESbMuNDU2gNJYIEB4lwMTX+UIMDxzhc1QMAG/1Z0ehcpOzigISZ8DsS
         QO6IajIG3d31w77jOtAtD1TyJsmlpaDvKxXfwUSnpv6dQrAQmKteUSxgRujdWAAdUrfo
         m+ndORDPjvHgOhZ+GfasBXUVyxjy3lmHs939KaqSJH/mtxJdBFBk/Gp6ANtHE0bxrpnM
         0vK6NWPWYPt1GP7wdeBigEAXXJ9J1HKzHQwmyQQ2X1XgeFKzcSiD0wCXJRSCCZVVv/jS
         oaFjRMsBO73rAo4qtV7/29p88bdjDOb93MQ5JuVTEV37oM74ac3xV+DhqMX9SUlXygAw
         fdtA==
X-Gm-Message-State: AOAM530CSHMEs0nyCuRDcKbMQ/+QQge2bV8Qjln20Arwrq8RVIfm/x7e
        GB0xkVaZE4I5jnUP7CElt0OwKCM7+nXQ2eYs
X-Google-Smtp-Source: ABdhPJxX5c+OTDNapq6/UahETFkImzuMZoJ3WkHepRM8Jo8FjtVUZvBKfvF6IxDMzUP2zR9aTpFDTQ==
X-Received: by 2002:a17:906:a149:: with SMTP id bu9mr15636458ejb.115.1604943133905;
        Mon, 09 Nov 2020 09:32:13 -0800 (PST)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id w18sm5037005edq.43.2020.11.09.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:32:12 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/3] HDR10 static metadata
Date:   Mon,  9 Nov 2020 19:31:50 +0200
Message-Id: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This patchset adds two HDR10 HEVC v4l2 controls for Content Light Level
and Mastering display colour volume plus implenmentation in Venus encoder
driver.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (3):
  v4l: Add HDR10 HEVC static metadata controls
  docs: media: Document CLL and Mastering display
  venus: venc: Add support for CLL and Mastering display controls

 .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  3 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
 drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 61 +++++++++++++++++++
 include/media/hevc-ctrls.h                    | 41 +++++++++++++
 include/media/v4l2-ctrls.h                    |  2 +
 9 files changed, 240 insertions(+), 1 deletion(-)

-- 
2.17.1

