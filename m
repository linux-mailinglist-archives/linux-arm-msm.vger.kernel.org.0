Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08FA31E1D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 23:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhBQWMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 17:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhBQWMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 17:12:51 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC9BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:12:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id w36so406039lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 14:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WuwKDyyuRXWc7fqRJdkJjYCH0T2gnlyQjQvkLbody1M=;
        b=BXdFct9Ium+6cfGRin5RAJLPxE6vTrSXIzaqUdNu4F8+vJeuRchkghvrcNPVao3Oig
         ftGbZG6MALSjuYrcOVZ+VJ3+A8eK/HfpccCkq4JlrH9ovu2zGgiAC6VuH78NphxJRqnu
         82gkfIo2G/Q5Qd2OQ+bERMoYxVEuHhxHzHq0aG0K+s1hAXIHbeVedecCdiOAYHVkjGE9
         qSld7/vkHgEoFjrSvTslJLf3WWie7wpf41ul9eT/6lMKrmX1j4IvMh8+rdrJl4ZS5zAW
         lqzmIZm0oJ99ZlOeXi5CMCkpCPdBIbjQXtCr65wcs99ATPwbSY8hNGOrlbbG3t+lsfq5
         fAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WuwKDyyuRXWc7fqRJdkJjYCH0T2gnlyQjQvkLbody1M=;
        b=lkMrcWxFBsRnqZpJIYdaCqBJM3niri5NpSqfaHMi1pycdTlPmUha7FXN1JlfuBa3S7
         NLJiuzQzeTAK1ZW+keqcFysLwyVQBkOE33NkikPFzyCAW0UzD4RVxgaHN/lyNIFTMGPJ
         el6poUE7Yzp5tcrloit1QWbksXjzHEjkznOVA4Lg1XQAikP6H0cMQPXm9bH167TxsSW/
         L3rdXydFMuSiJy/O/6omF0fcPfih27fMV7rbw3qA44r9JsX93ga5yRK6PHawPk3z7pml
         erE8/UPRTdrzM4dbqgo0WZN9yYRGcmEOmelR+X/JgZCkEnJJ0B3NrtvvYIvEirvaFsIy
         /QZQ==
X-Gm-Message-State: AOAM533nlNZG3U8bh06VvY9gC7IfHWOJQpeoWIduXJwDnlQQKxLiO2Qm
        TwaFSniNVIF5DGHKePnU5JeyoQ==
X-Google-Smtp-Source: ABdhPJyiUQn1DgtgP8VhBGVPISpebORJN8GUzrDnNDS977xRgDas6/AiLbG1cUIdYEeeAROfCsMX/w==
X-Received: by 2002:a05:6512:3cc:: with SMTP id w12mr559442lfp.650.1613599928830;
        Wed, 17 Feb 2021 14:12:08 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id b7sm382926ljk.52.2021.02.17.14.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:12:07 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: qcom: camss: V4L2_CID_PIXEL_RATE/LINK_FREQ fixes
Date:   Thu, 18 Feb 2021 01:11:31 +0300
Message-Id: <20210217221134.2606-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch adds printing a warning in v4l2_get_link_freq() if
V4L2_CID_LINK_FREQ isn't implemented (this is a mandatory control for
CSI-2 transmitter drivers [1], but many sensor drivers don't have it
currently).

The second patch is the start of the work discussed in the "[RFC] Repurpose
V4L2_CID_PIXEL_RATE for the sampling rate in the pixel array" thread [2].
I plan to send a few other similar patches for other CSI receiver drivers,
and if the current patchset needs to wait for those before it can be merged,
that's fine for me.

The reason I decided to post the camss patch first is the patch [3] by
Vladimir Lypak. The third patch in this series is the Vladimir's patch
rebased onto the changes done by the second patch. By replacing getting
the pixel clock with v4l2_get_link_freq() the second patch also fixes the
integer overflow which Vladimir's patch addresses. So the third patch
only needs to fix drivers/media/platform/qcom/camss/camss-vfe.c which
the second patch doesn't touch.

The resulting patchset is free from the "undefined reference to `__udivdi3'"
issue [4] as the u64 value is only divided by a power of 2, which doesn't
need do_div().

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/csi2.html
[2] https://www.spinics.net/lists/linux-media/msg183183.html
[3] https://www.spinics.net/lists/linux-media/msg186875.html
[4] https://www.spinics.net/lists/linux-media/msg186918.html

Changes in v2:

* Added [PATCH 1/3] v4l: common: v4l2_get_link_freq: add printing a warning

* camss_get_link_freq() changed to take the actual number of lanes as the
  third arg vs the number of lanes multiplied by 2 in the first version

* Fixed checkpatch warnings and bad indentation


