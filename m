Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B677E3153C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhBIQZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 11:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhBIQZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 11:25:27 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECF6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:24:47 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b3so22701065wrj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 08:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9TLaDgatP2Xt+egeFYNr+TucPIqd2fc4Kcp37i6XeZU=;
        b=FD1tuZpn5SYSBKRk3kPF5/MnZlYbpREUTYB6CmvrYS0Ym1EliV4yWp6zuDT0NtdM5Y
         YZhtMr/577XlxPCUYFpAVdL7VWzTmgK8U5bDQF3mb2A0+6wIPW1L/nO0wgj6qjX1LfMp
         wp80W7qzQvL+dEGhWGma4JfSli/2NO+z0x3PDxtxhTKNpJ8mBsVrIovXqGM+zIqWoQPd
         3RIBQR/Y6Wfm/J3mrZCarPbkLVmJBCRbZwCHgcabJaJBAu5hft22GZzDf2uTpXZtD3um
         QDtZjTeXUauNKlWqOJkO6Yt10FRThJHRK//FxESmaRH2xdNiWqoodatcOccRwwiJIidF
         2f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9TLaDgatP2Xt+egeFYNr+TucPIqd2fc4Kcp37i6XeZU=;
        b=gydd3ZCpotzAd5IKVbPnVoyXeJ6Xfv6ncKvvjSILPSlJL80klCuXmNqUCkQ+rSPcCC
         9hjSa5RWttZYhentwtt6d8DO7/xOIJMhPsPCy1j9P2sfUxyL/zYCZ442TjvMxUUTbJE4
         8ZfXCY5duNqU2MgOPrCGEKI66dlz2xaD5fLkLK09G8icZq0GNPE6fijpRxsjCI9AiU+s
         C3fDbponbIzftBIJab3cHvBsIqhf9RLy9lE5eI7BvGg+cevnJV+1eXb3w/63pveHq1Hg
         Nj7WqESStcBKQ3kWLcTWLdPeRj0V1ZPJ1PP3aaxOrYVNptie126S11Sm0ZUw76IrHkKR
         nP0Q==
X-Gm-Message-State: AOAM532IoQW6Xh/GeDfm2WfMk90q0sph+Wum/OE4XaMZjYCS3OpW5SpQ
        epQYmsclYEGKI/3BH9jO/gN95Q==
X-Google-Smtp-Source: ABdhPJyxeaadeTUv+5Rwwh3zng/Xfb/iEXbKMQphunUGXsEyzUeJxyIHW1T+IOn4QcnZX7sv5VblwA==
X-Received: by 2002:a05:6000:1374:: with SMTP id q20mr25458524wrz.44.1612887886375;
        Tue, 09 Feb 2021 08:24:46 -0800 (PST)
Received: from localhost.localdomain (hst-221-125.medicom.bg. [84.238.221.125])
        by smtp.gmail.com with ESMTPSA id w8sm45210wrm.21.2021.02.09.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:24:45 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 0/5] HDR10 static metadata
Date:   Tue,  9 Feb 2021 18:24:20 +0200
Message-Id: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v4:
  * 1/5 - fixed a typo (Hans)
  * 2/5 - add some mode info about new colorimetry class (Hans)
  * 4/5 - correct cd/m2 -> cd/m\ :sup:`2`
        - change to US spelling for color word
        - use correct v4l2_ctrl_type in videodev2.h.rst.exceptions
        - documented p_hdr10_cll and p_hdr10_mastering in vidioc-g-ext-ctrls.rst

Comments are welcome!        

regards,
Stan
        
Stanimir Varbanov (5):
  v4l: Add new Colorimetry Class
  docs: Document colorimetry class
  v4l: Add HDR10 static metadata controls
  docs: Document CLL and Mastering display colorimetry controls
  venus: venc: Add support for CLL and Mastering display controls

 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 93 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          | 12 +++
 .../media/videodev2.h.rst.exceptions          |  2 +
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 ++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++
 drivers/media/platform/qcom/venus/venc.c      | 29 ++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 74 ++++++++++++++-
 include/media/v4l2-ctrls.h                    |  4 +
 include/uapi/linux/v4l2-controls.h            | 35 +++++++
 include/uapi/linux/videodev2.h                |  3 +
 13 files changed, 297 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst

-- 
2.25.1

