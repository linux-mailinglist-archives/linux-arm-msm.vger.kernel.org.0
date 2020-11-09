Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8EC2AC284
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 18:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbgKIRgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 12:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731756AbgKIRgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 12:36:03 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13EFCC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 09:36:03 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id i19so13453814ejx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 09:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JIvQBr7O5WeG1riAmknLOUpw/3YS8A77of4sXgFTgmE=;
        b=Q/5EHT7KAZ6kEaKVGpvmN6+0dqwQ8GcJ3fEJ8b4fAMLdnWAVykMxIiv2nwNwIk4ZIE
         h83UPx4WgJGV6/5Ci9sFcXVvg2aDi5bvULe8xuS5OQMPNKjH7/EwlArQlqIV/Kx4JqRb
         Rdt7DGgjr9+/c/nno2SN1P0cZ+JSvRuzdUOfn3fQ7ndjAYq7IBEnD5yxpEbPBvftd9St
         EX2copPgO1SietMK2eaehdn+XWOMkMRdrKQLmT2ckbnnJvfUyECSbzDOzw94q4GYk+Xw
         s8K4DVO2Ydnmm1vAFst43LujSHoo7ZP4DVHa4i/Vu+nnrN4EimMxFHZw4sohy4ijW9/o
         IesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JIvQBr7O5WeG1riAmknLOUpw/3YS8A77of4sXgFTgmE=;
        b=LceXSLzWg7Sg0JGlwxqcDdpJIlimATLfZZrkW4PgIlP+LPRTT10vqhhOcwXWy2vVj1
         +8bDBgSRA+etZREUbWMsn0xAJizIVYwzg9dfnOYmL23KiUo/5UHwwY1pctBTG2dbeZ6C
         Q+XU1PErti/7zQofi3Jby283efxF6muBet+Uf9Q/yNm8s4qkucs4bMvGOBXrgUZat+FH
         wQuaf301ivmeArkKqSYvskG2ysdJBf0c0ANfODszZtw3DpUBwFmSqGaIPJ54crqHGTGx
         qFQmnO7C34u3UdSCyIwYyE3ZiyWyEj5xdVeXm9xpbDv/c56rfdRNPh56OEsptmVl8WgU
         CEjw==
X-Gm-Message-State: AOAM532G86axDxuS/xcwIgBAMgi/T2hW+JSRef3hfEZ8NoSsnfPYSc3X
        n2+Tkr2Ht5AGZjLvg5BIM7oKSw==
X-Google-Smtp-Source: ABdhPJxnWTaB3pO+sX/0RfT1E5OWwt55PoP9fDmPHyx0IXEvPIt41xAC+8UM6cWbLh75eYyQJ5S2Yw==
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr15791243ejb.517.1604943361656;
        Mon, 09 Nov 2020 09:36:01 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id jw7sm9123981ejb.54.2020.11.09.09.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:36:00 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] MFC private ctrls to std ctrls
Date:   Mon,  9 Nov 2020 19:35:37 +0200
Message-Id: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Those four patches makes two V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY
and V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE private MFC controls
standard v4l2 controls, and use them in Venus driver.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (4):
  v4l2-ctrl: Make display delay and display enable std controls
  venus: vdec: Add support for display delay and delay enable controls
  s5p-mfc: Use display delay and display enable std controls
  docs: Deprecate mfc display delay controls

 .../media/v4l/ext-ctrls-codec.rst             | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 10 +++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    | 16 +++++++++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 16 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
 include/uapi/linux/v4l2-controls.h            |  2 ++
 7 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.17.1

