Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC1031BF4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhBOQ3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbhBOQ1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:27:41 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618AAC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:00 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id t18so3364506qvn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sy2cabYL26t5+pf4Reor+XmaF0QOZcQ9kdQcHzxIJkE=;
        b=rM51qYuneyDfZEiwnJA8BYhAWb2HWAt7uFs4Ih/RhjhAPxepCK1JFC8ANdDU3//nnD
         VpQpBENm7Z/UEhT1WUg+0Sq8DbJH6v3iybXVWLtZzdDTWmzZlOap54Ny9Fm17TKGgQb7
         ltmmhN0XXvQ4RSkkyomqSwJncU23ZcEOn73tf8Cn5KYwGIzXEhQ8+YkarmWmVuPqvSd1
         K1uPs+i25o+lIS+oWDdJyTiLL/eOnE5a0/qSBFBvbOdXqAE36mIxm+EHGGV2XxnG6rhH
         49L8Zik26esxZnvmkzMO2bLbFTP94pWuJbglvNmsVHSBfKpe7I1U7UzcGftMW8U8xLz8
         unIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sy2cabYL26t5+pf4Reor+XmaF0QOZcQ9kdQcHzxIJkE=;
        b=Ld1e3BIozqo1cXBfHlQAhRzJIn6rHlmIxyvDrxwiMbMv14E0dGFsrvVTg1NrCZa04I
         tiV7y2kxYIYsHEYOogUxdz+J9A2LEkFnqimRfZWi0xD1EYq07W/dD3u52sbZk+vqHKm5
         jvaS26n6zT+JTPNdqNuWYmGfM1XmgQjtOcsFpaM6UBC3p5MPpuwRJR8sozQOYUxvQYPb
         zU+EPTITYPidK2tj6SlZfsk7265meWv7Qbt7nvLNmrPO2klh/oYacegD+Z6OI91Kj9Pv
         UOxhWlZ7EjgvCYsCh4f5zAPNtWylo0A9d1uGGO0bIvEycu98ZQgyQHY6w7+Bk93UtrSm
         bUBA==
X-Gm-Message-State: AOAM531ssmyB04NGPSUbRmmmLNChPDf52imp7w0/n193rpfxN/mRXeHW
        c50b+uijxkvN2s9kfBWyTQtp3fKtnFKEdw0AZFM=
X-Google-Smtp-Source: ABdhPJwKUtJ7w0KcYRqX4wI/BQbYP465HriDNC/qSfXD6NcK6gDI6rpzdYGClYqLvfF32GcI37Fl5w==
X-Received: by 2002:a0c:b617:: with SMTP id f23mr15209994qve.44.1613406419374;
        Mon, 15 Feb 2021 08:26:59 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id u7sm10928811qta.75.2021.02.15.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:26:58 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list),
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Tanmay Shah <tanmay@codeaurora.org>,
        tongtiangen <tongtiangen@huawei.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sm8250: fix display nodes
Date:   Mon, 15 Feb 2021 11:26:03 -0500
Message-Id: <20210215162607.21360-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

v2: do not remove mmcx-supply from dispcc node
v3: remove references to dp_phy (missed this in v2, sorry for the spam)

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 31 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 15 insertions(+), 28 deletions(-)

-- 
2.26.1

