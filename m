Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C47E2260D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgGTNYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728261AbgGTNYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:24 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3E5C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:24:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so20197274ljm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b2rYd9nm3SPkJnxD1ULMt+9UUxBnRy5tHP+SV4VkRQo=;
        b=eNLxZATCSdcSJ52R9lxPtdWl3+8VydtB0TO4J8z7BDb8HN92Pe6AaHHdp0c1Y5KFnD
         e1OayGHlgNk3Wtps9EiuilM0+OQTpGTkNosnVoeW15aTGu5D6+oNsWWtNtxBceo7A/E9
         1ey+E6yhxnN/dRVA7YuPQhHIpv3haqeN7RDwHU4dEjLMWS6tJGBAPK1NNOXhikY4aRrW
         TTiIVqOppHt6CI3SRJGbMgEWegQAW2COI3Z3I1p8uraJLc8U/+HDLUS1sRmQxHnFL2rs
         x3fo3RwaOZorYwx0685XNtaZbGPsc7sGjOAUnzIaNb6uWW4I7Hq+D/FOgnZAkjgPfk4+
         hSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b2rYd9nm3SPkJnxD1ULMt+9UUxBnRy5tHP+SV4VkRQo=;
        b=FfEGZsHtKg5ZAFWR3yLZoU/w834CDQYBs2t2Qh4tItut0pr0jaZWKyF7WZVE4uws5c
         HBaNuNw3ztI8q4dDcEettnTb8TbXGzbTTHFf4l4RZtDvRR8YZaxRdYslUbuf08drHv+G
         5EPjbfHHYKTULfuoP7sYG6rmVRm62cCCPzReSO8kAwYlWTR6Kr+IwAsVKIwi3kfiFI3L
         I6bGrJ4XKweNMsIRLwpVeP5Kjwn65+5CakcQCnG5K/1LwA9mluCqPZMYrNrkbsDFTQYJ
         WIZer759Q2nBDzKFc7eW2mMmCayZCFlycA49aDcBX/1I4vBzu8QLR8KJQFuid6VpcJnq
         FRlw==
X-Gm-Message-State: AOAM530qhSWEMBAU90nmVy9L4FUfriQkR68bXUzekAZnljJXrsjtMTF0
        aybrHpFVTQCoC/X5eRUd1euuzA==
X-Google-Smtp-Source: ABdhPJxMqrHax1WTDgzjv84txngVdp7CoHtlWOOyUEWGxNRqf1zfy74uyA46AN2CgXS0aND0busIfg==
X-Received: by 2002:a2e:7601:: with SMTP id r1mr11283577ljc.111.1595251462129;
        Mon, 20 Jul 2020 06:24:22 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 6/6] media: docs: Deprecate mfc frame skip control
Date:   Mon, 20 Jul 2020 16:23:13 +0300
Message-Id: <20200720132313.4810-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Deprecate mfc private frame skip mode control for new
clients and use the standard one instead.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 3e6b5d61500b..30899d84f178 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2816,6 +2816,11 @@ MFC 5.1 Control IDs
 ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
     (enum)
 
+    .. note::
+
+       This control is deprecated. Use the standard
+       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` control instead.
+
 enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     Indicates in what conditions the encoder should skip frames. If
     encoding a frame would cause the encoded stream to be larger then a
-- 
2.17.1

