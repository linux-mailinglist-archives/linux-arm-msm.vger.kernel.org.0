Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514F6214C60
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2020 14:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgGEMMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jul 2020 08:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgGEMML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jul 2020 08:12:11 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA2AC08C5DE
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2020 05:12:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l12so39496976ejn.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2020 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7mX8hu/WWjnwnEyPTlU3MGnHpJuzqdu2Apw48vMC6z4=;
        b=FynBPSjDhveS96iN5Y0RalC1idg3UpwKXyEYfOeZzLo2ogVhqEy87dxLuAgtsox3SM
         0whLGGo62pu83HJdLhY3CrWldzxYFN460mOqGomto6LXz36fymnmJfA5Mufh+qQx9M/W
         ao69skQFA9ywZgRdnrpEF6yM9wnsf97mBvIohYf4H8h/2UmxfVy6d2dv+9Zl4T/ysM8E
         S4LCilQdYEyxH4J8KMn/ILcOUrCmy9HSb+B6nLw+zXb8sywWxFkWREcJul+F5CNwIMmW
         B7xIeo2WhAv5C0/kge5WGslynFQ1q32Ve9xBUaGvTvhJTtG61gKKXs1wvOeX+de/Shzy
         w+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7mX8hu/WWjnwnEyPTlU3MGnHpJuzqdu2Apw48vMC6z4=;
        b=ezBcToAqCXoMBSkITw2xLvv6VoHcpf93GnshFw7C8cuXNpicf9Hnu9+fgk5xpjR86B
         Dpes7TlDa3VBhhGy+AvUCSqHpXyNp4hpZ2fC/J1hfcwXwfsVrStinMh30IVvW5ZjfLTv
         p0ZNfXY6htaj1G+at9OHT8KzbIFsyartBUWQTszkr4l4CXsw9G1YOBJ+klFS6OacNGke
         aR/xiUgP8c2F8LamXKA5Pi4b/VxsvvGRo0+nBOlTjrnB01yTaJsoALuE8gJTnejKBxOa
         bEQ12Itj+s319fD5FjLHCJeb1ZHwJF91NzxMrzjW3pk98195xqIPhPt5s9OYcDM8/7T4
         al0w==
X-Gm-Message-State: AOAM530zLdxOcPyTb9oRI6Zwr+ScZhf7X6w1XxWz/Pz9cIIi5ElnLd9K
        p8t8fLNL6J6tKpfNfpH+y65sUA==
X-Google-Smtp-Source: ABdhPJxbbizoo6eyMSZAaCuAXhtp8LdMYWIATAGhR85b9Jl9t3L4F4IQXUwdy/72ySrxdyoGZO3coQ==
X-Received: by 2002:a17:906:5006:: with SMTP id s6mr38495933ejj.294.1593951129593;
        Sun, 05 Jul 2020 05:12:09 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-133.ip.btc-net.bg. [212.5.158.133])
        by smtp.gmail.com with ESMTPSA id j64sm1517458edd.61.2020.07.05.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:12:09 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/4] media: docs: Depricate mfc frame skip control
Date:   Sun,  5 Jul 2020 15:11:28 +0300
Message-Id: <20200705121128.5250-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Depricate mfc private frame skip mode control for new
clients and use the standard one instead.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index a8b4c0b40747..c0760bfc54d4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2805,6 +2805,11 @@ MFC 5.1 Control IDs
 ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
     (enum)
 
+    .. note::
+
+       This control is depricated. Use the standard one
+       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` instead.
+
 enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     Indicates in what conditions the encoder should skip frames. If
     encoding a frame would cause the encoded stream to be larger then a
-- 
2.17.1

