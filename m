Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CA0314C17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 10:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhBIJtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 04:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhBIJrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 04:47:07 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBE0C0617A7
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 01:46:26 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j21so2834886wmj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 01:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtiOGrIIJ5Mm3MgDZJonQ2tOQT3ZSoFpEI0CN22UV14=;
        b=u5g39gXJIngfU1XExmEXBx8hqDny5vGFigabTUxsM0TPFIQA7FuqkLq0j7YwYUBp6f
         RskGlhaj1idVZ2wvXZ8yQTiP3S9PHjWg8ozxjUDFRsBgVrFd5AfAQmR7nnCt/DGONGs4
         PixCihIg+INClWp6UZmF0QmAgarFGkpMiuEJKNqSYrWxq1QSM8qh8xlnsItfRD5blKdO
         fG+QiD70qlCXlqR69gS+qAvpyV4uUPjl5p/+cqCeBSt67lGXPQ4ysvYYbnF6g86WPdSw
         oKS++DcM+hWzFUS1AICMoY0DQcI13BDLhDmVE1aviSr6fFaZNllS38oPY66PjFL6aBy0
         Xn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtiOGrIIJ5Mm3MgDZJonQ2tOQT3ZSoFpEI0CN22UV14=;
        b=T8ueS0Z+wLzhFBvE5DL8660Dm8Vsrfy4FaQ3AMe3cWMWbd397UOOqx6W87za2tqHdh
         XOCE2ZE7rkwY8BOiTWxQCgrytZtWCuCfWwGzelI9FJ6f99Fk01ygDO7K1Le2RrvmaBSM
         +TvE4QjP75bMCzWdXbLt5kUjXVWT+b1AVSJV/ZCpMZMle1djGM3NU9qpPeEpOp6YdJO7
         EOzNQRiWAjxrxs8+/9+BBTlLqZabcCNW8LJFyElCzl59lvvO//vKAqDfYmYV6nYrtgOi
         vO7EVYqVwsP19VMT31GhauaiaY9fY+NGY6LMe2FP9K0IagMLUPluEvoB6cju9frMjCSu
         RiXQ==
X-Gm-Message-State: AOAM532fI5qem1lgoE7Il81URJjt1Ai7s3Gg2OTvr/jKX/bgyC3rPXgG
        b7z/+Rm3ZAPd3crkQ1Cz6RBm2w==
X-Google-Smtp-Source: ABdhPJxXQSPqb96K9C+tjUdGhrW9PVpw7siPtQwZ7h3AN8rn+JLKNtGm276sUZjhB5XDOFTFY1HKPA==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr2554723wmh.38.1612863980176;
        Tue, 09 Feb 2021 01:46:20 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u14sm1509627wro.10.2021.02.09.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:46:19 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Add decoder conceal color ctrl
Date:   Tue,  9 Feb 2021 11:45:25 +0200
Message-Id: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

The first patch is adding a new control for conceal error color and the
second adds support for it in the Venus decoder driver.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (2):
  v4l2-ctrl: Add decoder conceal color control
  venus: vdec: Add support for conceal control

 .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 18 +++++++++++++++--
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++++++++
 drivers/media/platform/qcom/venus/vdec.c      | 11 +++++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  7 +++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 8 files changed, 74 insertions(+), 3 deletions(-)

-- 
2.25.1

