Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021C42FCE92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 12:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbhATKbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 05:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbhATJ1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 04:27:14 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999F5C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:29 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id b2so24890975edm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=preh9tSrWByzX0iC59qqOe0jVy4Db/7g+720/5yLWEs=;
        b=GQJQmjZk7RrinGH7kkq8WQ3evkskWMdrS0y9QNQgiGO1TTaoDzm0LfHzVCWvL64rBO
         NAY8nSnfB7+NtM6IE565C17hW6fkyVkd/benZ1MfXuw8uklX/7JmGFm1QivIWXxJz022
         DBK4EcuktTNqoFcvFQxSH+fHAnsBvp6PODr2XKD1GS1ebSYIDyOS3pm+oek27k6msTUD
         sPYkMFG8p5gx5LUPJIJKNY8RT7JUyQSGcxfFCRu9FwfGgR0FA6wvVTs2NYcN59LeMF+U
         JE9YdPRKie3iP2wutHHj7O6D1ge6FX4H3ftStYN4kot2UIEsyOJ4niKRFRXcekfWYUdK
         ffnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=preh9tSrWByzX0iC59qqOe0jVy4Db/7g+720/5yLWEs=;
        b=TXdfVuFbm3MwLeVyU9r56HnIQT+9CYwuKwJGPeDMaEI0vO8jq7GRFWc91W3Dr/DuF7
         xDUSBdD4fLpsmvn/GS1w9tJ8ek0cWxsU35+dG4XlBqial5jnUGTSEclMTW6Jvql3l1oy
         Jg4NkrdoxVcXt3tzRIwBvhxt2hK1UFPHezsirn/Ka2+02n7OVtnz1/tpIIqR+REMugcu
         MmWtvVBaGViwTinPvWem2qC1b/3eHMD9ccIqfITnDrH/HPW/0iv/7CJuCDte3dn3no/G
         GKY0pJkWxiVc8PyBlUQ+5NkCx54XrNyKR0zzRXcnT9JHonba4ZZxf6HySJrzdd2YWiNT
         0kMw==
X-Gm-Message-State: AOAM533hyxHw2IcE57E05tbtzTWzvezb1uQHByVLmWiri4KdGlhVXdOS
        MCgHEsztPfFlQVQsLCYZaNMvUg==
X-Google-Smtp-Source: ABdhPJyD3+EuraqXHezsvz2uM2/JjU3biqgYrOxDEMzB02/Br0lqpxzmdI+iyLBLGrFZXU5lLMAvDw==
X-Received: by 2002:aa7:d288:: with SMTP id w8mr6596197edq.241.1611134788373;
        Wed, 20 Jan 2021 01:26:28 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:27 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 0/5] HDR10 static metadata
Date:   Wed, 20 Jan 2021 11:26:01 +0200
Message-Id: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Changes in v4:
 * reorder and split patches (Hans)
 * fixed typos in documentation patches (Hans)

v3 can be found at [1].
 
regards,
Stan

[1] https://patchwork.linuxtv.org/project/linux-media/cover/20201208145931.6187-1-stanimir.varbanov@linaro.org/

Stanimir Varbanov (5):
  v4l: Add new Colorimetry Class
  docs: Document colorimetry class
  v4l: Add HDR10 static metadata controls
  docs: Document CLL and Mastering display colorimetry controls
  venus: venc: Add support for CLL and Mastering display controls

 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 90 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +
 .../media/videodev2.h.rst.exceptions          |  2 +
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 ++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 +++++
 drivers/media/platform/qcom/venus/venc.c      | 29 ++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 72 +++++++++++++++
 include/media/v4l2-ctrls.h                    |  4 +
 include/uapi/linux/v4l2-controls.h            | 35 ++++++++
 include/uapi/linux/videodev2.h                |  3 +
 13 files changed, 285 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst

-- 
2.25.1

