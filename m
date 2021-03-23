Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047AC345FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 14:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhCWNgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 09:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhCWNff (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 09:35:35 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3A3C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id e14so8920064ejz.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjagxyS+LYabIumqt5awpwriDBPHPu/LFN1q/dlMqM=;
        b=TqGjivAJb7F0P/srjBeMCJaPta0vld25XGxynx8tT96VQcBkepFegU4+lpcjSuBBGA
         AHeIEEOwypx68YJCIlNTKKzCZmsE2monoECPNz5j0xVOdfzEfcKPG2ZNgdf84WiggpF5
         l3li2arOaAAIj7SUAwr7p9IoSiQV+/vGkcot4rg7YqnKN5+eqgBZ7X3yeKnWfI4n8bQd
         4Tczl/rQkSNdC3dmzvT4PxL5yBJ4II2KjJ4TtpnpOiFsHWGLeLuvaqYLp3Paya7WxGjj
         lnjC+RHdcCIMVE9XMeS6vC8UyBOKp6qJiK5izzF5XdX2Mp/cprluWZHSjlmjxiaeIZjT
         cQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjagxyS+LYabIumqt5awpwriDBPHPu/LFN1q/dlMqM=;
        b=g07nyZMxdmpzW9P/3gJuVaPbbJG0h7eKDx/CFI0hgLqHTrGlKcDLbasBssm8uEhr74
         POERV4xTZJ3VhOjORFF6nirjXq5xOdCk4oB0FBztYo9JnV/fpE2sFOAwnxIQcMl3kZB9
         +uMm44rtgk9Gl6Y5Mfdo2Wg2RV+BpF9pIj3kGqN8mxuq4lTy0VVCS6hV5UaV6aLbc7PB
         xwyx/HQvz+cpGgl/XW9dUJdZ1hJQG/Dg1yD/GWYsz4U10qCOFMgND/wjRYrIK13vqM5t
         lTxQR5nQeJhs4mIudbUhEx2ay+V6vZDMbPa+Klcbgm9r1jnNgMFc5ncvNQWCnH8VSS4O
         WrQA==
X-Gm-Message-State: AOAM5311vkAXi8K7U/wBri7vWEeiEEx4kwG09ILgmaVDAe8JKGT0MLqs
        chBGSBCA8gVVD2L5+lKrp7aLCQ==
X-Google-Smtp-Source: ABdhPJwUJqV6+cN+QRopOAqXtcnPEV0jSss4iauXIjAOmCxfRNpfW/HmkPPkwO01/Xtjo0ifs7vI/w==
X-Received: by 2002:a17:906:e0d6:: with SMTP id gl22mr4925865ejb.444.1616506533482;
        Tue, 23 Mar 2021 06:35:33 -0700 (PDT)
Received: from localhost.localdomain (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.gmail.com with ESMTPSA id m7sm12627104edp.81.2021.03.23.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:35:33 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Add decoder conceal color ctrl
Date:   Tue, 23 Mar 2021 15:35:18 +0200
Message-Id: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v2:

 * addressed Hans's comments 1/2 in documentation.

regards,
Stan

Stanimir Varbanov (2):
  v4l2-ctrl: Add decoder conceal color control
  venus: vdec: Add support for conceal control

 .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 18 ++++++++--
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++++
 drivers/media/platform/qcom/venus/vdec.c      | 11 ++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  9 ++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 8 files changed, 88 insertions(+), 4 deletions(-)

-- 
2.25.1

